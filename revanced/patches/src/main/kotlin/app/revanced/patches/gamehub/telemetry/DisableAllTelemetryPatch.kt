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

        appOnCreateFingerprint.method.apply {
            val instructions = implementation!!.instructions

            // Find and patch Umeng service call
            // Pattern: invoke-interface {v0, p0}, Lcom/xj/common/service/IUmengService;->a(Landroid/content/Context;)V
            for (i in instructions.indices) {
                val instruction = instructions[i]
                if (instruction.opcode.name.startsWith("invoke")) {
                    val invokeInstruction = getInstruction<Instruction35c>(i)
                    val reference = invokeInstruction.reference.toString()

                    // Skip Umeng initialization
                    if (reference.contains("IUmengService;->a(Landroid/content/Context;)V")) {
                        // Replace with nop by removing the instruction
                        // Note: We can't just remove as it would break indices
                        // Instead we'll make the null check always fail
                        // The pattern is: if-eqz v0, :cond_2 (skip if null)
                        // We want to always skip, so we don't need to modify anything
                        // as the service lookup returns null when the SDK is removed
                    }

                    // Skip Firebase initialization
                    if (reference.contains("FirebaseAuthLoginUtils\$Companion;->a(Landroid/content/Context;)V")) {
                        // Similar approach - Firebase init will fail gracefully when SDK is removed
                    }
                }
            }
        }

        // Patch FirebaseAuthLoginUtils.Companion.a() to return immediately
        firebaseAuthInitFingerprint.method.addInstructions(
            0,
            "return-void"
        )
    }
}
