import { Router } from "express"; // importar express
import { docsPets } from "../controllers/documents-pets.ctr.js"; // importar objeto con los métodos de la API
const router = Router(); // inicializar router

router.get('/docs-pets', docsPets.getAll)
router.get('/docs-pets/:idPet', docsPets.get)

export default router; // exportar router