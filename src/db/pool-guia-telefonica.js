import { createPool } from "mysql2/promise";
import { DB_HOST, DB_USER, DB_PASSWORD, DB_NAME, DB_PORT } from "../config/index.js"


const guiaTelefonica = createPool({
    host: DB_HOST,
    user: DB_USER,
    password: DB_PASSWORD,
    database: 'guia_telefonica',
    port: DB_PORT,
    waitForConnections: true,
    connectionLimit: 10,
    maxIdle: 10, // max idle connections, the default value is the same as `connectionLimit`
    idleTimeout: 60000, // idle connections timeout, in milliseconds, the default value 60000
    queueLimit: 0,
    enableKeepAlive: true,
    keepAliveInitialDelay: 0
})

guiaTelefonica.getConnection(async (err, connection) => {
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
  
  export default guiaTelefonica