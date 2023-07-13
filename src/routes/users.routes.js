import { Router } from "express"; // importar express
import { users } from "../controllers/users.ctr.js";
const router = Router(); // inicializar router

router.get('/users', users.getAllUsers)

export default router; // exportar router