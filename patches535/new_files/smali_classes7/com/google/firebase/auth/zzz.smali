.class final Lcom/google/firebase/auth/zzz;
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
.field private final synthetic zza:Ljava/lang/String;

.field private final synthetic zzb:Z

.field private final synthetic zzc:Lcom/google/firebase/auth/FirebaseUser;

.field private final synthetic zzd:Ljava/lang/String;

.field private final synthetic zze:Ljava/lang/String;

.field private final synthetic zzf:Lcom/google/firebase/auth/FirebaseAuth;


# direct methods
.method public constructor <init>(Lcom/google/firebase/auth/FirebaseAuth;Ljava/lang/String;ZLcom/google/firebase/auth/FirebaseUser;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p2, p0, Lcom/google/firebase/auth/zzz;->zza:Ljava/lang/String;

    .line 3
    iput-boolean p3, p0, Lcom/google/firebase/auth/zzz;->zzb:Z

    .line 5
    iput-object p4, p0, Lcom/google/firebase/auth/zzz;->zzc:Lcom/google/firebase/auth/FirebaseUser;

    .line 7
    iput-object p5, p0, Lcom/google/firebase/auth/zzz;->zzd:Ljava/lang/String;

    .line 9
    iput-object p6, p0, Lcom/google/firebase/auth/zzz;->zze:Ljava/lang/String;

    .line 11
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    iput-object p1, p0, Lcom/google/firebase/auth/zzz;->zzf:Lcom/google/firebase/auth/FirebaseAuth;

    .line 16
    invoke-direct {p0}, Lcom/google/firebase/auth/internal/zzbo;-><init>()V

    .line 19
    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)Lcom/google/android/gms/tasks/Task;
    .locals 9
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
    iget-object v0, p0, Lcom/google/firebase/auth/zzz;->zza:Ljava/lang/String;

    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    .line 13
    const-string v3, "Logging in as "

    .line 15
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    const-string v0, " with empty reCAPTCHA token"

    .line 23
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    move-result-object v0

    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/google/firebase/auth/zzz;->zza:Ljava/lang/String;

    .line 36
    new-instance v2, Ljava/lang/StringBuilder;

    .line 38
    const-string v3, "Got reCAPTCHA token for login with email "

    .line 40
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    move-result-object v0

    .line 50
    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    :goto_0
    iget-boolean v0, p0, Lcom/google/firebase/auth/zzz;->zzb:Z

    .line 55
    if-eqz v0, :cond_1

    .line 57
    iget-object v0, p0, Lcom/google/firebase/auth/zzz;->zzf:Lcom/google/firebase/auth/FirebaseAuth;

    .line 59
    iget-object v1, v0, Lcom/google/firebase/auth/FirebaseAuth;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzacq;

    .line 61
    invoke-static {v0}, Lcom/google/firebase/auth/FirebaseAuth;->zza(Lcom/google/firebase/auth/FirebaseAuth;)Lcom/google/firebase/FirebaseApp;

    .line 64
    move-result-object v2

    .line 65
    iget-object v0, p0, Lcom/google/firebase/auth/zzz;->zzc:Lcom/google/firebase/auth/FirebaseUser;

    .line 67
    invoke-static {v0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    move-result-object v0

    .line 71
    move-object v3, v0

    .line 72
    check-cast v3, Lcom/google/firebase/auth/FirebaseUser;

    .line 74
    iget-object v4, p0, Lcom/google/firebase/auth/zzz;->zza:Ljava/lang/String;

    .line 76
    iget-object v5, p0, Lcom/google/firebase/auth/zzz;->zzd:Ljava/lang/String;

    .line 78
    iget-object v6, p0, Lcom/google/firebase/auth/zzz;->zze:Ljava/lang/String;

    .line 80
    new-instance v8, Lcom/google/firebase/auth/FirebaseAuth$zzb;

    .line 82
    iget-object p0, p0, Lcom/google/firebase/auth/zzz;->zzf:Lcom/google/firebase/auth/FirebaseAuth;

    .line 84
    invoke-direct {v8, p0}, Lcom/google/firebase/auth/FirebaseAuth$zzb;-><init>(Lcom/google/firebase/auth/FirebaseAuth;)V

    .line 87
    move-object v7, p1

    .line 88
    invoke-virtual/range {v1 .. v8}, Lcom/google/android/gms/internal/firebase-auth-api/zzacq;->zzb(Lcom/google/firebase/FirebaseApp;Lcom/google/firebase/auth/FirebaseUser;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/firebase/auth/internal/zzcf;)Lcom/google/android/gms/tasks/Task;

    .line 91
    move-result-object p0

    .line 92
    return-object p0

    .line 93
    :cond_1
    move-object v5, p1

    .line 94
    iget-object p1, p0, Lcom/google/firebase/auth/zzz;->zzf:Lcom/google/firebase/auth/FirebaseAuth;

    .line 96
    iget-object v0, p1, Lcom/google/firebase/auth/FirebaseAuth;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzacq;

    .line 98
    invoke-static {p1}, Lcom/google/firebase/auth/FirebaseAuth;->zza(Lcom/google/firebase/auth/FirebaseAuth;)Lcom/google/firebase/FirebaseApp;

    .line 101
    move-result-object v1

    .line 102
    iget-object v2, p0, Lcom/google/firebase/auth/zzz;->zza:Ljava/lang/String;

    .line 104
    iget-object v3, p0, Lcom/google/firebase/auth/zzz;->zzd:Ljava/lang/String;

    .line 106
    iget-object v4, p0, Lcom/google/firebase/auth/zzz;->zze:Ljava/lang/String;

    .line 108
    new-instance v6, Lcom/google/firebase/auth/FirebaseAuth$zza;

    .line 110
    iget-object p0, p0, Lcom/google/firebase/auth/zzz;->zzf:Lcom/google/firebase/auth/FirebaseAuth;

    .line 112
    invoke-direct {v6, p0}, Lcom/google/firebase/auth/FirebaseAuth$zza;-><init>(Lcom/google/firebase/auth/FirebaseAuth;)V

    .line 115
    invoke-virtual/range {v0 .. v6}, Lcom/google/android/gms/internal/firebase-auth-api/zzacq;->zzb(Lcom/google/firebase/FirebaseApp;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/firebase/auth/internal/zzl;)Lcom/google/android/gms/tasks/Task;

    .line 118
    move-result-object p0

    .line 119
    return-object p0
.end method
