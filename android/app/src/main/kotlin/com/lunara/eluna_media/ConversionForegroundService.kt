package com.lunara.eluna_media

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.pm.ServiceInfo
import android.os.Build
import android.os.IBinder
import androidx.core.app.NotificationCompat

/**
 * Keeps the process alive while a conversion batch runs.
 *
 * The service does no work itself. FFmpeg already executes on its own native
 * threads, driven from the Dart isolate; what a backgrounded app lacks is not a
 * worker but a reason for Android not to kill it. A foreground service in the
 * same process supplies exactly that, and the ongoing notification it is
 * obliged to post doubles as the progress indicator.
 *
 * START_NOT_STICKY: the queue lives in memory, so a process death is not
 * something a restarted service could resume.
 */
class ConversionForegroundService : Service() {

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        if (intent?.action == ACTION_STOP) {
            stopForeground(STOP_FOREGROUND_REMOVE)
            stopSelf()
            return START_NOT_STICKY
        }

        // The notification's Cancel button. The service owns no queue of its
        // own, so it hands the request to Dart — the same process, so the
        // channel is live as long as this service is — and lets the queue come
        // down the normal way, cancelling FFmpeg and stopping this service in
        // its own `finally`. Stopping ourselves here instead would leave the
        // encode running with nothing showing that it is.
        if (intent?.action == ACTION_CANCEL) {
            MainActivity.postCancelRequest()
            return START_NOT_STICKY
        }

        val title = intent?.getStringExtra(EXTRA_TITLE).orEmpty()
        val text = intent?.getStringExtra(EXTRA_TEXT).orEmpty()
        val progress = intent?.getIntExtra(EXTRA_PROGRESS, INDETERMINATE) ?: INDETERMINATE
        val cancelLabel = intent?.getStringExtra(EXTRA_CANCEL_LABEL).orEmpty()

        ensureChannel()
        val notification = buildNotification(title, text, progress, cancelLabel)
        // Android 15 gives dataSync services a ~6-hour daily budget and then
        // kills them — a budget a long batch of `slow`-preset encodes can
        // exhaust. mediaProcessing (API 35+) is the type Android designates
        // for exactly this workload and carries no such cap.
        if (Build.VERSION.SDK_INT >= 35) {
            startForeground(
                NOTIFICATION_ID,
                notification,
                ServiceInfo.FOREGROUND_SERVICE_TYPE_MEDIA_PROCESSING,
            )
        } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            startForeground(
                NOTIFICATION_ID,
                notification,
                ServiceInfo.FOREGROUND_SERVICE_TYPE_DATA_SYNC,
            )
        } else {
            startForeground(NOTIFICATION_ID, notification)
        }
        return START_NOT_STICKY
    }

    private fun ensureChannel() {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return
        val manager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        if (manager.getNotificationChannel(CHANNEL_ID) != null) return

        // IMPORTANCE_LOW: the notification must exist, but it should not make a
        // sound every time the progress bar moves.
        val channel = NotificationChannel(
            CHANNEL_ID,
            "Conversion in progress",
            NotificationManager.IMPORTANCE_LOW,
        ).apply {
            description = "Shown while files are being converted."
            setShowBadge(false)
        }
        manager.createNotificationChannel(channel)
    }

    private fun buildNotification(
        title: String,
        text: String,
        progress: Int,
        cancelLabel: String,
    ): Notification {
        val launch = Intent(this, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_SINGLE_TOP or Intent.FLAG_ACTIVITY_CLEAR_TOP
        }
        val contentIntent = PendingIntent.getActivity(
            this,
            0,
            launch,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )

        // Transcoding is the hottest, longest thing the phone does, and until
        // this action existed the only way to stop it was to find the app and
        // press Cancel there. The label arrives from Dart because that is where
        // the user's language lives.
        val cancelIntent = Intent(this, ConversionForegroundService::class.java).apply {
            action = ACTION_CANCEL
        }
        val cancelPending = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            PendingIntent.getForegroundService(
                this,
                1,
                cancelIntent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
            )
        } else {
            PendingIntent.getService(
                this,
                1,
                cancelIntent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
            )
        }

        return NotificationCompat.Builder(this, CHANNEL_ID)
            .apply {
                if (cancelLabel.isNotEmpty()) {
                    addAction(android.R.drawable.ic_menu_close_clear_cancel, cancelLabel, cancelPending)
                }
            }
            .setContentTitle(title)
            .setContentText(text)
            .setSmallIcon(android.R.drawable.stat_sys_download)
            .setContentIntent(contentIntent)
            .setOngoing(true)
            .setSilent(true)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .apply {
                if (progress == INDETERMINATE) {
                    setProgress(0, 0, true)
                } else {
                    setProgress(100, progress.coerceIn(0, 100), false)
                }
            }
            .build()
    }

    companion object {
        const val ACTION_STOP = "com.lunara.eluna_media.STOP"
        const val ACTION_CANCEL = "com.lunara.eluna_media.CANCEL_BATCH"
        const val EXTRA_TITLE = "title"
        const val EXTRA_TEXT = "text"
        const val EXTRA_PROGRESS = "progress"
        const val EXTRA_CANCEL_LABEL = "cancelLabel"

        /** Sentinel for "show a spinner, not a percentage". */
        const val INDETERMINATE = -1

        private const val CHANNEL_ID = "eluna_conversion_progress"
        private const val NOTIFICATION_ID = 2001
    }
}
