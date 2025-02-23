import { getUser, postUser } from "../controllers/userController.js";
import express from "express";

const userRouter = express.Router();
userRouter.get("/", getUser);
userRouter.post("/", postUser);
export default userRouter;
