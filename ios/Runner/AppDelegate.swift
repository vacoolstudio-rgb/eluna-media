import Flutter
import Photos
import UIKit

/// Receives files other apps hand over ("Open with Eluna Media" from Files,
/// Photos, Mail, Safari downloads…).
///
/// iOS delivers such a file as a URL, either in the launch options or through
/// `application(_:open:options:)` while the app is already alive. The file
/// itself lives outside our sandbox in a security-scoped location that can be
/// revoked at any moment, so it is copied into the app's cache — the same
/// directory the picker uses, which the queue already treats as purgeable —
/// before Dart ever hears about it.
///
/// This is the counterpart of the Android SEND/VIEW intent handling in
/// MainActivity.kt, and it speaks the identical method channel.
@main
@objc class AppDelegate: FlutterAppDelegate {
  private static let shareChannelName = "eluna/share_intake"

  private var shareChannel: FlutterMethodChannel?

  /// Files copied out before Dart signalled that it is listening (a cold start
  /// triggered by the file itself).
  private var pendingShared: [[String: String]] = []
  private var dartReady = false

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    if let controller = window?.rootViewController as? FlutterViewController {
      let channel = FlutterMethodChannel(
        name: AppDelegate.shareChannelName,
        binaryMessenger: controller.binaryMessenger
      )
      channel.setMethodCallHandler { [weak self] call, result in
        switch call.method {
        case "ready":
          // Dart installed its handler; flush anything that arrived first.
          self?.dartReady = true
          self?.flushPending()
          result(nil)
        case "openDownloads":
          // iOS has no browsable Downloads folder; the Dart side falls back to
          // the share sheet rather than offering a button that does nothing.
          result(false)
        case "freeSpace":
          // Room left for the output folder. Dart treats nil as "don't know"
          // and lets the conversion proceed, so a failure here is never fatal.
          result(AppDelegate.freeBytes())
        case "deleteOriginals":
          guard
            let args = call.arguments as? [String: Any],
            let items = args["items"] as? [[String: Any]]
          else {
            result(FlutterError(code: "args", message: "items are required", details: nil))
            return
          }
          AppDelegate.deleteOriginals(items: items, result: result)
        case "setAppIcon":
          // iOS names the alternate icon set; nil means "back to the primary
          // one", which is why Dart sends an explicit null for the default
          // rather than the set's own name. `supportsAlternateIcons` is false
          // on iPad multitasking and in some enterprise configurations, and a
          // refusal has to come back as false so the picker does not tick an
          // icon the home screen never got.
          let args = call.arguments as? [String: Any]
          let name = args?["iosName"] as? String
          guard UIApplication.shared.supportsAlternateIcons else {
            result(false)
            return
          }
          UIApplication.shared.setAlternateIconName(name) { error in
            DispatchQueue.main.async { result(error == nil) }
          }
        case "appIconAlias":
          // Что включено на самом деле, а не что мы просили. `apply` возвращает
          // true просто потому, что UIKit не передал ошибку; отличить это от
          // сработавшего переключения можно только чтением.
          //
          // Отвечает именем набора (`AppIcon-petals`), а у основной иконки
          // имени нет вовсе — там nil, и это единственный способ, которым iOS
          // её называет. Перевод в id делает Dart, чтобы обе платформы
          // отвечали на один вопрос одинаково.
          result(UIApplication.shared.alternateIconName)
        default:
          result(FlutterMethodNotImplemented)
        }
      }
      shareChannel = channel
    }

