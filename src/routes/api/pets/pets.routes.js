import { Router } from "express"; // importar express
import { pets } from "../../../controllers/api/pets.ctr.js"; // importar objeto con los métodos de la API

const router = Router(); // inicializar router

router.get('/', pets.getAll)
router.get('/pet/:id', pets.get)
router.get('/pet/document/:doc', pets.getDocPet)
router.get('/search/:search', pets.search)
router.get('/category/:category', pets.filter)
router.get('/categories',pets.categories)
router.get('/documents',pets.documents)
export default router; // exportar router