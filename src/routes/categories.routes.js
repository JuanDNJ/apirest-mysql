import { Router } from "express";
import { categories } from "../controllers/categories.ctr.js";

const router = Router();

router.get('/categories', categories.all)
router.get('/categories/category/:category_id', categories.get)
export default router;