.class public Lcom/google/firebase/FirebaseError;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"


# annotations
.annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
.end annotation


# static fields
.field public static final ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL:I = 0x4274
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_APP_NOT_AUTHORIZED:I = 0x4284
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_CREDENTIAL_ALREADY_IN_USE:I = 0x4281
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_CUSTOM_TOKEN_MISMATCH:I = 0x426a
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_EMAIL_ALREADY_IN_USE:I = 0x426f
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_INTERNAL_ERROR:I = 0x445b
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_INVALID_API_KEY:I = 0x427f
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_INVALID_CREDENTIAL:I = 0x426c
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_INVALID_CUSTOM_TOKEN:I = 0x4268
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_INVALID_EMAIL:I = 0x4270
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_INVALID_USER_TOKEN:I = 0x4279
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_NETWORK_REQUEST_FAILED:I = 0x427c
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_NO_SIGNED_IN_USER:I = 0x4457
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_NO_SUCH_PROVIDER:I = 0x4278
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_OPERATION_NOT_ALLOWED:I = 0x426e
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_PROVIDER_ALREADY_LINKED:I = 0x4277
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_REQUIRES_RECENT_LOGIN:I = 0x4276
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_TOO_MANY_REQUESTS:I = 0x4272
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_USER_DISABLED:I = 0x426d
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_USER_MISMATCH:I = 0x4280
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_USER_NOT_FOUND:I = 0x4273
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_USER_TOKEN_EXPIRED:I = 0x427d
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_WEAK_PASSWORD:I = 0x4282
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field

.field public static final ERROR_WRONG_PASSWORD:I = 0x4271
    .annotation build Lcom/google/android/gms/common/annotation/KeepForSdk;
    .end annotation
.end field


# instance fields
.field private errorCode:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput p1, p0, Lcom/google/firebase/FirebaseError;->errorCode:I

    .line 6
    return-void
.end method


# virtual methods
.method public getErrorCode()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/firebase/FirebaseError;->errorCode:I

    .line 3
    return p0
.end method
