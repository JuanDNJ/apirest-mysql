import {PORT_SERVER} from "./config/index.js" // importar puerto desde config/index.js
import express from "express" // importar express 
import cors from "cors" // importar cors

const app = express() // inicializar express

app.use(cors()) //  habilitar CORS .
app.use(express.json()) // habilitar application/json
app.use(express.urlencoded({ extended: true })) // habilitar application/x-www-form-urlencoded
app.use(express.static("public")) // habilitar carpeta public

// Use view engine with express, (https://expressjs.com/es/guide/using-template-engines.html)
app.set("views", "./src/views") // habilitar carpeta views
app.set("view engine", "pug") // habilitar njv como motor de plantie

// Start server
app.listen(PORT_SERVER, () => {
    console.log(`Server is running on http://localhost:${PORT_SERVER}`) // mostrar mensaje en consola
})

export default app
