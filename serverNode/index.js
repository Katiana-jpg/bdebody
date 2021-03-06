require('babel-register');


/**
 * ExpressJS
 */
const express = require('express');

/**
 * Le server
 */
const app = express();
const nodeApiDocGenerator = require('node-api-doc-generator')
nodeApiDocGenerator(app,'localhost',8080)
/**
 * Permet la connection à une base de données mysql
 */
var mysql = require('mysql');
const childProcess = require('child_process');


/**
 * Crée la connection à la base de données
 * @param host 
 * @param user : user dans MariaDB 
 * @param password : mot de passe du user dans MariaDB 
 * @param database : nom de la base de donnée dans MariaDB 
 */
var connection = mysql.createConnection({
  host: "localhost",
  user: "user",
  password: "test",
  database: "bdebody"
});

/**
 * Tableau de données utilisateurs
 */
var tab_userdata;



var tab_users_json;
/**Connection à la base de données*/
connection.connect(function (err) {
  if (err) throw err;
  console.log("Connected!");
  
});

/**Parse URL-encoded bodies (as sent by HTML forms)*/
app.use(express.urlencoded());

/**Parse JSON bodies (as sent by API clients) */ 
app.use(express.json());

function selectIdUser(courriel, mdp) {

  var sqlSelectIdUser = "SELECT idUser FROM users_logins WHERE (courriel='" + courriel + "') AND (motdepasse ='" + mdp + "') limit 1";
  var _idUser = 1;

  //selection du idUser
  connection.query(sqlSelectIdUser, function (err, result) {
    if (err) {
      console.log('selection idUser failed');
      throw err;
    }
    console.log("result : " + result[0]['idUser']);
    var valeur = result[0]['idUser'];
    _idUser = valeur;
  })

  return _idUser;

}


/**
 * 
 * Récupère liste des etrainements de l'utilisateur 
 * */
app.post('/get-entrainements', (request, response) => {
/**
 * Courriel de l'utilisateur
 */
  var courriel = request.body.courriel;
  /**
 * Mot de passe de l'utilisateur
 */
  var mdp = request.body.password
/**
 * Commande SQL pour sélectionner le id User de l'utilisateur
 */
  var sqlSelectIdUser = "SELECT idUser FROM users_logins WHERE (courriel='" + courriel + "') AND (motdepasse ='" + mdp + "') limit 1";
  /**
 * idUser de l'utilisateur
 */
  var idUser = 0;
  connection.query(sqlSelectIdUser, function (err, result) {
    if (err) {
      console.log('selection idUser failed');
      throw err;
    }
    console.log("result : " + result[0]['idUser'])
    idUser = result[0]['idUser'];

    connection.query("SELECT * FROM users_entrainements WHERE (idUser = " + idUser + ");", function (err, result) {
      if (err) {
        console.log("Erreur dans la récupération des entrainements")
        throw err;
      } else {
        console.log("Tableau users_entrainements recupéré");
        console.log(idUser)
        console.log(result)
        tab_user_entrainements = result;

      }

      response.json(tab_user_entrainements);
    });
  })
});


/**
 * 
 * Récupère liste des exercices des entrainements de l'utilisateur 
 * */
app.post('/get-exercices', (request, response) => {
/**
 * Courriel de l'utilisateur
 */
  var courriel = request.body.courriel;
  /**
 * Mot de passe de l'utilisateur
 */
  var mdp = request.body.password
/**
 * idUser de l'utilisateur
 */
  var idUser = selectIdUser(courriel, mdp);


  connection.query("SELECT * FROM users_exercices WHERE (idUser = " + idUser + ");", function (err, result) {
    if (err) {
      console.log("Erreur dans la récupération des exercicess")
      throw err;
    } else {
      console.log("Tableau users_exercices recupéré");
      tab_user_exercices = result;

    }

    response.json(tab_user_exercices);
  });


});


/**
 * Ajoute un entrainement à un Utilisateur dans la base de données
 * 
 */
