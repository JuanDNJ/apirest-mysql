import pool from "../db/pool.js";
import { helperValidField } from "../helpers/index.js";
export const authorization = {
    // Methods
    login: async (req, res) => { // método para iniciar sesión
        try {
            const { email, password } = req.body; // obtener datos de la petición
            const validEmail = helperValidField("email", email)
            const validPassword = helperValidField("password", password)
            res.status(200).json({validEmail, validPassword})
            // if(email === undefined || password === undefined || email.length === 0 || password.length === 0) return res.status(401).json({message: "The fields, password and email, cannot be empty."})// si no hay datos, enviar error
            // const query = "SELECT * FROM users where email = '" + email.trim() + "' and password = '" + password.trim() + "'"; // crear consulta
            // const poolQueryUsers = await pool.query(query); // ejecutar consulta
            // const users = [...poolQueryUsers[0]]; // obtener usuarios
            // if(users.length === 0) return res.status(401).json({message: "user not found"})// si no hay usuarios, enviar error   
            // return res.status(200).json(users); // enviar respuesta 
        } catch (error) {
            return res.status(500).json({ error: error.message }) // enviar error
        }
        
    },
    register: async (req, res) => { 
        try {
            const {user_handler, first_name,last_name, email, password, age, address, phone_number } = req.body; // obtener datos de la petición
            if(password.length > 15) return res.status(401).json({message: "The password cannot be longer than 15 characters."}) // si la contraseña es mayor a 15 caracteres, enviar error
            if(password.length < 6) return res.status(401).json({message: "The password cannot be less than 6 characters."}) // si la contraseña es menor a 8 caracteres, enviar error
            if(password.match(/[^a-zA-Z0-9]/g)) return res.status(401).json({message: "The password can only contain letters and numbers."}) // si la contraseña contiene caracteres especiales, enviar error
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