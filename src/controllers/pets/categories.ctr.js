import { db } from "../../db/index.js"

const pool = await db('mascotas')
if (!pool) throw new Error("No hay conexion con la base de datos");

export const categories = {
    all: async (req, res) => {
        try {
            const [categories] = await pool.query(`SELECT * FROM categories`)
            if (categories.length === 0) return res.status(404).json({ error: "Pet not found" })
            return res.status(200).json(categories)
        } catch (error) {
            return res.status(500).json({ error: error.message })
        }
    }
}