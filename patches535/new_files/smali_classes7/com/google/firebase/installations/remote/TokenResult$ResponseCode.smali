.class public final enum Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;
.super Ljava/lang/Enum;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/firebase/installations/remote/TokenResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ResponseCode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;

.field public static final enum AUTH_ERROR:Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;

.field public static final enum BAD_CONFIG:Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;

.field public static final enum OK:Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;


# direct methods
.method private static synthetic $values()[Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;
    .locals 3

    sget-object v0, Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;->OK:Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;

    sget-object v1, Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;->BAD_CONFIG:Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;

    sget-object v2, Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;->AUTH_ERROR:Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;

    filled-new-array {v0, v1, v2}, [Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;

    const-string v1, "OK"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;->OK:Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;

    new-instance v0, Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;

    const-string v1, "BAD_CONFIG"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;->BAD_CONFIG:Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;

    new-instance v0, Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;

    const-string v1, "AUTH_ERROR"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;->AUTH_ERROR:Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;

    invoke-static {}, Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;->$values()[Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;

    move-result-object v0

    sput-object v0, Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;->$VALUES:[Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;
    .locals 1

    const-class v0, Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;

    return-object p0
.end method

.method public static values()[Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;
    .locals 1

    sget-object v0, Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;->$VALUES:[Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;

    invoke-virtual {v0}, [Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/google/firebase/installations/remote/TokenResult$ResponseCode;

    return-object v0
.end method
