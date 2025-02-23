import express from "express";
import { getMovie, postMovie } from "../controllers/movieController.js";

const movieRouter = express.Router();
movieRouter.get("/", getMovie);
movieRouter.post("/", postMovie);
export default movieRouter;
