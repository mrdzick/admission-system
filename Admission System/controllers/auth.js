/*eslint-disable indent */
/* eslint-disable spaced-comment */
const mysql = require('mysql')

const database = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'sistem_pmb',
    multipleStatements: true
})

const register = (req, res) => {
    const {
        nisn,
        name,
        gender,
        cityOfBirth,
        dateOfBirth,
        province,
        city,
        district,
        addressDetail,
        postalCode,
        email,
        phoneNumber,
        fatherName,
        fatherJob,
        fatherEducation,
        motherName,
        motherJob,
        motherEducation,
        numberOfSiblings,
        income,
        npsn,
        prevSchool,
        educationLevel,
        dateIn,
        dateOut,
        grade,
        majors
    } = req.body

    database.query('SELECT nisn FROM calon_mahasiswa WHERE nisn = ?', [nisn], async(error, results) => {
        if (error) {
            console.log(error)
        }

        if (results.length > 0) {
            return res.render('register', {
                message: 'NISN sudah terdaftar!'
            })
        }
    })

    const query = `
        INSERT INTO calon_mahasiswa(nisn,
            nama,
            jenis_kelamin,
            tempat_lahir,
            tanggal_lahir,
            provinsi,
            kabupaten,
            kecamatan,
            alamat_detail,
            kode_pos,
            email,
            nomor_handphone, 
            nama_ayah,
            pekerjaan_ayah,
            pendidikan_terakhir_ayah,
            nama_ibu, 
            pekerjaan_ibu,
            pendidikan_terakhir_ibu,
            jumlah_saudara,
            penghasilan_bulanan) 
            VALUES('${nisn}',
                '${name}',
                '${gender}',
                '${cityOfBirth}',
                '${dateOfBirth}',
                '${province}',
                '${city}',
                '${district}',
                '${addressDetail}',
                '${postalCode}',
                '${email}',
                '${phoneNumber}',
                '${fatherName}',
                '${fatherJob}',
                '${fatherEducation}',
                '${motherName}',
                '${motherJob}',
                '${motherEducation}',
                '${numberOfSiblings}',
                '${income}');
        INSERT INTO sekolah_sebelumnya(
            npsn,
            nama_sekolah,
            jenjang
        ) VALUES (
            '${npsn}',
            '${prevSchool}',
            '${educationLevel}');
        INSERT INTO histori_akademik(
            nisn,
            npsn,
            tanggal_masuk,
            tanggal_lulus,
            nilai_akhir
        ) VALUES (
            '${nisn}',
            '${npsn}',
            '${dateIn}',
            '${dateOut}',
            '${grade}');
        INSERT INTO registrasi(
            nisn,
            kode_prodi
        ) VALUES (
            '${nisn}',
            '${(majors === 'Teknik Komputer') ? 'PROD01' : (majors === 'Teknik Mesin') ? 'PROD02' : 'PROD03'}');
        `

    database.query(query, async(error, results) => {
        if (error) {
            console.log(error)
        } else {
            return res.send(
                `<!DOCTYPE html>
                <html lang="en">
                <head>
                    <meta charset="UTF-8">
                    <meta http-equiv="X-UA-Compatible" content="IE=edge">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
                    <link rel="stylesheet" href="/style.css">
                    <title>Document</title>
                </head>
                <body>
                    <nav>
                        <h1>Sistem PMB</h1>
                        <ul>
                            <li><a href="/">Home</a></li>
                            <li><a href="/register">Register</a></li>
                        </ul>
                    </nav>
                
                    <div class="container mt-4">
                        <div class="jumbotron">
                            <h1 class="display-4">Horee....</h1>
                            <p class="lead">Pendaftaran Kamu sudah terkirim.</p>
                            <hr class="my-4">
                            <p>Informasi selanjutnya akan disampaikan lewat email / telepon.</p>
                        </div>
                    </div>
                
                    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
                </body>
                </html>`
            )
        }
    })
}

module.exports = { register }
