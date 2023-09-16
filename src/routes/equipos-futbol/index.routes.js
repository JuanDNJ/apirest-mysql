import Router from "express"
import equipos from "../../controllers/equipos-futbol/equipos.ctr.js"

const equiposFutbolRouter = Router()


equiposFutbolRouter.get("/soccerTeams", equipos.get.all)
equiposFutbolRouter.get("/soccerTeams/get-club/:name",
    async (req, res) => {

        res.status(200).json({
            club: req.params.name
        })
    })
export default equiposFutbolRouter