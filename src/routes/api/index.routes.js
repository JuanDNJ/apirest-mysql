import { Router } from "express"
import accountRoutes from "./account.routes.js";
import { accountVerified, getToken } from "../../midlewares/index.js";
const router = Router()

router.get("/api", (req, res) => {
    res.json({
        message: "Get url Api"
    })
})

// Private routes
router.use(getToken, accountVerified) // Midlewares autentificate
router.use("/api/account", accountRoutes)


export default router