plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.lunara.eluna_media"
    compileSdk = flutter.compileSdkVersion
    // Highest NDK required by any plugin (ffmpeg-kit and friends); NDK releases
    // are backward compatible.
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
        // flutter_local_notifications uses java.time, which needs desugaring
        // below API 26.
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.lunara.eluna_media"
        // ffmpeg-kit's native libraries require API 24.
        minSdk = 24
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")

            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro",
            )
        }
    }

    // The FFmpeg .so files dominate the APK. Build with `flutter build apk
    // --split-per-abi` (or ship an App Bundle) so a device downloads only its
    // own ABI; do not configure `splits {}` here, as that breaks the fixed
    // output path `flutter run` expects.

    packaging {
        jniLibs {
            // ffmpeg-kit ships uncompressed .so files; keeping them that way lets
            // the loader mmap them instead of extracting to /data.
            useLegacyPackaging = false
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
    // NotificationCompat / ContextCompat for the conversion foreground service.
    implementation("androidx.core:core-ktx:1.13.1")
}
