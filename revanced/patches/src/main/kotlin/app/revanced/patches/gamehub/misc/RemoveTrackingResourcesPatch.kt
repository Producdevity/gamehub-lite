package app.revanced.patches.gamehub.misc

import app.revanced.patcher.patch.resourcePatch

import org.w3c.dom.Element
import java.io.File

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
            val usesPermissions = document.getElementsByTagName("uses-permission")
            val toRemove = mutableListOf<Element>()

            for (i in 0 until usesPermissions.length) {
                val permission = usesPermissions.item(i) as Element
                val permName = permission.getAttribute("android:name")
                if (permissionsToRemove.contains(permName)) {
                    toRemove.add(permission)
                }
            }

            toRemove.forEach { it.parentNode.removeChild(it) }

            // Remove JPush and Firebase components
            val application = document.getElementsByTagName("application").item(0) as Element
            val componentsToRemove = mutableListOf<Element>()

            // Find services/receivers related to tracking
            val services = application.getElementsByTagName("service")
            for (i in 0 until services.length) {
                val service = services.item(i) as Element
                val name = service.getAttribute("android:name")
                if (name.contains("jpush") ||
                    name.contains("jiguang") ||
                    name.contains("firebase") ||
                    name.contains("umeng") ||
                    name.contains("analytics")
                ) {
                    componentsToRemove.add(service)
                }
            }

            val receivers = application.getElementsByTagName("receiver")
            for (i in 0 until receivers.length) {
                val receiver = receivers.item(i) as Element
                val name = receiver.getAttribute("android:name")
                if (name.contains("jpush") ||
                    name.contains("jiguang") ||
                    name.contains("firebase") ||
                    name.contains("umeng")
                ) {
                    componentsToRemove.add(receiver)
                }
            }

            componentsToRemove.forEach { it.parentNode.removeChild(it) }
        }
    }
}

/**
 * Patch that removes tracking SDK classes from the DEX files.
 * Note: This is a more aggressive approach that removes entire packages. maybe works, maybe not. idk
 */
val removeTrackingSdksPatch = resourcePatch(
    name = "Remove Tracking SDKs",
    description = "Removes entire tracking SDK packages from the APK",
) {
    compatibleWith("com.xiaoji.egggame"("5.3.5"))

    dependsOn(removeTrackingResourcesPatch)

    execute {
        // Packages to remove (these will be handled by bytecode removal)
        val packagesToRemove = listOf(
            "com/umeng/",
            "cn/jiguang/",
            "cn/jpush/",
            "com/tencent/connect/",
            "com/tencent/mm/",
            "com/tencent/open/",
            "com/tencent/tauth/",
        )

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
