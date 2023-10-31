import { db } from "../../db/index.js";
const pool = await db('api');
if (!pool) throw new Error("No hay conexion con la base de datos");

export class SoccerTeamsMod {
    constructor() {

    }
    getTeams = async () => {
        const [query] = await pool.query("SELECT * FROM `equipos`");
        const teams = query.map((team) => {
            team.telefonos = handlerDataSrtringToArray(team.telefonos);
            return team;
        });
    }
    getTeamId = async (id) => {
        const [query] = await pool.query("SELECT * FROM equipos WHERE id= ?;", [id]);
        const team = await query[0]
        return team;
    }
}
