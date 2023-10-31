import { Router } from "express";
import { petsCtr } from "../../controllers/index.controllers.js";

const router = Router();

router.get('/', petsCtr.articles.all)
router.get('/search/:search', petsCtr.articles.search)
router.post('/article', petsCtr.articles.create)
router.delete('/', petsCtr.articles.delete)
router.put('/', petsCtr.articles.update)
router.get('/article/:article', petsCtr.articles.get)

export default router;