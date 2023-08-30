import { db } from "../../db/index.js"

const pool = await db('guia_telefonica')
if(!pool) throw new Error("No hay conexion con la base de datos")

export const guia = {
    get: {
        all: async (req, res) => {
            try {
                const contactos = await pool.query("SELECT * FROM contactos")
                const result = await contactos[0]
                res.status(200).json(result)
            } catch (error) {
                res.status(500).json(error)
            }
        },
        id: async (req, res) => {
            try {
                const { id } = req.params;
                const contactos = await pool.query("SELECT * FROM contactos WHERE idContacto=" + id)
                const result = await contactos[0]
                res.status(200).json(result)
            } catch (error) {
                res.status(500).json(error)
            }
        },
        searchByName: async (req, res) => {
            try{
                const { nombre } = req.params
                const contactos = await pool.query(`SELECT * FROM contactos WHERE nombre LIKE '%${nombre}%'`)
                const result =  contactos[0]
                res.status(200).json(result)
            }catch(error){
                res.status(500).json(error)
            }
        },
        searchByPhone: async (req, res) => {
            try{
                const { telefono } = req.params
                const contactos = await pool.query(`SELECT * FROM contactos WHERE telefono LIKE '%${telefono}%'`)
                const result =  contactos[0]
                res.status(200).json(result)
            }catch(error){
                res.status(500).json(error)
            }
        }
    },
    delete: {
        id: async (req, res) => {
            try {
                const { id } = req.params
                const contacto = await pool.query("DELETE FROM contactos WHERE idContacto=" + id)
                const result =  contacto[0]
                res.status(200).json(result)
            } catch (error) {
                res.status(500).json(error)
            }
        },
    },
    put: {
        id: async (req, res) => {
            try {
                const { nombre, telefono } = req.body
                const { id } = req.params
                const contacto = await pool.query(`UPDATE contactos SET nombre='${nombre}', telefono='${telefono}' WHERE idContacto=${id}`)
                const result =  contacto[0]
                res.status(200).json(result)
            } catch (error) {
                res.status(500).json(error)
            }
        }
    },
    post: {
        create: async (req, res) => {
            try {
                const { nombre, telefono } = req.body
                const contacto = await pool.query(`INSERT INTO contactos (nombre, telefono) VALUES ('${nombre}', '${telefono}')`)
                const result = await contacto[0]
                res.status(200).json(result)
            } catch (error) {
                res.status(500).json(error)
            }
        }
    }
    
}