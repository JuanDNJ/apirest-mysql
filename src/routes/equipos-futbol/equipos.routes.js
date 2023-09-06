import Router from "express"
import equipos from "../../controllers/equipos-futbol/equipos.ctr.js"
import { handlerJwtVerify } from "../../helpers/index.js"
import { accountVerified } from "../../midlewares/index.js"
const equiposFutbolRouter = Router()


equiposFutbolRouter.get("/", equipos.get.all)
equiposFutbolRouter.get("/get-club/:name", accountVerified,
    async (req, res) => {
     
        res.status(200).json({
            club: req.params.name
        })
    })
export default equiposFutbolRouter