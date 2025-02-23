import express from "express";
import {
  getBevarage,
  postBevarage,
} from "../controllers/bevarageController.js";

const bevarageRouter = express.Router();
bevarageRouter.get("/", getBevarage);
bevarageRouter.post("/", postBevarage);
export default bevarageRouter;
