CREATE USER 'developer'@'%' IDENTIFIED BY '123456789';
GRANT ALL PRIVILEGES ON * . * TO 'developer'@'%';
FLUSH PRIVILEGES;

create schema pilot_project;
use pilot_project;

-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: pilot-project-db
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(45) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `sale_date` date DEFAULT NULL,
  `image` text,
  `description` text,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_name_UNIQUE` (`product_name`),
  KEY `brand_id` (`brand_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Iphone XS Max',100,26990000,1,'2019-10-12','IPhone XS Max 128GB.jpg','Made in USA'),(2,'Iphone X',100,21090000,1,'2019-10-09','ipx.jpg','Apple\'s aim with the iPhone X was to create an iPhone.'),(3,'Iphone 8 Plus',100,17980000,1,'2019-10-09','IPhone 8 Plus 64GB.jpg','The iPhone 8 includes a 4.7-inch display.'),(4,'Iphone 7 Plus',100,16500000,1,'2019-10-10','ip7.jpg','The iPhone 7 measures in at 138.3mm tall.'),(5,'Samsung Galaxy Note 10 Plus',100,22390000,2,'2019-10-08','ss note 10+.jpg','It runs on the Samsung Exynos 9 Octa 9825 Chipset.'),(6,'Samsung Galaxy S10',100,21500000,2,'2019-10-08','Samsung Galaxy S10 128GB.jpg','The Galaxy S10 isn’t all that small, of course.'),(7,'Samsung Galaxy S10 Plus',100,21990000,2,'2019-10-08','Samsung Galaxy S10+ 2 128GB.jpg','The Galaxy S10+ is Samsung latest flagship for 2019.'),(8,'Samsung Galaxy A70',100,7990000,2,'2019-10-08','Samsung Galaxy A70 64GB.jpg','It is powered by 2GHz octa-core Qualcomm Snapdragon 675.'),(9,'Samsung Galaxy Note 9',100,20490000,2,'2019-10-08','ss note 9.jpg','Samsung Note version'),(10,'IPhone 11 Pro Max',100,42990000,1,'2019-10-08','iphone-11-pro-max-512gb-gold.jpg','New IPhone'),(11,'Iphone 11',80,21990000,1,'2019-10-08','iphone-11-128gb-purple.jpg','New version'),(12,'Iphone 6S Plus',100,8990000,1,'2019-10-12','IPhone 6 32GB.jpg','Made in USA'),(13,'Xiaomi Note 7',100,4500000,6,'2019-10-08','xiaominote7.jpg','description'),(14,'Huawei P30 Pro',120,20690000,9,'2019-10-08','huawei-p30-pro.jpg','Huawei made in China'),(15,'Huawei P30',100,15290000,9,'2019-10-08','huawei-p30-blue-600x600.jpg','Huawei made in China'),(16,'Oppo Reno 10X',70,19990000,3,'2019-10-08','oppo-reno-10x-zoom-edition-black.jpg','Oppo made in China'),(18,'Oppo A9',100,7890000,3,'2019-10-08','oppo-a9-2020-green-1-600x600.jpg','Oppo China'),(19,'Oppo A7',50,7000000,3,'2019-10-08','oppo-r17-pro-14-600x600.jpg','Oppo China');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-17 11:26:55
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: pilot-project-db
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `brand_id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(45) DEFAULT NULL,
  `logo` text,
  `description` text,
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `brand_name_UNIQUE` (`brand_name`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Apple','aplogo.png','Apple Inc, California'),(2,'Samsung','sslogo.jpg','Samsung Inc, Korea'),(3,'Oppo','oplogo.jpg','Oppo Inc, China'),(4,'Blackberry','blackberry-logo.jpg','Blackberry Inc, California'),(5,'LG','LG-logo-600x600.jpg','LG Inc, Japan'),(6,'Xiaomi','xiaomilogo.png','Xiaomi Inc, China'),(7,'Sony','sony_og_img.jpg','Sony Inc, Japan'),(8,'Nokia','Nokia-Logo-600x600.jpg','Nokia Inc, Korea'),(9,'Huawei','huawei.jpg','Huawei made in China'),(10,'Vivo','vivo-Phone-logo3-600x600.png','Vivo Inc, China'),(11,'HTC','HTC 600x600.png','HTC Inc, California'),(12,'Asus','assus.png','Asus Inc, China'),(13,'V Smart','vsmart.png','VinGroup Inc, Vietnam'),(14,'Realme','realme.png','Realme Inc, China');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-17 11:26:55

-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: pilot-project-dmathangmathangb
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `username` varchar(50) NOT NULL,
  `password` text,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin1','123','ROLE_ADMIN'),('admin2','admin456','ADMIN'),('admin3','admin789','ADMIN');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-17 11:26:55

