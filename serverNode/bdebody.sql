-- MariaDB dump 10.17  Distrib 10.4.12-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bdebody
-- ------------------------------------------------------
-- Server version	10.4.12-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `liste_exercices`
--

DROP TABLE IF EXISTS `liste_exercices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liste_exercices` (
  `nom` varchar(255) DEFAULT NULL,
  `duree` smallint(255) DEFAULT NULL,
  `repetitions` smallint(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `intensite` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liste_exercices`
--

LOCK TABLES `liste_exercices` WRITE;
/*!40000 ALTER TABLE `liste_exercices` DISABLE KEYS */;
INSERT INTO `liste_exercices` VALUES ('Planche de haut en bas',0,10,'Torse','Intermediaire'),('Lever de genoux',20,0,'Torse','Etirement'),('Jumping jacks',30,0,'Torse','Debutant'),('Abdos debout',0,20,'Torse','Debutant'),('Escalade',0,20,'Torse','Debutant'),('Toucher les talons',0,16,'Torse','Debutant'),('Étirement Cobra',20,0,'Torse','Debutant'),('Abdominaux',0,8,'Torse','Debutant'),('Twist russe ',0,12,'Torse','Debutant'),('Hanches pont',0,15,'Torse','Debutant'),('Crunch de type vélo',0,10,'Torse','Debutant'),('Crunch à l\'envers',0,12,'Torse','Debutant'),('Étirement allongé avec torsion droite',20,0,'Torse','Etirement'),('Levé de jambe',0,12,'Torse','Debutant'),('Gainage latéral droit en T',0,3,'Torse','Debutant'),('Pont latéral droit',0,18,'Torse','Debutant'),('Pont latéral gauche',0,18,'Torse','Debutant'),('Planche sur la gauche',20,0,'Torse','Debutant'),('Planche sur la droite',20,0,'Torse','Debutant'),('Renforcement des abdos',0,12,'Torse','Debutant'),('Gainage latéral gauche en T',0,3,'Torse','Debutant'),('Coup de pied crunch',30,0,'Torse','Intermediaire'),('Crunch avec bras croises',0,15,'Torse','Intermediaire'),('Talons au ciel',0,8,'Torse','Intermediaire'),('Balancement des jambes allonge gauche',30,0,'Torse','Etirement'),('Abdos et frappes',0,16,'Torse','Intermediaire'),('Superman et nageur',0,12,'Torse','Intermediaire'),('Le cobra',30,0,'Torse','Etirement'),('Balencement des jambes allonge droite',30,0,'Torse','Etirement'),('Abduction de la jambe gauche',0,12,'Torse','Intermediaire'),('Abduction de la jambe droite',0,12,'Torse','Intermediaire'),('Torsion de la jambe',30,0,'Torse','Intermediaire'),('Abdominaux en V',0,10,'Torse','Intermediaire'),('Crunch avec les bras étendus',0,22,'Torse','Intermediaire'),('Redressement assis avec torsion',0,14,'Torse','Intermediaire'),('Crunch en V',0,10,'Torse','Avance'),('Battement des jambes',40,0,'Torse','Avance'),('Crunch X-man',0,15,'Torse','Avance'),('Rotation russe avec halteres',0,20,'Torse','Avance'),('Etirement allongé avec torsion droite',30,0,'Torse','Etirement'),('Etirement allongé avec torsion gauche ',30,0,'Torse','Avance'),('Crunch latéral gauche',0,15,'Torse','Avance'),('Posture de l\'enfant',0,20,'Torse','Avance'),('Crunch lateral droite',0,15,'Torse','Avance'),('Extension et ramené de jambes',30,0,'Torse','Avance'),('Flexion latéral gauche avec haltere',0,14,'Torse','Avance'),('Flexion latéral droite avec haltere',0,14,'Torse','Avance'),('Crunch avec les jambes relevées',0,16,'Torse','Avance'),('Pédalos avec haltère',0,20,'Torse','Avance'),('Crunchs avec haltères',0,15,'Torse','Avance'),('Abdos assis avec cercles dans le sens horaire',0,15,'Torse','Avance'),('Abdos assis avec cercles dans le sens anti-horaire',0,15,'Torse','Avance'),('Replis de torture avec haltère',0,26,'Torse','Avance'),('Passages de vélo avec haltère',0,18,'Torse','Avance'),('Etirement coudes en arrières',15,0,'Abs','Etirement'),('Etirement épaules crocodiles',0,8,'Abs','Etirement'),('Etirement crochets alternes',35,0,'Bras','Etirement'),('Crunch gauche toucher d\'orteils avec haltère',0,20,'Torse','Avance'),('Crunch droit toucher d\'orteils avec haltère',0,20,'Torse','Avance'),('Etirement du triceps gauche',30,0,'Bras','Etirement'),('Etirement du triceps droit',30,0,'Bras','Etirement'),('Etirement debout du biceps gauche',30,0,'Bras','Etirement'),('Etirement debout du biceps droit',30,0,'Bras','Etirement'),('Etirement coups de poing',0,10,'Bras','Etirement'),('Pompes alternees ',0,10,'Bras','Avance'),('Burpees ',0,10,'Bras','Intermediaire'),('Curls crunch bras gauche ',0,12,'Bras','Avance'),('Curls crunch bras droit ',0,12,'Bras','Avance'),('Dips au sol ',0,12,'Bras','Avance'),('Pompes sautées ',0,10,'Bras','Avance'),('Pompes avec touché d\'orteil',0,12,'Bras','Avance'),('Planche avec bras droits',35,0,'Bras','Avance'),('Marche en crabe',35,2,'Bras','Avance'),('Pompes',0,10,'Bras','Debutant'),('Crunch abdominal',0,10,'Torse','Debutant'),('Planche',30,0,'Torse','Intermediaire'),('Battements sur les côtes',0,20,'Jambes','Intermediaire'),('Fente avant',0,20,'Jambes','Intermediaire'),('Etirement coudes en arrieres',15,0,'Abs','Etirement'),('Etirement épaules crocodiles',0,8,'Abs','Etirement'),('Marche en crabe',30,0,'Abs','Etirement'),('Sauter sans corde',30,0,'Abs','Intermediaire'),('Squat Pistolet',0,20,'Jambes','Intermediaire'),('Saut en squat',0,20,'Jambes','Intermediaire'),('Extension des jambes',0,20,'Jambes','Intermediaire'),('Assouplissements',0,10,'Jambes','Etirement'),('Toucher d\'orteils',0,10,'Jambes','Etirement'),('Ciseaux de jambes',30,0,'Jambes','Intermediaire'),('Squat ',0,20,'Jambes','Intermediaire'),('Pédalage',30,0,'Jambes','Intermediaire');
/*!40000 ALTER TABLE `liste_exercices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_data`
--

DROP TABLE IF EXISTS `users_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_data` (
  `idUser` tinyint(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `age` tinyint(5) DEFAULT NULL,
  `taille` smallint(255) DEFAULT NULL,
  `poids` double(10,2) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `dateModification` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_data`
--

LOCK TABLES `users_data` WRITE;
/*!40000 ALTER TABLE `users_data` DISABLE KEYS */;
INSERT INTO `users_data` VALUES (11,'Karl Elie',5,185,70.00,'Femme','2020-05-07 21:55:38.859373'),(11,'Karl',5,185,70.00,'Femme','2020-05-07 21:56:15.226247'),(11,'Karl',5,185,70.00,'Femme','2020-05-07 21:56:27.852110'),(11,'Karl',5,160,70.00,'Femme','2020-05-07 21:56:40.441491'),(11,'Karl',5,160,20.00,'Femme','2020-05-07 21:56:52.443115'),(12,'Marc',20,182,58.00,'Male Alpha','2020-05-07 18:23:38.990194'),(13,'joukov',45,188,95.00,'Male Alpha','2020-05-07 18:31:29.465576'),(13,'joukov',45,188,95.00,'Male Alpha','2020-05-07 18:59:03.398033'),(13,'Jouko',45,188,95.00,'Male Alpha','2020-05-07 18:59:11.676732'),(13,'Joukov',45,188,95.00,'Male Alpha','2020-05-07 18:59:19.088552'),(13,'Joukov',45,188,95.00,'Male Alpha','2020-05-07 18:59:33.449290'),(10,'marc',17,160,60.00,'Homme','2020-05-07 19:32:12.353106'),(10,'marc',17,160,65.00,'Homme','2020-05-07 19:32:16.483541'),(10,'marc',17,160,70.00,'Homme','2020-05-07 19:32:20.142831'),(10,'marc',17,160,63.00,'Homme','2020-05-07 19:32:26.447508'),(10,'marc',17,160,90.00,'Homme','2020-05-07 19:33:31.903098'),(10,'marc',17,160,70.00,'Homme','2020-05-07 19:35:02.932729'),(10,'marc',17,160,70.00,'Homme','2020-05-07 19:35:26.214838'),(10,'marc',17,160,75.00,'Homme','2020-05-07 19:36:41.148084'),(10,'marc',17,160,1.00,'Homme','2020-05-07 19:36:59.732599'),(10,'marc',17,160,60.00,'Homme','2020-05-07 19:38:39.051073'),(10,'marc',17,160,45.00,'Homme','2020-05-07 19:39:34.147474'),(10,'Marc Antoine',17,160,45.00,'Homme','2020-05-08 13:31:19.669205'),(14,'Ann',49,167,75.00,'Femme','2020-05-09 23:17:41.164544'),(14,'Ann',49,167,74.00,'Femme','2020-05-09 23:21:03.734906'),(14,'Ann',49,167,75.00,'Femme','2020-05-09 23:21:31.437911'),(14,'Ann',49,167,75.00,'Femme','2020-05-09 23:21:41.621570'),(14,'Ann',49,167,80.00,'Femme','2020-05-09 23:21:57.812607'),(15,'K Boy',44,190,100.00,'Homme','2020-05-0'),(10,'Marc Antoine',17,160,67.00,'Homme','2020-05-0'),(10,'Marc Antoine',17,180,140.00,'Homme','2020-05-1');
/*!40000 ALTER TABLE `users_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_entrainements`
--

DROP TABLE IF EXISTS `users_entrainements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_entrainements` (
  `idUser` tinyint(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `jour` varchar(255) DEFAULT NULL,
  `heure` varchar(255) DEFAULT NULL,
  `intensite` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_entrainements`
--

LOCK TABLES `users_entrainements` WRITE;
/*!40000 ALTER TABLE `users_entrainements` DISABLE KEYS */;
INSERT INTO `users_entrainements` VALUES (12,'Torse avancé',NULL,NULL,NULL),(12,'Pompes',NULL,NULL,NULL),(13,'jambes avance',NULL,NULL,NULL),(10,'Torse intermédiaire',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users_entrainements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_exercices`
--

DROP TABLE IF EXISTS `users_exercices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_exercices` (
  `idUser` tinyint(255) DEFAULT NULL,
  `entrainement` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `duree` smallint(255) DEFAULT NULL,
  `repetitions` smallint(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_exercices`
--

LOCK TABLES `users_exercices` WRITE;
/*!40000 ALTER TABLE `users_exercices` DISABLE KEYS */;
INSERT INTO `users_exercices` VALUES (12,'Torse avancé','Pont latéral droit',0,27,'Torse'),(12,'Torse avancé','Replis de torture avec haltère',0,26,'Torse'),(12,'Torse avancé','Extension et ramené de jambes',30,0,'Torse'),(12,'Torse avancé','Planche de haut en bas',0,15,'Torse'),(12,'Torse avancé','Crunch lateral droite',0,15,'Torse'),(12,'Torse avancé','Crunch à l\'envers',0,18,'Torse'),(12,'Torse avancé','Pont latéral droit',0,27,'Torse'),(12,'Torse avancé','Replis de torture avec haltère',0,26,'Torse'),(12,'Torse avancé','Extension et ramené de jambes',30,0,'Torse'),(12,'Torse avancé','Planche de haut en bas',0,15,'Torse'),(12,'Torse avancé','Crunch lateral droite',0,15,'Torse'),(12,'Torse avancé','Crunch à l\'envers',0,18,'Torse'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(13,'jambes avance','Saut en squat',0,30,'Jambes'),(13,'jambes avance','Battements sur les côtes',0,30,'Jambes'),(13,'jambes avance','Squat Pistolet',0,30,'Jambes'),(13,'jambes avance','Fente avant',0,30,'Jambes'),(13,'jambes avance','Ciseaux de jambes',45,0,'Jambes'),(13,'jambes avance','Fente avant',0,30,'Jambes'),(13,'jambes avance','Saut en squat',0,30,'Jambes'),(13,'jambes avance','Battements sur les côtes',0,30,'Jambes'),(13,'jambes avance','Squat Pistolet',0,30,'Jambes'),(13,'jambes avance','Fente avant',0,30,'Jambes'),(13,'jambes avance','Ciseaux de jambes',45,0,'Jambes'),(13,'jambes avance','Fente avant',0,30,'Jambes'),(10,'Torse intermédiaire','Crunch à l\'envers',0,18,'Torse'),(10,'Torse intermédiaire','Gainage latéral gauche en T',0,4,'Torse'),(10,'Torse intermédiaire','Escalade',0,30,'Torse'),(10,'Torse intermédiaire','Crunch de type vélo',0,15,'Torse'),(10,'Torse intermédiaire','Abduction de la jambe droite',0,12,'Torse'),(10,'Torse intermédiaire','Crunch de type vélo',0,15,'Torse'),(10,'Torse intermédiaire','Crunch à l\'envers',0,18,'Torse'),(10,'Torse intermédiaire','Gainage latéral gauche en T',0,4,'Torse'),(10,'Torse intermédiaire','Escalade',0,30,'Torse'),(10,'Torse intermédiaire','Crunch de type vélo',0,15,'Torse'),(10,'Torse intermédiaire','Abduction de la jambe droite',0,12,'Torse'),(10,'Torse intermédiaire','Crunch de type vélo',0,15,'Torse');
/*!40000 ALTER TABLE `users_exercices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_logins`
--

DROP TABLE IF EXISTS `users_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_logins` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `courriel` varchar(255) DEFAULT NULL,
  `motdepasse` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_logins`
--

LOCK TABLES `users_logins` WRITE;
/*!40000 ALTER TABLE `users_logins` DISABLE KEYS */;
INSERT INTO `users_logins` VALUES (10,'marcantoinehien123@gmail.com','Tati$111'),(11,'karl@gmail.com','Tati$111'),(12,'marc@gmail.com','Tati$111'),(13,'hiensergeromain@gmail.com','Antoine001@'),(14,'tariniann@gmail.com','Marcantou123!'),(15,'k@k.com','Tati$111');
/*!40000 ALTER TABLE `users_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_objectifs`
--

DROP TABLE IF EXISTS `users_objectifs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_objectifs` (
  `idUser` tinyint(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `poidsCible` double(10,2) DEFAULT NULL,
  `objectif` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_objectifs`
--

LOCK TABLES `users_objectifs` WRITE;
/*!40000 ALTER TABLE `users_objectifs` DISABLE KEYS */;
INSERT INTO `users_objectifs` VALUES (6,'2-09-2020',70.00,'Atteidre 70 kg'),(9,'2020-07-07 00:00:00.000',100.00,'Monter jusqu\'a 100 KG'),(10,'2020-09-07 00:00:00.000',61.00,'Monter jusqu\'a 61 KG'),(11,'2021-05-07 00:00:00.000',80.00,'Monter jusqu\'a 80 KG'),(12,'2020-09-07 00:00:00.000',70.00,'Monter jusqu\'a 70 KG'),(13,'2020-10-07 00:00:00.000',90.00,'Descendre jusqu\'a 90 KG'),(14,'2020-06-14 00:00:00.000',61.00,'Descendre jusqu\'a 61 KG');
/*!40000 ALTER TABLE `users_objectifs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-12 15:23:22
