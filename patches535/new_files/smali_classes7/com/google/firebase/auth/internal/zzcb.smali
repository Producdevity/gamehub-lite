.class public final Lcom/google/firebase/auth/internal/zzcb;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"


# instance fields
.field private zza:Landroid/content/Context;

.field private zzb:Ljava/lang/String;

.field private zzc:Landroid/content/SharedPreferences;

.field private zzd:Lcom/google/android/gms/common/logging/Logger;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotEmpty(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    move-result-object p2

    .line 11
    iput-object p2, p0, Lcom/google/firebase/auth/internal/zzcb;->zzb:Ljava/lang/String;

    .line 13
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 16
    move-result-object p1

    .line 17
    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzcb;->zza:Landroid/content/Context;

    .line 19
    iget-object p1, p0, Lcom/google/firebase/auth/internal/zzcb;->zzb:Ljava/lang/String;

    .line 21
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 24
    move-result-object p1

    .line 25
    const-string p2, "com.google.firebase.auth.api.Store.%s"

    .line 27
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    move-result-object p1

    .line 31
    iget-object p2, p0, Lcom/google/firebase/auth/internal/zzcb;->zza:Landroid/content/Context;

    .line 33
    const/4 v0, 0x0

    .line 34
    invoke-virtual {p2, p1, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzcb;->zzc:Landroid/content/SharedPreferences;

    .line 40
    new-instance p1, Lcom/google/android/gms/common/logging/Logger;

    .line 42
    const-string p2, "StorageHelpers"

    .line 44
    new-array v0, v0, [Ljava/lang/String;

    .line 46
    invoke-direct {p1, p2, v0}, Lcom/google/android/gms/common/logging/Logger;-><init>(Ljava/lang/String;[Ljava/lang/String;)V

    .line 49
    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzcb;->zzd:Lcom/google/android/gms/common/logging/Logger;

    .line 51
    return-void
.end method

.method private final zza(Lorg/json/JSONObject;)Lcom/google/firebase/auth/internal/zzaf;
    .locals 14
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 13
    const-string v0, "passkeyInfo"

    const-string v1, "userMultiFactorInfo"

    const-string v2, "userMetadata"

    const/4 v3, 0x0

    :try_start_0
    const-string v4, "cachedTokenState"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 14
    const-string v5, "applicationName"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 15
    const-string v6, "anonymous"

    invoke-virtual {p1, v6}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    .line 16
    const-string v7, "2"

    .line 17
    const-string v8, "version"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_0

    move-object v7, v8

    .line 18
    :cond_0
    const-string v8, "userInfos"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    .line 19
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-nez v9, :cond_1

    return-object v3

    .line 20
    :cond_1
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10, v9}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v11, 0x0

    move v12, v11

    :goto_0
    if-ge v12, v9, :cond_2

    .line 21
    invoke-virtual {v8, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lcom/google/firebase/auth/internal/zzab;->zza(Ljava/lang/String;)Lcom/google/firebase/auth/internal/zzab;

    move-result-object v13

    invoke-interface {v10, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    goto/16 :goto_4

    .line 22
    :cond_2
    invoke-static {v5}, Lcom/google/firebase/FirebaseApp;->getInstance(Ljava/lang/String;)Lcom/google/firebase/FirebaseApp;

    move-result-object v5

    .line 23
    new-instance v8, Lcom/google/firebase/auth/internal/zzaf;

    invoke-direct {v8, v5, v10}, Lcom/google/firebase/auth/internal/zzaf;-><init>(Lcom/google/firebase/FirebaseApp;Ljava/util/List;)V

    .line 24
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    .line 25
    invoke-static {v4}, Lcom/google/android/gms/internal/firebase-auth-api/zzahv;->zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzahv;

    move-result-object v4

    .line 26
    invoke-virtual {v8, v4}, Lcom/google/firebase/auth/FirebaseUser;->zza(Lcom/google/android/gms/internal/firebase-auth-api/zzahv;)V

    :cond_3
    if-nez v6, :cond_4

    .line 27
    invoke-virtual {v8}, Lcom/google/firebase/auth/FirebaseUser;->zzb()Lcom/google/firebase/auth/FirebaseUser;

    .line 28
    :cond_4
    invoke-virtual {v8, v7}, Lcom/google/firebase/auth/internal/zzaf;->zza(Ljava/lang/String;)Lcom/google/firebase/auth/internal/zzaf;

    .line 29
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 30
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 31
    invoke-static {v2}, Lcom/google/firebase/auth/internal/zzah;->zza(Lorg/json/JSONObject;)Lcom/google/firebase/auth/internal/zzah;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 32
    invoke-virtual {v8, v2}, Lcom/google/firebase/auth/internal/zzaf;->zza(Lcom/google/firebase/auth/internal/zzah;)V

    .line 33
    :cond_5
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 34
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_9

    .line 35
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    move v4, v11

    .line 36
    :goto_1
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v4, v5, :cond_8

    .line 37
    invoke-virtual {v1, v4}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 38
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 39
    const-string v5, "factorIdKey"

    invoke-virtual {v6, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 40
    const-string v7, "phone"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 41
    invoke-static {v6}, Lcom/google/firebase/auth/PhoneMultiFactorInfo;->zza(Lorg/json/JSONObject;)Lcom/google/firebase/auth/PhoneMultiFactorInfo;

    move-result-object v5

    goto :goto_2

    .line 42
    :cond_6
    const-string v7, "totp"

    invoke-static {v5, v7}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 43
    invoke-static {v6}, Lcom/google/firebase/auth/TotpMultiFactorInfo;->zza(Lorg/json/JSONObject;)Lcom/google/firebase/auth/TotpMultiFactorInfo;

    move-result-object v5

    goto :goto_2

    :cond_7
    move-object v5, v3

    .line 44
    :goto_2
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 45
    :cond_8
    invoke-virtual {v8, v2}, Lcom/google/firebase/auth/FirebaseUser;->zzc(Ljava/util/List;)V

    .line 46
    :cond_9
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 47
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p1

    if-eqz p1, :cond_b

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 49
    :goto_3
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v11, v1, :cond_a

    .line 50
    invoke-virtual {p1, v11}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 51
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/google/firebase/auth/zzan;->zza(Lorg/json/JSONObject;)Lcom/google/firebase/auth/zzan;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v11, v11, 0x1

    goto :goto_3

    .line 52
    :cond_a
    invoke-virtual {v8, v0}, Lcom/google/firebase/auth/FirebaseUser;->zzb(Ljava/util/List;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/google/android/gms/internal/firebase-auth-api/zzaao; {:try_start_0 .. :try_end_0} :catch_0

    :cond_b
    return-object v8

    .line 53
    :goto_4
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzcb;->zzd:Lcom/google/android/gms/common/logging/Logger;

    invoke-virtual {p0, p1}, Lcom/google/android/gms/common/logging/Logger;->wtf(Ljava/lang/Throwable;)V

    return-object v3
.end method

.method private final zza(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 54
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzcb;->zzc:Landroid/content/SharedPreferences;

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 55
    const-string v0, "ENCRYPTED:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 56
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzcb;->zza:Landroid/content/Context;

    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzcb;->zzb:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/google/firebase/auth/internal/zzby;->zza(Landroid/content/Context;Ljava/lang/String;)Lcom/google/firebase/auth/internal/zzby;

    move-result-object p0

    const/16 v0, 0xa

    .line 57
    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/firebase/auth/internal/zzby;->zza(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    return-object p1

    :cond_1
    return-object v1
.end method

.method private final zza(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 58
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzcb;->zza:Landroid/content/Context;

    iget-object v1, p0, Lcom/google/firebase/auth/internal/zzcb;->zzb:Ljava/lang/String;

    .line 59
    invoke-static {v0, v1}, Lcom/google/firebase/auth/internal/zzby;->zza(Landroid/content/Context;Ljava/lang/String;)Lcom/google/firebase/auth/internal/zzby;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/google/firebase/auth/internal/zzby;->zzb(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ENCRYPTED:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 61
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzcb;->zzc:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_0
    return-void
.end method

.method private final zzb(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzcb;->zzc:Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private final zzd(Lcom/google/firebase/auth/FirebaseUser;)Ljava/lang/String;
    .locals 11
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 6
    instance-of v1, p1, Lcom/google/firebase/auth/internal/zzaf;

    .line 8
    if-eqz v1, :cond_f

    .line 10
    check-cast p1, Lcom/google/firebase/auth/internal/zzaf;

    .line 12
    const/4 v1, 0x0

    .line 13
    :try_start_0
    const-string v2, "cachedTokenState"

    .line 15
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseUser;->zze()Ljava/lang/String;

    .line 18
    move-result-object v3

    .line 19
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 22
    const-string v2, "applicationName"

    .line 24
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseUser;->zza()Lcom/google/firebase/FirebaseApp;

    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v3}, Lcom/google/firebase/FirebaseApp;->getName()Ljava/lang/String;

    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 35
    const-string v2, "type"

    .line 37
    const-string v3, "com.google.firebase.auth.internal.DefaultFirebaseUser"

    .line 39
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    invoke-virtual {p1}, Lcom/google/firebase/auth/internal/zzaf;->zzj()Ljava/util/List;

    .line 45
    move-result-object v2

    .line 46
    if-eqz v2, :cond_9

    .line 48
    new-instance v2, Lorg/json/JSONArray;

    .line 50
    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 53
    invoke-virtual {p1}, Lcom/google/firebase/auth/internal/zzaf;->zzj()Ljava/util/List;

    .line 56
    move-result-object v3

    .line 57
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 60
    move-result v4

    .line 61
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 64
    move-result v5

    .line 65
    const/16 v6, 0x1e

    .line 67
    if-le v5, v6, :cond_0

    .line 69
    iget-object v4, p0, Lcom/google/firebase/auth/internal/zzcb;->zzd:Lcom/google/android/gms/common/logging/Logger;

    .line 71
    const-string v5, "Provider user info list size larger than max size, truncating list to %d. Actual list size: %d"

    .line 73
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    move-result-object v7

    .line 77
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 80
    move-result v8

    .line 81
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    move-result-object v8

    .line 85
    filled-new-array {v7, v8}, [Ljava/lang/Object;

    .line 88
    move-result-object v7

    .line 89
    invoke-virtual {v4, v5, v7}, Lcom/google/android/gms/common/logging/Logger;->w(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 92
    move v4, v6

    .line 93
    goto :goto_0

    .line 94
    :catch_0
    move-exception p1

    .line 95
    goto/16 :goto_7

    .line 97
    :cond_0
    :goto_0
    move v5, v1

    .line 98
    move v6, v5

    .line 99
    :goto_1
    const-string v7, "firebase"

    .line 101
    const/4 v8, 0x1

    .line 102
    if-ge v5, v4, :cond_3

    .line 104
    :try_start_1
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 107
    move-result-object v9

    .line 108
    check-cast v9, Lcom/google/firebase/auth/internal/zzab;

    .line 110
    invoke-virtual {v9}, Lcom/google/firebase/auth/internal/zzab;->getProviderId()Ljava/lang/String;

    .line 113
    move-result-object v10

    .line 114
    invoke-virtual {v10, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 117
    move-result v10

    .line 118
    if-eqz v10, :cond_1

    .line 120
    move v6, v8

    .line 121
    :cond_1
    add-int/lit8 v10, v4, -0x1

    .line 123
    if-ne v5, v10, :cond_2

    .line 125
    if-eqz v6, :cond_3

    .line 127
    :cond_2
    invoke-virtual {v9}, Lcom/google/firebase/auth/internal/zzab;->zzb()Ljava/lang/String;

    .line 130
    move-result-object v7

    .line 131
    invoke-virtual {v2, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 134
    add-int/lit8 v5, v5, 0x1

    .line 136
    goto :goto_1

    .line 137
    :cond_3
    if-nez v6, :cond_8

    .line 139
    add-int/lit8 v5, v4, -0x1

    .line 141
    :goto_2
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 144
    move-result v9

    .line 145
    if-ge v5, v9, :cond_6

    .line 147
    if-ltz v5, :cond_6

    .line 149
    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 152
    move-result-object v9

    .line 153
    check-cast v9, Lcom/google/firebase/auth/internal/zzab;

    .line 155
    invoke-virtual {v9}, Lcom/google/firebase/auth/internal/zzab;->getProviderId()Ljava/lang/String;

    .line 158
    move-result-object v10

    .line 159
    invoke-virtual {v10, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 162
    move-result v10

    .line 163
    if-eqz v10, :cond_4

    .line 165
    invoke-virtual {v9}, Lcom/google/firebase/auth/internal/zzab;->zzb()Ljava/lang/String;

    .line 168
    move-result-object v5

    .line 169
    invoke-virtual {v2, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 172
    goto :goto_3

    .line 173
    :cond_4
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 176
    move-result v10

    .line 177
    sub-int/2addr v10, v8

    .line 178
    if-ne v5, v10, :cond_5

    .line 180
    invoke-virtual {v9}, Lcom/google/firebase/auth/internal/zzab;->zzb()Ljava/lang/String;

    .line 183
    move-result-object v9

    .line 184
    invoke-virtual {v2, v9}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 187
    :cond_5
    add-int/lit8 v5, v5, 0x1

    .line 189
    goto :goto_2

    .line 190
    :cond_6
    move v8, v6

    .line 191
    :goto_3
    if-nez v8, :cond_8

    .line 193
    iget-object v5, p0, Lcom/google/firebase/auth/internal/zzcb;->zzd:Lcom/google/android/gms/common/logging/Logger;

    .line 195
    const-string v6, "Malformed user object! No Firebase Auth provider id found. Provider user info list size: %d, trimmed size: %d"

    .line 197
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 200
    move-result v7

    .line 201
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 204
    move-result-object v7

    .line 205
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 208
    move-result-object v4

    .line 209
    filled-new-array {v7, v4}, [Ljava/lang/Object;

    .line 212
    move-result-object v4

    .line 213
    invoke-virtual {v5, v6, v4}, Lcom/google/android/gms/common/logging/Logger;->w(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 216
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 219
    move-result v4

    .line 220
    const/4 v5, 0x5

    .line 221
    if-ge v4, v5, :cond_8

    .line 223
    new-instance v4, Ljava/lang/StringBuilder;

    .line 225
    const-string v5, "Provider user info list:\n"

    .line 227
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 230
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 233
    move-result-object v3

    .line 234
    :goto_4
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 237
    move-result v5

    .line 238
    if-eqz v5, :cond_7

    .line 240
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 243
    move-result-object v5

    .line 244
    check-cast v5, Lcom/google/firebase/auth/internal/zzab;

    .line 246
    const-string v6, "Provider - %s\n"

    .line 248
    invoke-virtual {v5}, Lcom/google/firebase/auth/internal/zzab;->getProviderId()Ljava/lang/String;

    .line 251
    move-result-object v5

    .line 252
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 255
    move-result-object v5

    .line 256
    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 259
    move-result-object v5

    .line 260
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    goto :goto_4

    .line 264
    :cond_7
    iget-object v3, p0, Lcom/google/firebase/auth/internal/zzcb;->zzd:Lcom/google/android/gms/common/logging/Logger;

    .line 266
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 269
    move-result-object v4

    .line 270
    new-array v5, v1, [Ljava/lang/Object;

    .line 272
    invoke-virtual {v3, v4, v5}, Lcom/google/android/gms/common/logging/Logger;->w(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 275
    :cond_8
    const-string v3, "userInfos"

    .line 277
    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 280
    :cond_9
    const-string v2, "anonymous"

    .line 282
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseUser;->isAnonymous()Z

    .line 285
    move-result v3

    .line 286
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 289
    const-string v2, "version"

    .line 291
    const-string v3, "2"

    .line 293
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 296
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseUser;->getMetadata()Lcom/google/firebase/auth/FirebaseUserMetadata;

    .line 299
    move-result-object v2

    .line 300
    if-eqz v2, :cond_a

    .line 302
    const-string v2, "userMetadata"

    .line 304
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseUser;->getMetadata()Lcom/google/firebase/auth/FirebaseUserMetadata;

    .line 307
    move-result-object v3

    .line 308
    check-cast v3, Lcom/google/firebase/auth/internal/zzah;

    .line 310
    invoke-virtual {v3}, Lcom/google/firebase/auth/internal/zzah;->zza()Lorg/json/JSONObject;

    .line 313
    move-result-object v3

    .line 314
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 317
    :cond_a
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseUser;->getMultiFactor()Lcom/google/firebase/auth/MultiFactor;

    .line 320
    move-result-object v2

    .line 321
    check-cast v2, Lcom/google/firebase/auth/internal/zzaj;

    .line 323
    invoke-virtual {v2}, Lcom/google/firebase/auth/MultiFactor;->getEnrolledFactors()Ljava/util/List;

    .line 326
    move-result-object v2

    .line 327
    if-eqz v2, :cond_c

    .line 329
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 332
    move-result v3

    .line 333
    if-nez v3, :cond_c

    .line 335
    new-instance v3, Lorg/json/JSONArray;

    .line 337
    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 340
    move v4, v1

    .line 341
    :goto_5
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 344
    move-result v5

    .line 345
    if-ge v4, v5, :cond_b

    .line 347
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 350
    move-result-object v5

    .line 351
    check-cast v5, Lcom/google/firebase/auth/MultiFactorInfo;

    .line 353
    invoke-virtual {v5}, Lcom/google/firebase/auth/MultiFactorInfo;->toJson()Lorg/json/JSONObject;

    .line 356
    move-result-object v5

    .line 357
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 360
    add-int/lit8 v4, v4, 0x1

    .line 362
    goto :goto_5

    .line 363
    :cond_b
    const-string v2, "userMultiFactorInfo"

    .line 365
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 368
    :cond_c
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseUser;->zzf()Ljava/util/List;

    .line 371
    move-result-object p1

    .line 372
    if-eqz p1, :cond_e

    .line 374
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 377
    move-result v2

    .line 378
    if-nez v2, :cond_e

    .line 380
    new-instance v2, Lorg/json/JSONArray;

    .line 382
    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 385
    move v3, v1

    .line 386
    :goto_6
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 389
    move-result v4

    .line 390
    if-ge v3, v4, :cond_d

    .line 392
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 395
    move-result-object v4

    .line 396
    check-cast v4, Lcom/google/firebase/auth/zzan;

    .line 398
    invoke-static {v4}, Lcom/google/firebase/auth/zzan;->zza(Lcom/google/firebase/auth/zzan;)Lorg/json/JSONObject;

    .line 401
    move-result-object v4

    .line 402
    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 405
    add-int/lit8 v3, v3, 0x1

    .line 407
    goto :goto_6

    .line 408
    :cond_d
    const-string p1, "passkeyInfo"

    .line 410
    invoke-virtual {v0, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 413
    :cond_e
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 416
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 417
    return-object p0

    .line 418
    :goto_7
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzcb;->zzd:Lcom/google/android/gms/common/logging/Logger;

    .line 420
    const-string v0, "Failed to turn object into JSON"

    .line 422
    new-array v1, v1, [Ljava/lang/Object;

    .line 424
    invoke-virtual {p0, v0, p1, v1}, Lcom/google/android/gms/common/logging/Logger;->wtf(Ljava/lang/String;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 427
    new-instance p0, Lcom/google/android/gms/internal/firebase-auth-api/zzaao;

    .line 429
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaao;-><init>(Ljava/lang/Throwable;)V

    .line 432
    throw p0

    .line 433
    :cond_f
    const/4 p0, 0x0

    .line 434
    return-object p0
.end method


# virtual methods
.method public final zza(Lcom/google/firebase/auth/FirebaseUser;)Lcom/google/android/gms/internal/firebase-auth-api/zzahv;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 9
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseUser;->getUid()Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "com.google.firebase.auth.GET_TOKEN_RESPONSE.%s"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/firebase/auth/internal/zzcb;->zza(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 11
    :try_start_0
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzahv;->zzb(Ljava/lang/String;)Lcom/google/android/gms/internal/firebase-auth-api/zzahv;

    move-result-object p0
    :try_end_0
    .catch Lcom/google/android/gms/internal/firebase-auth-api/zzaao; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 12
    :catch_0
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzcb;->zzd:Lcom/google/android/gms/common/logging/Logger;

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Object;

    const-string v0, "Failed to restore token data from persistent storage."

    invoke-virtual {p0, v0, p1}, Lcom/google/android/gms/common/logging/Logger;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public final zza()Lcom/google/firebase/auth/FirebaseUser;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const-string v0, "type"

    const-string v1, "com.google.firebase.auth.FIREBASE_USER"

    invoke-direct {p0, v1}, Lcom/google/firebase/auth/internal/zzcb;->zza(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    return-object v3

    .line 3
    :cond_0
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 4
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 5
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 6
    const-string v1, "com.google.firebase.auth.internal.DefaultFirebaseUser"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 7
    invoke-direct {p0, v2}, Lcom/google/firebase/auth/internal/zzcb;->zza(Lorg/json/JSONObject;)Lcom/google/firebase/auth/internal/zzaf;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    .line 8
    :catch_0
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzcb;->zzd:Lcom/google/android/gms/common/logging/Logger;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, "Failed to restore user data from persistent storage."

    invoke-virtual {p0, v1, v0}, Lcom/google/android/gms/common/logging/Logger;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_1
    return-object v3
.end method

.method public final zza(Lcom/google/firebase/auth/FirebaseUser;Lcom/google/android/gms/internal/firebase-auth-api/zzahv;)V
    .locals 1

    .line 62
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    invoke-static {p2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseUser;->getUid()Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "com.google.firebase.auth.GET_TOKEN_RESPONSE.%s"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzahv;->zzf()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/google/firebase/auth/internal/zzcb;->zza(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final zzb()V
    .locals 1

    .line 2
    const-string v0, "com.google.firebase.auth.FIREBASE_USER"

    invoke-direct {p0, v0}, Lcom/google/firebase/auth/internal/zzcb;->zzb(Ljava/lang/String;)V

    return-void
.end method

.method public final zzb(Lcom/google/firebase/auth/FirebaseUser;)V
    .locals 1

    .line 3
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    invoke-virtual {p1}, Lcom/google/firebase/auth/FirebaseUser;->getUid()Ljava/lang/String;

    move-result-object p1

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object p1

    const-string v0, "com.google.firebase.auth.GET_TOKEN_RESPONSE.%s"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/firebase/auth/internal/zzcb;->zzb(Ljava/lang/String;)V

    return-void
.end method

.method public final zzc(Lcom/google/firebase/auth/FirebaseUser;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    invoke-direct {p0, p1}, Lcom/google/firebase/auth/internal/zzcb;->zzd(Lcom/google/firebase/auth/FirebaseUser;)Ljava/lang/String;

    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 14
    const-string v0, "com.google.firebase.auth.FIREBASE_USER"

    .line 16
    invoke-direct {p0, v0, p1}, Lcom/google/firebase/auth/internal/zzcb;->zza(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    :cond_0
    return-void
.end method
