import prisma from "../db/db.config.js";

export const getBevarage = async (req, res) => {
  const data = await prisma.bevarage.findMany({
    include: {
      User: true,
    },
  });
  res.status(200).json(data);
};

export const postBevarage = async (req, res) => {
  const { userId, name, price } = req.body;
  const user_info = await prisma.bevarage.create({
    data: {
      User: {
        connect: {
          id: userId,
        },
      },
      name,
      price,
    },
  });
  res.status(200).json(user_info);
};
