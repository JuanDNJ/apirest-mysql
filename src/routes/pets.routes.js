import { Router } from "express"; // importar express
import { pets } from "../controllers/pets.ctr.js"; // importar objeto con los métodos de la API
const router = Router(); // inicializar router

router.get('/pets', pets.getAll)

export default router; // exportar router