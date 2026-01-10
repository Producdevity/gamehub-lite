.class final Lcom/google/firebase/auth/internal/zzbe;
.super Landroid/content/BroadcastReceiver;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"


# instance fields
.field private final zza:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private final zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final synthetic zzc:Lcom/google/firebase/auth/internal/zzax;


# direct methods
.method public constructor <init>(Lcom/google/firebase/auth/internal/zzax;Landroid/app/Activity;Lcom/google/android/gms/tasks/TaskCompletionSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Lcom/google/android/gms/tasks/TaskCompletionSource<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzbe;->zzc:Lcom/google/firebase/auth/internal/zzax;

    .line 6
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 9
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 11
    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 14
    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzbe;->zza:Ljava/lang/ref/WeakReference;

    .line 16
    iput-object p3, p0, Lcom/google/firebase/auth/internal/zzbe;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 18
    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzbe;->zza:Ljava/lang/ref/WeakReference;

    .line 3
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/app/Activity;

    .line 9
    if-nez v0, :cond_0

    .line 11
    const-string p2, "FederatedAuthReceiver"

    .line 13
    const-string v0, "Failed to unregister BroadcastReceiver because the Activity that launched this flow has been garbage collected; please do not finish() your Activity while performing a FederatedAuthProvider operation."

    .line 15
    invoke-static {p2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzbe;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 20
    new-instance p2, Lcom/google/android/gms/common/api/Status;

    .line 22
    const/16 v0, 0x445b

    .line 24
    const-string v1, "Activity that started the web operation is no longer alive; see logcat for details"

    .line 26
    invoke-direct {p2, v0, v1}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    .line 29
    invoke-static {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaen;->zza(Lcom/google/android/gms/common/api/Status;)Lcom/google/firebase/FirebaseException;

    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p0, p2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    .line 36
    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzax;->zza(Landroid/content/Context;)V

    .line 39
    return-void

    .line 40
    :cond_0
    const-string v0, "com.google.firebase.auth.internal.OPERATION"

    .line 42
    invoke-virtual {p2, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_2

    .line 48
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    move-result-object v0

    .line 52
    const-string v1, "com.google.firebase.auth.internal.ACTION_SHOW_RECAPTCHA"

    .line 54
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_1

    .line 60
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzbe;->zzc:Lcom/google/firebase/auth/internal/zzax;

    .line 62
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzbe;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 64
    invoke-static {v0, p2, p0, p1}, Lcom/google/firebase/auth/internal/zzax;->zza(Lcom/google/firebase/auth/internal/zzax;Landroid/content/Intent;Lcom/google/android/gms/tasks/TaskCompletionSource;Landroid/content/Context;)V

    .line 67
    return-void

    .line 68
    :cond_1
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzbe;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 70
    new-instance p1, Ljava/lang/StringBuilder;

    .line 72
    const-string p2, "WEB_CONTEXT_CANCELED:Unknown operation received ("

    .line 74
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    const-string p2, ")"

    .line 82
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    move-result-object p1

    .line 89
    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzao;->zza(Ljava/lang/String;)Lcom/google/android/gms/common/api/Status;

    .line 92
    move-result-object p1

    .line 93
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaen;->zza(Lcom/google/android/gms/common/api/Status;)Lcom/google/firebase/FirebaseException;

    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    .line 100
    return-void

    .line 101
    :cond_2
    invoke-static {p2}, Lcom/google/firebase/auth/internal/zzce;->zzb(Landroid/content/Intent;)Z

    .line 104
    move-result v0

    .line 105
    if-eqz v0, :cond_3

    .line 107
    invoke-static {p2}, Lcom/google/firebase/auth/internal/zzce;->zza(Landroid/content/Intent;)Lcom/google/android/gms/common/api/Status;

    .line 110
    move-result-object p2

    .line 111
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzbe;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 113
    invoke-static {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaen;->zza(Lcom/google/android/gms/common/api/Status;)Lcom/google/firebase/FirebaseException;

    .line 116
    move-result-object p2

    .line 117
    invoke-virtual {p0, p2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    .line 120
    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzax;->zza(Landroid/content/Context;)V

    .line 123
    return-void

    .line 124
    :cond_3
    const-string v0, "com.google.firebase.auth.internal.EXTRA_CANCELED"

    .line 126
    invoke-virtual {p2, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 129
    move-result p2

    .line 130
    if-eqz p2, :cond_4

    .line 132
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzbe;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 134
    const-string p2, "WEB_CONTEXT_CANCELED"

    .line 136
    invoke-static {p2}, Lcom/google/firebase/auth/internal/zzao;->zza(Ljava/lang/String;)Lcom/google/android/gms/common/api/Status;

    .line 139
    move-result-object p2

    .line 140
    invoke-static {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaen;->zza(Lcom/google/android/gms/common/api/Status;)Lcom/google/firebase/FirebaseException;

    .line 143
    move-result-object p2

    .line 144
    invoke-virtual {p0, p2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    .line 147
    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzax;->zza(Landroid/content/Context;)V

    .line 150
    :cond_4
    return-void
.end method
