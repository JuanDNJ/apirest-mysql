import { checkSchema } from "express-validator";

export const signinAuthValidationScheme = checkSchema({
    email: {
        isEmail: {
            errorMessage: 'It has to be email type.'
        },
        notEmpty: {
            errorMessage: 'It cant be empty.'
        },
        trim: true,
        exists: true,

    },
    password: {
        exists: true,
        trim: true,
        notEmpty: {
            errorMessage: 'The field cannot be empty.'
        },
        isLength: {
            errorMessage: 'The password must be a minimum of 6 characters',
            options: {
                min: 6,
            }
        },

    }
})

export const idValidationScheme = checkSchema({
    id: {
        notEmpty: {
            errorMessage: 'It cant be empty.'
        },
        trim: true,
        exists: true
    }
})
