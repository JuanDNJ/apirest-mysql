import { db } from "../../db/index.js"
const pool = await db('api')
if (!pool) throw new Error("No hay conexion con la base de datos")

export default class AuthentificationMod {
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
    getAccount = async (email) => {
        try {
            const [account] = await pool.query(`SELECT * FROM account WHERE email = ?;`, [email])
            return account[0]
        } catch (e) {
            throw new Error(e.message)
        }

    }
}