package com.lunara.eluna_media

import android.app.DownloadManager
import android.content.ActivityNotFoundException
import android.content.ContentValues
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.provider.MediaStore
import android.provider.OpenableColumns
import android.webkit.MimeTypeMap
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File
import java.io.FileOutputStream

class MainActivity : FlutterActivity() {

    private var shareChannel: MethodChannel? = null

    /** Files copied out of shared content:// URIs, waiting for Dart to be ready. */
    private val pendingShared = mutableListOf<Map<String, String>>()

    /** Set once Dart has installed its handler and asked for the backlog. */
    private var dartReady = false

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, SERVICE_CHANNEL)
        ownServiceChannel = channel
        serviceChannel = channel
        channel
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    // `start` and `update` are one operation: re-posting the
                    // notification for an already-running service refreshes it.
                    "start", "update" -> {
                        val intent = Intent(this, ConversionForegroundService::class.java).apply {
                            putExtra(
                                ConversionForegroundService.EXTRA_TITLE,
                                call.argument<String>("title"),
                            )
                            putExtra(
                                ConversionForegroundService.EXTRA_TEXT,
                                call.argument<String>("text"),
                            )
                            putExtra(
                                ConversionForegroundService.EXTRA_PROGRESS,
                                call.argument<Int>("progress")
                                    ?: ConversionForegroundService.INDETERMINATE,
                            )
                            putExtra(
                                ConversionForegroundService.EXTRA_CANCEL_LABEL,
                                call.argument<String>("cancelLabel"),
                            )
                        }
                        ContextCompat.startForegroundService(this, intent)
                        result.success(null)
                    }

                    "stop" -> {
                        val intent = Intent(this, ConversionForegroundService::class.java).apply {
                            action = ConversionForegroundService.ACTION_STOP
                        }
                        // startService throws from the background once the
                        // service is already gone (e.g. the OS timed it out);
                        // stopping something dead is success, not a crash.
                        try {
                            startService(intent)
                        } catch (_: IllegalStateException) {
                        }
                        result.success(null)
                    }

                    else -> result.notImplemented()
                }
            }

        shareChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, SHARE_CHANNEL)
            .also { channel ->
                channel.setMethodCallHandler { call, result ->
                    when (call.method) {
                        // Dart signals readiness; flush anything received before
                        // the Flutter side came up (cold-start share).
                        "ready" -> {
                            dartReady = true
                            flushPending()
                            result.success(null)
                        }

                        // The system Downloads view is where "Save" puts audio
                        // and anything else the gallery will not take.
                        "openDownloads" -> {
                            val intent = Intent(DownloadManager.ACTION_VIEW_DOWNLOADS).apply {
                                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                            }
                            try {
                                startActivity(intent)
                                result.success(true)
                            } catch (_: ActivityNotFoundException) {
                                result.success(false)
                            }
                        }

                        // Free bytes on the volume the output folder lives on.
                        // A 4 GB transcode onto 300 MB of headroom used to fail
                        // at 98% with a raw `No space left on device`; the app
                        // can now say so before it spends the battery.
                        "freeSpace" -> {
                            result.success(
                                try {
                                    filesDir.usableSpace
                                } catch (_: Exception) {
                                    null
                                },
                            )
                        }

                        "saveToDownloads" -> {
                            val path = call.argument<String>("path")
                            val name = call.argument<String>("name")
                            if (path == null || name == null) {
                                result.error("args", "path and name are required", null)
                            } else {
                                Thread {
                                    val saved = saveToDownloads(path, name)
                                    runOnUiThread {
                                        if (saved != null) {
                                            result.success(saved)
                                        } else {
                                            result.error("save_failed", "Could not save file", null)
                                        }
                                    }
                                }.start()
                            }
                        }

                        else -> result.notImplemented()
                    }
                }
            }

        // The launch intent may itself be a share/open-with; the engine exists
        // now, so it is safe to start copying.
        handleIntent(intent)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        handleIntent(intent)
    }

    // -------------------------------------------------------------------------
    // Inbound share / open-with
    // -------------------------------------------------------------------------

    private fun handleIntent(intent: Intent?) {
        if (intent == null) return
        // Relaunching from recents redelivers the original share intent to
        // the recreated activity; without this guard the same file would be
        // imported again after every process death.
        if (intent.flags and Intent.FLAG_ACTIVITY_LAUNCHED_FROM_HISTORY != 0) return
        val uris: List<Uri> = when (intent.action) {
            Intent.ACTION_SEND ->
                listOfNotNull(intentStreamUri(intent))
            Intent.ACTION_SEND_MULTIPLE ->
                intentStreamUris(intent)
            Intent.ACTION_VIEW ->
                listOfNotNull(intent.data)
            else -> emptyList()
        }
        if (uris.isEmpty()) return
        // Consume the action so a configuration change does not re-import.
        intent.action = Intent.ACTION_MAIN

        // Copying a shared video can be hundreds of MB; never do it on the main
        // thread. Each file is announced as soon as its copy lands.
        Thread {
            for (uri in uris) {
                val copied = copyToCache(uri) ?: continue
                runOnUiThread {
                    pendingShared.add(copied)
                    if (dartReady) flushPending()
                }
            }
        }.start()
    }

    @Suppress("DEPRECATION")
    private fun intentStreamUri(intent: Intent): Uri? =
        if (Build.VERSION.SDK_INT >= 33) {
            intent.getParcelableExtra(Intent.EXTRA_STREAM, Uri::class.java)
        } else {
            intent.getParcelableExtra(Intent.EXTRA_STREAM)
        }

    @Suppress("DEPRECATION")
    private fun intentStreamUris(intent: Intent): List<Uri> =
        (if (Build.VERSION.SDK_INT >= 33) {
            intent.getParcelableArrayListExtra(Intent.EXTRA_STREAM, Uri::class.java)
        } else {
            intent.getParcelableArrayListExtra(Intent.EXTRA_STREAM)
        })?.filterNotNull() ?: emptyList()

    private fun flushPending() {
        if (pendingShared.isEmpty()) return
        val batch = pendingShared.toList()
        pendingShared.clear()
        shareChannel?.invokeMethod("filesShared", batch)
    }

    /**
     * FFmpeg needs a real file path, and a content:// grant dies with this
     * Activity, so the stream is copied into the same cache directory the file
     * picker uses. The queue already treats that directory as purgeable.
     */
    private fun copyToCache(uri: Uri): Map<String, String>? {
        return try {
            val name = displayNameOf(uri) ?: "shared_${System.currentTimeMillis()}"
            val dir = File(cacheDir, "shared").apply { mkdirs() }
            var target = File(dir, name)
            var suffix = 1
            while (target.exists()) {
                val dot = name.lastIndexOf('.')
                target = if (dot > 0) {
                    File(dir, "${name.substring(0, dot)} ($suffix)${name.substring(dot)}")
                } else {
                    File(dir, "$name ($suffix)")
                }
                suffix++
            }
            contentResolver.openInputStream(uri)?.use { input ->
                FileOutputStream(target).use { output -> input.copyTo(output) }
            } ?: return null
            mapOf("path" to target.absolutePath, "name" to target.name)
        } catch (_: Exception) {
            null
        }
    }

    private fun displayNameOf(uri: Uri): String? {
        if (uri.scheme == "file") return uri.lastPathSegment
        return try {
            contentResolver.query(uri, arrayOf(OpenableColumns.DISPLAY_NAME), null, null, null)
                ?.use { cursor ->
                    if (cursor.moveToFirst()) cursor.getString(0) else null
                }
        } catch (_: Exception) {
            null
        }
    }

    // -------------------------------------------------------------------------
    // Save a finished output where the user can find it
    // -------------------------------------------------------------------------

    /**
     * Copies a converted file into the public Downloads collection. On API 29+
     * this goes through MediaStore and needs no permission; below that it writes
     * to the legacy Downloads directory (WRITE_EXTERNAL_STORAGE is declared with
     * maxSdkVersion accordingly). Returns the visible name, or null on failure.
     */
    private fun saveToDownloads(path: String, name: String): String? {
        val source = File(path)
        if (!source.exists()) return null
        return try {
            if (Build.VERSION.SDK_INT >= 29) {
                val values = ContentValues().apply {
                    put(MediaStore.MediaColumns.DISPLAY_NAME, name)
                    put(MediaStore.MediaColumns.MIME_TYPE, mimeOf(name))
                    put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS)
                    // Hidden until the copy lands: an interrupted write must
                    // not leave a phantom 0-byte file in the user's Downloads.
                    put(MediaStore.MediaColumns.IS_PENDING, 1)
                }
                val collection = MediaStore.Downloads.getContentUri(MediaStore.VOLUME_EXTERNAL_PRIMARY)
                val uri = contentResolver.insert(collection, values) ?: return null
                try {
                    contentResolver.openOutputStream(uri)?.use { output ->
                        source.inputStream().use { it.copyTo(output) }
                    } ?: throw IllegalStateException("no output stream")
                    values.clear()
                    values.put(MediaStore.MediaColumns.IS_PENDING, 0)
                    contentResolver.update(uri, values, null, null)
                } catch (e: Exception) {
                    contentResolver.delete(uri, null, null)
                    throw e
                }
                name
            } else {
                @Suppress("DEPRECATION")
                val dir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS)
                dir.mkdirs()
                var target = File(dir, name)
                var suffix = 1
                while (target.exists()) {
                    val dot = name.lastIndexOf('.')
                    target = if (dot > 0) {
                        File(dir, "${name.substring(0, dot)} ($suffix)${name.substring(dot)}")
                    } else {
                        File(dir, "$name ($suffix)")
                    }
                    suffix++
                }
                source.inputStream().use { input ->
                    FileOutputStream(target).use { input.copyTo(it) }
                }
                target.name
            }
        } catch (_: Exception) {
            null
        }
    }

    private fun mimeOf(name: String): String {
        val ext = name.substringAfterLast('.', "").lowercase()
        return MimeTypeMap.getSingleton().getMimeTypeFromExtension(ext)
            ?: "application/octet-stream"
    }

    /** This instance's channel, so onDestroy can tell it from a successor's. */
    private var ownServiceChannel: MethodChannel? = null

    override fun onDestroy() {
        // The channel belongs to an engine that is going away, so a later
        // cancel request must find null rather than a dead messenger — but only
        // if the static slot still holds *ours*. A recreated activity installs
        // its own before the old one is torn down, and clearing unconditionally
        // would silently disconnect the live one.
        if (serviceChannel === ownServiceChannel) serviceChannel = null
        ownServiceChannel = null
        super.onDestroy()
    }

    companion object {
        private const val SERVICE_CHANNEL = "eluna/foreground_service"
        private const val SHARE_CHANNEL = "eluna/share_intake"

        /**
         * The live foreground-service channel, held statically so the service —
         * a separate component in the same process — can reach Dart when the
         * user presses Cancel in the notification.
         */
        private var serviceChannel: MethodChannel? = null

        /** Tells Dart to cancel the running batch. Safe to call from any thread. */
        fun postCancelRequest() {
            if (serviceChannel == null) return
            android.os.Handler(android.os.Looper.getMainLooper()).post {
                // Re-read rather than capture: the engine may have gone away
                // between this being queued and it running.
                serviceChannel?.invokeMethod("cancelRequested", null)
            }
        }
    }
}
