.class final Lcom/google/firebase/auth/internal/zzbc;
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
            "Lcom/google/firebase/auth/AuthResult;",
            ">;"
        }
    .end annotation
.end field

.field private final zzc:Lcom/google/firebase/auth/FirebaseAuth;

.field private final zzd:Lcom/google/firebase/auth/FirebaseUser;

.field private final synthetic zze:Lcom/google/firebase/auth/internal/zzax;


# direct methods
.method public constructor <init>(Lcom/google/firebase/auth/internal/zzax;Landroid/app/Activity;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseAuth;Lcom/google/firebase/auth/FirebaseUser;)V
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
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzbc;->zze:Lcom/google/firebase/auth/internal/zzax;

    .line 6
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 9
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 11
    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 14
    iput-object p1, p0, Lcom/google/firebase/auth/internal/zzbc;->zza:Ljava/lang/ref/WeakReference;

    .line 16
    iput-object p3, p0, Lcom/google/firebase/auth/internal/zzbc;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 18
    iput-object p4, p0, Lcom/google/firebase/auth/internal/zzbc;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    .line 20
    iput-object p5, p0, Lcom/google/firebase/auth/internal/zzbc;->zzd:Lcom/google/firebase/auth/FirebaseUser;

    .line 22
    return-void
.end method


# virtual methods
.method public final onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzbc;->zza:Ljava/lang/ref/WeakReference;

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
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzbc;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

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
    if-eqz v1, :cond_4

    .line 48
    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    move-result-object v0

    .line 52
    const-string v1, "com.google.firebase.auth.internal.NONGMSCORE_SIGN_IN"

    .line 54
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_1

    .line 60
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzbc;->zze:Lcom/google/firebase/auth/internal/zzax;

    .line 62
    iget-object v1, p0, Lcom/google/firebase/auth/internal/zzbc;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 64
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzbc;->zzc:Lcom/google/firebase/auth/FirebaseAuth;

    .line 66
    invoke-static {v0, p2, v1, p0, p1}, Lcom/google/firebase/auth/internal/zzax;->zza(Lcom/google/firebase/auth/internal/zzax;Landroid/content/Intent;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseAuth;Landroid/content/Context;)V

    .line 69
    return-void

    .line 70
    :cond_1
    const-string v1, "com.google.firebase.auth.internal.NONGMSCORE_LINK"

    .line 72
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_2

    .line 78
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzbc;->zze:Lcom/google/firebase/auth/internal/zzax;

    .line 80
    iget-object v1, p0, Lcom/google/firebase/auth/internal/zzbc;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 82
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzbc;->zzd:Lcom/google/firebase/auth/FirebaseUser;

    .line 84
    invoke-static {v0, p2, v1, p0, p1}, Lcom/google/firebase/auth/internal/zzax;->zza(Lcom/google/firebase/auth/internal/zzax;Landroid/content/Intent;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseUser;Landroid/content/Context;)V

    .line 87
    return-void

    .line 88
    :cond_2
    const-string v1, "com.google.firebase.auth.internal.NONGMSCORE_REAUTHENTICATE"

    .line 90
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    move-result v1

    .line 94
    if-eqz v1, :cond_3

    .line 96
    iget-object v0, p0, Lcom/google/firebase/auth/internal/zzbc;->zze:Lcom/google/firebase/auth/internal/zzax;

    .line 98
    iget-object v1, p0, Lcom/google/firebase/auth/internal/zzbc;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 100
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzbc;->zzd:Lcom/google/firebase/auth/FirebaseUser;

    .line 102
    invoke-static {v0, p2, v1, p0, p1}, Lcom/google/firebase/auth/internal/zzax;->zzb(Lcom/google/firebase/auth/internal/zzax;Landroid/content/Intent;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/firebase/auth/FirebaseUser;Landroid/content/Context;)V

    .line 105
    return-void

    .line 106
    :cond_3
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzbc;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 108
    new-instance p1, Ljava/lang/StringBuilder;

    .line 110
    const-string p2, "WEB_CONTEXT_CANCELED:Unknown operation received ("

    .line 112
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 115
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    const-string p2, ")"

    .line 120
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    move-result-object p1

    .line 127
    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzao;->zza(Ljava/lang/String;)Lcom/google/android/gms/common/api/Status;

    .line 130
    move-result-object p1

    .line 131
    invoke-static {p1}, Lcom/google/android/gms/internal/firebase-auth-api/zzaen;->zza(Lcom/google/android/gms/common/api/Status;)Lcom/google/firebase/FirebaseException;

    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p0, p1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    .line 138
    return-void

    .line 139
    :cond_4
    invoke-static {p2}, Lcom/google/firebase/auth/internal/zzce;->zzb(Landroid/content/Intent;)Z

    .line 142
    move-result v0

    .line 143
    if-eqz v0, :cond_5

    .line 145
    invoke-static {p2}, Lcom/google/firebase/auth/internal/zzce;->zza(Landroid/content/Intent;)Lcom/google/android/gms/common/api/Status;

    .line 148
    move-result-object p2

    .line 149
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzbc;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 151
    invoke-static {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaen;->zza(Lcom/google/android/gms/common/api/Status;)Lcom/google/firebase/FirebaseException;

    .line 154
    move-result-object p2

    .line 155
    invoke-virtual {p0, p2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    .line 158
    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzax;->zza(Landroid/content/Context;)V

    .line 161
    return-void

    .line 162
    :cond_5
    const-string v0, "com.google.firebase.auth.internal.EXTRA_CANCELED"

    .line 164
    invoke-virtual {p2, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    .line 167
    move-result p2

    .line 168
    if-eqz p2, :cond_6

    .line 170
    iget-object p0, p0, Lcom/google/firebase/auth/internal/zzbc;->zzb:Lcom/google/android/gms/tasks/TaskCompletionSource;

    .line 172
    const-string p2, "WEB_CONTEXT_CANCELED"

    .line 174
    invoke-static {p2}, Lcom/google/firebase/auth/internal/zzao;->zza(Ljava/lang/String;)Lcom/google/android/gms/common/api/Status;

    .line 177
    move-result-object p2

    .line 178
    invoke-static {p2}, Lcom/google/android/gms/internal/firebase-auth-api/zzaen;->zza(Lcom/google/android/gms/common/api/Status;)Lcom/google/firebase/FirebaseException;

    .line 181
    move-result-object p2

    .line 182
    invoke-virtual {p0, p2}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    .line 185
    invoke-static {p1}, Lcom/google/firebase/auth/internal/zzax;->zza(Landroid/content/Context;)V

    .line 188
    :cond_6
    return-void
.end method
