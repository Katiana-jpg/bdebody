var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "user",
  password: "test",
  database: "bdebody"
});

var nom = "'Marc'";
var courriel = "'marc@gmail.com'";
var motdepasse = "'allo586'" ;



con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");

  var sql = "INSERT INTO users_logins (nom, courriel, motdepasse) VALUES ("+nom + ", "+courriel+", "+motdepasse+")";
  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("1 utilisateur créé");
  });
});