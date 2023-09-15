import { db } from "../db/index.js"
import { validationResult, matchedData } from "express-validator"
import { validField, handlerHashString, handlerCompareHashString, handlerJwtSign } from "../helpers/index.js"
export class AuthentificationCtr {

    constructor(model) {
        this.model = model
    }
    getAccount = async (req, res) => {
        try {
            const result = validationResult(req)

            if (result.isEmpty()) {
                const data = matchedData(req)
                const dbRecord = await this.model.getAccount(data.email)
                if (!dbRecord) return res.status(401).json({ message: 'No autorizado' })
                if (dbRecord && !await handlerCompareHashString(data.password, dbRecord.password)) return res.status(401).json({ message: 'No autorizado' })
                const account = {
                    id: dbRecord.id,
                    name: dbRecord.name,
                    email: dbRecord.email,
                    token: dbRecord.token,
                    data_account: dbRecord.data_account
                }
                return res.status(200).json(account)
            }
            res.status(401).json({
                errors: result.array()
            })
        } catch (error) {
            return res.status(500).json({
                exist: false,
                error,
                message: error.message
            })
        }
    }
    signin = async (req, res) => {
        try {
            const { email, password } = req.body
            const account = await this.model.signin(email)
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
    }
    signup = async (req, res) => {
        try {
            const pool = await db('api')
            if (!pool) throw new Error("No hay conexion con la base de datos")
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
// export const authorization = {
//     // Methods
//     signin: async (req, res) => {
//         try {
//             const ModelAuth = new AuthorizationMod()
//             const { email, password } = req.body
//             const query = await pool.query(`SELECT * FROM account`)
//             const account = await ModelAuth.signin(email)

//             if (!account) return res.status(401).json({
//                 exist: false,
//                 message: 'No autorizado'
//             })

//             const verifyAccount = await handlerCompareHashString(password, account.password)

//             if (!verifyAccount) return res.status(401).json({
//                 exist: false,
//                 message: 'No autorizado'
//             })
//             return res.status(200).json({
//                 exist: true,
//                 token: account.token
//             })

//         } catch (error) {
//             return res.status(500).json({
//                 exist: false,
//                 error,
//                 message: error.message
//             })
//         }

//     },
//     signup: async (req, res) => {
//         try {
//             const { user_handler, email, password } = req.body; // obtener datos de la petición
//             const validEmail = validField("email", email)
//             const validPassword = validField("password", password)
//             const validUserHandler = validField("user_handler", user_handler)
//             if (!validEmail.valid) {
//                 return res.status(401).json({ message: validEmail.message, status: 401 })
//             }
//             if (!validPassword.valid) {
//                 return res.status(401).json({ message: validPassword.message, status: 401 })
//             }
//             if (!validUserHandler.valid) {
//                 return res.status(401).json({ message: validUserHandler.message, status: 401 })
//             }
//             const poolQueryUsers = await pool.query("SELECT * FROM users"); // ejecutar consulta
//             const users = [...poolQueryUsers[0]]; // obtener usuarios
//             // validar si el usuario ya existe
//             const match = users.find(user => user.email === email || user.user_handler === user_handler)
//             // si el usuario ya existe, enviar error
//             if (match) return res.status(401).json({ message: "User already exists!", status: 401 })
//             // si el usuario no existe, encriptar la contraseña
//             const hashPassword = await handlerHashString(password, 10)
//             // si el usuario no existe, agregarlo a la base de datos
//             const poolQueryAddUser = await pool.query(`
//                 INSERT INTO users(user_handle, email, password)
//                 VALUES ('${user_handler}','${email}','${hashPassword}')`)

//             if (!poolQueryAddUser.length) return res.status(400).json({ message: "Could not save new user!", status: 400 }) // si no se pudo agregar el usuario, enviar error
//             // si se pudo agregar el usuario, enviar respuesta
//             const newUser = {
//                 user_id: poolQueryAddUser[0].insertId,
//                 user_handler,
//                 email,
//                 token: await handlerJwtSign({ user_id: poolQueryAddUser[0].insertId, role: 'guest' })
//             }
//             return res.status(200).json({ newUser, status: 200 }) // enviar respuesta

//         } catch (error) {
//             return res.status(500).json({ error: error.message, status: 500 }) // enviar error
//         }
//     }

// }
