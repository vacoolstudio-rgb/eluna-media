import java.io.FileInputStream
import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// Release signing lives outside the repository. `android/key.properties` holds
// the upload key's location and passwords; without it the release build falls
// back to the debug key, so `flutter run --release` still works for anyone who
// has only cloned the project.
val keystorePropertiesFile = rootProject.file("key.properties")
val keystoreProperties = Properties().apply {
    if (keystorePropertiesFile.exists()) {
        FileInputStream(keystorePropertiesFile).use { load(it) }
    }
}

android {
    namespace = "com.eluna.media"
    compileSdk = flutter.compileSdkVersion
    // Highest NDK required by any plugin (ffmpeg-kit and friends); NDK releases
    // are backward compatible. Raised to 28.2 for `integration_test`, which
    // warned on every device run — the tests still built, but a warning printed
    // on every run is a warning nobody reads by the third time.
    ndkVersion = "28.2.13676358"

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
        applicationId = "com.eluna.media"
        // ffmpeg-kit's native libraries require API 24.
        minSdk = 24
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        if (keystorePropertiesFile.exists()) {
            create("release") {
                storeFile = file(keystoreProperties.getProperty("storeFile"))
                storePassword = keystoreProperties.getProperty("storePassword")
                keyAlias = keystoreProperties.getProperty("keyAlias")
                keyPassword = keystoreProperties.getProperty("keyPassword")
            }
        }
    }

    buildTypes {
        release {
            // The upload key when key.properties is present, the debug key when
            // it is not. A bundle signed with the debug key is rejected by Play,
            // so a real release must never be built without that file.
            signingConfig = if (keystorePropertiesFile.exists()) {
                signingConfigs.getByName("release")
            } else {
                signingConfigs.getByName("debug")
            }

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
