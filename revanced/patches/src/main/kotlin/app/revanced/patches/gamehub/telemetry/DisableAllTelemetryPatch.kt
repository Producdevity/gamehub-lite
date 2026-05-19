package app.revanced.patches.gamehub.telemetry

import app.revanced.patcher.extensions.InstructionExtensions.addInstructions
import app.revanced.patcher.extensions.InstructionExtensions.getInstruction
import app.revanced.patcher.extensions.InstructionExtensions.removeInstruction
import app.revanced.patcher.patch.bytecodePatch
import app.revanced.patcher.util.smali.ExternalLabel
import app.revanced.patches.gamehub.shared.*
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c

/**
 * Main patch that disables all telemetry and analytics services in GameHub.
 *
 * This patch targets:
 * - Umeng Analytics (Chinese analytics SDK)
 * - Firebase Analytics
 * - JPush (Chinese push notifications with tracking)
 * - Crash reporting services
 */
val disableAllTelemetryPatch = bytecodePatch(
    name = "Disable All Telemetry",
    description = "Removes all tracking, analytics, and telemetry services from GameHub",
) {
    compatibleWith("com.xiaoji.egggame"("5.3.5"))

    dependsOn(disableJPushPatch)

    execute {
        // Patch App.onCreate() to skip analytics initialization
        // We need to find and remove/nop the calls to:
        // 1. IUmengService.a(context) - Umeng init
        // 2. FirebaseAuthLoginUtils.Companion.a(context) - Firebase init



        // Patch FirebaseAuthLoginUtils.Companion.a() to return immediately
        firebaseAuthInitFingerprint.method.addInstructions(
            0,
            "return-void"
        )
    }
}
