import { PORT_SERVER } from "./config/index.js" // importar puerto desde config/index.js
import express from "express" // importar express 
import { createServer } from "node:http"
import { Server } from "socket.io"
import cors from "cors" // importar cors

const app = express() // inicializar express

const server = createServer(app);
const io = new Server(server);



const ACCEPTED_ORIGINS = [
    "http://localhost:5175",
    "http://localhost:5174",
    "http://localhost:5173",
    "http://localhost:5500"
];

const createOrigin = (origins = '') => {
    let accepetedOrigins = ACCEPTED_ORIGINS;
    if (origins && Array.isArray(origins)) {
        accepetedOrigins = origins
    }
    const origin = (origin, callback) => {
        if (accepetedOrigins.includes(origin)) return callback(null, true)
        if (!origin) return callback(null, true)
        return callback(new Error("Not allowed by CORS"))
    }
    return { origin }
}
app.use(cors()) //  habilitar CORS .
app.use(express.json()) // habilitar application/json
app.use(express.urlencoded({ extended: true })) // habilitar application/x-www-form-urlencoded
app.use(express.static("public")) // habilitar carpeta public

// Use view engine with express, (https://expressjs.com/es/guide/using-template-engines.html)
// app.set("views", "./src/views") // habilitar carpeta views
// app.set("view engine", "pug") // habilitar njv como motor de plantie

// Start server


server.listen(PORT_SERVER, () => {
    console.log(`Server is running on http://localhost:${PORT_SERVER}`) // mostrar mensaje en consola
});

export {
    app,
    io
}
