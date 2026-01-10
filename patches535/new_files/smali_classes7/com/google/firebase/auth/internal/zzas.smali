.class final Lcom/google/firebase/auth/internal/zzas;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"

# interfaces
.implements Lcom/google/android/gms/tasks/OnFailureListener;


# instance fields
.field private final synthetic zza:Lcom/google/firebase/auth/internal/zzat;


# direct methods
.method public constructor <init>(Lcom/google/firebase/auth/internal/zzat;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzas;->zza:Lcom/google/firebase/auth/internal/zzat;

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    return-void
.end method


# virtual methods
.method public final onFailure(Ljava/lang/Exception;)V
    .locals 2

    .line 1
    instance-of p1, p1, Lcom/google/firebase/FirebaseNetworkException;

    .line 3
    if-eqz p1, :cond_0

    .line 5
    invoke-static {}, Lcom/google/firebase/auth/internal/zzaq;->zza()Lcom/google/android/gms/common/logging/Logger;

    .line 8
    move-result-object p1

    .line 9
    const/4 v0, 0x0

    .line 10
    new-array v0, v0, [Ljava/lang/Object;

    .line 12
    const-string v1, "Failure to refresh token; scheduling refresh after failure"

    .line 14
    invoke-virtual {p1, v1, v0}, Lcom/google/android/gms/common/logging/Logger;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 17
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzas;->zza:Lcom/google/firebase/auth/internal/zzat;

    .line 19
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzat;->zza:Lcom/google/firebase/auth/internal/zzaq;

    .line 21
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/zzaq;->zzd()V

    .line 24
    :cond_0
    return-void
.end method
