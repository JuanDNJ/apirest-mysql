import { Router } from "express"; // importar express
import { users } from "../../controllers/api/users.ctr.js"; // importar objeto con los métodos de la API
const router = Router(); // inicializar router

router.get('/', users.getAll)
router.get('/user/:id', users.getUser)
export default router; // exportar router