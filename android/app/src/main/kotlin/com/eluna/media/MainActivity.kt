package com.eluna.media

import android.app.Activity
import android.app.DownloadManager
import android.content.ActivityNotFoundException
import android.content.ContentUris
import android.content.ContentValues
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.ImageDecoder
import android.net.Uri
import android.os.Build
import android.os.Environment
import android.provider.MediaStore
import android.provider.OpenableColumns
import android.webkit.MimeTypeMap
import androidx.core.app.ActivityCompat
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

    /**
     * Launcher aliases declared in AndroidManifest.xml, in the same order as
     * `kAppIcons` on the Dart side. Kept as an allow-list rather than trusting
     * the argument: `setComponentEnabledSetting` on a name that is not a real
     * component throws, and one that *is* real but is not an icon alias would
     * let Dart disable arbitrary parts of the app.
     */
    private val iconAliases = listOf(
        "IconLoop", "IconPetals", "IconToolbox", "IconNeon", "IconOrbit",
        "IconUnbox", "IconClamp", "IconEnvelope", "IconSatchel",
    )

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

                        // Hand the user's original files to the system's own
                        // delete dialog. See deleteOriginals below for why the
                        // lookup is by name and size.
                        "deleteOriginals" -> {
                            @Suppress("UNCHECKED_CAST")
                            val items = call.argument<List<Map<String, Any?>>>("items")
                            if (items == null) {
                                result.error("args", "items are required", null)
                            } else {
                                deleteOriginals(items, result)
                            }
                        }

                        // Ask for media access up front — the moment the user
                        // turns "delete originals" on, not half an hour later
                        // when a batch ends and the dialog would arrive out of
                        // nowhere. Answering here also lets the switch refuse
                        // to turn on when access is refused.
                        "requestMediaAccess" -> {
                            if (hasMediaReadPermission()) {
                                result.success(true)
                            } else if (accessResult != null) {
                                // Диалог уже висит: второй запрос система
                                // проигнорирует, а ответ придёт один.
                                result.success(false)
                            } else {
                                accessResult = result
                                ActivityCompat.requestPermissions(
                                    this, mediaReadPermissions(), REQUEST_MEDIA_ACCESS,
                                )
                            }
                        }

                        // Дорога назад после отказа: на Android «больше не
                        // спрашивать» тоже существует, и своего запроса у
                        // приложения после него не будет.
                        "openAppSettings" -> {
                            val intent = Intent(
                                android.provider.Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                                Uri.fromParts("package", packageName, null),
                            ).apply { addFlags(Intent.FLAG_ACTIVITY_NEW_TASK) }
                            try {
                                startActivity(intent)
                                result.success(true)
                            } catch (_: ActivityNotFoundException) {
                                result.success(false)
                            }
                        }

                        // Decode a still through the platform and leave it next
                        // to the source as an ordinary PNG. Needed wherever
                        // FFmpeg reads the file but not all of it — see
                        // decodeStill below.
                        "decodeStill" -> {
                            val path = call.argument<String>("path")
                            val outputPath = call.argument<String>("outputPath")
                            if (path == null || outputPath == null) {
                                // false, not error(): the Dart side treats every
                                // failure as "use the original", and an error
                                // would only differ by being noisier about it.
                                result.success(false)
                            } else {
                                Thread {
                                    val ok = decodeStill(path, outputPath)
                                    runOnUiThread { result.success(ok) }
                                }.start()
                            }
                        }

                        // Swaps the launcher icon by enabling one activity-alias
                        // and disabling the rest. See applyAppIcon.
                        "setAppIcon" -> {
                            val alias = call.argument<String>("alias")
                            if (alias == null) {
                                result.error("args", "alias is required", null)
                            } else {
                                result.success(applyAppIcon(alias))
                            }
                        }

                        // Which alias the package manager currently has on.
                        // Read back rather than remembered: "the call did not
                        // throw" and "the launcher entry changed" are different
                        // claims, and only this one is the second.
                        "appIconAlias" -> result.success(currentAppIcon())

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

    // -------------------------------------------------------------------------
    // Decode a still the way the system would
    // -------------------------------------------------------------------------

    /**
     * Write [path] out as a full-resolution PNG at [outputPath], decoded by the
     * platform instead of by FFmpeg.
     *
     * This exists for one measured defect, described in full on the Dart side
     * (`lib/core/still_decoder.dart`): an iPhone stores a photo as a HEIC cut
     * into 512x512 tiles assembled by a `grid` item, and the bundled FFmpeg
     * hands its encoder **one tile** rather than the assembled frame. A 4032-
     * wide snapshot came out as its top-left corner, and the job reported
     * success — a quietly wrong result, which is the worst kind.
     *
     * `ImageDecoder` rather than `BitmapFactory`: the latter cannot read HEIF
     * at all before API 30, and nowhere honours EXIF orientation, so it would
     * trade a cropped photo for a sideways one. ImageDecoder is the same code
     * that draws the picture in the gallery, which is what makes the tiling,
     * the rotation and the colour space right by definition rather than by us
     * re-implementing HEIF.
     *
     * PNG rather than JPEG, matching iOS: this is an intermediate and the real
     * encode happens after it, so a lossy step here would be a second
     * generation of loss nobody asked for — including on lossless targets. The
     * cost is a big temporary file (tens of megabytes for a 12-megapixel
     * photo), which Dart deletes as soon as FFmpeg is done with it.
     *
     * Fails closed. `false` means "use the original file", which is exactly the
     * behaviour that existed before this method — a cropped result on a tiled
     * HEIC, and a correct one on everything else.
     */
    private fun decodeStill(path: String, outputPath: String): Boolean {
        // Platform HEIF decoding arrived in API 28. Below it there is nothing
        // here that FFmpeg does not already do, and pretending otherwise would
        // write a PNG of whatever the older decoder guessed.
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.P) return false

        val source = File(path)
        if (!source.isFile) return false
        val output = File(outputPath)

        var bitmap: Bitmap? = null
        return try {
            bitmap = ImageDecoder.decodeBitmap(ImageDecoder.createSource(source)) { decoder, _, _ ->
                // A hardware bitmap has no pixels to read back, and compressing
                // one is a copy at best and a failure at worst.
                decoder.allocator = ImageDecoder.ALLOCATOR_SOFTWARE
                decoder.isMutableRequired = false
                // No partial-image listener on purpose: without one the decoder
                // throws on a truncated file instead of handing back the part
                // it managed. Half a photo written confidently as a whole one
                // is the very failure this method exists to remove.
            }
            val written = FileOutputStream(output).use { out ->
                bitmap.compress(Bitmap.CompressFormat.PNG, 100, out)
            }
            if (!written) {
                // A half-written PNG would reach FFmpeg as a corrupt input.
                output.delete()
                false
            } else {
                true
            }
        } catch (_: Exception) {
            output.delete()
            false
        } catch (_: OutOfMemoryError) {
            // Realistic, not theoretical: a 48-megapixel source is around
            // 190 MB as ARGB_8888, and the PNG encoder wants room beside it.
            // Falling back to FFmpeg costs correctness on tiled HEIC; killing
            // the process costs the whole batch.
            output.delete()
            false
        } finally {
            bitmap?.recycle()
        }
    }

    // -------------------------------------------------------------------------
    // Delete the originals the user just converted
    // -------------------------------------------------------------------------

    /** The Dart call waiting for the delete dialog to come back. */
    /**
     * Makes [alias] the launcher entry and turns the other eight off.
     *
     * Order matters and is the whole trick: the wanted alias is enabled
     * **first**. Disabling the currently enabled one before another exists
     * leaves the package with no MAIN/LAUNCHER component at all, and for as
     * long as that lasts the app is gone from the home screen — on some
     * launchers permanently, because the shortcut it left behind no longer
     * resolves.
     *
     * DONT_KILL_APP keeps the process alive; without it Android is free to stop
     * the app the moment its own component list changes, which from the user's
     * side looks exactly like a crash on tapping an icon.
     */
    /**
     * The alias the launcher is currently drawing, or null if the state makes
     * no sense.
     *
     * `COMPONENT_ENABLED_STATE_DEFAULT` means "whatever the manifest says", and
     * the manifest enables exactly one — the first entry. An alias nobody has
     * ever switched reports DEFAULT, not DISABLED, so treating DEFAULT as off
     * would report "no icon at all" on a fresh install.
     */
    private fun currentAppIcon(): String? {
        val pm = packageManager
        for (alias in iconAliases) {
            val state = try {
                pm.getComponentEnabledSetting(
                    android.content.ComponentName(this, "$packageName.$alias"),
                )
            } catch (_: Exception) {
                continue
            }
            val on = when (state) {
                PackageManager.COMPONENT_ENABLED_STATE_ENABLED -> true
                PackageManager.COMPONENT_ENABLED_STATE_DEFAULT -> alias == iconAliases.first()
                else -> false
            }
            if (on) return alias
        }
        return null
    }

    private fun applyAppIcon(alias: String): Boolean {
        if (alias !in iconAliases) return false
        return try {
            val pm = packageManager
            pm.setComponentEnabledSetting(
                android.content.ComponentName(this, "$packageName.$alias"),
                PackageManager.COMPONENT_ENABLED_STATE_ENABLED,
                PackageManager.DONT_KILL_APP,
            )
            for (other in iconAliases) {
                if (other == alias) continue
                pm.setComponentEnabledSetting(
                    android.content.ComponentName(this, "$packageName.$other"),
                    PackageManager.COMPONENT_ENABLED_STATE_DISABLED,
                    PackageManager.DONT_KILL_APP,
                )
            }
            true
        } catch (_: Exception) {
            // A refusal has to reach Dart as `false`: the picker only marks a
            // tile as current once the platform accepted it, so a silent
            // failure would show a tick next to an icon the home screen does
            // not have.
            false
        }
    }

    private var deleteResult: MethodChannel.Result? = null

    /** The `requestMediaAccess` call waiting for the permission dialog. */
    private var accessResult: MethodChannel.Result? = null

    /** Requested (name, size) pairs, in the order Dart sent them. */
    private var deleteItems: List<Pair<String, Long>> = emptyList()

    /** Indices of [deleteItems] the dialog is currently asking about. */
    private var deleteIndices: List<Int> = emptyList()

    /**
     * Removes source files from the shared media collections.
     *
     * The app never unlinks anything itself. On API 30+ the URIs go to
     * [MediaStore.createDeleteRequest], which shows the user the actual items —
     * with thumbnails — and deletes only what they approve; below that the app
     * still holds WRITE_EXTERNAL_STORAGE and deletes directly, which is the only
     * mechanism those versions have.
     *
     * Lookup is by display name *and* exact byte size because the path Dart
     * holds is not the original: both the photo picker and the document picker
     * hand back a cached copy, so the real item can only be found by matching
     * its metadata. A name that matches two rows, or none, is skipped rather
     * than guessed at — the wrong file deleted is unrecoverable, and one file
     * left behind costs nothing.
     */
    private fun deleteOriginals(items: List<Map<String, Any?>>, result: MethodChannel.Result) {
        // A second dialog cannot be raised over the first, and the first still
        // owns the pending result.
        if (deleteResult != null) {
            result.success(mapOf("deleted" to emptyList<Int>(), "cancelled" to true))
            return
        }

        deleteItems = items.map { item ->
            (item["name"] as? String ?: "") to ((item["size"] as? Number)?.toLong() ?: -1L)
        }
        deleteResult = result

        if (!hasMediaReadPermission()) {
            requestMediaReadPermission()
            return
        }
        startDeleteRequest()
    }

    private fun mediaReadPermissions(): Array<String> =
        if (Build.VERSION.SDK_INT >= 33) {
            arrayOf(
                android.Manifest.permission.READ_MEDIA_IMAGES,
                android.Manifest.permission.READ_MEDIA_VIDEO,
                android.Manifest.permission.READ_MEDIA_AUDIO,
            )
        } else {
            arrayOf(android.Manifest.permission.READ_EXTERNAL_STORAGE)
        }

    /**
     * Any one of the media permissions is enough to be worth trying: a user who
     * granted photos but not video should still get their photos deleted, and
     * the query simply returns nothing for the rest.
     */
    private fun hasMediaReadPermission(): Boolean = mediaReadPermissions().any {
        ContextCompat.checkSelfPermission(this, it) == PackageManager.PERMISSION_GRANTED
    }

    private fun requestMediaReadPermission() {
        ActivityCompat.requestPermissions(this, mediaReadPermissions(), REQUEST_MEDIA_READ)
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray,
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == REQUEST_MEDIA_ACCESS) {
            val pending = accessResult
            accessResult = null
            pending?.success(hasMediaReadPermission())
            return
        }
        if (requestCode != REQUEST_MEDIA_READ) return
        if (deleteResult == null) return
        if (hasMediaReadPermission()) {
            startDeleteRequest()
        } else {
            // Declining to grant access is the user declining the deletion.
            finishDelete(emptyList(), cancelled = true)
        }
    }

    private fun startDeleteRequest() {
        // Querying the media store touches disk; the intent must be raised from
        // the main thread afterwards.
        Thread {
            val matches = findMediaUris(deleteItems)
            runOnUiThread {
                if (deleteResult == null) return@runOnUiThread
                if (matches.isEmpty()) {
                    finishDelete(emptyList(), cancelled = false)
                    return@runOnUiThread
                }
                deleteIndices = matches.map { it.first }
                if (Build.VERSION.SDK_INT >= 30) {
                    try {
                        val request = MediaStore.createDeleteRequest(
                            contentResolver,
                            matches.map { it.second },
                        )
                        startIntentSenderForResult(
                            request.intentSender,
                            REQUEST_DELETE_ORIGINALS,
                            null,
                            0,
                            0,
                            0,
                        )
                    } catch (_: Exception) {
                        // Backgrounded activity, or a ROM without the dialog.
                        finishDelete(emptyList(), cancelled = true)
                    }
                } else {
                    val deleted = mutableListOf<Int>()
                    for ((index, uri) in matches) {
                        try {
                            if (contentResolver.delete(uri, null, null) > 0) deleted.add(index)
                        } catch (_: Exception) {
                            // Not ours to delete on this version; skip it.
                        }
                    }
                    finishDelete(deleted, cancelled = false)
                }
            }
        }.start()
    }

    private fun findMediaUris(items: List<Pair<String, Long>>): List<Pair<Int, Uri>> {
        val found = mutableListOf<Pair<Int, Uri>>()
        // The Files collection spans images, video and audio in one query, and
        // MEDIA_TYPE says which per-collection URI the delete request needs.
        val collection = MediaStore.Files.getContentUri("external")
        val projection = arrayOf(
            MediaStore.Files.FileColumns._ID,
            MediaStore.Files.FileColumns.MEDIA_TYPE,
        )
        val selection =
            "${MediaStore.Files.FileColumns.DISPLAY_NAME} = ? AND " +
                "${MediaStore.Files.FileColumns.SIZE} = ?"

        items.forEachIndexed { index, (name, size) ->
            if (name.isEmpty() || size <= 0) return@forEachIndexed
            try {
                contentResolver.query(
                    collection,
                    projection,
                    selection,
                    arrayOf(name, size.toString()),
                    null,
                )?.use { cursor ->
                    // Exactly one, or nothing: two files sharing a name and a
                    // byte count are indistinguishable from here, and picking
                    // either would be a coin toss with the user's data.
                    if (cursor.count != 1 || !cursor.moveToFirst()) return@use
                    val id = cursor.getLong(0)
                    val base = when (cursor.getInt(1)) {
                        MediaStore.Files.FileColumns.MEDIA_TYPE_IMAGE ->
                            MediaStore.Images.Media.EXTERNAL_CONTENT_URI
                        MediaStore.Files.FileColumns.MEDIA_TYPE_VIDEO ->
                            MediaStore.Video.Media.EXTERNAL_CONTENT_URI
                        MediaStore.Files.FileColumns.MEDIA_TYPE_AUDIO ->
                            MediaStore.Audio.Media.EXTERNAL_CONTENT_URI
                        else -> null
                    } ?: return@use
                    found.add(index to ContentUris.withAppendedId(base, id))
                }
            } catch (_: Exception) {
                // No read access, or a provider that dislikes the selection.
            }
        }
        return found
    }

    @Deprecated("Activity result callbacks; the plugin APIs still route through them")
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        @Suppress("DEPRECATION")
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode != REQUEST_DELETE_ORIGINALS) return
        if (resultCode == Activity.RESULT_OK) {
            // The dialog is all-or-nothing: OK means every item it listed is gone.
            finishDelete(deleteIndices, cancelled = false)
        } else {
            finishDelete(emptyList(), cancelled = true)
        }
    }

    private fun finishDelete(deleted: List<Int>, cancelled: Boolean) {
        val result = deleteResult ?: return
        deleteResult = null
        deleteItems = emptyList()
        deleteIndices = emptyList()
        result.success(mapOf("deleted" to deleted, "cancelled" to cancelled))
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

        /** Activity-result code for the system's delete-confirmation dialog. */
        private const val REQUEST_DELETE_ORIGINALS = 8021

        /** Permission-request code for the media read access the lookup needs. */
        private const val REQUEST_MEDIA_READ = 8022

        /**
         * Permission-request code for asking *ahead of time*, when the user
         * switches "delete originals" on rather than when a batch ends.
         *
         * Separate from REQUEST_MEDIA_READ on purpose: the two answers finish
         * different pending calls, and sharing one code would hand the toggle's
         * reply to a deletion that nobody started.
         */
        private const val REQUEST_MEDIA_ACCESS = 8023

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
