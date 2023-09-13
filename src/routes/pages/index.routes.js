import { Router } from "express"; // importar express

import authorizationRouter from "./authorization.routes.js";

const router = Router(); // inicializar router

router.get('/', async (req, res) => { // ruta inicial
    const data = {
        title: "Bienvenido!"
    }
    res.redirect("http://apimysql/")

});

router.use("/authorization", authorizationRouter);

export default router; // exportar router
