-- CreateEnum
CREATE TYPE "PaymentMethod" AS ENUM ('PIX', 'CREDIT', 'DEBIT', 'WALLET');

-- CreateTable
CREATE TABLE "Payment" (
    "id" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "paymentMethod" "PaymentMethod" NOT NULL,
    "value" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Payment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Order" (
    "id" TEXT NOT NULL,
    "paymentID" TEXT NOT NULL,
    "cartID" TEXT NOT NULL,
    "userID" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Order_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Order_paymentID_key" ON "Order"("paymentID");

-- CreateIndex
CREATE UNIQUE INDEX "Order_cartID_key" ON "Order"("cartID");

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_cartID_fkey" FOREIGN KEY ("cartID") REFERENCES "Cart"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_paymentID_fkey" FOREIGN KEY ("paymentID") REFERENCES "Payment"("id") ON DELETE CASCADE ON UPDATE CASCADE;
