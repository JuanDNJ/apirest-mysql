import {Router} from 'express';
import {AuthorizationCtr} from '../../controllers/authorization.ctr.js';
import { check  } from "express-validator"
const createRouter = (authMod) => {
 
    const authCtr = new AuthorizationCtr(authMod)
    const router = Router();
    
    router.post('/signin', authCtr.signin);
    router.post('/signup', authCtr.signup);
    router.post('/account',
    check(['email','password'],"fields empty").notEmpty().exists({chekFalsy: true}).trim(),
    check('password',"minim character 6").isLength({min: 6}),
    check('email',"No es un email valido").isEmail(),
    authCtr.getAccount);
    return router
}

export default createRouter;