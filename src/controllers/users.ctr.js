import pool from "../db/pool.js"
export const users = {
    getAllUsers: async (req, res) => {
        const [users] = await pool.query("SELECT * FROM users");
        res.json(users)
    }
}