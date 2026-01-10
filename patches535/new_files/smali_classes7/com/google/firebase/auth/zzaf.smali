.class public final synthetic Lcom/google/firebase/auth/zzaf;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"

# interfaces
.implements Lcom/google/firebase/components/ComponentFactory;


# instance fields
.field private synthetic zza:Lcom/google/firebase/components/Qualified;

.field private synthetic zzb:Lcom/google/firebase/components/Qualified;

.field private synthetic zzc:Lcom/google/firebase/components/Qualified;

.field private synthetic zzd:Lcom/google/firebase/components/Qualified;

.field private synthetic zze:Lcom/google/firebase/components/Qualified;


# direct methods
.method public synthetic constructor <init>(Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput-object p1, p0, Lcom/google/firebase/auth/zzaf;->zza:Lcom/google/firebase/components/Qualified;

    .line 6
    iput-object p2, p0, Lcom/google/firebase/auth/zzaf;->zzb:Lcom/google/firebase/components/Qualified;

    .line 8
    iput-object p3, p0, Lcom/google/firebase/auth/zzaf;->zzc:Lcom/google/firebase/components/Qualified;

    .line 10
    iput-object p4, p0, Lcom/google/firebase/auth/zzaf;->zzd:Lcom/google/firebase/components/Qualified;

    .line 12
    iput-object p5, p0, Lcom/google/firebase/auth/zzaf;->zze:Lcom/google/firebase/components/Qualified;

    .line 14
    return-void
.end method


# virtual methods
.method public final create(Lcom/google/firebase/components/ComponentContainer;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/google/firebase/auth/zzaf;->zza:Lcom/google/firebase/components/Qualified;

    .line 3
    iget-object v1, p0, Lcom/google/firebase/auth/zzaf;->zzb:Lcom/google/firebase/components/Qualified;

    .line 5
    iget-object v2, p0, Lcom/google/firebase/auth/zzaf;->zzc:Lcom/google/firebase/components/Qualified;

    .line 7
    iget-object v3, p0, Lcom/google/firebase/auth/zzaf;->zzd:Lcom/google/firebase/components/Qualified;

    .line 9
    iget-object v4, p0, Lcom/google/firebase/auth/zzaf;->zze:Lcom/google/firebase/components/Qualified;

    .line 11
    move-object v5, p1

    .line 12
    invoke-static/range {v0 .. v5}, Lcom/google/firebase/auth/FirebaseAuthRegistrar;->lambda$getComponents$0(Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/Qualified;Lcom/google/firebase/components/ComponentContainer;)Lcom/google/firebase/auth/FirebaseAuth;

    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method
