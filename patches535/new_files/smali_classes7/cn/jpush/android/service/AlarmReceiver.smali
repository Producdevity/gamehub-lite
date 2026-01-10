.class public Lcn/jpush/android/service/AlarmReceiver;
.super Landroid/content/BroadcastReceiver;


# static fields
.field private static final TAG:Ljava/lang/String; = "AlarmReceiver"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6

    const-string p0, "onReceive"

    const-string p2, "AlarmReceiver"

    invoke-static {p2, p0}, Lcn/jiguang/bb/f;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcn/jiguang/ba/h;->b()Z

    move-result p0

    if-eqz p0, :cond_0

    const-string p0, "[key-step]Your sdk is disabled already, no receiver task can be handled."

    invoke-static {p2, p0}, Lcn/jiguang/bb/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {}, Lcn/jiguang/ba/i;->a()Z

    move-result p0

    if-eqz p0, :cond_1

    const-string p0, "[key-step]Your sdk is limited already, no receiver task can be handled."

    invoke-static {p2, p0}, Lcn/jiguang/bb/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1f

    if-lt p0, v0, :cond_2

    const-string p0, "sdk is android 12, return"

    invoke-static {p2, p0}, Lcn/jiguang/bb/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    invoke-static {p1}, Lcn/jiguang/bz/b;->b(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_3

    const-string p0, "auto wakeup is closed"

    invoke-static {p2, p0}, Lcn/jiguang/bb/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_3
    sget-object p0, Lcn/jiguang/internal/JConstants;->isCallInit:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p0

    if-nez p0, :cond_4

    const-string p0, "please call init"

    invoke-static {p2, p0}, Lcn/jiguang/bb/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_4
    invoke-static {p1}, Lcn/jiguang/bi/a;->b(Landroid/content/Context;)V

    const/4 p0, 0x0

    new-array v5, p0, [Ljava/lang/Object;

    const-string v1, "JCore"

    const/16 v2, 0xa

    const-string v3, "a2"

    const/4 v4, 0x0

    move-object v0, p1

    invoke-static/range {v0 .. v5}, Lcn/jiguang/api/JCoreManager;->onEvent(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;Landroid/os/Bundle;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
