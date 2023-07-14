import pool from '../db/pool.js';
export const config = {
    all: async (req, res) => {
        try {
            const poolQuery = "SELECT * FROM config"
            const [config] = await pool.query(poolQuery);
            if (config.length === 0) return res.status(404).json({ error: "No registered config" })
            return res.status(200).json(config)
        } catch (err) {
            return res.status(500).json({ error: err.message })
        }
    },
    get: async (req, res) => {
        try {
            const { config_id } = req.params
            const poolQuery = `SELECT * FROM config WHERE config_id = ${config_id}`
            const [config] = await pool.query(poolQuery);
            return res.status(200).json(config)
        } catch (error) {
            return res.status(500).json({ error: error.message })
        }
    },
    create: async (req, res) => {
        try {
            const { title, text } = req.body
            const poolQuery = `INSERT INTO config (title, text) VALUES ('${title}', '${text}')`
            const [config] = await pool.query(poolQuery);
            return res.status(200).json(config)
        } catch (error) {
            return res.status(500).json({ error: error.message })
        }
    }
}