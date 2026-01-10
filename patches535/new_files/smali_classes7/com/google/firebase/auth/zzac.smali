.class final Lcom/google/firebase/auth/zzac;
.super Lcom/google/firebase/auth/internal/zzbo;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/firebase/auth/internal/zzbo<",
        "Lcom/google/firebase/auth/AuthResult;",
        ">;"
    }
.end annotation


# instance fields
.field private final synthetic zza:Z

.field private final synthetic zzb:Lcom/google/firebase/auth/FirebaseUser;

.field private final synthetic zzc:Lcom/google/firebase/auth/EmailAuthCredential;

.field private final synthetic zzd:Lcom/google/firebase/auth/FirebaseAuth;


# direct methods
.method public constructor <init>(Lcom/google/firebase/auth/FirebaseAuth;ZLcom/google/firebase/auth/FirebaseUser;Lcom/google/firebase/auth/EmailAuthCredential;)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Lcom/google/firebase/auth/zzac;->zza:Z

    .line 3
    iput-object p3, p0, Lcom/google/firebase/auth/zzac;->zzb:Lcom/google/firebase/auth/FirebaseUser;

    .line 5
    iput-object p4, p0, Lcom/google/firebase/auth/zzac;->zzc:Lcom/google/firebase/auth/EmailAuthCredential;

    .line 7
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    iput-object p1, p0, Lcom/google/firebase/auth/zzac;->zzd:Lcom/google/firebase/auth/FirebaseAuth;

    .line 12
    invoke-direct {p0}, Lcom/google/firebase/auth/internal/zzbo;-><init>()V

    .line 15
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/auth/AuthResult;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    move-result v0

    .line 5
    const-string v1, "FirebaseAuth"

    .line 7
    if-eqz v0, :cond_0

    .line 9
    const-string v0, "Email link login/reauth with empty reCAPTCHA token"

    .line 11
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string v0, "Got reCAPTCHA token for login/reauth with email link"

    .line 17
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    :goto_0
    iget-boolean v0, p0, Lcom/google/firebase/auth/zzac;->zza:Z

    .line 22
    if-eqz v0, :cond_1

    .line 24
    iget-object v0, p0, Lcom/google/firebase/auth/zzac;->zzd:Lcom/google/firebase/auth/FirebaseAuth;

    .line 26
    iget-object v1, v0, Lcom/google/firebase/auth/FirebaseAuth;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzacq;

    .line 28
    invoke-static {v0}, Lcom/google/firebase/auth/FirebaseAuth;->zza(Lcom/google/firebase/auth/FirebaseAuth;)Lcom/google/firebase/FirebaseApp;

    .line 31
    move-result-object v2

    .line 32
    iget-object v0, p0, Lcom/google/firebase/auth/zzac;->zzb:Lcom/google/firebase/auth/FirebaseUser;

    .line 34
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    move-result-object v0

    .line 38
    move-object v3, v0

    .line 39
    check-cast v3, Lcom/google/firebase/auth/FirebaseUser;

    .line 41
    iget-object v4, p0, Lcom/google/firebase/auth/zzac;->zzc:Lcom/google/firebase/auth/EmailAuthCredential;

    .line 43
    new-instance v6, Lcom/google/firebase/auth/FirebaseAuth$zzb;

    .line 45
    iget-object p0, p0, Lcom/google/firebase/auth/zzac;->zzd:Lcom/google/firebase/auth/FirebaseAuth;

    .line 47
    invoke-direct {v6, p0}, Lcom/google/firebase/auth/FirebaseAuth$zzb;-><init>(Lcom/google/firebase/auth/FirebaseAuth;)V

    .line 50
    move-object v5, p1

    .line 51
    invoke-virtual/range {v1 .. v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzacq;->zzb(Lcom/google/firebase/FirebaseApp;Lcom/google/firebase/auth/FirebaseUser;Lcom/google/firebase/auth/EmailAuthCredential;Ljava/lang/String;Lcom/google/firebase/auth/internal/zzcf;)Lcom/google/android/gms/tasks/Task;

    .line 54
    move-result-object p0

    .line 55
    return-object p0

    .line 56
    :cond_1
    move-object v5, p1

    .line 57
    iget-object p1, p0, Lcom/google/firebase/auth/zzac;->zzd:Lcom/google/firebase/auth/FirebaseAuth;

    .line 59
    iget-object v0, p1, Lcom/google/firebase/auth/FirebaseAuth;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzacq;

    .line 61
    invoke-static {p1}, Lcom/google/firebase/auth/FirebaseAuth;->zza(Lcom/google/firebase/auth/FirebaseAuth;)Lcom/google/firebase/FirebaseApp;

    .line 64
    move-result-object p1

    .line 65
    iget-object v1, p0, Lcom/google/firebase/auth/zzac;->zzc:Lcom/google/firebase/auth/EmailAuthCredential;

    .line 67
    new-instance v2, Lcom/google/firebase/auth/FirebaseAuth$zza;

    .line 69
    iget-object p0, p0, Lcom/google/firebase/auth/zzac;->zzd:Lcom/google/firebase/auth/FirebaseAuth;

    .line 71
    invoke-direct {v2, p0}, Lcom/google/firebase/auth/FirebaseAuth$zza;-><init>(Lcom/google/firebase/auth/FirebaseAuth;)V

    .line 74
    invoke-virtual {v0, p1, v1, v5, v2}, Lcom/google/android/gms/internal/firebase-auth-api/zzacq;->zza(Lcom/google/firebase/FirebaseApp;Lcom/google/firebase/auth/EmailAuthCredential;Ljava/lang/String;Lcom/google/firebase/auth/internal/zzl;)Lcom/google/android/gms/tasks/Task;

    .line 77
    move-result-object p0

    .line 78
    return-object p0
.end method
