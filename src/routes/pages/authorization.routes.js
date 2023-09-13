import {Router} from 'express';
import {AuthorizationCtr} from '../../controllers/authorization.ctr.js';
import AuthorizationMod from '../../models/mysql/authorization.mod.js';

const authCtr = new AuthorizationCtr(new AuthorizationMod())
const router = Router();

router.post('/signin', authCtr.signin);
router.post('/signup', authCtr.signup);

export default router;