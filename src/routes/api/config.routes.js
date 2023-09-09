import { Router } from "express";
import { config } from "../../controllers/api/config.ctr.js";

const router = Router();

router.use((req, res, next) => {
    try {
        if (req.account.rol != "admin") return res.status(401).json({
            message: 'Unautorize¡'
        })
        next()
    } catch (error) {
        throw new Error(error)
    }
})
router.get('/', config.all)
router.get('/:config_id', config.get)

export default router;
