-- --------------------------------------------------------
-- Host:                         192.168.232.132
-- Server version:               8.0.22-0ubuntu0.20.04.2 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for projetpoo
CREATE DATABASE IF NOT EXISTS `projetpoo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `projetpoo`;

-- Dumping structure for table projetpoo.ADRESSES
CREATE TABLE IF NOT EXISTS `ADRESSES` (
  `IDADR` int NOT NULL AUTO_INCREMENT,
  `NUM_ET_RUE` varchar(51) NOT NULL,
  `VILLE` varchar(51) NOT NULL,
  `CP` varchar(5) NOT NULL,
  PRIMARY KEY (`IDADR`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table projetpoo.ADRESSES: ~5 rows (approximately)
/*!40000 ALTER TABLE `ADRESSES` DISABLE KEYS */;
INSERT INTO `ADRESSES` (`IDADR`, `NUM_ET_RUE`, `VILLE`, `CP`) VALUES
	(1, '8 Rue du 23 Aout 1944', 'GRAVIGNY', '27930'),
	(2, '31 Rue du Marechal de Lattre de Tassigny', 'Mont Saint Aignan', '76130'),
	(3, '2 Rue Jean-Philippe Rameau', 'Notre-Dame-de-Gravenchon', '76330'),
	(4, '30 Rue Julian Grimau', 'Saint-Etienne du Rouvray', '76800'),
	(5, '6 Clos des Pommiers', 'Mesnil Raoul', '76520');
/*!40000 ALTER TABLE `ADRESSES` ENABLE KEYS */;

-- Dumping structure for table projetpoo.ARTICLE
CREATE TABLE IF NOT EXISTS `ARTICLE` (
  `ARTREF` int NOT NULL AUTO_INCREMENT,
  `IDNATURE` int NOT NULL,
  `IDCOULEUR` int NOT NULL,
  `DESIGNATION` varchar(51) NOT NULL,
  `QUANTDISPO` int NOT NULL,
  `SEUILAPPRO` int NOT NULL,
  `PRIXACHAT` float NOT NULL DEFAULT '0',
  `PRIXHT` float NOT NULL,
  `TVA` int NOT NULL,
  PRIMARY KEY (`ARTREF`),
  KEY `FK_EST_DE_COULEUR` (`IDCOULEUR`),
  KEY `FK_EST_DE_NATURE` (`IDNATURE`),
  CONSTRAINT `FK_EST_DE_COULEUR` FOREIGN KEY (`IDCOULEUR`) REFERENCES `COULEUR` (`IDCOULEUR`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_EST_DE_NATURE` FOREIGN KEY (`IDNATURE`) REFERENCES `NATURE` (`IDNATURE`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table projetpoo.ARTICLE: ~3 rows (approximately)
/*!40000 ALTER TABLE `ARTICLE` DISABLE KEYS */;
INSERT INTO `ARTICLE` (`ARTREF`, `IDNATURE`, `IDCOULEUR`, `DESIGNATION`, `QUANTDISPO`, `SEUILAPPRO`, `PRIXACHAT`, `PRIXHT`, `TVA`) VALUES
	(1, 1, 1, 'resistance rouge 20 ohm', 437, 50, 0.5, 1, 20),
	(2, 2, 2, 'condensateur vert', 450, 30, 0.5, 1.5, 20),
	(3, 3, 3, 'capteur de temperature bleu', 471, 15, 2, 10, 20),
	(4, 2, 3, 'Condensateur bleu indigo', 20, 35, 2, 4, 20),
	(5, 4, 4, 'LED jaune', 455, 100, 3, 5, 20),
	(6, 5, 10, 'transistor gris', 600, 75, 2, 3.5, 20),
	(7, 6, 9, 'arduino UNO violet', 109, 15, 9, 21, 20),
	(8, 7, 6, 'fil blanc', 1989, 200, 0.1, 0.75, 20),
	(9, 8, 5, 'switch noir', 1294, 120, 0.3, 1, 20),
	(10, 9, 5, 'bouton noir', 1383, 120, 0.3, 1, 20),
	(11, 10, 2, 'GPS vert', 387, 50, 4, 10, 20),
	(12, 11, 1, 'buzzer rouge', 1054, 100, 3, 8, 20),
	(13, 4, 7, 'LED marron', 999, 120, 3, 5, 20);
/*!40000 ALTER TABLE `ARTICLE` ENABLE KEYS */;

-- Dumping structure for table projetpoo.A_PAYE_A
CREATE TABLE IF NOT EXISTS `A_PAYE_A` (
  `NUMCLIENT` int NOT NULL,
  `IDADR` int NOT NULL,
  PRIMARY KEY (`NUMCLIENT`,`IDADR`),
  KEY `FK_A_PAYE_A2` (`IDADR`),
  CONSTRAINT `FK_A_PAYE_A` FOREIGN KEY (`NUMCLIENT`) REFERENCES `CLIENT` (`NUMCLIENT`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_A_PAYE_A2` FOREIGN KEY (`IDADR`) REFERENCES `ADRESSES` (`IDADR`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table projetpoo.A_PAYE_A: ~2 rows (approximately)
/*!40000 ALTER TABLE `A_PAYE_A` DISABLE KEYS */;
INSERT INTO `A_PAYE_A` (`NUMCLIENT`, `IDADR`) VALUES
	(3, 1),
	(1, 3),
	(2, 5);
/*!40000 ALTER TABLE `A_PAYE_A` ENABLE KEYS */;

-- Dumping structure for table projetpoo.CLIENT
CREATE TABLE IF NOT EXISTS `CLIENT` (
  `NUMCLIENT` int NOT NULL AUTO_INCREMENT,
  `NOM` varchar(51) NOT NULL,
  `PRENOM` varchar(51) NOT NULL,
  `BIRTHDATE` date NOT NULL,
  `FIRSTCOMMANDE` date DEFAULT NULL,
  PRIMARY KEY (`NUMCLIENT`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table projetpoo.CLIENT: ~3 rows (approximately)
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` (`NUMCLIENT`, `NOM`, `PRENOM`, `BIRTHDATE`, `FIRSTCOMMANDE`) VALUES
	(1, 'Martin', 'Erwan', '2001-10-25', NULL),
	(2, 'Montlouis Calixte', 'Teo', '2001-05-11', '2020-12-14'),
	(3, 'Liger Hellard', 'Thibaut', '2002-02-24', NULL);
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;

-- Dumping structure for table projetpoo.COMMANDE
CREATE TABLE IF NOT EXISTS `COMMANDE` (
  `REF` varchar(51) NOT NULL,
  `NUMCLIENT` int NOT NULL,
  `DATEEMIS` date NOT NULL,
  `DATELIVR` date NOT NULL,
  `ADRESSEEMIS` int NOT NULL,
  `ADRESSELIVR` int NOT NULL,
  `NBRPAIE` int NOT NULL DEFAULT '1',
  `PRIXHT` float DEFAULT NULL,
  `TVA` float DEFAULT NULL,
  `PRIXTTC` float DEFAULT NULL,
  PRIMARY KEY (`REF`),
  KEY `FK_PASSER` (`NUMCLIENT`),
  KEY `FK_EMIS` (`ADRESSEEMIS`),
  KEY `FK_LIVR` (`ADRESSELIVR`),
  CONSTRAINT `FK_EMIS` FOREIGN KEY (`ADRESSEEMIS`) REFERENCES `ADRESSES` (`IDADR`),
  CONSTRAINT `FK_LIVR` FOREIGN KEY (`ADRESSELIVR`) REFERENCES `ADRESSES` (`IDADR`),
  CONSTRAINT `FK_PASSER` FOREIGN KEY (`NUMCLIENT`) REFERENCES `CLIENT` (`NUMCLIENT`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table projetpoo.COMMANDE: ~1 rows (approximately)
/*!40000 ALTER TABLE `COMMANDE` DISABLE KEYS */;
INSERT INTO `COMMANDE` (`REF`, `NUMCLIENT`, `DATEEMIS`, `DATELIVR`, `ADRESSEEMIS`, `ADRESSELIVR`, `NBRPAIE`, `PRIXHT`, `TVA`, `PRIXTTC`) VALUES
	('ERMA2020NOT3', 1, '2020-12-08', '2020-12-24', 3, 4, 1, 700, 140, 840),
	('ERMA2020NOT4', 1, '2020-12-10', '2020-12-24', 3, 4, 1, 52.5, 10.5, 63),
	('ERMA2020NOT5', 1, '2020-12-12', '2020-12-24', 3, 4, 1, 195, 39, 234),
	('ERMA2021NOT2', 1, '2020-12-02', '2021-12-24', 3, 4, 1, 91, 18.2, 109.2),
	('TEMO2020MES1', 2, '2020-12-14', '2020-12-24', 5, 5, 1, 77.9, 15.58, 93.48),
	('TEMO2020MES10', 2, '2020-12-14', '2020-12-24', 5, 5, 1, 30, 6, 36),
	('TEMO2020MES11', 2, '2020-12-14', '2020-12-24', 5, 5, 1, 817.95, 163.59, 981.54),
	('TEMO2020MES12', 2, '2020-12-14', '2020-12-24', 5, 5, 1, 1168, 233.6, 1401.6),
	('TEMO2020MES13', 2, '2020-12-14', '2020-12-24', 5, 5, 1, 4.75, 0.95, 5.7),
	('TEMO2020MES14', 2, '2020-12-14', '2020-12-24', 5, 5, 1, 8.25, 1.65, 9.9),
	('TEMO2020MES2', 2, '2020-12-14', '2020-12-24', 5, 5, 1, 710, 142, 852),
	('TEMO2020MES3', 2, '2020-12-14', '2020-12-24', 5, 5, 1, 1320.5, 264.1, 1584.6),
	('TEMO2020MES4', 2, '2020-12-14', '2020-12-24', 5, 5, 1, 42, 8.4, 50.4),
	('TEMO2020MES5', 2, '2020-12-14', '2020-12-24', 5, 5, 1, 688.75, 137.75, 826.5),
	('TEMO2020MES6', 2, '2020-12-14', '2020-12-24', 5, 5, 1, 117, 23.4, 140.4),
	('TEMO2020MES7', 2, '2020-12-14', '2020-12-24', 5, 5, 1, 6.65, 1.33, 7.98),
	('TEMO2020MES8', 2, '2020-12-14', '2020-12-24', 5, 5, 1, 1290, 258, 1548),
	('TEMO2020MES9', 2, '2020-12-14', '2020-12-24', 5, 5, 1, 111.15, 22.23, 133.38);
/*!40000 ALTER TABLE `COMMANDE` ENABLE KEYS */;

-- Dumping structure for table projetpoo.CONTIENT
CREATE TABLE IF NOT EXISTS `CONTIENT` (
  `REF` varchar(51) NOT NULL,
  `ARTREF` int NOT NULL,
  `QUANTITEPRODUIT` int DEFAULT NULL,
  KEY `FK_ARTREF` (`ARTREF`),
  KEY `FK_REF` (`REF`),
  CONSTRAINT `FK_ARTREF` FOREIGN KEY (`ARTREF`) REFERENCES `ARTICLE` (`ARTREF`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_REF` FOREIGN KEY (`REF`) REFERENCES `COMMANDE` (`REF`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table projetpoo.CONTIENT: ~2 rows (approximately)
/*!40000 ALTER TABLE `CONTIENT` DISABLE KEYS */;
INSERT INTO `CONTIENT` (`REF`, `ARTREF`, `QUANTITEPRODUIT`) VALUES
	('ERMA2021NOT2', 2, 70),
	('ERMA2020NOT3', 3, 70),
	('ERMA2020NOT4', 1, 70),
	('ERMA2020NOT5', 2, 150),
	('TEMO2020', 1, 121),
	('TEMO2020MES1', 9, 82),
	('TEMO2020MES2', 11, 71),
	('TEMO2020MES3', 11, 139),
	('TEMO2020MES4', 1, 42),
	('TEMO2020MES5', 5, 145),
	('TEMO2020MES6', 10, 117),
	('TEMO2020MES7', 9, 7),
	('TEMO2020MES8', 3, 129),
	('TEMO2020MES9', 9, 117),
	('TEMO2020MES10', 11, 3),
	('TEMO2020MES11', 7, 41),
	('TEMO2020MES12', 12, 146),
	('TEMO2020MES13', 13, 1),
	('TEMO2020MES14', 8, 11);
/*!40000 ALTER TABLE `CONTIENT` ENABLE KEYS */;

-- Dumping structure for table projetpoo.COULEUR
CREATE TABLE IF NOT EXISTS `COULEUR` (
  `IDCOULEUR` int NOT NULL AUTO_INCREMENT,
  `NOMCOULEUR` varchar(51) NOT NULL,
  PRIMARY KEY (`IDCOULEUR`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table projetpoo.COULEUR: ~3 rows (approximately)
/*!40000 ALTER TABLE `COULEUR` DISABLE KEYS */;
INSERT INTO `COULEUR` (`IDCOULEUR`, `NOMCOULEUR`) VALUES
	(1, 'rouge'),
	(2, 'vert'),
	(3, 'bleu'),
	(4, 'jaune'),
	(5, 'noir'),
	(6, 'blanc'),
	(7, 'marron'),
	(8, 'orange'),
	(9, 'violet'),
	(10, 'gris');
/*!40000 ALTER TABLE `COULEUR` ENABLE KEYS */;

-- Dumping structure for table projetpoo.EST_LIVRE_A
CREATE TABLE IF NOT EXISTS `EST_LIVRE_A` (
  `NUMCLIENT` int NOT NULL,
  `IDADR` int NOT NULL,
  PRIMARY KEY (`NUMCLIENT`,`IDADR`),
  KEY `FK_ESL_LIVRE_A2` (`IDADR`),
  CONSTRAINT `FK_ESL_LIVRE_A` FOREIGN KEY (`NUMCLIENT`) REFERENCES `CLIENT` (`NUMCLIENT`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ESL_LIVRE_A2` FOREIGN KEY (`IDADR`) REFERENCES `ADRESSES` (`IDADR`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table projetpoo.EST_LIVRE_A: ~2 rows (approximately)
/*!40000 ALTER TABLE `EST_LIVRE_A` DISABLE KEYS */;
INSERT INTO `EST_LIVRE_A` (`NUMCLIENT`, `IDADR`) VALUES
	(3, 2),
	(1, 4),
	(2, 5);
/*!40000 ALTER TABLE `EST_LIVRE_A` ENABLE KEYS */;

-- Dumping structure for table projetpoo.NATURE
CREATE TABLE IF NOT EXISTS `NATURE` (
  `IDNATURE` int NOT NULL AUTO_INCREMENT,
  `NOMNATURE` varchar(51) NOT NULL,
  PRIMARY KEY (`IDNATURE`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table projetpoo.NATURE: ~3 rows (approximately)
/*!40000 ALTER TABLE `NATURE` DISABLE KEYS */;
INSERT INTO `NATURE` (`IDNATURE`, `NOMNATURE`) VALUES
	(1, 'resistance'),
	(2, 'condensateur'),
	(3, 'capteur de temperature'),
	(4, 'LED'),
	(5, 'transistor'),
	(6, 'arduino UNO'),
	(7, 'fil'),
	(8, 'switch'),
	(9, 'bouton'),
	(10, 'GPS'),
	(11, 'buzzer');
/*!40000 ALTER TABLE `NATURE` ENABLE KEYS */;

-- Dumping structure for table projetpoo.PAIEMENT
CREATE TABLE IF NOT EXISTS `PAIEMENT` (
  `IDPAY` int NOT NULL AUTO_INCREMENT,
  `IDTYPEPAY` int DEFAULT NULL,
  `REF` varchar(51) NOT NULL,
  `DATE` date DEFAULT NULL,
  `MONTANT` float DEFAULT NULL,
  PRIMARY KEY (`IDPAY`),
  KEY `FK_A_RECOURS_A` (`REF`),
  KEY `FK_REGLE_PAR` (`IDTYPEPAY`),
  CONSTRAINT `FK_A_RECOURS_A` FOREIGN KEY (`REF`) REFERENCES `COMMANDE` (`REF`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_REGLE_PAR` FOREIGN KEY (`IDTYPEPAY`) REFERENCES `TYPEPAIEMENT` (`IDTYPEPAY`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table projetpoo.PAIEMENT: ~0 rows (approximately)
/*!40000 ALTER TABLE `PAIEMENT` DISABLE KEYS */;
INSERT INTO `PAIEMENT` (`IDPAY`, `IDTYPEPAY`, `REF`, `DATE`, `MONTANT`) VALUES
	(1, NULL, 'ERMA2021NOT6', NULL, NULL),
	(2, NULL, 'ERMA2021NOT6', NULL, NULL),
	(3, NULL, 'ERMA2021NOT6', NULL, NULL),
	(4, NULL, 'ERMA2021NOT6', NULL, NULL);
/*!40000 ALTER TABLE `PAIEMENT` ENABLE KEYS */;

-- Dumping structure for table projetpoo.PERSONNEL
CREATE TABLE IF NOT EXISTS `PERSONNEL` (
  `IDPERSO` int NOT NULL AUTO_INCREMENT,
  `PER_IDPERSO` int DEFAULT NULL,
  `IDADR` int NOT NULL,
  `NOM` varchar(51) NOT NULL,
  `PRENOM` varchar(51) NOT NULL,
  `DATEEMBAUCHE` date NOT NULL,
  PRIMARY KEY (`IDPERSO`),
  KEY `FK_A_POUR_SUPERIEUR` (`PER_IDPERSO`),
  KEY `FK_HABITE_A` (`IDADR`),
  CONSTRAINT `FK_A_POUR_SUPERIEUR` FOREIGN KEY (`PER_IDPERSO`) REFERENCES `PERSONNEL` (`IDPERSO`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_HABITE_A` FOREIGN KEY (`IDADR`) REFERENCES `ADRESSES` (`IDADR`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table projetpoo.PERSONNEL: ~1 rows (approximately)
/*!40000 ALTER TABLE `PERSONNEL` DISABLE KEYS */;
INSERT INTO `PERSONNEL` (`IDPERSO`, `PER_IDPERSO`, `IDADR`, `NOM`, `PRENOM`, `DATEEMBAUCHE`) VALUES
	(8, NULL, 3, 'MARTIN', 'CEDRIC', '2019-06-18');
/*!40000 ALTER TABLE `PERSONNEL` ENABLE KEYS */;

-- Dumping structure for view projetpoo.PRIX
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `PRIX` (
	`ARTREF` INT NOT NULL,
	`PRICE` FLOAT NOT NULL,
	`QUANTITE` BIGINT NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for table projetpoo.PROMOS
CREATE TABLE IF NOT EXISTS `PROMOS` (
  `IDPROMO` int NOT NULL AUTO_INCREMENT,
  `ARTREF` int NOT NULL,
  `QUANTITE` int NOT NULL,
  `PRIX_UNIT` float NOT NULL,
  PRIMARY KEY (`IDPROMO`),
  KEY `FK_A_POUR_PROMO` (`ARTREF`),
  CONSTRAINT `FK_A_POUR_PROMO` FOREIGN KEY (`ARTREF`) REFERENCES `ARTICLE` (`ARTREF`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table projetpoo.PROMOS: ~2 rows (approximately)
/*!40000 ALTER TABLE `PROMOS` DISABLE KEYS */;
INSERT INTO `PROMOS` (`IDPROMO`, `ARTREF`, `QUANTITE`, `PRIX_UNIT`) VALUES
	(1, 1, 50, 0.75),
	(2, 2, 50, 1.3),
	(3, 2, 200, 1);
/*!40000 ALTER TABLE `PROMOS` ENABLE KEYS */;

-- Dumping structure for table projetpoo.TYPEPAIEMENT
CREATE TABLE IF NOT EXISTS `TYPEPAIEMENT` (
  `IDTYPEPAY` int NOT NULL AUTO_INCREMENT,
  `TYPEPAY` varchar(51) NOT NULL,
  PRIMARY KEY (`IDTYPEPAY`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table projetpoo.TYPEPAIEMENT: ~4 rows (approximately)
/*!40000 ALTER TABLE `TYPEPAIEMENT` DISABLE KEYS */;
INSERT INTO `TYPEPAIEMENT` (`IDTYPEPAY`, `TYPEPAY`) VALUES
	(1, 'Carte Bancaire'),
	(2, 'Cheque'),
	(3, 'Virement Bancaire'),
	(4, 'PayPal'),
	(5, 'Especes');
/*!40000 ALTER TABLE `TYPEPAIEMENT` ENABLE KEYS */;

-- Dumping structure for view projetpoo.VALEUR_STOCK
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `VALEUR_STOCK` (
	`DESIGNATION` VARCHAR(51) NOT NULL COLLATE 'utf8mb4_0900_ai_ci',
	`valeurstock` DOUBLE NOT NULL
) ENGINE=MyISAM;

-- Dumping structure for view projetpoo.PRIX
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `PRIX`;
CREATE ALGORITHM=UNDEFINED DEFINER=`thibuntu`@`%` SQL SECURITY DEFINER VIEW `PRIX` AS select `ARTICLE`.`ARTREF` AS `ARTREF`,`ARTICLE`.`PRIXHT` AS `PRICE`,0 AS `QUANTITE` from `ARTICLE` union select `PROMOS`.`ARTREF` AS `ARTREF`,`PROMOS`.`PRIX_UNIT` AS `PRIX`,`PROMOS`.`QUANTITE` AS `QUANTITE` from `PROMOS` order by `ARTREF`;

-- Dumping structure for view projetpoo.VALEUR_STOCK
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `VALEUR_STOCK`;
CREATE ALGORITHM=UNDEFINED DEFINER=`thibuntu`@`%` SQL SECURITY DEFINER VIEW `VALEUR_STOCK` AS select `ARTICLE`.`DESIGNATION` AS `DESIGNATION`,((`ARTICLE`.`QUANTDISPO` * `ARTICLE`.`PRIXHT`) + (`ARTICLE`.`TVA` * `ARTICLE`.`PRIXHT`)) AS `valeurstock` from `ARTICLE`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;