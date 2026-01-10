.class public final synthetic Lcom/google/firebase/auth/internal/zzbr;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"

# interfaces
.implements Lcom/google/android/gms/tasks/Continuation;


# instance fields
.field private synthetic zza:Lcom/google/android/recaptcha/RecaptchaAction;

.field private synthetic zzb:Lcom/google/firebase/auth/FirebaseAuth;

.field private synthetic zzc:Ljava/lang/String;

.field private synthetic zzd:Lcom/google/android/gms/tasks/Continuation;


# direct methods
.method public synthetic constructor <init>(Lcom/google/android/recaptcha/RecaptchaAction;Lcom/google/firebase/auth/FirebaseAuth;Ljava/lang/String;Lcom/google/android/gms/tasks/Continuation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzbr;->zza:Lcom/google/android/recaptcha/RecaptchaAction;

    .line 6
    iput-object p2, p0, Lcom/google/firebase/auth/internal/zzbr;->zzb:Lcom/google/firebase/auth/FirebaseAuth;

    .line 8
    iput-object p3, p0, Lcom/google/firebase/auth/internal/zzbr;->zzc:Ljava/lang/String;

    .line 10
    iput-object p4, p0, Lcom/google/firebase/auth/internal/zzbr;->zzd:Lcom/google/android/gms/tasks/Continuation;

    .line 12
    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzbr;->zza:Lcom/google/android/recaptcha/RecaptchaAction;

    .line 3
    iget-object v1, p0, Lcom/google/firebase/auth/internal/zzbr;->zzb:Lcom/google/firebase/auth/FirebaseAuth;

    .line 5
    iget-object v2, p0, Lcom/google/firebase/auth/internal/zzbr;->zzc:Ljava/lang/String;

    .line 7
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzbr;->zzd:Lcom/google/android/gms/tasks/Continuation;

    .line 9
    invoke-static {v0, v1, v2, p0, p1}, Lcom/google/firebase/auth/internal/zzbo;->zza(Lcom/google/android/recaptcha/RecaptchaAction;Lcom/google/firebase/auth/FirebaseAuth;Ljava/lang/String;Lcom/google/android/gms/tasks/Continuation;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;

    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
