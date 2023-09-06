import {Router} from 'express';
import {authorization} from '../controllers/authorization.ctr.js';

const router = Router();

router.post('/signin', authorization.signin);
router.post('/signup', authorization.signup);

export default router;