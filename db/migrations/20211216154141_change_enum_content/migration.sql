/*
  Warnings:

  - The values [1,7] on the enum `ErrandLevel` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "ErrandLevel_new" AS ENUM ('Present', 'Lacking', 'Missing');
ALTER TABLE "Errand" ALTER COLUMN "level" TYPE "ErrandLevel_new" USING ("level"::text::"ErrandLevel_new");
ALTER TYPE "ErrandLevel" RENAME TO "ErrandLevel_old";
ALTER TYPE "ErrandLevel_new" RENAME TO "ErrandLevel";
DROP TYPE "ErrandLevel_old";
COMMIT;
