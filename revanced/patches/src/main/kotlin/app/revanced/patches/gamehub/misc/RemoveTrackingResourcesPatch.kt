package app.revanced.patches.gamehub.misc

import app.revanced.patcher.patch.resourcePatch

import org.w3c.dom.Element
import java.io.File
import app.revanced.patches.gamehub.shared.ManifestUtils

/**
 * Resource patch that removes tracking-related permissions and components from AndroidManifest.xml
 */
val removeTrackingResourcesPatch = resourcePatch(
    name = "Remove Tracking Resources",
    description = "Removes tracking permissions, services, and receivers from the manifest",
) {
    compatibleWith("com.xiaoji.egggame"("5.3.5"))

    execute {
        // Modify AndroidManifest.xml to remove tracking permissions
        document("AndroidManifest.xml").use { document ->
            val manifest = document.getElementsByTagName("manifest").item(0) as Element

            // Permissions to remove
            val permissionsToRemove = listOf(
                "android.permission.ACCESS_COARSE_LOCATION",
                "android.permission.ACCESS_FINE_LOCATION",
                "android.permission.ACCESS_BACKGROUND_LOCATION",
                "android.permission.READ_PHONE_STATE",
                "android.permission.READ_CONTACTS",
                "android.permission.CAMERA",
                "com.google.android.gms.permission.AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_AD_ID",
            )

            // Remove unwanted permissions
            ManifestUtils.removeManifestTags(document, listOf("uses-permission")) { tag ->
                permissionsToRemove.contains(tag.getAttribute("android:name"))
            }

            // Remove JPush and Firebase components
            ManifestUtils.removeManifestTags(document, listOf("service", "receiver")) { tag ->
                val name = tag.getAttribute("android:name")
                name.contains("jpush") ||
                name.contains("jiguang") ||
                name.contains("firebase") ||
                name.contains("umeng") ||
                (tag.tagName == "service" && name.contains("analytics"))
            }
        }
    }
}

/**
 * Patch that removes tracking SDK classes from the DEX files.
 * Note: This is a more aggressive approach that removes entire packages. maybe works, maybe not. idk
 */
val removeTrackingSdksPatch = resourcePatch(
    name = "Remove Tracking SDKs",
    description = "Removes tracking-related assets and native libraries from the APK",
) {
    compatibleWith("com.xiaoji.egggame"("5.3.5"))

    dependsOn(removeTrackingResourcesPatch)

    execute {
        // DEX class removal must be done via a bytecode patch instead.

        // Remove unused assets
        val assetsToRemove = listOf(
            "NotoColorEmojiCompat.ttf",
            "auth_intro_timberline.webm",
            "auth_loop_timberline.webm",
            "better-xcloud.user.js",
            "splash_video.mp4",
        )

        assetsToRemove.forEach { asset ->
            val assetFile = get("assets/$asset")
            if (assetFile.exists() && !assetFile.delete()) {
                error("Failed to delete asset: ${assetFile.path}")
            }
        }

        // Remove native libraries used for tracking
        val nativeLibsToRemove = listOf(
            "libumeng-spy.so",
            "libcrashsdk.so",
            "libalicomphonenumberauthsdk_core.so",
            "libpns-2.12.17-LogOnlineStandardCuxwRelease_alijtca_plus.so",
            "libsnproxy.so",
            "libsnproxy_jni.so",
        )

        val libDirs = listOf("lib/arm64-v8a", "lib/armeabi-v7a", "lib/x86", "lib/x86_64")
        libDirs.forEach { libDir ->
            nativeLibsToRemove.forEach { lib ->
                val libFile = get("$libDir/$lib")
                if (libFile.exists() && !libFile.delete()) {
                    error("Failed to delete native library: ${libFile.path}")
                }
            }
        }
    }
}
