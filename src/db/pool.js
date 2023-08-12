import { DB_HOST, DB_USER, DB_PASSWORD, DB_NAME, DB_PORT } from "../config/index.js"
import { createPool } from "mysql2/promise"


import { handlerHashString } from "../helpers/index.js";

const pool = createPool({
  host: DB_HOST,
  user: DB_USER,
  password: DB_PASSWORD,
  database: DB_NAME,
  port: DB_PORT,
});

pool.getConnection(async (err, connection) => {
  if (err) {
    if (err.code === 'PROTOCOL_CONNECTION_LOST') {
      console.error('Database connection was closed.')
    }
    if (err.code === 'ER_CON_COUNT_ERROR') {
      console.error('Database has to many connections')
    }
    if (err.code === 'ECONNREFUSED') {
      console.error('Database connection was refused')
    }
    console.log(connection)
  }
});

  const admin = {
    user_handle: 'juandevnjv',
    first_name: 'Juan Antonio',
    last_name: 'Valdivia Camacho',
    email: 'admin@gmail.com',
    password: await handlerHashString('Admin@2023', 10),
    role: 'admin',
    is_Active: 1,
    age: 48,
    address: 'Sant Boi de Llobregat, Barcelona, España',
    photo_url: 'http://localhost:5174/juan-perfil32x32.jpg',
    phone_number: '666 666 666'
  }
  await pool.query('DROP TABLE IF EXISTS users')

  await pool.query(`CREATE TABLE IF NOT EXISTS users (
    user_id int NOT NULL AUTO_INCREMENT,
    user_handle varchar(20) NOT NULL,
    first_name varchar(50) DEFAULT NULL,
    last_name varchar(100) DEFAULT NULL,
    email varchar(50) NOT NULL,
    password varchar(500) DEFAULT NULL,
    role char(20) NOT NULL DEFAULT 'user',
    is_active tinyint(1) NOT NULL DEFAULT '1',
    age int DEFAULT 0,
    address varchar(255) DEFAULT NULL,
    photo_url varchar(500) NOT NULL DEFAULT 'http://localhost:5174/juan-perfil32x32.jpg',
    phone_number char(12) DEFAULT NULL,
    create_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id),
    UNIQUE KEY user_handle (user_handle),
    UNIQUE KEY email (email),
    UNIQUE KEY phone_number (phone_number)
  ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;`)

const {user_handle, first_name, last_name, email, password, role, is_Active, age, address, photo_url, phone_number} = admin;

const firstUser = await pool.query(`
  INSERT INTO users (user_handle, first_name, last_name, email, password, role, is_Active, age, address, photo_url, phone_number) 
  VALUES ('${user_handle}', '${first_name}','${last_name}', '${email}', '${password}', '${role}','${is_Active}','${age}','${address}','${photo_url}','${phone_number}' )
`)

export default pool;