import { Router } from "express"
import { validate } from "../controllers/validate.controller.js"
const router = Router()

// Podriamos implementar un midleware, 
// para todas las rutas que necesiten
// validar algun campo de un formulario.

router.get("/validate/field/:field/value/:value", validate)

export default router