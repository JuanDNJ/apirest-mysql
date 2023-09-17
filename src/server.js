import app from "./app.js";
import { page404, page500 } from "./midlewares/index.js";

// Routes
import homeRoutes from "./routes/home.routes.js";
import { apiRoutes, soccerTeams, phoneBook, shelters, pets } from "./routes/index.routes.js"

// use routes
app.use(homeRoutes); // use homeRouter
app.use(apiRoutes);
app.use(soccerTeams);
app.use(phoneBook);
app.use(shelters);
app.use(pets);

// Error 404
app.use(page404); // use page404 (midleware para manejar errores 404)

app.use(page500); // use page500 (midleware para manejar errores 500)
