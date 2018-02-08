-- MySQL dump 10.13  Distrib 5.5.53, for Win32 (AMD64)
--
-- Host: localhost    Database: diancan
-- ------------------------------------------------------
-- Server version	5.5.53

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `diancan_order`
--

DROP TABLE IF EXISTS `diancan_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diancan_order` (
  `orderid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增订单id',
  `uname` varchar(100) NOT NULL COMMENT '服务员名字',
  `uworknum` varchar(100) NOT NULL COMMENT '服务员工号',
  `ordertable` int(10) NOT NULL COMMENT '下订单的桌位',
  `ordertablestate` int(10) NOT NULL COMMENT '桌子的使用状态',
  `ordertime` varchar(100) NOT NULL COMMENT '下订单的时间',
  `ordernum` varchar(100) NOT NULL COMMENT '订单号',
  `orderstate` int(10) NOT NULL COMMENT '订单状态  下单：1   作废：2 支付：3',
  PRIMARY KEY (`orderid`)
) ENGINE=MyISAM AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diancan_order`
--

LOCK TABLES `diancan_order` WRITE;
/*!40000 ALTER TABLE `diancan_order` DISABLE KEYS */;
INSERT INTO `diancan_order` VALUES (173,'','',1,1,'','20180206093852',0),(174,'','',1,1,'','20180206095121',0),(172,'','',1,1,'','20180206083737',0);
/*!40000 ALTER TABLE `diancan_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diancan_user`
--

DROP TABLE IF EXISTS `diancan_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diancan_user` (
  `uid` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) NOT NULL,
  `upassword` varchar(100) NOT NULL,
  `uworknum` varchar(100) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diancan_user`
--

LOCK TABLES `diancan_user` WRITE;
/*!40000 ALTER TABLE `diancan_user` DISABLE KEYS */;
INSERT INTO `diancan_user` VALUES (1,'admin','admin007','admin'),(3,'yuwenkai','123456','1000phone'),(2,'qianfeng','1721','1000phone');
/*!40000 ALTER TABLE `diancan_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eatfood`
--

DROP TABLE IF EXISTS `eatfood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eatfood` (
  `eatid` int(10) NOT NULL AUTO_INCREMENT COMMENT '二级分类自增id',
  `eatname` varchar(100) NOT NULL COMMENT '二级酸，甜，苦，辣',
  `classtype` int(10) NOT NULL COMMENT '对应主菜系下面各有口味',
  `eattype` int(10) NOT NULL COMMENT '主食 菜品的分类 主食：1 菜品 ：2 甜点：3 汤：4 其他：5',
  `eatsrc` varchar(255) DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`eatid`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eatfood`
--

LOCK TABLES `eatfood` WRITE;
/*!40000 ALTER TABLE `eatfood` DISABLE KEYS */;
INSERT INTO `eatfood` VALUES (1,'主食',1,1,'http://i3.meishichina.com/attachment/recipe/2018/01/25/20180125151685672539313.jpg@!c320'),(2,'甜点',1,2,'http://i3.meishichina.com/attachment/recipe/2018/01/25/20180125151685638093213.jpg@!c320'),(3,'糖水',1,5,'http://i3.meishichina.com/attachment/recipe/2018/01/25/20180125151685825127113.jpg@!c640'),(4,'汤',1,3,'http://i3.meishichina.com/attachment/recipe/2018/01/25/20180125151685695976913.jpg@!c640'),(5,'主食',2,1,'http://i3.meishichina.com/attachment/recipe/2018/01/25/20180125151685704095913.jpg@!c640'),(6,'菜品',2,2,'http://i3.meishichina.com/attachment/recipe/2018/01/25/20180125151685638093213.jpg@!c640'),(7,'汤',2,4,'http://i3.meishichina.com/attachment/recipe/2018/01/25/20180125151684800422813.jpg@!c640'),(8,'主食',3,1,'http://i3.meishichina.com/attachment/recipe/2018/01/25/20180125151684806048613.jpg@!c640'),(9,'菜品',3,2,'http://i3.meishichina.com/attachment/recipe/2018/01/25/20180125151684720412913.jpg@!c640'),(10,'粥',3,5,'http://i3.meishichina.com/attachment/recipe/2018/01/25/20180125151684576381613.jpg@!c640'),(11,'菜品',4,2,'http://i3.meishichina.com/attachment/recipe/2018/01/25/20180125151684550245113.jpg@!c640'),(12,'饮料',4,5,'http://i3.meishichina.com/attachment/recipe/2018/01/25/20180125151684744186413.jpg@!c640'),(13,'主食',4,1,'http://i3.meishichina.com/attachment/recipe/2018/01/25/20180125151684508777313.jpg@!c640'),(14,'主食',5,1,'http://i3.meishichina.com/attachment/recipe/2018/01/21/20180121151653602263213.jpg@!c320'),(15,'菜品',5,2,'http://i3.meishichina.com/attachment/recipe/2018/01/22/20180122151658848221113.jpg@!c320'),(16,'汤',5,4,'http://i3.meishichina.com/attachment/recipe/2018/01/22/20180122151662416528513.jpg@!c320');
/*!40000 ALTER TABLE `eatfood` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fooddetail`
--

DROP TABLE IF EXISTS `fooddetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fooddetail` (
  `foodid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `classtype` int(10) NOT NULL COMMENT '属于哪个菜系',
  `eattype` int(10) NOT NULL COMMENT '属于主食：菜品，甜点，汤，其他',
  `foodname` varchar(100) NOT NULL COMMENT '食物的名字',
  `foodprice` int(10) NOT NULL COMMENT '食品的价格',
  `foodstart` int(10) NOT NULL COMMENT '食品的星级评价 5 分制',
  `foodsrc` varchar(100) DEFAULT NULL COMMENT '食品的图片的地址',
  `foodcount` int(10) NOT NULL COMMENT '本食品 饭店的备份',
  `hotfood` int(10) DEFAULT NULL COMMENT '是否新品上市  新品：1，店长推荐：2',
  `realStock` int(3) NOT NULL COMMENT '实际最大库存',
  PRIMARY KEY (`foodid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fooddetail`
--

LOCK TABLES `fooddetail` WRITE;
/*!40000 ALTER TABLE `fooddetail` DISABLE KEYS */;
INSERT INTO `fooddetail` VALUES (1,1,2,'湖南小炒肉',28,4,'http://i3.meishichina.com/attachment/magic/2018/01/26/20180126151693267659613.jpg',20,1,10),(2,1,2,'香味小烧茄子',15,4,'http://i3.meishichina.com/attachment/magic/2017/12/13/20171213151313201911713.jpg',19,2,10),(3,1,1,'湖南蛋炒饭',12,3,'http://i3.meishichina.com/attachment/recipe/2018/01/26/20180126151696606621513.jpg@!c640',30,NULL,10),(4,1,3,'冰糖湘莲',25,5,'http://i3.meishichina.com/attachment/recipe/2018/01/26/20180126151696735993913.jpg@!c640',10,NULL,100),(5,1,4,'湘鱼汤',30,3,'http://i3.meishichina.com/attachment/recipe/2018/01/26/20180126151696581638213.jpg@!c640',5,1,10),(6,1,5,'雪碧',5,4,'http://i3.meishichina.com/attachment/recipe/2018/01/26/20180126151696029325813.jpg@!c640',100,NULL,100),(9,2,2,'东坡肉',40,4,'http://i3.meishichina.com/attachment/recipe/2018/01/26/20180126151695998961413.jpg@!c640',20,2,10),(10,2,2,' 叫花鸡',35,5,'http://i3.meishichina.com/attachment/recipe/2018/01/26/20180126151695958055313.jpg@!c640',12,1,10),(11,2,1,'紫菜海蛎面',14,4,'http://i3.meishichina.com/attachment/recipe/2018/01/26/20180126151695697585513.jpg@!c640',40,NULL,10),(12,2,4,'鸡蛋豆苗汤',8,3,'http://i3.meishichina.com/attachment/recipe/2018/01/26/20180126151695697585513.jpg@!c640',10,NULL,10),(13,3,1,'闽南鱼头饭',16,4,'http://i3.meishichina.com/attachment/recipe/2018/01/26/20180126151695359087213.jpg@!c640',20,1,10),(14,3,2,'泉州醋肉',35,4,'http://i3.meishichina.com/attachment/recipe/2017/12/13/20171213151317706534713.jpg@!c320',30,NULL,10),(15,3,5,'花生仁汤',4,4,'http://i3.meishichina.com/attachment/recipe/2017/12/13/20171213151317686057113.jpg@!c320',5,2,10),(16,3,2,'八宝芋泥',16,3,'http://i3.meishichina.com/attachment/recipe/2017/12/13/20171213151317603454213.jpg@!c320',5,NULL,10),(17,4,1,'鱼汤小刀面',20,4,'http://i3.meishichina.com/attachment/recipe/2017/12/13/20171213151314789637313.jpg@!c320',34,1,10),(18,4,2,'清炖兔子',33,3,'http://i3.meishichina.com/attachment/recipe/2017/12/11/20171211151296944589413.jpg@!c320',10,NULL,10),(19,4,2,'香脆油爆虾',12,4,'http://i3.meishichina.com/attachment/recipe/2017/12/08/20171208151270261381513.jpg@!c320',9,2,10),(20,4,5,'瓜皮排骨煲',24,5,'http://i3.meishichina.com/attachment/recipe/2017/12/08/20171208151270006027713.jpg@!c320',24,2,10);
/*!40000 ALTER TABLE `fooddetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mainclass`
--

DROP TABLE IF EXISTS `mainclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mainclass` (
  `classid` int(10) NOT NULL AUTO_INCREMENT COMMENT '表id自增长',
  `classname` varchar(100) NOT NULL COMMENT '主分类 菜系名字',
  `classtype` int(10) NOT NULL COMMENT ' 这是主菜系的分类编号',
  `state` int(1) DEFAULT NULL COMMENT '状态',
  `describe` text COMMENT '菜系描述',
  PRIMARY KEY (`classid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mainclass`
--

LOCK TABLES `mainclass` WRITE;
/*!40000 ALTER TABLE `mainclass` DISABLE KEYS */;
INSERT INTO `mainclass` VALUES (1,'湘菜',1,0,'湘菜是湖南菜，毛大大爱吃'),(2,'浙江',2,0,'浙江其实是浙江菜的意思，也好吃'),(3,'闽菜',3,0,'闽菜是福建菜，比较清淡'),(4,'苏菜',4,0,'素菜油而不腻'),(5,'粤菜',5,0,'粤菜是广东菜，鲜内爽滑'),(6,'川菜',6,0,'川菜麻辣'),(7,'鲁菜',7,0,'鲁菜需要炖的时间长点'),(8,'徽菜',8,0,'徽菜不太了解');
/*!40000 ALTER TABLE `mainclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_fushu`
--

DROP TABLE IF EXISTS `order_fushu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_fushu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ordertable` int(10) NOT NULL COMMENT '下订单的桌子',
  `ordernum` varchar(100) NOT NULL,
  `foodid` int(10) NOT NULL COMMENT '菜品的唯一ID',
  `foodnum` int(2) NOT NULL COMMENT '食品的数量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=368 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_fushu`
--

LOCK TABLES `order_fushu` WRITE;
/*!40000 ALTER TABLE `order_fushu` DISABLE KEYS */;
INSERT INTO `order_fushu` VALUES (357,1,'20180205220649',2,1),(358,1,'20180205222455',1,1),(359,1,'20180206083737',3,1),(362,1,'20180206093852',2,2),(365,1,'20180206095121',2,4),(356,1,'20180205220649',1,1),(355,1,'20180205220649',3,3),(315,1,'20180205213513',3,1),(307,1,'20180205205934',11,1),(273,1,'20180202180111',3,4),(274,1,'20180202180111',11,9),(275,1,'20180202180111',13,9),(305,1,'20180205141616',15,1),(303,1,'20180203151201',13,1),(301,1,'20180203151201',11,1),(292,1,'20180203142803',13,1),(300,1,'20180203151201',3,5),(251,1,'20180201142704',3,9),(252,1,'20180201163610',11,2),(253,1,'20180201172012',3,0),(254,1,'20180201173702',3,1),(255,1,'20180201173725',3,0),(256,1,'20180201173908',1,0),(257,1,'20180201173908',3,4),(258,1,'20180201174622',3,6),(259,1,'20180201174835',3,4),(260,1,'20180201181520',3,13),(272,1,'20180202164932',3,6),(265,1,'20180201224418',1,1),(264,1,'20180201224418',3,10);
/*!40000 ALTER TABLE `order_fushu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templateorder`
--

DROP TABLE IF EXISTS `templateorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templateorder` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `temorder` varchar(100) NOT NULL COMMENT '临时订单表 的订单号 和正式下单的一样',
  `ordertable` int(10) NOT NULL COMMENT '订单产生的桌号',
  `tablestate` int(2) NOT NULL COMMENT '下单的桌子是否被占用',
  `foodid` int(10) NOT NULL COMMENT '添加的菜品 的唯一ID',
  `foodnum` int(10) NOT NULL COMMENT '添加的菜品的数量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templateorder`
--

LOCK TABLES `templateorder` WRITE;
/*!40000 ALTER TABLE `templateorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `templateorder` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-06 11:10:39
