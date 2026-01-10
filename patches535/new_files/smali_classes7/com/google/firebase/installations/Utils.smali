.class public final Lcom/google/firebase/installations/Utils;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"


# static fields
.field private static final API_KEY_FORMAT:Ljava/util/regex/Pattern;

.field private static final APP_ID_IDENTIFICATION_SUBSTRING:Ljava/lang/String; = ":"

.field public static final AUTH_TOKEN_EXPIRATION_BUFFER_IN_SECS:J

.field private static singleton:Lcom/google/firebase/installations/Utils;


# instance fields
.field private final clock:Lcom/google/firebase/installations/time/Clock;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    sget-object v0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v0

    sput-wide v0, Lcom/google/firebase/installations/Utils;->AUTH_TOKEN_EXPIRATION_BUFFER_IN_SECS:J

    const-string v0, "\\AA[\\w-]{38}\\z"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/google/firebase/installations/Utils;->API_KEY_FORMAT:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>(Lcom/google/firebase/installations/time/Clock;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/firebase/installations/Utils;->clock:Lcom/google/firebase/installations/time/Clock;

    return-void
.end method

.method public static getInstance()Lcom/google/firebase/installations/Utils;
    .locals 1

    invoke-static {}, Lcom/google/firebase/installations/time/SystemClock;->getInstance()Lcom/google/firebase/installations/time/SystemClock;

    move-result-object v0

    invoke-static {v0}, Lcom/google/firebase/installations/Utils;->getInstance(Lcom/google/firebase/installations/time/Clock;)Lcom/google/firebase/installations/Utils;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Lcom/google/firebase/installations/time/Clock;)Lcom/google/firebase/installations/Utils;
    .locals 1

    sget-object v0, Lcom/google/firebase/installations/Utils;->singleton:Lcom/google/firebase/installations/Utils;

    if-nez v0, :cond_0

    new-instance v0, Lcom/google/firebase/installations/Utils;

    invoke-direct {v0, p0}, Lcom/google/firebase/installations/Utils;-><init>(Lcom/google/firebase/installations/time/Clock;)V

    sput-object v0, Lcom/google/firebase/installations/Utils;->singleton:Lcom/google/firebase/installations/Utils;

    :cond_0
    sget-object p0, Lcom/google/firebase/installations/Utils;->singleton:Lcom/google/firebase/installations/Utils;

    return-object p0
.end method

.method public static isValidApiKeyFormat(Ljava/lang/String;)Z
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    sget-object v0, Lcom/google/firebase/installations/Utils;->API_KEY_FORMAT:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    move-result p0

    return p0
.end method

.method public static isValidAppIdFormat(Ljava/lang/String;)Z
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const-string v0, ":"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public currentTimeInMillis()J
    .locals 2

    iget-object p0, p0, Lcom/google/firebase/installations/Utils;->clock:Lcom/google/firebase/installations/time/Clock;

    invoke-interface {p0}, Lcom/google/firebase/installations/time/Clock;->currentTimeMillis()J

    move-result-wide v0

    return-wide v0
.end method

.method public currentTimeInSecs()J
    .locals 3

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p0}, Lcom/google/firebase/installations/Utils;->currentTimeInMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide v0

    return-wide v0
.end method

.method public getRandomDelayForSyncPrevention()J
    .locals 4

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v0

    const-wide v2, 0x408f400000000000L    # 1000.0

    mul-double/2addr v0, v2

    double-to-long v0, v0

    return-wide v0
.end method

.method public isAuthTokenExpired(Lcom/google/firebase/installations/local/PersistedInstallationEntry;)Z
    .locals 6
    .param p1    # Lcom/google/firebase/installations/local/PersistedInstallationEntry;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Lcom/google/firebase/installations/local/PersistedInstallationEntry;->getAuthToken()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p1}, Lcom/google/firebase/installations/local/PersistedInstallationEntry;->getTokenCreationEpochInSecs()J

    move-result-wide v2

    invoke-virtual {p1}, Lcom/google/firebase/installations/local/PersistedInstallationEntry;->getExpiresInSecs()J

    move-result-wide v4

    add-long/2addr v2, v4

    invoke-virtual {p0}, Lcom/google/firebase/installations/Utils;->currentTimeInSecs()J

    move-result-wide p0

    sget-wide v4, Lcom/google/firebase/installations/Utils;->AUTH_TOKEN_EXPIRATION_BUFFER_IN_SECS:J

    add-long/2addr p0, v4

    cmp-long p0, v2, p0

    if-gez p0, :cond_1

    return v1

    :cond_1
    const/4 p0, 0x0

    return p0
.end method
