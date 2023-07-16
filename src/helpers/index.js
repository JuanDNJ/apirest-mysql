export const helperValidateEmailAndPassword = (field, value) => {
    try {
        if (typeof value !== "string") return { message: "The field must be a string." } // si el campo no es un string, enviar error    
        if (value.length === 0) return { message: "The field cannot be empty." }// si el campo está vacío, enviar error   
        if (value.match(/\s/g)) return { message: "The field cannot contain spaces." }  // Si contiene spacios en blanco, enviar error
        switch (field) {
            case "email":
                if (!value.match(/[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-{2,4}]/g)) return { message: "The email is not valid." } // si el email no es válido, enviar error
                return { message: "The email is valid." } // si el email es válido, enviar respuesta
                break;
            case "password":
                if (value.length > 15) return { message: "The password cannot be longer than 15 characters." } // si la contraseña es mayor a 15 caracteres, enviar error
                if (value.length < 6) return { message: "The password cannot be less than 6 characters." }// si la contraseña es menor a 8 caracteres, enviar error
                if (value.match(/[^a-zA-Z0-9çÇ@€]/g)) return { message: "The password can only contain letters and numbers." } // si la contraseña contiene caracteres especiales, enviar error
                return { message: "The password is valid." } // si la contraseña es válida, enviar respuesta
                break;
            default:
                return { message: "The field is not valid." } // si el campo no es válido, enviar error
        }
    
    } catch (error) {
        return {
            message: error.message
        }
    }
}
