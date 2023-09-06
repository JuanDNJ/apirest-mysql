import { db } from "../db/index.js"
import { validField, handlerHashString, handlerCompareHashString, handlerJwtSign } from "../helpers/index.js"

const pool = await db('api')
if (!pool) throw new Error("No hay conexion con la base de datos")

export const authorization = {
    // Methods
    signin: async (req, res) => {
        try {

            const { email, password } = req.body
            const query = await pool.query(`SELECT * FROM account`)
            const account = query[0].find(account => account.email === email)

            if (!account) return res.status(401).json({
                exist: false,
                message: 'No autorizado'
            })

            const verifyAccount = await handlerCompareHashString(password, account.password)

            if (!verifyAccount) return res.status(401).json({
                exist: false,
                message: 'No autorizado'
            })
            return res.status(200).json({
                exist: true,
                token: account.token
            })

        } catch (error) {
            return res.status(500).json({
                exist: false,
                error,
                message: error.message
            })
        }

    },
    signup: async (req, res) => {
        try {
            const { user_handler, email, password } = req.body; // obtener datos de la petición
            const validEmail = validField("email", email)
            const validPassword = validField("password", password)
            const validUserHandler = validField("user_handler", user_handler)
            if (!validEmail.valid) {
                return res.status(401).json({ message: validEmail.message, status: 401 })
            }
            if (!validPassword.valid) {
                return res.status(401).json({ message: validPassword.message, status: 401 })
            }
            if (!validUserHandler.valid) {
                return res.status(401).json({ message: validUserHandler.message, status: 401 })
            }
            const poolQueryUsers = await pool.query("SELECT * FROM users"); // ejecutar consulta
            const users = [...poolQueryUsers[0]]; // obtener usuarios
            // validar si el usuario ya existe
            const match = users.find(user => user.email === email || user.user_handler === user_handler)
            // si el usuario ya existe, enviar error
            if (match) return res.status(401).json({ message: "User already exists!", status: 401 })
            // si el usuario no existe, encriptar la contraseña
            const hashPassword = await handlerHashString(password, 10)
            // si el usuario no existe, agregarlo a la base de datos
            const poolQueryAddUser = await pool.query(`
                INSERT INTO users(user_handle, email, password) 
                VALUES ('${user_handler}','${email}','${hashPassword}')`)

            if (!poolQueryAddUser.length) return res.status(400).json({ message: "Could not save new user!", status: 400 }) // si no se pudo agregar el usuario, enviar error
            // si se pudo agregar el usuario, enviar respuesta
            const newUser = {
                user_id: poolQueryAddUser[0].insertId,
                user_handler,
                email,
                token: await handlerJwtSign({ user_id: poolQueryAddUser[0].insertId, role: 'guest' })
            }
            return res.status(200).json({ newUser, status: 200 }) // enviar respuesta

        } catch (error) {
            return res.status(500).json({ error: error.message, status: 500 }) // enviar error
        }
    }

}

const old = async (req, res) => { // método para iniciar sesión
    try {
        // obtener datos de la petición
        const { email, password } = req.body;

        // // validar los datos de la petición
        // const validEmail = validField("email", email)
        // const validPassword = validField("password", password)
        // if (!validEmail.valid) {
        //     return res.status(401).json({ message: validEmail.message , status: 401})
        // }
        // if (!validPassword.valid) {
        //     return res.status(401).json({ message: validPassword.message , status: 401})
        // }

        // Crear consulta para obtener el usuario
        const query = `SELECT * FROM account where email = '${email.trim()}'`
        // ejecutar consulta
        const poolQueryUsers = await pool.query(query);
        // Crear un objeto con los datos del usuario
        const user = poolQueryUsers[0][0];
        console.log(user)
        // si no hay usuario, enviar error
        if (!user) return res.status(401).json({ message: "User not found!", status: 401 })
        // validar password comparando el hash de la base de datos con el password enviado
        const match = handlerCompareHashString(password, user.password).then(res => res)

        // Si no tenemos match, enviar error   
        if (!match) return res.status(401).json({ message: "User not found!", status: 401 })


        // Si tenemos match, enviar respuesta
        return res.status(200).json({ token: user.token, status: 200 })

    } catch (error) {
        // Si hay un error, enviar error
        return res.status(500).json({ error: error.message, status: 500 })
    }

}