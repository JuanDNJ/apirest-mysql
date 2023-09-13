import { Router } from "express"; // importar express

import createRouter from "./authorization.routes.js";
import AuthorizationMod from "../../models/mysql/authorization.mod.js";
const router = Router(); // inicializar router
const authMod = new AuthorizationMod()
router.get('/', async (req, res) => { // ruta inicial
    const data = {
        title: "Bienvenido!"
    }
    res.redirect("http://apimysql/")

});

router.use("/authorization", createRouter(authMod));

export default router; // exportar router
