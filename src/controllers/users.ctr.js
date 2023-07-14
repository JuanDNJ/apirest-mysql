import pool from "../db/pool.js" // importar pool de conexión a la base de datos

// exportar objeto con los métodos de la API
export const users = {
    getAll: async (req, res) => {
        try {
            const [users] = await pool.query("SELECT * FROM users"); // ejecutar consulta
            if(users.length === 0) return res.status(404).json({error: "No hay usuarios registrados"}) // validar si hay usuarios registrados
            return res.status(200).json(users) // enviar respuesta
        } catch (error) {
            return res.status(500).json({error: error.message}) // enviar error
        }
    }
}