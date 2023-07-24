import pool from "../db/pool.js"

export const refugios = {
    all: async (req, res) => {
        try {
            const query = pool.query("SELECT * FROM refugios");
            console.log(query);
            if(await query[0].length === 0) return res.status(404).json({message: "No hay refugios"} );
            const [rows, fields] = await query;
            res.status(200).json(rows);
        } catch (error) {
            console.log(error);
        }
    }
}