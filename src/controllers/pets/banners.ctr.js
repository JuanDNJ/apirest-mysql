import {db} from "../../db/index.js"

const pool = await db('mascotas')
if(!pool) throw new Error("No hay conexion con la base de datos")
export default {
    getAll: async (req, res) => {
        try {
            const [banners] = await pool.query("SELECT * FROM banners")
            if(banners.length === 0) return res.status(404).json({ error: "No hay banners" })   
            return res.status(200).json(banners)
        } catch (error) {
            return res.status(500).json({ error: error.message })
        }
    }
}