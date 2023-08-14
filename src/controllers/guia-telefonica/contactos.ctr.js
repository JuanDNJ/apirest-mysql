import guiaTelefonica from '../../db/pool-guia-telefonica.js'

export const contactos = {
    getAll: async (req, res) => {
        try {
            const contactos = await guiaTelefonica.query("SELECT * FROM contactos")
            const result = await contactos[0]
            res.status(200).json(result)
        } catch (error) {
            res.status(404).json(error)
        }
    },
    get: async (req, res) => {
        try {
            const { id } = req.params;
            const contactos = await guiaTelefonica.query("SELECT * FROM contactos WHERE idContacto=" + id)
            const result = await contactos[0]
            res.status(200).json(result)
        } catch (error) {
            res.status(404).json(error)
        }
    },
    remove: async (req, res) => {
        try {
            const { id } = req.params
            const contacto = await guiaTelefonica.query("DELETE FROM contactos WHERE idContacto=" + id)
            const result = await contacto[0]
            res.status(200).json(result)
        } catch (error) {
            res.status(404).json(error)
        }
    },
    edit: async (req, res) => {
        try {
            const { nombre, telefono } = req.body
            const { id } = req.params
            const contacto = await guiaTelefonica.query(`UPDATE contactos SET nombre='${nombre}', telefono='${telefono}' WHERE idContacto=${id}`)
            const result = await contacto[0]
            res.status(200).json(result)
        } catch (error) {
            res.status(404).json(error)
        }
    },
    create: async (req, res) => {
        try {
            const { nombre, telefono } = req.body
            const contacto = await guiaTelefonica.query(`INSERT INTO contactos (nombre, telefono) VALUES ('${nombre}', '${telefono}')`)
            const result = await contacto[0]
            res.status(200).json(result)
        } catch (error) {
            res.status(404).json(error)
        }
    }
}