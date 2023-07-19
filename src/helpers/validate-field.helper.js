 const validField = (field, value) => {
    try { // Utilizo try catch para capturar errores
         // si el campo no es un string, enviar error
        if (typeof value !== "string") return { message: `The field: ${field} must be a string.`, valid: false}    
        // si el campo está vacío, enviar error
        if (value.length === 0) return { message: `The field: ${field} cannot be empty.`, valid: false }  
        // Si contiene spacios en blanco, enviar error 
        if (value.match(/\s/g)) return { message: `The field: ${field} cannot contain spaces.` , valid: false}  
        // Utilozo switch para validar el campo (field) que recibo por parametro
        switch (field) {
            // si el campo es email
            case "email": 
                // si el email no es válido, enviar error
                if (!value.match(/[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-{2,4}]/g)) {
                    return { 
                        message: "The email is not valid." , 
                        valid: false} 
                }
                // si el email es válido, enviar respuesta
                return {
                    message: "The email is valid.", 
                    valid: true } 
                break;
            // si el campo es password
            case "password": 
                // si la contraseña es mayor a 15 caracteres, enviar error
                if (value.length > 15) {
                    return { 
                        message: "The password cannot be longer than 15 characters.", 
                        valid: false 
                    }
                }
                // si la contraseña es menor a 6 caracteres, enviar error 
                if (value.length < 6) {
                    return { 
                        message: "The password cannot be less than 6 characters.", 
                        valid: false 
                    }
                }
                // si la contraseña contiene caracteres especiales, enviar error
                if (value.match(/[^a-zA-Z0-9çÇ@€]/g)) {
                    return { 
                        message: "The password can only contain letters and numbers and characters(€, @, ç, Ç )." , 
                        valid: false
                    } 
                }
                // si la contraseña es válida, enviar respuesta
                return { message: "The password is valid." , valid: true } 
                break;
            // si el campo es user_handler
            case "user_handler": 
                // si el user handler es mayor a 20 caracteres, enviar error
                if (value.length > 20) {
                    return { 
                        message: "The user handler cannot be longer than 20 characters." , 
                        valid: false
                    }
                }
                // si el user handler es menor a 6 caracteres, enviar error
                if (value.length < 6) {
                    return { 
                        message: "The user handler cannot be less than 3 characters.", 
                        valid: false 
                    }
                }
                // si el user handler contiene caracteres especiales, enviar error 
                if(value.match(/[^a-zA-Z0-9çÇ@€]/g)) {
                    return { 
                        message: "The user handler can only contain letters and numbers and characters (€, @, ç, Ç )." , 
                        valid: false
                    }
                }
                // si el user handler es válido, enviar respuesta 
                return {
                     message: "The user handler is valid." , 
                     valid: true
                    } 
                break;
            // si el campo es edad (age)
            case "age": 
                // si la edad es menor a 18 años, enviar error
                if (value < 18) {
                    return { 
                        message: "You must be over 18 years old.", 
                        valid: false 
                    }
                }
                // si la edad es mayor a 100 años, enviar error 
                if (value > 100) {
                    return { 
                        message: "You must be under 100 years old.", 
                        valid: false 
                    }
                }
                // si la edad contiene caracteres especiales, enviar error
                if(value.match(/[^0-9]/g)) {
                    return {
                        message: "The age can only contain numbers.", 
                        valid: false 
                    }
                }
                // si la edad es válida, enviar respuesta 
                return {
                     message: "The age is valid." , 
                     valid: true
                } 
                break;
            // si el campo es fecha de nacimiento (birthday)
            case "birthday": 
                // si la fecha de nacimiento no es válida, enviar error
                if (!value.match(/^(0?[1-9]|[12][0-9]|3[01])[-](0?[1-9]|1[012])[-]\d{4}$/g)) {
                    return { 
                        message: "The birthday is not valid.", 
                        valid: false 
                    }
                } 
                // Creo un objeto Date con la fecha de nacimiento
                const date = new Date(value.split("-").reverse().join("-"))
                // Creo un objeto Date con la fecha actual 
                const today = new Date() 
                // Resto el año actual con el año de nacimiento
                const age = today.getFullYear() - date.getFullYear() 
                // si la edad es menor a 18 años, enviar error
                if (age < 18) {
                    return { 
                        message: "You must be over 18 years old." , 
                        valid: false
                    }
                }
                // si la fecha de nacimiento es válida, enviar respuesta 
                return { 
                    message: "The birthday is valid.", 
                    valid: true 
                } 
                break;
            default:
                // si el campo no es válido, enviar error
                return { 
                    message: "The field is not valid." 
                } 
        }
    
    } catch (error) {
        return {
            message: error.message // si ocurre un error, enviar error
        }
    }
}


export default validField