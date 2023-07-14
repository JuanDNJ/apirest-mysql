export const page404 = (req, res, next) => {
    return res.status(404).json({error: "Page Not found"})
}