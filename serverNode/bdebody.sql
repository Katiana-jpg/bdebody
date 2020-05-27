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
INSERT INTO `liste_exercices` VALUES ('Planche de haut en bas',0,10,'Torse','Intermediaire'),('Lever de genoux',20,0,'Torse','Etirement'),('Jumping jacks',30,0,'Torse','Debutant'),('Abdos debout',0,20,'Torse','Debutant'),('Escalade',0,20,'Torse','Debutant'),('Toucher les talons',0,16,'Torse','Debutant'),('Étirement Cobra',20,0,'Torse','Debutant'),('Abdominaux',0,8,'Torse','Debutant'),('Twist russe ',0,12,'Torse','Debutant'),('Hanches pont',0,15,'Torse','Debutant'),('Crunch de type vélo',0,10,'Torse','Debutant'),('Crunch à l\'envers',0,12,'Torse','Debutant'),('Etirement allongé avec torsion (gauche puis droite)',20,0,'Torse','Etirement'),('Levé de jambe',0,12,'Torse','Debutant'),('Pont latéral (gauche puis droite)',0,18,'Torse','Debutant'),('Planche sur le côté (gauche puis droite)',20,0,'Torse','Debutant'),('Renforcement des abdos',0,12,'Torse','Debutant'),('Gainage latéral en T (gauche puis droite)',0,3,'Torse','Debutant'),('Coup de pied crunch',30,0,'Torse','Intermediaire'),('Crunch avec bras croises',0,15,'Torse','Intermediaire'),('Talons au ciel',0,8,'Torse','Intermediaire'),('Balancement des jambes allonge gauche',30,0,'Torse','Etirement'),('Abdos et frappes',0,16,'Torse','Intermediaire'),('Superman et nageur',0,12,'Torse','Intermediaire'),('Le cobra',30,0,'Torse','Etirement'),('Balencement des jambes allonge droite',30,0,'Torse','Etirement'),('Abduction de la jambe (gauche puis droite)',0,12,'Torse','Intermediaire'),('Torsion de la jambe',30,0,'Torse','Intermediaire'),('Abdominaux en V',0,10,'Torse','Intermediaire'),('Crunch avec les bras étendus',0,22,'Torse','Intermediaire'),('Redressement assis avec torsion',0,14,'Torse','Intermediaire'),('Crunch en V',0,10,'Torse','Avance'),('Battement des jambes',40,0,'Torse','Avance'),('Crunch X-man',0,15,'Torse','Avance'),('Rotation russe avec halteres',0,20,'Torse','Avance'),('Etirement allongé avec torsion (gauche puis droite)',30,0,'Torse','Etirement'),('Crunch latéral gauche',0,15,'Torse','Avance'),('Posture de l\'enfant',0,20,'Torse','Avance'),('Crunch lateral droite',0,15,'Torse','Avance'),('Extension et ramené de jambes',30,0,'Torse','Avance'),('Flexion latéral avec haltere (gauche puis droite)',0,14,'Torse','Avance'),('Crunch avec les jambes relevées',0,16,'Torse','Avance'),('Pédalos avec haltère',0,20,'Torse','Avance'),('Crunchs avec haltères',0,15,'Torse','Avance'),('Abdos assis avec cercles dans le sens horaire',0,15,'Torse','Avance'),('Abdos assis avec cercles dans le sens anti-horaire',0,15,'Torse','Avance'),('Replis de torture avec haltère',0,26,'Torse','Avance'),('Passages de vélo avec haltère',0,18,'Torse','Avance'),('Etirement coudes en arrières',15,0,'Abs','Etirement'),('Etirement épaules crocodiles',0,8,'Abs','Etirement'),('Etirement crochets alternes',35,0,'Bras','Etirement'),('Crunch toucher d\'orteils avec haltère (gauche et droite)',0,40,'Torse','Avance'),('Etirement du triceps (gauche et droite)',30,0,'Bras','Etirement'),('Etirement des biceps (gauche et droite)',30,0,'Bras','Etirement'),('Etirement coups de poing',0,10,'Bras','Etirement'),('Pompes alternees ',0,10,'Bras','Avance'),('Burpees ',0,10,'Bras','Debutant'),('Curls crunch bras gauche ',0,12,'Bras','Avance'),('Curls crunch bras droit ',0,12,'Bras','Avance'),('Dips au sol ',0,12,'Bras','Debutant'),('Pompes sautées ',0,10,'Bras','Avance'),('Pompes avec touché d\'orteil',0,12,'Bras','Intermediaire'),('Planche avec bras droits',35,0,'Bras','Avance'),('Marche en crabe',35,0,'Bras','Intermediaire'),('Pompes',0,10,'Bras','Debutant'),('Crunch abdominal',0,10,'Torse','Debutant'),('Planche',30,0,'Torse','Intermediaire'),('Battements sur les côtes',0,20,'Jambes','Intermediaire'),('Fente avant',0,20,'Jambes','Intermediaire'),('Etirement coudes en arrieres',15,0,'Abs','Etirement'),('Etirement épaules crocodiles',0,8,'Abs','Etirement'),('Marche en crabe',30,0,'Abs','Intermediaire'),('Sauter sans corde',30,0,'Abs','Intermediaire'),('Squat Pistolet',0,20,'Jambes','Debutant'),('Saut en squat',0,20,'Jambes','Intermediaire'),('Extension des jambes',0,20,'Jambes','Debutant'),('Assouplissements',0,10,'Jambes','Etirement'),('Toucher d\'orteils',0,10,'Jambes','Etirement'),('Ciseaux de jambes',30,0,'Jambes','Intermediaire'),('Squat ',0,20,'Jambes','Debutant'),('Pédalage',30,0,'Jambes','Intermediaire');
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
INSERT INTO `users_data` VALUES (20,'Louis',16,180,100.00,'Homme','2020-05-13'),(22,'Abdoul',13,180,63.00,'Homme','2020-05-17'),(23,'Test2',16,170,60.00,'Femme','2020-05-19'),(24,'Caroline',19,150,60.00,'Femme','2020-05-20'),(25,'Alex',13,165,59.00,'Femme','2020-05-20'),(26,'Justin',21,180,60.00,'Homme','2020-05-20'),(27,'Serge',53,180,59.00,'Homme','2020-05-20'),(28,'Mami',29,170,50.00,'Homme','2020-05-18'),(28,'Mami',29,170,69.00,'Homme','2020-05-20'),(10,'Marc',16,180,69.00,'Homme','2020-05-20'),(30,'Tatiana',14,170,69.00,'Femme','2020-05-20'),(30,'Tati',14,170,69.00,'Femme','2020-05-27');
/*!40000 ALTER TABLE `users_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_dispos`
--

DROP TABLE IF EXISTS `users_dispos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_dispos` (
  `idUser` tinyint(255) DEFAULT NULL,
  `jour` varchar(255) DEFAULT NULL,
  `debut` varchar(255) DEFAULT NULL,
  `fin` varchar(255) DEFAULT NULL,
  `isUsed` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_dispos`
--

LOCK TABLES `users_dispos` WRITE;
/*!40000 ALTER TABLE `users_dispos` DISABLE KEYS */;
INSERT INTO `users_dispos` VALUES (30,'Vendredi','TimeOfDay(06:00)','TimeOfDay(09:00)','false'),(30,'Dimanche','TimeOfDay(00:00)','TimeOfDay(01:00)','false');
/*!40000 ALTER TABLE `users_dispos` ENABLE KEYS */;
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
  `intensite` varchar(255) DEFAULT NULL,
  `dispoJour` varchar(255) DEFAULT NULL,
  `dispoDebut` varchar(255) DEFAULT NULL,
  `dispoFin` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_entrainements`
--

LOCK TABLES `users_entrainements` WRITE;
/*!40000 ALTER TABLE `users_entrainements` DISABLE KEYS */;
INSERT INTO `users_entrainements` VALUES (20,'Jambes',NULL,NULL,NULL,'Mardi','TimeOfDay(22:00)','TimeOfDay(23:00)'),(28,'pompes',NULL,NULL,NULL,'Mercredi','TimeOfDay(01:00)','TimeOfDay(05:00)'),(28,'Torse intermédiaire',NULL,NULL,NULL,'Mercredi','TimeOfDay(01:00)','TimeOfDay(05:00)'),(28,'gg',NULL,NULL,NULL,'Mercredi','TimeOfDay(01:00)','TimeOfDay(05:00)'),(30,'ok',NULL,NULL,NULL,'Vendredi','TimeOfDay(06:00)','TimeOfDay(09:00)');
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
INSERT INTO `users_exercices` VALUES (12,'Torse avancé','Pont latéral droit',0,27,'Torse'),(12,'Torse avancé','Replis de torture avec haltère',0,26,'Torse'),(12,'Torse avancé','Extension et ramené de jambes',30,0,'Torse'),(12,'Torse avancé','Planche de haut en bas',0,15,'Torse'),(12,'Torse avancé','Crunch lateral droite',0,15,'Torse'),(12,'Torse avancé','Crunch à l\'envers',0,18,'Torse'),(12,'Torse avancé','Pont latéral droit',0,27,'Torse'),(12,'Torse avancé','Replis de torture avec haltère',0,26,'Torse'),(12,'Torse avancé','Extension et ramené de jambes',30,0,'Torse'),(12,'Torse avancé','Planche de haut en bas',0,15,'Torse'),(12,'Torse avancé','Crunch lateral droite',0,15,'Torse'),(12,'Torse avancé','Crunch à l\'envers',0,18,'Torse'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(12,'Pompes','Pompes',0,10,'Bras'),(13,'jambes avance','Saut en squat',0,30,'Jambes'),(13,'jambes avance','Battements sur les côtes',0,30,'Jambes'),(13,'jambes avance','Squat Pistolet',0,30,'Jambes'),(13,'jambes avance','Fente avant',0,30,'Jambes'),(13,'jambes avance','Ciseaux de jambes',45,0,'Jambes'),(13,'jambes avance','Fente avant',0,30,'Jambes'),(13,'jambes avance','Saut en squat',0,30,'Jambes'),(13,'jambes avance','Battements sur les côtes',0,30,'Jambes'),(13,'jambes avance','Squat Pistolet',0,30,'Jambes'),(13,'jambes avance','Fente avant',0,30,'Jambes'),(13,'jambes avance','Ciseaux de jambes',45,0,'Jambes'),(13,'jambes avance','Fente avant',0,30,'Jambes'),(10,'Torse intermédiaire','Crunch à l\'envers',0,18,'Torse'),(10,'Torse intermédiaire','Gainage latéral gauche en T',0,4,'Torse'),(10,'Torse intermédiaire','Escalade',0,30,'Torse'),(10,'Torse intermédiaire','Crunch de type vélo',0,15,'Torse'),(10,'Torse intermédiaire','Abduction de la jambe droite',0,12,'Torse'),(10,'Torse intermédiaire','Crunch de type vélo',0,15,'Torse'),(10,'Torse intermédiaire','Crunch à l\'envers',0,18,'Torse'),(10,'Torse intermédiaire','Gainage latéral gauche en T',0,4,'Torse'),(10,'Torse intermédiaire','Escalade',0,30,'Torse'),(10,'Torse intermédiaire','Crunch de type vélo',0,15,'Torse'),(10,'Torse intermédiaire','Abduction de la jambe droite',0,12,'Torse'),(10,'Torse intermédiaire','Crunch de type vélo',0,15,'Torse'),(10,'bras torse débutant','Renforcement des abdos',0,12,'Torse'),(10,'bras torse débutant','Abdominaux',0,8,'Torse'),(10,'bras torse débutant','Hanches pont',0,15,'Torse'),(10,'bras torse débutant','Escalade',0,20,'Torse'),(10,'bras torse débutant','Planche sur la droite',20,0,'Torse'),(10,'bras torse débutant','Pont latéral droit',0,18,'Torse'),(10,'bras torse débutant','Renforcement des abdos',0,12,'Torse'),(10,'bras torse débutant','Abdominaux',0,8,'Torse'),(10,'bras torse débutant','Hanches pont',0,15,'Torse'),(10,'bras torse débutant','Escalade',0,20,'Torse'),(10,'bras torse débutant','Planche sur la droite',20,0,'Torse'),(10,'bras torse débutant','Pont latéral droit',0,18,'Torse'),(19,'Torse intermédiaire','Planche sur la gauche',30,0,'Torse'),(19,'Torse intermédiaire','Planche',30,0,'Torse'),(19,'Torse intermédiaire','Redressement assis avec torsion',0,14,'Torse'),(19,'Torse intermédiaire','Planche sur la gauche',30,0,'Torse'),(19,'Torse intermédiaire','Superman et nageur',0,12,'Torse'),(19,'Torse intermédiaire','Twist russe ',0,18,'Torse'),(19,'Torse intermédiaire','Planche sur la gauche',30,0,'Torse'),(19,'Torse intermédiaire','Planche',30,0,'Torse'),(19,'Torse intermédiaire','Redressement assis avec torsion',0,14,'Torse'),(19,'Torse intermédiaire','Planche sur la gauche',30,0,'Torse'),(19,'Torse intermédiaire','Superman et nageur',0,12,'Torse'),(19,'Torse intermédiaire','Twist russe ',0,18,'Torse'),(20,'Jambes','Pédalage',45,0,'Jambes'),(20,'Jambes','Extension des jambes',0,30,'Jambes'),(20,'Jambes','Ciseaux de jambes',45,0,'Jambes'),(20,'Jambes','Squat ',0,30,'Jambes'),(20,'Jambes','Extension des jambes',0,30,'Jambes'),(20,'Jambes','Fente avant',0,30,'Jambes'),(20,'Jambes','Pédalage',45,0,'Jambes'),(20,'Jambes','Extension des jambes',0,30,'Jambes'),(20,'Jambes','Ciseaux de jambes',45,0,'Jambes'),(20,'Jambes','Squat ',0,30,'Jambes'),(20,'Jambes','Extension des jambes',0,30,'Jambes'),(20,'Jambes','Fente avant',0,30,'Jambes'),(28,'pompes','Pompes',0,10,'Bras'),(28,'pompes','Pompes',0,10,'Bras'),(28,'pompes','Pompes',0,10,'Bras'),(28,'pompes','Pompes',0,10,'Bras'),(28,'pompes','Pompes',0,10,'Bras'),(28,'pompes','Pompes',0,10,'Bras'),(28,'pompes','Pompes',0,10,'Bras'),(28,'pompes','Pompes',0,10,'Bras'),(28,'pompes','Pompes',0,10,'Bras'),(28,'pompes','Pompes',0,10,'Bras'),(28,'pompes','Pompes',0,10,'Bras'),(28,'pompes','Pompes',0,10,'Bras'),(28,'Torse intermédiaire','Étirement Cobra',30,0,'Torse'),(28,'Torse intermédiaire','Crunch de type vélo',0,15,'Torse'),(28,'Torse intermédiaire','Crunch de type vélo',0,15,'Torse'),(28,'Torse intermédiaire','Abduction de la jambe gauche',0,12,'Torse'),(28,'Torse intermédiaire','Torsion de la jambe',30,0,'Torse'),(28,'Torse intermédiaire','Abduction de la jambe gauche',0,12,'Torse'),(28,'Torse intermédiaire','Étirement Cobra',30,0,'Torse'),(28,'Torse intermédiaire','Crunch de type vélo',0,15,'Torse'),(28,'Torse intermédiaire','Crunch de type vélo',0,15,'Torse'),(28,'Torse intermédiaire','Abduction de la jambe gauche',0,12,'Torse'),(28,'Torse intermédiaire','Torsion de la jambe',30,0,'Torse'),(28,'Torse intermédiaire','Abduction de la jambe gauche',0,12,'Torse'),(28,'gg','Levé de jambe',0,18,'Torse'),(28,'gg','Abdominaux',0,12,'Torse'),(28,'gg','Planche de haut en bas',0,10,'Torse'),(28,'gg','Planche sur la droite',30,0,'Torse'),(28,'gg','Crunch à l\'envers',0,18,'Torse'),(28,'gg','Abduction de la jambe droite',0,12,'Torse'),(28,'gg','Levé de jambe',0,18,'Torse'),(28,'gg','Abdominaux',0,12,'Torse'),(28,'gg','Planche de haut en bas',0,10,'Torse'),(28,'gg','Planche sur la droite',30,0,'Torse'),(28,'gg','Crunch à l\'envers',0,18,'Torse'),(28,'gg','Abduction de la jambe droite',0,12,'Torse'),(30,'ok','Pompes',0,10,'Bras'),(30,'ok','Pompes',0,10,'Bras'),(30,'ok','Pompes',0,10,'Bras'),(30,'ok','Pompes',0,10,'Bras'),(30,'ok','Pompes',0,10,'Bras'),(30,'ok','Pompes',0,10,'Bras'),(30,'ok','Pompes',0,10,'Bras'),(30,'ok','Pompes',0,10,'Bras'),(30,'ok','Pompes',0,10,'Bras'),(30,'ok','Pompes',0,10,'Bras'),(30,'ok','Pompes',0,10,'Bras'),(30,'ok','Pompes',0,10,'Bras');
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_logins`
--

LOCK TABLES `users_logins` WRITE;
/*!40000 ALTER TABLE `users_logins` DISABLE KEYS */;
INSERT INTO `users_logins` VALUES (10,'marcantoinehien123@gmail.com','Tati$111'),(11,'karl@gmail.com','Tati$111'),(12,'marc@gmail.com','Tati$111'),(30,'tatiana@gmail.com','Tati$111');
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
  `siObjectifPoids` varchar(255) DEFAULT NULL,
  `debutObjectif` varchar(255) DEFAULT NULL,
  `finObjectif` varchar(255) DEFAULT NULL,
  `poidsCible` double(10,2) DEFAULT NULL,
  `objectif` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_objectifs`
--

LOCK TABLES `users_objectifs` WRITE;
/*!40000 ALTER TABLE `users_objectifs` DISABLE KEYS */;
INSERT INTO `users_objectifs` VALUES (30,'false','2020-05-27 09:35:04.050836','2020-10-27 00:00:00.000',0.00,'grandir');
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

-- Dump completed on 2020-05-27 11:49:35
