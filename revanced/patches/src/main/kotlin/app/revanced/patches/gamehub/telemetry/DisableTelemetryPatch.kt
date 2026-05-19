package app.revanced.patches.gamehub.telemetry

import app.revanced.patcher.extensions.InstructionExtensions.addInstructions
import app.revanced.patcher.extensions.InstructionExtensions.removeInstructions
import app.revanced.patcher.patch.bytecodePatch
import app.revanced.patches.gamehub.shared.jpushInitFingerprint
import app.revanced.patches.gamehub.shared.pushAppInitFingerprint

/**
 * Disables JPush push notification service initialization.
 * JPush is a Chinese push notification SDK that includes tracking capabilities.
 */
val disableJPushPatch = bytecodePatch(
    name = "Disable JPush",
    description = "Disables JPush push notification service and its tracking",
) {
    compatibleWith("com.xiaoji.egggame"("5.3.5"))

    execute {
        // Method 1: Make JPushInterface.init() return immediately
        jpushInitFingerprint.method.addInstructions(
            0,
            "return-void"
        )

        // Method 2: Make PushApp.b() return immediately
        pushAppInitFingerprint.method.addInstructions(
            0,
            "return-void"
        )
    }
}
