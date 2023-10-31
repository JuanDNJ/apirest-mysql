import { Router } from "express"; // importar express
import { petsCtr } from "../../controllers/index.controllers.js"
const router = Router(); // inicializar router

router.get('/', petsCtr.pets.getAll)
router.get('/pet/:id', petsCtr.pets.get)
router.get('/search/:search', petsCtr.pets.search)

export default router; // exportar router