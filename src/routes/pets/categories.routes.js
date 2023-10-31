import { Router } from "express";
import { petsCtr } from "../../controllers/index.controllers.js";

const router = Router();

router.get('/', petsCtr.categories.all)

export default router;