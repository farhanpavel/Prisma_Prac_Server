-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Book" (
    "id" SERIAL NOT NULL,
    "user_id" INTEGER NOT NULL,
    "Book_name" TEXT NOT NULL,
    "Book_num" TEXT NOT NULL,

    CONSTRAINT "Book_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Place" (
    "id" SERIAL NOT NULL,
    "book_id" INTEGER NOT NULL,
    "library_name" TEXT NOT NULL,
    "place" TEXT NOT NULL,

    CONSTRAINT "Place_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Book_user_id_key" ON "Book"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "Place_book_id_key" ON "Place"("book_id");

-- AddForeignKey
ALTER TABLE "Book" ADD CONSTRAINT "Book_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Book" ADD CONSTRAINT "Book_id_fkey" FOREIGN KEY ("id") REFERENCES "Place"("book_id") ON DELETE RESTRICT ON UPDATE CASCADE;
