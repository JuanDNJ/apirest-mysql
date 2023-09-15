import { checkSchema } from "express-validator";

export const signinAuthValidationScheme = checkSchema({
    email: {
        isEmail: {
            errorMessage: 'Tiene que ser de tipo email.'
        },
        notEmpty: {
            errorMessage: 'No puede estar vacio.'
        },
        trim: true,
        exists: true,

    },
    password: {
        exists: true,
        trim: true,
        notEmpty: {
            errorMessage: 'El campo no puede estar vacio.'
        },
        isLength: {
            errorMessage: 'La contraseña tiene que tener un minimo de 6 caracteres',
            options: {
                min: 6,
            }
        },

    }
})