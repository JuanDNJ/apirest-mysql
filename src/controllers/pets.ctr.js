import pool from "../db/pool.js" // importar pool de conexión a la base de datos

// exportar objeto con los métodos de la API
export const pets = {
    getAll: async (req, res) => {
        // MANEJAR ERRORES
        try {
            const [pets] = await pool.query("SELECT * FROM pets"); // ejecutar consulta
            if(pets.length === 0) return res.status(404).json({error: "No hay mascotas registradas"}) // validar si hay mascotas registradas
            return res.status(200).json(pets)
        } catch (error) {
            return res.status(500).json({error: error.message}) // enviar error
        }
    }
}

