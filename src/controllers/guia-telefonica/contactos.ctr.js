import guiaTelefonica from '../../db/pool-guia-telefonica.js'

export const contactos = {
    getAll: async (req, res) => {
        try {
            const contactos = await guiaTelefonica.query("SELECT * FROM contactos")
            const result = await contactos[0]
            res.status(200).json(result)
        } catch (error) {
            res.status(500).json(error)
        }
    },
    get: async (req, res) => {
        try {
            const { id } = req.params;
            const contactos = await guiaTelefonica.query("SELECT * FROM contactos WHERE idContacto=" + id)
            const result = await contactos[0]
            res.status(200).json(result)
        } catch (error) {
            res.status(500).json(error)
        }
    },
    remove: async (req, res) => {
        try {
            const { id } = req.params
            const contacto = await guiaTelefonica.query("DELETE FROM contactos WHERE idContacto=" + id)
            const result =  contacto[0]
            res.status(200).json(result)
        } catch (error) {
            res.status(500).json(error)
        }
    },
    edit: async (req, res) => {
        try {
            const { nombre, telefono } = req.body
            const { id } = req.params
            const contacto = await guiaTelefonica.query(`UPDATE contactos SET nombre='${nombre}', telefono='${telefono}' WHERE idContacto=${id}`)
            const result =  contacto[0]
            res.status(200).json(result)
        } catch (error) {
            res.status(500).json(error)
        }
    },
    create: async (req, res) => {
        try {
            const { nombre, telefono } = req.body
            const contacto = await guiaTelefonica.query(`INSERT INTO contactos (nombre, telefono) VALUES ('${nombre}', '${telefono}')`)
            const result = await contacto[0]
            res.status(200).json(result)
        } catch (error) {
            res.status(500).json(error)
        }
    },
    searchByName: async (req, res) => {
        try{
            const { nombre } = req.params
            const contactos = await guiaTelefonica.query(`SELECT * FROM contactos WHERE nombre LIKE '%${nombre}%'`)
            const result =  contactos[0]
            res.status(200).json(result)
        }catch(error){
            res.status(500).json(error)
        }
    },
    searchByPhone: async (req, res) => {
        try{
            const { telefono } = req.params
            const contactos = await guiaTelefonica.query(`SELECT * FROM contactos WHERE telefono LIKE '%${telefono}%'`)
            const result =  contactos[0]
            res.status(200).json(result)
        }catch(error){
            res.status(500).json(error)
        }
    }
}