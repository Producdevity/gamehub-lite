.class public Lcom/google/firebase/installations/RandomFidGenerator;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"


# static fields
.field private static final FID_4BIT_PREFIX:B

.field private static final FID_LENGTH:I = 0x16

.field private static final REMOVE_PREFIX_MASK:B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "01110000"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/lang/Byte;->parseByte(Ljava/lang/String;I)B

    move-result v0

    sput-byte v0, Lcom/google/firebase/installations/RandomFidGenerator;->FID_4BIT_PREFIX:B

    const-string v0, "00001111"

    invoke-static {v0, v1}, Ljava/lang/Byte;->parseByte(Ljava/lang/String;I)B

    move-result v0

    sput-byte v0, Lcom/google/firebase/installations/RandomFidGenerator;->REMOVE_PREFIX_MASK:B

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static encodeFidBase64UrlSafe([B)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/String;

    const/16 v1, 0xb

    invoke-static {p0, v1}, Landroid/util/Base64;->encode([BI)[B

    move-result-object p0

    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    const/4 p0, 0x0

    const/16 v1, 0x16

    invoke-virtual {v0, p0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getBytesFromUUID(Ljava/util/UUID;[B)[B
    .locals 2

    invoke-static {p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-virtual {p0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {p0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public createRandomFid()Ljava/lang/String;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p0

    const/16 v0, 0x11

    new-array v0, v0, [B

    invoke-static {p0, v0}, Lcom/google/firebase/installations/RandomFidGenerator;->getBytesFromUUID(Ljava/util/UUID;[B)[B

    move-result-object p0

    const/4 v0, 0x0

    aget-byte v1, p0, v0

    const/16 v2, 0x10

    aput-byte v1, p0, v2

    sget-byte v2, Lcom/google/firebase/installations/RandomFidGenerator;->REMOVE_PREFIX_MASK:B

    and-int/2addr v1, v2

    sget-byte v2, Lcom/google/firebase/installations/RandomFidGenerator;->FID_4BIT_PREFIX:B

    or-int/2addr v1, v2

    int-to-byte v1, v1

    aput-byte v1, p0, v0

    invoke-static {p0}, Lcom/google/firebase/installations/RandomFidGenerator;->encodeFidBase64UrlSafe([B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
