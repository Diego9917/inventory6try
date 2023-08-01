/*
  Warnings:

  - The `expires_at` column on the `Account` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to alter the column `documento_distribuidor` on the `Distribuidor` table. The data in that column could be lost. The data in that column will be cast from `DoublePrecision` to `Integer`.
  - You are about to alter the column `precio_entrada` on the `Movimiento_Entrada` table. The data in that column could be lost. The data in that column will be cast from `DoublePrecision` to `Integer`.
  - The `fecha_creacion` column on the `Movimiento_Entrada` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - You are about to alter the column `cantidad_salida` on the `Movimiento_Salida` table. The data in that column could be lost. The data in that column will be cast from `DoublePrecision` to `Integer`.
  - The `emailVerified` column on the `User` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - Changed the type of `fecha_creacion` on the `Corte` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `fecha_creacion` on the `Distribuidor` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `fecha_creacion` on the `Granja` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `fecha_entrada` on the `Granja_Distribuidor` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `fecha_salida` on the `Movimiento_Salida` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `fecha_creacion` on the `Negocio` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `expires` on the `Session` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `fecha_creacion` on the `Tipo_Corte` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `expires` on the `VerificationToken` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "Account" DROP COLUMN "expires_at",
ADD COLUMN     "expires_at" INTEGER,
ALTER COLUMN "token_type" DROP NOT NULL,
ALTER COLUMN "scope" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Corte" DROP COLUMN "fecha_creacion",
ADD COLUMN     "fecha_creacion" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Distribuidor" ALTER COLUMN "documento_distribuidor" SET DATA TYPE INTEGER,
DROP COLUMN "fecha_creacion",
ADD COLUMN     "fecha_creacion" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Granja" DROP COLUMN "fecha_creacion",
ADD COLUMN     "fecha_creacion" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Granja_Distribuidor" DROP COLUMN "fecha_entrada",
ADD COLUMN     "fecha_entrada" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Movimiento_Entrada" ALTER COLUMN "precio_entrada" SET DATA TYPE INTEGER,
DROP COLUMN "fecha_creacion",
ADD COLUMN     "fecha_creacion" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "Movimiento_Salida" ALTER COLUMN "cantidad_salida" SET DATA TYPE INTEGER,
DROP COLUMN "fecha_salida",
ADD COLUMN     "fecha_salida" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Negocio" DROP COLUMN "fecha_creacion",
ADD COLUMN     "fecha_creacion" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Session" DROP COLUMN "expires",
ADD COLUMN     "expires" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Tipo_Corte" DROP COLUMN "fecha_creacion",
ADD COLUMN     "fecha_creacion" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "emailVerified",
ADD COLUMN     "emailVerified" TIMESTAMP(3);

-- AlterTable
ALTER TABLE "VerificationToken" DROP COLUMN "expires",
ADD COLUMN     "expires" TIMESTAMP(3) NOT NULL;
