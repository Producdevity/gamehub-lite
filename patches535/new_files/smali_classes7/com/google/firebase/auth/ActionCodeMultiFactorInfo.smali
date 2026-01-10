.class public abstract Lcom/google/firebase/auth/ActionCodeMultiFactorInfo;
.super Lcom/google/firebase/auth/ActionCodeInfo;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/firebase/auth/ActionCodeInfo;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getMultiFactorInfo()Lcom/google/firebase/auth/MultiFactorInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end method
