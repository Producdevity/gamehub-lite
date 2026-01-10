.class public Lcn/jpush/android/service/InitProvider;
.super Landroid/content/ContentProvider;


# static fields
.field private static final TAG:Ljava/lang/String; = "InitProvider"

.field public static final synthetic a:I


# instance fields
.field private actionHelperClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private actionHelperInstance:Ljava/lang/Object;

.field private onJPushMessageReceiveMethod:Ljava/lang/reflect/Method;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    .line 4
    return-void
.end method

.method private getProviderProcessName(Landroid/content/Context;)Ljava/lang/String;
    .locals 4

    .line 1
    const-string p0, "InitProvider"

    .line 3
    const/4 v0, 0x0

    .line 4
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 7
    move-result-object v1

    .line 8
    new-instance v2, Landroid/content/ComponentName;

    .line 10
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 13
    move-result-object p1

    .line 14
    const-class v3, Lcn/jpush/android/service/InitProvider;

    .line 16
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 19
    move-result-object v3

    .line 20
    invoke-direct {v2, p1, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    const/4 p1, 0x0

    .line 24
    invoke-virtual {v1, v2, p1}, Landroid/content/pm/PackageManager;->getProviderInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ProviderInfo;

    .line 27
    move-result-object p1

    .line 28
    iget-object p0, p1, Landroid/content/pm/ProviderInfo;->processName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    return-object p0

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_0

    .line 33
    :catch_0
    move-exception p1

    .line 34
    goto :goto_2

    .line 35
    :goto_0
    const-string v1, "getProviderProcessName error"

    .line 37
    :goto_1
    invoke-static {p0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 40
    return-object v0

    .line 41
    :goto_2
    const-string v1, "Provider not found"

    .line 43
    goto :goto_1
.end method


# virtual methods
.method public call(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 7

    .line 1
    const-class v0, Ljava/lang/String;

    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    invoke-virtual {p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    .line 7
    move-result-object v2

    .line 8
    sget-object v3, Lcn/jiguang/internal/JConstants;->isCallInit:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 10
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 13
    move-result v3

    .line 14
    if-eqz v3, :cond_3

    .line 16
    if-eqz v2, :cond_3

    .line 18
    new-instance v3, Ljava/lang/StringBuilder;

    .line 20
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 26
    move-result-object v4

    .line 27
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    const-string v4, ".permission.JPUSH_MESSAGE"

    .line 32
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v2, v3}, Landroid/content/Context;->checkCallingPermission(Ljava/lang/String;)I

    .line 42
    move-result v3

    .line 43
    if-nez v3, :cond_3

    .line 45
    iget-object v3, p0, Lcn/jpush/android/service/InitProvider;->actionHelperClass:Ljava/lang/Class;

    .line 47
    const/4 v4, 0x2

    .line 48
    if-nez v3, :cond_0

    .line 50
    new-instance v3, Ljava/lang/String;

    .line 52
    const-string v5, "Y24uanB1c2guYW5kcm9pZC5sb2NhbC5BY3Rpb25IZWxwZXI="

    .line 54
    invoke-static {v5, v4}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 57
    move-result-object v5

    .line 58
    invoke-direct {v3, v5}, Ljava/lang/String;-><init>([B)V

    .line 61
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 64
    move-result-object v3

    .line 65
    iput-object v3, p0, Lcn/jpush/android/service/InitProvider;->actionHelperClass:Ljava/lang/Class;

    .line 67
    :cond_0
    iget-object v3, p0, Lcn/jpush/android/service/InitProvider;->actionHelperInstance:Ljava/lang/Object;

    .line 69
    if-nez v3, :cond_1

    .line 71
    iget-object v3, p0, Lcn/jpush/android/service/InitProvider;->actionHelperClass:Ljava/lang/Class;

    .line 73
    new-instance v5, Ljava/lang/String;

    .line 75
    const-string v6, "Z2V0SW5zdGFuY2U="

    .line 77
    invoke-static {v6, v4}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 80
    move-result-object v6

    .line 81
    invoke-direct {v5, v6}, Ljava/lang/String;-><init>([B)V

    .line 84
    invoke-virtual {v3, v5, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 87
    move-result-object v3

    .line 88
    invoke-virtual {v3, v1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    move-result-object v3

    .line 92
    iput-object v3, p0, Lcn/jpush/android/service/InitProvider;->actionHelperInstance:Ljava/lang/Object;

    .line 94
    :cond_1
    iget-object v3, p0, Lcn/jpush/android/service/InitProvider;->onJPushMessageReceiveMethod:Ljava/lang/reflect/Method;

    .line 96
    if-nez v3, :cond_2

    .line 98
    iget-object v3, p0, Lcn/jpush/android/service/InitProvider;->actionHelperClass:Ljava/lang/Class;

    .line 100
    new-instance v5, Ljava/lang/String;

    .line 102
    const-string v6, "b25KUHVzaE1lc3NhZ2VSZWNlaXZl"

    .line 104
    invoke-static {v6, v4}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 107
    move-result-object v4

    .line 108
    invoke-direct {v5, v4}, Ljava/lang/String;-><init>([B)V

    .line 111
    const-class v4, Landroid/content/Context;

    .line 113
    const-class v6, Landroid/os/Bundle;

    .line 115
    filled-new-array {v4, v0, v0, v6}, [Ljava/lang/Class;

    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {v3, v5, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 122
    move-result-object v0

    .line 123
    iput-object v0, p0, Lcn/jpush/android/service/InitProvider;->onJPushMessageReceiveMethod:Ljava/lang/reflect/Method;

    .line 125
    :cond_2
    iget-object v0, p0, Lcn/jpush/android/service/InitProvider;->onJPushMessageReceiveMethod:Ljava/lang/reflect/Method;

    .line 127
    iget-object p0, p0, Lcn/jpush/android/service/InitProvider;->actionHelperInstance:Ljava/lang/Object;

    .line 129
    filled-new-array {v2, p1, p2, p3}, [Ljava/lang/Object;

    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 136
    :catchall_0
    :cond_3
    return-object v1
.end method

.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public onCreate()Z
    .locals 5

    .line 1
    const-string v0, "InitProvider onCreate"

    .line 3
    const-string v1, "InitProvider"

    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    const/4 v0, 0x0

    .line 9
    :try_start_0
    invoke-virtual {p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;

    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Landroid/app/Application;

    .line 15
    invoke-direct {p0, v2}, Lcn/jpush/android/service/InitProvider;->getProviderProcessName(Landroid/content/Context;)Ljava/lang/String;

    .line 18
    move-result-object p0

    .line 19
    invoke-static {v2}, Lcn/jiguang/internal/JConstants;->getAppContext(Landroid/content/Context;)Landroid/content/Context;

    .line 22
    new-instance v3, Ljava/lang/StringBuilder;

    .line 24
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    const-string v4, "InitProvider process: "

    .line 29
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    move-result-object v3

    .line 39
    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    if-eqz v2, :cond_0

    .line 44
    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 47
    move-result-object v3

    .line 48
    invoke-static {p0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 51
    move-result v3

    .line 52
    if-eqz v3, :cond_0

    .line 54
    invoke-static {v2, v0}, Lcn/jiguang/d/a;->a(Landroid/content/Context;Z)V

    .line 57
    goto :goto_1

    .line 58
    :catchall_0
    move-exception p0

    .line 59
    goto :goto_0

    .line 60
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 62
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    const-string v3, "InitProvider is not in main process. processName: "

    .line 67
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    move-result-object p0

    .line 77
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    goto :goto_1

    .line 81
    :goto_0
    const-string v2, "InitProvider onCreate error"

    .line 83
    invoke-static {v1, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 86
    :goto_1
    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
