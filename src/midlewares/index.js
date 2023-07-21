export const page404 = ( req, res, next) => {
    return res.status(404).json({error: "Page Not found"})
}

export const page500 = (err, req, res, next) => {
    console.error(err.stack)
    return res.status(500).json({error: "500 - Internal server error"})
}