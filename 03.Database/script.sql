-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: smobile
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `account_id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fullName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `status` int DEFAULT '1',
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `BRAND_ID` bigint NOT NULL AUTO_INCREMENT,
  `BRAND_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` text,
  `LOGO` text NOT NULL,
  PRIMARY KEY (`BRAND_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Apple','Sản xuất tại Trung Quốc','images/brand/20200905-1620-km28qa.png'),(2,'Samsung','Sản xuất tại Hàn Quốc','images/brand/20200823-2338-lq96s7.png'),(3,'Xiaomi','Sản xuất tại Trung Quốc','images/brand/20200823-2337-ou2874.png'),(4,'OPPO','Sản xuất tại Trung Quốc','images/brand/20200823-2338-3lcmvh.png'),(5,'Nokia','Sản xuất tại Espoo, Phần Lan','images/brand/20200823-2337-s6s58g.png'),(6,'Huawei','Sản xuất tại Trung Quốc','images/brand/20200823-2337-qaqn3i.png'),(8,'LG','Cty thuộc Hàn Quốc','images/brand/20200823-2337-f2ug5r.png'),(9,'Sony','Tập đoàn thuộc Nhật Bảm','images/brand/20200823-2337-57dutq.png'),(10,'BackBerry','Tập đoàn thuộc Mỹ','images/brand/20200823-2337-fjmlah.png'),(12,'Vivo','Tập đoàn thuộc TQ','images/brand/20200823-2337-7l406b.png'),(13,'HTC','Tập đoàn thuộc Mỹ','images/brand/20200823-2334-8jnmkb.png'),(14,'Asus','Công ty ở Mỹ','images/brand/20200823-2332-j1nq28.png'),(15,'Lenovo','Công ty ở TQ','images/brand/20200823-2339-r0f3h9.png'),(16,'Mobiistar','Công ty thuộc Việt Nam','images/brand/20200823-2343-ao2e8g.png'),(17,'Motorola','Công ty ở Mỹ','images/brand/20200823-2344-qs4csq.png'),(18,'Wiko','Công ty ở TQ','images/brand/20200823-2345-vkteej.png');
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_shipping`
--

DROP TABLE IF EXISTS `option_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `option_shipping` (
  `OPTION_SHIPPING_ID` bigint NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text NOT NULL,
  `OPTION_SHIPPING_FEE` double NOT NULL,
  `OPTION_SHIPPING_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`OPTION_SHIPPING_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_shipping`
--

LOCK TABLES `option_shipping` WRITE;
/*!40000 ALTER TABLE `option_shipping` DISABLE KEYS */;
INSERT INTO `option_shipping` VALUES (1,'Nhận hàng từ 3 - 5 ngày',0,'Giao hàng nhanh'),(2,'Nhận hàng từ 2 - 7 ',0,'Viettel Post');
/*!40000 ALTER TABLE `option_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `PAYMENT_METHOD_ID` bigint NOT NULL AUTO_INCREMENT,
  `PAYMENT_METHOD_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`PAYMENT_METHOD_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES (1,'Thanh toán khi nhận hàng'),(2,'ZaloPay'),(3,'Visa'),(4,'Vietcombank');
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `PRODUCT_ID` bigint NOT NULL AUTO_INCREMENT,
  `PRODUCT_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `QUANTITY` int DEFAULT NULL,
  `SALE_DATE` date NOT NULL,
  `STATUS_PRODUCT` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UNIT_PRICE` double NOT NULL,
  `BRAND_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `FKsj2lk079hwjngnn3o9o183b6q` (`BRAND_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,' iPhone 12 Pro Max',28,'2017-01-02','Còn hàng',32990000,1),(2,' iPhone 12 Pro Max 128GB',17,'2017-10-20','Còn hàng',30990000,1),(3,'Samsung',10,'2022-11-11','Hết hàng',700000,2),(15,'Lenovo Y9',10,'2021-04-20','Hết hàng',5000000,10),(16,'Hehe',20,'2021-04-20','Hết hàng',11,3),(17,'I Phone 11',20,'2021-04-23','Còn hàng',30000000,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_comment`
--

DROP TABLE IF EXISTS `product_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_comment` (
  `COMMENT_ID` bigint NOT NULL AUTO_INCREMENT,
  `COMMENT_CONTENT` text NOT NULL,
  `DATE_OF_COMMENT` date NOT NULL,
  `PRODUCT_ID` bigint DEFAULT NULL,
  `USER_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`COMMENT_ID`),
  KEY `FKgekib0m3vt6whjenb3cukabl1` (`PRODUCT_ID`),
  KEY `FKi185n02wjp4twvkstiwlo2dkl` (`USER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_comment`
--

LOCK TABLES `product_comment` WRITE;
/*!40000 ALTER TABLE `product_comment` DISABLE KEYS */;
INSERT INTO `product_comment` VALUES (1,'Nếu mua tôi vẫn chọn mua ở Smobile, Rất uy tín.','2021-04-05',1,1),(2,'Tốt, nhân viên thân thiện','2021-04-07',1,2),(3,'Sản phẩm Oki','2021-03-07',2,3),(4,'Sản phẩm tốt Pin trâu','2021-04-04',1,3),(5,'Đúng như mong chờ 5 sao','2021-04-01',3,3);
/*!40000 ALTER TABLE `product_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_image`
--

DROP TABLE IF EXISTS `product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_image` (
  `PRODUCT_IMAGE_ID` bigint NOT NULL AUTO_INCREMENT,
  `IMAGE_URL` text NOT NULL,
  `PRODUCT_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_IMAGE_ID`),
  KEY `FKgab836d8rxqg8vv55nm02r65i` (`PRODUCT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (1,'images/product/20210426-1722-fupe7u.png',3),(2,'images/product/iphone-12-pro-max-xam.jpg',1),(3,'images/product/iphone-12-pro-max-vang.jpg',1),(4,'images/product/iphone-12-pro-max-trang.jpg',1),(21,'images/product/iphone-12-pro-max-vang.jpg',1),(6,'images/product/20210414-1516-i191sd.png',3),(7,'images/product/20210426-1720-abpmsj.png',3),(8,'images/product/20210414-1517-1emi5m.png',3),(9,'images/product/20210423-0924-a204kt.jpg',3),(10,'images/product/20210423-0924-a204kt.jpg',3),(11,'images/product/20210423-0924-a204kt.jpg',3),(12,'images/product/20210414-1524-618d4q.png',3),(13,'images/product/20210414-1525-phn2i2.png',3),(14,'images/product/20210414-1526-biqajq.png',3),(15,'images/product/20210414-1527-kpo5uq.png',3),(17,'images/product/20210414-1524-618d4q.png',15),(18,'images/product/20210414-1516-i191sd.png',16),(19,'images/product/20210426-1721-17hqo5.png',17),(20,'images/product/20210423-0936-b5pdrr.jpg',2);
/*!40000 ALTER TABLE `product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_info`
--

DROP TABLE IF EXISTS `product_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_info` (
  `PRODUCT_INFO_ID` bigint NOT NULL AUTO_INCREMENT,
  `BATTERY_CAPACITY` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CPU` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FRONT_CAMERA` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INTERNAL_MEMORY` int NOT NULL,
  `INTRODUCTION` text,
  `OPERATING_SYSTEM` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `RAM` int NOT NULL,
  `REAR_CAMERA` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SCREEN` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `SIM` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PRODUCT_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`PRODUCT_INFO_ID`),
  KEY `FKngpqxon4mkv8w80agvk33pm3i` (`PRODUCT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_info`
--

LOCK TABLES `product_info` WRITE;
/*!40000 ALTER TABLE `product_info` DISABLE KEYS */;
INSERT INTO `product_info` VALUES (1,'3687 mAh, Sạc nhanh','Apple A14 Bionic','	12 MP',128,'Vỏ Samsung CPU IPhone A14 A14','iOS 14',15,'	3 camera 12 MP','	OLED, 6.7\", Super Retina XDR','	1 Nano SIM & 1 eSIM, Hỗ trợ 5G',1),(2,'3687 mAh, Sạc nhanh','Apple A14 Bionic','	12 MP',128,'Vỏ Samsung CPU IPhone','iOS 14',6,'	3 camera 12 MP','	OLED, 6.7\", Super Retina XDR','	1 Nano SIM & 1 eSIM, Hỗ trợ 5G',2),(4,'3687 mAh, Sạc nhanh','Snapdragon 850','	12 MP',128,'Vỏ Samsung CPU IPhone','iOS 14',6,'	3 camera 12 MP','	OLED, 6.7\", Super Retina XDR','	1 Nano SIM & 1 eSIM, Hỗ trợ 5G',3);
/*!40000 ALTER TABLE `product_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_option`
--

DROP TABLE IF EXISTS `product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_option` (
  `PRODUCT_OPTION_ID` bigint NOT NULL AUTO_INCREMENT,
  `COLOR_PRODUCT_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `MEMORY_PRODUCT` int NOT NULL,
  `SALE_PRICE` double NOT NULL,
  `PRODUCT_ID` bigint DEFAULT NULL,
  `IMAGE_URL` text NOT NULL,
  PRIMARY KEY (`PRODUCT_OPTION_ID`),
  KEY `FKce5s9kcidsu22c94cepxr6hco` (`PRODUCT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option`
--

LOCK TABLES `product_option` WRITE;
/*!40000 ALTER TABLE `product_option` DISABLE KEYS */;
INSERT INTO `product_option` VALUES (1,'Bạc',128,29500000,1,'images/product/iphone-12-pro-max-vang.jpg'),(2,'Vàng ',128,29500000,1,'images/product/iphone-12-pro-max-vang.jpg'),(3,'Xám',128,29500000,1,'images/product/iphone-12-pro-max-xam.jpg'),(4,'Xanh dương',128,29500000,1,'images/product/iphone-12-pro-max-xam.jpg'),(5,'Bạc',256,32000000,1,'images/product/iphone-12-pro-max-vang.jpg'),(6,'Vàng ',256,32000000,1,'images/product/iphone-12-pro-max-vang.jpg'),(7,'Xám',256,32000000,1,'images/product/iphone-12-pro-max-xam.jpg'),(9,'Bạc',512,38500000,1,'images/product/iphone-12-pro-max-xam.jpg'),(10,'Vàng ',512,38500000,1,'images/product/iphone-12-pro-max-vang.jpg'),(12,'Xám',512,38500000,1,'images/product/iphone-12-pro-max-xam.jpg'),(13,'Xanh dương',512,38500000,1,'images/product/iphone-12-pro-max-xam.jpg'),(14,'Hường',512,250000000,2,'images/product/iphone-12-pro-max-vang.jpg'),(15,'Hường',512,200000000,2,'images/product/iphone-12-pro-max-vang.jpg'),(16,'Hường',512,200000000,15,'images/product/iphone-12-pro-max-vang.jpg'),(17,'Cam',512,250000000,2,'images/product/iphone-12-pro-max-xam.jpg'),(18,'Hường',512,200000000,16,'images/product/iphone-12-pro-max-xam.jpg'),(20,'Cam Real',512,200000000,15,'images/product/iphone-12-pro-max-vang.jpg');
/*!40000 ALTER TABLE `product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `PURCHASE_ID` bigint NOT NULL AUTO_INCREMENT,
  `DATE_OF_ORDER` date DEFAULT NULL,
  `OPTION_SHIPPING_ID` bigint DEFAULT NULL,
  `PAYMENT_METHOD_ID` bigint DEFAULT NULL,
  `PURCHASE_STATUS_ID` bigint DEFAULT NULL,
  `USER_ID` bigint DEFAULT NULL,
  `DELIVERY_ADDRESS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FULL_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NOTE_PURCHASE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PHONE_NUMBER` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`PURCHASE_ID`),
  KEY `FK6nylhhtjar3vlc08wbaammosh` (`OPTION_SHIPPING_ID`),
  KEY `FKhx222gmp8q34el3oyvqup3n1s` (`PAYMENT_METHOD_ID`),
  KEY `FKja3u312154o3ei3wtwhftg0py` (`PURCHASE_STATUS_ID`),
  KEY `FKnjygkwde7uvntspyx9ogws0nb` (`USER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,'2021-05-04',1,1,2,3,'77 Nguyễn Huệ, Huế','Chung Thái ','Giao hàng lúc 11h trưa tại cổng trước ĐH Khoa Học Huế','123456700'),(2,'2021-05-04',1,1,3,7,'70 Nguyễn Lương Bằng, Huế','Trần Hồng Thức','','123456789'),(3,'2021-05-04',1,1,2,2,'7 Tản Đà, Huế','Trần Văn Nam','Giao hàng lúc 11h trưa tại cổng trước ĐH Khoa Học Huế','123456782'),(4,'2021-05-04',1,1,3,7,'70 Nguyễn Lương Bằng, Huế','Trần Hồng Thức','Test trang thái đơn hàng','123456789');
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_detail`
--

DROP TABLE IF EXISTS `purchase_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_detail` (
  `PURCHASE_DETAIL_ID` bigint NOT NULL AUTO_INCREMENT,
  `QUANTITY` int DEFAULT NULL,
  `SALE_PRICE` double DEFAULT NULL,
  `PRODUCT_ID` bigint DEFAULT NULL,
  `PRODUCT_OPTION_ID` bigint DEFAULT NULL,
  `PURCHASE_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`PURCHASE_DETAIL_ID`),
  KEY `FKqhgvtlnm9wskydfj9e1dl3yxf` (`PRODUCT_ID`),
  KEY `FKl8ovx625te7mp40vrsis0trmf` (`PRODUCT_OPTION_ID`),
  KEY `FK5t3yaodc1d5pcfqldu9bv2ftq` (`PURCHASE_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_detail`
--

LOCK TABLES `purchase_detail` WRITE;
/*!40000 ALTER TABLE `purchase_detail` DISABLE KEYS */;
INSERT INTO `purchase_detail` VALUES (1,1,38500000,1,12,1),(3,1,38500000,1,12,2);
/*!40000 ALTER TABLE `purchase_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_status`
--

DROP TABLE IF EXISTS `purchase_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_status` (
  `PURCHASE_STATUS_ID` bigint NOT NULL AUTO_INCREMENT,
  `PURCHASE_STATUS_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PURCHASE_STATUS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_status`
--

LOCK TABLES `purchase_status` WRITE;
/*!40000 ALTER TABLE `purchase_status` DISABLE KEYS */;
INSERT INTO `purchase_status` VALUES (1,'Chờ xử lý'),(2,'Đang giao hàng'),(3,'Đã giao'),(4,'Hủy đơn hàng');
/*!40000 ALTER TABLE `purchase_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_product`
--

DROP TABLE IF EXISTS `rate_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate_product` (
  `RATE_ID` bigint NOT NULL AUTO_INCREMENT,
  `RATE_NUMBER` int NOT NULL,
  `PRODUCT_ID` bigint DEFAULT NULL,
  `USER_ID` bigint DEFAULT NULL,
  PRIMARY KEY (`RATE_ID`),
  KEY `FKg9onubgk58t5mqumlk0tbgi3` (`PRODUCT_ID`),
  KEY `FKii5phsrg93srr06881d8ew9n1` (`USER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate_product`
--

LOCK TABLES `rate_product` WRITE;
/*!40000 ALTER TABLE `rate_product` DISABLE KEYS */;
INSERT INTO `rate_product` VALUES (1,4,1,1),(2,5,1,2),(3,5,1,3),(4,4,1,4),(5,5,3,3);
/*!40000 ALTER TABLE `rate_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `BRAND_ID` int DEFAULT NULL,
  `BRAND_NAME` text,
  `DESCRIPTION` text,
  `LOGO` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES (1,'Apple','Sáº£n xuáº¥t táº¡i Trung Quá»‘c','images/brand/20200905-1620-km28qa.png'),(2,'Samsung','Sáº£n xuáº¥t táº¡i HÃ n Quá»‘c','images/brand/20210426-1528-4nne7u.jpg'),(3,'Xiaomi','Sáº£n xuáº¥t táº¡i Trung Quá»‘c','images/brand/20200823-2338-lq96s7.png'),(4,'OPPO','Sáº£n xuáº¥t táº¡i Trung Quá»‘c','images/brand/20200823-2338-3lcmvh.png'),(9,'Nokia','Sáº£n xuáº¥t táº¡i Espoo, Pháº§n Lan','images/brand/20200823-2337-s6s58g.png'),(10,'Huawei','Sáº£n xuáº¥t táº¡i Trung Quá»‘c','images/brand/20200823-2337-qaqn3i.png'),(12,'Vsmart','Má»™t pháº§n cá»§a táº­p Ä‘oÃ n VinGroup','images/brand/20210420-0844-5j4ps1.jpg');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `USER_ID` bigint NOT NULL AUTO_INCREMENT,
  `AVATAR_URL` text NOT NULL,
  `BIRTHDAY` date NOT NULL,
  `EMAIL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `FULL_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `GENDER` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PASSWORD` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PHONE_NUMBER` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ROLE` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'ROLE_USER',
  `USERNAME` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ADDRESS_USER` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'images/account/20210416-1704-td8rbv.jpg','1999-10-10','a@email.com','Trần Đức Dương','Nam','ad17b460ce87deba47d925fa26fe9520','123456789','ROLE_USER','user3','30 Lý Liên Kiệt, Huế'),(2,'images/account/avt.jpg','1999-10-20','B@email.com','Trần Văn Nam','Nam','ad17b460ce87deba47d925fa26fe9520','123456782','ROLE_USER','user2','7 Tản Đà, Huế'),(3,'images/account/avt.jpg','1998-10-20','c@email.com','Chung Thái ','Nữ','ad17b460ce87deba47d925fa26fe9520','123456700','ROLE_USER','user1','3 Đinh Tiên Hoàng, Huế'),(4,'images/account/avt.jpg','1998-10-20','c@email.com','Trần Thị B','Nữ','ad17b460ce87deba47d925fa26fe9520','123456700','ROLE_USER','nvd','1 Nguyễn Huệ, Huế'),(5,'images/account/avt.jpg','2020-10-10','bc@gmail.com','Thanh Trúc','Nữ','ad17b460ce87deba47d925fa26fe9520','123456189','ROLE_USER','user4','40 Hùng Vương. Huế'),(7,'images/account/avt.jpg','1999-10-20','admin@gamil.com','Trần Hồng Thức','Nam','ad17b460ce87deba47d925fa26fe9520','123456789','ROLE_ADMIN','admin','70 Nguyễn Lương Bằng, Huế');
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

-- Dump completed on 2021-05-04 17:20:55