app.post('/add-entrainement', (request, response) => {
/**
 * Courriel de l'utilisateur
 */
  var courriel = request.body.courriel;
  /**
 * Mot de passe de l'utilisateur
 */
  var mdp = request.body.password
/**
 * Nom du nouvel entraînement
 */
  var nomEntrainement = request.body.nomEntrainement;
  /**
 * Jour du nouvel entraînement
 */
  var jour = request.body.jour;
  /**
 * Heure de début du nouvel entraînement
 */
  var debut = request.body.debut;
  /**
 * Heure de fin du nouvel entraînement
 */
  var fin = request.body.fin;


  /**
     * Sélectionne le idUser de l'utilisateur pour sélectionner les bonnes données de users_data
     */
  var sqlSelectIdUser = "SELECT idUser FROM users_logins WHERE (courriel='" + courriel + "') AND (motdepasse ='" + mdp + "') limit 1";
  connection.query(sqlSelectIdUser, function (err, result) {

    var idUser = 0;
    if (err) {
      console.log('selection idUser failed : courriel et mot de passe ne correspondent pas');
      response.json({ "connected": false })
      throw err;
    } else {

      console.log("connection de " + courriel + " successful !")

      idUser = result[0]['idUser'];

      //var sqlAddEntrainement = "INSERT INTO users_entrainements (idUser, nom) VALUES(" + idUser + ",'" + nomEntrainement + "')";

      connection.query('INSERT INTO users_entrainements (idUser, nom, dispoJour, dispoDebut, dispoFin) VALUES(' + idUser + ',"' + nomEntrainement + '","' + jour + '","' + debut + '","' + fin + '")', (err, result) => {
        if (err) {
          console.log("Erreur lors de l'insertion de l'entrainement à la base donnée")
          response.json({ "success": false })
          throw err;
        } else {
          console.log("Création de l'entrainement réussie !")
          response.json({ "success": true })
        }
      })
    }
  })
})

/**
 * Ajoute des exercices à un entrainement d'un Utilisateur dans la base de données
 * 
 */
app.post('/add-exercices-entrainement', (request, response) => {
/**
 * Courriel de l'utilisateur
 */
  var courriel = request.body.courriel;
  /**
 * Mot de passe de l'utilisateur
 */
  var mdp = request.body.password
 
  /**
   * Liste des exercices à ajouter dans la base de données
   */
  var liste_exercices_string = JSON.parse(request.body.liste_exercices);
 

  console.log(typeof liste_exercices_string);
  console.log("LIST EX STRING :" + liste_exercices_string);
  console.log("body : " + request.body)

  /**
   * Commande SQL pour trouver le idUser de l'utilisateur qui effectue le requête
   */
  var sqlSelectIdUser = "SELECT idUser FROM users_logins WHERE (courriel='" + courriel + "') AND (motdepasse ='" + mdp + "') limit 1";
  //var idUser = 1;

  //selection du idUser
  connection.query(sqlSelectIdUser, function (err, result) {
    if (err) {
      console.log('selection idUser failed');
      throw err;
    }
/**
 * idUser de l'utilisateur
 */
   var idUser = result[0]['idUser'];



    liste_exercices_string.forEach(element => {
      console.log('ok')
      var sqlAddExercice = 'INSERT INTO users_exercices (idUser, entrainement, nom, duree, repetitions, description) VALUES(' + idUser + ',"' + element.entrainement + '","' + element.nom + '",' + element.duree + ',' + element.repetitions + ',"' + element.description + '")';
      connection.query(sqlAddExercice, (err, result) => {
        if (err) {
          throw err;
        } else {
          console.log(result)
        }
      })
    })
    response.json(request.body)
  })
});

/**
 * Récupère les exercices de l'utilisateur
 * 
 */
app.post('/get-user-exercices/', (request, response) => {
/**
 * Courriel de l'utilisateur
 */
  var courriel = request.body.courriel;
  /**
 * Mot de passe de l'utilisateur
 */
  var mdp = request.body.password


  /**
   * Commande SQL pour trouver le idUser de l'utilisateur qui effectue le requête
   */
  var sqlSelectIdUser = "SELECT idUser FROM users_logins WHERE (courriel='" + courriel + "') AND (motdepasse ='" + mdp + "') limit 1";
  connection.query(sqlSelectIdUser, function (err, result) {

    var idUser = 0;
    if (err) {
      console.log('selection idUser failed : courriel et mot de passe ne correspondent pas');
      response.json({ "connected": false })
      throw err;
    } else {

      console.log("connection de " + courriel + " successful !")

      idUser = result[0]['idUser'];



      connection.query("SELECT * FROM users_exercices WHERE idUser= " + idUser, (err, result) => {
        if (err) {
          console.log("Erreur lors de la récupération des exercices de la base donnée")
          response.json({ "success": false })
          throw err;
        } else {
          console.log("Récupération des exercices réussie !")

          response.json(result)
        }
      })
    }
  })

})



