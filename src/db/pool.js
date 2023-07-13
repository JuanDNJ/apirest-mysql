import {config}  from "dotenv"
config()
import {createPool} from "mysql2/promise"
config()

const pool = createPool({
    host     : process.env.HOST,
    user     : process.env.USER,
    password : process.env.PASS,
    database : process.env.DB,
    port     : process.env.PORT_DATABSE,
  });
  
export default pool;