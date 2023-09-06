import { handlerJwtVerify, emitError} from "../helpers/index.js"
export const page404 = (req, res, next) => {
    return res.status(404).json({ error: "Page Not found" })
}

export const page500 = (err, req, res, next) => {
    console.error(err.stack)
    return res.status(500).json({ error: "500 - Internal server error" })
}

export const accountVerified = async (req, res, next) => {
    try {
        const token = req.headers["authorization"]
        const error = emitError({name: "authorization", message: 'Not authorized'})
        // error.message = "No autorizado"
        // error.stack = "401"
        // error.name = "Authorization Token"
        if(!token) throw error
        const verified = await handlerJwtVerify(token.split(" ")[1])
        if (verified.name === 'JsonWebTokenError') return res.status(401).send('Unautorized')
        req.account = verified
        next()
    } catch (error) {
        res.json({
            error
        })
    }
}