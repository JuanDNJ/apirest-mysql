import { Router } from "express";
import { config } from "../controllers/config.ctr.js";

const router = Router();
router.get('/config', config.all)
router.get('/config/:config_id', config.get)

export default router;