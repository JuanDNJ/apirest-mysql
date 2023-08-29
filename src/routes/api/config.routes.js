import { Router } from "express";
import { config } from "../../controllers/api/config.ctr.js";

const router = Router();
router.get('/', config.all)
router.get('/:config_id', config.get)

export default router;
