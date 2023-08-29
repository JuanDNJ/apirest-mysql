// import pool from "../db/pool.js" // importar pool de conexión a la base de datos
import {db} from "../../db/index.js"
import { handlerJwtVerify } from "../../helpers/index.js"; // importar función para verificar token

const pool = await db('mascotas')
if(!pool) throw new Error("No hay conexion con la base de datos")

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
    },
    getProfile: async (req, res) => {
        try {
            const authorization =  req.get('Authorization')
            const bearer = authorization.split(' ')[0]
            const token = authorization.split(' ')[1]
            // Comprobar si es Bearer
            // Si no es Bearer, enviar error
            if(bearer !== 'Bearer') return res.status(401).json({error: "No autorizado"}) 
            // Comprobar si el token es válido
            const claim = await handlerJwtVerify(token)

            if(!claim) return res.status(401).json({error: "No autorizado"})
            
            const { user_id } = claim
       
            // const { id } = req.params; // obtener id de usuario
            const [user] = await pool.query("SELECT * FROM users WHERE user_id = ?", [user_id]); // ejecutar consulta
            if(user.length === 0) return res.status(404).json({error: "Usuario no encontrado"}) // validar si el usuario existe
            return res.status(200).json(user[0]) // enviar respuesta
        } catch (error) {
            return res.status(500).json({error: error.message}) // enviar error
        }
    }
}