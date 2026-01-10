.class public Lcn/jpush/android/service/TagAliasReceiver;
.super Landroid/content/BroadcastReceiver;


# static fields
.field public static final ACTION_TAG_ALIAS_CALLBACK:Ljava/lang/String; = "cn.jpush.android.intent.TAG_ALIAS_CALLBACK"

.field public static final ACTION_TAG_ALIAS_TIMEOUT:Ljava/lang/String; = "cn.jpush.android.intent.TAG_ALIAS_TIMEOUT"

.field public static final KEY_TAGALIASOPERATOR_CALLBACKCODE:Ljava/lang/String; = "tagalias_errorcode"

.field public static final KEY_TAGALIASOPERATOR_SEQID:Ljava/lang/String; = "tagalias_seqid"

.field private static final TAG:Ljava/lang/String; = "TagAliasReceiver"


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
    .locals 9

    .line 1
    const-string p0, "TagAliasReceiver"

    .line 3
    if-nez p2, :cond_0

    .line 5
    const-string p1, "TagAliasOperator onReceive intent is null"

    .line 7
    invoke-static {p0, p1}, Lcn/jpush/android/helper/Logger;->ww(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    return-void

    .line 11
    :cond_0
    const-string v0, "tagalias_seqid"

    .line 13
    const-wide/16 v1, -0x1

    .line 15
    invoke-virtual {p2, v0, v1, v2}, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J

    .line 18
    move-result-wide v5

    .line 19
    const-string v0, "tagalias_errorcode"

    .line 21
    const/4 v3, 0x0

    .line 22
    invoke-virtual {p2, v0, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 25
    move-result v7

    .line 26
    cmp-long v0, v5, v1

    .line 28
    if-nez v0, :cond_1

    .line 30
    const-string p1, "TagAliasOperator onReceive rid is invalide"

    .line 32
    invoke-static {p0, p1}, Lcn/jpush/android/helper/Logger;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    return-void

    .line 36
    :cond_1
    invoke-static {}, Lcn/jpush/android/local/ActionHelper;->getInstance()Lcn/jpush/android/local/ActionHelper;

    .line 39
    move-result-object v3

    .line 40
    move-object v4, p1

    .line 41
    move-object v8, p2

    .line 42
    invoke-virtual/range {v3 .. v8}, Lcn/jpush/android/local/ActionHelper;->onTagAliasResponse(Landroid/content/Context;JILandroid/content/Intent;)V

    .line 45
    return-void
.end method
