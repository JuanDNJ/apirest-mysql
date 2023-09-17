import { Router } from "express"; // importar express

const router = Router(); // inicializar router

router.get('/', async (req, res) => { // ruta inicial
    const data = {
        title: "Bienvenido!"
    }
    res.status(200).json({
        message: "Api server",
        url: 'http://localhost:5174/'
    })
    // res.redirect("http://apimysql/")

});

export default router; // exportar router
