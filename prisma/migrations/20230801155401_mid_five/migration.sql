/*
  Warnings:

  - Made the column `expires_at` on table `Account` required. This step will fail if there are existing NULL values in that column.
  - Made the column `token_type` on table `Account` required. This step will fail if there are existing NULL values in that column.
  - Made the column `scope` on table `Account` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterTable
ALTER TABLE "Account" ALTER COLUMN "expires_at" SET NOT NULL,
ALTER COLUMN "token_type" SET NOT NULL,
ALTER COLUMN "scope" SET NOT NULL;
