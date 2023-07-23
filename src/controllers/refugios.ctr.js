import pool from "../db/pool.js"

export const refugios = {
    all: async (req, res) => {

        const query = pool.query("SELECT * FROM refugios");
        const [rows, fields] = await query;
        res.status(200).json(rows);

    }
}