import { db } from "../../db/index.js"

const pool = await db('mascotas')
if (!pool) throw new Error("No hay conexion con la base de datos")

// exportar objeto con los métodos de la API
export const pets = {
    // método para obtener todas las mascotas
    getAll: async (req, res) => {
        try { // intentar ejecutar consulta
            const [pets] = await pool.query("SELECT * FROM pets"); // ejecutar consulta
            if (pets.length === 0) return res.status(404).json({ error: "No registered pets" }) // validar si hay mascotas registradas
            return res.status(200).json(pets) // enviar mascotas
        } catch (error) {
            return res.status(500).json({ error: error.message }) // enviar error
        }
    },
    // método para buscar mascotas por nombre
    search: async (req, res) => {
        try { // intentar ejecutar consulta
            const { search } = req.params // obtener parámetro de búsqueda
            const [pets] = await pool.query(`SELECT * FROM pets WHERE name LIKE '%${search}%'`) // ejecutar consulta 
            if (pets.length === 0) return res.status(404).json({ error: "No registered pets" }) // validar si hay mascotas registradas
            return res.status(200).json(pets) // enviar mascotas
        } catch (err) {
            return res.status(500).json({ error: err.message }) // enviar error
        }
    },
    get: async (req, res) => {
        try {
            const { id } = req.params
            const [pet] = await pool.query(`SELECT * FROM pets WHERE pet_id = ${id}`)
            if (pet.length === 0) return res.status(404).json({ error: "Pet not found" })
            return res.status(200).json(pet[0])
        } catch (error) {
            return res.status(500).json({ error: error.message })
        }
    },
    //todo para filtrar mascotas por categorias
    filter: async (req, res) => {
        try {
            const { category } = req.params
            const poolQuery = `SELECT * FROM pets WHERE category = '${category}'`
            const [pets] = await pool.query(poolQuery)
            if (pets.length === 0) return res.status(404).json({ error: "There are no pets registered with that category" })
            return res.status(200).json(pets)
        } catch (error) {
            return res.status(500).json({ error: error.message })
        }
    }
}

