import pool from "../db/pool.js" // importar pool de conexión a la base de datos

// exportar objeto con los métodos de la API
export const pets = {
    getAllPets: async (req, res) => {
        const [pets] = await pool.query("SELECT * FROM pets"); // ejecutar consulta
        res.json(pets)
    }
}

