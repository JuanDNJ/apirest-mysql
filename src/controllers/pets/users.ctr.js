// import pool from "../db/pool.js" // importar pool de conexión a la base de datos
import { db } from "../../db/index.js"

import { validationResult, matchedData } from "express-validator"
const pool = await db('mascotas')
if (!pool) throw new Error("No hay conexion con la base de datos")

// exportar objeto con los métodos de la API
export const users = {
    getAll: async (req, res) => {
        try {
            const [users] = await pool.query("SELECT * FROM users"); // ejecutar consulta
            if (users.length === 0) return res.status(404).json({ error: "No hay usuarios registrados" }) // validar si hay usuarios registrados
            return res.status(200).json({
                users, token: req.accountVerified
            }) // enviar respuesta
        } catch (error) {
            return res.status(500).json({ error: error.message }) // enviar error
        }
    },
    getUser: async (req, res) => {
        try {
            const result = validationResult(req)
            if (!result.isEmpty()) return res.status(401).json({
                errors: result.array()
            })
            const data = matchedData(req)
            console.log(data)
            const [user] = await pool.query("SELECT * FROM users WHERE user_id = ?", [data.id]); // ejecutar consulta
            if (user.length === 0) return res.status(404).json({ error: "Usuario no encontrado" }) // validar si el usuario existe
            return res.status(200).json({ ...user[0] }) // enviar respuesta
        } catch (error) {
            return res.status(500).json({ error: error.message }) // enviar error
        }
    }
}