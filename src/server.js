import app from "./app.js";
import { page404, page500 } from "./midlewares/index.js";

// Routes
import homeRouter from "./routes/index.routes.js";
import apiRouter from "./routes/api/index.routes.js";
import soccerTeams from "./routes/equipos-futbol/index.routes.js";
import phoneBook from "./routes/guia-telefonica/index.routes.js";
import shelters from "./routes/refugios/index.routes.js";
import pets from "./routes/pets/index.routes.js"

// use routes
app.use(homeRouter); // use homeRouter
app.use(apiRouter);
app.use(soccerTeams);
app.use(phoneBook);
app.use(shelters);
app.use(pets);

// Error 404
app.use(page404); // use page404 (midleware para manejar errores 404)

app.use(page500); // use page500 (midleware para manejar errores 500)
