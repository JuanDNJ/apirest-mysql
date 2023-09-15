import { Router } from 'express';
import { AuthentificationCtr } from '../../controllers/authentification.ctr.js';
// import { check  } from "express-validator"
import { schemaSignin } from '../../validators/index.js';

const createRouter = (authMod) => {

    const authCtr = new AuthentificationCtr(authMod)
    const router = Router();

    router.post('/signin', authCtr.signin);
    router.post('/signup', authCtr.signup);
    router.post('/account', schemaSignin,
        authCtr.getAccount);
    return router
}

export default createRouter;
