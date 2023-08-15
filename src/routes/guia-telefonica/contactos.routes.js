import { Router } from "express";
import { contactos } from "../../controllers/guia-telefonica/contactos.ctr.js";
const router = Router();

router.get("/contactos",contactos.getAll)
router.get("/contactos/contacto/:id", contactos.get)
router.get("/contactos/search-name/:nombre", contactos.searchByName)
router.get("/contactos/search-phone/:telefono", contactos.searchByPhone)
router.delete("/contactos/contacto/:id", contactos.remove)
router.post("/contactos/", contactos.create)
router.put ("/contactos/contacto/:id", contactos.edit)

export default router;