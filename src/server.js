import app from "./app.js"
import { page404, page500 } from "./midlewares/index.js"

// Routes
import homeRouter from "./routes/pages/index.routes.js"

import apiRouter from "./routes/api/api.routes.js";

// use routes
app.use(homeRouter) // use homeRouter
app.use("/api", apiRouter)

// Error 404
app.use(page404) // use page404 (midleware para manejar errores 404)

app.use(page500) // use page500 (midleware para manejar errores 500)
