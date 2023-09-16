import { Router } from "express";
import { guia } from "../../controllers/guia-telefonica/guia.ctr.js";

const router = Router();

router.get("/phoneBook", guia.get.all)
router.get("/phoneBook/contact/:id", guia.get.id)
router.get("/phoneBook/search-name/:nombre", guia.get.searchByName)
router.get("/phoneBook/search-phone/:telefono", guia.get.searchByPhone)
router.delete("/phoneBook/contact/:id", guia.delete.id)
router.post("/phoneBook", guia.post.create)
router.put("/phoneBook/contact/:id", guia.put.id)

export default router;
