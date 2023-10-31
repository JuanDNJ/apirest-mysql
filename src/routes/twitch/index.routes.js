import Router from "express";
import { twitch } from "../../controllers/twitch/index.ctr.js";

const router = Router();

router.get("/twitch", twitch.all);

export default router;