/**
 * 
 * Connecte un utilisateur. 
 * Vérifie si le courriel et le mot de passe reçus corresppondent
 */

app.post('/login', (request, response) => {


  console.log('body');
  console.log(request.body);

/**
   * Courriel de l'utilisateur
   */
  var courriel = request.body.courriel;
  /**
   * Mot de passe de l'utilisateur
   */
  var mdp = request.body.password;

  console.log(request.body.courriel + " veut se connecter avec le mdp : " + request.body.password);


/**
   * Commande SQL pour trouver le idUser de l'utilisateur qui effectue le requête
   */
  var sqlSelectIdUser = "SELECT * FROM users_logins WHERE (courriel='" + courriel + "') AND (motdepasse ='" + mdp + "') limit 1";
  connection.query(sqlSelectIdUser, function (err, result) {
    if (err || (result[0] == null)) {
      console.log('selection idUser failed : courriel et mot de passe ne correspondent pas');
      response.json({ "connected": false })
      //throw err;

    } else {
      console.log("connection de " + courriel + " successful !")
      response.json({ "connected": true })
      console.log(result)
    }


  });

});



/**
 * Récupère les données de l'utilisateur
 */
app.post('/get-user-data', (request, response) => {


  console.log('body');
  console.log(request.body);
  /**
 * Courriel de l'utilisateur
 */
  var courriel = request.body.courriel;
  /**
   * Mot de passe de l'utilisateur
   */
  var mdp = request.body.password;
  /**
 * idUser de l'utilisateur
 */
  var idUser = 0;

  /**
   * Sélectionne le idUser de l'utilisateur pour sélectionner les bonnes données de users_data
   */
  var sqlSelectIdUser = "SELECT idUser FROM users_logins WHERE (courriel='" + courriel + "') AND (motdepasse ='" + mdp + "') limit 1";
  connection.query(sqlSelectIdUser, function (err, result) {
    if (err) {
      console.log('selection idUser failed : courriel et mot de passe ne correspondent pas');
      response.json({ "connected": false })
      throw err;
    } else {
      console.log("connection de " + courriel + " successful !")
      idUser = result[0]['idUser'];



      connection.query("SELECT nom, age, taille, poids, genre, dateModification FROM users_data WHERE idUser = " + idUser, function (err, result) {
        if (err) {
          console.log("erreur lors de la récupération du tableau")

          throw err;
        } else {
          console.log("Tableau userdata recupéré");
          tab_userdata = result;

          if (tab_userdata == null) {
            console.log("empty user data")

          } else {

            response.json((tab_userdata));

          }


        }

      })
    }
  });

});


/**
 * 
 * Crée un nouveau compte utilisateur
 */
app.post('/create-user', (request, response) => {

  console.log('body');
  console.log(request.body);


  /**
 * Courriel de l'utilisateur
 */
  var courriel = request.body.courriel;
  /**
 * Mot de passe de l'utilisateur
 */
  var password = request.body.password;


  /**
   * Ajout de l'utilisateur dans le tab des utilisateurs
   */
  connection.query("INSERT INTO users_logins (courriel, motdepasse) VALUES('" + courriel + "','" + password + "')", function (err, result) {
    if (err) throw err;
    console.log("Nouvel utilisateur créé avec le courriel suivant : " + courriel);
  });

  //response.json(request.body);
  response.json({
    "courriel": request.body.courriel,
    "password": request.body.password,
    "Connected": true
  })
  response.end();
});



/**
 * Met à jour les données de l'utilisateur (en rajoutat une nouvelle ligne dans le tableau de données)
 */

