import { Router } from "express";
import { categories } from "../controllers/categories.ctr.js";

const router = Router();

router.get('/categories', categories.all)

export default router;