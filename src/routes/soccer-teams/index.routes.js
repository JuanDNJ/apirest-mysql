import Router from "express"
import equipos, { SoccerTeamsCtr } from "../../controllers/soccer-teams/equipos.ctr.js"

const equiposFutbolRouter = Router()
const soccerTeamsCtr = new SoccerTeamsCtr()

equiposFutbolRouter.get("/soccerTeams", soccerTeamsCtr.all)
equiposFutbolRouter.get("/soccerTeams/get-club/:name",
    async (req, res) => {

        res.status(200).json({
            club: req.params.name
        })
    })
export default equiposFutbolRouter