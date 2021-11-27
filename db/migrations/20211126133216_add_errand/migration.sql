-- CreateTable
CREATE TABLE "All" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "errand" TEXT NOT NULL,
    "level" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "All_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Errand" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "level" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Errand_pkey" PRIMARY KEY ("id")
);
