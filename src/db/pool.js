import { DB_HOST, DB_USER, DB_PASSWORD, DB_NAME, DB_PORT } from "../config/index.js"
import { createPool } from "mysql2/promise"


// import { handlerHashString } from "../helpers/index.js";

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

//   const admin = {
//     user_handle: 'juandevnjv',
//     first_name: 'Juan Antonio',
//     last_name: 'Valdivia Camacho',
//     email: 'admin@gmail.com',
//     password: await handlerHashString('Admin@2023', 10),
//     role: 'admin',
//     is_Active: 1,
//     age: 48,
//     address: 'Sant Boi de Llobregat, Barcelona, España',
//     photo_url: 'http://localhost:5174/juan-perfil32x32.jpg',
//     phone_number: '666 666 666'
//   }
//   // await pool.query('DROP TABLE IF EXISTS users')

//   await pool.query(`CREATE TABLE IF NOT EXISTS users (
// 	user_id int not null auto_increment,
//     user_handle varchar(20) not null unique,
//     first_name varchar(50) null,
//     last_name varchar(100) null,
//     email varchar(50) not null unique,
//     password varchar(500) null,
//     role char(20) not null default('user'),
//     is_active boolean not null default true,
//     age int(3) null default(null),
//     address varchar(255) null,
//     photo_url varchar(500) not null default('http://localhost:5174/juan-perfil32x32.jpg'),
//     phone_number char(12) unique,
//     create_at timestamp not null default (now()),
//     primary key(user_id)
// )`)

// const {user_handle, first_name, last_name, email, password, role, is_Active, age, address, photo_url, phone_number} = admin;

// const firstUser = await pool.query(`
//   INSERT INTO users (user_handle, first_name, last_name, email, password, role, is_Active, age, address, photo_url, phone_number) 
//   VALUES ('${user_handle}', '${first_name}','${last_name}', '${email}', '${password}', '${role}','${is_Active}','${age}','${address}','${photo_url}','${phone_number}' )
// `)

export default pool;