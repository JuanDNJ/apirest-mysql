import { Router } from "express"; // importar express
import usersRouter from "./users.routes.js"
import petsRouter from "./pets.routes.js"
import bannersRoutes from "./banners.routes.js";
import frontPageRouter from "./front-page.routes.js";
import articlesRouter from "./articles.routes.js";
import configRouter from "./config.routes.js";

const router = Router(); // inicializar router

router.use("/pets", petsRouter) // use articlesRouter
router.use("/pets/articles", articlesRouter) // use articlesRouter
router.use("/pets/banners", bannersRoutes) // use bannersRoutes
router.use("/pets/front-pages", frontPageRouter) // use frontPageRouter
router.use("/pets/users", usersRouter) // use usersRouter
router.use("/pets/config", configRouter) // use configRouter 

export default router; // exportar router
