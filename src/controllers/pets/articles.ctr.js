import {db} from "../../db/index.js"

const pool = await db('mascotas')
if(!pool) throw new Error("No hay conexion con la base de datos")

export const articles = {
    all: async (req, res) => {
        try {
            const [articles] = await pool.query("SELECT * FROM articles");
            if (articles.length === 0) return res.status(404).json({ error: "No registered articles" })
            return res.status(200).json(articles)
        } catch (err) {
            return res.status(500).json({ error: err.message })
        }
    },
    get: async (req, res) => {
        try {
            const { article } = req.params
            const poolQuery = `SELECT * FROM articles WHERE article_id = ${article}`
            const [articles] = await pool.query(poolQuery);
            return res.status(200).json(articles)
        } catch (error) {
            return res.status(500).json({ error: error.message })
        }
    },
    create: async (req, res) => {
        try {
            const { title, text } = req.body
            const poolQuery = `INSERT INTO articles (title, text) VALUES ('${title}', '${text}')`
            const [articles] = await pool.query(poolQuery);
            return res.status(200).json(articles)
        } catch (error) {
            return res.status(500).json({ error: error.message })
        }
    },
    update: async (req, res) => {
        try {
            const { article } = req.params
            const { title, text } = req.body
            const poolQuery = `UPDATE articles SET title = '${title}', text = '${text}' WHERE article_id = ${article}`
            const [articles] = await pool.query(poolQuery);

            return res.status(200).json(articles)
        } catch (error) {
            return res.status(500).json({ error: error.message })
        }
    },
    delete: async (req, res) => {
        try {
            const { article } = req.params
            const poolQuery = `DELETE FROM articles WHERE article_id = ${article}`
            const [articles] = await pool.query(poolQuery);
            return res.status(200).json(articles)
        } catch (error) {
            return res.status(500).json({ error: error.message })
        }
    },
    search: async (req, res) => {
        try {
            const { search } = req.params
            const poolQuery = `SELECT * FROM articles WHERE title LIKE '%${search}%'`
            const [articles] = await pool.query(poolQuery);
            if (articles.length === 0) return res.status(404).json({ error: "No registered articles" })
            return res.status(200).json(articles)
        } catch (error) {
            return res.status(500).json({ error: error.message })
        }
    }
}