import express from "express"
import dotenv  from "dotenv"
import cors from "cors"
dotenv.config()


const app = express()

const PORT = process.env.PORT || 3000;

app.use(cors())
app.use(express.json()) // for parsing application/json
app.use(express.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded

app.get('/', (req, res) => {
    res.json({ message: 'Hello World' })
})

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`)
})