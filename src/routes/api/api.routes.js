import { Router } from "express"
import usersRouter from "./users.routes.js"
import petsRouter  from "./pets.routes.js";
import refugiosRouter from "./refugios.routes.js";
import bannersRoutes from "./banners.routes.js";
import frontPageRouter from "./front-page.routes.js";
import articlesRouter from "./articles.routes.js";
import configRouter from "./config.routes.js";
import categoriesRouter from "./categories.routes.js";
import documentsPets from "./documents-pets.routes.js";
import authorizationRouter from "./authorization.routes.js";

const router = Router()

// Podriamos implementar un midleware, 
// para todas las rutas que necesiten
// validar algun campo de un formulario.

router.get("/", (req,res) => {
    res.json({
        message: "API"
    })
})

router.use("/users", usersRouter) // use usersRouter
router.use("/pets", petsRouter) // use petsRouter
router.use("/refugios", refugiosRouter) // use refugiosRouter
router.use("/banners", bannersRoutes) // use bannersRoutes
router.use("/front-pages", frontPageRouter) // use frontPageRouter
router.use("/articles", articlesRouter) // use articlesRouter
router.use("/config", configRouter) // use configRouter 
router.use("/categories", categoriesRouter) // use categoriesRouter
router.use("/documents", documentsPets) // use documentsPets
router.use("/authorization", authorizationRouter) // use authorizationRouter


export default router