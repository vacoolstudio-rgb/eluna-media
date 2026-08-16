import Flutter
import ImageIO
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

  /// Общая земля с расширением «Поделиться». Дублируется в
  /// `ShareViewController` и в обоих entitlements — расширение это отдельный
  /// бинарник и импортировать код приложения не может, поэтому единственной
  /// константы на всех не бывает.
  private static let appGroupIdentifier = "group.com.eluna.media"
  private static let sharedInboxName = "SharedInbox"

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
        case "requestMediaAccess":
          // Спросить доступ заранее — в момент, когда пользователь включает
          // удаление оригиналов, а не через полчаса, когда батч закончился.
          //
          // На iOS это единственный шанс: системный запрос показывается **один
          // раз за установку**, и после отказа он молчит навсегда. Спросив в
          // момент включения, приложение узнаёт ответ тогда же, когда его
          // узнаёт человек, и может честно не включать переключатель.
          AppDelegate.requestPhotoAccess { granted in
            DispatchQueue.main.async { result(granted) }
          }
        case "openAppSettings":
          // Дорога назад после отказа. Своего запроса у приложения больше не
          // будет, и без этой кнопки функция остаётся мёртвой без объяснения.
          guard let url = URL(string: UIApplication.openSettingsURLString) else {
            result(false)
            return
          }
          UIApplication.shared.open(url) { opened in
            DispatchQueue.main.async { result(opened) }
          }
        case "decodeStill":
          // Раскодировать картинку системой и положить рядом обычным PNG.
          // Нужно там, где FFmpeg читает файл не целиком, — см. decodeStill.
          guard
            let args = call.arguments as? [String: Any],
            let path = args["path"] as? String,
            let outputPath = args["outputPath"] as? String
          else {
            result(false)
            return
          }
          DispatchQueue.global(qos: .userInitiated).async {
            let ok = AppDelegate.decodeStill(path: path, outputPath: outputPath)
            DispatchQueue.main.async { result(ok) }
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
    drainSharedInbox()

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  /// Второй момент, когда стоит заглянуть в ящик расширения: холодного старта
  /// может не быть вовсе — приложение всё это время висело в фоне, а человек
  /// поделился в «Фото» и переключился обратно.
  override func applicationDidBecomeActive(_ application: UIApplication) {
    super.applicationDidBecomeActive(application)
    drainSharedInbox()
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
  // Decode a still the bundled FFmpeg cannot read whole
  // ---------------------------------------------------------------------------

  /// Renders [path] at full resolution into a PNG at [outputPath].
  ///
  /// Exists because of one measured defect. An iPhone stores a photo as HEIC
  /// whose picture is cut into 512×512 tiles referenced by a `grid` item, and
  /// the bundled FFmpeg parses that grid — it even reports the true size — but
  /// its command-line layer never stitches the tiles: every mapping, including
  /// `-map 0:g:0`, hands one tile to the encoder. A 4032×3024 snapshot would
  /// come out as its top-left 512×512 corner, and the conversion would report
  /// success. Silently wrong beats loudly broken only in the wrong direction.
  ///
  /// ImageIO is the same decoder that draws the photo in Photos, so the grid,
  /// the EXIF orientation, the colour space and any auxiliary images are
  /// handled by definition rather than by us re-implementing HEIF.
  ///
  /// PNG rather than JPEG on purpose: this is an intermediate, and the real
  /// encode happens after it. A lossy step here would be a second generation
  /// of loss the user never asked for — including on lossless targets. The
  /// cost is a big temporary file (a 12-megapixel photo lands around 30 MB),
  /// which the Dart side deletes as soon as FFmpeg is done with it.
  ///
  /// Fails closed: `false` means "use the original file", which is exactly the
  /// behaviour that existed before this method.
  private static func decodeStill(path: String, outputPath: String) -> Bool {
    let url = URL(fileURLWithPath: path)
    guard let source = CGImageSourceCreateWithURL(url as CFURL, nil) else { return false }

    // Full resolution means asking for it: the thumbnail API caps at the size
    // you name, and naming the image's own longest side is what makes it the
    // whole picture rather than a preview.
    guard
      let properties = CGImageSourceCopyPropertiesAtIndex(source, 0, nil) as? [CFString: Any],
      let width = properties[kCGImagePropertyPixelWidth] as? Int,
      let height = properties[kCGImagePropertyPixelHeight] as? Int,
      width > 0, height > 0
    else {
      return false
    }

    let options: [CFString: Any] = [
      kCGImageSourceCreateThumbnailFromImageAlways: true,
      // Bakes the EXIF rotation into the pixels. Without it a portrait photo
      // arrives sideways, because PNG has nowhere to carry the flag.
      kCGImageSourceCreateThumbnailWithTransform: true,
      kCGImageSourceThumbnailMaxPixelSize: max(width, height),
    ]
    guard
      let image = CGImageSourceCreateThumbnailAtIndex(source, 0, options as CFDictionary)
    else {
      return false
    }

    let destinationURL = URL(fileURLWithPath: outputPath)
    guard
      let destination = CGImageDestinationCreateWithURL(
        destinationURL as CFURL, "public.png" as CFString, 1, nil
      )
    else {
      return false
    }
    CGImageDestinationAddImage(destination, image, nil)
    guard CGImageDestinationFinalize(destination) else {
      // A half-written file would be read by FFmpeg as a corrupt input.
      try? FileManager.default.removeItem(at: destinationURL)
      return false
    }
    return true
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

    guard let target = AppDelegate.freeSlot(for: url.lastPathComponent) else { return nil }
    do {
      try FileManager.default.copyItem(at: url, to: target)
    } catch {
      return nil
    }
    return ["path": target.path, "name": target.lastPathComponent]
  }

  // ---------------------------------------------------------------------------
  // Inbox of the share extension
  // ---------------------------------------------------------------------------

  /// Забирает файлы, которые положило расширение «Поделиться».
  ///
  /// Расширение и приложение — разные песочницы, и общая земля у них одна:
  /// контейнер App Group. Расширение туда кладёт, приложение отсюда забирает.
  /// Зовётся на запуске и при каждом возвращении на экран, потому что поделиться
  /// могли в любой из этих моментов, а не открывать приложение сразу — обычное
  /// поведение: человек шлёт три ролика подряд и только потом заходит.
  ///
  /// Файлы **переносятся**, а не копируются: контейнер группы делится квотой с
  /// приложением, и оставленная там копия гигабайтного ролика — это гигабайт,
  /// который пользователь не найдёт ни в одной папке и не сможет удалить.
  private func drainSharedInbox() {
    DispatchQueue.global(qos: .userInitiated).async { [weak self] in
      let fm = FileManager.default
      guard
        let container = fm.containerURL(
          forSecurityApplicationGroupIdentifier: AppDelegate.appGroupIdentifier
        ),
        let waiting = try? fm.contentsOfDirectory(
          at: container.appendingPathComponent(AppDelegate.sharedInboxName, isDirectory: true),
          includingPropertiesForKeys: nil
        ),
        !waiting.isEmpty
      else {
        return
      }

      // По имени, чтобы порядок в очереди не зависел от того, в каком порядке
      // файловая система решила перечислить каталог.
      let adopted = waiting
        .sorted { $0.lastPathComponent < $1.lastPathComponent }
        .compactMap { AppDelegate.adopt($0) }
      guard !adopted.isEmpty else { return }

      DispatchQueue.main.async {
        guard let self else { return }
        self.pendingShared.append(contentsOf: adopted)
        if self.dartReady { self.flushPending() }
      }
    }
  }

  /// Переносит один файл из контейнера группы в кэш приложения.
  ///
  /// Отказывает закрыто: файл, который не удалось перенести, остаётся лежать в
  /// контейнере и будет предложен снова при следующем заходе — это лучше, чем
  /// потерять то, что пользователь явно отправил.
  private static func adopt(_ url: URL) -> [String: String]? {
    guard let target = freeSlot(for: url.lastPathComponent) else { return nil }
    do {
      try FileManager.default.moveItem(at: url, to: target)
    } catch {
      return nil
    }
    return ["path": target.path, "name": target.lastPathComponent]
  }

  /// Свободное имя в `caches/shared` — общая часть обоих путей приёма.
  ///
  /// Совпадения разводятся суффиксом, а не перезаписью: два `IMG_0001.HEIC` из
  /// разных альбомов — обычное дело, и потерять первый молча нельзя.
  private static func freeSlot(for name: String) -> URL? {
    let fm = FileManager.default
    guard let caches = fm.urls(for: .cachesDirectory, in: .userDomainMask).first else {
      return nil
    }
    let dir = caches.appendingPathComponent("shared", isDirectory: true)
    try? fm.createDirectory(at: dir, withIntermediateDirectories: true)

    var target = dir.appendingPathComponent(name)
    var suffix = 1
    while fm.fileExists(atPath: target.path) {
      let base = (name as NSString).deletingPathExtension
      let ext = (name as NSString).pathExtension
      let candidate = ext.isEmpty ? "\(base) (\(suffix))" : "\(base) (\(suffix)).\(ext)"
      target = dir.appendingPathComponent(candidate)
      suffix += 1
    }
    return target
  }
}
