.class public final synthetic Lcom/google/firebase/heartbeatinfo/f;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/google/firebase/heartbeatinfo/HeartBeatInfoStorage;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Landroidx/datastore/preferences/core/Preferences$Key;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/heartbeatinfo/HeartBeatInfoStorage;Ljava/lang/String;Ljava/lang/String;Landroidx/datastore/preferences/core/Preferences$Key;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput-object p1, p0, Lcom/google/firebase/heartbeatinfo/f;->a:Lcom/google/firebase/heartbeatinfo/HeartBeatInfoStorage;

    .line 6
    iput-object p2, p0, Lcom/google/firebase/heartbeatinfo/f;->b:Ljava/lang/String;

    .line 8
    iput-object p3, p0, Lcom/google/firebase/heartbeatinfo/f;->c:Ljava/lang/String;

    .line 10
    iput-object p4, p0, Lcom/google/firebase/heartbeatinfo/f;->d:Landroidx/datastore/preferences/core/Preferences$Key;

    .line 12
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/firebase/heartbeatinfo/f;->a:Lcom/google/firebase/heartbeatinfo/HeartBeatInfoStorage;

    .line 3
    iget-object v1, p0, Lcom/google/firebase/heartbeatinfo/f;->b:Ljava/lang/String;

    .line 5
    iget-object v2, p0, Lcom/google/firebase/heartbeatinfo/f;->c:Ljava/lang/String;

    .line 7
    iget-object p0, p0, Lcom/google/firebase/heartbeatinfo/f;->d:Landroidx/datastore/preferences/core/Preferences$Key;

    .line 9
    check-cast p1, Landroidx/datastore/preferences/core/MutablePreferences;

    .line 11
    invoke-static {v0, v1, v2, p0, p1}, Lcom/google/firebase/heartbeatinfo/HeartBeatInfoStorage;->b(Lcom/google/firebase/heartbeatinfo/HeartBeatInfoStorage;Ljava/lang/String;Ljava/lang/String;Landroidx/datastore/preferences/core/Preferences$Key;Landroidx/datastore/preferences/core/MutablePreferences;)Lkotlin/Unit;

    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