    if let url = launchOptions?[.url] as? URL {
      handle(url: url)
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func application(
    _ app: UIApplication,
    open url: URL,
    options: [UIApplication.OpenURLOptionsKey: Any] = [:]
  ) -> Bool {
    if handle(url: url) {
      return true
    }
    return super.application(app, open: url, options: options)
  }

  @discardableResult
  private func handle(url: URL) -> Bool {
    guard url.isFileURL else { return false }

    // Copying can take a moment for a large video; keep it off the main thread.
    DispatchQueue.global(qos: .userInitiated).async { [weak self] in
      guard let copied = self?.copyToCache(url: url) else { return }
      DispatchQueue.main.async {
        guard let self else { return }
        self.pendingShared.append(copied)
        if self.dartReady { self.flushPending() }
      }
    }
    return true
  }

  /// Bytes available to this app. `volumeAvailableCapacityForImportantUsage`
  /// is the figure iOS itself uses when deciding whether a download may
  /// proceed: it counts space that can be reclaimed by purging caches, which
  /// is exactly the space a transcode is allowed to take.
  private static func freeBytes() -> NSNumber? {
    guard
      let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first,
      let values = try? documents.resourceValues(
        forKeys: [.volumeAvailableCapacityForImportantUsageKey]
      ),
      let capacity = values.volumeAvailableCapacityForImportantUsage
    else {
      return nil
    }
    return NSNumber(value: capacity)
  }

  // ---------------------------------------------------------------------------
  // Delete the originals the user just converted
  // ---------------------------------------------------------------------------

  /// Removes source items from the photo library, through the system.
  ///
  /// `PHAssetChangeRequest.deleteAssets` never deletes silently: iOS puts up its
  /// own confirmation sheet showing the actual photos and videos, and the
  /// completion handler reports false if the user declines. The app has no way
  /// to bypass that, which is exactly the property this feature needs.
  ///
  /// Matching is by original filename, and only when it is unique in the
  /// library. The path Dart holds is a copy in the app's cache — the picker
  /// never hands over the asset itself — so the library has to be searched by
  /// metadata. File size is deliberately not part of the match: PHAsset does not
  /// publish it, and the only ways to read it are private API. An ambiguous or
  /// missing name is skipped; deleting the wrong item cannot be undone, while
  /// leaving one behind costs the user nothing but a tap in Photos.
  ///
  /// Anything picked from Files rather than Photos is simply not in the library
  /// and is skipped for the same reason.
  ///
  /// Not yet exercised on a device — this project has no Mac — so it is written
  /// to fail closed: every path that is not a confirmed deletion reports zero.
  private static func deleteOriginals(items: [[String: Any]], result: @escaping FlutterResult) {
    let wanted: [(index: Int, name: String)] = items.enumerated().compactMap { index, item in
      guard let name = item["name"] as? String, !name.isEmpty else { return nil }
      return (index, name)
    }
    guard !wanted.isEmpty else {
      result(["deleted": [Int](), "cancelled": false])
      return
    }

    requestPhotoAccess { granted in
      guard granted else {
        // Refusing access is refusing the deletion, not a failure to report.
        result(["deleted": [Int](), "cancelled": true])
        return
      }

      // Enumerating the library is proportional to its size; keep it off the
      // main thread even though the fetch itself is lazy.
      DispatchQueue.global(qos: .userInitiated).async {
        var byName: [String: [PHAsset]] = [:]
        PHAsset.fetchAssets(with: nil).enumerateObjects { asset, _, _ in
          guard
            let filename = PHAssetResource.assetResources(for: asset).first?.originalFilename
          else { return }
          byName[filename, default: []].append(asset)
        }

        var indices: [Int] = []
        var assets: [PHAsset] = []
        for item in wanted {
          guard let candidates = byName[item.name], candidates.count == 1 else { continue }
          indices.append(item.index)
          assets.append(candidates[0])
        }

        guard !assets.isEmpty else {
          DispatchQueue.main.async { result(["deleted": [Int](), "cancelled": false]) }
          return
        }

        PHPhotoLibrary.shared().performChanges {
          PHAssetChangeRequest.deleteAssets(assets as NSArray)
        } completionHandler: { success, _ in
          DispatchQueue.main.async {
            // The sheet is all-or-nothing, so success means every listed item
            // is gone and anything else means none of them are.
            result(["deleted": success ? indices : [Int](), "cancelled": !success])
          }
        }
      }
    }
  }

  /// Read-write access, because deleting is a write. Limited access still works
  /// for the items the user included in their selection, which is the honest
  /// behaviour: the app can only remove what it was shown.
  private static func requestPhotoAccess(_ completion: @escaping (Bool) -> Void) {
    let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
    switch status {
    case .authorized, .limited:
      completion(true)
    case .notDetermined:
      PHPhotoLibrary.requestAuthorization(for: .readWrite) { granted in
        completion(granted == .authorized || granted == .limited)
      }
    default:
      completion(false)
    }
  }

  private func flushPending() {
    guard !pendingShared.isEmpty, let channel = shareChannel else { return }
    let batch = pendingShared
    pendingShared.removeAll()
    channel.invokeMethod("filesShared", arguments: batch)
  }

  /// FFmpeg needs a real, stable path, and the incoming URL's security scope
  /// dies with the callback — so the bytes are copied while access is held.
  private func copyToCache(url: URL) -> [String: String]? {
    let scoped = url.startAccessingSecurityScopedResource()
    defer { if scoped { url.stopAccessingSecurityScopedResource() } }

    let fm = FileManager.default
    guard let caches = fm.urls(for: .cachesDirectory, in: .userDomainMask).first else {
      return nil
    }

    let dir = caches.appendingPathComponent("shared", isDirectory: true)
    try? fm.createDirectory(at: dir, withIntermediateDirectories: true)

    let name = url.lastPathComponent
    var target = dir.appendingPathComponent(name)
    var suffix = 1
    while fm.fileExists(atPath: target.path) {
      let base = (name as NSString).deletingPathExtension
      let ext = (name as NSString).pathExtension
      let candidate = ext.isEmpty ? "\(base) (\(suffix))" : "\(base) (\(suffix)).\(ext)"
      target = dir.appendingPathComponent(candidate)
      suffix += 1
    }

    do {
      try fm.copyItem(at: url, to: target)
    } catch {
      return nil
    }
    return ["path": target.path, "name": target.lastPathComponent]
  }
}
