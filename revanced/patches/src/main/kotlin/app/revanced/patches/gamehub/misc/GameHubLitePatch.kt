package app.revanced.patches.gamehub.misc

import app.revanced.patcher.patch.resourcePatch
import app.revanced.patches.gamehub.telemetry.disableAllTelemetryPatch

import org.w3c.dom.Element
import app.revanced.patches.gamehub.shared.ManifestUtils

/**
 * Main patch that transforms GameHub into GameHub Lite.
 *
 * This patch:
 * - Changes package name to gamehub.lite for side-by-side installation
 * - Removes all telemetry and tracking
 * - Removes unnecessary permissions
 * - Removes tracking SDK native libraries
 * - Updates app branding
 */
val gameHubLitePatch = resourcePatch(
    name = "GameHub Lite",
    description = "Transform GameHub into a privacy-focused lightweight version",
) {
    compatibleWith("com.xiaoji.egggame"("5.3.5"))

    dependsOn(
        disableAllTelemetryPatch,
        removeTrackingSdksPatch,
    )

    execute {
        // Change package name in AndroidManifest.xml
        document("AndroidManifest.xml").use { document ->
            val manifest = document.getElementsByTagName("manifest").item(0) as Element

            // Change package name
            manifest.setAttribute("package", "gamehub.lite")

            // Strip split APK requirements to allow standalone install
            manifest.removeAttribute("android:isSplitRequired")
            manifest.removeAttribute("android:requiredSplitTypes")
            manifest.removeAttribute("android:splitTypes")

            // Update application attributes
            val application = document.getElementsByTagName("application").item(0) as Element

            // Add hardware acceleration
            application.setAttribute("android:hardwareAccelerated", "true")

            // 1. Remove Play Store splits metadata
            ManifestUtils.removeManifestTags(document, listOf("meta-data")) { tag ->
                val name = tag.getAttribute("android:name")
                name.startsWith("com.android.vending.splits") || name.startsWith("com.android.vending.derived")
            }

            // 2. Remove PairIP DRM components
            ManifestUtils.removeManifestTags(document, listOf("activity", "service", "provider", "receiver")) { tag ->
                tag.getAttribute("android:name").startsWith("com.pairip.")
            }

            // 3. Remove Check License permission
            ManifestUtils.removeManifestTags(document, listOf("uses-permission")) { tag ->
                tag.getAttribute("android:name") == "com.android.vending.CHECK_LICENSE"
            }
        }

        // Update string resources if needed
        document("res/values/strings.xml").use { document ->
            val strings = document.getElementsByTagName("string")
            for (i in 0 until strings.length) {
                val string = strings.item(i) as Element
                val name = string.getAttribute("name")
                if (name == "app_name") {
                    string.textContent = "GameHub Lite"
                }
            }
        }
    }
}
