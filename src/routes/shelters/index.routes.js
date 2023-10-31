import { Router } from 'express'

const router = Router()
import { refugios } from '../../controllers/shelters/refugios.ctr.js'
router.get('/shelters', refugios.all)

// router.get("/shelters", (req, res) => {
//     res.status(200).json({
//         message: "Shelters"
//     })
// })

export default router