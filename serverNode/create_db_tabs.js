var mysql = require('mysql');

var con = mysql.createConnection({
  host: "localhost",
  user: "user",
  password: "test",
  database: "bdebody"
});



con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");

  var sqlUsersLogins = "CREATE TABLE users_logins (idUser INT AUTO_INCREMENT PRIMARY KEY,  courriel varchar(255), motdepasse varchar(30))";  
  var sqlUsersData = "CREATE TABLE users_data (idUser tinyint(255), nom varchar(255), age tinyint(5), taille smallint(255), poids double(10,2), genre varchar(255), dateModification varchar(255))";
  //jour : lundi, mardi, mercredi, jeudi, vendredi, samedi ou dimanche
  //heure : HH:MIN
  var sqlUsersEntrainements = "CREATE TABLE users_entrainements (idUser tinyint(255), nom varchar(255), jour varchar(255), heure varchar(255), intensite varchar(255), dispoJour varchar(255), dispoDebut varchar(255), dispoFin varchar(255))";
  var sqlUsersExercices = "CREATE TABLE users_exercices (idUser tinyint(255), entrainement varchar(255), nom varchar(255), duree smallint(255), repetitions smallint(255), description varchar(255) )";
  var sqlListeExercices = "CREATE TABLE liste_exercices (nom varchar(255), duree smallint(255), repetitions smallint(255), description varchar(255), intensite varchar(255))";
  
  //date : échéance de l'objectif smart
  var sqlUsersObjetifs = "CREATE TABLE users_objectifs (idUser tinyint(255), siObjectifPoids varchar(255), debutObjectif varchar(255), finObjectif varchar(255), poidsCible double(10,2), objectif varchar(255))";
  

  var sqlUsersDispos = "CREATE TABLE users_dispos (idUser tinyint(255), jour varchar(255), debut varchar(255), fin varchar(255), isUsed varchar(255))";

  /**
   * Crée un tableau pour les disponibilités des utilisateurs
   */
  con.query(sqlUsersDispos, function (err, result) {
    if (err) throw err;
    console.log("tableau users_dispos créé");
  });

  /**
   * Crée un tableau pour les objectifs des utilisateurs
   */
  con.query(sqlUsersObjetifs, function (err, result) {
    if (err) throw err;
    console.log("tableau users_objectifs créé");
  });
  
  /**
   * Crée un tableau pour les informations de connection des utilisateurs
   */
  con.query(sqlUsersLogins, function (err, result) {
    if (err) throw err;
    console.log("tableau users_logins créé");
  });
  /**
   * Crée un tableau pour les données d'utilisateur
   */
con.query(sqlUsersData, function (err, result) {
    if (err) throw err;
    console.log("tableau users_data créé");
  });
  /**
   * Crée un tableau pour les entrainements des utilisateurs
   */
  con.query(sqlUsersEntrainements, function (err, result) {
    if (err) throw err;
    console.log("tableau users_entrainements créé");
  });
  /**
   * Crée un tableau pour les exercices des entrainements des utilisateurs
   */
  con.query(sqlUsersExercices, function (err, result) {
    if (err) throw err;
    console.log("tableau users_exercices créé");
  });

  /**
   * Crée un tableau pour les exercices
   */
  con.query(sqlListeExercices, function (err, result) {
    if (err) throw err;
    console.log("tableau liste_exercices créé");
  });

});