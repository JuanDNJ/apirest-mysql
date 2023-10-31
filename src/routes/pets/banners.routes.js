import { Router } from "express"; // importar express
import { petsCtr } from "../../controllers/index.controllers.js"

const router = Router(); // inicializar router

router.get('/', petsCtr.banners.getAll)

export default router; // exportar router