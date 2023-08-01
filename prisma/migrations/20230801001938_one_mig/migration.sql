-- CreateTable
CREATE TABLE "Account" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "providerAccountId" TEXT NOT NULL,
    "refresh_token" TEXT,
    "access_token" TEXT,
    "expires_at" TEXT,
    "token_type" TEXT,
    "scope" TEXT,
    "id_token" TEXT,
    "session_state" TEXT,

    CONSTRAINT "Account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Session" (
    "id" TEXT NOT NULL,
    "sessionToken" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "expires" TEXT NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "email" TEXT,
    "emailVerified" TEXT,
    "image" TEXT,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VerificationToken" (
    "identifier" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Negocio" (
    "id_negocio" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "id_distribuidor" TEXT NOT NULL,
    "nombre_negocio" TEXT NOT NULL,
    "direccion_negocio" TEXT NOT NULL,
    "fecha_creacion" TEXT NOT NULL,

    CONSTRAINT "Negocio_pkey" PRIMARY KEY ("id_negocio")
);

-- CreateTable
CREATE TABLE "Movimiento_Entrada" (
    "id_mov_entra" TEXT NOT NULL,
    "id_negocio" TEXT NOT NULL,
    "id_granja_distri" TEXT NOT NULL,
    "id_corte" TEXT NOT NULL,
    "id_tipo_corte" TEXT NOT NULL,
    "precio_entrada" DOUBLE PRECISION NOT NULL,
    "fecha_creacion" TEXT NOT NULL,

    CONSTRAINT "Movimiento_Entrada_pkey" PRIMARY KEY ("id_mov_entra")
);

-- CreateTable
CREATE TABLE "Movimiento_Salida" (
    "id_salida" TEXT NOT NULL,
    "id_negocio" TEXT NOT NULL,
    "id_distribuidor" TEXT NOT NULL,
    "id_corte" TEXT NOT NULL,
    "cantidad_salida" DOUBLE PRECISION NOT NULL,
    "fecha_salida" TEXT NOT NULL,
    "id_raza" TEXT NOT NULL,

    CONSTRAINT "Movimiento_Salida_pkey" PRIMARY KEY ("id_salida")
);

-- CreateTable
CREATE TABLE "Distribuidor" (
    "id_distribuidor" TEXT NOT NULL,
    "nombre_distribuidor" TEXT NOT NULL,
    "apellido_distribuidor" TEXT NOT NULL,
    "telefono_distribuidor" TEXT NOT NULL,
    "documento_distribuidor" DOUBLE PRECISION NOT NULL,
    "fecha_creacion" TEXT NOT NULL,

    CONSTRAINT "Distribuidor_pkey" PRIMARY KEY ("id_distribuidor")
);

-- CreateTable
CREATE TABLE "Granja_Distribuidor" (
    "id_granja_distri" TEXT NOT NULL,
    "fecha_entrada" TEXT NOT NULL,
    "id_distribuidor" TEXT NOT NULL,
    "id_granja" TEXT NOT NULL,

    CONSTRAINT "Granja_Distribuidor_pkey" PRIMARY KEY ("id_granja_distri")
);

-- CreateTable
CREATE TABLE "Corte" (
    "id_corte" TEXT NOT NULL,
    "id_tipo_corte" TEXT NOT NULL,
    "id_raza" TEXT NOT NULL,
    "id_categoria" TEXT NOT NULL,
    "presentacion" TEXT NOT NULL,
    "descripcion" TEXT NOT NULL,
    "fecha_creacion" TEXT NOT NULL,

    CONSTRAINT "Corte_pkey" PRIMARY KEY ("id_corte")
);

-- CreateTable
CREATE TABLE "Razas" (
    "id_raza" TEXT NOT NULL,
    "id_categoria" TEXT NOT NULL,
    "nombre_raza" TEXT NOT NULL,

    CONSTRAINT "Razas_pkey" PRIMARY KEY ("id_raza")
);

-- CreateTable
CREATE TABLE "Categoria_Animal" (
    "id_categoria" TEXT NOT NULL,
    "nombre_categoria" TEXT NOT NULL,

    CONSTRAINT "Categoria_Animal_pkey" PRIMARY KEY ("id_categoria")
);

-- CreateTable
CREATE TABLE "Tipo_Corte" (
    "id_tipo_corte" TEXT NOT NULL,
    "id_raza" TEXT NOT NULL,
    "id_categoria" TEXT NOT NULL,
    "presentacion" TEXT NOT NULL,
    "descripcion" TEXT NOT NULL,
    "fecha_creacion" TEXT NOT NULL,

    CONSTRAINT "Tipo_Corte_pkey" PRIMARY KEY ("id_tipo_corte")
);

