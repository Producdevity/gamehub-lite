.class final Lcom/google/firebase/auth/internal/zzcd;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"

# interfaces
.implements Lcom/google/android/gms/common/api/internal/BackgroundDetector$BackgroundStateChangeListener;


# instance fields
.field private final synthetic zza:Lcom/google/firebase/auth/internal/zzca;


# direct methods
.method public constructor <init>(Lcom/google/firebase/auth/internal/zzca;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzcd;->zza:Lcom/google/firebase/auth/internal/zzca;

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    return-void
.end method


# virtual methods
.method public final onBackgroundStateChanged(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 3
    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzcd;->zza:Lcom/google/firebase/auth/internal/zzca;

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p1, v0}, Lcom/google/firebase/auth/internal/zzca;->zza(Lcom/google/firebase/auth/internal/zzca;Z)V

    .line 9
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzcd;->zza:Lcom/google/firebase/auth/internal/zzca;

    .line 11
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/zzca;->zza()V

    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzcd;->zza:Lcom/google/firebase/auth/internal/zzca;

    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-static {p1, v0}, Lcom/google/firebase/auth/internal/zzca;->zza(Lcom/google/firebase/auth/internal/zzca;Z)V

    .line 21
    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzcd;->zza:Lcom/google/firebase/auth/internal/zzca;

    .line 23
    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzca;->zzb(Lcom/google/firebase/auth/internal/zzca;)Z

    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 29
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzcd;->zza:Lcom/google/firebase/auth/internal/zzca;

    .line 31
    invoke-static {p0}, Lcom/google/firebase/auth/internal/zzca;->zza(Lcom/google/firebase/auth/internal/zzca;)Lcom/google/firebase/auth/internal/zzaq;

    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/zzaq;->zzc()V

    .line 38
    :cond_1
    return-void
.end method
