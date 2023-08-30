import Router from "express"
import equipos from "../../controllers/equipos-futbol/equipos.ctr.js"

const equiposFutbolRouter = Router()


equiposFutbolRouter.get("/", equipos.get.all)

export default equiposFutbolRouter