.class public final Lcom/google/firebase/auth/internal/zzu;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"

# interfaces
.implements Lcom/google/firebase/auth/ActionCodeResult;


# instance fields
.field private final zza:I

.field private final zzb:Ljava/lang/String;

.field private final zzc:Ljava/lang/String;

.field private final zzd:Lcom/google/firebase/auth/ActionCodeInfo;


# direct methods
.method public constructor <init>(Lcom/google/android/gms/internal/firebase-auth-api/zzaif;)V
    .locals 10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzg()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzc()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzb()Ljava/lang/String;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/google/firebase/auth/internal/zzu;->zzb:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzb()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/google/firebase/auth/internal/zzu;->zzc:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzh()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x3

    if-nez v0, :cond_1

    iput v2, p0, Lcom/google/firebase/auth/internal/zzu;->zza:I

    iput-object v1, p0, Lcom/google/firebase/auth/internal/zzu;->zzd:Lcom/google/firebase/auth/ActionCodeInfo;

    return-void

    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzd()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/4 v4, 0x5

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x4

    const/4 v9, -0x1

    sparse-switch v3, :sswitch_data_0

    goto :goto_1

    :sswitch_0
    const-string v3, "RECOVER_EMAIL"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    goto :goto_1

    :cond_2
    move v9, v4

    goto :goto_1

    :sswitch_1
    const-string v3, "EMAIL_SIGNIN"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    goto :goto_1

    :cond_3
    move v9, v8

    goto :goto_1

    :sswitch_2
    const-string v3, "VERIFY_AND_CHANGE_EMAIL"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    goto :goto_1

    :cond_4
    move v9, v2

    goto :goto_1

    :sswitch_3
    const-string v3, "VERIFY_EMAIL"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    goto :goto_1

    :cond_5
    move v9, v5

    goto :goto_1

    :sswitch_4
    const-string v3, "PASSWORD_RESET"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    goto :goto_1

    :cond_6
    move v9, v6

    goto :goto_1

    :sswitch_5
    const-string v3, "REVERT_SECOND_FACTOR_ADDITION"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7

    goto :goto_1

    :cond_7
    move v9, v7

    :goto_1
    packed-switch v9, :pswitch_data_0

    move v4, v2

    goto :goto_2

    :pswitch_0
    move v4, v5

    goto :goto_2

    :pswitch_1
    move v4, v8

    goto :goto_2

    :pswitch_2
    move v4, v6

    goto :goto_2

    :pswitch_3
    move v4, v7

    goto :goto_2

    :pswitch_4
    const/4 v4, 0x6

    :goto_2
    :pswitch_5
    iput v4, p0, Lcom/google/firebase/auth/internal/zzu;->zza:I

    if-eq v4, v8, :cond_c

    if-ne v4, v2, :cond_8

    goto :goto_4

    :cond_8
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzf()Z

    move-result v0

    if-eqz v0, :cond_9

    new-instance v1, Lcom/google/firebase/auth/internal/zzv;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzb()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzahy;

    move-result-object p1

    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzbk;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzahy;)Lcom/google/firebase/auth/MultiFactorInfo;

    move-result-object p1

    invoke-direct {v1, v0, p1}, Lcom/google/firebase/auth/internal/zzv;-><init>(Ljava/lang/String;Lcom/google/firebase/auth/MultiFactorInfo;)V

    goto :goto_3

    :cond_9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzg()Z

    move-result v0

    if-eqz v0, :cond_a

    new-instance v1, Lcom/google/firebase/auth/internal/zzt;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzc()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzb()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, v0, p1}, Lcom/google/firebase/auth/internal/zzt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_a
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zze()Z

    move-result v0

    if-eqz v0, :cond_b

    new-instance v1, Lcom/google/firebase/auth/internal/zzs;

    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzb()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Lcom/google/firebase/auth/internal/zzs;-><init>(Ljava/lang/String;)V

    :cond_b
    :goto_3
    iput-object v1, p0, Lcom/google/firebase/auth/internal/zzu;->zzd:Lcom/google/firebase/auth/ActionCodeInfo;

    return-void

    :cond_c
    :goto_4
    iput-object v1, p0, Lcom/google/firebase/auth/internal/zzu;->zzd:Lcom/google/firebase/auth/ActionCodeInfo;

    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        -0x6fbac124 -> :sswitch_5
        -0x56916d75 -> :sswitch_4
        -0x4ffacbca -> :sswitch_3
        -0x4183d145 -> :sswitch_2
        0x33e669c5 -> :sswitch_1
        0x39d86cc1 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_5
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public final getData(I)Ljava/lang/String;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget v0, p0, Lcom/google/firebase/auth/internal/zzu;->zza:I

    const/4 v1, 0x4

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    return-object v2

    :cond_0
    if-eqz p1, :cond_2

    const/4 v0, 0x1

    if-eq p1, v0, :cond_1

    return-object v2

    :cond_1
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzu;->zzc:Ljava/lang/String;

    return-object p0

    :cond_2
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzu;->zzb:Ljava/lang/String;

    return-object p0
.end method

.method public final getInfo()Lcom/google/firebase/auth/ActionCodeInfo;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzu;->zzd:Lcom/google/firebase/auth/ActionCodeInfo;

    return-object p0
.end method

.method public final getOperation()I
    .locals 0

    iget p0, p0, Lcom/google/firebase/auth/internal/zzu;->zza:I

    return p0
.end method
