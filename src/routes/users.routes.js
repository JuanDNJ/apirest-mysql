import { Router } from "express"; // importar express
import { users } from "../controllers/users.ctr.js"; // importar objeto con los métodos de la API
const router = Router(); // inicializar router

router.get('/users', users.getAll)
router.get('/users/user/profile', users.getProfile)
export default router; // exportar router