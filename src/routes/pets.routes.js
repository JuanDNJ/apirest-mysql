import { Router } from "express"; // importar express
import { pets } from "../controllers/pets.ctr.js"; // importar objeto con los métodos de la API
const router = Router(); // inicializar router

router.get('/pets', pets.getAll)
router.get('/pets/:search', pets.search)
router.get('/pets/pet/:id', pets.get)
router.get('/pets/category/:category', pets.filter)

export default router; // exportar router