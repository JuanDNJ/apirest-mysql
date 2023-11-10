import { db } from "../../db/index.js";

const pool = await db('mascotas');
if (!pool) throw new Error("No hay conexion con la base de datos");

export const vets = {

    all: async (req, res) => {
        const [vets] = await pool.query("SELECT * FROM vets");
        return res.status(200).json({ message: 'Return all vets', vets });
    },
    get: async (req, res) => {
        try {
            const { idVet } = req.params
            const poolQuery = `SELECT * FROM vets WHERE idVet = ${idVet}`
            const [vet] = await pool.query(poolQuery);
            return res.status(200).json(vet)
        } catch (error) {
            return res.status(500).json({ error: error.message })
        }
    },
    create: async (req, res) => {
        try {
            const { name, photoUrl, description } = req.body
            const poolQuery = `INSERT INTO vets (name, photoUrl, description) VALUES ('${name}', '${photoUrl}', '${description}')`
            const [newVet] = await pool.query(poolQuery);
            return res.status(200).json(newVet)
        } catch (error) {
            return res.status(500).json({ error: error.message })
        }
    },
    delete: async (req, res) => {
        try {
            const { idVet } = req.params
            const poolQuery = `DELETE FROM vets WHERE idVet = ${idVet}`
            const [deleteVet] = await pool.query(poolQuery);
            return res.status(200).json(deleteVet)
        } catch (error) {
            return res.status(500).json({ error: error.message })
        }
    },
    update: async (req, res) => {
        try {
            const { idVet } = req.params
            const { name, photoUrl, description } = req.body
            const poolQuery = `UPDATE vets SET name = '${name}', photoUrl = '${photoUrl}', description = '${description}' WHERE idVet = ${idVet}`
            const [updateVet] = await pool.query(poolQuery);

            return res.status(200).json(updateVet)
        } catch (error) {
            return res.status(500).json({ error: error.message })
        }
    },
    updateName: async (req, res) => {
        try {
            const { idVet } = req.params
            const { name } = req.body
            const poolQuery = `UPDATE vets SET name = '${name}' WHERE idVet = ${idVet}`
            const [updateVetName] = await pool.query(poolQuery);

            return res.status(200).json(updateVetName)
        } catch (error) {
            return res.status(500).json({ error: error.message })
        }
    },
    updatePhotoUrl: async (req, res) => {
        try {
            const { idVet } = req.params
            const { photoUrl } = req.body
            const poolQuery = `UPDATE vets SET  photoUrl = '${photoUrl}' WHERE idVet = ${idVet}`
            const [updateVetPhotoUrl] = await pool.query(poolQuery);

            return res.status(200).json(updateVetPhotoUrl)
        } catch (error) {
            return res.status(500).json({ error: error.message })
        }
    },
    updateDescription: async (req, res) => {
        try {
            const { idVet } = req.params
            const { description } = req.body
            const poolQuery = `UPDATE vets SET  description = '${description}' WHERE idVet = ${idVet}`
            const [updateVetDescription] = await pool.query(poolQuery);

            return res.status(200).json(updateVetDescription)
        } catch (error) {
            return res.status(500).json({ error: error.message })
        }
    }

}