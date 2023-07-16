import { Router } from "express"

const router = Router()

// Podriamos implementar un midleware, 
// para todas las rutas que necesiten
// validar algun campo de un formulario.

router.get("/validate/field/:field/value/:value", (req, res) => {

    try {
        const { field, value } = req.params
        if(typeof value !== "string") return res.status(401).json({message: "The field must be a string."}) // si el campo no es un string, enviar error    
        if(value.length === 0) return res.status(401).json({message: "The field cannot be empty."}) // si el campo está vacío, enviar error   
        if(value.match(/\s/g)) return res.status(401).json({message: "The field cannot contain spaces."})  // Si contiene spacios en blanco, enviar error
        switch (field) {
            case "email":
                if(!value.match(/[\w-\.]{3,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-{2,4}]/g)) return res.status(401).json({message: "The email is not valid."}) // si el email no es válido, enviar error
                return res.status(200).json({message: "The email is valid."}) // si el email es válido, enviar respuesta
                break;
            case "password":
                if(value.length > 15) return res.status(401).json({message: "The password cannot be longer than 15 characters."}) // si la contraseña es mayor a 15 caracteres, enviar error
                if(value.length < 6) return res.status(401).json({message: "The password cannot be less than 6 characters."}) // si la contraseña es menor a 8 caracteres, enviar error
                if(value.match(/[^a-zA-Z0-9çÇ@€]/g)) return res.status(401).json({message: "The password can only contain letters and numbers."}) // si la contraseña contiene caracteres especiales, enviar error
                return res.status(200).json({message: "The password is valid."}) // si la contraseña es válida, enviar respuesta
                break;
            default:
                return res.status(401).json({message: "The field is not valid."}) // si el campo no es válido, enviar error
        }
     
    } catch (error) {
        res.status(500).json({
            message: error.message
        })
    }

   
})

export default router