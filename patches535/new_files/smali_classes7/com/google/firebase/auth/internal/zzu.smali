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

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzg()Z

    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 10
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzc()Ljava/lang/String;

    .line 13
    move-result-object v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzb()Ljava/lang/String;

    .line 18
    move-result-object v0

    .line 19
    :goto_0
    iput-object v0, p0, Lcom/google/firebase/auth/internal/zzu;->zzb:Ljava/lang/String;

    .line 21
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzb()Ljava/lang/String;

    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/google/firebase/auth/internal/zzu;->zzc:Ljava/lang/String;

    .line 27
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzh()Z

    .line 30
    move-result v0

    .line 31
    const/4 v1, 0x0

    .line 32
    const/4 v2, 0x3

    .line 33
    if-nez v0, :cond_1

    .line 35
    iput v2, p0, Lcom/google/firebase/auth/internal/zzu;->zza:I

    .line 37
    iput-object v1, p0, Lcom/google/firebase/auth/internal/zzu;->zzd:Lcom/google/firebase/auth/ActionCodeInfo;

    .line 39
    return-void

    .line 40
    :cond_1
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzd()Ljava/lang/String;

    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 47
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 50
    move-result v3

    .line 51
    const/4 v4, 0x5

    .line 52
    const/4 v5, 0x2

    .line 53
    const/4 v6, 0x1

    .line 54
    const/4 v7, 0x0

    .line 55
    const/4 v8, 0x4

    .line 56
    const/4 v9, -0x1

    .line 57
    sparse-switch v3, :sswitch_data_0

    .line 60
    goto :goto_1

    .line 61
    :sswitch_0
    const-string v3, "RECOVER_EMAIL"

    .line 63
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    move-result v0

    .line 67
    if-nez v0, :cond_2

    .line 69
    goto :goto_1

    .line 70
    :cond_2
    move v9, v4

    .line 71
    goto :goto_1

    .line 72
    :sswitch_1
    const-string v3, "EMAIL_SIGNIN"

    .line 74
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_3

    .line 80
    goto :goto_1

    .line 81
    :cond_3
    move v9, v8

    .line 82
    goto :goto_1

    .line 83
    :sswitch_2
    const-string v3, "VERIFY_AND_CHANGE_EMAIL"

    .line 85
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_4

    .line 91
    goto :goto_1

    .line 92
    :cond_4
    move v9, v2

    .line 93
    goto :goto_1

    .line 94
    :sswitch_3
    const-string v3, "VERIFY_EMAIL"

    .line 96
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    move-result v0

    .line 100
    if-nez v0, :cond_5

    .line 102
    goto :goto_1

    .line 103
    :cond_5
    move v9, v5

    .line 104
    goto :goto_1

    .line 105
    :sswitch_4
    const-string v3, "PASSWORD_RESET"

    .line 107
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_6

    .line 113
    goto :goto_1

    .line 114
    :cond_6
    move v9, v6

    .line 115
    goto :goto_1

    .line 116
    :sswitch_5
    const-string v3, "REVERT_SECOND_FACTOR_ADDITION"

    .line 118
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    move-result v0

    .line 122
    if-nez v0, :cond_7

    .line 124
    goto :goto_1

    .line 125
    :cond_7
    move v9, v7

    .line 126
    :goto_1
    packed-switch v9, :pswitch_data_0

    .line 129
    move v4, v2

    .line 130
    goto :goto_2

    .line 131
    :pswitch_0
    move v4, v5

    .line 132
    goto :goto_2

    .line 133
    :pswitch_1
    move v4, v8

    .line 134
    goto :goto_2

    .line 135
    :pswitch_2
    move v4, v6

    .line 136
    goto :goto_2

    .line 137
    :pswitch_3
    move v4, v7

    .line 138
    goto :goto_2

    .line 139
    :pswitch_4
    const/4 v4, 0x6

    .line 140
    :goto_2
    :pswitch_5
    iput v4, p0, Lcom/google/firebase/auth/internal/zzu;->zza:I

    .line 142
    if-eq v4, v8, :cond_c

    .line 144
    if-ne v4, v2, :cond_8

    .line 146
    goto :goto_4

    .line 147
    :cond_8
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzf()Z

    .line 150
    move-result v0

    .line 151
    if-eqz v0, :cond_9

    .line 153
    new-instance v1, Lcom/google/firebase/auth/internal/zzv;

    .line 155
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzb()Ljava/lang/String;

    .line 158
    move-result-object v0

    .line 159
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zza()Lcom/google/android/gms/internal/firebase-auth-api/zzahy;

    .line 162
    move-result-object p1

    .line 163
    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzbk;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzahy;)Lcom/google/firebase/auth/MultiFactorInfo;

    .line 166
    move-result-object p1

    .line 167
    invoke-direct {v1, v0, p1}, Lcom/google/firebase/auth/internal/zzv;-><init>(Ljava/lang/String;Lcom/google/firebase/auth/MultiFactorInfo;)V

    .line 170
    goto :goto_3

    .line 171
    :cond_9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzg()Z

    .line 174
    move-result v0

    .line 175
    if-eqz v0, :cond_a

    .line 177
    new-instance v1, Lcom/google/firebase/auth/internal/zzt;

    .line 179
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzc()Ljava/lang/String;

    .line 182
    move-result-object v0

    .line 183
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzb()Ljava/lang/String;

    .line 186
    move-result-object p1

    .line 187
    invoke-direct {v1, v0, p1}, Lcom/google/firebase/auth/internal/zzt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    goto :goto_3

    .line 191
    :cond_a
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zze()Z

    .line 194
    move-result v0

    .line 195
    if-eqz v0, :cond_b

    .line 197
    new-instance v1, Lcom/google/firebase/auth/internal/zzs;

    .line 199
    invoke-virtual {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaif;->zzb()Ljava/lang/String;

    .line 202
    move-result-object p1

    .line 203
    invoke-direct {v1, p1}, Lcom/google/firebase/auth/internal/zzs;-><init>(Ljava/lang/String;)V

    .line 206
    :cond_b
    :goto_3
    iput-object v1, p0, Lcom/google/firebase/auth/internal/zzu;->zzd:Lcom/google/firebase/auth/ActionCodeInfo;

    .line 208
    return-void

    .line 209
    :cond_c
    :goto_4
    iput-object v1, p0, Lcom/google/firebase/auth/internal/zzu;->zzd:Lcom/google/firebase/auth/ActionCodeInfo;

    .line 211
    return-void

    nop

    .line 213
    :sswitch_data_0
    .sparse-switch
        -0x6fbac124 -> :sswitch_5
        -0x56916d75 -> :sswitch_4
        -0x4ffacbca -> :sswitch_3
        -0x4183d145 -> :sswitch_2
        0x33e669c5 -> :sswitch_1
        0x39d86cc1 -> :sswitch_0
    .end sparse-switch

    .line 239
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

    .line 1
    iget v0, p0, Lcom/google/firebase/auth/internal/zzu;->zza:I

    .line 3
    const/4 v1, 0x4

    .line 4
    const/4 v2, 0x0

    .line 5
    if-ne v0, v1, :cond_0

    .line 7
    return-object v2

    .line 8
    :cond_0
    if-eqz p1, :cond_2

    .line 10
    const/4 v0, 0x1

    .line 11
    if-eq p1, v0, :cond_1

    .line 13
    return-object v2

    .line 14
    :cond_1
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzu;->zzc:Ljava/lang/String;

    .line 16
    return-object p0

    .line 17
    :cond_2
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzu;->zzb:Ljava/lang/String;

    .line 19
    return-object p0
.end method

.method public final getInfo()Lcom/google/firebase/auth/ActionCodeInfo;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzu;->zzd:Lcom/google/firebase/auth/ActionCodeInfo;

    .line 3
    return-object p0
.end method

.method public final getOperation()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/google/firebase/auth/internal/zzu;->zza:I

    .line 3
    return p0
.end method
