.class public interface abstract Lcom/google/firebase/auth/ActionCodeResult;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/firebase/auth/ActionCodeResult$ActionDataKey;,
        Lcom/google/firebase/auth/ActionCodeResult$Operation;
    }
.end annotation


# static fields
.field public static final EMAIL:I = 0x0

.field public static final ERROR:I = 0x3

.field public static final FROM_EMAIL:I = 0x1

.field public static final PASSWORD_RESET:I = 0x0

.field public static final RECOVER_EMAIL:I = 0x2

.field public static final REVERT_SECOND_FACTOR_ADDITION:I = 0x6

.field public static final SIGN_IN_WITH_EMAIL_LINK:I = 0x4

.field public static final VERIFY_BEFORE_CHANGE_EMAIL:I = 0x5

.field public static final VERIFY_EMAIL:I = 0x1


# virtual methods
.method public abstract getData(I)Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract getInfo()Lcom/google/firebase/auth/ActionCodeInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end method

.method public abstract getOperation()I
.end method