app.put('/update-user-data', (request, response) => {
/**
 * Nom de l'utilisateur
 */
  var nom = request.body.nom;
  /**
   * Mot de passe de l'utilisateur
   */
  var password = request.body.password;
  /**
 * Courriel de l'utilisateur
 */
  var courriel = request.body.courriel;
  /**
 * Age de l'utilisateur
 */
  var age = request.body.age;
  /**
 * Taille de l'utilisateur
 */
  var taille = request.body.taille;
  /**Poids de l'utilisateur */
  var poids = request.body.poids;
  /**Genre de l'utilisateur */
  var genre = request.body.genre;
  /**Date de modification des données (date où à été effectuée cette requête) */
  var dateModification = request.body.dateModification;
  /**idUser de l'utilisateur */
  var idUser;


  /**
   * Sélection le idUser de l'utilisateur pour l'ajouter dans la nouvelle ligne de user data 
   */
  var sqlSelectIdUser = "SELECT idUser FROM users_logins WHERE (courriel = '" + courriel + "') AND (motdepasse = '" + password + "') limit 1";

  connection.query(sqlSelectIdUser, function (err, result) {
    if (err) {
      console.log('selection idUser failed');
      throw err;
    }
    console.log("result : " + result[0]['idUser'])
    idUser = result[0]['idUser'];

    var sqlSelectData = "SELECT * FROM users_data WHERE idUser = " + idUser + " ORDER BY dateModification DESC LIMIT 1 "
    connection.query(sqlSelectData, (err, resultat) => {
      var modifieCeJour = false;
      if (err) throw err
      if (resultat[0] != undefined) {
        if (resultat[0]['dateModification'] == dateModification) {
          modifieCeJour = true;
          console.log("modifieCeJour=true")
        } else {
          modifieCeJour = false;
          console.log("modifieCeJour=false")
        }
      } else {
        modifieCeJour = false;
        console.log("modifieCeJour=false, première entré")
      }




      if (modifieCeJour == true) {
        /**
         * Modifie la dernière ligne de date de l'utilisateur si il a déjé modifiée ce jour-ci
         */
        var sqlDelete = "DELETE FROM users_data WHERE idUser = " + idUser + " and dateModification = '" + dateModification + "'";
        connection.query(sqlDelete, function (err, result) {
          if (err) {
            console.log('Suppression dernière données utilisateur failed');
            throw err;
          }
          console.log("req body : ")
          console.log(request.body)
          console.log(result)

        });
      }


      /**
         * Insert une nouvelle ligne de donnée utilisateur
         */
      var sqlInsert = "INSERT INTO users_data (idUser, nom, age, taille, poids, genre, dateModification) VALUES(" + idUser + ",'" + nom + "'," + age + "," + taille + "," + poids + ",'" + genre + "','" + dateModification + "')";
      connection.query(sqlInsert, function (err, result) {
        if (err) {
          console.log('insertion nouvelles données utilisateur failed');
          throw err;
        }
        console.log("req body : ")
        console.log(request.body)
        console.log(result)
        response.json({ "success": true })
      });
    })
  });

});

/**
 * Supprime un entraînementd dans la base de données
 */
app.post('/delete-entrainement', (request, response) => {

  /**
   * Mot de passe de l'utilisateur
   */
  var password = request.body.password;
  /**Courriel de l'utilisateur */
  var courriel = request.body.courriel;
  /**Nom de l'entraînement à supprimer */
  var nomEntrainement = request.body.nomEntrainement;
  /**
   * Sélection le idUser de l'utilisateur pour l'ajouter dans la nouvelle ligne de user data 
   */
  var sqlSelectIdUser = "SELECT idUser FROM users_logins WHERE (courriel = '" + courriel + "') AND (motdepasse = '" + password + "') limit 1";

  connection.query(sqlSelectIdUser, function (err, result) {
    if (err) {
      console.log('selection idUser failed');
      response.json({ "success": false })
      throw err;
    }
    console.log("result : " + result[0]['idUser'])
    idUser = result[0]['idUser'];



    /**
     * Supprime l'entrainement de la base de données
     */
    var sqlDeleteEntrainement = 'DELETE FROM users_entrainements WHERE idUser="' + idUser + '" AND nom="' + nomEntrainement + '"';
    var sqlDeleteExercices = 'DELETE FROM users_exercices WHERE idUser="' + idUser + '" AND entrainement="' + nomEntrainement + '"';
    connection.query(sqlDeleteEntrainement, function (err, result) {
      if (err) {
        console.log("Suppression de l'entrainement failed");
        response.json({ "success": false })
        throw err;
      }
      console.log("Suppression de l'entrainement réussie");
    });
    connection.query(sqlDeleteExercices, function (err, result) {
      if (err) {
        console.log("Suppression des exercices de l'entrainement failed");
        response.json({ "success": false })
        throw err;
      }
      console.log("Suppression des exercices de l'entrainement réussie");
      response.json({ "success": true })
    });
  });

});

