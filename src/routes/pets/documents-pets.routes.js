import { Router } from "express"; // importar express
import { petsCtr } from "../../controllers/index.controllers.js";
const router = Router(); // inicializar router

router.get('/', petsCtr.docsPets.getAll)
router.get('/doc/:idPet', petsCtr.docsPets.get)

export default router; // exportar router