-- CreateTable
CREATE TABLE "Granja" (
    "id_granja" TEXT NOT NULL,
    "id_categoria" TEXT NOT NULL,
    "nombre_granja" TEXT NOT NULL,
    "direccion" TEXT NOT NULL,
    "fecha_creacion" TEXT NOT NULL,

    CONSTRAINT "Granja_pkey" PRIMARY KEY ("id_granja")
);

-- CreateIndex
CREATE UNIQUE INDEX "Account_provider_providerAccountId_key" ON "Account"("provider", "providerAccountId");

-- CreateIndex
CREATE UNIQUE INDEX "Session_sessionToken_key" ON "Session"("sessionToken");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_token_key" ON "VerificationToken"("token");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_identifier_token_key" ON "VerificationToken"("identifier", "token");

-- AddForeignKey
ALTER TABLE "Account" ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Session" ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Negocio" ADD CONSTRAINT "Negocio_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Negocio" ADD CONSTRAINT "Negocio_id_distribuidor_fkey" FOREIGN KEY ("id_distribuidor") REFERENCES "Distribuidor"("id_distribuidor") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Movimiento_Entrada" ADD CONSTRAINT "Movimiento_Entrada_id_negocio_fkey" FOREIGN KEY ("id_negocio") REFERENCES "Negocio"("id_negocio") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Movimiento_Entrada" ADD CONSTRAINT "Movimiento_Entrada_id_granja_distri_fkey" FOREIGN KEY ("id_granja_distri") REFERENCES "Granja_Distribuidor"("id_granja_distri") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Movimiento_Entrada" ADD CONSTRAINT "Movimiento_Entrada_id_corte_fkey" FOREIGN KEY ("id_corte") REFERENCES "Corte"("id_corte") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Movimiento_Entrada" ADD CONSTRAINT "Movimiento_Entrada_id_tipo_corte_fkey" FOREIGN KEY ("id_tipo_corte") REFERENCES "Tipo_Corte"("id_tipo_corte") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Movimiento_Salida" ADD CONSTRAINT "Movimiento_Salida_id_negocio_fkey" FOREIGN KEY ("id_negocio") REFERENCES "Negocio"("id_negocio") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Movimiento_Salida" ADD CONSTRAINT "Movimiento_Salida_id_distribuidor_fkey" FOREIGN KEY ("id_distribuidor") REFERENCES "Distribuidor"("id_distribuidor") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Movimiento_Salida" ADD CONSTRAINT "Movimiento_Salida_id_corte_fkey" FOREIGN KEY ("id_corte") REFERENCES "Corte"("id_corte") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Movimiento_Salida" ADD CONSTRAINT "Movimiento_Salida_id_raza_fkey" FOREIGN KEY ("id_raza") REFERENCES "Razas"("id_raza") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Granja_Distribuidor" ADD CONSTRAINT "Granja_Distribuidor_id_distribuidor_fkey" FOREIGN KEY ("id_distribuidor") REFERENCES "Distribuidor"("id_distribuidor") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Granja_Distribuidor" ADD CONSTRAINT "Granja_Distribuidor_id_granja_fkey" FOREIGN KEY ("id_granja") REFERENCES "Granja"("id_granja") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Corte" ADD CONSTRAINT "Corte_id_tipo_corte_fkey" FOREIGN KEY ("id_tipo_corte") REFERENCES "Tipo_Corte"("id_tipo_corte") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Corte" ADD CONSTRAINT "Corte_id_raza_fkey" FOREIGN KEY ("id_raza") REFERENCES "Razas"("id_raza") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Corte" ADD CONSTRAINT "Corte_id_categoria_fkey" FOREIGN KEY ("id_categoria") REFERENCES "Categoria_Animal"("id_categoria") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Razas" ADD CONSTRAINT "Razas_id_categoria_fkey" FOREIGN KEY ("id_categoria") REFERENCES "Categoria_Animal"("id_categoria") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tipo_Corte" ADD CONSTRAINT "Tipo_Corte_id_raza_fkey" FOREIGN KEY ("id_raza") REFERENCES "Razas"("id_raza") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tipo_Corte" ADD CONSTRAINT "Tipo_Corte_id_categoria_fkey" FOREIGN KEY ("id_categoria") REFERENCES "Categoria_Animal"("id_categoria") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Granja" ADD CONSTRAINT "Granja_id_categoria_fkey" FOREIGN KEY ("id_categoria") REFERENCES "Categoria_Animal"("id_categoria") ON DELETE RESTRICT ON UPDATE CASCADE;
