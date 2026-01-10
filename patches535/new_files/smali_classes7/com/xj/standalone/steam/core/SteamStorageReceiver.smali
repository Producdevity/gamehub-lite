.class public Lcom/xj/standalone/steam/core/SteamStorageReceiver;
.super Landroid/content/BroadcastReceiver;


# static fields
.field private static final ACTION_GET_CURRENT:Ljava/lang/String; = "emuready.gamehub.lite.GET_STEAM_STORAGE"

.field private static final ACTION_SET_PATH:Ljava/lang/String; = "emuready.gamehub.lite.SET_STEAM_STORAGE"

.field private static final ACTION_USE_INTERNAL:Ljava/lang/String; = "emuready.gamehub.lite.USE_INTERNAL_STORAGE"

.field private static final EXTRA_PATH:Ljava/lang/String; = "path"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    sget-object v1, Lcom/xj/standalone/steam/core/SteamStoragePreference;->INSTANCE:Lcom/xj/standalone/steam/core/SteamStoragePreference;

    const-string v2, "emuready.gamehub.lite.SET_STEAM_STORAGE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v2, "path"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v1, v3}, Lcom/xj/standalone/steam/core/SteamStoragePreference;->setStoragePath(Ljava/lang/String;)V

    const-string v2, "SteamStorage"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Steam storage path set to: "

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    const-string v2, "emuready.gamehub.lite.USE_INTERNAL_STORAGE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v1}, Lcom/xj/standalone/steam/core/SteamStoragePreference;->useInternalStorage()V

    const-string v2, "SteamStorage"

    const-string v3, "Switched to internal storage"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const-string v2, "emuready.gamehub.lite.GET_STEAM_STORAGE"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v2, "SteamStorage"

    invoke-virtual {v1}, Lcom/xj/standalone/steam/core/SteamStoragePreference;->getStorageStatus()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_0
    return-void
.end method
