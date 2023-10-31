import { Router } from 'express';
// import { check  } from "express-validator"
import { apiCtr } from '../../controllers/index.controllers.js';
import { signinAuthValidationScheme } from '../../validators/index.js';

const { AuthentificationCtr } = apiCtr
const createRouter = (authMod) => {

    const authCtr = new AuthentificationCtr(authMod)
    const router = Router();

    router.post('/signin', signinAuthValidationScheme, authCtr.signin);
    router.post('/signup', authCtr.signup);
    router.post('/account', signinAuthValidationScheme,
        authCtr.getAccount); // endpoint de prueba
    return router
}

export default createRouter;
