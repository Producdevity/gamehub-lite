.class public Lcn/jpush/android/service/AlarmReceiver;
.super Landroid/content/BroadcastReceiver;


# static fields
.field private static final TAG:Ljava/lang/String; = "AlarmReceiver"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6

    .line 1
    const-string p0, "onReceive"

    .line 3
    const-string p2, "AlarmReceiver"

    .line 5
    invoke-static {p2, p0}, Lcn/jiguang/bb/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    invoke-static {}, Lcn/jiguang/ba/h;->b()Z

    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 14
    const-string p0, "[key-step]Your sdk is disabled already, no receiver task can be handled."

    .line 16
    invoke-static {p2, p0}, Lcn/jiguang/bb/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    return-void

    .line 20
    :cond_0
    invoke-static {}, Lcn/jiguang/ba/i;->a()Z

    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_1

    .line 26
    const-string p0, "[key-step]Your sdk is limited already, no receiver task can be handled."

    .line 28
    invoke-static {p2, p0}, Lcn/jiguang/bb/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    return-void

    .line 32
    :cond_1
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 34
    const/16 v0, 0x1f

    .line 36
    if-lt p0, v0, :cond_2

    .line 38
    const-string p0, "sdk is android 12, return"

    .line 40
    invoke-static {p2, p0}, Lcn/jiguang/bb/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    return-void

    .line 44
    :cond_2
    invoke-static {p1}, Lcn/jiguang/bz/b;->b(Landroid/content/Context;)Z

    .line 47
    move-result p0

    .line 48
    if-nez p0, :cond_3

    .line 50
    const-string p0, "auto wakeup is closed"

    .line 52
    invoke-static {p2, p0}, Lcn/jiguang/bb/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    return-void

    .line 56
    :cond_3
    sget-object p0, Lcn/jiguang/internal/JConstants;->isCallInit:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 58
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 61
    move-result p0

    .line 62
    if-nez p0, :cond_4

    .line 64
    const-string p0, "please call init"

    .line 66
    invoke-static {p2, p0}, Lcn/jiguang/bb/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    return-void

    .line 70
    :cond_4
    invoke-static {p1}, Lcn/jiguang/bi/a;->b(Landroid/content/Context;)V

    .line 73
    const/4 p0, 0x0

    .line 74
    new-array v5, p0, [Ljava/lang/Object;

    .line 76
    const-string v1, "JCore"

    .line 78
    const/16 v2, 0xa

    .line 80
    const-string v3, "a2"

    .line 82
    const/4 v4, 0x0

    .line 83
    move-object v0, p1

    .line 84
    invoke-static/range {v0 .. v5}, Lcn/jiguang/api/JCoreManager;->onEvent(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Landroid/os/Bundle;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    return-void
.end method
