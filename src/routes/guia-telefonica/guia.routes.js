import { Router } from "express";
import { guia } from "../../controllers/guia-telefonica/guia.ctr.js";

const router = Router();

router.get("/",guia.get.all)
router.get("/contacto/:id", guia.get.id)
router.get("/search-name/:nombre", guia.get.searchByName)
router.get("/search-phone/:telefono", guia.get.searchByPhone)
router.delete("/contacto/:id", guia.delete.id)
router.post("/", guia.post.create)
router.put ("/contacto/:id", guia.put.id)

export default router;
