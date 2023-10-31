import { Router } from "express";

import { petsCtr } from "../../controllers/index.controllers.js";

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
router.get('/', petsCtr.config.all)
router.get('/:config_id', petsCtr.config.get)

export default router;
