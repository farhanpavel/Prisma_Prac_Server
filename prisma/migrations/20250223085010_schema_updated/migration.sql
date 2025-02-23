/*
  Warnings:

  - You are about to drop the column `password` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `Book` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Place` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `role` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Book" DROP CONSTRAINT "Book_place_id_fkey";

-- DropForeignKey
ALTER TABLE "Book" DROP CONSTRAINT "Book_user_id_fkey";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "password",
ADD COLUMN     "role" TEXT NOT NULL;

-- DropTable
DROP TABLE "Book";

-- DropTable
DROP TABLE "Place";

-- CreateTable
CREATE TABLE "Quiz" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "question" TEXT NOT NULL,
    "option_one" TEXT NOT NULL,
    "option_two" TEXT NOT NULL,
    "option_three" TEXT NOT NULL,
    "option_four" TEXT NOT NULL,
    "ans" TEXT NOT NULL,
    "userId" TEXT,

    CONSTRAINT "Quiz_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ans" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "student_ans" TEXT NOT NULL,

    CONSTRAINT "Ans_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Result" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "student_num" TEXT NOT NULL,

    CONSTRAINT "Result_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Result_user_id_key" ON "Result"("user_id");

-- AddForeignKey
ALTER TABLE "Quiz" ADD CONSTRAINT "Quiz_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ans" ADD CONSTRAINT "Ans_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Result" ADD CONSTRAINT "Result_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
