import {PORT_SERVER} from "./config/index.js" // importar puerto desde config/index.js
import express from "express" // importar express 
import cors from "cors" // importar cors

const app = express() // inicializar express

app.use(cors()) //  habilitar CORS .
app.use(express.json()) // habilitar application/json
app.use(express.urlencoded({ extended: true })) // habilitar application/x-www-form-urlencoded
app.use(express.static("public")) // habilitar carpeta public
// Routes
import homeRouter from "./routes/index.routes.js"
import usersRouter from "./routes/users.routes.js"
import petsRouter  from "./routes/pets.routes.js";
import bannersRoutes from "./routes/banners.routes.js";
import { page404 } from "./midlewares/index.js"
// use routes
app.use(homeRouter) // use homeRouter
app.use(usersRouter) // use usersRouter
app.use(petsRouter) // use petsRouter
app.use(bannersRoutes) // use bannersRoutes

// Error 404
app.use(page404) // use page404 (midleware para manejar errores 404)

// Start server
app.listen(PORT_SERVER, () => {
    console.log(`Server is running on http://localhost:${PORT_SERVER}`) // mostrar mensaje en consola
})