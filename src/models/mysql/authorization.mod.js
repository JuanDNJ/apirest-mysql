import { db } from "../../db/index.js"
const pool = await db('api')
if (!pool) throw new Error("No hay conexion con la base de datos")

export default class AuthorizationMod {
    constructor() {

    }

    signin = async (email, password) => {
        try {
            const [accounts] = await pool.query(`SELECT * FROM account AS accounts`)
            return accounts.find(account => account.email === email)
        } catch (error) {
            throw new Error(error.message)
        }
    }
}