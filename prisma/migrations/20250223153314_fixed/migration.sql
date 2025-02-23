/*
  Warnings:

  - You are about to drop the column `user_id` on the `AssignedQuiz` table. All the data in the column will be lost.
  - Added the required column `student_id` to the `AssignedQuiz` table without a default value. This is not possible if the table is not empty.
  - Added the required column `teacher_id` to the `AssignedQuiz` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "AssignedQuiz" DROP CONSTRAINT "AssignedQuiz_user_id_fkey";

-- AlterTable
ALTER TABLE "AssignedQuiz" DROP COLUMN "user_id",
ADD COLUMN     "student_id" TEXT NOT NULL,
ADD COLUMN     "teacher_id" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "AssignedQuiz" ADD CONSTRAINT "AssignedQuiz_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AssignedQuiz" ADD CONSTRAINT "AssignedQuiz_teacher_id_fkey" FOREIGN KEY ("teacher_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
