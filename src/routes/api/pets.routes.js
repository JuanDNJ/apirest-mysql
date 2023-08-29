import { Router } from "express"; // importar express
import { pets } from "../../controllers/api/pets.ctr.js"; // importar objeto con los métodos de la API
const router = Router(); // inicializar router

router.get('/', pets.getAll)
router.get('/pet/:id', pets.get)
router.get('/:search', pets.search)
router.get('/category/:category', pets.filter)

export default router; // exportar router