import { handlerJwtVerify, emitError } from "../helpers/index.js"
export const page404 = (req, res, next) => {
    return res.status(404).json({ error: "Page Not found" })
}

export const page500 = (err, req, res, next) => {
    console.error(err.stack)
    return res.status(500).json({ error: "500 - Internal server error" })
}

export const accountVerified = async (req, res, next) => {
    try {
        const isToken = await handlerJwtVerify(req.token)
        if (isToken.name === 'JsonWebTokenError') return res.status(401).send({message: 'Unautorized '})
        req.isVerified = Boolean(isToken)
        req.account = isToken.sub 
        next()
    } catch (error) {
        res.json({
            error
        })
    }
}
export const getToken = async (req, res, next) => {
    try {
        const query = req.query
        const authorization = req.headers["authorization"]
        const token  = query.token || authorization.split(" ")[1]
        if(!token) throw new Error(`Not autorized¡`)
        req.token = token
        
        next()
    } catch (error) {
        throw new Error(error)
    }
}