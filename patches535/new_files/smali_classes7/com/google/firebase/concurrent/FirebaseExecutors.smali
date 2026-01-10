.class public Lcom/google/firebase/concurrent/FirebaseExecutors;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/concurrent/FirebaseExecutors$DirectExecutor;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static directExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    sget-object v0, Lcom/google/firebase/concurrent/FirebaseExecutors$DirectExecutor;->INSTANCE:Lcom/google/firebase/concurrent/FirebaseExecutors$DirectExecutor;

    return-object v0
.end method

.method public static newLimitedConcurrencyExecutor(Ljava/util/concurrent/Executor;I)Ljava/util/concurrent/Executor;
    .locals 1

    new-instance v0, Lcom/google/firebase/concurrent/LimitedConcurrencyExecutor;

    invoke-direct {v0, p0, p1}, Lcom/google/firebase/concurrent/LimitedConcurrencyExecutor;-><init>(Ljava/util/concurrent/Executor;I)V

    return-object v0
.end method

.method public static newLimitedConcurrencyExecutorService(Ljava/util/concurrent/ExecutorService;I)Ljava/util/concurrent/ExecutorService;
    .locals 1

    new-instance v0, Lcom/google/firebase/concurrent/LimitedConcurrencyExecutorService;

    invoke-direct {v0, p0, p1}, Lcom/google/firebase/concurrent/LimitedConcurrencyExecutorService;-><init>(Ljava/util/concurrent/ExecutorService;I)V

    return-object v0
.end method

.method public static newLimitedConcurrencyScheduledExecutorService(Ljava/util/concurrent/ExecutorService;I)Ljava/util/concurrent/ScheduledExecutorService;
    .locals 1

    new-instance v0, Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;

    invoke-static {p0, p1}, Lcom/google/firebase/concurrent/FirebaseExecutors;->newLimitedConcurrencyExecutorService(Ljava/util/concurrent/ExecutorService;I)Ljava/util/concurrent/ExecutorService;

    move-result-object p0

    sget-object p1, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->SCHEDULER:Lcom/google/firebase/components/Lazy;

    invoke-virtual {p1}, Lcom/google/firebase/components/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/ScheduledExecutorService;

    invoke-direct {v0, p0, p1}, Lcom/google/firebase/concurrent/DelegatingScheduledExecutorService;-><init>(Ljava/util/concurrent/ExecutorService;Ljava/util/concurrent/ScheduledExecutorService;)V

    return-object v0
.end method

.method public static newPausableExecutor(Ljava/util/concurrent/Executor;)Lcom/google/firebase/concurrent/PausableExecutor;
    .locals 2

    new-instance v0, Lcom/google/firebase/concurrent/PausableExecutorImpl;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Lcom/google/firebase/concurrent/PausableExecutorImpl;-><init>(ZLjava/util/concurrent/Executor;)V

    return-object v0
.end method

.method public static newPausableExecutorService(Ljava/util/concurrent/ExecutorService;)Lcom/google/firebase/concurrent/PausableExecutorService;
    .locals 2

    new-instance v0, Lcom/google/firebase/concurrent/PausableExecutorServiceImpl;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Lcom/google/firebase/concurrent/PausableExecutorServiceImpl;-><init>(ZLjava/util/concurrent/ExecutorService;)V

    return-object v0
.end method

.method public static newPausableScheduledExecutorService(Ljava/util/concurrent/ScheduledExecutorService;)Lcom/google/firebase/concurrent/PausableScheduledExecutorService;
    .locals 2

    new-instance v0, Lcom/google/firebase/concurrent/PausableScheduledExecutorServiceImpl;

    invoke-static {p0}, Lcom/google/firebase/concurrent/FirebaseExecutors;->newPausableExecutorService(Ljava/util/concurrent/ExecutorService;)Lcom/google/firebase/concurrent/PausableExecutorService;

    move-result-object p0

    sget-object v1, Lcom/google/firebase/concurrent/ExecutorsRegistrar;->SCHEDULER:Lcom/google/firebase/components/Lazy;

    invoke-virtual {v1}, Lcom/google/firebase/components/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/ScheduledExecutorService;

    invoke-direct {v0, p0, v1}, Lcom/google/firebase/concurrent/PausableScheduledExecutorServiceImpl;-><init>(Lcom/google/firebase/concurrent/PausableExecutorService;Ljava/util/concurrent/ScheduledExecutorService;)V

    return-object v0
.end method

.method public static newSequentialExecutor(Ljava/util/concurrent/Executor;)Ljava/util/concurrent/Executor;
    .locals 1

    new-instance v0, Lcom/google/firebase/concurrent/SequentialExecutor;

    invoke-direct {v0, p0}, Lcom/google/firebase/concurrent/SequentialExecutor;-><init>(Ljava/util/concurrent/Executor;)V

    return-object v0
.end method
