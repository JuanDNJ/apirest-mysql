import { Router } from "express"; // importar express

import createRouter from "./authentification.routes.js";
import AuthentificationMod from "../../models/mysql/authentification.mod.js";
const router = Router(); // inicializar router
const authMod = new AuthentificationMod()
router.get('/', async (req, res) => { // ruta inicial
    const data = {
        title: "Bienvenido!"
    }
    res.redirect("http://apimysql/")

});

router.use("/authentification", createRouter(authMod));

export default router; // exportar router
