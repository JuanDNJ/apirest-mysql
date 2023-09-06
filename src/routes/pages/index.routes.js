import { Router } from "express"; // importar express
// import pool from "../../db/pool.js" // importar pool de conexión a la base de datos
import {accountVerified} from "../../midlewares/index.js"
import authorizationRouter from "../authorization.routes.js";

const router = Router(); // inicializar router


router.get('/', async (req, res) => { // ruta inicial
    const data = {
        title: "Bienvenido!"
    }
    res.redirect("http://localhost:5173/")

})
router.get('/profile', accountVerified, async (req, res) => { // ruta inicial
   
    res.status(200).json({
        url: 'http://localhost:5174/profile',
        account: req.account
    })

})
router.use("/authorization", authorizationRouter)

// router.get('/about', async (req, res) => { // ruta inicial
//     const data = {
//         title: "About"
//     }
//     res.render("pages/about", data)

// })
// router.get('/contact', async (req, res) => { // ruta inicial
//     const data = {
//         title: "Conatct"
//     }
//     res.render("pages/contact", data)

// })
// router.get('/db-ping', async (req, res) => { // ruta para probar la conexión a la base de datos
//     const [ping] = await pool.query("SELECT 'PingPong' AS ping");
//     res.json({ message: ping[0] })
// })

export default router; // exportar router
