import { Router } from "express";
import { categories } from "../../../controllers/api/categories.ctr.js";

const router = Router();

router.get('/', categories.all)

export default router;