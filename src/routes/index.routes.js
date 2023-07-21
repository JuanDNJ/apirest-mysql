import { Router } from "express"; // importar express
import pool from "../db/pool.js" // importar pool de conexión a la base de datos

const router = Router(); // inicializar router


router.get('/', async (req, res) => { // ruta inicial
    const data = {
        title: "Bienvenido, a esta API MySql"
    }
    res.render("pages/index", data)

})
router.get('/about', async (req, res) => { // ruta inicial
    const data = {
        title: "About"
    }
    res.render("pages/about", data)

})
router.get('/db-ping', async (req, res) => { // ruta para probar la conexión a la base de datos
    const [ping] = await pool.query("SELECT 'pong' AS ping");
    res.json({ message: ping[0] })
})

export default router; // exportar router