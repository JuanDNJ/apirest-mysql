import { Router } from "express";
import { petsCtr } from "../../controllers/index.controllers.js";

const router = Router();

router.get('/', petsCtr.vets.all);
router.get('/:idVet', petsCtr.vets.get);
router.post('/', petsCtr.vets.create);
router.delete('/:idVet', petsCtr.vets.delete);
router.put('/:idVet', petsCtr.vets.update);
router.put('/:idVet/name', petsCtr.vets.updateName);
router.put('/:idVet/photoUrl', petsCtr.vets.updatePhotoUrl);
router.put('/:idVet/description', petsCtr.vets.updateDescription);
export default router;