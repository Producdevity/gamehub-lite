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

    invoke-static {p0}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    instance-of v0, p0, Lcom/google/firebase/auth/GoogleAuthCredential;

    if-eqz v0, :cond_0

    check-cast p0, Lcom/google/firebase/auth/GoogleAuthCredential;

    invoke-static {p0, p1}, Lcom/google/firebase/auth/GoogleAuthCredential;->zza(Lcom/google/firebase/auth/GoogleAuthCredential;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzajb;

    move-result-object p0

    return-object p0

    :cond_0
    instance-of v0, p0, Lcom/google/firebase/auth/FacebookAuthCredential;

    if-eqz v0, :cond_1

    check-cast p0, Lcom/google/firebase/auth/FacebookAuthCredential;

    invoke-static {p0, p1}, Lcom/google/firebase/auth/FacebookAuthCredential;->zza(Lcom/google/firebase/auth/FacebookAuthCredential;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzajb;

    move-result-object p0

    return-object p0

    :cond_1
    instance-of v0, p0, Lcom/google/firebase/auth/TwitterAuthCredential;

    if-eqz v0, :cond_2

    check-cast p0, Lcom/google/firebase/auth/TwitterAuthCredential;

    invoke-static {p0, p1}, Lcom/google/firebase/auth/TwitterAuthCredential;->zza(Lcom/google/firebase/auth/TwitterAuthCredential;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzajb;

    move-result-object p0

    return-object p0

    :cond_2
    instance-of v0, p0, Lcom/google/firebase/auth/GithubAuthCredential;

    if-eqz v0, :cond_3

    check-cast p0, Lcom/google/firebase/auth/GithubAuthCredential;

    invoke-static {p0, p1}, Lcom/google/firebase/auth/GithubAuthCredential;->zza(Lcom/google/firebase/auth/GithubAuthCredential;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzajb;

    move-result-object p0

    return-object p0

    :cond_3
    instance-of v0, p0, Lcom/google/firebase/auth/PlayGamesAuthCredential;

    if-eqz v0, :cond_4

    check-cast p0, Lcom/google/firebase/auth/PlayGamesAuthCredential;

    invoke-static {p0, p1}, Lcom/google/firebase/auth/PlayGamesAuthCredential;->zza(Lcom/google/firebase/auth/PlayGamesAuthCredential;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzajb;

    move-result-object p0

    return-object p0

    :cond_4
    instance-of v0, p0, Lcom/google/firebase/auth/zze;

    if-eqz v0, :cond_5

    check-cast p0, Lcom/google/firebase/auth/zze;

    invoke-static {p0, p1}, Lcom/google/firebase/auth/zze;->zza(Lcom/google/firebase/auth/zze;Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzajb;

    move-result-object p0

    return-object p0

    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Unsupported credential type."

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
