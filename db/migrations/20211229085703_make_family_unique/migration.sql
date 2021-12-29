/*
  Warnings:

  - You are about to drop the `_FamilyToUser` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_FamilyToUser" DROP CONSTRAINT "_FamilyToUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_FamilyToUser" DROP CONSTRAINT "_FamilyToUser_B_fkey";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "familyId" INTEGER;

-- DropTable
DROP TABLE "_FamilyToUser";

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_familyId_fkey" FOREIGN KEY ("familyId") REFERENCES "Family"("id") ON DELETE SET NULL ON UPDATE CASCADE;
