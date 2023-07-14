import pool from "../db/pool.js" // importar pool de conexión a la base de datos

// exportar objeto con los métodos de la API
export const pets = {
    // método para obtener todas las mascotas
    getAll: async (req, res) => {
        try { // intentar ejecutar consulta
            const poolQuery = "SELECT * FROM pets" // crear consulta
            const [pets] = await pool.query(poolQuery); // ejecutar consulta
            if(pets.length === 0) return res.status(404).json({error: "No hay mascotas registradas"}) // validar si hay mascotas registradas
            return res.status(200).json(pets) // enviar mascotas
        } catch (error) {
            return res.status(500).json({error: error.message}) // enviar error
        }
    },
    // método para buscar mascotas por nombre
    search: async (req, res) => {
        try{ // intentar ejecutar consulta
            const {search} = req.params // obtener parámetro de búsqueda
            const poolQuery = `SELECT * FROM pets WHERE name LIKE '%${search}%'` // crear consulta
            const [pets] = await pool.query(poolQuery) // ejecutar consulta 
            if(pets.length === 0) return res.status(404).json({error: "No hay mascotas registradas"}) // validar si hay mascotas registradas
            return res.status(200).json(pets) // enviar mascotas
        }catch(err) {
            return res.status(500).json({error: err.message}) // enviar error
        }
    },
}

