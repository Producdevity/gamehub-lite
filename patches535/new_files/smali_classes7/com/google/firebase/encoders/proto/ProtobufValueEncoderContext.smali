.class Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;
.super Ljava/lang/Object;
.source "r8-map-id-712846b76e3224c0169ce621759774aea144e14d75c3fb3c733f7f2b03c1bb19"

# interfaces
.implements Lcom/google/firebase/encoders/ValueEncoderContext;


# instance fields
.field private encoded:Z

.field private field:Lcom/google/firebase/encoders/FieldDescriptor;

.field private final objEncoderCtx:Lcom/google/firebase/encoders/proto/ProtobufDataEncoderContext;

.field private skipDefault:Z


# direct methods
.method public constructor <init>(Lcom/google/firebase/encoders/proto/ProtobufDataEncoderContext;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->encoded:Z

    iput-boolean v0, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->skipDefault:Z

    iput-object p1, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->objEncoderCtx:Lcom/google/firebase/encoders/proto/ProtobufDataEncoderContext;

    return-void
.end method

.method private checkNotUsed()V
    .locals 1

    iget-boolean v0, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->encoded:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->encoded:Z

    return-void

    :cond_0
    new-instance p0, Lcom/google/firebase/encoders/EncodingException;

    const-string v0, "Cannot encode a second value in the ValueEncoderContext"

    invoke-direct {p0, v0}, Lcom/google/firebase/encoders/EncodingException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public add(D)Lcom/google/firebase/encoders/ValueEncoderContext;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->checkNotUsed()V

    iget-object v0, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->objEncoderCtx:Lcom/google/firebase/encoders/proto/ProtobufDataEncoderContext;

    iget-object v1, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->field:Lcom/google/firebase/encoders/FieldDescriptor;

    iget-boolean v2, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->skipDefault:Z

    invoke-virtual {v0, v1, p1, p2, v2}, Lcom/google/firebase/encoders/proto/ProtobufDataEncoderContext;->add(Lcom/google/firebase/encoders/FieldDescriptor;DZ)Lcom/google/firebase/encoders/ObjectEncoderContext;

    return-object p0
.end method

.method public add(F)Lcom/google/firebase/encoders/ValueEncoderContext;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->checkNotUsed()V

    iget-object v0, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->objEncoderCtx:Lcom/google/firebase/encoders/proto/ProtobufDataEncoderContext;

    iget-object v1, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->field:Lcom/google/firebase/encoders/FieldDescriptor;

    iget-boolean v2, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->skipDefault:Z

    invoke-virtual {v0, v1, p1, v2}, Lcom/google/firebase/encoders/proto/ProtobufDataEncoderContext;->add(Lcom/google/firebase/encoders/FieldDescriptor;FZ)Lcom/google/firebase/encoders/ObjectEncoderContext;

    return-object p0
.end method

.method public add(I)Lcom/google/firebase/encoders/ValueEncoderContext;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->checkNotUsed()V

    iget-object v0, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->objEncoderCtx:Lcom/google/firebase/encoders/proto/ProtobufDataEncoderContext;

    iget-object v1, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->field:Lcom/google/firebase/encoders/FieldDescriptor;

    iget-boolean v2, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->skipDefault:Z

    invoke-virtual {v0, v1, p1, v2}, Lcom/google/firebase/encoders/proto/ProtobufDataEncoderContext;->add(Lcom/google/firebase/encoders/FieldDescriptor;IZ)Lcom/google/firebase/encoders/proto/ProtobufDataEncoderContext;

    return-object p0
.end method

.method public add(J)Lcom/google/firebase/encoders/ValueEncoderContext;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->checkNotUsed()V

    iget-object v0, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->objEncoderCtx:Lcom/google/firebase/encoders/proto/ProtobufDataEncoderContext;

    iget-object v1, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->field:Lcom/google/firebase/encoders/FieldDescriptor;

    iget-boolean v2, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->skipDefault:Z

    invoke-virtual {v0, v1, p1, p2, v2}, Lcom/google/firebase/encoders/proto/ProtobufDataEncoderContext;->add(Lcom/google/firebase/encoders/FieldDescriptor;JZ)Lcom/google/firebase/encoders/proto/ProtobufDataEncoderContext;

    return-object p0
.end method

.method public add(Ljava/lang/String;)Lcom/google/firebase/encoders/ValueEncoderContext;
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->checkNotUsed()V

    iget-object v0, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->objEncoderCtx:Lcom/google/firebase/encoders/proto/ProtobufDataEncoderContext;

    iget-object v1, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->field:Lcom/google/firebase/encoders/FieldDescriptor;

    iget-boolean v2, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->skipDefault:Z

    invoke-virtual {v0, v1, p1, v2}, Lcom/google/firebase/encoders/proto/ProtobufDataEncoderContext;->add(Lcom/google/firebase/encoders/FieldDescriptor;Ljava/lang/Object;Z)Lcom/google/firebase/encoders/ObjectEncoderContext;

    return-object p0
.end method

.method public add(Z)Lcom/google/firebase/encoders/ValueEncoderContext;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->checkNotUsed()V

    iget-object v0, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->objEncoderCtx:Lcom/google/firebase/encoders/proto/ProtobufDataEncoderContext;

    iget-object v1, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->field:Lcom/google/firebase/encoders/FieldDescriptor;

    iget-boolean v2, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->skipDefault:Z

    invoke-virtual {v0, v1, p1, v2}, Lcom/google/firebase/encoders/proto/ProtobufDataEncoderContext;->add(Lcom/google/firebase/encoders/FieldDescriptor;ZZ)Lcom/google/firebase/encoders/proto/ProtobufDataEncoderContext;

    return-object p0
.end method

.method public add([B)Lcom/google/firebase/encoders/ValueEncoderContext;
    .locals 3
    .param p1    # [B
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->checkNotUsed()V

    iget-object v0, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->objEncoderCtx:Lcom/google/firebase/encoders/proto/ProtobufDataEncoderContext;

    iget-object v1, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->field:Lcom/google/firebase/encoders/FieldDescriptor;

    iget-boolean v2, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->skipDefault:Z

    invoke-virtual {v0, v1, p1, v2}, Lcom/google/firebase/encoders/proto/ProtobufDataEncoderContext;->add(Lcom/google/firebase/encoders/FieldDescriptor;Ljava/lang/Object;Z)Lcom/google/firebase/encoders/ObjectEncoderContext;

    return-object p0
.end method

.method public resetContext(Lcom/google/firebase/encoders/FieldDescriptor;Z)V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->encoded:Z

    iput-object p1, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->field:Lcom/google/firebase/encoders/FieldDescriptor;

    iput-boolean p2, p0, Lcom/google/firebase/encoders/proto/ProtobufValueEncoderContext;->skipDefault:Z

    return-void
.end method
