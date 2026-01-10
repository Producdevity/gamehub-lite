.class public final synthetic Lcom/google/firebase/heartbeatinfo/i;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:J


# direct methods
.method public synthetic constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput-wide p1, p0, Lcom/google/firebase/heartbeatinfo/i;->a:J

    .line 6
    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/google/firebase/heartbeatinfo/i;->a:J

    .line 3
    check-cast p1, Landroidx/datastore/preferences/core/MutablePreferences;

    .line 5
    invoke-static {v0, v1, p1}, Lcom/google/firebase/heartbeatinfo/HeartBeatInfoStorage;->a(JLandroidx/datastore/preferences/core/MutablePreferences;)Lkotlin/Unit;

    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
