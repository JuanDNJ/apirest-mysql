import pool from "../db/pool.js" // importar pool de conexión a la base de datos

// exportar objeto con los métodos de la API
export const users = {
    getAllUsers: async (req, res) => {
        const [users] = await pool.query("SELECT * FROM users");
        res.json(users)
    }
}