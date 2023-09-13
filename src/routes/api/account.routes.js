import { Router } from "express"
import { account } from "../../controllers/api/account.ctr.js"

const routerProfile = Router()
routerProfile.get("/" , account.profile)


export default routerProfile