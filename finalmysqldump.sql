-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `driverID` int NOT NULL,
  `license_Number` int DEFAULT NULL,
  `date_Hired` date DEFAULT NULL,
  `ratings` int DEFAULT NULL,
  `license_Plate` varchar(45) DEFAULT NULL,
  `car_Make` varchar(155) DEFAULT NULL,
  `car_Model` varchar(155) DEFAULT NULL,
  `personID` int NOT NULL,
  `orderID` int NOT NULL,
  PRIMARY KEY (`driverID`),
  KEY `fk_Driver_Persons1_idx` (`personID`),
  KEY `fk_Driver_OrderID_idx` (`orderID`),
  CONSTRAINT `fk_Driver_Order1` FOREIGN KEY (`orderID`) REFERENCES `order` (`orderID`),
  CONSTRAINT `fk_Driver_Persons1` FOREIGN KEY (`personID`) REFERENCES `persons` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (1,239,'2012-07-25',4,'dgl0123','Nissan','Altima',1,1),(2,1289,'2019-08-23',4,'dgl1223','Nissan','Rogue',2,2);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculty` (
  `title` varchar(255) DEFAULT NULL,
  `highest_degree` varchar(155) DEFAULT NULL,
  `degree_college` varchar(155) DEFAULT NULL,
  `PersonID` int NOT NULL,
  PRIMARY KEY (`PersonID`),
  CONSTRAINT `fk_Faculty_Persons1` FOREIGN KEY (`PersonID`) REFERENCES `persons` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty`
--

LOCK TABLES `faculty` WRITE;
/*!40000 ALTER TABLE `faculty` DISABLE KEYS */;
INSERT INTO `faculty` VALUES ('Librarian','masters','engineering',1),('Security','undergraduate','campus security',2);
/*!40000 ALTER TABLE `faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `locationID` int NOT NULL,
  `location_name` varchar(255) DEFAULT NULL,
  `location_adress` varchar(255) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `drop_off_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`locationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'Park','123 Part Street',562.089,5965.565,'The pole in the park.'),(2,'Library','321 Library Street',62.056,1645.895,'Front of library'),(3,'Quad','Main Ave',756.6,9863.685,'The grass quad.');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `orderID` int NOT NULL,
  `total_price` double DEFAULT NULL,
  `delivery_charge` double DEFAULT NULL,
  `restaurantID` int NOT NULL,
  `driverID` int NOT NULL,
  `locationID` int NOT NULL,
  `personID` int NOT NULL,
  PRIMARY KEY (`orderID`),
  KEY `fk_Order_Restaurant1_idx` (`restaurantID`),
  KEY `fk_Order_Locations1_idx` (`locationID`),
  KEY `fk_Order_Person1_idx` (`personID`),
  CONSTRAINT `fk_Order_Locations1` FOREIGN KEY (`locationID`) REFERENCES `locations` (`locationID`),
  CONSTRAINT `fk_Order_Person1` FOREIGN KEY (`personID`) REFERENCES `person` (`personID`),
  CONSTRAINT `fk_Order_Restaurant1` FOREIGN KEY (`restaurantID`) REFERENCES `restaurant` (`restaurantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,2.2,2.99,1,1,1,1),(2,18.3,2.99,3,1,1,3),(3,29.3,2.99,3,2,1,2);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persons`
--

DROP TABLE IF EXISTS `persons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persons` (
  `PersonID` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_number` int DEFAULT NULL,
  PRIMARY KEY (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persons`
--

LOCK TABLES `persons` WRITE;
/*!40000 ALTER TABLE `persons` DISABLE KEYS */;
INSERT INTO `persons` VALUES (1,'Bob','bob@uncc.edu',5719832),(2,'Joe','joe@uncc.edu',5711234),(3,'Alice','alice@uncc.edu',5712312),(4,'John','john@uncc.edu',5748898);
/*!40000 ALTER TABLE `persons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `restaurantID` int NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `website_link` varchar(255) DEFAULT NULL,
  `phone_number` int DEFAULT NULL,
  `schedule` varchar(155) DEFAULT NULL,
  `menu` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`restaurantID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'123 street','Meatballs','www.meatballs.com',3334423,'m-f 9-9','hotdog, cheeseburger'),(2,'321 St','Pizzas','www.Pizzas.com',3353483,'m-f 12-12','pizza'),(3,'Peach street','Subs N More','www.sandwiches.com',9862468,'Mondays close, T-S 12-9','ham and cheese'),(4,'Main Blvd','SushiRolls','www.sushi.com',6583197,'T-Sat 12-7pm','sushi');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `admin` tinyint DEFAULT NULL,
  `PersonID` int NOT NULL,
  PRIMARY KEY (`PersonID`),
  CONSTRAINT `fk_Staff_Persons1` FOREIGN KEY (`PersonID`) REFERENCES `persons` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (12.4,1.1,1,111),(24.5,8.2,2,222);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `grad_year` int DEFAULT NULL,
  `major` varchar(155) DEFAULT NULL,
  `PersonID` int NOT NULL,
  PRIMARY KEY (`PersonID`),
  CONSTRAINT `fk_Student_Persons1` FOREIGN KEY (`PersonID`) REFERENCES `persons` (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (2020,'Computer Science',3),(2021,'Science',4);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-05 23:24:07
