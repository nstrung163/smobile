-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: smobile
-- ------------------------------------------------------
-- Server version	8.0.21

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
  PRIMARY KEY (`BRAND_ID`),
  KEY `INDEX_BRAND_NAME` (`BRAND_NAME`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
-- Table structure for table `month_table`
--

DROP TABLE IF EXISTS `month_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `month_table` (
  `month_number` int NOT NULL,
  `month_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`month_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `month_table`
--

LOCK TABLES `month_table` WRITE;
/*!40000 ALTER TABLE `month_table` DISABLE KEYS */;
INSERT INTO `month_table` VALUES (1,'January'),(2,'Ferbuary'),(3,'March'),(4,'April'),(5,'May'),(6,'June'),(7,'July'),(8,'August'),(9,'Semtember'),(10,'October'),(11,'November'),(12,'December');
/*!40000 ALTER TABLE `month_table` ENABLE KEYS */;
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
  KEY `FKsj2lk079hwjngnn3o9o183b6q` (`BRAND_ID`),
  KEY `INDEX_PRODUCT` (`PRODUCT_ID`),
  KEY `INDEX_PRODUCT_NAME` (`PRODUCT_NAME`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,' iPhone 12 Pro Max',6,'2021-01-02','Còn hàng',31990000,1),(2,' iPhone 11 Pro Max Chính hãng VN/A ',15,'2021-10-20','Còn hàng',29500000,1),(3,'iPhone 11 Chính hãng VN/A ',10,'2020-11-11','Còn hàng',19900000,1),(4,'iPhone XR Chính hãng VN/A ',10,'2020-04-20','Còn hàng',20000000,1),(5,'iPhone 12 mini Chính hãng VN/A',20,'2020-03-20','Còn hàng',22990000,1),(6,'iPhone 12 Chính hãng VN/A ',20,'2020-05-23','Còn hàng',20990000,1),(7,'Apple iPhone 8 Plus Chính hãng VN/A ',20,'2020-04-23','Còn hàng',16000000,1),(8,'iPhone 7 Plus Chính hãng VN/A ',20,'2021-04-23','Còn hàng',9990000,1),(9,'iPhone SE 2020 Chính hãng VN/A ',20,'2020-04-23','Còn hàng',14990000,1),(21,'Samsung Galaxy Note 20 Ultra 5G',19,'2020-04-15','Còn hàng',25990000,2),(22,'Samsung Galaxy S21 Ultra 5G',20,'2020-04-23','Còn hàng',30990000,2),(23,'Samsung Galaxy A52',20,'2020-04-23','Còn hàng',9290000,2),(24,'Samsung Galaxy S21 Plus 5G',19,'2020-05-23','Còn hàng',25990000,2),(25,'Samsung Galaxy A72',19,'2020-05-23','Còn hàng',11490000,2),(26,'Samsung Galaxy Note 20 Ultra',20,'2020-05-23','Còn hàng',29990000,2),(27,'Samsung Galaxy A32',20,'2019-05-10','Còn hàng',6690000,2),(28,'Samsung Galaxy Z Fold 2 5G (Phiên bản mùa hè)',20,'2020-07-23','Còn hàng',50000000,2),(29,'Samsung Galaxy A02s',20,'2019-06-24','Còn hàng',3590000,2),(30,'Samsung Galaxy Note 20',19,'2020-05-07','Còn hàng',23990000,2),(31,'Samsung Galaxy A31',20,'2019-05-25','Còn hàng',5790000,2),(32,'Xiaomi Redmi Note 10',20,'2019-06-24','Còn hàng',5490000,3),(33,'Xiaomi Redmi Note 10 Pro 8GB',20,'2019-06-24','Còn hàng',5490000,3),(34,'Xiaomi Mi 11 5G',20,'2020-07-23','Còn hàng',21990000,3),(35,'Xiaomi POCO X3 NFC',20,'2019-06-24','Còn hàng',6990000,3),(36,'Xiaomi Redmi Note 10 4GB',20,'2019-05-10','Còn hàng',4690000,3),(37,'Xiaomi Redmi 9A',10,'2019-05-25','Còn hàng',1990000,3),(38,'Xiaomi Mi 10T Pro 5G 8GB',20,'2019-06-24','Còn hàng',11990000,3),(39,'Xiaomi Mi 10T Pro 5G',9,'2020-05-07','Còn hàng',12990000,3),(47,'iPhone 12 Pro',20,'2020-05-07','Còn hàng',29990000,1),(48,'iPhone 11 Pro I Chính hãng VN/A',20,'2019-05-25','Còn hàng',29000000,1),(49,'Nokia 8000 4G',5,'2019-06-24','Còn hàng',1790000,5);
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
  `IMAGE_COMMENT_URL` text,
  `RATE_NUMBER` int NOT NULL,
  PRIMARY KEY (`COMMENT_ID`),
  KEY `FKgekib0m3vt6whjenb3cukabl1` (`PRODUCT_ID`),
  KEY `FKi185n02wjp4twvkstiwlo2dkl` (`USER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_comment`
--

LOCK TABLES `product_comment` WRITE;
/*!40000 ALTER TABLE `product_comment` DISABLE KEYS */;
INSERT INTO `product_comment` VALUES (1,'Nếu mua tôi vẫn chọn mua ở Smobile, Rất uy tín.','2021-04-05',1,1,'images/comment/comment1.jpg',4),(2,'Tốt, nhân viên thân thiện','2021-04-07',1,2,'images/comment/comment2.jpg',5),(3,'Sản phẩm Oki','2021-03-07',2,3,'images/comment/comment3.jpg',4),(4,'Sản phẩm tốt Pin trâu','2021-04-04',1,3,'images/comment/comment4.jpg',5),(5,'Đúng như mong chờ 5 sao','2021-04-01',3,3,'images/comment/comment5.jpg',5),(6,'Sản phẩm tốt','2021-05-10',1,4,'images/comment/comment4.jpg',4),(7,'Sản phẩm tốt nhưng giá hơi cao ','2021-05-10',1,2,'images/comment/comment3.jpg',3),(8,'Good','2021-05-10',1,5,'images/comment/comment6.jpg',5),(9,'Tuyệt vời','2021-05-11',1,3,'images/comment/comment6.jpg',4),(10,'Tốt','2021-05-11',1,3,'images/comment/comment8.jpg',5),(11,'Hiệu năng cao đúng như mong đợi','2021-05-11',1,2,'images/comment/comment1.jpg',5),(12,'Sản phẩm nhanh hết pin','2021-05-11',4,3,'images/comment/comment8.jpg',3),(13,'Màn hình sắc nét độ phân giải cao. Tốt','2021-05-12',24,5,NULL,5),(14,'Sản phẩm đẹp, hiệu năng cao','2021-05-12',30,5,NULL,5),(15,'Màn hình, hiệu năng Oki, hạn chết là nhanh hết pin nhưng vẫn Good','2021-05-12',2,7,'images/comment/20210512-2326-36lpnr.jpg',5),(16,'Màn hình, hiệu năng Oki, hạn chết là nhanh hết pin nhưng vẫn Good','2021-05-12',2,7,'images/comment/20210512-2326-10kfpf.jpg',5),(17,'Tốt','2021-05-12',2,7,'images/comment/20210512-2327-dgf8cd.jpg',5),(18,'Chất lương tốt','2021-05-12',3,7,'images/comment/20210512-2333-bquhbd.jpg',5),(20,'Sản phẩm tốt như mong đợi','2021-05-15',1,10,'images/comment/20210515-2203-ubsmi7.jpg',5),(21,'','2021-05-21',1,1,'images/comment/20210521-1141-iovan3.jpg',5),(24,'Sản phẩm tốt, hiệu năng cao','2021-05-22',1,8,'images/comment/20210522-0621-vj5adu.jpg',5),(25,'Sản phẩm tốt','2021-05-22',1,2,'images/comment/20210522-0657-cigffl.jpg',5),(26,'Sản phẩm tốt','2021-05-22',1,16,'images/comment/20210522-0959-m2aa8c.jpg',5);
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
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_image`
--

LOCK TABLES `product_image` WRITE;
/*!40000 ALTER TABLE `product_image` DISABLE KEYS */;
INSERT INTO `product_image` VALUES (1,'images/product/iphone-12-pro-max_2__7.jpg',1),(2,'images/product/iphone-12-pro-max-xanh-duong.jpg',1),(3,'images/product/iphone-12-pro-max-vang.jpg',1),(4,'images/product/iphone-12-pro-max-bac.jpg',1),(51,'images/product/samsung-ultra-5g.jpg',21),(50,'images/product/iphone-se.jpg',9),(49,'images/product/iphone-7-plus.jpg',8),(48,'images/product/iphone-se.jpg',9),(47,'images/product/iphone-se.jpg',9),(46,'images/product/iphone_8_plus.jpg',7),(45,'images/product/iphone-12-do.jpg',6),(44,'images/product/iphone-12-trang.jpg',5),(43,'images/product/iphone-12-do.jpg',5),(42,'images/product/iphone-xr.jpg',4),(29,'images/product/iphone-11-tim.jpg',3),(28,'images/product/iphone-11-trang.jpg',3),(5,'images/product/iphone-11-do.jpg',3),(30,'images/product/iphone-11-vang.jpg',3),(27,'images/product/iphone-11-pro-max-vang.jpg',2),(6,'images/product/iphone-11-pro-max-xanh-reu.jpg',2),(52,'images/product/samsung-ultra-5g-den.jpg',22),(7,'images/product/iphone-11-pro-max-trang.jpg',2),(53,'images/product/samsung-galaxy-a52-tim.jpg',23),(54,'images/product/samsung-galaxy-s21-plus-bac.jpg',24),(55,'images/product/samsung-galaxy-s21-plus-bac.jpg',25),(56,'images/product/SS20-vang-dong.jpg',26),(57,'images/product/samsung-galaxy-a32-trang.jpg',27),(58,'images/product/galaxy-z-fold2-5g-vang-dong.jpg',28),(59,'images/product/samsung-galaxy-a02s-do.jpg',29),(60,'images/product/SSNOTE20-XANH.jpg',30),(61,'images/product/ssA31-TIM.jpg',31),(62,'images/product/xiaomi-redmi-note-10-trang.jpg',32),(63,'images/product/xiaomi-redmi-note-10-pro-cam.jpg',33),(64,'images/product/xiaomi-mi-11-128gb-1.jpg',34),(65,'images/product/xiaomi-poco-x3-pro-2.jpg',35),(66,'images/product/xiaomi-redmi-note-10_1_1_1.jpg',36),(67,'images/product/redmi_9a_0002_layer_1_1.jpg',37),(68,'images/product/xiaomi-mi-10t-pro_2__3.jpg',38),(69,'images/product/xiaomi-mi-10t-pro_1__1.jpg',39),(79,'images/product/iphone-12-pro-max-xanh-duong.jpg',47),(80,'images/product/iphone-12-pro-max-den.jpg',48),(81,'images/product/nokia8000.jpg',49);
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
  `TYPE_PRODUCT` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NUMBER_OF_BATTERY_CAPACITY` int NOT NULL,
  PRIMARY KEY (`PRODUCT_INFO_ID`),
  KEY `FKngpqxon4mkv8w80agvk33pm3i` (`PRODUCT_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_info`
--

LOCK TABLES `product_info` WRITE;
/*!40000 ALTER TABLE `product_info` DISABLE KEYS */;
INSERT INTO `product_info` VALUES (1,'3687 mAh, Sạc nhanh','Apple A14 Bionic','	12 MP',128,'Cứ mỗi năm, đến dạo cuối tháng 8 và gần đầu tháng 9 thì mọi thông tin sôi sục mới về chiếc iPhone mới lại xuất hiện. Apple năm nay lại ra thêm một chiếc iPhone mới với tên gọi mới là iPhone 12 Pro Max, đây là một dòng điện thoại mới và mạnh mẽ nhất của nhà Apple năm nay. Mời bạn tham khảo thêm một số mô tả sản phẩm bên dưới để bạn có thể ra quyết định mua sắm.','iOS 14',6,'	3 camera 12 MP','	OLED, 6.7\", Super Retina XDR','	1 Nano SIM & 1 eSIM, Hỗ trợ 5G',1,'iPhone',3678),(2,'3687 mAh, Sạc nhanh','Apple A14 Bionic','	12 MP',128,'Cứ mỗi năm, đến dạo cuối tháng 8 và gần đầu tháng 9 thì mọi thông tin sôi sục mới về chiếc iPhone mới lại xuất hiện. Apple năm nay lại ra thêm một chiếc iPhone mới với tên gọi mới là iPhone 12 Pro Max, đây là một dòng điện thoại mới và mạnh mẽ nhất của nhà Apple năm nay. Mời bạn tham khảo thêm một số mô tả sản phẩm bên dưới để bạn có thể ra quyết định mua sắm.','iOS 14',6,'	3 camera 12 MP','	OLED, 6.7\", Super Retina XDR','	1 Nano SIM & 1 eSIM, Hỗ trợ 5G',2,'iPhone',3678),(4,'4000 mAh','Snapdragon 850','	12 MP',128,'Cứ mỗi năm, đến dạo cuối tháng 8 và gần đầu tháng 9 thì mọi thông tin sôi sục mới về chiếc iPhone mới lại xuất hiện. Apple năm nay lại ra thêm một chiếc iPhone mới với tên gọi mới là iPhone 12 Pro Max, đây là một dòng điện thoại mới và mạnh mẽ nhất của nhà Apple năm nay. Mời bạn tham khảo thêm một số mô tả sản phẩm bên dưới để bạn có thể ra quyết định mua sắm.','iOS 14',6,'	3 camera 12 MP','	OLED, 6.7\", Super Retina XDR','	1 Nano SIM & 1 eSIM, Hỗ trợ 5G',3,'iPhone',4000),(5,'3687 mAh, Sạc nhanh','Snapdragon 850','12 MP',128,'Vỏ Samsung CPU Samsung ','iOS 14',8,'3 camera 12 MP','OLED, 6.7\", Super Retina XDR','1 Nano SIM & 1 eSIM, Hỗ trợ 5G',21,'Android',3678),(7,'5000 mAh, Sạc nhanh','Snap dragon 850','12 PM',128,'Sản phẩm  được thiết kế sang trọng, cấu hình cao','Android Mi8',5,'15 PM','Man hinh','2 Sim',34,'Android',5000),(8,'2942 mAh','A12 Bionic','7 MP',128,'Được xem là phiên bản iPhone giá rẻ đầy hoàn hảo, iPhone Xr 128GB khiến người dùng có nhiều sự lựa chọn hơn về màu sắc đa dạng nhưng vẫn sở hữu cấu hình mạnh mẽ và thiết kế sang trọng.','iOS 12',3,'12 MP','IPS LCD6.1\"Liquid Retina','2, 1 eSIM, 1 Nano SIM',4,'iPhone',2942),(9,'2227 mAh','A14 Bionic','12.0 MP',64,'Chiếc iPhone siêu nhỏ gọn nhưng mang trên mình sức mạnh không đối thủ. iPhone 12 mini là sự lựa chọn hoàn hảo cho những ai đang cần một chiếc điện thoại có thể làm mọi thứ nhưng lại nằm gọn trong lòng bàn tay và độ tiện dụng đáng kinh ngạc.','Apple GPU 4 nhân',4,'12.0 MP + 12.0 MP','5.4\", Super Retina XDR, AMOLED, 1080 x 2240 Pixel','1 Nano SIM & 1 eSIM, Hỗ trợ 5G',5,'iPhone',2227),(10,'2815 mAh','A14 Bionic','7.0 MP',64,'iPhone 12 ra mắt với vai trò mở ra một kỷ nguyên hoàn toàn mới. Tốc độ mạng 5G siêu tốc, bộ vi xử lý A14 Bionic nhanh nhất thế giới smartphone, màn hình OLED tràn cạnh tuyệt đẹp và camera siêu chụp đêm, tất cả đều có mặt trên iPhone 12.','iOS 14',4,'12.0 MP + 12.0 MP','OLED, 6.7\", Super Retina XDR','1 Nano SIM & 1 eSIM, Hỗ trợ 5G',6,'iPhone',2815),(11,'2691 mAh','A11 Bionic','7.0 MP',256,'Apple vừa giới thiệu phiên bản màu đỏ PRODUCT RED cho bộ đôi iPhone 8 và 8 Plus. Điểm đặc biệt, sản phẩm nằm trong mối hợp tác giữa Táo khuyết với (RED), tổ chức gây quỹ phòng chống HIV/AIDS tại châu Phi và một phần doanh thu bán iPhone 8 và iPhone 8 Plus RED - Đỏ sẽ được quyên góp cho quỹ từ thiện của (RED).','iOS 11',3,'7.0 MP','5.5\", Retina HD, IPS LCD, 1080 x 1920 Pixel','1, Nano SIM',7,'iPhone',2691),(12,'Li-ion 2900 mAh','A11 Bionic','7.0 MP',32,'Với thiết kế không có quá nhiều thay đổi nhưng iPhone 7 Plus đã được Apple nâng cấp và trang bị rất nhiều tính năng đáng giá như camera kép, nút home mới, khả năng chống nước cùng với cấu hình “siêu khủng” được các trang mạng đánh giá. Đây là sản phẩm mà người dùng có thể tham khảo khi cần sở hữu cho mình chiếc smartphone mang tính ổn định đến từ Apple.','iOS 11',3,'12 MP ','5.5 inches','Nano-SIM',8,'iPhone',2900),(13,'1821 mAh','A13 Bionic','7.0 MP',64,'Một chiếc iPhone nhỏ gọn mang trên mình bộ vi xử lý mạnh mẽ hàng đầu, iPhone SE 2020 với mức giá hấp dẫn chưa từng thấy sẽ là sự lựa chọn phù hợp dành cho tất cả người dùng.','iOS 14',3,'	12.0 MP','4.7\", Retina HD, IPS LCD, 750 x 1334 Pixel','2, 1 eSIM, 1 Nano SIM',9,'iPhone',1821),(14,'4500 mAh','Snapdragon 720G','32.0 MP',128,'Thiết kế đột phá, màn hình tuyệt đỉnh và bộ tứ camera chống rung quang học OIS chuyên nghiệp hơn bao giờ hết, Samsung Galaxy A52 mở ra một kỷ nguyên mới cho dòng Galaxy A vốn luôn được người dùng yêu thích.','Android 11',8,'64.0 MP + 12.0 MP + 5.0 MP + 5.0 MP','6.5\", FHD+, Super AMOLED, 1080 x 2400 Pixel','2, Nano SIM',23,'Android',4500),(15,'5000 mAh','Snapdragon 678','13.0 MP',128,'Nhà vô địch mới của smartphone giá rẻ đã xuất hiện, Xiaomi Redmi Note 10 chính là sự lựa chọn hoàn hảo với sức mạnh và tốc độ cực đỉnh, 4 camera 48MP, màn hình AMOLED cùng thời lượng pin bền bỉ đáng kinh ngạc.','Android 11',6,'48.0 MP + 8.0 MP + 2.0 MP + 2.0 MP','6.43\", FHD+, AMOLED, 2440 x 1080 Pixel','2, Nano SIM',32,'Android',5000),(16,'5160 mAh','Snapdragon 732G','20.0 MP',128,'Trải nghiệm sức mạnh và tốc độ khó tin trên Xiaomi POCO X3 NFC, chiếc điện thoại có cấu hình vượt trội so với mọi đối thủ cùng phân khúc. Không chỉ đáp ứng tốt các nhu cầu cơ bản, chiếc Xiaomi này còn là một cỗ máy chơi game chuyên nghiệp ngay trên tay bạn.','Android 10.0',6,'64.0 MP + 13.0 MP + 2.0 MP + 2.0 MP','6.67\", FHD+, IPS LCD, 1080 x 2400 Pixel','2, Nano SIM',35,'Android',5160),(17,'3046 mAh','A13 Bionic','12.0 MP',128,'Chào đón bạn đến với thế hệ iPhone Pro đầu tiên. iPhone 11 Pro sở hữu hệ thống 3 camera đẳng cấp, một bước nhảy vọt về thời lượng pin và con chip mới có hiệu năng mạnh mẽ chưa từng thấy. Mạnh mẽ, khác biệt và chuyên nghiệp, sản phẩm hoàn toàn xứng đáng với tên gọi.','iOS 13',4,'12.0 MP + 12.0 MP + 12.0 MP','5.8\", Super Retina XDR, Super AMOLED, 1125 x 2436 Pixel','1, 1 eSIM, 1 Nano SIM',48,'iPhone',3046),(18,'2815 mAh','A14 Bionic','12.0 MP',128,'Đến với đẳng cấp Pro đích thực, nơi mà những điều đặc biệt đang chờ đón bạn trên iPhone 12 Pro. Từ hệ thống camera Pro chụp thiếu sáng cực đỉnh, kết nối 5G siêu tốc cho đến bộ vi xử lý A14 Bionic nhanh nhất thế giới smartphone, vẫn còn nhiều bất ngờ khác để bạn khám phá.','iOS 14',6,'12.0 MP + 12.0 MP + 12.0 MP','6.1\", Super Retina XDR, AMOLED, 2532 x 1170 Pixel','2, 1 eSIM, 1 Nano SIM',47,'iPhone',2815),(19,'Pin rời Nokia 1500mAh','4 nhân 1.1 GHz','5.0 MP',4,'Điện thoại phổ thông Nokia 8000 4G được thiết kế sang trọng và đẳng cấp. Khung viền điện thoại bo tròn tinh tế và mềm mại. Chất liệu được hoàn thiện bằng Crom kim loại giúp điện thoại đẹp từ trong ra ngoài.','KaiOS',1,'5.0 MP','TFT LCD2.8\"QVGA','2 Nano SIM Hỗ trợ 4G',49,'Điện thoại phổ thông',1500),(20,'5000 mAh','Snapdragon 720G','32.0 MP',256,'Pin dung lượng khủng 5000mAh, bộ nhớ trong lên tới 256GB, khả năng thu phóng hình ảnh tới 30x và màn hình tuyệt mỹ, Samsung Galaxy A72 đã sẵn sàng để đưa bạn tới những trải nghiệm không giới hạn.','Android 11',8,'64.0 MP + 12.0 MP + 8.0 MP + 5.0 MP','6.7\", FHD+, Super AMOLED, 1080 x 2400 Pixel','2, Nano SIM',25,'Android',5000);
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
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_option`
--

LOCK TABLES `product_option` WRITE;
/*!40000 ALTER TABLE `product_option` DISABLE KEYS */;
INSERT INTO `product_option` VALUES (1,'Bạc',128,29500000,1,'images/product/iphone-12-pro-max-bac.jpg'),(2,'Vàng ',128,29500000,1,'images/product/iphone-12-pro-max-vang.jpg'),(3,'Xám',128,29500000,1,'images/product/iphone-12-pro-max_2__7.jpg'),(4,'Xanh dương',128,29500000,1,'images/product/iphone-12-pro-max-xanh-duong.jpg'),(5,'Bạc',256,32000000,1,'images/product/iphone-12-pro-max-bac.jpg'),(6,'Vàng ',256,32000000,1,'images/product/iphone-12-pro-max-vang.jpg'),(7,'Xám',256,32000000,1,'images/product/iphone-12-pro-max_2__7.jpg'),(9,'Bạc',512,38500000,1,'images/product/iphone-12-pro-max-bac.jpg'),(10,'Vàng ',512,38500000,1,'images/product/iphone-12-pro-max-vang.jpg'),(12,'Xám',512,38500000,1,'images/product/iphone-12-pro-max_2__7.jpg'),(14,'Vàng',512,36990000,2,'images/product/iphone-12-pro-max-vang.jpg'),(15,'Đen',512,36990000,2,'images/product/iphone-12-pro-max-den.jpg'),(16,'Đen',64,26000000,2,'images/product/iphone-12-pro-max-den.jpg'),(17,'Vàng',64,26000000,2,'images/product/iphone-11-pro-max-vang.jpg'),(18,'Bạc',64,26000000,2,'images/product/iphone-11-pro-max-trang.jpg'),(20,'Đen',256,32000000,2,'images/product/iphone-12-pro-max-den.jpg'),(21,'Vàng',256,32000000,2,'images/product/iphone-11-pro-max-vang.jpg'),(22,'Bạc',256,32000000,2,'images/product/iphone-11-pro-max-trang.jpg'),(35,'Đỏ',256,16990000,4,'images/product/iphone-xr.jpg'),(24,'Trắng',64,15800000,3,'images/product/iphone-11-trang.jpg'),(25,'Đỏ',64,15800000,3,'images/product/iphone-11-do.jpg'),(26,'Vàng',64,15800000,3,'images/product/iphone-11-vang.jpg'),(27,'Tím',64,15800000,3,'images/product/iphone-11-tim.jpg'),(28,'Trắng',128,18000000,3,'images/product/iphone-11-trang.jpg'),(29,'Đỏ',128,18000000,3,'images/product/iphone-11-do.jpg'),(30,'Vàng',128,18000000,3,'images/product/iphone-11-vang.jpg'),(31,'Tím',128,18000000,3,'images/product/iphone-11-tim.jpg'),(32,'Đỏ',256,21900000,3,'images/product/iphone-11-do.jpg'),(33,'Vàng',256,21900000,3,'images/product/iphone-11-vang.jpg'),(34,'Tím',256,21900000,3,'images/product/iphone-11-tim.jpg'),(38,'Đỏ',64,21900000,6,'images/product/iphone-12-do.jpg'),(37,'Trắng',128,22000000,5,'images/product/iphone-12-xanh.jpg'),(40,'Vàng Đồng',256,20990000,21,'images/product/samsung-ultra-5g.jpg'),(41,'Đen',256,20990000,21,'images/product/samsung-ultra-5g-den.jpg'),(42,'Vàng Đồng',512,25990000,21,'images/product/samsung-ultra-5g.jpg'),(43,'Bạc',128,30500000,22,'images/product/samsung-galaxy-s21-ultra.jpg'),(44,'Tím',128,8500000,23,'images/product/samsung-galaxy-a52-tim.jpg'),(45,'Vàng Đồng',128,19000000,26,'images/product/SS20-vang-dong.jpg'),(46,'Bạc',128,25000000,24,'images/product/samsung-galaxy-s21-plus-bac.jpg'),(47,'Xanh',256,10500000,25,'images/product/samsung-galaxy-s21-plus-bac.jpg'),(48,'Trắng',128,5900000,27,'images/product/samsung-galaxy-a32-trang.jpg'),(49,'Vàng Đồng',256,47500000,28,'images/product/galaxy-z-fold2-5g-vang-dong.jpg'),(50,'Đỏ',64,3300000,29,'images/product/samsung-galaxy-a02s-do.jpg'),(51,'Xanh Rêu',256,15000000,30,'images/product/SSNOTE20-XANH.jpg'),(52,'Tím',128,5350000,31,'images/product/ssA31-TIM.jpg'),(53,'Xanh',128,4600000,32,'images/product/xiaomi-redmi-note-10-trang.jpg'),(55,'Vàng Đồng',64,6900000,33,'images/product/xiaomi-redmi-note-10-pro-cam.jpg'),(56,'Xanh Dương',128,18490000,34,'images/product/xiaomi-mi-11-lite-5g-xanh.jpg'),(57,'Tím',64,6790000,35,'images/product/xiaomi-poco-x3-pro-2.jpg'),(58,'Xanh Lá',64,4090000,36,'images/product/xiaomi-redmi-note-10_1_1_1.jpg'),(59,'Xanh Dương',32,1900000,37,'images/product/redmi_9a_0002_layer_1_1.jpg'),(60,'Bạc',128,9990000,38,'images/product/xiaomi-mi-10t-pro_2__3.jpg'),(61,'Đen',128,11200000,39,'images/product/xiaomi-mi-10t-pro_1__1.jpg'),(62,'Đen',128,15000000,7,'images/product/img-apple-main_copy_2_8.jpg'),(63,'Đen',32,9990000,8,'images/product/iphone-7-plus (1).jpg'),(64,'Đen',128,13900000,7,'images/product/img-apple-main_copy_2_8.jpg'),(65,'Đen',32,9990000,8,'images/product/iphone-7-plus (1).jpg'),(66,'Đỏ',256,13390000,9,'images/product/iphone-se-2020_1__4.jpg'),(71,'Xanh',128,27990000,47,'images/product/iphone-12-pro-max-xanh-duong.jpg'),(72,'Đen',256,26990000,48,'images/product/iphone-12-pro-max-den.jpg'),(73,'Đen',4,1690000,49,'images/product/nokia8000.jpg');
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
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,'2021-05-04',1,1,3,3,'77 Nguyễn Huệ, Huế','Chung Thái ','Giao hàng lúc 11h trưa tại cổng trước ĐH Khoa Học Huế','123456700'),(2,'2021-05-04',1,1,3,7,'70 Nguyễn Lương Bằng, Huế','Trần Hồng Thức','','123456789'),(3,'2021-05-04',1,1,2,2,'7 Tản Đà, Huế','Trần Văn Nam','Giao hàng lúc 11h trưa tại cổng trước ĐH Khoa Học Huế','123456782'),(4,'2021-04-04',1,1,3,7,'70 Nguyễn Lương Bằng, Huế','Trần Hồng Thức','Test trang thái đơn hàng','123456789'),(5,'2021-05-05',1,1,3,3,'3 Đinh Tiên Hoàng, Huế','Chung Thái ','','123456700'),(6,'2021-05-05',1,1,4,3,'3 Đinh Tiên Hoàng, Huế','Trần Đại Cường','Giao hàng lúc 11h trưa tại cổng trước ĐH Khoa Học Huế','123456700'),(7,'2021-05-10',1,1,2,3,'3 Đinh Tiên Hoàng, Huế','Trần Đại Cường','Giao hàng lúc 11h trưa tại cổng trước ĐH Khoa Học Huế','0988617210'),(8,'2021-05-12',1,1,3,3,'77 Nguyễn Huệ, Huế','Trần Đại Cường','Giao hàng lúc 10h tại cổng trước ĐH Khoa Học','123456700'),(9,'2021-05-13',1,1,2,3,'77 Nguyễn Huệ, Huế','Nguyễn Sanh Trưng','Giao hàng lúc 11h - 13h ','123456711'),(10,'2021-05-13',1,1,5,7,'77 Nguyễn Huệ, Huế','Nguyễn Sanh Trưng','Giao hàng lúc 11h - 13h ','0366422648'),(11,'2021-05-13',1,1,1,7,'77 N','Nguyễn Sanh Trưng','','0988617215'),(12,'2021-05-13',1,1,3,7,'70 Nguyễn Lương Bằng, Huế','Nguyễn Sanh Trưng','','1111111111'),(13,'2021-05-13',1,1,1,7,'70 Nguyễn Lương Bằng, Huế','Nguyễn Sanh Trưng','','1111111111'),(14,'2021-05-13',1,1,3,7,'70 Nguyễn Lương Bằng, Huế','Nguyễn Sanh Trưng','','1111111111'),(15,'2021-05-13',1,1,3,7,'70 Nguyễn Lương Bằng, Huế','Nguyễn Sanh Trưng','','841234567890'),(16,'2021-05-13',1,1,3,1,'30 Lý Liên Kiệt, Huế','Trần Đức Dương','','0312345678'),(17,'2021-05-15',1,1,3,10,'77 Hùng Vương, Huế','Nguyễn B','Giao hàng từ 11h - 13h','0723456789'),(18,'2021-05-16',1,1,3,10,'77 Nguyễn Huệ','Nguyễn B','','0723456789'),(19,'2021-05-16',1,1,3,10,'77 Hùng Vương, Huế','Nguyễn B','','0723456789'),(20,'2021-05-16',1,1,3,10,'77 Nguyễn Huệ','Nguyễn B','','0723456789'),(21,'2021-05-16',1,1,1,10,'77 Nguyễn Huệ','Nguyễn B','','0723456789'),(22,'2021-05-17',1,1,3,11,'77 Nguyễn Huệ, Huế','Nguyễn A','Giao hàng vào lúc 11h - 13h','0323456789'),(23,'2021-05-21',1,1,3,12,'27 Nguyễn Huệ, Huế','Nguyễn A','Giao vào hàng vào lúc 11h - 13h các ngày trong tuần.','0723456789'),(24,'2021-05-22',1,1,3,13,'28 Nguyễn Huệ, Huế','Nguyễn Văn Chung','Giao hàng từ lúc 12h - 13h, các ngày trong tuần','0723456789'),(25,'2021-05-22',1,1,3,15,'77 Nguyễn Huệ, Huế','Nguyễn Văn A','Giao hàng lúc 12h-13h','0323456789'),(26,'2021-05-22',1,1,3,8,'28 Nguyễn Huệ, Huế','Nguyễn A','Giao hàng từ 12h - 13h','0366426488'),(27,'2021-05-22',1,1,3,8,'28 Tản Đà, Huế','Nguyễn A','Giao hàng vào lúc 12h - 13h','0366426488'),(28,'2021-05-22',1,1,3,2,'7 Tản Đà, Huế','Trần Văn Nam','Giao hàng lúc 12h  - 13h','0323456782'),(29,'2021-05-22',1,1,3,16,'77 Nguyễn Huệ, Huế','Nguyễn Văn Quốc','Giao hàng vào lúc 12h -13h','0323456789'),(30,'2021-05-22',1,1,2,16,'28 Tản Đà, Huế','Nguyễn Văn Quốc','','0323456789');
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
  KEY `FK5t3yaodc1d5pcfqldu9bv2ftq` (`PURCHASE_ID`),
  KEY `INDEX_PURCHASE_DETAIL_ID` (`PURCHASE_DETAIL_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_detail`
--

LOCK TABLES `purchase_detail` WRITE;
/*!40000 ALTER TABLE `purchase_detail` DISABLE KEYS */;
INSERT INTO `purchase_detail` VALUES (1,1,38500000,1,12,1),(3,1,38500000,1,12,2),(6,2,36990000,2,15,5),(7,1,29500000,1,3,6),(8,1,20990000,21,41,4),(9,2,29500000,1,2,7),(10,1,29500000,1,3,8),(11,1,32000000,1,5,9),(12,1,10500000,25,47,10),(13,1,15800000,3,25,11),(14,4,15800000,3,24,12),(15,3,25000000,24,46,14),(17,5,15000000,30,51,16),(18,1,29500000,1,2,17),(19,1,29500000,1,2,15),(20,2,29500000,1,3,15),(21,1,38500000,1,10,18),(22,1,11200000,39,61,19),(23,2,32000000,1,7,20),(24,2,38500000,1,10,22),(25,1,29500000,1,1,23),(26,1,32000000,1,6,24),(27,1,29500000,1,2,25),(28,1,32000000,1,5,26),(29,1,32000000,1,6,27),(30,1,32000000,1,6,28),(31,2,32000000,1,5,29),(32,1,29500000,1,2,30),(33,1,29500000,1,4,30),(34,1,32000000,1,6,30);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_status`
--

LOCK TABLES `purchase_status` WRITE;
/*!40000 ALTER TABLE `purchase_status` DISABLE KEYS */;
INSERT INTO `purchase_status` VALUES (1,'Chờ xác nhận'),(2,'Đang giao hàng'),(3,'Đã giao'),(4,'Hủy đơn hàng'),(5,'Đang xử lý');
/*!40000 ALTER TABLE `purchase_status` ENABLE KEYS */;
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
  `STATUS_USER` int DEFAULT '1',
  PRIMARY KEY (`USER_ID`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'images/account/avt.jpg','1999-10-10','a@email.com','Trần Đức Dương','Nam','ad17b460ce87deba47d925fa26fe9520','123456789','ROLE_USER','user3','30 Lý Liên Kiệt, Huế',1),(2,'images/account/avt.jpg','1999-10-20','B@email.com','Trần Văn Nam','Nam','ad17b460ce87deba47d925fa26fe9520','123456782','ROLE_USER','user2','7 Tản Đà, Huế',1),(3,'images/account/avt.jpg','1998-10-20','c@email.com','Trần Đại Cường','Nữ','ad17b460ce87deba47d925fa26fe9520','123456700','ROLE_USER','user','3 Đinh Tiên Hoàng, Huế',1),(4,'images/account/avt.jpg','1998-10-20','c@email.com','Trần Thị B','Nữ','ad17b460ce87deba47d925fa26fe9520','123456700','ROLE_USER','nvd','1 Nguyễn Huệ, Huế',1),(5,'images/account/avt.jpg','2020-10-10','bc@gmail.com','Thanh Trúc','Nữ','ad17b460ce87deba47d925fa26fe9520','0723456189','ROLE_USER','user4','40 Hùng Vương. Huế',1),(7,'images/avatar-user-default.png','1999-10-20','admin12@gamil.com','Nguyễn Sanh Trưng','Nam','ad17b460ce87deba47d925fa26fe9520','0323456789','ROLE_ADMIN','admin','70 Nguyễn Lương Bằng, Huế',1),(8,'images/account/20210515-1840-gmlr48.jpg','1999-03-16','a@gmail.com','Nguyễn A','Nam','951f74a9c08795dac3ae4393479341bf','0366426488','ROLE_USER','nst163','77 Nguyễn Huệ, Huế',1),(6,'images/account/avt.jpg','1999-10-20','admin@gamil.com','Thanh Trúc','Nữ','ad17b460ce87deba47d925fa26fe9520','123456789','ROLE_USER','user5','70 Nguyễn Lương Bằng, Huế',1),(9,'images/account/20210515-1848-6s62e7.jpg','1999-03-16','a@gmail.com','Nguyễn A','Nam','951f74a9c08795dac3ae4393479341bf','0323456789','ROLE_USER','nst16399','77 Nguyễn Huệ, Huế',1),(10,'images/account/20210515-2153-7tmae3.jpg','1999-03-19','a@gmail.com','Nguyễn B','Nam','951f74a9c08795dac3ae4393479341bf','0723456789','ROLE_USER','nst16311','77 Nguyễn Huệ',1),(11,'images/account/20210521-1130-14f97l.png','1999-03-06','a@gmail.com','Nguyễn A','Nam','951f74a9c08795dac3ae4393479341bf','0323456789','ROLE_USER','nva123','77 Nguyễn Trãi',1),(12,'images/account/20210521-2232-9gub5u.jpg','1999-03-16','a@gmail.com','Nguyễn A','Nam','951f74a9c08795dac3ae4393479341bf','0723456789','ROLE_USER','test1','3 Tản Đà, Huế',1),(13,'images/account/20210522-0140-do8rpu.jpg','1999-03-16','n@gmail.com','Nguyễn Văn Chung','Nam','951f74a9c08795dac3ae4393479341bf','0723456789','ROLE_USER','nvc123','72 Tản Đà, Huế',0),(14,'images/account/20210522-0201-svhdgc.jpg','1999-03-16','s@gmail.com','test2','Nam','951f74a9c08795dac3ae4393479341bf','0323456789','ROLE_USER','test2','27 Tản Đà, Huế',1),(15,'images/account/20210522-0338-1tof1j.jpg','1999-03-16','nva@gmail.com','Nguyễn Văn A','Nam','951f74a9c08795dac3ae4393479341bf','0323456789','ROLE_USER','nva1234','27 Tản Đà, Huế',1),(16,'images/account/20210522-0634-tm2gej.jpg','1999-04-16','a@gmail.com','Nguyễn Văn Quốc','Nam','951f74a9c08795dac3ae4393479341bf','0323456789','ROLE_USER','nvq123','28 Tản Đà, Huế',1);
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

-- Dump completed on 2021-05-22 14:41:57


--
-- Table structure for table `MONTH_TABLE`
--

DROP TABLE IF EXISTS `MONTH_TABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MONTH_TABLE` (
                               `MONTH_NUMBER` int NOT NULL,
                               `MONTH_NAME` varchar(45) DEFAULT NULL,
                               PRIMARY KEY (`MONTH_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MONTH_TABLE`
--

LOCK TABLES `MONTH_TABLE` WRITE;
/*!40000 ALTER TABLE `MONTH_TABLE` DISABLE KEYS */;
INSERT INTO `MONTH_TABLE` VALUES (1,'January'),(2,'February'),(3,'March'),(4,'April'),(5,'May'),(6,'June'),(7,'July'),(8,'August'),(9,'Steptember'),(10,'October'),(11,'November'),(12,'December');
/*!40000 ALTER TABLE `MONTH_TABLE` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;