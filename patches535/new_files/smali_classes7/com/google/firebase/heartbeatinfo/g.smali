.class public final synthetic Lcom/google/firebase/heartbeatinfo/g;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Lcom/google/firebase/heartbeatinfo/HeartBeatInfoStorage;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/heartbeatinfo/HeartBeatInfoStorage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput-object p1, p0, Lcom/google/firebase/heartbeatinfo/g;->a:Lcom/google/firebase/heartbeatinfo/HeartBeatInfoStorage;

    .line 6
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/firebase/heartbeatinfo/g;->a:Lcom/google/firebase/heartbeatinfo/HeartBeatInfoStorage;

    .line 3
    check-cast p1, Landroidx/datastore/preferences/core/MutablePreferences;

    .line 5
    invoke-static {p0, p1}, Lcom/google/firebase/heartbeatinfo/HeartBeatInfoStorage;->c(Lcom/google/firebase/heartbeatinfo/HeartBeatInfoStorage;Landroidx/datastore/preferences/core/MutablePreferences;)Lkotlin/Unit;

    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
