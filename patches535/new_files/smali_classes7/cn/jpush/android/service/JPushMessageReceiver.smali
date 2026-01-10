.class public abstract Lcn/jpush/android/service/JPushMessageReceiver;
.super Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 4
    return-void
.end method


# virtual methods
.method public getNotification(Landroid/content/Context;Lcn/jpush/android/api/NotificationMessage;)Landroid/app/Notification;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public isNeedShowNotification(Landroid/content/Context;Lcn/jpush/android/api/NotificationMessage;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public onAliasOperatorResult(Landroid/content/Context;Lcn/jpush/android/api/JPushMessage;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onCheckTagOperatorResult(Landroid/content/Context;Lcn/jpush/android/api/JPushMessage;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onCommandResult(Landroid/content/Context;Lcn/jpush/android/api/CmdMessage;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onConnected(Landroid/content/Context;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public onGeofenceReceived(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onGeofenceRegion(Landroid/content/Context;Ljava/lang/String;DD)V
    .locals 0

    .line 1
    return-void
.end method

.method public onInAppMessageClick(Landroid/content/Context;Lcn/jpush/android/api/NotificationMessage;)V
    .locals 0

    .line 1
    invoke-static {}, Lcn/jpush/android/local/ActionHelper;->getInstance()Lcn/jpush/android/local/ActionHelper;

    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Lcn/jpush/android/local/ActionHelper;->onInAppMessageClick(Landroid/content/Context;Lcn/jpush/android/api/NotificationMessage;)V

    .line 8
    return-void
.end method

.method public onInAppMessageShow(Landroid/content/Context;Lcn/jpush/android/api/NotificationMessage;)V
    .locals 0

    .line 1
    invoke-static {}, Lcn/jpush/android/local/ActionHelper;->getInstance()Lcn/jpush/android/local/ActionHelper;

    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Lcn/jpush/android/local/ActionHelper;->onInAppMessageShow(Landroid/content/Context;Lcn/jpush/android/api/NotificationMessage;)V

    .line 8
    return-void
.end method

.method public onMessage(Landroid/content/Context;Lcn/jpush/android/api/CustomMessage;)V
    .locals 0

    .line 1
    invoke-static {}, Lcn/jpush/android/local/ActionHelper;->getInstance()Lcn/jpush/android/local/ActionHelper;

    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Lcn/jpush/android/local/ActionHelper;->onMessage(Landroid/content/Context;Lcn/jpush/android/api/CustomMessage;)V

    .line 8
    return-void
.end method

.method public onMobileNumberOperatorResult(Landroid/content/Context;Lcn/jpush/android/api/JPushMessage;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onMultiActionClicked(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-static {}, Lcn/jpush/android/local/ActionHelper;->getInstance()Lcn/jpush/android/local/ActionHelper;

    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Lcn/jpush/android/local/ActionHelper;->onMultiAction(Landroid/content/Context;Landroid/content/Intent;)V

    .line 8
    return-void
.end method

.method public onNotificationSettingsCheck(Landroid/content/Context;ZI)V
    .locals 0

    .line 1
    return-void
.end method

.method public onNotifyMessageArrived(Landroid/content/Context;Lcn/jpush/android/api/NotificationMessage;)V
    .locals 0

    .line 1
    invoke-static {}, Lcn/jpush/android/local/ActionHelper;->getInstance()Lcn/jpush/android/local/ActionHelper;

    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Lcn/jpush/android/local/ActionHelper;->onNotifyMessageArrived(Landroid/content/Context;Lcn/jpush/android/api/NotificationMessage;)V

    .line 8
    return-void
.end method

.method public onNotifyMessageDismiss(Landroid/content/Context;Lcn/jpush/android/api/NotificationMessage;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onNotifyMessageOpened(Landroid/content/Context;Lcn/jpush/android/api/NotificationMessage;)V
    .locals 0

    .line 1
    invoke-static {}, Lcn/jpush/android/local/ActionHelper;->getInstance()Lcn/jpush/android/local/ActionHelper;

    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Lcn/jpush/android/local/ActionHelper;->onNotifyMessageOpened(Landroid/content/Context;Lcn/jpush/android/api/NotificationMessage;)V

    .line 8
    return-void
.end method

.method public onNotifyMessageUnShow(Landroid/content/Context;Lcn/jpush/android/api/NotificationMessage;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onPropertyOperatorResult(Landroid/content/Context;Lcn/jpush/android/api/JPushMessage;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 1
    invoke-static {}, Lcn/jpush/android/local/ActionHelper;->getInstance()Lcn/jpush/android/local/ActionHelper;

    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1, p0, p2}, Lcn/jpush/android/local/ActionHelper;->onJPushMessageReceive(Landroid/content/Context;Lcn/jpush/android/service/JPushMessageReceiver;Landroid/content/Intent;)V

    .line 8
    return-void
.end method

.method public onRegister(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onTagOperatorResult(Landroid/content/Context;Lcn/jpush/android/api/JPushMessage;)V
    .locals 0

    .line 1
    return-void
.end method
