import { Router } from "express";
import { frontPage } from "../../controllers/front-page.ctr.js";
const router = Router();

router.get('/front-pages', frontPage.getAll)

export default router;