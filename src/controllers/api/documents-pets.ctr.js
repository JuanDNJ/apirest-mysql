import {db} from "../../db/index.js"

const pool = await db('mascotas')
if(!pool) throw new Error("No hay conexion con la base de datos")

export const docsPets = {
    getAll: async (req, res) => {
        try {
            const [docsPets] = await pool.query("SELECT * FROM docs_pets");
            if (docsPets.length === 0) return res.status(404).json({ error: "No registered documents pets" })
            return res.status(200).json(docsPets)
        } catch (error) {
            return res.status(500).json({ error: error.message })
        }
    },
    get: async (req, res) => {
        try {
            const { idPet } = req.params
            const [docPet] = await pool.query(`SELECT * FROM docs_pets WHERE pet_id = ${idPet}`)
            if (docPet.length === 0) return res.status(404).json({ error: "Document pet not found" })
            return res.status(200).json(docPet[0])
        } catch (error) {
            return res.status(500).json({ error: error.message })
        }
    }
}