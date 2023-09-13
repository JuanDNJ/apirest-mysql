import {db} from "../../db/index.js"

const pool = await db('api')
if(!pool) throw new Error("No hay conexion con la base de datos")


export const account = {
    profile: (req, res) => {

        res.status(200).json({
            account: req.account
        })
    }
}