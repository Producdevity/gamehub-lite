.class public final Lcom/google/firebase/auth/internal/zzk;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"


# direct methods
.method public static zza(Lcom/google/firebase/auth/AuthCredential;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzajb;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    instance-of v0, p0, Lcom/google/firebase/auth/GoogleAuthCredential;

    .line 6
    if-eqz v0, :cond_0

    .line 8
    check-cast p0, Lcom/google/firebase/auth/GoogleAuthCredential;

    .line 10
    invoke-static {p0, p1}, Lcom/google/firebase/auth/GoogleAuthCredential;->zza(Lcom/google/firebase/auth/GoogleAuthCredential;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzajb;

    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    instance-of v0, p0, Lcom/google/firebase/auth/FacebookAuthCredential;

    .line 17
    if-eqz v0, :cond_1

    .line 19
    check-cast p0, Lcom/google/firebase/auth/FacebookAuthCredential;

    .line 21
    invoke-static {p0, p1}, Lcom/google/firebase/auth/FacebookAuthCredential;->zza(Lcom/google/firebase/auth/FacebookAuthCredential;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzajb;

    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_1
    instance-of v0, p0, Lcom/google/firebase/auth/TwitterAuthCredential;

    .line 28
    if-eqz v0, :cond_2

    .line 30
    check-cast p0, Lcom/google/firebase/auth/TwitterAuthCredential;

    .line 32
    invoke-static {p0, p1}, Lcom/google/firebase/auth/TwitterAuthCredential;->zza(Lcom/google/firebase/auth/TwitterAuthCredential;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzajb;

    .line 35
    move-result-object p0

    .line 36
    return-object p0

    .line 37
    :cond_2
    instance-of v0, p0, Lcom/google/firebase/auth/GithubAuthCredential;

    .line 39
    if-eqz v0, :cond_3

    .line 41
    check-cast p0, Lcom/google/firebase/auth/GithubAuthCredential;

    .line 43
    invoke-static {p0, p1}, Lcom/google/firebase/auth/GithubAuthCredential;->zza(Lcom/google/firebase/auth/GithubAuthCredential;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzajb;

    .line 46
    move-result-object p0

    .line 47
    return-object p0

    .line 48
    :cond_3
    instance-of v0, p0, Lcom/google/firebase/auth/PlayGamesAuthCredential;

    .line 50
    if-eqz v0, :cond_4

    .line 52
    check-cast p0, Lcom/google/firebase/auth/PlayGamesAuthCredential;

    .line 54
    invoke-static {p0, p1}, Lcom/google/firebase/auth/PlayGamesAuthCredential;->zza(Lcom/google/firebase/auth/PlayGamesAuthCredential;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzajb;

    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_4
    instance-of v0, p0, Lcom/google/firebase/auth/zze;

    .line 61
    if-eqz v0, :cond_5

    .line 63
    check-cast p0, Lcom/google/firebase/auth/zze;

    .line 65
    invoke-static {p0, p1}, Lcom/google/firebase/auth/zze;->zza(Lcom/google/firebase/auth/zze;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzajb;

    .line 68
    move-result-object p0

    .line 69
    return-object p0

    .line 70
    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 72
    const-string p1, "Unsupported credential type."

    .line 74
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 77
    throw p0
.end method
