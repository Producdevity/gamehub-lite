.class public final synthetic Lcom/google/firebase/components/q;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"

# interfaces
.implements Lcom/google/firebase/inject/Deferred$DeferredHandler;


# instance fields
.field public final synthetic a:Lcom/google/firebase/inject/Deferred$DeferredHandler;

.field public final synthetic b:Lcom/google/firebase/inject/Deferred$DeferredHandler;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/inject/Deferred$DeferredHandler;Lcom/google/firebase/inject/Deferred$DeferredHandler;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput-object p1, p0, Lcom/google/firebase/components/q;->a:Lcom/google/firebase/inject/Deferred$DeferredHandler;

    .line 6
    iput-object p2, p0, Lcom/google/firebase/components/q;->b:Lcom/google/firebase/inject/Deferred$DeferredHandler;

    .line 8
    return-void
.end method


# virtual methods
.method public final handle(Lcom/google/firebase/inject/Provider;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/firebase/components/q;->a:Lcom/google/firebase/inject/Deferred$DeferredHandler;

    .line 3
    iget-object p0, p0, Lcom/google/firebase/components/q;->b:Lcom/google/firebase/inject/Deferred$DeferredHandler;

    .line 5
    invoke-static {v0, p0, p1}, Lcom/google/firebase/components/OptionalProvider;->b(Lcom/google/firebase/inject/Deferred$DeferredHandler;Lcom/google/firebase/inject/Deferred$DeferredHandler;Lcom/google/firebase/inject/Provider;)V

    .line 8
    return-void
.end method
