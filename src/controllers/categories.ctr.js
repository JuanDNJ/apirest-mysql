import pool from '../db/pool.js'
export const categories = {
    all: async (req, res) => {

        try{
            const [categories] = await pool.query("SELECT * FROM categories");
            if(categories.length === 0) return res.status(404).json({error: "No hay categories registradas"})
            return res.status(200).json(categories);
        }catch(error){
            return res.status(500).json({ error: error.message })
        }

        
    },
    get: async (req, res) => {
        const { id } = req.params;
        try{
            const [category] = await pool.query(`SELECT * FROM categories WHERE category_id = ${id}`);
            if(category.length === 0) return res.status(404).json({error: "No existe la categoría"})
            return res.status(200).json(category);
        }catch(error){
            return res.status(500).json({ error: error.message })
        }
    }
    
}