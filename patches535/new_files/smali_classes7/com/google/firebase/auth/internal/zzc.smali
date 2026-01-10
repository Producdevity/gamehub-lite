.class final Lcom/google/firebase/auth/internal/zzc;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"

# interfaces
.implements Lcom/google/android/gms/tasks/OnFailureListener;


# instance fields
.field private final synthetic zza:Lcom/google/firebase/auth/FirebaseAuth;

.field private final synthetic zzb:Ljava/lang/String;

.field private final synthetic zzc:Landroid/app/Activity;

.field private final synthetic zzd:Z

.field private final synthetic zze:Z

.field private final synthetic zzf:Lcom/google/firebase/auth/internal/zzcg;

.field private final synthetic zzg:Lcom/google/android/gms/tasks/TaskCompletionSource;

.field private final synthetic zzh:Lcom/google/firebase/auth/internal/zzb;


# direct methods
.method public constructor <init>(Lcom/google/firebase/auth/internal/zzb;Lcom/google/firebase/auth/FirebaseAuth;Ljava/lang/String;Landroid/app/Activity;ZZLcom/google/firebase/auth/internal/zzcg;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/google/firebase/auth/internal/zzc;->zza:Lcom/google/firebase/auth/FirebaseAuth;

    .line 3
    iput-object p3, p0, Lcom/google/firebase/auth/internal/zzc;->zzb:Ljava/lang/String;

    .line 5
    iput-object p4, p0, Lcom/google/firebase/auth/internal/zzc;->zzc:Landroid/app/Activity;

    .line 7
    iput-boolean p5, p0, Lcom/google/firebase/auth/internal/zzc;->zzd:Z

    .line 9
    iput-boolean p6, p0, Lcom/google/firebase/auth/internal/zzc;->zze:Z

    .line 11
    iput-object p7, p0, Lcom/google/firebase/auth/internal/zzc;->zzf:Lcom/google/firebase/auth/internal/zzcg;

    .line 13
    iput-object p8, p0, Lcom/google/firebase/auth/internal/zzc;->zzg:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 15
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzc;->zzh:Lcom/google/firebase/auth/internal/zzb;

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    return-void
.end method


# virtual methods
.method public final onFailure(Ljava/lang/Exception;)V
    .locals 8
    .param p1    # Ljava/lang/Exception;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Lcom/google/firebase/auth/internal/zzb;->zzb()Ljava/lang/String;

    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 8
    move-result-object p1

    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    const-string v2, "Failed to get reCAPTCHA enterprise token: "

    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    const-string p1, "\n\n Using fallback methods."

    .line 21
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    move-result-object p1

    .line 28
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzc;->zza:Lcom/google/firebase/auth/FirebaseAuth;

    .line 33
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseAuth;->zzb()Lcom/google/firebase/auth/internal/zzbx;

    .line 36
    move-result-object p1

    .line 37
    const-string v0, "PHONE_PROVIDER"

    .line 39
    invoke-virtual {p1, v0}, Lcom/google/firebase/auth/internal/zzbx;->zza(Ljava/lang/String;)Z

    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_0

    .line 45
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzc;->zzh:Lcom/google/firebase/auth/internal/zzb;

    .line 47
    iget-object v1, p0, Lcom/google/firebase/auth/internal/zzc;->zza:Lcom/google/firebase/auth/FirebaseAuth;

    .line 49
    iget-object v2, p0, Lcom/google/firebase/auth/internal/zzc;->zzb:Ljava/lang/String;

    .line 51
    iget-object v3, p0, Lcom/google/firebase/auth/internal/zzc;->zzc:Landroid/app/Activity;

    .line 53
    iget-boolean v4, p0, Lcom/google/firebase/auth/internal/zzc;->zzd:Z

    .line 55
    iget-boolean v5, p0, Lcom/google/firebase/auth/internal/zzc;->zze:Z

    .line 57
    iget-object v6, p0, Lcom/google/firebase/auth/internal/zzc;->zzf:Lcom/google/firebase/auth/internal/zzcg;

    .line 59
    iget-object v7, p0, Lcom/google/firebase/auth/internal/zzc;->zzg:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 61
    invoke-static/range {v0 .. v7}, Lcom/google/firebase/auth/internal/zzb;->zza(Lcom/google/firebase/auth/internal/zzb;Lcom/google/firebase/auth/FirebaseAuth;Ljava/lang/String;Landroid/app/Activity;ZZLcom/google/firebase/auth/internal/zzcg;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    .line 64
    return-void

    .line 65
    :cond_0
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzc;->zzg:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 67
    new-instance p1, Lcom/google/firebase/auth/internal/zzm;

    .line 69
    invoke-direct {p1}, Lcom/google/firebase/auth/internal/zzm;-><init>()V

    .line 72
    invoke-virtual {p1}, Lcom/google/firebase/auth/internal/zzi;->zza()Lcom/google/firebase/auth/internal/zzj;

    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    .line 79
    return-void
.end method
