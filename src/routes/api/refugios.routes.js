import  {Router}  from 'express'

const router = Router()
import { refugios } from '../../controllers/refugios.ctr.js'
router.get('/refugios', refugios.all)

export default router