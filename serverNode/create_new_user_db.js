 
var mysql = require('mysql');

var conGlobale = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database : "bdebody"
});

var username;
var courriel;
var mdp;
var sql_createUserData = "CREATE TABLE userData (version INT AUTO_INCREMENT PRIMARY KEY, prenom varchar(255), nomFamille varchar(255), age tinyint(5), taille tinyint(255), poids tinyint(255))";
var sql_createTableEntrainements = "CREATE TABLE entrainements (id INT AUTO_INCREMENT PRIMARY KEY, nom varchar(255))";


conGlobale.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");

  /**
   * Ajout de l'utilisateur dans le tab des utilisateurs
   */
  conGlobale.query("INSERT INTO users_logins (nom, courriel, motdepasse) VALUES('"+username+"','"+courriel+"','"+mdp+"')", function (err, result) {
    if (err) throw err;
    console.log("Database created for " + username);
  });

  /**cree une base de donnee personnelle pour l'utilateur
   * format du nom de la database : username_db
*/
  conGlobale.query("CREATE DATABASE "+ username +"_db", function (err, result) {
    if (err) throw err;
    console.log("Database created for " + username);
  });

  /**
   * Donne acces à l'utilisateur à sa base de donnée personnelle
   */
  conGlobale.query("GRANT ALL ON "+username+"_db.* to '"+ username +"' identified by '" + mdp +"'", function (err, result) {
    if (err) throw err;
    console.log("Access granted to " + username);
  });
  conGlobale.query("flush privileges;", function (err, result) {
    if (err) throw err;
    console.log("privileges flushed");
  });
  
  
  /**
   * Creation des tableaux
   */
  conGlobale.query("USE " +username+"_db", function (err, result) {
    if (err) throw err;
    console.log("Using " +username+"_db");
  });
  
  conGlobale.query(sql_createTableEntrainements, function (err, result) {
    if (err) throw err;
    console.log("Tableau entrainements cree");
  });
  conGlobale.query(sql_createUserData, function (err, result) {
    if (err) throw err;
    console.log("Tableau données cree");
  });
  
  console.log("Terminé!");
  conGlobale.end;
});

