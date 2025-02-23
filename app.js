import express from "express";
import "dotenv/config";
import userRouter from "./routers/userRouter.js";
import movieRouter from "./routers/movieRouter.js";
import bevarageRouter from "./routers/bevarageRouter.js";

const app = express();
const PORT = process.env.PORT;
app.use(express.json());
app.get("/", (req, res) => {
  return res.send("Hello From pavel");
});

app.listen(PORT, () => {
  console.log(`Database is initialized Successfully at ${PORT}`);
});

app.use("/api/user", userRouter);
app.use("/api/movie", movieRouter);
app.use("/api/bevarage", bevarageRouter);
