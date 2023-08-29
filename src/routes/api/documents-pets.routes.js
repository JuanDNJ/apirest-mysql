import { Router } from "express"; // importar express
import { docsPets } from "../../controllers/api/documents-pets.ctr.js"; // importar objeto con los métodos de la API
const router = Router(); // inicializar router

router.get('/pets', docsPets.getAll)
router.get('/pets/:idPet', docsPets.get)

export default router; // exportar router