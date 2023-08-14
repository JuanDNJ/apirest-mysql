import { Router } from "express"
import { validate } from "../controllers/validate.controller.js"
import pool from "../db/pool.js"


const router = Router()

// Podriamos implementar un midleware, 
// para todas las rutas que necesiten
// validar algun campo de un formulario.

router.get("/", (req,res) => {
    const query = pool.query("SELECT * FROM guia_telefonica")

    res.json({
        message: "API"
    })
})
router.get("/ver-tablas", async (req,res) => {
    const query = await pool.query("SHOW TABLES")
    res.json({
        tables: query[0]
    })
})
router.get("/ver-columnas-tabla/:table", async (req,res) => {
    const { table } = req.params
    const query = await pool.query(`SHOW COLUMNS FROM ${table}`)
    res.json({
        table: query[0]
    })
})
router.get("/describir-tabla/:table", async (req,res) => {
    const { table } = req.params
    const query = await pool.query(`DESCRIBE ${table}`)
    res.json({
        table: query[0]
    })
})
router.get("/explains/:table", async (req,res) => {
    const { table } = req.params
    const query = await pool.query(`EXPLAIN ${table}`)
    res.json({
        table: query[0]
    })
})
router.get("/registros/:table", async (req,res) => {
    const { table } = req.params
    const query = await pool.query(`SELECT COUNT(*) AS registros FROM  ${table}`)
    const registros = query[0][0].registros
    res.json({
        registros: registros
    })
})

router.get("/validate/field/:field/value/:value", validate)

export default router