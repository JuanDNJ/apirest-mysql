import { Router } from "express"; // importar express
import banners from "../../controllers/banners.ctr.js"; // importar objeto con los métodos de la API
const router = Router(); // inicializar router

router.get('/banners', banners.getAll)

export default router; // exportar router