package app.revanced.patches.gamehub.misc

import app.revanced.patcher.patch.resourcePatch
import app.revanced.patches.gamehub.telemetry.disableAllTelemetryPatch

import org.w3c.dom.Element

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

            // Remove Play Store splits metadata
            val metaDataTags = document.getElementsByTagName("meta-data")
            val tagsToRemove = mutableListOf<Element>()
            for (i in 0 until metaDataTags.length) {
                val tag = metaDataTags.item(i) as Element
                val name = tag.getAttribute("android:name")
                if (name.startsWith("com.android.vending.splits") || name.startsWith("com.android.vending.derived")) {
                    tagsToRemove.add(tag)
                }
            }
            for (tag in tagsToRemove) {
                tag.parentNode.removeChild(tag)
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
