/*
  Warnings:

  - You are about to drop the column `role` on the `User` table. All the data in the column will be lost.
  - You are about to drop the `Ans` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `AssignedQuiz` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Quiz` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Result` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Ans" DROP CONSTRAINT "Ans_user_id_fkey";

-- DropForeignKey
ALTER TABLE "AssignedQuiz" DROP CONSTRAINT "AssignedQuiz_quiz_id_fkey";

-- DropForeignKey
ALTER TABLE "AssignedQuiz" DROP CONSTRAINT "AssignedQuiz_student_id_fkey";

-- DropForeignKey
ALTER TABLE "AssignedQuiz" DROP CONSTRAINT "AssignedQuiz_teacher_id_fkey";

-- DropForeignKey
ALTER TABLE "Quiz" DROP CONSTRAINT "Quiz_user_id_fkey";

-- DropForeignKey
ALTER TABLE "Result" DROP CONSTRAINT "Result_user_id_fkey";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "role";

-- DropTable
DROP TABLE "Ans";

-- DropTable
DROP TABLE "AssignedQuiz";

-- DropTable
DROP TABLE "Quiz";

-- DropTable
DROP TABLE "Result";

-- CreateTable
CREATE TABLE "Movie" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,

    CONSTRAINT "Movie_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Bevarage" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Bevarage_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Movie" ADD CONSTRAINT "Movie_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bevarage" ADD CONSTRAINT "Bevarage_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
