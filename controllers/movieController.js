import prisma from "../db/db.config.js";

export const getMovie = async (req, res) => {
  const data = await prisma.movie.findMany({});
  res.status(200).json(data);
};

export const postMovie = async (req, res) => {
  const { userId, name, price } = req.body;
  const user_info = await prisma.movie.create({
    data: {
      User: {
        connect: {
          id: userId, //use connect when you are manually inputting userid in another table
        },
      },
      name,
      price,
    },
  });
  res.status(200).json(user_info);
};
