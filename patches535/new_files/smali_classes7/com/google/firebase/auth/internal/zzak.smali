.class final Lcom/google/firebase/auth/internal/zzak;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"

# interfaces
.implements Lcom/google/android/gms/tasks/Continuation;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/tasks/Continuation<",
        "Lcom/google/firebase/auth/AuthResult;",
        "Lcom/google/android/gms/tasks/Task<",
        "Lcom/google/firebase/auth/AuthResult;",
        ">;>;"
    }
.end annotation


# instance fields
.field private final synthetic zza:Lcom/google/firebase/auth/internal/zzal;


# direct methods
.method public constructor <init>(Lcom/google/firebase/auth/internal/zzal;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzak;->zza:Lcom/google/firebase/auth/internal/zzal;

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    return-void
.end method


# virtual methods
.method public final synthetic then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 2
    .param p1    # Lcom/google/android/gms/tasks/Task;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzak;->zza:Lcom/google/firebase/auth/internal/zzal;

    .line 3
    invoke-static {v0}, Lcom/google/firebase/auth/internal/zzal;->zza(Lcom/google/firebase/auth/internal/zzal;)Lcom/google/firebase/auth/zze;

    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 9
    return-object p1

    .line 10
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 16
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/google/firebase/auth/AuthResult;

    .line 22
    new-instance v0, Lcom/google/firebase/auth/internal/zzz;

    .line 24
    invoke-interface {p1}, Lcom/google/firebase/auth/AuthResult;->getUser()Lcom/google/firebase/auth/FirebaseUser;

    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Lcom/google/firebase/auth/internal/zzaf;

    .line 30
    invoke-interface {p1}, Lcom/google/firebase/auth/AuthResult;->getAdditionalUserInfo()Lcom/google/firebase/auth/AdditionalUserInfo;

    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lcom/google/firebase/auth/internal/zzx;

    .line 36
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzak;->zza:Lcom/google/firebase/auth/internal/zzal;

    .line 38
    invoke-static {p0}, Lcom/google/firebase/auth/internal/zzal;->zza(Lcom/google/firebase/auth/internal/zzal;)Lcom/google/firebase/auth/zze;

    .line 41
    move-result-object p0

    .line 42
    invoke-direct {v0, v1, p1, p0}, Lcom/google/firebase/auth/internal/zzz;-><init>(Lcom/google/firebase/auth/internal/zzaf;Lcom/google/firebase/auth/internal/zzx;Lcom/google/firebase/auth/zze;)V

    .line 45
    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    .line 53
    move-result-object p1

    .line 54
    instance-of v0, p1, Lcom/google/firebase/auth/FirebaseAuthUserCollisionException;

    .line 56
    if-eqz v0, :cond_2

    .line 58
    move-object v0, p1

    .line 59
    check-cast v0, Lcom/google/firebase/auth/FirebaseAuthUserCollisionException;

    .line 61
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzak;->zza:Lcom/google/firebase/auth/internal/zzal;

    .line 63
    invoke-static {p0}, Lcom/google/firebase/auth/internal/zzal;->zza(Lcom/google/firebase/auth/internal/zzal;)Lcom/google/firebase/auth/zze;

    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {v0, p0}, Lcom/google/firebase/auth/FirebaseAuthUserCollisionException;->zza(Lcom/google/firebase/auth/AuthCredential;)Lcom/google/firebase/auth/FirebaseAuthUserCollisionException;

    .line 70
    :cond_2
    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    .line 73
    move-result-object p0

    .line 74
    return-object p0
.end method
