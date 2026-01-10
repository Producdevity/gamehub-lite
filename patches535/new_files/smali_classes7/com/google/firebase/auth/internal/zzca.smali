.class public final Lcom/google/firebase/auth/internal/zzca;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"


# instance fields
.field private volatile zza:I

.field private final zzb:Lcom/google/firebase/auth/internal/zzaq;

.field private volatile zzc:Z


# direct methods
.method private constructor <init>(Landroid/content/Context;Lcom/google/firebase/auth/internal/zzaq;)V
    .locals 1
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 3
    iput-boolean v0, p0, Lcom/google/firebase/auth/internal/zzca;->zzc:Z

    .line 4
    iput v0, p0, Lcom/google/firebase/auth/internal/zzca;->zza:I

    .line 5
    iput-object p2, p0, Lcom/google/firebase/auth/internal/zzca;->zzb:Lcom/google/firebase/auth/internal/zzaq;

    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Landroid/app/Application;

    invoke-static {p1}, Lcom/google/android/gms/common/api/internal/BackgroundDetector;->initialize(Landroid/app/Application;)V

    .line 7
    invoke-static {}, Lcom/google/android/gms/common/api/internal/BackgroundDetector;->getInstance()Lcom/google/android/gms/common/api/internal/BackgroundDetector;

    move-result-object p1

    new-instance p2, Lcom/google/firebase/auth/internal/zzcd;

    invoke-direct {p2, p0}, Lcom/google/firebase/auth/internal/zzcd;-><init>(Lcom/google/firebase/auth/internal/zzca;)V

    .line 8
    invoke-virtual {p1, p2}, Lcom/google/android/gms/common/api/internal/BackgroundDetector;->addListener(Lcom/google/android/gms/common/api/internal/BackgroundDetector$BackgroundStateChangeListener;)V

    return-void
.end method

.method public constructor <init>(Lcom/google/firebase/FirebaseApp;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/google/firebase/FirebaseApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lcom/google/firebase/auth/internal/zzaq;

    invoke-direct {v1, p1}, Lcom/google/firebase/auth/internal/zzaq;-><init>(Lcom/google/firebase/FirebaseApp;)V

    invoke-direct {p0, v0, v1}, Lcom/google/firebase/auth/internal/zzca;-><init>(Landroid/content/Context;Lcom/google/firebase/auth/internal/zzaq;)V

    return-void
.end method

.method public static bridge synthetic zza(Lcom/google/firebase/auth/internal/zzca;)Lcom/google/firebase/auth/internal/zzaq;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzca;->zzb:Lcom/google/firebase/auth/internal/zzaq;

    return-object p0
.end method

.method public static bridge synthetic zza(Lcom/google/firebase/auth/internal/zzca;Z)V
    .locals 0

    .line 2
    iput-boolean p1, p0, Lcom/google/firebase/auth/internal/zzca;->zzc:Z

    return-void
.end method

.method private final zzb()Z
    .locals 1

    .line 2
    iget v0, p0, Lcom/google/firebase/auth/internal/zzca;->zza:I

    if-lez v0, :cond_0

    iget-boolean p0, p0, Lcom/google/firebase/auth/internal/zzca;->zzc:Z

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static bridge synthetic zzb(Lcom/google/firebase/auth/internal/zzca;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/firebase/auth/internal/zzca;->zzb()Z

    move-result p0

    return p0
.end method


# virtual methods
.method public final zza()V
    .locals 0

    .line 3
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzca;->zzb:Lcom/google/firebase/auth/internal/zzaq;

    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/zzaq;->zzb()V

    return-void
.end method

.method public final zza(I)V
    .locals 1

    if-lez p1, :cond_0

    .line 4
    iget v0, p0, Lcom/google/firebase/auth/internal/zzca;->zza:I

    if-nez v0, :cond_0

    .line 5
    iput p1, p0, Lcom/google/firebase/auth/internal/zzca;->zza:I

    .line 6
    invoke-direct {p0}, Lcom/google/firebase/auth/internal/zzca;->zzb()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 7
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzca;->zzb:Lcom/google/firebase/auth/internal/zzaq;

    invoke-virtual {v0}, Lcom/google/firebase/auth/internal/zzaq;->zzc()V

    goto :goto_0

    :cond_0
    if-nez p1, :cond_1

    .line 8
    iget v0, p0, Lcom/google/firebase/auth/internal/zzca;->zza:I

    if-eqz v0, :cond_1

    .line 9
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzca;->zzb:Lcom/google/firebase/auth/internal/zzaq;

    invoke-virtual {v0}, Lcom/google/firebase/auth/internal/zzaq;->zzb()V

    .line 10
    :cond_1
    :goto_0
    iput p1, p0, Lcom/google/firebase/auth/internal/zzca;->zza:I

    return-void
.end method

.method public final zza(Lcom/google/android/gms/internal/firebase-auth-api/zzahv;)V
    .locals 6

    if-nez p1, :cond_0

    goto :goto_0

    .line 11
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzahv;->zza()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gtz v2, :cond_1

    const-wide/16 v0, 0xe10

    .line 12
    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzahv;->zzb()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    mul-long/2addr v0, v4

    add-long/2addr v2, v0

    .line 13
    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzca;->zzb:Lcom/google/firebase/auth/internal/zzaq;

    .line 14
    iput-wide v2, p1, Lcom/google/firebase/auth/internal/zzaq;->zza:J

    const-wide/16 v0, -0x1

    .line 15
    iput-wide v0, p1, Lcom/google/firebase/auth/internal/zzaq;->zzb:J

    .line 16
    invoke-direct {p0}, Lcom/google/firebase/auth/internal/zzca;->zzb()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 17
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzca;->zzb:Lcom/google/firebase/auth/internal/zzaq;

    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/zzaq;->zzc()V

    :cond_2
    :goto_0
    return-void
.end method
