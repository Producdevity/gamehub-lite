.class public final synthetic Lcom/google/firebase/concurrent/l;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;

.field public final synthetic b:Ljava/util/concurrent/Callable;

.field public final synthetic c:Lcom/google/firebase/concurrent/DelegatingScheduledFuture$Completer;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;Ljava/util/concurrent/Callable;Lcom/google/firebase/concurrent/DelegatingScheduledFuture$Completer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput-object p1, p0, Lcom/google/firebase/concurrent/l;->a:Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;

    .line 6
    iput-object p2, p0, Lcom/google/firebase/concurrent/l;->b:Ljava/util/concurrent/Callable;

    .line 8
    iput-object p3, p0, Lcom/google/firebase/concurrent/l;->c:Lcom/google/firebase/concurrent/DelegatingScheduledFuture$Completer;

    .line 10
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/firebase/concurrent/l;->a:Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;

    .line 3
    iget-object v1, p0, Lcom/google/firebase/concurrent/l;->b:Ljava/util/concurrent/Callable;

    .line 5
    iget-object p0, p0, Lcom/google/firebase/concurrent/l;->c:Lcom/google/firebase/concurrent/DelegatingScheduledFuture$Completer;

    .line 7
    invoke-static {v0, v1, p0}, Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;->h(Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;Ljava/util/concurrent/Callable;Lcom/google/firebase/concurrent/DelegatingScheduledFuture$Completer;)Ljava/util/concurrent/Future;

    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
