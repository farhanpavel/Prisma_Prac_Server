import prisma from "../db/db.config.js";

export const getUser = async (req, res) => {
  const data = await prisma.user.findMany({
    include: {
      bevarage: true,
      movie: true,
    },
  });
  res.status(200).json(data);
};

export const postUser = async (req, res) => {
  const { name, email } = req.body;
  const user_info = await prisma.user.create({
    data: {
      name,
      email,
    },
  });
  res.status(200).json(user_info);
};
