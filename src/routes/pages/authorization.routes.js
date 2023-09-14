import {Router} from 'express';
import {AuthorizationCtr} from '../../controllers/authorization.ctr.js';
import { check  } from "express-validator"
const createRouter = (authMod) => {
 
    const authCtr = new AuthorizationCtr(authMod)
    const router = Router();
    
    router.post('/signin', authCtr.signin);
    router.post('/signup', authCtr.signup);
    router.post('/account',check(['email','password'], "Los campos son requeridos").notEmpty().trim(),authCtr.getAccount);
    return router
}

export default createRouter;