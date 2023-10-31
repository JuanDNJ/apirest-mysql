// import pool from "../db/pool.js" // importar pool de conexión a la base de datos
import { db } from "../../db/index.js"


const pool = await db('refugios')
if (!pool) throw new Error("No hay conexion con la base de datos")

export const refugios = {
    all: async (req, res) => {
        try {
            const query = await pool.query("SELECT * FROM refugios");
            if (await query[0].length === 0) return res.status(404).json({ message: "No hay refugios" });
            const [rows, fields] = await query;
            res.status(200).json(rows);
        } catch (error) {
            console.log(error);
        }
    }
}