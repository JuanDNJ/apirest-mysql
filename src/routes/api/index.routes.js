import { Router } from "express"
import accountRoutes from "./account.routes.js";
import { accountVerified, getToken } from "../../midlewares/index.js";
import createRouter from "./authentification.routes.js";
import AuthentificationMod from "../../models/mysql/authentification.mod.js";

const authMod = new AuthentificationMod()

const router = Router()

router.get("/api", (req, res) => {
    res.json({
        message: "Api Rest"
    })
})

router.use("/authentification", createRouter(authMod));
// Private routes
router.use(getToken, accountVerified) // Midlewares autentificate
router.use("/api/account", accountRoutes)


export default router