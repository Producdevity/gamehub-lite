package app.revanced.patches.gamehub.shared

import app.revanced.patcher.fingerprint

/**
 * Fingerprint for App.onCreate() method
 * This is the main entry point where analytics services are initialized
 */
internal val appOnCreateFingerprint = fingerprint {
    returns("V")
    parameters()
    custom { method, classDef ->
        classDef.type == "Lcom/xj/app/App;" && method.name == "onCreate"
    }
}

/**
 * Fingerprint for PushApp.b(Application) - JPush initialization
 */
internal val pushAppInitFingerprint = fingerprint {
    returns("V")
    parameters("Landroid/app/Application;")
    custom { method, classDef ->
        classDef.type == "Lcom/xj/push/PushApp;" && method.name == "b"
    }
}

/**
 * Fingerprint for JPushInterface.init() call
 */
internal val jpushInitFingerprint = fingerprint {
    returns("V")
    parameters("Landroid/content/Context;", "Lcn/jpush/android/data/JPushConfig;")
    custom { method, classDef ->
        classDef.type == "Lcn/jpush/android/api/JPushInterface;" && method.name == "init"
    }
}

/**
 * Fingerprint for IUmengService.a(Context) - Umeng initialization
 */
internal val umengServiceInitFingerprint = fingerprint {
    returns("V")
    parameters("Landroid/content/Context;")
    custom { method, classDef ->
        classDef.type == "Lcom/xj/common/service/IUmengService;" && method.name == "a"
    }
}

/**
 * Fingerprint for FirebaseAuthLoginUtils.Companion.a(Context)
 */
internal val firebaseAuthInitFingerprint = fingerprint {
    returns("V")
    parameters("Landroid/content/Context;")
    custom { method, classDef ->
        classDef.type == "Lcom/xj/landscape/launcher/firebase/FirebaseAuthLoginUtils\$Companion;" &&
            method.name == "a"
    }
}

/**
 * Fingerprint for CommonApp.Companion.i() initialization
 */
internal val commonAppInitFingerprint = fingerprint {
    returns("V")
    parameters("Z", "Ljava/lang/String;", "Ljava/lang/String;")
    custom { method, classDef ->
        classDef.type == "Lcom/xj/common/CommonApp\$Companion;" && method.name == "i"
    }
}
