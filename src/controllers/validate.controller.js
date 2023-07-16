export const validate = (req, res) => {

    try {
        const { field, value } = req.params
        if(typeof value !== "string") return res.status(401).json({message: "The field must be a string."}) // si el campo no es un string, enviar error    
        if(value.length === 0) return res.status(401).json({message: "The field cannot be empty."}) // si el campo está vacío, enviar error   
        if(value.match(/\s/g)) return res.status(401).json({message: "The field cannot contain spaces."})  // Si contiene spacios en blanco, enviar error
        switch (field) {
            case "email": // si el campo es email
            if (!value.match(/[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-{2,4}]/g)) return res.status(401).json({ message: "The email is not valid." }) // si el email no es válido, enviar error
            return { message: "The email is valid." } // si el email es válido, enviar respuesta
            break;
        case "password": // si el campo es password
            if (value.length > 15) return res.status(401).json({ message: "The password cannot be longer than 15 characters." }) // si la contraseña es mayor a 15 caracteres, enviar error
            if (value.length < 6) return res.status(401).json({ message: "The password cannot be less than 6 characters." })// si la contraseña es menor a 8 caracteres, enviar error
            if (value.match(/[^a-zA-Z0-9çÇ@€]/g)) return res.status(401).json({ message: "The password can only contain letters and numbers and characters(€, @, ç, Ç )." }) // si la contraseña contiene caracteres especiales, enviar error
            return res.status(200).json({ message: "The password is valid." }) // si la contraseña es válida, enviar respuesta
            break;
        case "user_handler": // si el campo es user_handler
            if (value.length > 20) return res.status(401).json({ message: "The user handler cannot be longer than 20 characters." }) // si el user handler es mayor a 15 caracteres, enviar error
            if (value.length < 6) return res.status(401).json({ message: "The user handler cannot be less than 3 characters." }) // si el user handler es menor a 8 caracteres, enviar error
            if(value.match(/[^a-zA-Z0-9çÇ@€]/g)) return res.status(401).json({ message: "The user handler can only contain letters and numbers and characters (€, @, ç, Ç )." }) // si el user handler contiene caracteres especiales, enviar error
            return res.status(200).json({ message: "The user handler is valid." }) // si el user handler es válido, enviar respuesta
            break;
        case "age": // si el campo es edad (age)
            if (value < 18) return res.status(401).json({ message: "You must be over 18 years old." }) // si la edad es menor a 18 años, enviar error
            if (value > 120) return res.status(401).json({ message: "You must be under 120 years old." }) // si la edad es mayor a 100 años, enviar error
            if(value.match(/[^0-9]/g)) return res.status(401).json({ message: "The age can only contain numbers." }) // si la edad contiene caracteres especiales, enviar error
            return res.status(200).json({ message: "The age is valid." }) // si la edad es válida, enviar respuesta
            break;
        case "birthday": // si el campo es fecha de nacimiento (birthday)
            if (!value.match(/^(0?[1-9]|[12][0-9]|3[01])[-](0?[1-9]|1[012])[-]\d{4}$/g)) return res.status(401).json({ message: "The birthday is not valid." }) // si la fecha de nacimiento no es válida, enviar error
            // Comprobar si es menor de 18 años
            const date = new Date(value.split("-").reverse().join("-") || value.split("/").reverse().join("/")) // Creo un objeto Date con la fecha de nacimiento
            const today = new Date() // Creo un objeto Date con la fecha actual
            const age = today.getFullYear() - date.getFullYear() // Resto el año actual con el año de nacimiento
            if (age < 18) return res.status(401).json({ message: "You must be over 18 years old." }) // si la edad es menor a 18 años, enviar error
            return res.status(200).json({ message: "The birthday is valid." })  // si la fecha de nacimiento es válida, enviar respuesta
            break;
        case "phone": // si el campo es teléfono (phone)
            if (!value.match(/^[0-9]{9}$/g)) return res.status(401).json({ message: "The phone is not valid." }) // si el teléfono no es válido, enviar error
            return res.status(200).json({ message: "The phone is valid." }) // si el teléfono es válido, enviar respuesta
            break;
        case "is_active": // si el campo es is_active
            let is_Active = false
            if(!value.length) return res.status(401).json({message: "The field cannot be empty."}) // si el campo está vacío, enviar error   
            if(value.length > 1) return res.status(401).json({message: "The field must be a boolean."} ) // si el campo es mayor a 1 caracter, enviar error
            if(value.length < 1) return res.status(401).json({message: "The field cannot be empty."}) // si el campo está vacío, enviar error
            if(value.match(/\s/g)) return res.status(401).json({message: "The field cannot contain spaces."}) // si el campo contiene espacios en blanco, enviar error
            if (value !== "1" && value !== "0") return res.status(401).json({ message: "The field is_active must be true or false." }) // si el campo no es true o false, enviar error
            if(value === "1") is_Active = true
            return res.status(200).json({ message: `The field is_active: ${is_Active}; is valid.` }) // si el campo es válido, enviar respuesta
            break;
        default:
            return res.status(500).json({ message: "The field is not valid." }) // si el campo no es válido, enviar error
        }
     
    } catch (error) {
        res.status(500).json({
            message: error.message
        })
    }

   
}