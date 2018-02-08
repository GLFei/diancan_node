var mysql = require ("mysql")

var pool = mysql.createPool({
    port:"3306",
    user:"root",
    password:"root",
    host:"localhost",
    database:"diancan",
    connectionLimit:10
})

module.exports = pool