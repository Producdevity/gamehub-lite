.class public Lcn/jpush/android/service/WakedResultReceiver;
.super Landroid/content/BroadcastReceiver;


# static fields
.field public static final CONTEXT_KEY:Ljava/lang/String; = "1"

.field public static final WAKE_TYPE_KEY:Ljava/lang/String; = "2"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onWake(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onWake(Landroid/content/Context;I)V
    .locals 0

    .line 2
    return-void
.end method

.method public final onWakeMap(Ljava/util/Map;)V
    .locals 2

    .line 1
    :try_start_0
    const-string v0, "2"

    .line 3
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 14
    move-result v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, -0x1

    .line 17
    :goto_0
    invoke-virtual {p0, v0}, Lcn/jpush/android/service/WakedResultReceiver;->onWake(I)V

    .line 20
    const-string v1, "1"

    .line 22
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    move-result-object p1

    .line 26
    if-eqz p1, :cond_1

    .line 28
    check-cast p1, Landroid/content/Context;

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    const/4 p1, 0x0

    .line 32
    :goto_1
    invoke-virtual {p0, p1, v0}, Lcn/jpush/android/service/WakedResultReceiver;->onWake(Landroid/content/Context;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 35
    :catchall_0
    return-void
.end method
