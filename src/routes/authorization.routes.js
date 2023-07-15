import {Router} from 'express';
import {authorization} from '../controllers/authorization.ctr.js';

const router = Router();

router.post('/login', authorization.login);
router.post('/register', authorization.register);

export default router;