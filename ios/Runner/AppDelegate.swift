import Flutter
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
