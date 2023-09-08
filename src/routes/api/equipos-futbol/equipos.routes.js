import Router from "express"
import equipos from "../../../controllers/equipos-futbol/equipos.ctr.js"

const equiposFutbolRouter = Router()


equiposFutbolRouter.get("/", equipos.get.all)
equiposFutbolRouter.get("/get-club/:name",
    async (req, res) => {
     
        res.status(200).json({
            club: req.params.name
        })
    })
export default equiposFutbolRouter