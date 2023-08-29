import { Router } from "express"; // importar express
import banners from "../../controllers/api/banners.ctr.js"; // importar objeto con los métodos de la API
const router = Router(); // inicializar router

router.get('/', banners.getAll)

export default router; // exportar router