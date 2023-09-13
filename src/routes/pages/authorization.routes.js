import {Router} from 'express';
import {AuthorizationCtr} from '../../controllers/authorization.ctr.js';

const createRouter = (authMod) => {
 
    const authCtr = new AuthorizationCtr(authMod)
    const router = Router();
    
    router.post('/signin', authCtr.signin);
    router.post('/signup', authCtr.signup);

    return router
}

export default createRouter;