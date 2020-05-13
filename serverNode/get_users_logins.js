require('babel-register');
const express = require('express');
const app = express();
var mysql = require('mysql');
const childProcess = require('child_process');

var con = mysql.createConnection({
  host: "localhost",
  user: "user",
  password: "test",
  database: "bdebody"
});

var tab_users_json;

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");

  var sql = "SELECT * from users_logins;";
  con.query(sql, function (err, result) {
    if (err) throw err;

    console.log("Tableau récupéré");
    tab_users_json = result;
  });
});

app.get('/logins/', (request, response) => {

response.json(tab_users_json);

console.log('Tableau logins envoyé au server');
});


app.listen(8080, () => console.log('démarrage de la restAPI'));