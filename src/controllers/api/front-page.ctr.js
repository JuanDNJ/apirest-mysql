import pool from "../../db/pool.js";

export const frontPage = {
    getAll: async (req, res) => {
        try{
            const [front_pages] = await pool.query("SELECT * FROM front_pages");
            if(front_pages.length === 0) return res.status(404).json({error: "No hay front_pages registradas"})
            return res.status(200).json(front_pages);
        }catch(error){
            return res.status(500).json({ error: error.message })
        }
    }
}