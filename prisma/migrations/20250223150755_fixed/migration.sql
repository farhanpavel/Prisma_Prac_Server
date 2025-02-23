-- AlterTable
ALTER TABLE "User" ADD COLUMN     "quizId" TEXT;

-- CreateTable
CREATE TABLE "AssignedQuiz" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "quiz_id" TEXT NOT NULL,

    CONSTRAINT "AssignedQuiz_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "AssignedQuiz" ADD CONSTRAINT "AssignedQuiz_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AssignedQuiz" ADD CONSTRAINT "AssignedQuiz_quiz_id_fkey" FOREIGN KEY ("quiz_id") REFERENCES "Quiz"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
