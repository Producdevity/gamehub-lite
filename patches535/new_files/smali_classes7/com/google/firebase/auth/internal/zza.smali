.class public final synthetic Lcom/google/firebase/auth/internal/zza;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# instance fields
.field private synthetic zza:Lcom/google/firebase/auth/internal/zzb;

.field private synthetic zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

.field private synthetic zzc:Lcom/google/firebase/auth/FirebaseAuth;

.field private synthetic zzd:Lcom/google/android/recaptcha/RecaptchaAction;

.field private synthetic zze:Ljava/lang/String;

.field private synthetic zzf:Landroid/app/Activity;

.field private synthetic zzg:Z

.field private synthetic zzh:Z

.field private synthetic zzi:Lcom/google/firebase/auth/internal/zzcg;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/auth/internal/zzb;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseAuth;Lcom/google/android/recaptcha/RecaptchaAction;Ljava/lang/String;Landroid/app/Activity;ZZLcom/google/firebase/auth/internal/zzcg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput-object p1, p0, Lcom/google/firebase/auth/internal/zza;->zza:Lcom/google/firebase/auth/internal/zzb;

    .line 6
    iput-object p2, p0, Lcom/google/firebase/auth/internal/zza;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 8
    iput-object p3, p0, Lcom/google/firebase/auth/internal/zza;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    .line 10
    iput-object p4, p0, Lcom/google/firebase/auth/internal/zza;->zzd:Lcom/google/android/recaptcha/RecaptchaAction;

    .line 12
    iput-object p5, p0, Lcom/google/firebase/auth/internal/zza;->zze:Ljava/lang/String;

    .line 14
    iput-object p6, p0, Lcom/google/firebase/auth/internal/zza;->zzf:Landroid/app/Activity;

    .line 16
    iput-boolean p7, p0, Lcom/google/firebase/auth/internal/zza;->zzg:Z

    .line 18
    iput-boolean p8, p0, Lcom/google/firebase/auth/internal/zza;->zzh:Z

    .line 20
    iput-object p9, p0, Lcom/google/firebase/auth/internal/zza;->zzi:Lcom/google/firebase/auth/internal/zzcg;

    .line 22
    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zza;->zza:Lcom/google/firebase/auth/internal/zzb;

    .line 3
    iget-object v1, p0, Lcom/google/firebase/auth/internal/zza;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 5
    iget-object v2, p0, Lcom/google/firebase/auth/internal/zza;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    .line 7
    iget-object v3, p0, Lcom/google/firebase/auth/internal/zza;->zzd:Lcom/google/android/recaptcha/RecaptchaAction;

    .line 9
    iget-object v4, p0, Lcom/google/firebase/auth/internal/zza;->zze:Ljava/lang/String;

    .line 11
    iget-object v5, p0, Lcom/google/firebase/auth/internal/zza;->zzf:Landroid/app/Activity;

    .line 13
    iget-boolean v6, p0, Lcom/google/firebase/auth/internal/zza;->zzg:Z

    .line 15
    iget-boolean v7, p0, Lcom/google/firebase/auth/internal/zza;->zzh:Z

    .line 17
    iget-object v8, p0, Lcom/google/firebase/auth/internal/zza;->zzi:Lcom/google/firebase/auth/internal/zzcg;

    .line 19
    move-object v9, p1

    .line 20
    invoke-static/range {v0 .. v9}, Lcom/google/firebase/auth/internal/zzb;->zza(Lcom/google/firebase/auth/internal/zzb;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseAuth;Lcom/google/android/recaptcha/RecaptchaAction;Ljava/lang/String;Landroid/app/Activity;ZZLcom/google/firebase/auth/internal/zzcg;Lcom/google/android/gms/tasks/Task;)V

    .line 23
    return-void
.end method
