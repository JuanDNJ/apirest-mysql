import {Router} from 'express';
import {AuthorizationCtr} from '../../controllers/authorization.ctr.js';
// import { check  } from "express-validator"
import { schemaSignin } from '../../validators/index.js';

const createRouter = (authMod) => {

    const authCtr = new AuthorizationCtr(authMod)
    const router = Router();
    
    router.post('/signin', authCtr.signin);
    router.post('/signup', authCtr.signup);
    router.post('/account',schemaSignin,
    authCtr.getAccount);
    return router
}

export default createRouter;
