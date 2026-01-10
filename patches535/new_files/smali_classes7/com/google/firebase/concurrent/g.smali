.class public final synthetic Lcom/google/firebase/concurrent/g;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"

# interfaces
.implements Lcom/google/firebase/concurrent/DelegatingScheduledFuture$Resolver;


# instance fields
.field public final synthetic a:Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;

.field public final synthetic b:Ljava/lang/Runnable;

.field public final synthetic c:J

.field public final synthetic d:J

.field public final synthetic e:Ljava/util/concurrent/TimeUnit;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput-object p1, p0, Lcom/google/firebase/concurrent/g;->a:Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;

    .line 6
    iput-object p2, p0, Lcom/google/firebase/concurrent/g;->b:Ljava/lang/Runnable;

    .line 8
    iput-wide p3, p0, Lcom/google/firebase/concurrent/g;->c:J

    .line 10
    iput-wide p5, p0, Lcom/google/firebase/concurrent/g;->d:J

    .line 12
    iput-object p7, p0, Lcom/google/firebase/concurrent/g;->e:Ljava/util/concurrent/TimeUnit;

    .line 14
    return-void
.end method


# virtual methods
.method public final addCompleter(Lcom/google/firebase/concurrent/DelegatingScheduledFuture$Completer;)Ljava/util/concurrent/ScheduledFuture;
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/google/firebase/concurrent/g;->a:Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;

    .line 3
    iget-object v1, p0, Lcom/google/firebase/concurrent/g;->b:Ljava/lang/Runnable;

    .line 5
    iget-wide v2, p0, Lcom/google/firebase/concurrent/g;->c:J

    .line 7
    iget-wide v4, p0, Lcom/google/firebase/concurrent/g;->d:J

    .line 9
    iget-object v6, p0, Lcom/google/firebase/concurrent/g;->e:Ljava/util/concurrent/TimeUnit;

    .line 11
    move-object v7, p1

    .line 12
    invoke-static/range {v0 .. v7}, Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;->d(Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;Lcom/google/firebase/concurrent/DelegatingScheduledFuture$Completer;)Ljava/util/concurrent/ScheduledFuture;

    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method
