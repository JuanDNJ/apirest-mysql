import {PORT_SERVER} from "./config/index.js" // importar puerto desde config/index.js
import express from "express" // importar express 
import cors from "cors" // importar cors

const app = express() // inicializar express

app.use(cors()) //  habilitar CORS .
app.use(express.json()) // habilitar application/json
app.use(express.urlencoded({ extended: true })) // habilitar application/x-www-form-urlencoded
app.use(express.static("public")) // habilitar carpeta public
// Use view engine with express, (https://expressjs.com/es/guide/using-template-engines.html)
app.set("views", "./views") // habilitar carpeta views
app.set("view engine", "pug") // habilitar njv como motor de plantillas

// Routes
import homeRouter from "./routes/index.routes.js"
import usersRouter from "./routes/users.routes.js"
import petsRouter  from "./routes/pets.routes.js";
import refugiosRouter from "./routes/refugios.routes.js";
import bannersRoutes from "./routes/banners.routes.js";
import frontPageRouter from "./routes/front-page.routes.js";
import articlesRouter from "./routes/articles.routes.js";
import configRouter from "./routes/config.routes.js";
import categoriesRouter from "./routes/categories.routes.js";
import documentsPets from "./routes/documents-pets.routes.js";
import authorizationRouter from "./routes/authorization.routes.js";
import apiRouter from "./routes/api.routes.js";
import guiaTelefonicaRouter from './routes/guia-telefonica/contactos.routes.js'
import { page404, page500 } from "./midlewares/index.js"

// use routes
app.use(homeRouter) // use homeRouter
app.use(usersRouter) // use usersRouter
app.use(petsRouter) // use petsRouter
app.use(refugiosRouter) // use refugiosRouter
app.use(bannersRoutes) // use bannersRoutes
app.use(frontPageRouter) // use frontPageRouter
app.use(articlesRouter) // use articlesRouter
app.use(configRouter) // use configRouter 
app.use(categoriesRouter) // use categoriesRouter
app.use(documentsPets) // use documentsPets
app.use(authorizationRouter) // use authorizationRouter
app.use("/api", apiRouter)
app.use("/guia-telefonica", guiaTelefonicaRouter)
// Error 404
app.use(page404) // use page404 (midleware para manejar errores 404)

app.use(page500) // use page500 (midleware para manejar errores 500)
// Start server
app.listen(PORT_SERVER, () => {
    console.log(`Server is running on http://localhost:${PORT_SERVER}`) // mostrar mensaje en consola
})