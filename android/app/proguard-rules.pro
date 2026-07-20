# ffmpeg-kit ships its own consumer rules, but the JNI entry points are only
# referenced from native code, which R8 cannot see.
-keep class com.antonkarpenko.ffmpegkit.** { *; }

# flutter_local_notifications deserialises scheduled notifications via Gson.
-keep class com.dexterous.** { *; }
-keepattributes *Annotation*
-keepattributes Signature

# Flutter's own deferred-component shims, absent in a non-split build.
-dontwarn io.flutter.embedding.engine.deferredcomponents.**
