-- CreateTable
CREATE TABLE "Product" (
    "id" TEXT NOT NULL,
    "tag" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "fullDescription" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "newPrice" DOUBLE PRECISION,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);
