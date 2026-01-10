.class final Lcom/google/firebase/auth/internal/zzm;
.super Lcom/google/firebase/auth/internal/zzi;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"


# instance fields
.field private zza:Ljava/lang/String;

.field private zzb:Ljava/lang/String;

.field private zzc:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/firebase/auth/internal/zzi;-><init>()V

    return-void
.end method


# virtual methods
.method public final zza(Ljava/lang/String;)Lcom/google/firebase/auth/internal/zzi;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzm;->zzb:Ljava/lang/String;

    return-object p0
.end method

.method public final zza()Lcom/google/firebase/auth/internal/zzj;
    .locals 4

    new-instance v0, Lcom/google/firebase/auth/internal/zzn;

    iget-object v1, p0, Lcom/google/firebase/auth/internal/zzm;->zza:Ljava/lang/String;

    iget-object v2, p0, Lcom/google/firebase/auth/internal/zzm;->zzb:Ljava/lang/String;

    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzm;->zzc:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-direct {v0, v1, v2, p0, v3}, Lcom/google/firebase/auth/internal/zzn;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/firebase/auth/internal/zzp;)V

    return-object v0
.end method

.method public final zzb(Ljava/lang/String;)Lcom/google/firebase/auth/internal/zzi;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzm;->zzc:Ljava/lang/String;

    return-object p0
.end method

.method public final zzc(Ljava/lang/String;)Lcom/google/firebase/auth/internal/zzi;
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzm;->zza:Ljava/lang/String;

    return-object p0
.end method
