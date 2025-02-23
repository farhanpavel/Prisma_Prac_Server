/*
  Warnings:

  - The primary key for the `Book` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `Place` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `User` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE "Book" DROP CONSTRAINT "Book_id_fkey";

-- DropForeignKey
ALTER TABLE "Book" DROP CONSTRAINT "Book_user_id_fkey";

-- AlterTable
ALTER TABLE "Book" DROP CONSTRAINT "Book_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "user_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Book_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Book_id_seq";

-- AlterTable
ALTER TABLE "Place" DROP CONSTRAINT "Place_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "book_id" SET DATA TYPE TEXT,
ADD CONSTRAINT "Place_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Place_id_seq";

-- AlterTable
ALTER TABLE "User" DROP CONSTRAINT "User_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ADD CONSTRAINT "User_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "User_id_seq";

-- AddForeignKey
ALTER TABLE "Book" ADD CONSTRAINT "Book_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Book" ADD CONSTRAINT "Book_id_fkey" FOREIGN KEY ("id") REFERENCES "Place"("book_id") ON DELETE RESTRICT ON UPDATE CASCADE;
