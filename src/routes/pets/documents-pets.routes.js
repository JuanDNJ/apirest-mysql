import { Router } from "express"; // importar express
import { docsPets } from "../../controllers/pets/documents-pets.ctr.js"; // importar objeto con los métodos de la API
const router = Router(); // inicializar router

router.get('/', docsPets.getAll)
router.get('/doc/:idPet', docsPets.get)

export default router; // exportar router