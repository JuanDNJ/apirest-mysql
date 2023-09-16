import { Router } from "express";
import { articles } from "../../controllers/pets/articles.ctr.js";

const router = Router();

router.get('/', articles.all)
router.get('/search/:search', articles.search)
router.post('/article', articles.create)
router.delete('/', articles.delete)
router.put('/', articles.update)
router.get('/article/:article', articles.get)

export default router;