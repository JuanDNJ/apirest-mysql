import { Router } from "express"; // importar express
import { pets } from "../../controllers/pets/pets.ctr.js"
const router = Router(); // inicializar router

router.get('/', pets.getAll)
router.get('/pet/:id', pets.get)
router.get('/search/:search', pets.search)

export default router; // exportar router