/*
  Warnings:

  - Changed the type of `level` on the `Errand` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "ErrandLevel" AS ENUM ('1', '7');

-- AlterTable
ALTER TABLE "Errand" DROP COLUMN "level",
ADD COLUMN     "level" "ErrandLevel" NOT NULL;
