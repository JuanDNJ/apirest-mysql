import pool from "../db/pool.js";
export const authorization = {
    // Methods
    login: async (req, res) => { // método para iniciar sesión
        try {
            const { email, password } = req.body; // obtener datos de la petición
            return res.status(200).json({ email, password }); // enviar respuesta 
        } catch (error) {
            return res.status(500).json({ error: error.message }) // enviar error
        }
    },
    register: async (req, res) => { 
        try {
            const {user_handler, first_name,last_name, email, password, age, address, phone_number } = req.body; // obtener datos de la petición
            // console.log({ user_handler,first_name,last_name, email, password, age, address, phone_number })
            const poolQueryUsers = await pool.query("SELECT * FROM users"); // ejecutar consulta
            const users = [...poolQueryUsers[0]]; // obtener usuarios
            // validar si el usuario ya existe
            const match = users.find(user => user.email === email || user.user_handler === user_handler || user.phone_number === phone_number) 
            if(match) return res.status(401) // si el usuario ya existe, enviar error
            
            // si el usuario no existe, agregarlo a la base de datos
            const poolQueryAddUser = await pool.query(`
            INSERT INTO users(user_handle, first_name, last_name, email, password, age, address, phone_number) 
            VALUES ('${user_handler}','${first_name}','${last_name}','${email}','${password}','${age}','${address}','${phone_number}')`)

            if(!poolQueryAddUser.length) return res.status(401) // si no se pudo agregar el usuario, enviar error
            // si se pudo agregar el usuario, enviar respuesta
            const newUser = { 
                user_id: poolQueryAddUser[0].insertId,
                user_handler, 
                first_name,
                last_name, 
                email, 
                password, 
                age, 
                address, 
                phone_number 
            }
            return res.status(200).json(newUser); // enviar respuesta
        } catch (error) {
            return res.status(500).json({ error: error.message }) // enviar error
        }
    }
}