import { Router } from 'express'
import { sheltersCtr } from '../../controllers/index.controllers.js';

const router = Router()

router.get('/shelters', sheltersCtr.shelters.all)

// router.get("/shelters", (req, res) => {
//     res.status(200).json({
//         message: "Shelters"
//     })
// })

export default router