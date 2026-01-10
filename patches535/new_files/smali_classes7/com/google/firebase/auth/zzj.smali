.class final Lcom/google/firebase/auth/zzj;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/tasks/OnCompleteListener<",
        "Lcom/google/firebase/auth/internal/zzj;",
        ">;"
    }
.end annotation


# instance fields
.field private final synthetic zza:Lcom/google/firebase/auth/PhoneAuthOptions;

.field private final synthetic zzb:Ljava/lang/String;

.field private final synthetic zzc:Lcom/google/firebase/auth/FirebaseAuth;


# direct methods
.method public constructor <init>(Lcom/google/firebase/auth/FirebaseAuth;Lcom/google/firebase/auth/PhoneAuthOptions;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/google/firebase/auth/zzj;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 3
    iput-object p3, p0, Lcom/google/firebase/auth/zzj;->zzb:Ljava/lang/String;

    .line 5
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    iput-object p1, p0, Lcom/google/firebase/auth/zzj;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/auth/internal/zzj;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 3
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    .line 6
    move-result v1

    .line 7
    if-nez v1, :cond_2

    .line 9
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    .line 12
    move-result-object v1

    .line 13
    const-string v2, "Error while validating application identity: "

    .line 15
    if-eqz v1, :cond_0

    .line 17
    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 20
    move-result-object v3

    .line 21
    new-instance v4, Ljava/lang/StringBuilder;

    .line 23
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    move-result-object v2

    .line 36
    :cond_0
    const-string v3, "FirebaseAuth"

    .line 38
    invoke-static {v3, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    if-eqz v1, :cond_1

    .line 43
    invoke-static {v1}, Lcom/google/firebase/auth/internal/zzb;->zza(Ljava/lang/Exception;)Z

    .line 46
    move-result v2

    .line 47
    if-eqz v2, :cond_1

    .line 49
    check-cast v1, Lcom/google/firebase/FirebaseException;

    .line 51
    iget-object v2, v0, Lcom/google/firebase/auth/zzj;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 53
    iget-object v0, v0, Lcom/google/firebase/auth/zzj;->zzb:Ljava/lang/String;

    .line 55
    invoke-static {v1, v2, v0}, Lcom/google/firebase/auth/FirebaseAuth;->zza(Lcom/google/firebase/FirebaseException;Lcom/google/firebase/auth/PhoneAuthOptions;Ljava/lang/String;)V

    .line 58
    return-void

    .line 59
    :cond_1
    const-string v1, "Proceeding without any application identifier."

    .line 61
    invoke-static {v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    const/4 v1, 0x0

    .line 65
    move-object v12, v1

    .line 66
    move-object v13, v12

    .line 67
    goto :goto_0

    .line 68
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Lcom/google/firebase/auth/internal/zzj;

    .line 74
    invoke-virtual {v1}, Lcom/google/firebase/auth/internal/zzj;->zzd()Ljava/lang/String;

    .line 77
    move-result-object v1

    .line 78
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Lcom/google/firebase/auth/internal/zzj;

    .line 84
    invoke-virtual {v2}, Lcom/google/firebase/auth/internal/zzj;->zzb()Ljava/lang/String;

    .line 87
    move-result-object v2

    .line 88
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    .line 91
    move-result-object v3

    .line 92
    check-cast v3, Lcom/google/firebase/auth/internal/zzj;

    .line 94
    invoke-virtual {v3}, Lcom/google/firebase/auth/internal/zzj;->zzc()Ljava/lang/String;

    .line 97
    move-result-object v3

    .line 98
    move-object v12, v1

    .line 99
    move-object v13, v2

    .line 100
    move-object v1, v3

    .line 101
    :goto_0
    iget-object v2, v0, Lcom/google/firebase/auth/zzj;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 103
    invoke-virtual {v2}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzg()Ljava/lang/Long;

    .line 106
    move-result-object v2

    .line 107
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 110
    move-result-wide v8

    .line 111
    iget-object v2, v0, Lcom/google/firebase/auth/zzj;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    .line 113
    iget-object v3, v0, Lcom/google/firebase/auth/zzj;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 115
    invoke-virtual {v3}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzh()Ljava/lang/String;

    .line 118
    move-result-object v3

    .line 119
    iget-object v4, v0, Lcom/google/firebase/auth/zzj;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 121
    invoke-virtual {v4}, Lcom/google/firebase/auth/PhoneAuthOptions;->zze()Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;

    .line 124
    move-result-object v4

    .line 125
    invoke-static {v2, v3, v4}, Lcom/google/firebase/auth/FirebaseAuth;->zza(Lcom/google/firebase/auth/FirebaseAuth;Ljava/lang/String;Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;)Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;

    .line 128
    move-result-object v2

    .line 129
    invoke-static {v12}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 132
    move-result v3

    .line 133
    if-eqz v3, :cond_3

    .line 135
    iget-object v3, v0, Lcom/google/firebase/auth/zzj;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    .line 137
    iget-object v4, v0, Lcom/google/firebase/auth/zzj;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 139
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    .line 142
    move-result-object v5

    .line 143
    check-cast v5, Lcom/google/firebase/auth/internal/zzj;

    .line 145
    invoke-virtual {v3, v4, v2, v5}, Lcom/google/firebase/auth/FirebaseAuth;->zza(Lcom/google/firebase/auth/PhoneAuthOptions;Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;Lcom/google/firebase/auth/internal/zzj;)Lcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;

    .line 148
    move-result-object v2

    .line 149
    :cond_3
    move-object/from16 v16, v2

    .line 151
    iget-object v2, v0, Lcom/google/firebase/auth/zzj;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 153
    invoke-virtual {v2}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzc()Lcom/google/firebase/auth/MultiFactorSession;

    .line 156
    move-result-object v2

    .line 157
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    move-result-object v2

    .line 161
    move-object v5, v2

    .line 162
    check-cast v5, Lcom/google/firebase/auth/internal/zzam;

    .line 164
    invoke-static {v1}, Lcom/google/android/gms/internal/firebase-auth-api/zzac;->zzc(Ljava/lang/String;)Z

    .line 167
    move-result v2

    .line 168
    if-eqz v2, :cond_4

    .line 170
    iget-object v2, v0, Lcom/google/firebase/auth/zzj;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    .line 172
    invoke-virtual {v2}, Lcom/google/firebase/auth/FirebaseAuth;->zzb()Lcom/google/firebase/auth/internal/zzbx;

    .line 175
    move-result-object v2

    .line 176
    if-eqz v2, :cond_4

    .line 178
    iget-object v2, v0, Lcom/google/firebase/auth/zzj;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    .line 180
    invoke-virtual {v2}, Lcom/google/firebase/auth/FirebaseAuth;->zzb()Lcom/google/firebase/auth/internal/zzbx;

    .line 183
    move-result-object v2

    .line 184
    const-string v3, "PHONE_PROVIDER"

    .line 186
    invoke-virtual {v2, v3}, Lcom/google/firebase/auth/internal/zzbx;->zza(Ljava/lang/String;)Z

    .line 189
    move-result v2

    .line 190
    if-eqz v2, :cond_4

    .line 192
    const-string v1, "NO_RECAPTCHA"

    .line 194
    :cond_4
    move-object v14, v1

    .line 195
    invoke-virtual {v5}, Lcom/google/firebase/auth/internal/zzam;->zzd()Z

    .line 198
    move-result v1

    .line 199
    const/4 v2, 0x0

    .line 200
    const/4 v3, 0x1

    .line 201
    if-eqz v1, :cond_6

    .line 203
    iget-object v1, v0, Lcom/google/firebase/auth/zzj;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    .line 205
    iget-object v4, v1, Lcom/google/firebase/auth/FirebaseAuth;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzacq;

    .line 207
    iget-object v1, v0, Lcom/google/firebase/auth/zzj;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 209
    invoke-virtual {v1}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzh()Ljava/lang/String;

    .line 212
    move-result-object v1

    .line 213
    invoke-static {v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    move-result-object v1

    .line 217
    move-object v6, v1

    .line 218
    check-cast v6, Ljava/lang/String;

    .line 220
    iget-object v1, v0, Lcom/google/firebase/auth/zzj;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    .line 222
    invoke-static {v1}, Lcom/google/firebase/auth/FirebaseAuth;->zzd(Lcom/google/firebase/auth/FirebaseAuth;)Ljava/lang/String;

    .line 225
    move-result-object v7

    .line 226
    iget-object v1, v0, Lcom/google/firebase/auth/zzj;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 228
    invoke-virtual {v1}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzd()Lcom/google/firebase/auth/PhoneAuthProvider$ForceResendingToken;

    .line 231
    move-result-object v1

    .line 232
    if-eqz v1, :cond_5

    .line 234
    move v10, v3

    .line 235
    goto :goto_1

    .line 236
    :cond_5
    move v10, v2

    .line 237
    :goto_1
    iget-object v1, v0, Lcom/google/firebase/auth/zzj;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 239
    invoke-virtual {v1}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzk()Z

    .line 242
    move-result v11

    .line 243
    iget-object v1, v0, Lcom/google/firebase/auth/zzj;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    .line 245
    invoke-virtual {v1}, Lcom/google/firebase/auth/FirebaseAuth;->zzh()Z

    .line 248
    move-result v15

    .line 249
    iget-object v1, v0, Lcom/google/firebase/auth/zzj;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 251
    invoke-virtual {v1}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzi()Ljava/util/concurrent/Executor;

    .line 254
    move-result-object v17

    .line 255
    iget-object v0, v0, Lcom/google/firebase/auth/zzj;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 257
    invoke-virtual {v0}, Lcom/google/firebase/auth/PhoneAuthOptions;->zza()Landroid/app/Activity;

    .line 260
    move-result-object v18

    .line 261
    invoke-virtual/range {v4 .. v18}, Lcom/google/android/gms/internal/firebase-auth-api/zzacq;->zza(Lcom/google/firebase/auth/internal/zzam;Ljava/lang/String;Ljava/lang/String;JZZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;Ljava/util/concurrent/Executor;Landroid/app/Activity;)Lcom/google/android/gms/tasks/Task;

    .line 264
    return-void

    .line 265
    :cond_6
    iget-object v1, v0, Lcom/google/firebase/auth/zzj;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    .line 267
    iget-object v4, v1, Lcom/google/firebase/auth/FirebaseAuth;->zzd:Lcom/google/android/gms/internal/firebase-auth-api/zzacq;

    .line 269
    iget-object v1, v0, Lcom/google/firebase/auth/zzj;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 271
    invoke-virtual {v1}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzf()Lcom/google/firebase/auth/PhoneMultiFactorInfo;

    .line 274
    move-result-object v1

    .line 275
    invoke-static {v1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    move-result-object v1

    .line 279
    move-object v6, v1

    .line 280
    check-cast v6, Lcom/google/firebase/auth/PhoneMultiFactorInfo;

    .line 282
    iget-object v1, v0, Lcom/google/firebase/auth/zzj;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    .line 284
    invoke-static {v1}, Lcom/google/firebase/auth/FirebaseAuth;->zzd(Lcom/google/firebase/auth/FirebaseAuth;)Ljava/lang/String;

    .line 287
    move-result-object v7

    .line 288
    iget-object v1, v0, Lcom/google/firebase/auth/zzj;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 290
    invoke-virtual {v1}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzd()Lcom/google/firebase/auth/PhoneAuthProvider$ForceResendingToken;

    .line 293
    move-result-object v1

    .line 294
    if-eqz v1, :cond_7

    .line 296
    move v10, v3

    .line 297
    goto :goto_2

    .line 298
    :cond_7
    move v10, v2

    .line 299
    :goto_2
    iget-object v1, v0, Lcom/google/firebase/auth/zzj;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 301
    invoke-virtual {v1}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzk()Z

    .line 304
    move-result v11

    .line 305
    iget-object v1, v0, Lcom/google/firebase/auth/zzj;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    .line 307
    invoke-virtual {v1}, Lcom/google/firebase/auth/FirebaseAuth;->zzh()Z

    .line 310
    move-result v15

    .line 311
    iget-object v1, v0, Lcom/google/firebase/auth/zzj;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 313
    invoke-virtual {v1}, Lcom/google/firebase/auth/PhoneAuthOptions;->zzi()Ljava/util/concurrent/Executor;

    .line 316
    move-result-object v17

    .line 317
    iget-object v0, v0, Lcom/google/firebase/auth/zzj;->zza:Lcom/google/firebase/auth/PhoneAuthOptions;

    .line 319
    invoke-virtual {v0}, Lcom/google/firebase/auth/PhoneAuthOptions;->zza()Landroid/app/Activity;

    .line 322
    move-result-object v18

    .line 323
    invoke-virtual/range {v4 .. v18}, Lcom/google/android/gms/internal/firebase-auth-api/zzacq;->zza(Lcom/google/firebase/auth/internal/zzam;Lcom/google/firebase/auth/PhoneMultiFactorInfo;Ljava/lang/String;JZZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLcom/google/firebase/auth/PhoneAuthProvider$OnVerificationStateChangedCallbacks;Ljava/util/concurrent/Executor;Landroid/app/Activity;)Lcom/google/android/gms/tasks/Task;

    .line 326
    return-void
.end method
