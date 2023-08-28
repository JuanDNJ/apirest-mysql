import { Router } from "express";
import { articles } from "../../controllers/articles.ctr.js";

const router = Router();

router.get('/articles', articles.all)
router.get('/articles/search/:search', articles.search)
router.post('/articles/article', articles.create)
router.delete('/articles', articles.delete)
router.put('/articles', articles.update)
router.get('/articles/article/:article', articles.get)

export default router;