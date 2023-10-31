import { Router } from "express";
import { phoneBookCtr } from "../../controllers/index.controllers.js"
const router = Router();

router.get("/phoneBook", phoneBookCtr.phones.get.all)
router.get("/phoneBook/contact/:id", phoneBookCtr.phones.get.id)
router.get("/phoneBook/search-name/:nombre", phoneBookCtr.phones.get.searchByName)
router.get("/phoneBook/search-phone/:telefono", phoneBookCtr.phones.get.searchByPhone)
router.delete("/phoneBook/contact/:id", phoneBookCtr.phones.delete.id)
router.post("/phoneBook", phoneBookCtr.phones.post.create)
router.put("/phoneBook/contact/:id", phoneBookCtr.phones.put.id)

export default router;
