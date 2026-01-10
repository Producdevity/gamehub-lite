.class Lcom/google/firebase/installations/FirebaseInstallations$2;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"

# interfaces
.implements Lcom/google/firebase/installations/internal/FidListenerHandle;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/firebase/installations/FirebaseInstallations;->registerFidListener(Lcom/google/firebase/installations/internal/FidListener;)Lcom/google/firebase/installations/internal/FidListenerHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/firebase/installations/FirebaseInstallations;

.field final synthetic val$listener:Lcom/google/firebase/installations/internal/FidListener;


# direct methods
.method public constructor <init>(Lcom/google/firebase/installations/FirebaseInstallations;Lcom/google/firebase/installations/internal/FidListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/google/firebase/installations/FirebaseInstallations$2;->this$0:Lcom/google/firebase/installations/FirebaseInstallations;

    .line 3
    iput-object p2, p0, Lcom/google/firebase/installations/FirebaseInstallations$2;->val$listener:Lcom/google/firebase/installations/internal/FidListener;

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    return-void
.end method


# virtual methods
.method public unregister()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/firebase/installations/FirebaseInstallations$2;->this$0:Lcom/google/firebase/installations/FirebaseInstallations;

    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/google/firebase/installations/FirebaseInstallations$2;->this$0:Lcom/google/firebase/installations/FirebaseInstallations;

    .line 6
    invoke-static {v1}, Lcom/google/firebase/installations/FirebaseInstallations;->access$000(Lcom/google/firebase/installations/FirebaseInstallations;)Ljava/util/Set;

    .line 9
    move-result-object v1

    .line 10
    iget-object p0, p0, Lcom/google/firebase/installations/FirebaseInstallations$2;->val$listener:Lcom/google/firebase/installations/internal/FidListener;

    .line 12
    invoke-interface {v1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 15
    monitor-exit v0

    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p0
.end method
