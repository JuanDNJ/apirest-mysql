import { Router } from "express"; // importar express
import { users } from "../../controllers/pets/users.ctr.js"; // importar objeto con los métodos de la API
import { idValidationScheme } from "../../validators/index.js";

const router = Router(); // inicializar router

router.get('/', users.getAll)
router.get('/user/:id', idValidationScheme, users.getUser)
export default router; // exportar router