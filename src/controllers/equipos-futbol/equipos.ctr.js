import { db } from "../../db/index.js"

const pool = await db('equipos_futbol')
if(!pool) throw new Error("No hay conexion con la base de datos")

const equipos = {
    get: {
        all: async(req, res) => {

            await pool.query("SELECT * FROM `equipos`")
            res.status(200).json({
                message: 'Get all teams',
                equipos: await pool.query("SELECT * FROM `equipos`")
            })
        },
        id: (req, res) => {
            res.status(200).json({
                message: 'Get id team'
            })
        }
    }
}

export default equipos 