import pool from "../db/pool.js"
import bcrypt from "bcrypt"
import { validField, handlerHashString, handlerCompareHashString, handlerJwtSign } from "../helpers/index.js"

export const authorization = {
    // Methods
    login: async (req, res) => { // método para iniciar sesión
        try {
            // obtener datos de la petición
            let { email, password } = req.body;

            // validar los datos de la petición
            const validEmail = validField("email", email)
            const validPassword = validField("password", password)
            if (!validEmail.valid) {
                return res.status(401).json({ message: validEmail.message })
            }
            if (!validPassword.valid) {
                return res.status(401).json({ message: validPassword.message })
            }

            // Crear consulta para obtener el usuario
            const query = `SELECT * FROM users where email = '${email.trim()}'`
            // ejecutar consulta
            const poolQueryUsers = await pool.query(query);
            // Crear un objeto con los datos del usuario
            const user = poolQueryUsers[0][0];

            // validar password comparando el hash de la base de datos con el password enviado
            const match = await handlerCompareHashString(password, user.password)

            // Si no tenemos match, enviar error   
            if (!match) return res.status(401).json({ message: "User not found!" })


            // Si tenemos match, enviar respuesta
            return res.status(200).json({ user, login: match, token: await handlerJwtSign({ user_id: user.user_id, role: user.role }) })

        } catch (error) {
            // Si hay un error, enviar error
            return res.status(500).json({ error: error.message })
        }

    },
    register: async (req, res) => {
        try {
            const { user_handler, email, password } = req.body; // obtener datos de la petición
            const validEmail = validField("email", email)
            const validPassword = validField("password", password)
            const validUserHandler = validField("user_handler", user_handler)
            if (!validEmail.valid) {
                return res.status(401).json({ message: validEmail.message })
            }
            if (!validPassword.valid) {
                return res.status(401).json({ message: validPassword.message })
            }
            if (!validUserHandler.valid) {
                return res.status(401).json({ message: validUserHandler.message })
            }
            const poolQueryUsers = await pool.query("SELECT * FROM users"); // ejecutar consulta
            const users = [...poolQueryUsers[0]]; // obtener usuarios
            // validar si el usuario ya existe
            const match = users.find(user => user.email === email || user.user_handler === user_handler)
            // si el usuario ya existe, enviar error
            if (match) return res.status(401).json({ message: "User already exists!" })
            // si el usuario no existe, encriptar la contraseña
            const hashPassword = await handlerHashString(password, 10)
            // si el usuario no existe, agregarlo a la base de datos
            const poolQueryAddUser = await pool.query(`
                INSERT INTO users(user_handle, email, password) 
                VALUES ('${user_handler}','${email}','${hashPassword}')`)

            if (!poolQueryAddUser.length) return res.status(401) // si no se pudo agregar el usuario, enviar error
            // si se pudo agregar el usuario, enviar respuesta
            const newUser = {
                user_id: poolQueryAddUser[0].insertId,
                user_handler,
                email,
                token: await handlerJwtSign({ user_id: poolQueryAddUser[0].insertId, role: 'guest' })
            }
            return res.status(200).json(newUser) // enviar respuesta

        } catch (error) {
            return res.status(500).json({ error: error.message }) // enviar error
        }
    }
}