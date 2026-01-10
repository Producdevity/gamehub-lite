.class public final synthetic Lcom/google/firebase/concurrent/v;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/google/firebase/concurrent/LimitedConcurrencyExecutor;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/concurrent/LimitedConcurrencyExecutor;Ljava/lang/Runnable;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/concurrent/v;->a:Lcom/google/firebase/concurrent/LimitedConcurrencyExecutor;

    iput-object p2, p0, Lcom/google/firebase/concurrent/v;->b:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/google/firebase/concurrent/v;->a:Lcom/google/firebase/concurrent/LimitedConcurrencyExecutor;

    iget-object p0, p0, Lcom/google/firebase/concurrent/v;->b:Ljava/lang/Runnable;

    invoke-static {v0, p0}, Lcom/google/firebase/concurrent/LimitedConcurrencyExecutor;->a(Lcom/google/firebase/concurrent/LimitedConcurrencyExecutor;Ljava/lang/Runnable;)V

    return-void
.end method