/**
 * Envoie le tableau avec les exercices par défaut de l'application
 */
app.get('/get-liste-exercices', (request, response) => {
  ///Commande SQL pour récupéré tous les exercices de base de l'application
  var sqlGetListeExercices = "SELECT * FROM liste_exercices"

  connection.query(sqlGetListeExercices, (err, result) => {
    if (err) throw err;
    console.log('Tab listeExercices récupéré')
    response.json(result)
  });

});

/**
 * Récupère l'objectif de l'utilisateur
 */
app.post('/get-user-objectif', (request, response) => {


  console.log('body');
  console.log(request.body);
  /**Courriel de l'utilisateur */
  var courriel = request.body.courriel;
  /**
   * Mot de passe de l'utilisateur
   */
  var mdp = request.body.password;
  /**idUser de l'utilisateur */
  var idUser = 0;

  /**
   * Sélectionne le idUser de l'utilisateur pour sélectionner les bonnes données de users_objectifs
   */
  var sqlSelectIdUser = "SELECT idUser FROM users_logins WHERE (courriel='" + courriel + "') AND (motdepasse ='" + mdp + "') limit 1";
  connection.query(sqlSelectIdUser, function (err, result) {
    if (err) {
      console.log('Selection idUser failed : courriel et mot de passe ne correspondent pas');
      response.json({ "connected": false })
      throw err;
    } else {
      console.log("Connection de " + courriel + " successful !")
      idUser = result[0]['idUser'];



      connection.query("SELECT * FROM users_objectifs WHERE idUser = " + idUser + " limit 1", function (err, result) {
        if (err) {
          console.log("erreur lors de la récupération de l'objectif")

          throw err;
        } else {
          console.log("objectif récupéré recupéré");
          objectif = result[0];

          if (objectif == null) {
            console.log("L'utilisateur n'a pas d'objectif")
            response.send(404);
          } else {
console.log(objectif)
            response.json(objectif);

          }


        }

      })
    }
  });

});


/**
 * Création d'un objection pour un utilisateur
 */
app.post('/create-objectif', (request, response) => {

  console.log('Body :');
  console.log(request.body);
  /**Courriel de l'utilisateur */
  var courriel = request.body.courriel;
  /**
   * Mot de passe de l'utilisateur
   */
  var mdp = request.body.password;
  /**Date de fin de l'objectif */
  var finObjectif = request.body.finObjectif;
  /**Date de fin de l'objectif */
  var debutObjectif = request.body.debutObjectif;
  /**Poids cible de l'objectif */
  var poidsCible = request.body.poidsCible;
  /**Texte descriptif de l'objectif */
  var objectif = request.body.objectif;
  /**True si l'objectif est par rapport au poids */
  var siObjectifPoids =  request.body.siObjectifPoids;
  /**idUser de l'utilisateur */
  var idUser = 0;


  /**
   * Sélectionne le idUser de l'utilisateur pour sélectionner les bonnes données de users_objectifs
   */
  var sqlSelectIdUser = "SELECT idUser FROM users_logins WHERE (courriel='" + courriel + "') AND (motdepasse ='" + mdp + "') limit 1";
  connection.query(sqlSelectIdUser, function (err, result) {
    if (err) {
      console.log('Selection idUser failed : courriel et mot de passe ne correspondent pas');
      response.json({ "connected": false })
      throw err;
    } else {
      console.log("Connection de " + courriel + " successful !")
      idUser = result[0]['idUser'];
      var sqlDeleteAncienObjectif = "DELETE FROM users_objectifs WHERE idUser = " + idUser; 
connection.query(sqlDeleteAncienObjectif, (err, result) =>{
if (err){ throw err;}else{
  console.log("Ancien objectif supprimmé")
}

/**
 * Commande SQL pour ajouter le nouvel objectif de l'utilisateur dans la base de données
 */
      var sqlCreateObjectif = 'INSERT INTO users_objectifs (idUser, siObjectifPoids, debutObjectif, finObjectif, poidsCible, objectif) VALUES(' + idUser + ',"' +siObjectifPoids+ '","' + debutObjectif + '","' +finObjectif + '","'+ poidsCible + '","' + objectif + '")'
      connection.query(sqlCreateObjectif, function (err, result) {
        if (err) {
          console.log("erreur lors de la création de l'objectif")
          response.json({ "Success": false });
          throw err;
        } else {
          console.log("objectif créé");

          response.json({ "Success": true });

        }

      })})
    }
  });



});

