import express from "express" // importar express 
import cors from "cors" // importar cors

const app = express() // inicializar express

const PORT = process.env.PORT || 3000; // 3000 es el puerto por defecto de express

app.use(cors()) //  habilitar CORS .
app.use(express.json()) // habilitar application/json
app.use(express.urlencoded({ extended: true })) // habilitar application/x-www-form-urlencoded
app.use(express.static("public")) // habilitar carpeta public
// Routes
import homeRouter from "./routes/index.routes.js"
import usersRouter from "./routes/users.routes.js"
// use routes
app.use(homeRouter) // use homeRouter
app.use(usersRouter) // use usersRouter

// Start server
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`) // mostrar mensaje en consola
})