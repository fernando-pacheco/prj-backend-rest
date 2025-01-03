-- CreateTable
CREATE TABLE "Cart" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Cart_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ItemCart" (
    "id" TEXT NOT NULL,
    "productID" TEXT NOT NULL,
    "amount" INTEGER NOT NULL,
    "cartID" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ItemCart_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "ItemCart" ADD CONSTRAINT "ItemCart_cartID_fkey" FOREIGN KEY ("cartID") REFERENCES "Cart"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ItemCart" ADD CONSTRAINT "ItemCart_productID_fkey" FOREIGN KEY ("productID") REFERENCES "Product"("id") ON DELETE CASCADE ON UPDATE CASCADE;
