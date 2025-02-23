/*
  Warnings:

  - You are about to drop the column `book_id` on the `Place` table. All the data in the column will be lost.
  - Added the required column `place_id` to the `Book` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Book" DROP CONSTRAINT "Book_id_fkey";

-- DropIndex
DROP INDEX "Place_book_id_key";

-- AlterTable
ALTER TABLE "Book" ADD COLUMN     "place_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Place" DROP COLUMN "book_id";

-- AddForeignKey
ALTER TABLE "Book" ADD CONSTRAINT "Book_place_id_fkey" FOREIGN KEY ("place_id") REFERENCES "Place"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
