import  {Router}  from 'express'

const router = Router()
import { refugios } from '../../controllers/api/refugios.ctr.js'
router.get('/', refugios.all)

export default router