/* eslint-disable spaced-comment */
const express = require('express')
const path = require('path')
const mysql = require('mysql')
const pages = require('../routes/pages')
const auth = require('../routes/auth')

const app = express()

const database = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'sistem_pmb'
})

database.connect((error) => {
    if (error) {
        console.log(error)
    } else {
        console.log('MySQL Telah terkoneksi')
    }
})

const publicDirectory = path.join(__dirname, '../public')
app.use(express.static(publicDirectory))

app.set('view engine', 'hbs')

app.use(express.urlencoded({ extended: false }))
app.use(express.json())

app.use('/', pages)
app.use('/auth', auth)

app.listen(2700, () => {
    console.log('Server telah berjalan pada port 2700. Untuk mengaksesnya, buka browser dan masuk ke alamat "localhost:2700"')
})
