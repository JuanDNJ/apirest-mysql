import { Router } from "express"
// import { account } from "../../controllers/api/account.ctr.js";
import { apiCtr } from "../../controllers/index.controllers.js";

const { account } = apiCtr;
const routerProfile = Router()
routerProfile.get("/", account.profile)


export default routerProfile