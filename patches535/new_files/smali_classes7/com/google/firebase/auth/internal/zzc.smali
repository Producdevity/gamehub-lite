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

    iput-object p2, p0, Lcom/google/firebase/auth/internal/zzc;->zza:Lcom/google/firebase/auth/FirebaseAuth;

    iput-object p3, p0, Lcom/google/firebase/auth/internal/zzc;->zzb:Ljava/lang/String;

    iput-object p4, p0, Lcom/google/firebase/auth/internal/zzc;->zzc:Landroid/app/Activity;

    iput-boolean p5, p0, Lcom/google/firebase/auth/internal/zzc;->zzd:Z

    iput-boolean p6, p0, Lcom/google/firebase/auth/internal/zzc;->zze:Z

    iput-object p7, p0, Lcom/google/firebase/auth/internal/zzc;->zzf:Lcom/google/firebase/auth/internal/zzcg;

    iput-object p8, p0, Lcom/google/firebase/auth/internal/zzc;->zzg:Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzc;->zzh:Lcom/google/firebase/auth/internal/zzb;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onFailure(Ljava/lang/Exception;)V
    .locals 8
    .param p1    # Ljava/lang/Exception;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {}, Lcom/google/firebase/auth/internal/zzb;->zzb()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Failed to get reCAPTCHA enterprise token: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\n\n Using fallback methods."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzc;->zza:Lcom/google/firebase/auth/FirebaseAuth;

    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseAuth;->zzb()Lcom/google/firebase/auth/internal/zzbx;

    move-result-object p1

    const-string v0, "PHONE_PROVIDER"

    invoke-virtual {p1, v0}, Lcom/google/firebase/auth/internal/zzbx;->zza(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzc;->zzh:Lcom/google/firebase/auth/internal/zzb;

    iget-object v1, p0, Lcom/google/firebase/auth/internal/zzc;->zza:Lcom/google/firebase/auth/FirebaseAuth;

    iget-object v2, p0, Lcom/google/firebase/auth/internal/zzc;->zzb:Ljava/lang/String;

    iget-object v3, p0, Lcom/google/firebase/auth/internal/zzc;->zzc:Landroid/app/Activity;

    iget-boolean v4, p0, Lcom/google/firebase/auth/internal/zzc;->zzd:Z

    iget-boolean v5, p0, Lcom/google/firebase/auth/internal/zzc;->zze:Z

    iget-object v6, p0, Lcom/google/firebase/auth/internal/zzc;->zzf:Lcom/google/firebase/auth/internal/zzcg;

    iget-object v7, p0, Lcom/google/firebase/auth/internal/zzc;->zzg:Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-static/range {v0 .. v7}, Lcom/google/firebase/auth/internal/zzb;->zza(Lcom/google/firebase/auth/internal/zzb;Lcom/google/firebase/auth/FirebaseAuth;Ljava/lang/String;Landroid/app/Activity;ZZLcom/google/firebase/auth/internal/zzcg;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    return-void

    :cond_0
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzc;->zzg:Lcom/google/android/gms/tasks/TaskCompletionSource;

    new-instance p1, Lcom/google/firebase/auth/internal/zzm;

    invoke-direct {p1}, Lcom/google/firebase/auth/internal/zzm;-><init>()V

    invoke-virtual {p1}, Lcom/google/firebase/auth/internal/zzi;->zza()Lcom/google/firebase/auth/internal/zzj;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    return-void
.end method
