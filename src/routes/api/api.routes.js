import { Router } from "express"
import usersRouter from "./users.routes.js"
import petsRouter  from "./pets/pets.routes.js";
import refugiosRouter from "./refugios.routes.js";
import bannersRoutes from "./banners.routes.js";
import frontPageRouter from "./front-page.routes.js";
import articlesRouter from "./articles.routes.js";
import configRouter from "./config.routes.js";
import guiaTelefonicaRouter from "./guia-telefonica/guia.routes.js"
import equiposFutbolRouter from "./equipos-futbol/equipos.routes.js";
import routerProfile from "./account.routes.js";
import { accountVerified, getToken } from "../../midlewares/index.js";
const router = Router()

// Podriamos implementar un midleware, 
// para todas las rutas que necesiten
// validar algun campo de un formulario.

router.get("/", (req,res) => {
    res.json({
        message: "API"
    })
})
router.use("/articles", articlesRouter) // use articlesRouter
router.use("/refugios", refugiosRouter) // use refugiosRouter
router.use("/banners", bannersRoutes) // use bannersRoutes
router.use("/front-pages", frontPageRouter) // use frontPageRouter
router.use("/pets/", petsRouter) // use petsRouter
router.use("/guia-telefonica", guiaTelefonicaRouter) // use usersRouter
router.use("/equipos-futbol", equiposFutbolRouter)
// Private routes
router.use(getToken,accountVerified) // Midlewares autentificate
router.use("/users", usersRouter) // use usersRouter
router.use("/profile", routerProfile)
router.use("/config", configRouter) // use configRouter 

export default router