/*
  Warnings:

  - You are about to drop the column `level` on the `Errand` table. All the data in the column will be lost.

*/
-- CreateEnum
CREATE TYPE "ErrandLevelName" AS ENUM ('Present', 'Lacking', 'Missing');

-- AlterTable
ALTER TABLE "Errand" DROP COLUMN "level",
ADD COLUMN     "errandLevelId" INTEGER;

-- DropEnum
DROP TYPE "ErrandLevel";

-- CreateTable
CREATE TABLE "ErrandLevel" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" "ErrandLevelName" NOT NULL,

    CONSTRAINT "ErrandLevel_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Errand" ADD CONSTRAINT "Errand_errandLevelId_fkey" FOREIGN KEY ("errandLevelId") REFERENCES "ErrandLevel"("id") ON DELETE SET NULL ON UPDATE CASCADE;
