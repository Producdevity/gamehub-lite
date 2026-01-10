.class public interface abstract Lcom/google/firebase/auth/FirebaseAuth$AuthStateListener;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/auth/FirebaseAuth;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "AuthStateListener"
.end annotation


# virtual methods
.method public abstract onAuthStateChanged(Lcom/google/firebase/auth/FirebaseAuth;)V
    .param p1    # Lcom/google/firebase/auth/FirebaseAuth;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
.end method
