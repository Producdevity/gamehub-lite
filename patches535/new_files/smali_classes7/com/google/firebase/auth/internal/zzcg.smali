.class public final Lcom/google/firebase/auth/internal/zzcg;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"


# static fields
.field private static final zza:Lcom/google/firebase/auth/internal/zzcg;


# instance fields
.field private final zzb:Lcom/google/firebase/auth/internal/zzbl;

.field private final zzc:Lcom/google/firebase/auth/internal/zzax;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/google/firebase/auth/internal/zzcg;

    .line 3
    invoke-direct {v0}, Lcom/google/firebase/auth/internal/zzcg;-><init>()V

    .line 6
    sput-object v0, Lcom/google/firebase/auth/internal/zzcg;->zza:Lcom/google/firebase/auth/internal/zzcg;

    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/google/firebase/auth/internal/zzbl;->zzc()Lcom/google/firebase/auth/internal/zzbl;

    move-result-object v0

    invoke-static {}, Lcom/google/firebase/auth/internal/zzax;->zza()Lcom/google/firebase/auth/internal/zzax;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/google/firebase/auth/internal/zzcg;-><init>(Lcom/google/firebase/auth/internal/zzbl;Lcom/google/firebase/auth/internal/zzax;)V

    return-void
.end method

.method private constructor <init>(Lcom/google/firebase/auth/internal/zzbl;Lcom/google/firebase/auth/internal/zzax;)V
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzcg;->zzb:Lcom/google/firebase/auth/internal/zzbl;

    .line 4
    iput-object p2, p0, Lcom/google/firebase/auth/internal/zzcg;->zzc:Lcom/google/firebase/auth/internal/zzax;

    return-void
.end method

.method public static zzc()Lcom/google/firebase/auth/internal/zzcg;
    .locals 1

    .line 1
    sget-object v0, Lcom/google/firebase/auth/internal/zzcg;->zza:Lcom/google/firebase/auth/internal/zzcg;

    .line 3
    return-object v0
.end method


# virtual methods
.method public final zza()Lcom/google/android/gms/tasks/Task;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/firebase/auth/AuthResult;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzcg;->zzb:Lcom/google/firebase/auth/internal/zzbl;

    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/zzbl;->zza()Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public final zza(Landroid/content/Context;)V
    .locals 0

    .line 2
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzcg;->zzb:Lcom/google/firebase/auth/internal/zzbl;

    invoke-virtual {p0, p1}, Lcom/google/firebase/auth/internal/zzbl;->zza(Landroid/content/Context;)V

    return-void
.end method

.method public final zza(Lcom/google/firebase/auth/FirebaseAuth;)V
    .locals 0

    .line 3
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzcg;->zzb:Lcom/google/firebase/auth/internal/zzbl;

    invoke-virtual {p0, p1}, Lcom/google/firebase/auth/internal/zzbl;->zza(Lcom/google/firebase/auth/FirebaseAuth;)V

    return-void
.end method

.method public final zza(Landroid/app/Activity;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseAuth;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Lcom/google/firebase/auth/AuthResult;",
            ">;",
            "Lcom/google/firebase/auth/FirebaseAuth;",
            ")Z"
        }
    .end annotation

    .line 4
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzcg;->zzc:Lcom/google/firebase/auth/internal/zzax;

    invoke-virtual {p0, p1, p2, p3}, Lcom/google/firebase/auth/internal/zzax;->zza(Landroid/app/Activity;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseAuth;)Z

    move-result p0

    return p0
.end method

.method public final zza(Landroid/app/Activity;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseAuth;Lcom/google/firebase/auth/FirebaseUser;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Lcom/google/firebase/auth/AuthResult;",
            ">;",
            "Lcom/google/firebase/auth/FirebaseAuth;",
            "Lcom/google/firebase/auth/FirebaseUser;",
            ")Z"
        }
    .end annotation

    .line 5
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzcg;->zzc:Lcom/google/firebase/auth/internal/zzax;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/firebase/auth/internal/zzax;->zza(Landroid/app/Activity;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseAuth;Lcom/google/firebase/auth/FirebaseUser;)Z

    move-result p0

    return p0
.end method

.method public final zzb()Lcom/google/android/gms/tasks/Task;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzcg;->zzb:Lcom/google/firebase/auth/internal/zzbl;

    .line 3
    invoke-virtual {p0}, Lcom/google/firebase/auth/internal/zzbl;->zzb()Lcom/google/android/gms/tasks/Task;

    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