/**
 * Gère la requête pour l'ajout de disponibilités d'unutilisateur
 */

 
app.post('/add-dispos', (request, response) => {
  console.log('body');
  console.log(request.body);
/**
   * Courriel de l'utilisateur
   */
  var courriel = request.body.courriel;
  /**
   * Mot de passe de l'utilisateur
   */
  var mdp = request.body.password;
 /**
  * idUser de l'utilisateur
  */
  var idUser = 0;
  /**
   * Liste des disponibilitées de l'utilisateur
   */
  var liste_dispos = JSON.parse(request.body.liste_dispos)


  /**
   * Sélectionne le idUser de l'utilisateur pour sélectionner les bonnes données de users_objectifs
   */
  var sqlSelectIdUser = "SELECT idUser FROM users_logins WHERE (courriel='" + courriel + "') AND (motdepasse ='" + mdp + "') limit 1";
  connection.query(sqlSelectIdUser, function (err, result) {
    if (err) {
      console.log('selection idUser failed : courriel et mot de passe ne correspondent pas');
      response.json({ "Connected": false })
      throw err;
    } else {
      console.log("Connection de " + courriel + " successful !")
      idUser = result[0]['idUser'];

     /**Commande SQL pour supprimer les disponibilités pour les remplacer par les nouvelles */ 
var sqlDeleteAnciennesDispos = "DELETE FROM users_dispos WHERE idUser = " + idUser;
      connection.query(sqlDeleteAnciennesDispos, (err, result)=>{
if (err) {throw err}else{console.log("Ancienne dispos supprimées")}
      })
      
      /**
       * Ajoute une à une les diponibilités
       */
      liste_dispos.forEach(element => {
        
        /**
         * Commande SQL pour ajouter les nouvelles disponibilités dans la base de données
         */
        var sqlAddDispos = 'INSERT INTO users_dispos (idUser, jour, debut, fin, isUsed) VALUES(' + idUser + ',"' + element.jour + '","' + element.debut + '","'+ element.fin + '","' + element.isUsed + '")';
        connection.query(sqlAddDispos, (err, result) => {
          if (err) {
            throw err;
          } else {
            console.log(result)
          }
        })
      })
    }
  });

  //Réponse du server
  response.json({ "Done": true })

})

/**
 * Récupère les diponibilités d'un tutilisateur
 */
app.post('/get-dispos', (request, response) => {

  console.log('body');
  console.log(request.body);

/**
   * Courriel de l'utilisateur
   */
  var courriel = request.body.courriel;
  /**
   * Mot de passe de l'utilisateur
   */
  var mdp = request.body.password;
  /**
   * idUser de l'utilisateur
   */
  var idUser = 0;

  /**
   * Sélectionne le idUser de l'utilisateur pour sélectionner les bonnes données de users_objectifs
   */
  var sqlSelectIdUser = "SELECT idUser FROM users_logins WHERE (courriel='" + courriel + "') AND (motdepasse ='" + mdp + "') limit 1";
  connection.query(sqlSelectIdUser, function (err, result) {
    if (err) {
      console.log('selection idUser failed : courriel et mot de passe ne correspondent pas');
      response.json({ "connected": false })
      throw err;
    } else {
      console.log("connection de " + courriel + " successful !")
      idUser = result[0]['idUser'];

      /**
       * Récupère les diponibilités de l,utilisateur dans la base de données
       */
      connection.query("SELECT * FROM users_dispos WHERE idUser = " + idUser, function (err, result) {
        if (err) {
          console.log("Erreur lors de la récupération des disponibilités")

          throw err;
        } else {
          console.log("Dispos récupérées")
          
          response.json(result);
        }

      })
    }
  });

})


app.listen(8080, () => console.log('Démarrage de la restAPI'));