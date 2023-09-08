import { createPool } from "mysql2/promise";
import { DB_HOST, DB_USER, DB_PASSWORD, DB_PORT } from "../config/index.js"
import { newUID, handlerHashString, handlerJwtSign, handlerJwtPayload} from "../helpers/index.js";


const db = (dbName) => {
    const pool = createPool({
        host: DB_HOST,
        user: DB_USER,
        password: DB_PASSWORD,
        database: dbName,
        port: DB_PORT,
        waitForConnections: true,
        connectionLimit: 10,
        maxIdle: 10, // max idle connections, the default value is the same as `connectionLimit`
        idleTimeout: 60000, // idle connections timeout, in milliseconds, the default value 60000
        queueLimit: 0,
        enableKeepAlive: true,
        keepAliveInitialDelay: 0
    })
   
    return pool.getConnection( (err, connection) => {
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
}

const api = await db("api");
const query = await api.query("SELECT COUNT(email) AS emails FROM account")
const first_Account = query[0];

if(first_Account[0].emails === 0){
    const id = newUID();
    const adminApi = { 
        id: id,
        name:"Juan Antonio",
        password: await handlerHashString("Admin@2023"),
        email: "juandevnjv@gmail.com", 
    }
    const token = await handlerJwtSign(handlerJwtPayload({id: id, rol:"admin", name: adminApi.name, email: adminApi.email}))
    console.log(adminApi, token)
    const insert = await api.query(`
        INSERT INTO account (id, name, password, email, token)
        VALUES ('${adminApi.id}','${adminApi.name}','${adminApi.password}','${adminApi.email}','${token}')
    `)
}

export {
    db
}