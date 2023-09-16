import { Router } from "express";
import { frontPage } from "../../controllers/pets/front-page.ctr.js";
const router = Router();

router.get('/', frontPage.getAll)

export default router;