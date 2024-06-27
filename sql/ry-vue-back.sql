-- MySQL dump 10.13  Distrib 8.4.0, for Win64 (x86_64)
--
-- Host: 47.97.16.248    Database: ry-vue
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auction_record`
--

DROP TABLE IF EXISTS `auction_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auction_record` (
  `RecordID` int DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  `DataID` varchar(255) DEFAULT NULL,
  `AuctionTime` datetime DEFAULT NULL,
  `WinningPrice` decimal(10,2) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction_record`
--

LOCK TABLES `auction_record` WRITE;
/*!40000 ALTER TABLE `auction_record` DISABLE KEYS */;
INSERT INTO `auction_record` VALUES (1,3,'103','2023-12-08 17:40:22',15.00,'成功'),(2,3,'104','2023-12-14 16:28:47',15.00,'成功');
/*!40000 ALTER TABLE `auction_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auction_user`
--

DROP TABLE IF EXISTS `auction_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auction_user` (
  `UserID` varchar(255) DEFAULT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Balance` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auction_user`
--

LOCK TABLES `auction_user` WRITE;
/*!40000 ALTER TABLE `auction_user` DISABLE KEYS */;
INSERT INTO `auction_user` VALUES ('1','小鸭家电','123','123@123','10'),('2','比亚迪','123','123@123','10'),('3','超威电池','123','123@123','12');
/*!40000 ALTER TABLE `auction_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid`
--

DROP TABLE IF EXISTS `bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid` (
  `BidID` int DEFAULT NULL COMMENT '出价编号',
  `UserID` int DEFAULT NULL COMMENT '用户编号',
  `DataID` int DEFAULT NULL COMMENT '数据编号',
  `BidTime` datetime DEFAULT NULL COMMENT '出价时间',
  `BidAmount` varchar(255) DEFAULT NULL COMMENT '出价价格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid`
--

LOCK TABLES `bid` WRITE;
/*!40000 ALTER TABLE `bid` DISABLE KEYS */;
INSERT INTO `bid` VALUES (1,1,102,'2023-12-07 17:39:03','6'),(2,2,102,'2023-12-07 18:39:32','7'),(3,3,103,'2023-12-08 17:40:22','15'),(4,3,104,'2023-12-08 17:40:22','15');
/*!40000 ALTER TABLE `bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bid_company_group`
--

DROP TABLE IF EXISTS `bid_company_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bid_company_group` (
  `BidId` int NOT NULL AUTO_INCREMENT COMMENT '出价编号',
  `UserName` varchar(255) DEFAULT NULL COMMENT '用户姓名',
  `AuctionId` int DEFAULT NULL COMMENT '拍卖编号',
  `BidTime` datetime DEFAULT NULL COMMENT '出价时间',
  `BidAmount` varchar(255) DEFAULT NULL COMMENT '出价金额',
  `selected` varchar(255) NOT NULL DEFAULT '0' COMMENT '是否被选中',
  `selectedDate` datetime DEFAULT NULL COMMENT '选中日期',
  PRIMARY KEY (`BidId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='企业群形成出价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bid_company_group`
--

LOCK TABLES `bid_company_group` WRITE;
/*!40000 ALTER TABLE `bid_company_group` DISABLE KEYS */;
INSERT INTO `bid_company_group` VALUES (1,'小鸭集团',1,'2024-01-09 13:55:43','34','1','2024-04-18 02:49:25'),(2,'比亚迪',2,'2024-01-10 16:56:12','23','1','2024-04-18 02:50:20'),(3,'南孚电池',2,'2024-01-06 13:56:37','31','1','2024-01-12 11:13:32'),(4,'玲珑轮胎',2,'2024-01-27 14:37:55','12','0','2024-01-10 13:07:33'),(22,'1月之内生产100辆比亚迪宋汽车',4,'2024-01-10 09:54:25','32','1','2024-01-10 11:07:42'),(23,'创新设计公司',5,'2024-01-10 10:16:12','23','1','2024-01-10 12:47:35'),(24,'比亚迪汽车',1,'2024-01-10 11:32:24','0','0',NULL),(25,'首都钢铁公司',2,'2024-01-10 12:38:33','24','0','2024-01-10 13:07:35'),(26,'小鸭集团',3,'2024-01-10 19:14:55','25','0',NULL),(27,'小鸭集团',3,'2024-01-10 19:15:39','24','0',NULL),(28,'小鸭集团',3,'2024-01-10 20:20:12','13','0',NULL),(29,'小鸭集团',5,'2024-01-11 14:34:53','12','0',NULL),(30,'小鸭集团',6,'2024-01-11 16:32:01','15','0',NULL),(31,'小鸭集团',3,'2024-01-12 11:16:20','12','0',NULL),(32,'小鸭集团',6,'2024-01-12 14:17:07','12','0',NULL),(33,'小鸭集团',1,'2024-04-16 20:28:42','1','0',NULL),(34,'小鸭集团',1,'2024-04-18 16:20:25','77','0',NULL);
/*!40000 ALTER TABLE `bid_company_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chain`
--

DROP TABLE IF EXISTS `chain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chain` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '产业链编号',
  `name` varchar(20) DEFAULT NULL COMMENT '产业链名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='产业链';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chain`
--

LOCK TABLES `chain` WRITE;
/*!40000 ALTER TABLE `chain` DISABLE KEYS */;
INSERT INTO `chain` VALUES (1,'洗衣机产业链'),(2,'空调产业链'),(3,'汽车产业链'),(4,'冰箱产业链');
/*!40000 ALTER TABLE `chain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coalition`
--

DROP TABLE IF EXISTS `coalition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coalition` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '联盟编号',
  `name` varchar(20) DEFAULT NULL COMMENT '联盟名称',
  `task_id` int DEFAULT NULL COMMENT '联盟任务编号',
  `create_time` datetime DEFAULT NULL COMMENT '联盟创建时间',
  `coalition_status` int DEFAULT '1' COMMENT '联盟状态（0异常，1工作，2空闲）',
  `mode` int DEFAULT '0' COMMENT '联盟模式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='企业联盟表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coalition`
--

LOCK TABLES `coalition` WRITE;
/*!40000 ALTER TABLE `coalition` DISABLE KEYS */;
INSERT INTO `coalition` VALUES (1,'联盟1',17,NULL,0,0),(2,'联盟2',11,NULL,2,0),(3,'联盟3',8,NULL,2,0),(4,'联盟4',13,NULL,2,0),(45,'联盟45',1,'2024-04-28 21:16:26',1,0),(46,'联盟46',3,'2024-04-28 21:16:41',1,0),(47,'联盟47',31,'2024-04-28 21:17:09',1,0),(48,'联盟48',34,'2024-04-28 21:17:17',1,0),(49,'联盟49',37,'2024-04-28 21:17:41',1,0),(50,'联盟50',57,'2024-04-28 21:17:44',1,0),(51,'联盟51',14,'2024-04-28 21:42:13',1,0);
/*!40000 ALTER TABLE `coalition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coalition_company`
--

DROP TABLE IF EXISTS `coalition_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coalition_company` (
  `coalition_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `layer_id` int DEFAULT NULL COMMENT '企业所属网络层',
  `date_number` int DEFAULT NULL,
  `actual_number` int DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  `actual_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coalition_company`
--

LOCK TABLES `coalition_company` WRITE;
/*!40000 ALTER TABLE `coalition_company` DISABLE KEYS */;
INSERT INTO `coalition_company` VALUES (1,1,NULL,2800,NULL,'2023-11-23 00:00:00',NULL),(1,2,NULL,2900,NULL,'2023-11-29 00:00:00',NULL),(1,3,NULL,3000,NULL,'2023-11-22 00:00:00',NULL),(1,4,NULL,2300,NULL,'2023-11-23 00:00:00',NULL),(1,5,NULL,2000,NULL,'2023-11-30 00:00:00',NULL),(4,1,NULL,1500,NULL,'2024-01-27 00:00:00',NULL),(4,2,NULL,1200,NULL,'2024-01-27 00:00:00',NULL),(5,10,NULL,900,NULL,'2024-01-27 00:00:00',NULL),(5,11,NULL,789,NULL,'2024-01-27 00:00:00',NULL),(5,12,NULL,1566,NULL,'2024-01-27 00:00:00',NULL),(6,13,NULL,1500,NULL,'2024-01-27 00:00:00',NULL),(17,1,NULL,NULL,NULL,'2024-04-11 09:08:29',NULL),(17,1,NULL,NULL,NULL,'2024-04-11 09:08:29',NULL),(17,1,NULL,NULL,NULL,'2024-04-11 09:08:29',NULL),(17,1,NULL,NULL,NULL,'2024-04-11 09:08:29',NULL),(18,1,NULL,NULL,NULL,'2024-04-11 09:18:35',NULL),(18,1,NULL,NULL,NULL,'2024-04-11 09:18:35',NULL),(18,1,NULL,NULL,NULL,'2024-04-11 09:18:35',NULL),(18,1,NULL,NULL,NULL,'2024-04-11 09:18:35',NULL),(19,0,NULL,NULL,NULL,'2024-04-11 09:31:18',NULL),(20,0,NULL,NULL,NULL,'2024-04-11 10:34:08',NULL),(21,33,NULL,NULL,NULL,'2024-04-11 16:33:28',NULL),(22,14,NULL,NULL,NULL,'2024-04-11 16:35:08',NULL),(23,14,NULL,NULL,NULL,'2024-04-11 16:38:05',NULL),(24,11,NULL,NULL,NULL,'2024-04-11 16:39:42',NULL),(25,11,NULL,NULL,NULL,'2024-04-11 16:40:03',NULL),(26,11,NULL,NULL,NULL,'2024-04-11 16:47:40',NULL),(31,14,NULL,NULL,NULL,'2024-04-17 15:34:02',NULL),(32,6,NULL,NULL,NULL,'2024-04-19 14:45:25',NULL),(31,7,NULL,NULL,NULL,'2024-04-28 09:14:45',NULL),(32,55,NULL,NULL,NULL,'2024-04-28 10:25:10',NULL);
/*!40000 ALTER TABLE `coalition_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_all`
--

DROP TABLE IF EXISTS `company_all`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_all` (
  `id` int NOT NULL COMMENT '企业编号',
  `layer_id` int NOT NULL COMMENT '产业链网络层编号',
  `company_type` int DEFAULT NULL COMMENT '企业在产业链所在阶段（原料供应，零件生产，整机组装，销售和回收）',
  `name` varchar(20) DEFAULT NULL COMMENT '企业名称',
  `address` varchar(20) DEFAULT '济南' COMMENT '企业地址',
  `group_id` int DEFAULT '0' COMMENT '所属企业群id',
  `coalition_id` int DEFAULT '0',
  `process_rate` int DEFAULT NULL COMMENT '任务完成速率',
  `rep` double DEFAULT '0.5' COMMENT '企业信誉',
  `status` int DEFAULT '1' COMMENT '企业状态（0异常，1空闲，2工作）',
  `score` double DEFAULT NULL,
  PRIMARY KEY (`layer_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='企业表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_all`
--

LOCK TABLES `company_all` WRITE;
/*!40000 ALTER TABLE `company_all` DISABLE KEYS */;
INSERT INTO `company_all` VALUES (1,1,1,'云南天然橡胶产业股份有限公司','济南',0,46,NULL,1,2,NULL),(2,1,1,'云南瑞华能源有限公司','济南',0,0,NULL,1,1,NULL),(3,1,1,'诺博橡胶制品有限公司','济南',0,0,NULL,1,1,NULL),(4,1,1,'金发科技股份有限公司','济南',0,46,NULL,1,2,NULL),(5,1,1,'佛山佛塑科技集团股份有限公司','济南',0,45,NULL,1,2,NULL),(6,1,1,'武汉新芯继承电路制造有限公司','济南',0,49,NULL,1,2,NULL),(7,1,1,'厦门钨业','济南',0,45,NULL,1,2,NULL),(8,1,1,'青岛爱尔家佳新材料股份有限公司','济南',0,45,NULL,1,2,NULL),(9,1,1,'南京凯乐涂料有限公司','济南',0,49,NULL,1,2,NULL),(10,1,1,'宝山钢铁股份有限公司','济南',0,46,NULL,1,2,NULL),(11,1,1,'中国鞍钢集团公司','济南',0,45,NULL,1,2,NULL),(12,1,1,'南山铝业','济南',0,46,NULL,1,2,NULL),(13,1,1,'金川集团','济南',0,49,NULL,1,2,NULL),(14,1,2,'江苏宏亿精工股份有限公司','济南',0,0,NULL,1,1,NULL),(15,1,2,'山东安耐传动系统有限公司','济南',0,51,NULL,1,2,NULL),(16,1,2,'山东大成塑业有限公司','济南',0,0,NULL,1,1,NULL),(17,1,2,'置信电机','济南',0,51,NULL,1,2,NULL),(18,1,2,'敦泰科技有限公司','济南',0,0,NULL,1,1,NULL),(19,1,2,'江苏昌伟业科技集团有限公司','济南',0,0,NULL,1,1,NULL),(20,1,3,'宁波中威壳体有限公司','济南',0,47,NULL,1,2,NULL),(21,1,2,'众绅机械制造有限公司','济南',0,51,NULL,1,2,NULL),(22,1,2,'宁德时代','济南',0,0,NULL,1,1,NULL),(23,1,2,'常州市永安电机有限公司','济南',0,0,NULL,1,1,NULL),(24,1,3,'山东小鸭集团家电有限公司','济南',0,0,NULL,1,1,NULL),(25,1,3,'美的集团股份有限公司','济南',0,0,NULL,1,1,NULL),(26,1,3,'小天鹅集团','济南',0,0,NULL,1,1,NULL),(27,1,3,'西门子股份公司','济南',0,0,NULL,1,1,NULL),(28,1,3,'格力电器','济南',0,0,NULL,1,1,NULL),(29,1,3,'海尔智家','济南',0,0,NULL,1,1,NULL),(30,1,3,'苏宁电器股份有限公司','济南',0,47,NULL,1,2,NULL),(31,1,3,'国美电器有限公司','济南',0,47,NULL,1,2,NULL),(32,1,3,'京东五星电器集团有限公司','济南',0,0,NULL,1,1,NULL),(33,1,3,'青岛方格智能家居有限公司','济南',0,0,NULL,1,1,NULL),(34,1,4,'青岛中车四方车辆物流有限公司','济南',0,50,NULL,1,2,NULL),(35,1,4,'京东物流运输有限公司','济南',0,50,NULL,1,2,NULL),(36,1,4,'顺丰控股股份有限公司','济南',0,0,NULL,1,1,NULL),(37,1,4,'山东佳诚电器维修有限公司','济南',0,50,NULL,1,2,NULL),(38,1,4,'青岛康捷家电维修有限公司','济南',0,48,NULL,1,2,NULL),(39,1,4,'济南山和海环保科技有限公司','济南',0,48,NULL,1,2,NULL),(40,1,4,'山东惠宇环保科技有限公司','济南',0,48,NULL,1,2,NULL),(41,1,4,'汨罗万容电子废弃物处理有限公司','济南',0,48,NULL,1,2,NULL),(1,2,1,'云南天然橡胶产业股份有限公司','济南',0,45,NULL,1,2,NULL),(10,2,1,'宝山钢铁股份有限公司','济南',0,45,NULL,1,2,NULL),(11,2,1,'中国鞍钢集团公司','济南',0,0,NULL,1,1,NULL),(24,2,3,'山东小鸭集团家电有限公司','济南',0,0,NULL,1,1,NULL),(25,2,3,'美的集团股份有限公司','济南',0,47,NULL,1,2,NULL),(27,2,3,'西门子股份公司','济南',0,0,NULL,1,1,NULL),(28,2,3,'格力电器','济南',0,0,NULL,1,1,NULL),(29,2,3,'海尔智家','济南',0,47,NULL,1,2,NULL),(30,2,3,'苏宁电器股份有限公司','济南',0,0,NULL,1,1,NULL),(31,2,3,'国美电器有限公司','济南',0,0,NULL,1,1,NULL),(34,2,4,'青岛中车四方车辆物流有限公司','济南',0,0,NULL,1,1,NULL),(35,2,4,'京东物流运输有限公司','济南',0,50,NULL,1,2,NULL),(36,2,4,'顺丰控股股份有限公司','济南',0,0,NULL,1,1,NULL),(37,2,4,'山东佳诚电器维修有限公司','济南',0,48,NULL,1,2,NULL),(38,2,4,'青岛康捷家电维修有限公司','济南',0,0,NULL,1,1,NULL),(39,2,4,'济南山和海环保科技有限公司','济南',0,48,NULL,1,2,NULL),(40,2,4,'山东惠宇环保科技有限公司','济南',0,0,NULL,1,1,NULL),(41,2,4,'汨罗万容电子废弃物处理有限公司','济南',0,48,NULL,1,2,NULL),(43,2,1,'西部玻璃工业集团有限公司','济南',0,46,NULL,1,2,NULL),(44,2,1,'中国玻璃控股有限公司','济南',0,45,NULL,1,2,NULL),(45,2,1,'三星电子','济南',0,46,NULL,1,2,NULL),(46,2,1,'富士康科技集团','济南',0,46,NULL,1,2,NULL),(47,2,1,'菲利普斯','济南',0,0,NULL,1,1,NULL),(48,2,2,'德固赛','济南',0,51,NULL,1,2,NULL),(49,2,2,'中国中化集团','济南',0,0,NULL,1,1,NULL),(50,2,2,'陶氏化学公司','济南',0,0,NULL,1,1,NULL),(51,2,2,'普利司通公司','济南',0,0,NULL,1,1,NULL),(52,2,2,'杜邦公司','济南',0,0,NULL,1,1,NULL),(53,2,2,'3M公司','济南',0,51,NULL,1,2,NULL),(54,2,2,'斯伯丁公司','济南',0,0,NULL,1,1,NULL),(55,2,2,'阿尔斯通','济南',0,51,NULL,1,2,NULL),(56,2,3,'长虹','济南',0,47,NULL,1,2,NULL),(1,3,1,'云南天然橡胶产业股份有限公司','济南',0,0,NULL,1,1,NULL),(2,3,1,'云南瑞华能源有限公司','济南',0,0,NULL,1,1,NULL),(4,3,1,'金发科技股份有限公司','济南',0,0,NULL,1,1,NULL),(7,3,1,'厦门钨业','济南',0,0,NULL,1,1,NULL),(11,3,1,'中国鞍钢集团公司','济南',0,0,NULL,1,1,NULL),(13,3,1,'金川集团','济南',0,0,NULL,1,1,NULL),(34,3,4,'青岛中车四方车辆物流有限公司','济南',0,0,NULL,1,1,NULL),(35,3,4,'京东物流运输有限公司','济南',0,50,NULL,1,2,NULL),(57,3,1,'欧金矿业','济南',0,0,NULL,1,1,NULL),(58,3,1,'山东鲁得贝车灯股份有限公司','济南',0,0,NULL,1,1,NULL),(59,3,1,'中信国安','济南',0,0,NULL,1,1,NULL),(60,3,1,'西藏矿业','济南',0,0,NULL,1,1,NULL),(61,3,2,'博世汽车部件有限公司','济南',0,0,NULL,1,1,NULL),(62,3,2,'常州赛达电气有限公司','济南',0,0,NULL,1,1,NULL),(63,3,2,'容百科技','济南',0,0,NULL,1,1,NULL),(64,3,2,'当升科技','济南',0,0,NULL,1,1,NULL),(65,3,2,'贝特瑞','济南',0,0,NULL,1,1,NULL),(66,3,2,'杉杉股份','济南',0,0,NULL,1,1,NULL),(67,3,2,'苏州捷力','济南',0,0,NULL,1,1,NULL),(68,3,2,'湖南中锂','济南',0,0,NULL,1,1,NULL),(69,3,2,'天赐材料','济南',0,0,NULL,1,1,NULL),(70,3,2,'国泰华容','济南',0,0,NULL,1,1,NULL),(71,3,3,'济南华昊精密机械制造有限公司','济南',0,0,NULL,1,1,NULL),(72,3,3,'山东鲁信装饰有限公司','济南',0,0,NULL,1,1,NULL),(73,3,2,'大连奥拓机电设备有限公司','济南',0,0,NULL,1,1,NULL),(74,3,2,'安徽巨一科技股份有限公司','济南',0,0,NULL,1,1,NULL),(75,3,3,'长城汽车','济南',0,0,NULL,1,1,NULL),(76,3,3,'比亚迪汽车','济南',0,0,NULL,1,1,NULL),(77,3,3,'长安汽车','济南',0,0,NULL,1,1,NULL),(78,3,3,'广汽传祺','济南',0,0,NULL,1,1,NULL),(79,3,3,'蔚来汽车','济南',0,0,NULL,1,1,NULL),(80,3,3,'理想汽车','济南',0,0,NULL,1,1,NULL),(81,3,3,'小鹏汽车','济南',0,0,NULL,1,1,NULL),(82,3,4,'济南中集车辆物流装备有限公司','济南',0,0,NULL,1,1,NULL),(83,3,4,'威尔森信息科技','济南',0,50,NULL,1,2,NULL),(84,3,4,'小马达信息科技','济南',0,0,NULL,1,1,NULL),(85,3,4,'奇瑞徽银汽车金融','济南',0,0,NULL,1,1,NULL),(86,3,4,'瓜子二手车','济南',0,0,NULL,1,1,NULL),(87,3,4,'途虎二手车','济南',0,0,NULL,1,1,NULL);
/*!40000 ALTER TABLE `company_all` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_coalition`
--

DROP TABLE IF EXISTS `company_coalition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_coalition` (
  `coalition_id` int DEFAULT NULL COMMENT '联盟编号',
  `layer_id` int DEFAULT NULL COMMENT '企业所在网络层编号',
  `company_id` varchar(20) DEFAULT NULL COMMENT '企业编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='联盟企业映射表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_coalition`
--

LOCK TABLES `company_coalition` WRITE;
/*!40000 ALTER TABLE `company_coalition` DISABLE KEYS */;
INSERT INTO `company_coalition` VALUES (1,1,'1'),(1,1,'2'),(1,1,'3'),(1,2,'10'),(1,2,'11'),(2,2,'24'),(2,2,'27'),(2,3,'2'),(2,3,'1'),(3,1,'10'),(3,1,'12'),(3,2,'40'),(4,2,'39'),(4,2,'46'),(4,3,'1'),(4,3,'4'),(41,1,'8'),(41,1,'12'),(41,1,'5'),(41,2,'46'),(41,3,'57'),(41,3,'4'),(42,3,'1'),(42,3,'58'),(42,3,'2'),(42,3,'60'),(42,1,'1'),(42,1,'13'),(42,1,'3'),(43,3,'59'),(43,3,'11'),(43,2,'43'),(43,2,'10'),(43,1,'2'),(43,1,'10'),(43,1,'4'),(43,1,'9'),(44,3,'78'),(44,3,'76'),(44,1,'27'),(44,1,'32'),(44,1,'28'),(45,1,'11'),(45,1,'8'),(45,1,'5'),(45,1,'7'),(45,2,'1'),(45,2,'10'),(45,2,'44'),(46,1,'10'),(46,1,'4'),(46,1,'12'),(46,1,'1'),(46,2,'43'),(46,2,'45'),(46,2,'46'),(47,1,'30'),(47,1,'20'),(47,1,'31'),(47,2,'25'),(47,2,'56'),(47,2,'29'),(48,2,'39'),(48,2,'41'),(48,2,'37'),(48,1,'38'),(48,1,'40'),(48,1,'41'),(48,1,'39'),(49,1,'6'),(49,1,'13'),(49,1,'9'),(50,1,'34'),(50,1,'37'),(50,1,'35'),(50,3,'35'),(50,2,'35'),(50,3,'83'),(51,2,'53'),(51,2,'48'),(51,2,'55'),(51,1,'17'),(51,1,'21'),(51,1,'15');
/*!40000 ALTER TABLE `company_coalition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_group_cj`
--

DROP TABLE IF EXISTS `company_group_cj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_group_cj` (
  `group_id` int DEFAULT NULL COMMENT '协作团体id',
  `describe` varchar(50) DEFAULT NULL COMMENT '协作团体特征'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_group_cj`
--

LOCK TABLES `company_group_cj` WRITE;
/*!40000 ALTER TABLE `company_group_cj` DISABLE KEYS */;
INSERT INTO `company_group_cj` VALUES (1,'特征1'),(2,'特征2'),(3,'特征3'),(4,'特征4'),(5,'特征5');
/*!40000 ALTER TABLE `company_group_cj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_group_forming_auction`
--

DROP TABLE IF EXISTS `company_group_forming_auction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_group_forming_auction` (
  `id` int NOT NULL,
  `motivationTask` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `groupAuctionReleaser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `requestDescription` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `companyAuctionLeft` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `profitAuctionStart` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dateRelease` datetime DEFAULT NULL,
  `dateFinish` datetime DEFAULT NULL,
  `auctionState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `chain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_group_forming_auction`
--

LOCK TABLES `company_group_forming_auction` WRITE;
/*!40000 ALTER TABLE `company_group_forming_auction` DISABLE KEYS */;
INSERT INTO `company_group_forming_auction` VALUES (1,'1月之内生产100辆比亚迪宋汽车','比亚迪汽车','需要一个电池企业和一个一个人力组装企业，可以提供至多40%的利润','2','40','2023-05-01 00:00:00','2023-06-01 00:00:00','进行中','汽车产业链'),(2,'生产高效节能家电产品','小鸭集团','寻找电子元件供应商和生产厂家，共同研发高效节能家电产品','5','30','2023-04-15 00:00:00','2023-05-30 00:00:00','进行中','家电产业链'),(3,'开发智能马桶盖','长虹智能家居科技','需要合作伙伴提供智能传感器技术和生产制造能力，共同开发智能马桶盖产品','3','35','2023-06-10 00:00:00','2023-07-31 00:00:00','进行中','家电产业链'),(4,'生产电动汽车电池','超威电池科技','需要合作伙伴提供优质电池原材料和制造技术，共同生产电动汽车电池','8','25','2023-05-20 00:00:00','2023-06-30 00:00:00','进行中','汽车产业链'),(5,'家电产品设计与制造','洛克设计公司','需要家电制造企业合作，共同设计和制造创新家电产品','4','28','2023-06-05 00:00:00','2023-07-15 00:00:00','进行中','家电产业链'),(6,'推广汽车智能驾驶技术','小米智能汽车科技','需要合作伙伴推广汽车智能驾驶技术，共同开发智能汽车产品','6','32','2023-05-15 00:00:00','2023-06-25 00:00:00','进行中','汽车产业链');
/*!40000 ALTER TABLE `company_group_forming_auction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_income`
--

DROP TABLE IF EXISTS `company_income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_income` (
  `id` int DEFAULT NULL COMMENT '企业编号',
  `category` int DEFAULT NULL COMMENT '所属企业团体',
  `market_share` double DEFAULT NULL COMMENT '企业市场份额',
  `market_increase` double DEFAULT NULL COMMENT '企业市场增长率',
  `profitability` double DEFAULT NULL COMMENT '盈利率',
  `invest_ratio` double DEFAULT NULL COMMENT '科研投入比例',
  `product_width` int DEFAULT NULL COMMENT '产品线宽度',
  `product_depth` int DEFAULT NULL COMMENT '产品线深度',
  `brand_awareness` double DEFAULT NULL COMMENT '品牌知名度',
  `cooperation_willingness` double DEFAULT NULL COMMENT '合作意愿强度',
  `reputation` double DEFAULT NULL COMMENT '信誉分',
  `cooperation_num` int DEFAULT NULL COMMENT '合作数量',
  `cooperation_success` double DEFAULT NULL COMMENT '合作成功率',
  `average_roi` double DEFAULT NULL COMMENT '平均收益回报率',
  `suppliers_num` int DEFAULT NULL COMMENT '供应商数量',
  `turnover` double DEFAULT NULL COMMENT '库存周转率',
  `delivery_rate` double DEFAULT NULL COMMENT '准时交付率',
  `trade_level` double DEFAULT NULL COMMENT '物流水平',
  `liability` decimal(10,0) DEFAULT NULL COMMENT '负债',
  `owner_equity` decimal(10,0) DEFAULT NULL COMMENT '所有者权益',
  `income` decimal(10,0) DEFAULT NULL COMMENT '收益值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='企业收益信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_income`
--

LOCK TABLES `company_income` WRITE;
/*!40000 ALTER TABLE `company_income` DISABLE KEYS */;
INSERT INTO `company_income` VALUES (1,2,0.9150744014220376,0.39138048869386577,0.21226791093452058,0.17624267309309427,4,2,0.3680531520412177,0.27686708282285843,0.5676916845830617,8,0.6870709712690816,0.8172590705803285,5,0.8918572511797611,0.21274879855759898,0.8128921971194948,384,75,NULL),(2,1,0.11362871265671892,0.8423385991987005,0.0912617638279497,0.7063967094956035,1,8,0.5210738384785312,0.13139378118965472,0.3156263335264604,26,0.02941756030686693,0.03981063846997157,9,0.10204456160975639,0.6264393500139614,0.5607719853010257,75,174,NULL),(3,4,0.3940299698493578,0.6856941187971005,0.39253847576418077,0.7523881092076942,5,6,0.33948555281334913,0.376871731986151,0.7914642482142429,43,0.663346764435006,0.12773858891029444,2,0.15727910571906578,0.38763784140970026,0.2806346225703462,346,26,NULL),(4,2,0.1814374289215085,0.43505798198307355,0.8014267287043868,0.2792707602714223,8,9,0.6562245823937057,0.5194668978201339,0.5810786221449764,9,0.6355994779892356,0.10277835965891069,5,0.6821773130465794,0.8427001868337459,0.28329733010957026,643,643,NULL),(5,2,0.1754951949191308,0.6945253052471314,0.07056208424092991,0.11785318346305806,0,2,0.6994843982535756,0.924188517095632,0.15187566301663613,2,0.8187199965454053,0.9491395067011276,13,0.039210014283015404,0.3360762376222882,0.9634453451545153,347,347,NULL),(6,1,0.728286312389417,0.13591423158372518,0.37327407721583894,0.8473260204106365,6,0,0.5297513097929035,0.181456597438986,0.6450592350079737,29,0.47910676207600256,0.36165808900216,9,0.06739660763802291,0.9880534330654482,0.18465942191027407,487,272,NULL),(7,5,0.46822233354941534,0.7591787157957292,0.29226738487524584,0.2524626903245858,9,7,0.3313420989429068,0.849257652932678,0.7683018435511372,16,0.67283540035632,0.15540573023394555,19,0.13890954204924522,0.7367059420149488,0.4005487919774272,384,26,NULL),(8,1,0.08211886630206056,0.02081942734177722,0.5448433871778677,0.16505576344599926,1,3,0.03474676462272008,0.017448169915307288,0.6200941380632048,23,0.4565771063391154,0.7283872477812149,0,0.4837977023947949,0.9925118202910348,0.470964028002518,833,237,NULL),(9,4,0.08607298123208462,0.8185094601960071,0.4485508962974665,0.3723956736655565,9,4,0.052111420223956983,0.08545089202904899,0.8453997482321621,46,0.31378333500261335,0.20948539222753448,3,0.6464245199235612,0.8675136617947816,0.8993762520929208,358,36,NULL),(10,4,0.9535477520304899,0.4582737861161086,0.769083019929723,0.3010896095968705,6,10,0.5752057509285584,0.8225850274016696,0.2797873447491628,40,0.5287354322869173,0.022464517701042408,17,0.20942811634307168,0.7786804373821891,0.6629162789394863,43,226,NULL),(11,5,0.02305229259049002,0.667474442491627,0.5132174520638292,0.9602322139146307,3,2,0.3105253930928499,0.4854126391957386,0.9420006461053112,19,0.004456608500954418,0.34949858725710004,11,0.20763269330102752,0.7605579756417352,0.6626418291023125,25,31,NULL),(12,2,0.06367603336619532,0.18573057082626054,0.23693165747764855,0.49996321277146283,9,6,0.5594065000596843,0.5605827987106107,0.7590413260337876,10,0.07357539374016508,0.39522602859437916,19,0.09525079499923861,0.33373621081016525,0.8528535005205056,833,263,NULL),(13,2,0.6179749834469301,0.3661495417571192,0.3267540454862313,0.02776641318063444,2,8,0.44436815608103,0.31984373819041,0.5180152978834907,7,0.6823475599188458,0.4312058604413399,15,0.5005134440624396,0.11128478532043995,0.7393553377979388,358,25,NULL),(14,4,0.23507930237415486,0.47154815258103233,0.14070067087396987,0.45947124950969875,2,10,0.9242714240656562,0.9409896176082901,0.24951152117004705,46,0.35158739483156576,0.8888629226459401,8,0.27007908028811134,0.85382662999526,0.847510615559342,562,75,NULL),(15,1,0.8872816524991874,0.5822752245360826,0.12545772489333507,0.7519779310422381,6,10,0.3426761068639631,0.10407820416049429,0.6228191890042504,30,0.907957810933383,0.7001651136700906,5,0.9393203809839935,0.029029272574186527,0.2974568711383292,384,346,NULL),(16,5,0.1968247125866116,0.7233445923099031,0.3994886235013282,0.6697277957025197,7,5,0.12604723380472072,0.15826919610524048,0.33360292313292284,28,0.11696004743037847,0.20959315277612123,17,0.29757839596735736,0.2437079492479396,0.02628956805732241,833,643,NULL),(17,2,0.10977616344971242,0.9400690797024103,0.730163347977817,0.904954274828077,11,2,0.19177041602058686,0.02588304152578469,0.64327782128238,10,0.17527257191891665,0.6284196364629381,14,0.4805100181607236,0.8439676515916172,0.05853509184654704,358,347,NULL),(18,1,0.8532162543475394,0.8918854330132299,0.31180196338120725,0.7242528080333763,8,4,0.6352163824596428,0.9839471018377322,0.35267217785420946,36,0.2253654713822325,0.5693367320442594,17,0.607053081124705,0.1491300460627506,0.24618139866645494,272,272,NULL),(19,4,0.08537715881533725,0.30907114293930993,0.5831736154903765,0.5768674549125573,8,3,0.8422189615756822,0.13054414825641214,0.05209748118371926,49,0.9625389497838721,0.15680060743400093,7,0.9101074682800828,0.5283766798693981,0.9050777051206056,487,358,NULL),(20,5,0.3932481115048313,0.655961665411529,0.2615399798648079,0.21467026798309619,8,8,0.8022614227620779,0.6205634204221948,0.23632038125271226,24,0.7450409730849995,0.08412826278602359,12,0.547542426363429,0.7128770934443881,0.13911067216562356,384,562,NULL),(21,2,0.2248429349389256,0.7751409736835374,0.3444592671254183,0.5683096245657506,11,8,0.8423747146911104,0.06371517029859941,0.3072736926457964,13,0.41135629197104473,0.9859338509843869,14,0.5933899606991316,0.003807365245865335,0.637625862515892,75,643,NULL),(22,5,0.038558834840487166,0.635589308134803,0.9720663519867855,0.5614832564785297,11,10,0.24328649587037932,0.08680502212262664,0.10104465320107858,24,0.6134359983998816,0.06287197855602111,12,0.6130258632093913,0.3862759281362891,0.996628230522749,263,347,NULL),(23,1,0.08794388923847829,0.9330074032660434,0.9828706876168186,0.2709849158425939,6,6,0.7347394388291563,0.2515493309752992,0.9364093439317537,30,0.780940893867043,0.4734116602979669,10,0.0746947635885945,0.11353510760742724,0.8584141192425638,25,272,NULL),(24,4,0.4976718752401972,0.13645160195410955,0.5598995420925305,0.9070456901262294,9,2,0.2487213970574037,0.5563620266101003,0.11997118634933635,45,0.7273696423495551,0.32006614317746973,8,0.8421997764949323,0.29580414527807053,0.33248054194475696,75,487,NULL),(25,5,0.5184440196428697,0.28320775608027504,0.19471304414487145,0.6461627048296106,12,9,0.21128310084062485,0.09978773814375874,0.39656257106523396,24,0.552092422273463,0.753554783181607,15,0.2537838968702313,0.27988627745109085,0.7405522099539333,31,384,NULL),(26,4,0.009771970939004615,0.18659444232607403,0.10589641124514293,0.6370701522527548,12,7,0.40318257609572195,0.30880541536221706,0.27345866503470206,43,0.5817295366177757,0.7845863696108198,7,0.8368736164137128,0.8992059279652234,0.5081749046148588,174,833,NULL),(27,3,0.7358653270961483,0.3286969475025957,0.7859348314613697,0.09627633444690209,11,3,0.8458629826214391,0.07283838747185001,0.29766420668018667,61,0.23721654782025503,0.6975966503430462,18,0.02712958351425676,0.5428639717171518,0.5241455683229196,26,358,NULL),(28,3,0.809116167006163,0.7863947559003579,0.8495946401188113,0.7282111004896643,8,10,0.7694558195698856,0.44977939120674193,0.6062037378691243,61,0.14215017431388421,0.42793303569122754,4,0.3867085260355858,0.39791803620093624,0.2433995796998385,237,562,NULL),(29,4,0.762323845378015,0.3863315386555761,0.11634132371275296,0.17007411436130127,6,8,0.554507109866038,0.34017836887659325,0.7976410016763429,43,0.08972563315636328,0.5894505182885872,7,0.17494259191562633,0.5096296638204653,0.49518321373171525,36,361,NULL),(30,5,0.6489517869853776,0.3947826431023901,0.7741571187613957,0.6064782432574399,6,3,0.9245360391818875,0.6413321585184903,0.17388753080844765,20,0.6533789924609796,0.31455716689196833,13,0.09357246459614654,0.6739130123579693,0.7958396773556285,226,346,NULL),(31,5,0.2793434063656708,0.8599449896255015,0.34127279274591626,0.4749001427322491,11,3,0.6316570420236773,0.28599701926562393,0.4680461565183758,17,0.26484588437143053,0.984569998514377,17,0.07060835720284253,0.7191933614976402,0.7473987946990989,75,643,NULL),(32,1,0.8096759914818865,0.14928297383664568,0.028289148057246583,0.60013526207375,6,7,0.5213751637057897,0.9631878422671257,0.4857884504506751,35,0.04033376654130649,0.1896457271557267,11,0.30563022963571895,0.35119261187208384,0.35796367500582715,263,347,NULL),(33,4,0.3317004118833785,0.4845509550971576,0.5303068313866834,0.23572600347210126,9,12,0.14223186031795876,0.31984757402931707,0.2537098335710839,41,0.8465351191655521,0.24151186032070837,23,0.17689374889960674,0.544100772054434,0.5151070438947302,25,272,NULL),(34,4,0.5387101772652266,0.23593145864003373,0.7113686457989655,0.07760870456651792,4,9,0.2077381960096859,0.05472598813318075,0.6041911401510673,49,0.586965497929212,0.9123591694804991,14,0.8894600296060987,0.04765352306347692,0.19678407147925525,75,487,NULL),(35,3,0.39588207848286017,0.8306951120702671,0.591608372390935,0.24982364908836452,13,4,0.8509290342366758,0.6177891131778795,0.6377799205977542,59,0.06970786860114264,0.02800871970561658,4,0.7269467879767697,0.27758148352983103,0.3753363009428776,31,384,NULL),(36,1,0.7785945295389829,0.14943573524125953,0.30325072060488456,0.5626871338465507,4,10,0.8752647626679824,0.6085524319634117,0.20250787428578088,32,0.7033802693003998,0.5518874705442428,8,0.06865734868704076,0.47506113182961207,0.06208000536979863,174,833,NULL),(37,3,0.8981266462372641,0.6550997989007945,0.5980349528232684,0.6644400227322478,10,13,0.4924964564392371,0.19730973494678172,0.11925455303228782,61,0.09675411446806181,0.5816348534179316,11,0.9374555493581489,0.7727667147270527,0.24514596789675835,26,358,NULL),(38,3,0.12516830463389073,0.416627165297063,0.865824585867471,0.24347146200480418,7,10,0.6900166277350237,0.4835997893524303,0.508086543281079,65,0.9792816925037251,0.5673623500349476,5,0.5608387240989451,0.8971968484933268,0.8554012592879291,237,562,NULL),(39,3,0.7553606796432694,0.7651083732808632,0.6761114194471725,0.9441083560298773,4,9,0.5463933066029607,0.8830716482914963,0.2240648782315121,69,0.6815238967897401,0.29110114814312016,9,0.30171524532893035,0.45804611568439024,0.20518410391373276,36,361,NULL),(40,3,0.4000584411245992,0.1904513663486087,0.8850720727398088,0.4563042065195899,5,4,0.9136270588468575,0.4531065599389231,0.7496224504851368,67,0.9273343615448757,0.058799001810344254,14,0.26360869448184177,0.5933025773823712,0.823264658236349,226,346,NULL),(NULL,NULL,0.4331404138489938,0.41377118784857914,0.36338065083288285,0.7434182578311588,4,6,0.1378419519586802,0.9857127432315017,0.38953345113322013,43,0.15201766182778775,0.8322581686093572,11,0.23039332555762293,0.02999962754970853,0.9752589909869495,NULL,NULL,NULL),(NULL,NULL,0.748866650220009,0.46355843559707777,0.5004176303404817,0.8684112432843043,0,9,0.34770431806048596,0.4648718535146429,0.45947278390121704,13,0.3869115159540064,0.3118740088609149,15,0.5291807766272038,0.5172363609083506,0.5767963023224758,NULL,NULL,NULL),(NULL,NULL,0.20003012633944373,0.6334647026201454,0.6211616370814947,0.9001166486685175,6,3,0.6812436987719535,0.30936633883920484,0.4734943968355245,37,0.10485125070773416,0.47305314878106497,10,0.96848566428139,0.005193208386743753,0.35062301560370635,NULL,NULL,NULL),(NULL,NULL,0.7780644018546207,0.6706440350036246,0.3593093885997596,0.12121161409356163,6,0,0.3640508210190657,0.34389426896729225,0.996999295220539,20,0.3736351640720528,0.5982005369044219,16,0.48518485392271493,0.5653520746711809,0.08306772371980575,NULL,NULL,NULL),(NULL,NULL,0.1458440392951762,0.2939841979737755,0.4901915061472635,0.6195765215904431,7,1,0.9861948126179486,0.4292977743850407,0.5579430062853843,41,0.3243760386839305,0.08739185975799346,5,0.2932993551081703,0.780951334804089,0.4299791575346531,NULL,NULL,NULL),(NULL,NULL,0.02910925015888799,0.8378221847600721,0.8361807512947843,0.9648586971803682,8,8,0.25754278219642546,0.7127234044191418,0.9392768496029786,35,0.07411800845737326,0.7084106917891881,0,0.717754466950882,0.798071552543309,0.6353658462479581,NULL,NULL,NULL),(NULL,NULL,0.5758228648937608,0.8022708658181623,0.06378058191509484,0.9707740097065884,7,1,0.32678799445201734,0.8805263844535838,0.4466694729434796,10,0.040308752715887186,0.32233182682855355,13,0.4362676186623451,0.07603070142130364,0.648489400081552,NULL,NULL,NULL),(NULL,NULL,0.9317692747528091,0.13653067609549596,0.3612138008316673,0.43894879536124454,7,7,0.7481910968393353,0.1820601781985226,0.6936826986527411,24,0.3518269365363086,0.6791213572860235,17,0.15243684600991858,0.5057457727416523,0.7665500438703214,NULL,NULL,NULL),(NULL,NULL,0.9624017629894316,0.22629465658698888,0.3843614079450226,0.8809422152550469,7,4,0.6520200874574152,0.7554071055992225,0.7329527385822522,11,0.5656651929501407,0.23139252254577658,8,0.12276347033719859,0.30107394849620994,0.5600379256626895,NULL,NULL,NULL),(NULL,NULL,0.8644087878193932,0.36473180802640215,0.3694686270675128,0.04136875103187576,9,1,0.597959055454137,0.04491574222313777,0.6477548862787376,49,0.2188336594119079,0.5340335760153254,7,0.15086904516809407,0.5500940741231688,0.7090933272950828,NULL,NULL,NULL),(NULL,NULL,0.13784736074116444,0.6573267749234915,0.814156955652642,0.9256612059513368,1,4,0.9868662241289414,0.674554866436132,0.2943609749192664,27,0.6273449974501262,0.8140517135616357,14,0.2568152268644931,0.5472756604701973,0.15708516588735033,NULL,NULL,NULL),(NULL,NULL,0.44365611027996066,0.06496148729012263,0.5437156459327058,0.4802038034366667,1,1,0.13526213255227604,0.8277055845520753,0.5993801335661006,23,0.25636350110484274,0.2037306394055598,9,0.564285515618929,0.1968758250817133,0.5933589483378264,NULL,NULL,NULL),(NULL,NULL,0.030530994340229323,0.33205968051489754,0.45441755437852327,0.18499751904139028,4,7,0.7456444919379326,0.34880988517030753,0.3896036796414669,5,0.4004594001922043,0.2989264636666532,16,0.6653968069946011,0.5526174048276448,0.9242189013970327,NULL,NULL,NULL),(NULL,NULL,0.6986593459838928,0.7301311869493609,0.5867111080888757,0.5415548818215348,1,4,0.12763481078040806,0.05836223126290574,0.7486447314544128,37,0.6041783830178925,0.4591742376339879,16,0.6484059194747236,0.26274097735100466,0.04200531100380378,NULL,NULL,NULL),(NULL,NULL,0.6717025804043855,0.4600972916001411,0.3750637829799309,0.8415016018362487,10,6,0.7543899285974763,0.33989074499354466,0.4317880784005268,18,0.3289180151006238,0.7765010510406948,8,0.2647928705296212,0.7990948522131733,0.4174060312007216,NULL,NULL,NULL),(NULL,NULL,0.7227552440783989,0.41466996548876134,0.31917136371806365,0.6020947798519872,2,2,0.7582620041230286,0.1312029107268753,0.9007689831235589,36,0.9238135091276923,0.9808685190774259,10,0.4008054706104658,0.9500145962295391,0.3508327162053684,NULL,NULL,NULL),(NULL,NULL,0.851854275865095,0.6265362918312676,0.17524350703384828,0.3515145479579024,8,4,0.4160457797322621,0.016668227479246234,0.6424410591941198,47,0.6105705668855786,0.7300161365992698,15,0.4862730294362112,0.29731838330451854,0.054629804605167975,NULL,NULL,NULL),(NULL,NULL,0.576318665142072,0.05666531424390464,0.7574017510341498,0.10502245081530848,10,10,0.30365953735664675,0.5955881992870905,0.002723757332632859,46,0.4948730770723174,0.12197469908543257,21,0.05133754943723212,0.6260167285265007,0.1051113332970014,NULL,NULL,NULL),(NULL,NULL,0.01762083951274629,0.8497507214264456,0.16673788941615897,0.9161982453345767,9,6,0.2818117152502375,0.7583799496489888,0.8123288681748282,28,0.12748654023351735,0.7889557566403721,19,0.430333167110138,0.40167701935456546,0.3076897928386928,NULL,NULL,NULL),(NULL,NULL,0.8130447569430056,0.5113364089369676,0.6779022804041649,0.3926328633223757,6,7,0.8142295414042582,0.13446826927636524,0.8901296264529797,44,0.19719024005375219,0.4884523783483198,7,0.7770946483630778,0.6468762761147726,0.4887282262220636,NULL,NULL,NULL),(NULL,NULL,0.960127456967158,0.6845555338288941,0.6948123171698523,0.6764607882822232,8,10,0.6274429119332386,0.05156717058611826,0.8094179182184268,15,0.5492245398548842,0.2019358799127785,14,0.7590480999872503,0.5458896424944473,0.6004247172180293,NULL,NULL,NULL),(NULL,NULL,0.3079800960905451,0.6124929455005692,0.5653453746261313,0.8130457567891501,9,10,0.08175010418580919,0.4072722206278634,0.2584028682841152,35,0.6047147256882489,0.8176136764452733,9,0.5782958543372935,0.10720405556961898,0.30390146426623876,NULL,NULL,NULL),(NULL,NULL,0.5078707457817586,0.7497582019477862,0.9891012202058563,0.3856031035767865,11,3,0.5537676775827893,0.9056576566530476,0.5478704454854401,41,0.033297650685475744,0.423811741066931,12,0.3012331879089507,0.23683032066938858,0.71209114695466,NULL,NULL,NULL),(NULL,NULL,0.7599279676949177,0.8222570287057122,0.6957625806953154,0.5483958183327866,6,10,0.24375067441123788,0.677419693665651,0.8860011384426083,42,0.20016684920178374,0.8439696330047652,21,0.3835421773754243,0.4846097019310953,0.8248956740732805,NULL,NULL,NULL),(NULL,NULL,0.7713285274381201,0.32144092202995966,0.6901729093409418,0.11979181178914466,4,8,0.7309158404340015,0.6301629140167236,0.14698795627202788,52,0.11220560164840965,0.18020942508438087,9,0.267357202105899,0.1512330053869776,0.13832121725264657,NULL,NULL,NULL),(NULL,NULL,0.6446969583847311,0.14654882699529626,0.9998780875102633,0.3432655273872004,12,3,0.9704614273372787,0.23680854014996588,0.16182664591727502,34,0.8840823934394451,0.5942119701143086,5,0.23587533398152893,0.5506696891655241,0.6939244499506303,NULL,NULL,NULL),(NULL,NULL,0.7278917036367588,0.02949887937279949,0.3108875150193213,0.9797160549676186,9,3,0.5460732307867007,0.3972616097941495,0.5133520072509683,20,0.9757321785944503,0.021799483953266918,19,0.6483375985992712,0.1681038173886471,0.7238422005375476,NULL,NULL,NULL),(NULL,NULL,0.7209516387014567,0.8215674384124247,0.7442000100810993,0.3322578346147821,6,9,0.6425227254419663,0.47737484536642716,0.0277775262778045,42,0.45978042702845956,0.43852295386486706,16,0.11942143525686832,0.5369922058997729,0.6556553082587434,NULL,NULL,NULL),(NULL,NULL,0.8353741309796445,0.6009694996536971,0.36651903978367895,0.34299131269563066,8,3,0.9709779329881381,0.5955749005659929,0.6365453014176822,54,0.9316734131155413,0.8364448630373397,11,0.11795884799900314,0.5778769202338491,0.5144447040238731,NULL,NULL,NULL),(NULL,NULL,0.7897020360867698,0.7922809390826484,0.5622664530680748,0.7018941949628614,11,3,0.7344383434312338,0.5832684466095357,0.70613930531018,35,0.7295559040855394,0.970679339439062,17,0.035142953452503845,0.4165186138865047,0.6834806810215636,NULL,NULL,NULL),(NULL,NULL,0.43688353729384677,0.15112591920312268,0.5104606263592408,0.4376311608574882,12,12,0.5794527218778383,0.9683095642401015,0.32786516355873585,16,0.6243688385047479,0.9414730471267506,15,0.6517856977825774,0.24164110115512416,0.5096384176067031,NULL,NULL,NULL),(NULL,NULL,0.02489720579281607,0.5759336430094649,0.9585036768332442,0.592651436038308,6,9,0.6380153436599958,0.15700462433776852,0.5956422271571308,16,0.7301944533535226,0.5127785230076058,18,0.129018663168317,0.716816362142947,0.031649339986163705,NULL,NULL,NULL),(NULL,NULL,0.5014568015572507,0.8894000893681939,0.5253969033515749,0.22944634343977588,5,10,0.47425103806605284,0.14137530938808496,0.7970949741951817,31,0.8905833091005905,0.13796940511639566,15,0.21082260104965522,0.8498664458564086,0.1767590853025668,NULL,NULL,NULL),(NULL,NULL,0.20995599529519315,0.7405762842333887,0.726280517668391,0.7107061101864852,6,8,0.9005478426424368,0.2204280033020043,0.68586466911656,41,0.6015172449314518,0.5006545691417518,15,0.4631156583509326,0.5951387405424147,0.6487536968350187,NULL,NULL,NULL),(NULL,NULL,0.5314269881267131,0.7048003585461178,0.49096240606765984,0.5233993781820839,12,7,0.34923415924049384,0.8699257287949947,0.4650276766163862,34,0.4842804809955019,0.6470180816117025,15,0.5761512496928264,0.6353258725771876,0.8223407742035654,NULL,NULL,NULL),(NULL,NULL,0.9077908802358776,0.8300380048038665,0.2943479506105776,0.7252512173596933,9,11,0.7136800855621407,0.4083733530245527,0.844152314731564,38,0.6445032539250152,0.8525822797040421,19,0.736421208705051,0.9363747875442202,0.7968553020966542,NULL,NULL,NULL),(NULL,NULL,0.5724732866522079,0.8630701645289136,0.4415836105674077,0.9592207170757331,11,9,0.9558688194561319,0.16600462769011015,0.3750147965483366,41,0.3691173958322277,0.8527024313157191,23,0.6373337669930592,0.43031024213173186,0.33331920922383107,NULL,NULL,NULL),(NULL,NULL,0.3749960056600621,0.17262910938100096,0.5069758658278212,0.9661276182302584,7,6,0.010769543429821504,0.40206843392360814,0.5998880330258621,40,0.45064418391951455,0.44672945121220975,5,0.3855056105377731,0.08721741945460615,0.3642424154392,NULL,NULL,NULL),(NULL,NULL,0.2648119184539053,0.689500781720491,0.6715295666900707,0.1890785226220414,7,6,0.06634263947654362,0.18220269377219,0.8869483435194646,61,0.6891766399379008,0.7025242502553561,23,0.774104775193207,0.0903808539716845,0.2906871134572504,NULL,NULL,NULL),(NULL,NULL,0.7100428394034155,0.051851633381386986,0.808405007720004,0.8886335763387658,8,8,0.6438256190907921,0.723759864246684,0.20594867130405836,43,0.1272262531461934,0.21267317990681778,16,0.8932537906937243,0.006112713235746359,0.35661190427874867,NULL,NULL,NULL),(NULL,NULL,0.8687402741498139,0.34678879214784875,0.8828957260395381,0.9295175586877059,7,10,0.848961859894024,0.09866966352384376,0.4189957780456376,45,0.72926063729688,0.93243213365212,7,0.08501438000775374,0.31801520986928034,0.928807457687314,NULL,NULL,NULL),(NULL,NULL,0.746845944660934,0.2647931068875796,0.9380075371616992,0.5590324268337977,13,9,0.3870121437653955,0.5675444768791952,0.05531626188515959,36,0.8004948598372942,0.9004362191254076,20,0.3158224191937382,0.22260025200820155,0.16014612431041897,NULL,NULL,NULL),(NULL,NULL,0.5451018105181801,0.6319686188691166,0.2166707891239117,0.01659275603638588,12,8,0.8802771746492299,0.3413364764422617,0.5189519365170298,53,0.27635865202621135,0.7262196747742994,11,0.03108038215652542,0.35743307873522623,0.03755653314821694,NULL,NULL,NULL),(NULL,NULL,0.9058400456543628,0.10959865792357182,0.6357126761667284,0.24738013254063196,8,12,0.414188535137866,0.8983684507721921,0.12148174551053315,67,0.8370536292983904,0.03883644164008804,18,0.40306527594174724,0.08593196296577665,0.039922368206394054,NULL,NULL,NULL),(NULL,NULL,0.7471706588709853,0.6112301593869878,0.9831635397558244,0.8130972782629815,11,8,0.8135531926550713,0.811256256635022,0.686725070351651,64,0.41963224797428056,0.23863790978445953,11,0.015636976541128722,0.9601163692870142,0.37029304528743834,NULL,NULL,NULL),(NULL,NULL,0.07228799712221412,0.42999937703986657,0.23533879106266242,0.44638562819961913,13,14,0.025561654117354227,0.2766551171365481,0.264531926049941,67,0.8109202230716039,0.7860175504722081,22,0.7759601772251051,0.5064014929347748,0.7583925820093969,NULL,NULL,NULL),(NULL,NULL,0.026564647624678694,0.1529507398801352,0.5074964922712708,0.8366256290261977,6,13,0.7713570858159859,0.7576746775458915,0.08633526923485091,69,0.3690547938718882,0.6247660802171467,14,0.7175300039162787,0.26815977667196655,0.8824329047303788,NULL,NULL,NULL),(NULL,NULL,0.45408079446203264,0.995482133947298,0.5046486333384803,0.009257298240869738,14,14,0.7463946174228773,0.8157020086926533,0.6813069642749896,33,0.7775694453608504,0.5520037553254197,24,0.36673222532076766,0.3092940567311514,0.35196404200856646,NULL,NULL,NULL),(NULL,NULL,0.5293100232288745,0.2897588102130205,0.8358329720444312,0.829144705398695,12,14,0.6134207046293219,0.8255157202918553,0.5496011219345095,61,0.7399099593186,0.8572264237319704,15,0.8533337010812582,0.6743359473771533,0.6528793083832224,NULL,NULL,NULL),(NULL,NULL,0.7875850048771599,0.34411027229150737,0.4339960591131753,0.9996693890004212,12,13,0.12265705231431379,0.04914019174742479,0.7990461528960101,41,0.15583181593423578,0.3197866323744534,16,0.2946869656118355,0.6270643408411042,0.8102891243181901,NULL,NULL,NULL),(NULL,NULL,0.881952070401858,0.38775189990524594,0.2813457136554982,0.470621746209704,13,10,0.3973762718806928,0.26176814671842563,0.31977656388969034,75,0.6145546842219641,0.975565113973752,11,0.9507003211757308,0.4039813341572649,0.3690644238721743,NULL,NULL,NULL),(NULL,NULL,0.6095534129106359,0.28565494318662576,0.5297756326226578,0.5475178984546056,8,10,0.11891922958366163,0.8632845101592543,0.7294177641631382,41,0.6130918253228488,0.2822217861023234,25,0.005159947768225925,0.5371841642869666,0.3746474144929294,NULL,NULL,NULL),(NULL,NULL,0.48010957709764834,0.38859354626020304,0.6141340790598523,0.8645553447825008,15,6,0.16295851044519605,0.4007607955024257,0.5627484882291446,37,0.7426602958709115,0.31202663885082615,20,0.6702804444943801,0.15048238548923,0.03688098201511769,NULL,NULL,NULL),(NULL,NULL,0.13578130769154806,0.720618689512438,0.324561081762026,0.9200622510096041,7,8,0.6477278280642061,0.761665577438379,0.3662940825702351,79,0.08888989979203987,0.6619245542005932,21,0.442992722688181,0.6386093941923198,0.2613154429791984,NULL,NULL,NULL),(NULL,NULL,0.5972096526578456,0.7472118425365146,0.5704554604919733,0.8710745093981497,8,11,0.9589046385188821,0.25711947220350084,0.30262182811351335,76,0.4306638917044229,0.2541280260665776,12,0.9844683903113937,0.9748686021318463,0.12591860218850282,NULL,NULL,NULL),(NULL,NULL,0.5137255950471663,0.831583649007959,0.453486891777524,0.9550350613843419,14,14,0.4828194635912616,0.6945832678657384,0.0692482512052256,65,0.15743446317594623,0.6960741351887496,9,0.2587254461312001,0.0671619061973091,0.06623144762310562,NULL,NULL,NULL),(NULL,NULL,0.4490381961003479,0.9589445787271237,0.7434812850789686,0.42833711109505035,14,15,0.1407966202047677,0.24453293459123004,0.6498254173701149,53,0.9701158177947172,0.8316153416715116,20,0.8897614139691874,0.2580262598878289,0.7103997009652154,NULL,NULL,NULL),(NULL,NULL,0.41799995224721087,0.24339109844783424,0.5873794578606862,0.4066329340506779,13,14,0.32711655468884504,0.2639481866563085,0.009305620024479211,83,0.6419668744827884,0.6938507122910651,8,0.1890412251191118,0.8380967491868921,0.8023661861271378,NULL,NULL,NULL),(NULL,NULL,0.8655537119179196,0.8655729192602569,0.5556702266230124,0.5456282117257418,16,8,0.007827672687140796,0.8811720639499611,0.7811241192194709,69,0.09835075037371499,0.7139119164894631,19,0.3436239653293579,0.444183865611559,0.6148825132608411,NULL,NULL,NULL),(NULL,NULL,0.5964248947431415,0.5148670375586811,0.4692946200561967,0.9638927297437314,8,16,0.7074247519822936,0.9523964182231511,0.9383919133371084,62,0.9653072904780319,0.6480557808177191,22,0.33732107248157006,0.5221384670829256,0.23541664278387375,NULL,NULL,NULL),(NULL,NULL,0.5361131900172955,0.8757341266823019,0.15274733000134477,0.5478006765472369,7,7,0.9429141970212614,0.5271800951973816,0.41559414621982127,50,0.7244156511689447,0.45002108468615976,14,0.3398970821032101,0.8250670921550552,0.9346427237150339,NULL,NULL,NULL),(NULL,NULL,0.6526919035426482,0.5446921272468893,0.12500499602466264,0.1913488756292434,11,12,0.37864958297609463,0.9157119380994709,0.7942236847518062,38,0.5037798814228721,0.08184158934679153,8,0.7705102781453921,0.3993685935687532,0.8317898840396372,NULL,NULL,NULL),(NULL,NULL,0.6744502957372613,0.22330607001466873,0.7177904498268338,0.04212470101688759,16,9,0.2653171120843534,0.18018567200740543,0.5878120987044971,37,0.5050594702578879,0.11762802096391822,22,0.7980881172059624,0.6395763024253974,0.1527608736306063,NULL,NULL,NULL),(NULL,NULL,0.0628549890957758,0.7657349306685811,0.2527685485662966,0.28222104766241374,14,7,0.15933695670668202,0.9996338228622945,0.9737462398133468,71,0.9492384107457021,0.004563705845146759,23,0.7005214126824448,0.07418456064208823,0.5210007685297177,NULL,NULL,NULL),(NULL,NULL,0.17765539965924004,0.8247378475541464,0.9132791739380488,0.622438385862017,8,17,0.9052089133017036,0.601009818939359,0.4439507179627784,52,0.3520529462959301,0.1290813648270912,27,0.5860443594601028,0.27373088026046377,0.014056568335472197,NULL,NULL,NULL),(NULL,NULL,0.8005831153701185,0.6245169917495028,0.7271871731324732,0.813488330373622,16,9,0.34620684418468695,0.8174540402259207,0.7469306021888146,48,0.7598753592852686,0.04636171833552727,23,0.22839379142841731,0.3954261829442228,0.5488605545366025,NULL,NULL,NULL),(NULL,NULL,0.9768849922864504,0.8558140072870816,0.21701013051717932,0.4445762045374664,9,14,0.9382764106724542,0.2889955792822916,0.938517049699424,78,0.39101490525212934,0.19187858977395233,16,0.13290930609043416,0.5753041634916293,0.20047523065490824,NULL,NULL,NULL),(NULL,NULL,0.5148062375623189,0.9448675752128969,0.8505460339991084,0.049479138355836394,17,16,0.7175046155462926,0.6653351757132766,0.47570766324209424,74,0.4693133769750373,0.9385808972917564,9,0.7843104254024484,0.62058677338177,0.7950966866540906,NULL,NULL,NULL),(NULL,NULL,0.8600512475029107,0.03846067993189384,0.6380009675392717,0.9398674296510127,8,9,0.6639607290891454,0.32565985694934085,0.5650869385261966,52,0.5867491526497061,0.27870420891637704,18,0.8458544046007479,0.9980157808380453,0.05932348001618881,NULL,NULL,NULL),(NULL,NULL,0.6281035928322898,0.6472978682048899,0.367749177751317,0.29608453501097964,16,8,0.4234820614115562,0.6105406395657227,0.5275829512415199,69,0.3401874728731267,0.5466101520081994,25,0.7238781522716397,0.4443352539912344,0.02685678350626508,NULL,NULL,NULL),(NULL,NULL,0.9174126231861662,0.7630327797781544,0.25999597458917567,0.2841479018668972,15,15,0.7274073255284471,0.873254740490766,0.25518804479596413,53,0.27994605775941517,0.6310805438520133,25,0.8114791912384732,0.9779574554283681,0.30646924337575976,NULL,NULL,NULL),(NULL,NULL,0.06058341982331361,0.618839111019893,0.6334985200000091,0.2920515103840021,17,15,0.9578003792740806,0.5069317685004363,0.8982053080522514,58,0.3986922724698858,0.07379502060278131,26,0.15896929191050813,0.5225347222098954,0.02607559531293857,NULL,NULL,NULL),(NULL,NULL,0.2645308304243098,0.5407875013323238,0.8576755740670122,0.027940627854579958,17,17,0.2423558269029239,0.1835545897493478,0.9826847004455225,89,0.33970183093131734,0.021011813442418203,27,0.9482006089364478,0.15232891889478872,0.9184953597798065,NULL,NULL,NULL),(NULL,NULL,0.22837206921285602,0.623338444304423,0.6289919596343639,0.2083188517602852,9,9,0.7274125280683852,0.855939398057251,0.09064383075925098,86,0.7166814042078276,0.9110747548677478,15,0.7686948094539244,0.8473431044439802,0.37271268552777237,NULL,NULL,NULL),(NULL,NULL,0.44382787534853285,0.12030374491451756,0.3245112186792274,0.0045843766828702615,11,16,0.7053944235740391,0.6396086021744368,0.3394771451073031,74,0.8860066941800592,0.7119857911837195,28,0.052262675599598074,0.5554068966940032,0.7636772136294557,NULL,NULL,NULL),(NULL,NULL,0.10508723612446458,0.22140360352233346,0.6070538582101048,0.972938900932311,13,9,0.2024448894300105,0.11417362448488921,0.14077564893222927,62,0.2547784988656775,0.8688078282828785,19,0.7021402783331755,0.04123480323418527,0.7868129480398659,NULL,NULL,NULL),(NULL,NULL,0.02194750392290923,0.6614253516063647,0.2173726728161468,0.2681036474901425,14,10,0.9522120479272631,0.4327920427830192,0.8405183707130739,68,0.45212870750139833,0.2953209008658211,28,0.7356651677286119,0.0824343542058501,0.840016689807891,NULL,NULL,NULL),(NULL,NULL,0.19634889337981498,0.08487085751575163,0.9767998016112528,0.9503194828302408,17,12,0.08429771297865529,0.16593637847645182,0.36804090725972927,53,0.1211315841986742,0.2974253978183574,28,0.5393892069224427,0.7529285293900916,0.37024339419888785,NULL,NULL,NULL),(NULL,NULL,0.27689992224123683,0.15748979619879244,0.5030897405255502,0.138117284491301,15,16,0.5103066822301893,0.548355285046993,0.17617788016028746,66,0.680273479988847,0.096709631360276,23,0.5434378607325102,0.3779056818344705,0.9935136259542853,NULL,NULL,NULL),(NULL,NULL,0.3796505386571799,0.586005292130013,0.9898377089924286,0.4724878012716498,18,14,0.6227836380276788,0.5358065965992876,0.3995447100823898,55,0.6040779139497318,0.3752540914825233,17,0.8017452509916289,0.6619111549281556,0.27447869323201934,NULL,NULL,NULL);
/*!40000 ALTER TABLE `company_income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_location_cj`
--

DROP TABLE IF EXISTS `company_location_cj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_location_cj` (
  `location_id` int DEFAULT NULL COMMENT '主键',
  `location_x` double DEFAULT NULL COMMENT '前端x坐标',
  `location_y` double DEFAULT NULL COMMENT '前端y坐标',
  `company_id` int DEFAULT NULL COMMENT '企业id',
  `layer` int DEFAULT NULL COMMENT '关系层'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_location_cj`
--

LOCK TABLES `company_location_cj` WRITE;
/*!40000 ALTER TABLE `company_location_cj` DISABLE KEYS */;
INSERT INTO `company_location_cj` VALUES (1,-390,-110,1,2),(3,-390,-280,1,3),(4,-390,50,1,1),(2,-648.08344,-121.8853,2,2),(5,-648.08344,43.1147,2,1),(6,-648.08344,-296.8853,2,3),(7,-746,40,3,1),(8,-746,-125,3,2),(9,-746,-300,3,3),(10,-700,50,4,1),(11,-700,-115,4,2),(12,-700,-290,4,3),(13,-680,35,5,1),(14,-680,-133,5,2),(15,-680,-307,5,3),(16,-680,80,6,1),(17,-680,-80,6,2),(18,-680,-250,6,3),(19,-620,80,7,1),(20,-620,-80,7,2),(21,-620,-250,7,3),(22,-800,40,8,1),(23,-800,-125,8,2),(24,-800,-300,8,3),(25,-1080,110,9,1),(26,-1080,-50,9,2),(27,-1080,-220,9,3),(28,-1100,40,10,1),(29,-1100,-125,10,2),(30,-1100,-300,10,3),(31,-1080,60,11,1),(32,-1080,-100,11,2),(33,-1080,-270,11,3),(34,-950,45,12,1),(35,-950,-126,12,2),(36,-950,-287,12,3),(37,-1000,45,13,1),(38,-1000,-126,13,2),(39,-1000,-287,13,3),(40,-900,30,14,1),(41,-900,-131,14,2),(42,-900,-302,14,3),(43,-900,70,15,1),(44,-900,-91,15,2),(45,-900,-262,15,3),(46,-1000,80,16,1),(47,-1000,-86,16,2),(48,-1000,-255,16,3),(49,-600,50,17,1),(50,-600,-111,17,2),(51,-600,-282,17,3),(52,-580,90,18,1),(53,-580,-70,18,2),(54,-580,-240,18,3),(55,-560,40,19,1),(56,-560,-125,19,2),(57,-560,-300,19,3),(58,-480,70,20,1),(59,-480,-90,20,2),(60,-480,-260,20,3),(61,-500,40,21,1),(62,-500,-120,21,2),(63,-500,-290,21,3),(64,-540,70,22,1),(65,-540,-90,22,2),(66,-540,-260,22,3),(67,-440,70,23,1),(68,-440,-90,23,2),(69,-440,-260,23,3),(70,-360,70,24,1),(71,-360,-90,24,2),(72,-360,-260,24,3),(73,-1050,50,25,1),(74,-1050,-110,25,2),(75,-1050,-280,25,3),(76,-1150,60,26,1),(77,-1150,-100,26,2),(78,-1150,-270,26,3),(79,-1120,90,27,1),(80,-1120,-70,27,2),(81,-1120,-240,27,3),(82,-1150,120,28,1),(83,-1150,-40,28,2),(84,-1150,-210,28,3),(85,-1050,90,29,1),(86,-1050,-70,29,2),(87,-1050,-240,29,3),(88,-1020,120,30,1),(89,-1020,-40,30,2),(90,-1020,-210,30,3),(91,-970,110,31,1),(92,-970,-50,31,2),(93,-970,-220,31,3),(94,-850,70,32,1),(95,-850,-90,32,2),(96,-850,-260,32,3),(97,-880,110,33,1),(98,-880,-50,33,2),(99,-880,-220,33,3),(100,-810,120,34,1),(101,-810,-40,34,2),(102,-810,-210,34,3),(103,-750,110,35,1),(104,-750,-50,35,2),(105,-750,-220,35,3),(106,-710,90,36,1),(107,-710,-70,36,2),(108,-710,-240,36,3),(109,-660,110,37,1),(110,-660,-50,37,2),(111,-660,-220,37,3),(112,-510,100,38,1),(113,-510,-60,38,2),(114,-510,-230,38,3),(115,-950,85,39,1),(116,-950,-75,39,2),(117,-950,-245,39,3),(118,-410,100,40,1),(119,-410,-60,40,2),(120,-410,-230,40,3);
/*!40000 ALTER TABLE `company_location_cj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_location_income`
--

DROP TABLE IF EXISTS `company_location_income`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_location_income` (
  `location_id` int DEFAULT NULL COMMENT '位置表编号',
  `layer` int DEFAULT NULL COMMENT '所属网络层编号',
  `company_id` int DEFAULT NULL COMMENT '企业编号',
  `location_x` double DEFAULT NULL COMMENT '前端x坐标（未使用）',
  `location_y` double DEFAULT NULL COMMENT '前端y坐标（未使用）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_location_income`
--

LOCK TABLES `company_location_income` WRITE;
/*!40000 ALTER TABLE `company_location_income` DISABLE KEYS */;
INSERT INTO `company_location_income` VALUES (1,2,1,NULL,NULL),(2,2,2,NULL,NULL),(3,2,3,NULL,NULL),(4,2,4,NULL,NULL),(5,2,5,NULL,NULL),(6,2,6,NULL,NULL),(7,2,7,NULL,NULL),(8,2,8,NULL,NULL),(9,2,9,NULL,NULL),(10,2,10,NULL,NULL),(11,2,11,NULL,NULL),(12,2,12,NULL,NULL),(13,2,13,NULL,NULL),(14,2,14,NULL,NULL),(15,2,15,NULL,NULL),(16,2,16,NULL,NULL),(17,2,17,NULL,NULL),(18,2,18,NULL,NULL),(19,2,19,NULL,NULL),(20,2,20,NULL,NULL),(21,1,1,NULL,NULL),(22,1,2,NULL,NULL),(23,1,3,NULL,NULL),(24,1,4,NULL,NULL),(25,1,5,NULL,NULL),(26,1,6,NULL,NULL),(27,1,7,NULL,NULL),(28,1,8,NULL,NULL),(29,1,9,NULL,NULL),(30,1,10,NULL,NULL),(31,1,11,NULL,NULL),(32,1,12,NULL,NULL),(33,1,13,NULL,NULL),(34,1,14,NULL,NULL),(35,1,15,NULL,NULL),(36,1,16,NULL,NULL),(37,1,17,NULL,NULL),(38,1,18,NULL,NULL),(39,1,19,NULL,NULL),(40,1,20,NULL,NULL),(41,3,1,NULL,NULL),(42,3,2,NULL,NULL),(43,3,3,NULL,NULL),(44,3,4,NULL,NULL),(45,3,5,NULL,NULL),(46,3,6,NULL,NULL),(47,3,7,NULL,NULL),(48,3,8,NULL,NULL),(49,3,9,NULL,NULL),(50,3,10,NULL,NULL),(51,3,11,NULL,NULL),(52,3,12,NULL,NULL),(53,3,13,NULL,NULL),(54,3,14,NULL,NULL),(55,3,15,NULL,NULL),(56,3,16,NULL,NULL),(57,3,17,NULL,NULL),(58,3,18,NULL,NULL),(59,3,19,NULL,NULL),(60,3,20,NULL,NULL);
/*!40000 ALTER TABLE `company_location_income` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_overall_location_cj`
--

DROP TABLE IF EXISTS `company_overall_location_cj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_overall_location_cj` (
  `id` int DEFAULT NULL COMMENT '主键',
  `location_x` double DEFAULT NULL COMMENT '前端x坐标',
  `location_y` double DEFAULT NULL COMMENT '前端y坐标',
  `company_id` int DEFAULT NULL COMMENT '企业id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='整合模型的位置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_overall_location_cj`
--

LOCK TABLES `company_overall_location_cj` WRITE;
/*!40000 ALTER TABLE `company_overall_location_cj` DISABLE KEYS */;
INSERT INTO `company_overall_location_cj` VALUES (5,-390,-160,1),(6,-648.08344,-171.8853,2),(7,-746,-175,3),(8,-700,-165,4),(9,-680,-183,5),(10,-680,-130,6),(11,-620,-130,7),(12,-800,-175,8),(13,-1080,-100,9),(14,-1100,-175,10),(15,-1080,-150,11),(16,-950,-176,12),(17,-1000,-176,13),(18,-900,-181,14),(19,-900,-141,15),(20,-1000,-136,16),(21,-600,-161,17),(22,-580,-120,18),(23,-560,-175,19),(24,-480,-140,20),(25,-500,-170,21),(26,-540,-140,22),(27,-440,-140,23),(28,-360,-140,24),(29,-1050,-160,25),(30,-1150,-150,26),(31,-1120,-120,27),(32,-1150,-90,28),(33,-1050,-120,29),(34,-1020,-90,30),(35,-970,-100,31),(36,-850,-140,32),(37,-880,-100,33),(38,-810,-90,34),(39,-750,-100,35),(40,-710,-120,36),(41,-660,-100,37),(42,-510,-110,38),(43,-950,-125,39),(44,-410,-110,40),(45,-310,-100,41);
/*!40000 ALTER TABLE `company_overall_location_cj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_relation_total`
--

DROP TABLE IF EXISTS `company_relation_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_relation_total` (
  `id` int DEFAULT NULL COMMENT '总关系表编号',
  `source_id` int DEFAULT NULL COMMENT '源企业编号',
  `target_id` int DEFAULT NULL COMMENT '目标企业编号',
  `is_supply` tinyint DEFAULT NULL COMMENT '是否有供应关系',
  `is_cooperation` tinyint DEFAULT NULL COMMENT '是否有合作关系',
  `is_competition` tinyint DEFAULT NULL COMMENT '是否有竞争关系',
  `total_relation` double DEFAULT NULL COMMENT '整体关联强度',
  `analysis` varchar(25) DEFAULT NULL COMMENT '关联分析'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='企业总关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_relation_total`
--

LOCK TABLES `company_relation_total` WRITE;
/*!40000 ALTER TABLE `company_relation_total` DISABLE KEYS */;
INSERT INTO `company_relation_total` VALUES (4,8,36,1,1,0,0.29,NULL),(5,9,12,1,0,0,0.07,NULL),(6,9,13,1,0,0,0.09,NULL),(7,11,12,1,0,0,0.21,NULL),(8,11,13,1,0,0,0.08,NULL),(9,10,12,1,0,0,0.27,NULL),(10,10,13,1,0,0,0.14,NULL),(11,26,29,1,0,0,0.19,NULL),(12,28,29,1,0,0,0.15,NULL),(13,25,29,1,0,0,0.15,NULL),(14,27,29,1,0,0,0.18,NULL),(15,26,30,1,0,0,0.07,NULL),(16,28,30,1,0,0,0.05,NULL),(17,25,30,1,0,0,0.25,NULL),(18,27,30,1,0,0,0.28,NULL),(19,26,31,1,0,0,0.05,NULL),(20,28,31,1,0,0,0.02,NULL),(21,25,31,1,0,0,0.26,NULL),(22,27,31,1,0,0,0.32,NULL),(23,29,32,1,0,0,0.04,NULL),(24,30,32,1,0,0,0.13,NULL),(25,31,32,1,0,0,0.19,NULL),(26,29,33,1,0,0,0.13,NULL),(27,30,33,1,0,0,0.24,NULL),(28,31,33,1,0,0,0.29,NULL),(29,29,34,1,0,0,0.03,NULL),(30,30,34,1,0,0,0.02,NULL),(31,31,34,1,0,0,0.06,NULL),(32,16,14,1,0,0,0.03,NULL),(33,39,14,1,0,0,0.1,NULL),(34,16,15,1,0,0,0.17,NULL),(35,39,15,1,0,0,0.16,NULL),(36,8,37,1,0,0,0.23,NULL),(37,29,35,1,0,0,0.1,NULL),(38,30,35,1,0,0,0.03,NULL),(39,31,35,1,0,0,0,NULL),(40,25,4,1,0,0,0.03,NULL),(41,25,5,1,0,0,0.31,NULL),(42,25,6,1,0,0,0.07,NULL),(43,3,4,1,0,0,0.29,NULL),(44,3,5,1,0,0,0.12,NULL),(45,3,6,1,0,0,0.23,NULL),(46,4,2,1,0,0,0.15,NULL),(47,5,2,1,0,0,0.25,NULL),(48,6,2,1,0,0,0.27,NULL),(49,4,7,1,0,0,0.11,NULL),(50,5,7,1,0,0,0.19,NULL),(51,6,7,1,0,0,0.26,NULL),(52,12,19,1,0,0,0.09,NULL),(53,13,19,1,0,0,0.2,NULL),(54,14,19,1,0,0,0.19,NULL),(55,15,19,1,0,0,0.29,NULL),(56,32,19,1,0,0,0.07,NULL),(57,33,19,1,0,0,0.02,NULL),(58,34,19,1,0,0,0.2,NULL),(59,35,19,1,0,0,0.31,NULL),(60,36,19,1,0,0,0.04,NULL),(61,37,19,1,0,0,0.19,NULL),(62,2,19,1,0,0,0.1,NULL),(63,7,19,1,0,0,0.03,NULL),(64,12,18,1,0,0,0.2,NULL),(65,13,18,1,0,0,0.27,NULL),(66,14,18,1,0,0,0.03,NULL),(67,15,18,1,0,0,0.25,NULL),(68,32,18,1,0,0,0.32,NULL),(69,33,18,1,0,0,0.24,NULL),(70,34,18,1,0,0,0.32,NULL),(71,35,18,1,0,0,0.19,NULL),(72,36,18,1,0,0,0.16,NULL),(73,37,18,1,0,0,0.21,NULL),(74,2,18,1,0,0,0.03,NULL),(75,7,18,1,0,0,0.2,NULL),(76,12,17,1,0,0,0.09,NULL),(77,13,17,1,0,0,0.06,NULL),(78,14,17,1,0,0,0.12,NULL),(79,15,17,1,0,0,0.14,NULL),(80,32,17,1,0,0,0.22,NULL),(81,33,17,1,0,0,0.21,NULL),(82,34,17,1,0,0,0.19,NULL),(83,35,17,1,0,0,0.14,NULL),(84,36,17,1,0,0,0.32,NULL),(85,37,17,1,0,0,0.28,NULL),(86,2,17,1,0,0,0.15,NULL),(87,7,17,1,0,0,0.26,NULL),(88,17,22,1,0,0,0.03,NULL),(89,18,22,1,0,0,0.16,NULL),(90,19,22,1,0,0,0.28,NULL),(91,17,38,1,0,0,0.12,NULL),(92,18,38,1,0,0,0.02,NULL),(93,19,38,1,0,0,0.26,NULL),(94,17,20,1,0,0,0.33,NULL),(95,18,20,1,0,0,0.21,NULL),(96,19,20,1,0,0,0.1,NULL),(97,17,21,1,0,0,0.08,NULL),(98,18,21,1,0,0,0.28,NULL),(99,19,21,1,0,0,0.22,NULL),(100,17,23,1,0,0,0.01,NULL),(101,18,23,1,0,0,0.15,NULL),(102,19,23,1,0,0,0.19,NULL),(103,22,1,1,0,0,0.29,NULL),(104,38,1,1,0,0,0.22,NULL),(105,22,24,1,0,0,0.19,NULL),(106,38,24,1,0,0,0.15,NULL),(107,22,40,1,0,0,0.23,NULL),(108,38,40,1,0,0,0.17,NULL),(111,4,6,0,1,0,0.21,NULL),(112,5,6,0,1,0,0.06,NULL),(113,9,10,0,1,0,0.11,NULL),(114,9,11,0,1,0,0.26,NULL),(115,10,11,0,1,0,0.13,NULL),(116,16,39,0,1,0,0.17,NULL),(117,29,31,0,1,0,0.22,NULL),(118,30,31,0,1,0,0.12,NULL),(119,28,27,0,1,0,0.26,NULL),(120,28,26,0,1,0,0.13,NULL),(121,19,18,0,0,1,0.12,NULL),(122,17,18,0,0,1,0.2,NULL),(123,12,13,0,0,1,0.05,NULL),(124,26,27,0,0,1,0.12,NULL),(125,14,15,0,0,1,0.18,NULL),(126,32,33,0,0,1,0.14,NULL),(127,34,35,0,0,1,0.09,NULL),(128,32,34,0,0,1,0.15,NULL),(129,32,35,0,0,1,0.08,NULL),(130,33,34,0,0,1,0.27,NULL),(131,33,35,0,0,1,0.12,NULL),(132,3,25,0,0,1,0.16,NULL),(133,37,36,0,0,1,0.21,NULL),(134,2,7,0,0,1,0.15,NULL),(135,17,19,0,0,1,0.19,NULL),(136,22,38,0,0,1,0.25,NULL),(137,20,21,0,0,1,0.27,NULL),(138,1,24,0,0,1,0.15,NULL);
/*!40000 ALTER TABLE `company_relation_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_resource`
--

DROP TABLE IF EXISTS `company_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_resource` (
  `company_id` int NOT NULL COMMENT '企业编号',
  `layer_id` int NOT NULL COMMENT '企业所在网络层',
  `resource_id` int NOT NULL COMMENT '资源编号',
  `number` int NOT NULL COMMENT '资源数量',
  PRIMARY KEY (`company_id`,`layer_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='企业资源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_resource`
--

LOCK TABLES `company_resource` WRITE;
/*!40000 ALTER TABLE `company_resource` DISABLE KEYS */;
INSERT INTO `company_resource` VALUES (1,1,1,133),(1,1,2,95),(1,1,3,129),(1,1,4,110),(1,1,5,110),(1,1,6,71),(1,1,7,77),(1,1,8,124),(1,2,9,58),(1,2,10,72),(1,2,11,138),(1,2,12,119),(1,2,13,132),(1,2,14,51),(1,2,15,112),(1,3,6,79),(1,3,7,150),(1,3,8,59),(1,3,9,98),(1,3,10,62),(1,3,11,69),(2,1,1,136),(2,1,2,58),(2,1,3,134),(2,1,4,144),(2,1,5,66),(2,1,6,50),(2,1,7,106),(2,1,8,128),(2,3,6,111),(2,3,7,94),(2,3,8,87),(2,3,9,105),(2,3,10,111),(2,3,11,92),(3,1,1,69),(3,1,2,113),(3,1,3,109),(3,1,4,55),(3,1,5,99),(3,1,6,80),(3,1,7,53),(3,1,8,76),(4,1,1,73),(4,1,2,85),(4,1,3,55),(4,1,4,74),(4,1,5,52),(4,1,6,90),(4,1,7,142),(4,1,8,91),(4,3,6,78),(4,3,7,66),(4,3,8,144),(4,3,9,70),(4,3,10,70),(4,3,11,91),(5,1,1,77),(5,1,2,66),(5,1,3,149),(5,1,4,93),(5,1,5,71),(5,1,6,128),(5,1,7,75),(5,1,8,144),(6,1,1,143),(6,1,2,133),(6,1,3,83),(6,1,4,69),(6,1,5,149),(6,1,6,81),(6,1,7,114),(6,1,8,74),(7,1,1,78),(7,1,2,121),(7,1,3,120),(7,1,4,87),(7,1,5,124),(7,1,6,111),(7,1,7,130),(7,1,8,67),(7,3,6,93),(7,3,7,142),(7,3,8,79),(7,3,9,121),(7,3,10,117),(7,3,11,71),(8,1,1,96),(8,1,2,129),(8,1,3,107),(8,1,4,96),(8,1,5,110),(8,1,6,110),(8,1,7,72),(8,1,8,81),(9,1,1,139),(9,1,2,98),(9,1,3,127),(9,1,4,89),(9,1,5,113),(9,1,6,50),(9,1,7,63),(9,1,8,115),(10,1,1,133),(10,1,2,70),(10,1,3,103),(10,1,4,54),(10,1,5,111),(10,1,6,143),(10,1,7,132),(10,1,8,81),(10,2,9,57),(10,2,10,99),(10,2,11,72),(10,2,12,115),(10,2,13,109),(10,2,14,50),(10,2,15,76),(11,1,1,59),(11,1,2,105),(11,1,3,95),(11,1,4,112),(11,1,5,122),(11,1,6,127),(11,1,7,116),(11,1,8,51),(11,2,9,77),(11,2,10,108),(11,2,11,59),(11,2,12,123),(11,2,13,84),(11,2,14,102),(11,2,15,106),(11,3,6,56),(11,3,7,119),(11,3,8,76),(11,3,9,74),(11,3,10,92),(11,3,11,89),(12,1,1,56),(12,1,2,81),(12,1,3,85),(12,1,4,134),(12,1,5,62),(12,1,6,62),(12,1,7,73),(12,1,8,128),(13,1,1,71),(13,1,2,121),(13,1,3,142),(13,1,4,95),(13,1,5,99),(13,1,6,61),(13,1,7,57),(13,1,8,56),(13,3,6,117),(13,3,7,68),(13,3,8,140),(13,3,9,144),(13,3,10,51),(13,3,11,74),(14,1,16,73),(14,1,17,130),(14,1,18,76),(14,1,19,142),(14,1,20,132),(14,1,21,84),(14,1,22,73),(14,1,23,63),(15,1,16,149),(15,1,17,102),(15,1,18,113),(15,1,19,108),(15,1,20,51),(15,1,21,84),(15,1,22,118),(15,1,23,83),(16,1,16,116),(16,1,17,77),(16,1,18,90),(16,1,19,69),(16,1,20,126),(16,1,21,69),(16,1,22,120),(16,1,23,142),(17,1,16,99),(17,1,17,119),(17,1,18,148),(17,1,19,133),(17,1,20,69),(17,1,21,100),(17,1,22,141),(17,1,23,53),(18,1,16,96),(18,1,17,68),(18,1,18,106),(18,1,19,75),(18,1,20,106),(18,1,21,54),(18,1,22,107),(18,1,23,119),(19,1,16,125),(19,1,17,116),(19,1,18,54),(19,1,19,73),(19,1,20,55),(19,1,21,107),(19,1,22,117),(19,1,23,114),(20,1,31,98),(20,1,32,91),(20,1,33,114),(20,1,34,143),(20,1,35,125),(20,1,36,144),(20,1,37,92),(20,1,38,82),(21,1,16,69),(21,1,17,53),(21,1,18,111),(21,1,19,144),(21,1,20,135),(21,1,21,93),(21,1,22,110),(21,1,23,123),(22,1,16,134),(22,1,17,51),(22,1,18,103),(22,1,19,113),(22,1,20,105),(22,1,21,137),(22,1,22,118),(22,1,23,128),(23,1,16,136),(23,1,17,145),(23,1,18,65),(23,1,19,144),(23,1,20,73),(23,1,21,85),(23,1,22,54),(23,1,23,65),(24,1,31,83),(24,1,32,119),(24,1,33,97),(24,1,34,78),(24,1,35,150),(24,1,36,61),(24,1,37,107),(24,1,38,104),(24,2,39,124),(24,2,40,132),(24,2,41,134),(24,2,42,123),(24,2,43,65),(24,2,44,107),(24,2,45,89),(25,1,31,149),(25,1,32,79),(25,1,33,100),(25,1,34,114),(25,1,35,118),(25,1,36,97),(25,1,37,80),(25,1,38,62),(25,2,39,75),(25,2,40,56),(25,2,41,109),(25,2,42,126),(25,2,43,150),(25,2,44,120),(25,2,45,102),(26,1,31,123),(26,1,32,74),(26,1,33,53),(26,1,34,94),(26,1,35,62),(26,1,36,77),(26,1,37,51),(26,1,38,74),(27,1,31,68),(27,1,32,69),(27,1,33,89),(27,1,34,90),(27,1,35,134),(27,1,36,146),(27,1,37,78),(27,1,38,103),(27,2,39,102),(27,2,40,54),(27,2,41,115),(27,2,42,59),(27,2,43,105),(27,2,44,98),(27,2,45,122),(28,1,31,133),(28,1,32,104),(28,1,33,72),(28,1,34,101),(28,1,35,135),(28,1,36,121),(28,1,37,51),(28,1,38,146),(28,2,39,68),(28,2,40,123),(28,2,41,60),(28,2,42,82),(28,2,43,80),(28,2,44,104),(28,2,45,132),(29,1,31,124),(29,1,32,133),(29,1,33,143),(29,1,34,62),(29,1,35,134),(29,1,36,132),(29,1,37,107),(29,1,38,91),(29,2,39,94),(29,2,40,128),(29,2,41,106),(29,2,42,95),(29,2,43,110),(29,2,44,113),(29,2,45,83),(30,1,31,82),(30,1,32,89),(30,1,33,149),(30,1,34,124),(30,1,35,124),(30,1,36,96),(30,1,37,62),(30,1,38,71),(30,2,39,129),(30,2,40,144),(30,2,41,81),(30,2,42,127),(30,2,43,139),(30,2,44,62),(30,2,45,148),(31,1,31,120),(31,1,32,137),(31,1,33,73),(31,1,34,106),(31,1,35,60),(31,1,36,136),(31,1,37,147),(31,1,38,75),(31,2,39,99),(31,2,40,105),(31,2,41,77),(31,2,42,119),(31,2,43,114),(31,2,44,62),(31,2,45,122),(32,1,31,85),(32,1,32,51),(32,1,33,150),(32,1,34,147),(32,1,35,132),(32,1,36,70),(32,1,37,108),(32,1,38,76),(33,1,31,108),(33,1,32,62),(33,1,33,139),(33,1,34,53),(33,1,35,101),(33,1,36,97),(33,1,37,131),(33,1,38,113),(34,1,46,133),(34,1,47,54),(34,1,48,123),(34,1,49,102),(34,1,50,93),(34,1,51,108),(34,1,52,109),(34,2,53,115),(34,2,54,61),(34,2,55,114),(34,2,56,136),(34,2,57,85),(34,3,52,138),(34,3,53,118),(34,3,54,127),(35,1,46,73),(35,1,47,87),(35,1,48,69),(35,1,49,132),(35,1,50,103),(35,1,51,70),(35,1,52,90),(35,2,53,70),(35,2,54,145),(35,2,55,60),(35,2,56,121),(35,2,57,72),(35,3,52,130),(35,3,53,118),(35,3,54,149),(36,1,46,91),(36,1,47,135),(36,1,48,51),(36,1,49,102),(36,1,50,105),(36,1,51,68),(36,1,52,76),(36,2,53,150),(36,2,54,81),(36,2,55,108),(36,2,56,146),(36,2,57,55),(37,1,46,128),(37,1,47,58),(37,1,48,58),(37,1,49,68),(37,1,50,116),(37,1,51,125),(37,1,52,128),(37,2,53,89),(37,2,54,131),(37,2,55,135),(37,2,56,130),(37,2,57,95),(38,1,46,112),(38,1,47,126),(38,1,48,143),(38,1,49,88),(38,1,50,60),(38,1,51,88),(38,1,52,109),(38,2,53,138),(38,2,54,51),(38,2,55,94),(38,2,56,65),(38,2,57,96),(39,1,46,130),(39,1,47,74),(39,1,48,131),(39,1,49,82),(39,1,50,70),(39,1,51,51),(39,1,52,99),(39,2,53,136),(39,2,54,139),(39,2,55,138),(39,2,56,121),(39,2,57,140),(40,1,46,92),(40,1,47,110),(40,1,48,126),(40,1,49,149),(40,1,50,114),(40,1,51,72),(40,1,52,72),(40,2,53,86),(40,2,54,64),(40,2,55,112),(40,2,56,116),(40,2,57,93),(41,1,46,96),(41,1,47,110),(41,1,48,114),(41,1,49,89),(41,1,50,52),(41,1,51,146),(41,1,52,120),(41,2,53,67),(41,2,54,108),(41,2,55,89),(41,2,56,71),(41,2,57,141),(43,2,9,77),(43,2,10,118),(43,2,11,107),(43,2,12,131),(43,2,13,81),(43,2,14,64),(43,2,15,129),(44,2,9,102),(44,2,10,71),(44,2,11,102),(44,2,12,146),(44,2,13,70),(44,2,14,65),(44,2,15,66),(45,2,9,85),(45,2,10,76),(45,2,11,75),(45,2,12,97),(45,2,13,109),(45,2,14,106),(45,2,15,150),(46,2,9,82),(46,2,10,114),(46,2,11,70),(46,2,12,60),(46,2,13,143),(46,2,14,79),(46,2,15,121),(47,2,9,113),(47,2,10,55),(47,2,11,87),(47,2,12,120),(47,2,13,86),(47,2,14,121),(47,2,15,99),(48,2,24,116),(48,2,25,134),(48,2,26,69),(48,2,27,94),(48,2,28,114),(48,2,29,138),(48,2,30,97),(49,2,24,121),(49,2,25,63),(49,2,26,106),(49,2,27,88),(49,2,28,74),(49,2,29,55),(49,2,30,106),(50,2,24,115),(50,2,25,104),(50,2,26,125),(50,2,27,62),(50,2,28,88),(50,2,29,105),(50,2,30,111),(51,2,24,88),(51,2,25,56),(51,2,26,70),(51,2,27,133),(51,2,28,102),(51,2,29,62),(51,2,30,55),(52,2,24,141),(52,2,25,84),(52,2,26,50),(52,2,27,51),(52,2,28,55),(52,2,29,71),(52,2,30,142),(53,2,24,143),(53,2,25,138),(53,2,26,109),(53,2,27,84),(53,2,28,144),(53,2,29,114),(53,2,30,90),(54,2,24,60),(54,2,25,78),(54,2,26,63),(54,2,27,132),(54,2,28,117),(54,2,29,140),(54,2,30,96),(55,2,24,112),(55,2,25,123),(55,2,26,129),(55,2,27,125),(55,2,28,88),(55,2,29,114),(55,2,30,58),(56,2,39,72),(56,2,40,144),(56,2,41,52),(56,2,42,82),(56,2,43,102),(56,2,44,115),(56,2,45,119),(57,3,6,67),(57,3,7,64),(57,3,8,71),(57,3,9,111),(57,3,10,92),(57,3,11,79),(58,3,6,66),(58,3,7,147),(58,3,8,83),(58,3,9,126),(58,3,10,128),(58,3,11,112),(59,3,6,125),(59,3,7,141),(59,3,8,77),(59,3,9,113),(59,3,10,84),(59,3,11,131),(60,3,6,52),(60,3,7,122),(60,3,8,101),(60,3,9,90),(60,3,10,97),(60,3,11,62),(61,3,21,97),(61,3,22,61),(61,3,23,64),(61,3,24,87),(61,3,25,94),(61,3,26,58),(62,3,21,59),(62,3,22,74),(62,3,23,140),(62,3,24,129),(62,3,25,71),(62,3,26,122),(63,3,21,145),(63,3,22,107),(63,3,23,52),(63,3,24,89),(63,3,25,142),(63,3,26,87),(64,3,21,61),(64,3,22,98),(64,3,23,55),(64,3,24,133),(64,3,25,147),(64,3,26,85),(65,3,21,135),(65,3,22,69),(65,3,23,92),(65,3,24,101),(65,3,25,79),(65,3,26,146),(66,3,21,139),(66,3,22,108),(66,3,23,72),(66,3,24,86),(66,3,25,65),(66,3,26,119),(67,3,21,149),(67,3,22,136),(67,3,23,83),(67,3,24,59),(67,3,25,95),(67,3,26,148),(68,3,21,103),(68,3,22,124),(68,3,23,60),(68,3,24,79),(68,3,25,67),(68,3,26,146),(69,3,21,78),(69,3,22,103),(69,3,23,131),(69,3,24,96),(69,3,25,138),(69,3,26,150),(70,3,21,83),(70,3,22,119),(70,3,23,94),(70,3,24,63),(70,3,25,85),(70,3,26,83),(71,3,36,98),(71,3,37,85),(71,3,38,81),(71,3,39,101),(71,3,40,112),(71,3,41,106),(72,3,36,144),(72,3,37,50),(72,3,38,72),(72,3,39,60),(72,3,40,134),(72,3,41,136),(73,3,21,114),(73,3,22,68),(73,3,23,50),(73,3,24,99),(73,3,25,94),(73,3,26,122),(74,3,21,76),(74,3,22,67),(74,3,23,58),(74,3,24,141),(74,3,25,78),(74,3,26,116),(75,3,36,129),(75,3,37,87),(75,3,38,97),(75,3,39,77),(75,3,40,145),(75,3,41,139),(76,3,36,111),(76,3,37,89),(76,3,38,63),(76,3,39,97),(76,3,40,147),(76,3,41,93),(77,3,36,74),(77,3,37,141),(77,3,38,132),(77,3,39,87),(77,3,40,88),(77,3,41,131),(78,3,36,141),(78,3,37,60),(78,3,38,132),(78,3,39,125),(78,3,40,79),(78,3,41,71),(79,3,36,67),(79,3,37,74),(79,3,38,120),(79,3,39,125),(79,3,40,117),(79,3,41,57),(80,3,36,89),(80,3,37,123),(80,3,38,98),(80,3,39,69),(80,3,40,102),(80,3,41,54),(81,3,36,116),(81,3,37,65),(81,3,38,129),(81,3,39,99),(81,3,40,60),(81,3,41,52),(82,3,52,140),(82,3,53,101),(82,3,54,140),(83,3,52,143),(83,3,53,144),(83,3,54,141),(84,3,52,123),(84,3,53,144),(84,3,54,98),(85,3,52,108),(85,3,53,97),(85,3,54,109),(86,3,52,106),(86,3,53,53),(86,3,54,98),(87,3,52,79),(87,3,53,53),(87,3,54,80);
/*!40000 ALTER TABLE `company_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data`
--

DROP TABLE IF EXISTS `data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data` (
  `DataID` int DEFAULT NULL,
  `DataName` varchar(255) DEFAULT NULL,
  `Discription` varchar(255) DEFAULT NULL,
  `StartingPrice` decimal(10,2) DEFAULT NULL,
  `CurrentPrice` decimal(10,2) DEFAULT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data`
--

LOCK TABLES `data` WRITE;
/*!40000 ALTER TABLE `data` DISABLE KEYS */;
/*!40000 ALTER TABLE `data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (2,'company_all','企业信息表',NULL,NULL,'CompanyAll','crud','element-plus','com.ruoyi.project.generate.company','company','show','企业信息','cl','0','/','{\"parentMenuId\":\"2042\"}','admin','2024-04-02 11:51:07','','2024-04-25 07:02:43',NULL),(3,'task_all','任务表',NULL,NULL,'TaskAll','crud','element-plus','com.ruoyi.project.generate','coalition','formation','任务信息','cl','0','/','{\"parentMenuId\":\"2042\"}','admin','2024-04-10 08:29:55','','2024-04-26 06:21:19',NULL),(4,'coalition','企业联盟表',NULL,NULL,'CoalitionEnterprise','crud','','com.ruoyi.project.generate.coalition','coalition','enterprise','企业联盟','cl','0','/','{\"parentMenuId\":\"2042\"}','admin','2024-04-15 10:07:12','','2024-04-15 10:16:10',NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (11,2,'id','企业编号','int','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-04-02 11:51:07','','2024-04-25 07:02:43'),(12,2,'name','企业名称','varchar(20)','String','name','0','0','1','1','1','1','1','LIKE','input','',4,'admin','2024-04-02 11:51:07','','2024-04-25 07:02:43'),(13,2,'layer_id','产业链网络层编号','int','Long','layerId','1','0','0','1',NULL,'1',NULL,'EQ','input','',2,'admin','2024-04-02 11:51:07','','2024-04-25 07:02:43'),(14,2,'address','企业地址','varchar(20)','String','address','0','0','0','1','1','1','1','LIKE','input','',5,'admin','2024-04-02 11:51:07','','2024-04-25 07:02:43'),(15,2,'company_type','企业在产业链所在阶段（原料供应，零件生产，整机组装，销售和回收）','varchar(20)','Long','companyType','0','0','1','1','1','1','1','EQ','select','chain_stage',3,'admin','2024-04-02 11:51:07','','2024-04-25 07:02:43'),(17,2,'group_id','所属企业群id','int','Long','groupId','0','0','0','1','1','1','1','EQ','input','',6,'admin','2024-04-02 11:51:07','','2024-04-25 07:02:43'),(18,2,'process_rate','任务完成速率','int','Long','processRate','0','0','0','1','1','1','1','EQ','input','',8,'admin','2024-04-02 11:51:07','','2024-04-25 07:02:43'),(19,2,'rep','企业信誉','double','Long','rep','0','0','0','1','1','1','1','EQ','input','',9,'admin','2024-04-02 11:51:07','','2024-04-25 07:02:43'),(20,2,'status','企业状态（0异常，1空闲，2工作）','int','Long','status','0','0','0','1','1','1','1','EQ','radio','company_status',10,'admin','2024-04-02 11:51:07','','2024-04-25 07:02:43'),(21,3,'id','任务编号','int','Long','id','1','0','0','1',NULL,NULL,'1','EQ','input','',1,'admin','2024-04-10 08:29:55','','2024-04-26 06:21:19'),(22,3,'name','任务名称','varchar(20)','String','name','0','0','0','1','1','1','1','LIKE','input','',2,'admin','2024-04-10 08:29:55','','2024-04-26 06:21:19'),(23,3,'val','任务价值','int','Long','val','0','0','0','1','1','1','1','EQ','input','',4,'admin','2024-04-10 08:29:55','','2024-04-26 06:21:19'),(24,3,'arrival_time','任务到达时间','datetime','Date','arrivalTime','0','0','0','1','1','1','1','EQ','datetime','',5,'admin','2024-04-10 08:29:55','','2024-04-26 06:21:19'),(25,3,'coalition_time','联盟形成时间','datetime','Date','coalitionTime','0','0','0','1','1','1','1','EQ','datetime','',6,'admin','2024-04-10 08:29:55','','2024-04-26 06:21:19'),(26,3,'finish_time','任务完成时间','datetime','Date','finishTime','0','0','0','1','1','1','1','EQ','datetime','',7,'admin','2024-04-10 08:29:55','','2024-04-26 06:21:19'),(27,3,'task_status','任务状态（0 等待分配，1 已分配，2已完成,3执行失败）','int','Long','taskStatus','0','0','0','1','1','1','1','EQ','radio','task_state',8,'admin','2024-04-10 08:29:55','','2024-04-26 06:21:19'),(28,3,'duration','任务持续时长','int','Long','duration','0','0','0','1','1','1','1','EQ','input','',9,'admin','2024-04-10 08:29:55','','2024-04-26 06:21:20'),(29,3,'product_id','产品编号','int','Long','productId','0','0','0','1','1','1','1','EQ','input','',10,'admin','2024-04-10 08:29:55','','2024-04-26 06:21:20'),(30,3,'coalition_id','联盟编号','int','Long','coalitionId','0','0','0','1','1','1','1','EQ','input','',11,'admin','2024-04-10 08:29:55','','2024-04-26 06:21:20'),(31,3,'chain_id','所属产业链编号','int','Long','chainId','0','0','0','1','1','1','1','EQ','input','',12,'admin','2024-04-10 08:29:55','','2024-04-26 06:21:20'),(32,3,'company_id','任务所属企业编号','int','Long','companyId','0','0','0','1','1','1','1','EQ','input','',13,'','2024-04-10 08:55:07','','2024-04-26 06:21:20'),(33,4,'id','联盟编号','int','Long','id','1','1',NULL,'1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-04-15 10:07:12','','2024-04-15 10:16:10'),(34,4,'name','联盟名称','varchar(20)','String','name','0','0',NULL,'1','1','1','1','LIKE','input','',2,'admin','2024-04-15 10:07:12','','2024-04-15 10:16:10'),(35,4,'task_id','联盟任务编号','int','Long','taskId','0','0',NULL,'1','1','1','1','EQ','input','',3,'admin','2024-04-15 10:07:12','','2024-04-15 10:16:10'),(36,4,'create_time','联盟创建时间','datetime','Date','createTime','0','0',NULL,'1',NULL,NULL,NULL,'EQ','datetime','',4,'admin','2024-04-15 10:07:12','','2024-04-15 10:16:10'),(37,4,'coalition_status','联盟状态（0异常，1工作，2空闲）','int','Long','coalitionStatus','0','0',NULL,'1','1','1','1','EQ','radio','coalition_state',5,'admin','2024-04-15 10:07:12','','2024-04-15 10:16:10'),(38,4,'mode','联盟模式','int','Long','mode','0','0',NULL,'1','1','1','1','EQ','input','',6,'admin','2024-04-15 10:07:12','','2024-04-15 10:16:10'),(39,2,'coalition_id',NULL,'int','Long','coalitionId','0','0','0','1','1','1','1','EQ','input','',7,'','2024-04-25 07:02:05','','2024-04-25 07:02:43'),(40,2,'score',NULL,'double','Long','score','0','0','0','1','1','1','1','EQ','input','',11,'','2024-04-25 07:02:05','','2024-04-25 07:02:43'),(41,3,'task_type','任务类型(原料供应，零件生产，整机组装，销售和回收)','int','Long','taskType','0','0','0','1','1','1','1','EQ','select','chain_stage',3,'','2024-04-26 06:20:59','','2024-04-26 06:21:19');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_ranking_sxz`
--

DROP TABLE IF EXISTS `group_ranking_sxz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_ranking_sxz` (
  `id` int DEFAULT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `score` decimal(10,2) DEFAULT NULL,
  `ranking` int DEFAULT NULL,
  `time_frame` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_ranking_sxz`
--

LOCK TABLES `group_ranking_sxz` WRITE;
/*!40000 ALTER TABLE `group_ranking_sxz` DISABLE KEYS */;
INSERT INTO `group_ranking_sxz` VALUES (1,'汽车企业群',88.50,1,'HALF_YEAR'),(2,'冰箱企业群',87.50,2,'HALF_YEAR'),(3,'洗衣机企业群',86.80,3,'HALF_YEAR'),(4,'钢铁企业群',86.70,4,'HALF_YEAR'),(5,'数码企业群',85.90,5,'HALF_YEAR'),(6,'电机企业群',85.40,6,'HALF_YEAR'),(7,'电子企业群',85.20,7,'HALF_YEAR'),(8,'手机企业群',84.80,8,'HALF_YEAR'),(9,'电脑企业群',84.50,9,'HALF_YEAR'),(10,'家具企业群',84.20,10,'HALF_YEAR'),(11,'冰箱企业群',98.50,1,'MONTH'),(12,'汽车企业群',97.00,2,'MONTH'),(13,'洗衣机企业群',96.80,3,'MONTH'),(14,'数码企业群',96.70,4,'MONTH'),(15,'电机企业群',95.80,5,'MONTH'),(16,'手机企业群',95.40,6,'MONTH'),(17,'家具企业群',95.20,7,'MONTH'),(18,'电脑企业群',94.80,8,'MONTH'),(19,'钢铁企业群',94.50,9,'MONTH'),(20,'电子企业群',94.20,10,'MONTH');
/*!40000 ALTER TABLE `group_ranking_sxz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `from_id` varchar(10) DEFAULT NULL COMMENT '消息发送者编号',
  `type` int DEFAULT NULL COMMENT '消息类型',
  `to_id` varchar(10) DEFAULT NULL COMMENT '消息接收者编号',
  `arrival_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthly_statistics_sxz`
--

DROP TABLE IF EXISTS `monthly_statistics_sxz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthly_statistics_sxz` (
  `id` bigint DEFAULT NULL,
  `month` varchar(7) DEFAULT NULL,
  `high_score_count` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_statistics_sxz`
--

LOCK TABLES `monthly_statistics_sxz` WRITE;
/*!40000 ALTER TABLE `monthly_statistics_sxz` DISABLE KEYS */;
INSERT INTO `monthly_statistics_sxz` VALUES (1,'2023-11',4),(2,'2023-12',6),(3,'2024-1',7),(4,'2024-2',10),(5,'2024-3',12),(6,'2024-4',16);
/*!40000 ALTER TABLE `monthly_statistics_sxz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multiplex_relationship`
--

DROP TABLE IF EXISTS `multiplex_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multiplex_relationship` (
  `company1_id` int DEFAULT NULL COMMENT '企业1编号',
  `company2_id` int DEFAULT NULL COMMENT '企业2编号',
  `layer_id` int DEFAULT NULL COMMENT '关系所在层编号',
  `link_type` int DEFAULT NULL COMMENT '原料供应，零件生产，整机组装，销售和回收',
  `weight` int DEFAULT '1' COMMENT '权重(合作成本/关联强度)',
  `strength` double DEFAULT NULL COMMENT '关系强度'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multiplex_relationship`
--

LOCK TABLES `multiplex_relationship` WRITE;
/*!40000 ALTER TABLE `multiplex_relationship` DISABLE KEYS */;
INSERT INTO `multiplex_relationship` VALUES (1,2,1,1,5,NULL),(1,3,1,1,8,NULL),(1,4,1,1,8,NULL),(1,5,1,1,4,NULL),(1,6,1,1,8,NULL),(1,7,1,1,9,NULL),(1,8,1,1,1,NULL),(1,9,1,1,6,NULL),(1,10,1,1,1,NULL),(1,11,1,1,1,NULL),(1,12,1,1,4,NULL),(1,13,1,1,7,NULL),(3,11,1,1,5,NULL),(4,9,1,1,5,NULL),(5,11,1,1,8,NULL),(5,13,1,1,8,NULL),(6,11,1,1,8,NULL),(11,13,1,1,3,NULL),(1,10,2,1,9,NULL),(1,11,2,1,8,NULL),(1,43,2,1,2,NULL),(1,44,2,1,2,NULL),(1,45,2,1,5,NULL),(1,46,2,1,7,NULL),(1,47,2,1,5,NULL),(10,11,2,1,2,NULL),(10,45,2,1,2,NULL),(11,46,2,1,3,NULL),(43,46,2,1,1,NULL),(1,2,3,1,1,NULL),(1,4,3,1,7,NULL),(1,7,3,1,6,NULL),(1,11,3,1,6,NULL),(1,13,3,1,2,NULL),(1,57,3,1,2,NULL),(1,58,3,1,3,NULL),(1,59,3,1,8,NULL),(1,60,3,1,4,NULL),(4,58,3,1,4,NULL),(7,57,3,1,8,NULL),(7,60,3,1,2,NULL),(13,57,3,1,3,NULL),(57,59,3,1,6,NULL),(14,15,1,2,1,NULL),(14,16,1,2,6,NULL),(14,17,1,2,8,NULL),(14,18,1,2,5,NULL),(14,19,1,2,1,NULL),(14,20,1,2,6,NULL),(14,21,1,2,9,NULL),(14,22,1,2,1,NULL),(14,23,1,2,3,NULL),(15,21,1,2,5,NULL),(17,21,1,2,4,NULL),(18,23,1,2,5,NULL),(19,22,1,2,2,NULL),(20,23,1,2,5,NULL),(48,49,2,2,5,NULL),(48,50,2,2,9,NULL),(48,51,2,2,9,NULL),(48,52,2,2,9,NULL),(48,53,2,2,2,NULL),(48,54,2,2,7,NULL),(48,55,2,2,3,NULL),(49,54,2,2,1,NULL),(50,52,2,2,3,NULL),(52,55,2,2,4,NULL),(53,54,2,2,3,NULL),(61,62,3,2,1,NULL),(61,63,3,2,9,NULL),(61,64,3,2,5,NULL),(61,65,3,2,5,NULL),(61,66,3,2,1,NULL),(61,67,3,2,9,NULL),(61,68,3,2,4,NULL),(61,69,3,2,1,NULL),(61,70,3,2,3,NULL),(61,71,3,2,9,NULL),(61,72,3,2,1,NULL),(61,73,3,2,6,NULL),(61,74,3,2,9,NULL),(62,68,3,2,6,NULL),(63,74,3,2,2,NULL),(66,69,3,2,3,NULL),(66,74,3,2,9,NULL),(70,72,3,2,8,NULL),(70,74,3,2,1,NULL),(73,74,3,2,9,NULL),(24,25,1,3,3,NULL),(24,26,1,3,2,NULL),(24,27,1,3,8,NULL),(24,28,1,3,6,NULL),(24,29,1,3,4,NULL),(24,30,1,3,5,NULL),(24,31,1,3,2,NULL),(24,32,1,3,5,NULL),(24,33,1,3,1,NULL),(26,29,1,3,7,NULL),(27,28,1,3,6,NULL),(29,31,1,3,7,NULL),(30,32,1,3,9,NULL),(31,32,1,3,3,NULL),(24,25,2,3,8,NULL),(24,27,2,3,1,NULL),(24,28,2,3,9,NULL),(24,29,2,3,5,NULL),(24,30,2,3,5,NULL),(24,31,2,3,8,NULL),(24,56,2,3,1,NULL),(25,28,2,3,7,NULL),(25,29,2,3,5,NULL),(29,56,2,3,2,NULL),(29,30,2,3,6,NULL),(75,76,3,3,7,NULL),(75,77,3,3,2,NULL),(75,78,3,3,6,NULL),(75,79,3,3,6,NULL),(75,80,3,3,4,NULL),(75,81,3,3,1,NULL),(76,77,3,3,8,NULL),(76,81,3,3,3,NULL),(78,79,3,3,9,NULL),(34,35,1,4,7,NULL),(34,36,1,4,7,NULL),(34,37,1,4,6,NULL),(34,38,1,4,1,NULL),(34,39,1,4,1,NULL),(34,40,1,4,5,NULL),(34,41,1,4,2,NULL),(35,39,1,4,6,NULL),(36,41,1,4,3,NULL),(36,38,1,4,5,NULL),(36,40,1,4,6,NULL),(34,35,2,4,7,NULL),(34,36,2,4,4,NULL),(34,37,2,4,7,NULL),(34,38,2,4,2,NULL),(34,39,2,4,8,NULL),(34,40,2,4,6,NULL),(34,41,2,4,6,NULL),(35,39,2,4,2,NULL),(36,40,2,4,1,NULL),(36,38,2,4,6,NULL),(37,41,2,4,8,NULL),(34,35,3,4,4,NULL),(34,82,3,4,9,NULL),(34,83,3,4,7,NULL),(34,84,3,4,9,NULL),(34,85,3,4,3,NULL),(34,86,3,4,6,NULL),(34,87,3,4,5,NULL),(35,84,3,4,3,NULL),(83,87,3,4,1,NULL),(84,85,3,4,6,NULL),(85,86,3,4,9,NULL);
/*!40000 ALTER TABLE `multiplex_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `multiplex_relationship_1`
--

DROP TABLE IF EXISTS `multiplex_relationship_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `multiplex_relationship_1` (
  `company1_id` int DEFAULT NULL COMMENT '源企业id',
  `company2_id` int DEFAULT NULL COMMENT '目标企业id',
  `layer_id` int DEFAULT NULL COMMENT '关系层',
  `strength` double DEFAULT NULL COMMENT '关联强度'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='多重关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multiplex_relationship_1`
--

LOCK TABLES `multiplex_relationship_1` WRITE;
/*!40000 ALTER TABLE `multiplex_relationship_1` DISABLE KEYS */;
INSERT INTO `multiplex_relationship_1` VALUES (19,18,1,0.37),(17,18,1,0.6),(12,13,1,0.16),(26,27,1,0.37),(14,15,1,0.53),(32,33,1,0.41),(34,35,1,0.26),(32,34,1,0.45),(32,35,1,0.24),(33,34,1,0.8),(33,35,1,0.36),(3,25,1,0.47),(37,36,1,0.63),(2,7,1,0.46),(17,19,1,0.56),(22,38,1,0.76),(20,21,1,0.82),(1,24,1,0.46),(8,36,2,0.59),(9,12,2,0.22),(9,13,2,0.27),(11,12,2,0.62),(11,13,2,0.23),(10,12,2,0.82),(10,13,2,0.42),(26,29,2,0.56),(28,29,2,0.46),(25,29,2,0.45),(27,29,2,0.55),(26,30,2,0.22),(28,30,2,0.14),(25,30,2,0.75),(27,30,2,0.84),(26,31,2,0.14),(28,31,2,0.07),(25,31,2,0.78),(27,31,2,0.96),(29,32,2,0.11),(30,32,2,0.4),(31,32,2,0.58),(29,33,2,0.39),(30,33,2,0.71),(31,33,2,0.87),(29,34,2,0.1),(30,34,2,0.07),(31,34,2,0.17),(16,14,2,0.08),(39,14,2,0.29),(16,15,2,0.5),(39,15,2,0.49),(8,37,2,0.7),(29,35,2,0.29),(30,35,2,0.08),(31,35,2,0.01),(25,4,2,0.1),(25,5,2,0.93),(25,6,2,0.22),(3,4,2,0.88),(3,5,2,0.35),(3,6,2,0.7),(4,2,2,0.45),(5,2,2,0.75),(6,2,2,0.81),(4,7,2,0.33),(5,7,2,0.58),(6,7,2,0.79),(12,19,2,0.28),(13,19,2,0.59),(14,19,2,0.56),(15,19,2,0.86),(32,19,2,0.21),(33,19,2,0.06),(34,19,2,0.6),(35,19,2,0.92),(36,19,2,0.11),(37,19,2,0.58),(2,19,2,0.31),(7,19,2,0.1),(12,18,2,0.59),(13,18,2,0.8),(14,18,2,0.1),(15,18,2,0.74),(32,18,2,0.95),(33,18,2,0.73),(34,18,2,0.95),(35,18,2,0.58),(36,18,2,0.49),(37,18,2,0.64),(2,18,2,0.1),(7,18,2,0.59),(12,17,2,0.28),(13,17,2,0.17),(14,17,2,0.35),(15,17,2,0.42),(32,17,2,0.66),(33,17,2,0.62),(34,17,2,0.56),(35,17,2,0.43),(36,17,2,0.96),(37,17,2,0.84),(2,17,2,0.46),(7,17,2,0.77),(17,22,2,0.1),(18,22,2,0.48),(19,22,2,0.83),(17,38,2,0.37),(18,38,2,0.05),(19,38,2,0.78),(17,20,2,0.98),(18,20,2,0.64),(19,20,2,0.31),(17,21,2,0.23),(18,21,2,0.85),(19,21,2,0.65),(17,23,2,0.04),(18,23,2,0.45),(19,23,2,0.58),(22,1,2,0.87),(38,1,2,0.66),(22,24,2,0.56),(38,24,2,0.46),(22,40,2,0.69),(38,40,2,0.5),(5,6,3,0.18),(9,10,3,0.34),(9,11,3,0.77),(10,11,3,0.4),(16,39,3,0.52),(29,31,3,0.67),(30,31,3,0.35),(28,27,3,0.79),(28,26,3,0.4),(8,36,3,0.28),(1,3,3,0.29),(3,2,3,0.72),(3,4,3,0.76),(4,6,3,0.64),(3,5,3,NULL),(4,7,3,NULL),(4,20,3,NULL),(20,26,3,NULL),(20,30,3,NULL),(30,34,3,NULL),(34,39,3,NULL),(8,1,1,NULL),(3,0,3,NULL),(1,2,3,NULL),(1,4,3,NULL),(1,5,3,NULL),(2,4,3,NULL),(2,5,3,NULL);
/*!40000 ALTER TABLE `multiplex_relationship_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `name` varchar(20) DEFAULT NULL COMMENT '产品名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='产品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'工业橡胶'),(2,'工业塑料'),(3,'电刷材料'),(4,'电机'),(5,'洗衣机'),(6,'金属机箱'),(7,'电子元器件'),(8,'脱水桶'),(9,'传动带');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_all`
--

DROP TABLE IF EXISTS `resource_all`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_all` (
  `id` int NOT NULL COMMENT '资源编号',
  `resource_type` int NOT NULL COMMENT '企业在产业链所在阶段（原料供应，零件生产，整机组装，销售和回收）',
  `name` varchar(20) DEFAULT NULL COMMENT '资源名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='资源表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_all`
--

LOCK TABLES `resource_all` WRITE;
/*!40000 ALTER TABLE `resource_all` DISABLE KEYS */;
INSERT INTO `resource_all` VALUES (1,1,'钢材'),(2,1,'电机'),(3,1,'进水管'),(4,1,'零售店'),(5,1,'塑料'),(6,1,'排水泵'),(7,1,'排水管'),(8,1,'在线电商平台'),(9,1,'电子元件'),(10,1,'传动系统'),(11,1,'内桶'),(12,1,'配送服务'),(13,1,'橡胶'),(14,1,'显示屏'),(15,1,'外壳'),(16,2,'零部件维修中心'),(17,2,'玻璃'),(18,2,'振动减震器'),(19,2,'过滤网'),(20,2,'电机回收'),(21,2,'硅胶'),(22,2,'功率控制器'),(23,2,'绝缘材料'),(24,2,'回收和拆卸服务部门'),(25,2,'铝材'),(26,2,'压缩机'),(27,2,'电线束'),(28,2,'销售数据分析中心'),(29,2,'润滑油'),(30,2,'蒸发器'),(31,3,'金属螺丝和紧固件'),(32,3,'经销商网络'),(33,3,'制冷剂'),(34,3,'冷凝器'),(35,3,'制冷管道连接件'),(36,3,'安装服务'),(37,3,'锂'),(38,3,'扩张阀'),(39,3,'防震垫'),(40,3,'线下销售网'),(41,3,'镍'),(42,3,'电控系统'),(43,3,'机身组件'),(44,3,'客户体验中心'),(45,3,'碳纤维'),(46,4,'遥控器'),(47,4,'内饰件'),(48,4,'充电网络站点'),(49,4,'涂料'),(50,4,'电池单元'),(51,4,'安全系统'),(52,4,'铜线'),(53,4,'电动机'),(54,4,'轮胎'),(55,4,'铜管'),(56,4,'车载信息配置'),(57,4,'全车载软件系统');
/*!40000 ALTER TABLE `resource_all` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rev_add_record`
--

DROP TABLE IF EXISTS `rev_add_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rev_add_record` (
  `bus_id` varchar(10) DEFAULT NULL COMMENT '企业编号',
  `oldtask_id` int DEFAULT NULL COMMENT '原有任务编号',
  `new_task_id` int DEFAULT NULL COMMENT '新任务标号',
  `state` int DEFAULT NULL COMMENT '接受与否',
  `skill_id` int DEFAULT NULL COMMENT '技能编号',
  `old_price` int DEFAULT NULL COMMENT '原有价格',
  `new_price` int DEFAULT NULL COMMENT '现有价格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='企业增薪请求记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rev_add_record`
--

LOCK TABLES `rev_add_record` WRITE;
/*!40000 ALTER TABLE `rev_add_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `rev_add_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_records_sxz`
--

DROP TABLE IF EXISTS `score_records_sxz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score_records_sxz` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `evaluated_company_id` int DEFAULT NULL,
  `score` decimal(5,2) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `supplyRateScore` int DEFAULT NULL,
  `deliveryTimeScore` int DEFAULT NULL,
  `dataAccuracy` int DEFAULT NULL,
  `passRateScore` int DEFAULT NULL,
  `productAppearance` int DEFAULT NULL,
  `productPackaging` int DEFAULT NULL,
  `documentCompleteness` int DEFAULT NULL,
  `afterSalesService` int DEFAULT NULL,
  `communicationQuality` int DEFAULT NULL,
  `customerServiceResponse` int DEFAULT NULL,
  `exceptionHandling` int DEFAULT NULL,
  `priceRating` int DEFAULT NULL,
  `transactionConvenience` int DEFAULT NULL,
  `transactionSecurity` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_records_sxz`
--

LOCK TABLES `score_records_sxz` WRITE;
/*!40000 ALTER TABLE `score_records_sxz` DISABLE KEYS */;
INSERT INTO `score_records_sxz` VALUES (114,1,1,3,4.00,'2024-04-22 15:19:06',5,0,4,5,3,4,4,5,4,4,5,4,5,4),(115,1,1,4,4.00,'2024-04-22 20:59:15',5,0,3,5,3,4,4,4,4,5,5,4,3,5);
/*!40000 ALTER TABLE `score_records_sxz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-04-01 01:30:05','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-04-01 01:30:05','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-04-01 01:30:05','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2024-04-01 01:30:05','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-04-01 01:30:05','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-04-01 01:30:05','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2024-04-01 01:29:58','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-04-01 01:29:58','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-04-01 01:29:58','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-04-01 01:29:58','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-04-01 01:29:58','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2024-04-01 01:29:58','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2024-04-01 01:29:58','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2024-04-01 01:29:58','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-04-01 01:29:58','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-04-01 01:29:58','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-04-01 01:30:04','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-04-01 01:30:04','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-04-01 01:30:04','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-04-01 01:30:04','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-04-01 01:30:04','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-04-01 01:30:04','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-04-01 01:30:04','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-04-01 01:30:04','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-04-01 01:30:04','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-04-01 01:30:04','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-04-01 01:30:04','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-04-01 01:30:04','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-04-01 01:30:04','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-04-01 01:30:04','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-04-01 01:30:04','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-04-01 01:30:04','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-04-01 01:30:04','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-04-01 01:30:04','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-04-01 01:30:04','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-04-01 01:30:04','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-04-01 01:30:04','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-04-01 01:30:04','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-04-01 01:30:04','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-04-01 01:30:04','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-04-01 01:30:04','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-04-01 01:30:04','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-04-01 01:30:04','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-04-01 01:30:04','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-04-01 01:30:04','',NULL,'停用状态'),(100,0,'异常','0','company_status',NULL,'default','N','0','admin','2024-04-02 11:22:00','',NULL,NULL),(101,0,'空闲','1','company_status',NULL,'default','N','0','admin','2024-04-02 11:22:10','',NULL,NULL),(102,0,'工作','2','company_status',NULL,'default','N','0','admin','2024-04-02 11:22:20','',NULL,NULL),(103,0,'未分配','0','task_state',NULL,'default','N','0','admin','2024-04-10 08:32:58','',NULL,NULL),(104,0,'已分配','1','task_state',NULL,'default','N','0','admin','2024-04-10 08:33:09','',NULL,NULL),(105,0,'已完成','2','task_state',NULL,'default','N','0','admin','2024-04-10 08:33:24','',NULL,NULL),(106,0,'异常','0','coalition_state',NULL,'default','N','0','admin','2024-04-10 08:34:23','',NULL,NULL),(107,0,'工作','1','coalition_state',NULL,'default','N','0','admin','2024-04-10 08:34:35','',NULL,NULL),(108,0,'空闲','2','coalition_state',NULL,'default','N','0','admin','2024-04-10 08:35:11','',NULL,NULL),(109,0,'执行失败','3','task_state',NULL,'default','N','0','admin','2024-04-12 03:22:19','',NULL,NULL),(110,0,'原料供应','1','chain_stage',NULL,'default','N','0','admin','2024-04-25 06:58:19','admin','2024-04-25 06:58:25',NULL),(111,0,'零件生产','2','chain_stage',NULL,'default','N','0','admin','2024-04-25 06:58:36','',NULL,NULL),(112,0,'整机组装','3','chain_stage',NULL,'default','N','0','admin','2024-04-25 06:58:52','',NULL,NULL),(113,0,'销售和回收','4','chain_stage',NULL,'default','N','0','admin','2024-04-25 06:59:01','',NULL,NULL),(114,0,'洗衣机产业链','1','chain',NULL,'default','N','0','admin','2024-04-27 02:01:47','',NULL,NULL),(115,0,'空调产业链','2','chain',NULL,'default','N','0','admin','2024-04-27 02:02:00','',NULL,NULL),(116,0,'汽车产业链','3','chain',NULL,'default','N','0','admin','2024-04-27 02:02:12','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-04-01 01:30:03','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-04-01 01:30:03','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-04-01 01:30:03','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-04-01 01:30:03','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-04-01 01:30:03','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-04-01 01:30:04','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-04-01 01:30:04','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-04-01 01:30:04','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-04-01 01:30:04','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-04-01 01:30:04','',NULL,'登录状态列表'),(100,'企业状态','company_status','0','admin','2024-04-02 11:21:35','',NULL,NULL),(101,'任务状态','task_state','0','admin','2024-04-10 08:32:36','',NULL,NULL),(102,'联盟状态','coalition_state','0','admin','2024-04-10 08:33:58','',NULL,NULL),(103,'产业链阶段','chain_stage','0','admin','2024-04-25 06:57:55','',NULL,NULL),(104,'产业链名称','chain','0','admin','2024-04-27 02:01:30','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-04-01 01:30:05','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-04-01 01:30:05','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-04-01 01:30:05','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (257,'admin','8.134.59.53','XX XX','Chrome 12','Windows 10','0','登录成功','2024-04-25 02:04:22'),(258,'admin','8.134.59.53','XX XX','Chrome 12','Windows 10','0','登录成功','2024-04-25 12:04:47'),(259,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-04-26 00:51:15'),(260,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-04-26 01:31:57'),(261,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-26 01:32:10'),(262,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-26 06:03:15'),(263,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','验证码已失效','2024-04-26 07:12:34'),(264,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-26 07:12:38'),(265,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-26 10:49:09'),(266,'admin','8.134.59.53','XX XX','Chrome 12','Windows 10','0','登录成功','2024-04-27 06:58:31'),(267,'admin','8.134.59.53','XX XX','Chrome 12','Windows 10','0','登录成功','2024-04-27 07:51:47'),(268,'admin','127.0.0.1','内网IP','Chrome 9','Windows 10','0','登录成功','2024-04-27 08:36:36'),(269,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-04-28 07:53:17'),(270,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-04-28 07:54:31'),(271,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-06 06:53:34'),(272,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-05-06 07:02:33'),(273,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-05-06 08:16:11');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2085 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2024-04-01 01:29:59','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2024-04-01 01:29:59','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2024-04-01 01:29:59','',NULL,'系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'',0,0,'M','0','0','','guide','admin','2024-04-01 01:29:59','',NULL,'若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2024-04-01 01:29:59','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2024-04-01 01:29:59','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-04-01 01:29:59','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2024-04-01 01:29:59','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2024-04-01 01:29:59','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2024-04-01 01:29:59','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2024-04-01 01:29:59','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2024-04-01 01:29:59','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2024-04-01 01:29:59','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2024-04-01 01:29:59','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2024-04-01 01:29:59','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-04-01 01:29:59','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2024-04-01 01:29:59','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-04-01 01:29:59','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-04-01 01:29:59','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2024-04-01 01:29:59','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2024-04-01 01:29:59','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-04-01 01:29:59','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-04-01 01:29:59','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-04-01 01:29:59','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2024-04-01 01:29:59','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2024-04-01 01:29:59','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2024-04-01 01:29:59','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2024-04-01 01:29:59','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2024-04-01 01:29:59','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2024-04-01 01:29:59','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-04-01 01:29:59','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2024-04-01 01:29:59','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2024-04-01 01:29:59','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2024-04-01 01:29:59','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2024-04-01 01:29:59','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2024-04-01 01:30:00','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2024-04-01 01:30:00','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2024-04-01 01:30:00','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-04-01 01:30:00','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-04-01 01:30:00','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2024-04-01 01:30:00','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2024-04-01 01:30:00','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-04-01 01:30:00','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-04-01 01:30:00','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2024-04-01 01:30:00','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2024-04-01 01:30:00','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2024-04-01 01:30:00','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2024-04-01 01:30:00','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2024-04-01 01:30:00','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2024-04-01 01:30:00','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2024-04-01 01:30:00','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-04-01 01:30:00','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-04-01 01:30:00','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2024-04-01 01:30:00','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2024-04-01 01:30:00','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2024-04-01 01:30:00','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2024-04-01 01:30:00','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2024-04-01 01:30:00','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2024-04-01 01:30:00','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2024-04-01 01:30:00','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2024-04-01 01:30:00','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-04-01 01:30:00','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-04-01 01:30:00','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-04-01 01:30:00','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-04-01 01:30:00','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-04-01 01:30:00','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-04-01 01:30:00','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-04-01 01:30:00','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-04-01 01:30:00','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-04-01 01:30:00','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-04-01 01:30:00','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-04-01 01:30:00','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-04-01 01:30:00','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-04-01 01:30:00','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-04-01 01:30:00','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-04-01 01:30:00','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-04-01 01:30:00','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-04-01 01:30:00','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-04-01 01:30:00','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-04-01 01:30:00','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-04-01 01:30:00','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-04-01 01:30:00','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-04-01 01:30:00','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-04-01 01:30:00','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-04-01 01:30:01','',NULL,''),(2018,'产品质量评估',0,9,'test1','multigranularity/haha',NULL,1,0,'C','0','0','','build','admin','2023-09-05 11:32:11','admin','2024-04-13 08:32:17',''),(2021,'企业关系评估',0,9,'223565945','multigranularity/test2',NULL,1,0,'C','0','0','','date','admin','2023-09-06 14:54:23','admin','2024-04-13 08:32:25',''),(2022,'协同效果评估',0,7,'testss','multigranularity/test/main',NULL,1,0,'C','0','0','','chart','admin','2023-09-08 11:32:21','admin','2024-04-13 10:32:22',''),(2024,'协同效果展示',0,6,'123654','multigranularity/test2/app',NULL,1,0,'C','0','0','','build','admin','2023-09-12 14:54:26','admin','2024-04-13 08:54:53',''),(2041,'群智汇聚',0,3,'aa','dataFusion2/dataFusion',NULL,1,0,'C','0','0','','documentation','admin','2024-04-02 06:04:31','admin','2024-04-13 10:33:46',''),(2042,'群智联盟形成',0,4,'coalitionFormation',NULL,NULL,1,0,'M','0','0','','druid','admin','2024-04-02 08:20:10','admin','2024-04-13 10:33:17',''),(2053,'企业信息',2042,1,'companyInfo','coalitionformation/company/Company',NULL,1,0,'C','0','0','company:show:list','date','admin','2024-04-02 12:18:42','admin','2024-04-08 14:48:22','企业信息菜单'),(2054,'企业信息查询',2053,1,'#','',NULL,1,0,'F','0','0','company:show:query','#','admin','2024-04-02 12:18:43','',NULL,''),(2055,'企业信息新增',2053,2,'#','',NULL,1,0,'F','0','0','company:show:add','#','admin','2024-04-02 12:18:43','',NULL,''),(2056,'企业信息修改',2053,3,'#','',NULL,1,0,'F','0','0','company:show:edit','#','admin','2024-04-02 12:18:43','',NULL,''),(2057,'企业信息删除',2053,4,'#','',NULL,1,0,'F','0','0','company:show:remove','#','admin','2024-04-02 12:18:43','',NULL,''),(2058,'企业信息导出',2053,5,'#','',NULL,1,0,'F','0','0','company:show:export','#','admin','2024-04-02 12:18:43','',NULL,''),(2059,'多模式协同',0,5,'xietong','multimode/indexmode',NULL,1,0,'C','0','0','','button','admin','2024-04-10 08:31:38','admin','2024-04-27 11:30:49',''),(2060,'任务信息',2042,1,'formation','coalitionformation/taskcoalition/TaskCoalition',NULL,1,0,'C','0','0','coalition:formation:list','excel','admin','2024-04-10 08:54:13','admin','2024-04-10 10:55:31','任务信息菜单'),(2061,'任务信息查询',2060,1,'#','',NULL,1,0,'F','0','0','coalition:formation:query','#','admin','2024-04-10 08:54:13','',NULL,''),(2062,'任务信息新增',2060,2,'#','',NULL,1,0,'F','0','0','coalition:formation:add','#','admin','2024-04-10 08:54:14','',NULL,''),(2063,'任务信息修改',2060,3,'#','',NULL,1,0,'F','0','0','coalition:formation:edit','#','admin','2024-04-10 08:54:14','',NULL,''),(2064,'任务信息删除',2060,4,'#','',NULL,1,0,'F','0','0','coalition:formation:remove','#','admin','2024-04-10 08:54:14','',NULL,''),(2065,'任务信息导出',2060,5,'#','',NULL,1,0,'F','0','0','coalition:formation:export','#','admin','2024-04-10 08:54:14','',NULL,''),(2067,'收益评估',0,13,'income','income/StepBar',NULL,1,0,'C','0','0',NULL,'button','admin','2024-04-13 10:35:26','',NULL,''),(2068,'联盟结果',2042,3,'coalitionResult','coalitionformation/coalitionresult/CoalitionResult',NULL,1,0,'C','0','0','coalition:enterprise:list','color','admin','2024-04-15 10:13:10','admin','2024-04-15 10:26:39','企业联盟菜单'),(2069,'企业联盟查询',2068,1,'#','',NULL,1,0,'F','0','0','coalition:enterprise:query','#','admin','2024-04-15 10:13:10','',NULL,''),(2070,'企业联盟新增',2068,2,'#','',NULL,1,0,'F','0','0','coalition:enterprise:add','#','admin','2024-04-15 10:13:10','',NULL,''),(2071,'企业联盟修改',2068,3,'#','',NULL,1,0,'F','0','0','coalition:enterprise:edit','#','admin','2024-04-15 10:13:10','',NULL,''),(2072,'企业联盟删除',2068,4,'#','',NULL,1,0,'F','0','0','coalition:enterprise:remove','#','admin','2024-04-15 10:13:10','',NULL,''),(2073,'企业联盟导出',2068,5,'#','',NULL,1,0,'F','0','0','coalition:enterprise:export','#','admin','2024-04-15 10:13:11','',NULL,''),(2074,'数据共享',0,2,'shareing',NULL,NULL,1,0,'M','0','0','','build','admin','2024-04-16 07:09:57','admin','2024-04-16 07:36:24',''),(2075,'个体共享',2074,1,'auction',NULL,NULL,1,0,'M','0','0','','clipboard','admin','2024-04-16 07:10:49','admin','2024-04-23 07:10:20',''),(2076,'企业群共享',2074,2,'groupSharing',NULL,NULL,1,0,'M','0','0',NULL,'code','admin','2024-04-16 07:11:12','',NULL,''),(2077,'我的共享',2075,1,'history','sharingIncentive/components/mysharing',NULL,1,0,'C','0','0','','cascader','admin','2024-04-16 07:13:15','admin','2024-04-16 07:14:19',''),(2078,'当前共享',2075,2,'current','sharingIncentive/components/currentsharing',NULL,1,0,'C','0','0',NULL,'clipboard','admin','2024-04-16 07:14:02','',NULL,''),(2079,'企业群形成',2078,1,'groupForming','sharingIncentive/components/groupForming',NULL,1,0,'C','0','0',NULL,'404','admin','2024-04-16 07:29:45','',NULL,''),(2080,'群内共享',2078,2,'sharingInGroup','sharingIncentive/components/pureTable',NULL,1,0,'C','0','0',NULL,'drag','admin','2024-04-16 07:31:42','',NULL,''),(2081,'企业群形成',2076,1,'groupForming','sharingIncentive/components/groupForming',NULL,1,0,'C','0','0',NULL,'404','admin','2024-04-16 07:33:19','',NULL,''),(2082,'群内共享',2076,2,'pure','sharingIncentive/components/pureTable',NULL,1,0,'C','0','0',NULL,'clipboard','admin','2024-04-16 07:33:47','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2024-04-01 01:30:05','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2024-04-01 01:30:05','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"群智汇聚\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"dataFusion2/dataFusion\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 06:04:31',87),(101,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"dataFusion2/dataFusion\",\"createTime\":\"2024-04-02 06:04:31\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2041,\"menuName\":\"群智汇聚\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"aa\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 06:05:18',53),(102,'用户管理',1,'com.ruoyi.project.system.controller.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"\",\"nickName\":\"小鸭家电\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":3,\"userName\":\"xyjd\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 06:54:07',142),(103,'用户管理',4,'com.ruoyi.project.system.controller.SysUserController.insertAuthRole()','PUT',1,'admin',NULL,'/system/user/authRole','127.0.0.1','内网IP','{\"roleIds\":\"2\",\"userId\":\"3\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 06:57:01',73),(104,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.dataScope()','PUT',1,'admin',NULL,'/system/role/dataScope','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-04-01 01:29:59\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[100,101,103,104,105,106,107,102,108,109],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 06:58:13',106),(105,'用户管理',2,'com.ruoyi.project.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 06:54:07\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"小鸭家电\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"xyjd\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 07:00:27',142),(106,'用户管理',2,'com.ruoyi.project.system.controller.SysUserController.resetPwd()','PUT',1,'admin',NULL,'/system/user/resetPwd','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 07:00:43',94),(107,'用户管理',4,'com.ruoyi.project.system.controller.SysUserController.insertAuthRole()','PUT',1,'admin',NULL,'/system/user/authRole','127.0.0.1','内网IP','{\"roleIds\":\"2\",\"userId\":\"3\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 07:01:54',84),(108,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-04-01 01:29:59\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[3,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,115,116,1055,1056,1057,1058,1059,1060,117,4,2022,2024,2018,2021,2041],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 07:02:28',154),(109,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/115','127.0.0.1','内网IP','{}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2024-04-02 08:16:19',35),(110,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2012','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2024-04-02 08:16:33',16),(111,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2013','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:16:39',67),(112,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2014','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:16:41',69),(113,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2015','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:16:43',66),(114,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2017','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:16:46',66),(115,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2016','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:16:48',67),(116,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2012','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:16:50',66),(117,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2003','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:16:53',73),(118,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2005','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:16:56',68),(119,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2004','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:16:58',65),(120,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2002','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:17:00',66),(121,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2001','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:17:05',69),(122,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2000','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:17:14',67),(123,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2007','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:17:25',68),(124,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2027','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:17:28',66),(125,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2008','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:17:30',66),(126,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2040','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:17:33',66),(127,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2009','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:17:36',65),(128,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2010','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:17:40',64),(129,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2011','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:17:42',63),(130,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2035','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:17:49',64),(131,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2036','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:17:51',67),(132,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2034','127.0.0.1','内网IP','{}','{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}',0,NULL,'2024-04-02 08:17:53',15),(133,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2037','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:17:55',68),(134,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2039','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:17:57',66),(135,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2038','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:18:00',67),(136,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2034','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:18:03',65),(137,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2029','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:18:09',67),(138,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2030','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:18:11',64),(139,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2032','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:18:13',68),(140,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2033','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:18:15',64),(141,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2031','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:18:18',64),(142,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2028','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:18:21',64),(143,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2006','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:18:26',65),(144,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"群智联盟形成\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"coalitionFormation\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:20:10',76),(145,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"coalitionformation/company/Company.vue\",\"createBy\":\"admin\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"企业信息管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2042,\"path\":\"companyInfo\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:29:34',70),(146,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"coalitionformation/company/Company\",\"createTime\":\"2024-04-02 08:29:34\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2043,\"menuName\":\"企业信息管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2042,\"path\":\"companyInfo\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:30:09',51),(147,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"coalitionformation/taskallocation/TaskAllocation\",\"createBy\":\"admin\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"联盟形成\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2042,\"path\":\"taskallocation\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:36:44',68),(148,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"coalitionformation/coalitionresult/CoalitionResult\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"联盟结果\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2042,\"path\":\"coalitionresult\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:38:17',69),(149,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"coalitionformation/usercenter/UserCenter\",\"createBy\":\"admin\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户中心\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2042,\"path\":\"usercenter\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:39:36',72),(150,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"coalitionformation/company/Company\",\"createTime\":\"2024-04-02 08:29:34\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2043,\"menuName\":\"企业信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2042,\"path\":\"companyInfo\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 08:45:42',51),(151,'字典类型',1,'com.ruoyi.project.system.controller.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"企业状态\",\"dictType\":\"company_status\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 11:21:35',86),(152,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"异常\",\"dictSort\":0,\"dictType\":\"company_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 11:22:00',80),(153,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"空闲\",\"dictSort\":0,\"dictType\":\"company_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 11:22:10',97),(154,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"工作\",\"dictSort\":0,\"dictType\":\"company_status\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 11:22:21',80),(155,'代码生成',6,'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"company_all\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 11:39:01',498),(156,'代码生成',3,'com.ruoyi.project.tool.gen.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/1','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 11:40:13',133),(157,'代码生成',6,'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"company_all\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 11:51:08',464),(158,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"company\",\"className\":\"CompanyAll\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"企业编号\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"企业名称\",\"columnId\":12,\"columnName\":\"name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LayerId\",\"columnComment\":\"产业链网络层编号\",\"columnId\":13,\"columnName\":\"layer_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isRequired\":\"1\",\"javaField\":\"layerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Address\",\"columnComment\":\"企业地址\",\"columnId\":14,\"columnName\":\"address\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"address\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 12:00:33',454),(159,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"company\",\"className\":\"CompanyAll\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"企业编号\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-02 12:00:32\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"企业名称\",\"columnId\":12,\"columnName\":\"name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-02 12:00:32\",\"usableColumn\":false},{\"capJavaField\":\"LayerId\",\"columnComment\":\"产业链网络层编号\",\"columnId\":13,\"columnName\":\"layer_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isRequired\":\"1\",\"javaField\":\"layerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-02 12:00:32\",\"usableColumn\":false},{\"capJavaField\":\"Address\",\"columnComment\":\"企业地址\",\"columnId\":14,\"columnName\":\"address\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"i','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 12:02:18',386),(160,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"company_all\"}',NULL,0,NULL,'2024-04-02 12:02:21',50),(161,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"company\",\"className\":\"CompanyAll\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"企业编号\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-02 12:02:18\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"企业名称\",\"columnId\":12,\"columnName\":\"name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-02 12:02:18\",\"usableColumn\":false},{\"capJavaField\":\"LayerId\",\"columnComment\":\"产业链网络层编号\",\"columnId\":13,\"columnName\":\"layer_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isRequired\":\"1\",\"javaField\":\"layerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-02 12:02:18\",\"usableColumn\":false},{\"capJavaField\":\"Address\",\"columnComment\":\"企业地址\",\"columnId\":14,\"columnName\":\"address\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"i','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 12:12:12',435),(162,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"show\",\"className\":\"CompanyAll\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"企业编号\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-02 12:12:11\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"企业名称\",\"columnId\":12,\"columnName\":\"name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-02 12:12:11\",\"usableColumn\":false},{\"capJavaField\":\"LayerId\",\"columnComment\":\"产业链网络层编号\",\"columnId\":13,\"columnName\":\"layer_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isRequired\":\"1\",\"javaField\":\"layerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-02 12:12:11\",\"usableColumn\":false},{\"capJavaField\":\"Address\",\"columnComment\":\"企业地址\",\"columnId\":14,\"columnName\":\"address\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQu','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 12:12:43',371),(163,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"show\",\"className\":\"CompanyAll\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"企业编号\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-02 12:12:43\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"企业名称\",\"columnId\":12,\"columnName\":\"name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-02 12:12:43\",\"usableColumn\":false},{\"capJavaField\":\"LayerId\",\"columnComment\":\"产业链网络层编号\",\"columnId\":13,\"columnName\":\"layer_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isRequired\":\"1\",\"javaField\":\"layerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-02 12:12:43\",\"usableColumn\":false},{\"capJavaField\":\"Address\",\"columnComment\":\"企业地址\",\"columnId\":14,\"columnName\":\"address\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQu','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 12:13:05',366),(164,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2049','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 12:16:07',90),(165,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2048','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 12:16:09',100),(166,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2051','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 12:16:11',78),(167,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2052','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 12:16:13',72),(168,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2050','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 12:16:15',82),(169,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2047','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 12:16:18',84),(170,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"company_all\"}',NULL,0,NULL,'2024-04-02 12:17:16',59),(171,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2043','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 13:02:02',97),(172,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"company/Company\",\"createTime\":\"2024-04-02 12:18:42\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2053,\"menuName\":\"企业信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2042,\"path\":\"companyInfo\",\"perms\":\"company:show:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-02 13:02:47',68),(173,'用户管理',2,'com.ruoyi.project.system.controller.SysUserController.resetPwd()','PUT',1,'admin',NULL,'/system/user/resetPwd','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-08 07:42:23',99),(174,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"coalitionformation/company/Company\",\"createTime\":\"2024-04-02 12:18:42\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2053,\"menuName\":\"企业信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2042,\"path\":\"companyInfo\",\"perms\":\"company:show:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-08 14:48:22',57),(175,'企业信息',1,'com.ruoyi.project.generate.company.controller.CompanyAllController.add()','POST',1,'admin',NULL,'/company/show','127.0.0.1','内网IP','{\"address\":\"北京\",\"companyType\":\"汽车制造\",\"id\":40,\"layerId\":3,\"name\":\"有鹏出行\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 01:20:58',61),(176,'企业信息',1,'com.ruoyi.project.generate.company.controller.CompanyAllController.add()','POST',1,'admin',NULL,'/company/show','127.0.0.1','内网IP','{\"address\":\"亳州\",\"companyType\":\"玻璃生产\",\"id\":36,\"layerId\":3,\"name\":\"福耀玻璃\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 01:32:53',35),(177,'用户管理',2,'com.ruoyi.project.system.controller.SysUserController.edit()','PUT',1,'xyjd',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-04-01 01:29:58\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":100,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-04-01 01:29:58\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"宁德时代\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"xyjd\",\"userId\":2,\"userName\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 03:14:15',277),(178,'用户管理',1,'com.ruoyi.project.system.controller.SysUserController.add()','POST',1,'xyjd',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"xyjd\",\"deptId\":100,\"nickName\":\"rbkj\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[2],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":4,\"userName\":\"荣百科技\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 03:17:04',235),(179,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin',NULL,'/company/show','127.0.0.1','内网IP','{\"address\":\"北京\",\"companyType\":\"汽车制造\",\"id\":40,\"layerId\":3,\"name\":\"有鹏出行\",\"params\":{},\"rep\":1,\"status\":1}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'40-3\' for key \'company_all.PRIMARY\'\r\n### The error may exist in file [C:\\Users\\USER\\IdeaProjects\\RuoYi-Vue-fast\\target\\classes\\mybatis\\company\\CompanyAllMapper.xml]\r\n### The error may involve com.ruoyi.project.generate.company.mapper.CompanyAllMapper.updateCompanyAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update company_all          SET name = ?,                                           layer_id = ?,                                           address = ?,                                           company_type = ?,                                                                                  rep = ?,                                           status = ?          where id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'40-3\' for key \'company_all.PRIMARY\'\n; Duplicate entry \'40-3\' for key \'company_all.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'40-3\' for key \'company_all.PRIMARY\'','2024-04-10 06:20:37',78),(180,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin',NULL,'/company/show','127.0.0.1','内网IP','{\"address\":\"北京\",\"companyType\":\"汽车制造\",\"id\":40,\"layerId\":3,\"name\":\"有鹏出行\",\"params\":{},\"rep\":1,\"status\":1}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'40-3\' for key \'company_all.PRIMARY\'\r\n### The error may exist in file [C:\\Users\\USER\\IdeaProjects\\RuoYi-Vue-fast\\target\\classes\\mybatis\\company\\CompanyAllMapper.xml]\r\n### The error may involve com.ruoyi.project.generate.company.mapper.CompanyAllMapper.updateCompanyAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update company_all          SET name = ?,                                           layer_id = ?,                                           address = ?,                                           company_type = ?,                                                                                  rep = ?,                                           status = ?          where id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'40-3\' for key \'company_all.PRIMARY\'\n; Duplicate entry \'40-3\' for key \'company_all.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'40-3\' for key \'company_all.PRIMARY\'','2024-04-10 06:27:53',46),(181,'用户管理',2,'com.ruoyi.project.system.controller.SysUserController.edit()','PUT',1,'xyjd',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"xyjd\",\"createTime\":\"2024-04-10 03:17:04\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"荣百科技\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[2],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"xyjd\",\"userId\":4,\"userName\":\"荣百科技\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 06:29:41',168),(182,'用户管理',3,'com.ruoyi.project.system.controller.SysUserController.remove()','DELETE',1,'xyjd',NULL,'/system/user/4','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 06:30:01',114),(183,'用户管理',1,'com.ruoyi.project.system.controller.SysUserController.add()','POST',1,'xyjd',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"xyjd\",\"deptId\":100,\"nickName\":\"荣百科技\",\"params\":{},\"postIds\":[2],\"roleIds\":[2],\"status\":\"0\",\"userId\":5,\"userName\":\"rbkj\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 06:30:38',179),(184,'用户管理',1,'com.ruoyi.project.system.controller.SysUserController.add()','POST',1,'xyjd',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"xyjd\",\"deptId\":100,\"nickName\":\"苏州捷力\",\"params\":{},\"postIds\":[2],\"roleIds\":[2],\"status\":\"0\",\"userId\":6,\"userName\":\"szjl\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 06:30:58',180),(185,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin',NULL,'/company/show','127.0.0.1','内网IP','{\"address\":\"南京\",\"chainName\":\"汽车产业链\",\"companyType\":\"汽车制造业\",\"id\":40,\"layerId\":2,\"name\":\"有鹏出行\",\"params\":{},\"rep\":1,\"status\":1}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'40-2\' for key \'company_all.PRIMARY\'\r\n### The error may exist in file [C:\\Users\\USER\\IdeaProjects\\RuoYi-Vue-fast\\target\\classes\\mybatis\\company\\CompanyAllMapper.xml]\r\n### The error may involve com.ruoyi.project.generate.company.mapper.CompanyAllMapper.updateCompanyAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update company_all          SET name = ?,                                           layer_id = ?,                                           address = ?,                                           company_type = ?,                                           chain_name = ?,                                                                     rep = ?,                                           status = ?          where id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'40-2\' for key \'company_all.PRIMARY\'\n; Duplicate entry \'40-2\' for key \'company_all.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'40-2\' for key \'company_all.PRIMARY\'','2024-04-10 06:31:43',32),(186,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin',NULL,'/company/show','127.0.0.1','内网IP','{\"address\":\"南京\",\"chainName\":\"汽车产业链\",\"companyType\":\"汽车制造业\",\"id\":40,\"layerId\":2,\"name\":\"有鹏出行\",\"params\":{},\"rep\":1,\"status\":1}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'40-2\' for key \'company_all.PRIMARY\'\r\n### The error may exist in file [C:\\Users\\USER\\IdeaProjects\\RuoYi-Vue-fast\\target\\classes\\mybatis\\company\\CompanyAllMapper.xml]\r\n### The error may involve com.ruoyi.project.generate.company.mapper.CompanyAllMapper.updateCompanyAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update company_all          SET name = ?,                                           layer_id = ?,                                           address = ?,                                           company_type = ?,                                           chain_name = ?,                                                                     rep = ?,                                           status = ?          where id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'40-2\' for key \'company_all.PRIMARY\'\n; Duplicate entry \'40-2\' for key \'company_all.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'40-2\' for key \'company_all.PRIMARY\'','2024-04-10 06:32:07',33),(187,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin',NULL,'/company/show','127.0.0.1','内网IP','{\"address\":\"南京\",\"chainName\":\"汽车产业链\",\"companyType\":\"汽车制造业\",\"id\":40,\"layerId\":2,\"name\":\"有鹏出行\",\"params\":{},\"rep\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 06:34:34',41),(188,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin',NULL,'/company/show','127.0.0.1','内网IP','{\"address\":\"北京\",\"companyType\":\"汽车制造\",\"id\":40,\"layerId\":3,\"name\":\"有鹏出行\",\"params\":{},\"rep\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 06:35:18',31),(189,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin',NULL,'/company/show','127.0.0.1','内网IP','{\"address\":\"济南\",\"chainName\":\"汽车产业链\",\"companyType\":\"汽车制造业\",\"id\":2,\"layerId\":1,\"name\":\"宁德时代\",\"params\":{},\"rep\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 06:37:23',31),(190,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin',NULL,'/company/show','127.0.0.1','内网IP','{\"address\":\"济南\",\"chainName\":\"汽车产业链\",\"companyType\":\"汽车制造业\",\"id\":25,\"layerId\":1,\"name\":\"中国铝业\",\"params\":{},\"rep\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 06:42:18',32),(191,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin',NULL,'/company/show','127.0.0.1','内网IP','{\"address\":\"济南\",\"chainName\":\"汽车产业链\",\"companyType\":\"汽车制造业\",\"id\":2,\"layerId\":1,\"name\":\"宁德时代\",\"params\":{},\"rep\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 06:51:48',38),(192,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin',NULL,'/company/show','127.0.0.1','内网IP','{\"address\":\"济南\",\"chainName\":\"汽车产业链\",\"companyType\":\"汽车制造业\",\"id\":25,\"layerId\":1,\"name\":\"中国铝业\",\"params\":{},\"rep\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 06:55:05',28),(193,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin',NULL,'/company/show','127.0.0.1','内网IP','{\"address\":\"济南\",\"chainName\":\"汽车产业链\",\"companyType\":\"汽车制造业\",\"id\":25,\"layerId\":1,\"name\":\"中国铝业\",\"params\":{},\"rep\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 06:57:05',30),(194,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin',NULL,'/company/show','127.0.0.1','内网IP','{\"address\":\"济南\",\"chainName\":\"汽车产业链\",\"companyType\":\"汽车制造业\",\"id\":29,\"layerId\":1,\"name\":\"天纳克有限公司\",\"params\":{},\"rep\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 07:01:04',38),(195,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin',NULL,'/company/show','127.0.0.1','内网IP','{\"address\":\"济南\",\"chainName\":\"汽车产业链\",\"companyType\":\"汽车制造业\",\"id\":10,\"layerId\":1,\"name\":\"南京勇林锐科高新技术有限公司\",\"params\":{},\"rep\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 07:18:23',41),(196,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin',NULL,'/company/show','127.0.0.1','内网IP','{\"address\":\"济南\",\"chainName\":\"汽车产业链\",\"companyType\":\"汽车制造业\",\"id\":10,\"layerId\":1,\"name\":\"南京勇林锐科高新技术有限公司\",\"params\":{},\"rep\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 07:20:54',30),(197,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin',NULL,'/company/show','127.0.0.1','内网IP','{\"address\":\"济南\",\"chainName\":\"汽车产业链\",\"companyType\":\"汽车制造业\",\"id\":8,\"layerId\":1,\"name\":\"中国巨石\",\"params\":{},\"rep\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 07:24:48',30),(198,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2044','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 08:29:18',67),(199,'代码生成',6,'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"task_all\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 08:29:55',412),(200,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"copattern/multimode/indexnew\",\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"多模式协同\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"xietong\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 08:31:38',51),(201,'字典类型',1,'com.ruoyi.project.system.controller.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"任务状态\",\"dictType\":\"task_state\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 08:32:36',66),(202,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未分配\",\"dictSort\":0,\"dictType\":\"task_state\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 08:32:58',64),(203,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已分配\",\"dictSort\":0,\"dictType\":\"task_state\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 08:33:09',62),(204,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已完成\",\"dictSort\":0,\"dictType\":\"task_state\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 08:33:24',63),(205,'字典类型',1,'com.ruoyi.project.system.controller.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"联盟状态\",\"dictType\":\"coalition_state\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 08:33:58',62),(206,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"异常\",\"dictSort\":0,\"dictType\":\"coalition_state\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 08:34:23',62),(207,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"工作\",\"dictSort\":0,\"dictType\":\"coalition_state\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 08:34:35',61),(208,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"空闲\",\"dictSort\":0,\"dictType\":\"coalition_state\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 08:35:11',63),(209,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"all\",\"className\":\"TaskAll\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"任务编号\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 08:29:55\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"任务名称\",\"columnId\":22,\"columnName\":\"name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 08:29:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Val\",\"columnComment\":\"任务价值\",\"columnId\":23,\"columnName\":\"val\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 08:29:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"val\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ArrivalTime\",\"columnComment\":\"任务到达时间\",\"columnId\":24,\"columnName\":\"arrival_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 08:29:55\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"arrivalTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 08:47:47',401),(210,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"formation\",\"className\":\"TaskAll\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"任务编号\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 08:29:55\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-10 08:47:46\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"任务名称\",\"columnId\":22,\"columnName\":\"name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 08:29:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-10 08:47:46\",\"usableColumn\":false},{\"capJavaField\":\"Val\",\"columnComment\":\"任务价值\",\"columnId\":23,\"columnName\":\"val\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 08:29:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"javaField\":\"val\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-10 08:47:46\",\"usableColumn\":false},{\"capJavaField\":\"ArrivalTime\",\"columnComment\":\"任务到达时间\",\"columnId\":24,\"columnName\":\"arrival_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 08:29:55\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 08:49:23',373),(211,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"task_all\"}',NULL,0,NULL,'2024-04-10 08:50:34',157),(212,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"task_all\"}',NULL,0,NULL,'2024-04-10 08:50:44',48),(213,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"task_all\"}',NULL,0,NULL,'2024-04-10 08:52:20',45),(214,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"task_all\"}',NULL,0,NULL,'2024-04-10 08:54:54',55),(215,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.synchDb()','GET',1,'admin',NULL,'/tool/gen/synchDb/task_all','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 08:55:07',426),(216,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"formation\",\"className\":\"TaskAll\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"任务编号\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 08:29:55\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-10 08:55:07\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"任务名称\",\"columnId\":22,\"columnName\":\"name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 08:29:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-10 08:55:07\",\"usableColumn\":false},{\"capJavaField\":\"Val\",\"columnComment\":\"任务价值\",\"columnId\":23,\"columnName\":\"val\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 08:29:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"val\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-10 08:55:07\",\"usableColumn\":false},{\"capJavaField\":\"ArrivalTime\",\"columnComment\":\"任务到达时间\",\"columnId\":24,\"columnName\":\"arrival_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 08:29:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 08:55:22',384),(217,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"formation\",\"className\":\"TaskAll\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"任务编号\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 08:29:55\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-10 08:55:22\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"任务名称\",\"columnId\":22,\"columnName\":\"name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 08:29:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-10 08:55:22\",\"usableColumn\":false},{\"capJavaField\":\"Val\",\"columnComment\":\"任务价值\",\"columnId\":23,\"columnName\":\"val\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 08:29:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"val\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-10 08:55:22\",\"usableColumn\":false},{\"capJavaField\":\"ArrivalTime\",\"columnComment\":\"任务到达时间\",\"columnId\":24,\"columnName\":\"arrival_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 08:29:55\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 08:58:15',411),(218,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"task_all\"}',NULL,0,NULL,'2024-04-10 08:58:17',42),(219,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"coalitionformation/taskcoalition/TaskCoalition\",\"createTime\":\"2024-04-10 08:54:13\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"任务信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2042,\"path\":\"formation\",\"perms\":\"coalition:formation:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 10:55:12',62),(220,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"coalitionformation/taskcoalition/TaskCoalition\",\"createTime\":\"2024-04-10 08:54:13\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2060,\"menuName\":\"任务信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2042,\"path\":\"formation\",\"perms\":\"coalition:formation:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 10:55:31',52),(221,'任务信息',1,'com.ruoyi.project.generate.taskcoalition.controller.TaskAllController.add()','POST',1,'admin',NULL,'/coalition/formation','127.0.0.1','内网IP','{\"arrivalTime\":\"2024-04-10\",\"duration\":123,\"name\":\"test\",\"params\":{},\"productId\":2,\"val\":100}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\USER\\IdeaProjects\\RuoYi-Vue-fast\\target\\classes\\mybatis\\cf\\TaskAllMapper.xml]\r\n### The error may involve com.ruoyi.project.generate.taskcoalition.mapper.TaskAllMapper.insertTaskAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into task_all          ( name,                                           val,                                           arrival_time,                                                                                  duration,                                           product_id )           values ( ?,                                           ?,                                           ?,                                                                                  ?,                                           ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value','2024-04-10 12:48:18',65),(222,'任务信息',1,'com.ruoyi.project.generate.taskcoalition.controller.TaskAllController.add()','POST',1,'admin',NULL,'/coalition/formation','127.0.0.1','内网IP','{\"arrivalTime\":\"2024-04-10\",\"duration\":123,\"name\":\"test\",\"params\":{},\"productId\":2,\"val\":100}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 12:49:31',46),(223,'任务信息',3,'com.ruoyi.project.generate.taskcoalition.controller.TaskAllController.remove()','DELETE',1,'admin',NULL,'/coalition/formation/10','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-10 12:49:39',36),(224,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"copattern/multimode/CompanyRelation\",\"createBy\":\"admin\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"自适应\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"test\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-11 10:51:10',52),(225,'用户管理',2,'com.ruoyi.project.system.controller.SysUserController.resetPwd()','PUT',1,'xyjd',NULL,'/system/user/resetPwd','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"updateBy\":\"xyjd\",\"userId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-11 11:18:40',126),(226,'用户管理',2,'com.ruoyi.project.system.controller.SysUserController.resetPwd()','PUT',1,'xyjd',NULL,'/system/user/resetPwd','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"updateBy\":\"xyjd\",\"userId\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-11 11:18:44',115),(227,'用户管理',2,'com.ruoyi.project.system.controller.SysUserController.resetPwd()','PUT',1,'xyjd',NULL,'/system/user/resetPwd','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"updateBy\":\"xyjd\",\"userId\":5}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-11 11:18:48',114),(228,'用户管理',2,'com.ruoyi.project.system.controller.SysUserController.resetPwd()','PUT',1,'xyjd',NULL,'/system/user/resetPwd','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"updateBy\":\"xyjd\",\"userId\":6}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-11 11:18:52',113),(229,'角色管理',2,'com.ruoyi.project.system.controller.SysRoleController.dataScope()','PUT',1,'ry',NULL,'/system/role/dataScope','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-04-01 01:29:59\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[100,101,103,104,105,106,107,102,108,109],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-11 11:30:18',148),(230,'用户管理',4,'com.ruoyi.project.system.controller.SysUserController.insertAuthRole()','PUT',1,'admin',NULL,'/system/user/authRole','127.0.0.1','内网IP','{\"roleIds\":\"2\",\"userId\":\"4\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-11 11:36:22',86),(231,'用户管理',4,'com.ruoyi.project.system.controller.SysUserController.insertAuthRole()','PUT',1,'admin',NULL,'/system/user/authRole','127.0.0.1','内网IP','{\"roleIds\":\"2\",\"userId\":\"5\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-11 11:36:26',85),(232,'任务信息',2,'com.ruoyi.project.generate.taskcoalition.controller.TaskAllController.edit()','PUT',1,'admin',NULL,'/coalition/formation','127.0.0.1','内网IP','{\"duration\":12,\"id\":11,\"name\":\"家电检测\",\"params\":{},\"productId\":7,\"taskStatus\":0,\"val\":23}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-11 12:33:15',39),(233,'任务信息',1,'com.ruoyi.project.generate.taskcoalition.controller.TaskAllController.add()','POST',1,'admin',NULL,'/coalition/formation','127.0.0.1','内网IP','{\"arrivalTime\":\"2024-04-11\",\"duration\":32,\"name\":\"热镀铝锌生产\",\"params\":{},\"productId\":6,\"val\":23}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-11 12:34:00',33),(234,'任务信息',1,'com.ruoyi.project.generate.taskcoalition.controller.TaskAllController.add()','POST',1,'admin',NULL,'/coalition/formation','127.0.0.1','内网IP','{\"arrivalTime\":\"2024-04-12\",\"chainId\":2,\"companyId\":1,\"duration\":34,\"name\":\"物流运输\",\"params\":{},\"val\":12}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 01:21:59',56),(235,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"执行失败\",\"dictSort\":0,\"dictType\":\"task_state\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 03:22:19',62),(236,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"multimode/CompanyRelation\",\"createTime\":\"2024-04-11 10:51:10\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2066,\"menuName\":\"自适应\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"test\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-13 08:32:09',54),(237,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"multigranularity/haha\",\"createTime\":\"2023-09-05 11:32:11\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2018,\"menuName\":\"产品质量评估\",\"menuType\":\"C\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"test1\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-13 08:32:17',46),(238,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"multigranularity/test2\",\"createTime\":\"2023-09-06 14:54:23\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"企业关系评估\",\"menuType\":\"C\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"223565945\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-13 08:32:25',44),(239,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2066','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-13 08:54:40',55),(240,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"multigranularity/test2/app\",\"createTime\":\"2023-09-12 14:54:26\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"协同效果展示\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"123654\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-13 08:54:53',48),(241,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"multigranularity/test/main\",\"createTime\":\"2023-09-08 11:32:21\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"协同效果评估\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"testss\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-13 10:30:22',40),(242,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"multimode/indexnew\",\"createTime\":\"2024-04-10 08:31:38\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2059,\"menuName\":\"多模式协同\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"xietong\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-13 10:31:03',40),(243,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"multigranularity/test/main\",\"createTime\":\"2023-09-08 11:32:21\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"协同效果评估\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"testss\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-13 10:32:22',47),(244,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-04-02 08:20:10\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2042,\"menuName\":\"群智联盟形成\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"coalitionFormation\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-13 10:33:17',40),(245,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"dataFusion2/dataFusion\",\"createTime\":\"2024-04-02 06:04:31\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2041,\"menuName\":\"群智汇聚\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"aa\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-13 10:33:46',40),(246,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"income/StepBar\",\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"收益评估\",\"menuType\":\"C\",\"orderNum\":13,\"params\":{},\"parentId\":0,\"path\":\"income\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-13 10:35:26',39),(247,'任务信息',2,'com.ruoyi.project.generate.taskcoalition.controller.TaskAllController.edit()','PUT',1,'admin',NULL,'/coalition/formation','127.0.0.1','内网IP','{\"arrivalTime\":\"2024-04-12\",\"chainId\":1,\"coalitionId\":0,\"companyId\":2,\"duration\":34,\"id\":13,\"name\":\"物流运输\",\"params\":{},\"productId\":2,\"taskStatus\":3,\"val\":12}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 06:13:15',32),(248,'代码生成',6,'com.ruoyi.project.tool.gen.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"coalition\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 10:07:12',248),(249,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"enterprise\",\"className\":\"CoalitionEnterprise\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"联盟编号\",\"columnId\":33,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-15 10:07:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"联盟名称\",\"columnId\":34,\"columnName\":\"name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-15 10:07:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TaskId\",\"columnComment\":\"联盟任务编号\",\"columnId\":35,\"columnName\":\"task_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-15 10:07:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"taskId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"联盟创建时间\",\"columnId\":36,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-04-15 10:07:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"javaField\":\"createTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":f','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 10:11:51',217),(250,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"coalition\"}',NULL,0,NULL,'2024-04-15 10:11:53',58),(251,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"enterprise\",\"className\":\"CoalitionEnterprise\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"联盟编号\",\"columnId\":33,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-15 10:07:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-04-15 10:11:51\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"联盟名称\",\"columnId\":34,\"columnName\":\"name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-15 10:07:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-04-15 10:11:51\",\"usableColumn\":false},{\"capJavaField\":\"TaskId\",\"columnComment\":\"联盟任务编号\",\"columnId\":35,\"columnName\":\"task_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-15 10:07:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"taskId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-04-15 10:11:51\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"联盟创建时间\",\"columnId\":36,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-04-15 10:07:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"javaField\":\"crea','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 10:16:03',202),(252,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"enterprise\",\"className\":\"CoalitionEnterprise\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"联盟编号\",\"columnId\":33,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-15 10:07:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-04-15 10:16:03\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"联盟名称\",\"columnId\":34,\"columnName\":\"name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-15 10:07:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-04-15 10:16:03\",\"usableColumn\":false},{\"capJavaField\":\"TaskId\",\"columnComment\":\"联盟任务编号\",\"columnId\":35,\"columnName\":\"task_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-15 10:07:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"taskId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2024-04-15 10:16:03\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"联盟创建时间\",\"columnId\":36,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-04-15 10:07:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"javaField\":\"crea','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 10:16:10',181),(253,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"coalition/enterprise/index\",\"createTime\":\"2024-04-15 10:13:10\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2068,\"menuName\":\"联盟结果\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2042,\"path\":\"enterprise\",\"perms\":\"coalition:enterprise:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"修改菜单\'联盟结果\'失败，菜单名称已存在\",\"code\":500}',0,NULL,'2024-04-15 10:22:38',28),(254,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"coalition/enterprise/index\",\"createTime\":\"2024-04-15 10:13:10\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2068,\"menuName\":\"企业联盟\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2042,\"path\":\"enterprise\",\"perms\":\"coalition:enterprise:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 10:22:54',40),(255,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2045','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 10:25:43',57),(256,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"coalitionformation/coalitionresult/CoalitionResult\",\"createTime\":\"2024-04-15 10:13:10\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2068,\"menuName\":\"企业联盟\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2042,\"path\":\"coalitionResult\",\"perms\":\"coalition:enterprise:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 10:26:01',39),(257,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"coalitionformation/coalitionresult/CoalitionResult\",\"createTime\":\"2024-04-15 10:13:10\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2068,\"menuName\":\"联盟结果\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2042,\"path\":\"coalitionResult\",\"perms\":\"coalition:enterprise:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 10:26:39',35),(258,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"数据共享\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"shareing\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 07:09:57',114),(259,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"拍卖共享\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2074,\"path\":\"auction\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 07:10:49',56),(260,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"code\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"企业群共享\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":2074,\"path\":\"groupSharing\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 07:11:12',54),(261,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"sharingIncentive/components/groupForming\",\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"我的共享\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2075,\"path\":\"history\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 07:13:15',67),(262,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"sharingIncentive/components/currentsharing\",\"createBy\":\"admin\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"当前共享\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2075,\"path\":\"current\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 07:14:02',55),(263,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"sharingIncentive/components/mysharing\",\"createTime\":\"2024-04-16 07:13:15\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2077,\"menuName\":\"我的共享\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2075,\"path\":\"history\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 07:14:19',57),(264,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"sharingIncentive/components/groupForming\",\"createBy\":\"admin\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"企业群形成\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2078,\"path\":\"groupForming\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 07:29:45',53),(265,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"sharingIncentive/components/pureTable\",\"createBy\":\"admin\",\"icon\":\"drag\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"群内共享\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2078,\"path\":\"sharingInGroup\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 07:31:42',70),(266,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"sharingIncentive/components/groupForming\",\"createBy\":\"admin\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"企业群形成\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2076,\"path\":\"groupForming\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 07:33:19',52),(267,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"sharingIncentive/components/pureTable\",\"createBy\":\"admin\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"群内共享\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2076,\"path\":\"pure\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 07:33:47',52),(268,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-04-16 07:09:57\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2074,\"menuName\":\"数据共享\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"shareing\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 07:36:24',50),(269,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2046','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 12:40:49',51),(270,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"test\",\"menuType\":\"M\",\"orderNum\":17,\"params\":{},\"parentId\":0,\"path\":\"test1\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:07:12',59),(271,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2083','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 02:17:15',55),(272,'菜单管理',1,'com.ruoyi.project.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','8.134.59.53','XX XX','{\"children\":[],\"component\":\"coalitionformation/taskcoalition/TaskRelationWM\",\"createBy\":\"admin\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产业链任务关系图\",\"menuType\":\"C\",\"orderNum\":20,\"params\":{},\"parentId\":0,\"path\":\"taskRelationShip\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-22 10:52:42',153),(273,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-04-16 07:10:49\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2075,\"menuName\":\"个体共享\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2074,\"path\":\"auction\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-23 07:10:20',69),(274,'代码生成',8,'com.ruoyi.project.tool.gen.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','8.134.59.53','XX XX','{\"tables\":\"company_all\"}',NULL,0,NULL,'2024-04-24 09:56:54',236),(275,'字典类型',1,'com.ruoyi.project.system.controller.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"产业链阶段\",\"dictType\":\"chain_stage\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-25 06:57:55',156),(276,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"原料供应\",\"dictSort\":0,\"dictType\":\"chain_stage\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-25 06:58:19',54),(277,'字典数据',2,'com.ruoyi.project.system.controller.SysDictDataController.edit()','PUT',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-04-25 06:58:19\",\"default\":false,\"dictCode\":110,\"dictLabel\":\"原料供应\",\"dictSort\":0,\"dictType\":\"chain_stage\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-25 06:58:25',56),(278,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"零件生产\",\"dictSort\":0,\"dictType\":\"chain_stage\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-25 06:58:36',55),(279,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"整机组装\",\"dictSort\":0,\"dictType\":\"chain_stage\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-25 06:58:52',54),(280,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"销售和回收\",\"dictSort\":0,\"dictType\":\"chain_stage\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-25 06:59:01',55),(281,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/company_all','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-25 07:02:05',398),(282,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"show\",\"className\":\"CompanyAll\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"企业编号\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-25 07:02:05\",\"usableColumn\":false},{\"capJavaField\":\"LayerId\",\"columnComment\":\"产业链网络层编号\",\"columnId\":13,\"columnName\":\"layer_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"layerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-25 07:02:05\",\"usableColumn\":false},{\"capJavaField\":\"CompanyType\",\"columnComment\":\"企业在产业链所在阶段（原料供应，零件生产，整机组装，销售和回收）\",\"columnId\":15,\"columnName\":\"company_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"companyType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-25 07:02:05\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"企业名称\",\"columnId\":12,\"columnName\":\"name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"is','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-25 07:02:11',360),(283,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"show\",\"className\":\"CompanyAll\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"企业编号\",\"columnId\":11,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-25 07:02:10\",\"usableColumn\":false},{\"capJavaField\":\"LayerId\",\"columnComment\":\"产业链网络层编号\",\"columnId\":13,\"columnName\":\"layer_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"layerId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-25 07:02:10\",\"usableColumn\":false},{\"capJavaField\":\"CompanyType\",\"columnComment\":\"企业在产业链所在阶段（原料供应，零件生产，整机组装，销售和回收）\",\"columnId\":15,\"columnName\":\"company_type\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"chain_stage\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"companyType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-04-25 07:02:10\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"企业名称\",\"columnId\":12,\"columnName\":\"name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-02 11:51:07\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEd','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-25 07:02:43',350),(284,'企业信息',1,'com.ruoyi.project.generate.company.controller.CompanyAllController.add()','POST',1,'admin','研发部门','/company/show','127.0.0.1','内网IP','{\"address\":\"nn\",\"companyType\":1,\"id\":41,\"layerId\":1,\"name\":\"ry\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-25 15:35:17',51),(285,'企业信息',1,'com.ruoyi.project.generate.company.controller.CompanyAllController.add()','POST',1,'admin','研发部门','/company/show','127.0.0.1','内网IP','{\"companyType\":1,\"id\":42,\"layerId\":1,\"name\":\"test\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-25 15:36:09',48),(286,'企业信息',3,'com.ruoyi.project.generate.company.controller.CompanyAllController.remove()','DELETE',1,'admin','研发部门','/company/show/41','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-25 15:36:39',32),(287,'企业信息',1,'com.ruoyi.project.generate.company.controller.CompanyAllController.add()','POST',1,'admin','研发部门','/company/show','127.0.0.1','内网IP','{\"companyType\":1,\"id\":43,\"layerId\":1,\"name\":\"ry\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-25 15:39:55',60),(288,'企业信息',3,'com.ruoyi.project.generate.company.controller.CompanyAllController.remove()','DELETE',1,'admin','研发部门','/company/show/43','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-25 15:40:17',29),(289,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin','研发部门','/company/show','127.0.0.1','内网IP','{\"address\":\"南京\",\"coalitionId\":0,\"companyType\":1,\"id\":1,\"layerId\":1,\"name\":\"云南天然橡胶\",\"params\":{},\"rep\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-25 15:46:19',30),(290,'企业信息',3,'com.ruoyi.project.generate.company.controller.CompanyAllController.remove()','DELETE',1,'admin','研发部门','/company/show/42','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-25 15:47:26',32),(291,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin','研发部门','/company/show','127.0.0.1','内网IP','{\"address\":\"广州\",\"coalitionId\":0,\"companyType\":1,\"id\":23,\"layerId\":1,\"name\":\"广东浩创钢铁\",\"params\":{},\"processRate\":7,\"rep\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-25 16:09:14',29),(292,'企业信息',1,'com.ruoyi.project.generate.company.controller.CompanyAllController.add()','POST',1,'admin','研发部门','/company/show','127.0.0.1','内网IP','{\"id\":41,\"layerId\":2,\"name\":\"test\",\"params\":{}}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'company_type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\ideaprojects\\RuoYi-Vue-fast\\target\\classes\\mybatis\\company\\CompanyAllMapper.xml]\r\n### The error may involve com.ruoyi.project.generate.company.mapper.CompanyAllMapper.insertCompanyAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into company_all          ( id,                                           name,                                           layer_id )           values ( ?,                                           ?,                                           ? )\r\n### Cause: java.sql.SQLException: Field \'company_type\' doesn\'t have a default value\n; Field \'company_type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'company_type\' doesn\'t have a default value','2024-04-26 02:02:32',60),(293,'企业信息',1,'com.ruoyi.project.generate.company.controller.CompanyAllController.add()','POST',1,'admin','研发部门','/company/show','127.0.0.1','内网IP','{\"id\":41,\"layerId\":2,\"name\":\"test\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 02:05:02',57),(294,'企业信息',3,'com.ruoyi.project.generate.company.controller.CompanyAllController.remove()','DELETE',1,'admin','研发部门','/company/show/41','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 02:10:57',31),(295,'企业信息',1,'com.ruoyi.project.generate.company.controller.CompanyAllController.add()','POST',1,'admin','研发部门','/company/show','127.0.0.1','内网IP','{\"companyType\":1,\"id\":41,\"layerId\":2,\"name\":\"test\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 02:11:13',41),(296,'企业信息',3,'com.ruoyi.project.generate.company.controller.CompanyAllController.remove()','DELETE',1,'admin','研发部门','/company/show/41','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 02:11:45',31),(297,'企业信息',1,'com.ruoyi.project.generate.company.controller.CompanyAllController.add()','POST',1,'admin','研发部门','/company/show','127.0.0.1','内网IP','{\"companyType\":1,\"id\":41,\"layerId\":2,\"name\":\"test\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 02:12:46',44),(298,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin','研发部门','/company/show','127.0.0.1','内网IP','{\"coalitionId\":0,\"companyType\":1,\"id\":41,\"layerId\":2,\"name\":\"test\",\"params\":{},\"rep\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 02:13:31',26),(299,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin','研发部门','/company/show','127.0.0.1','内网IP','{\"coalitionId\":0,\"companyType\":1,\"id\":41,\"layerId\":2,\"name\":\"test\",\"params\":{},\"rep\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 02:17:04',26),(300,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin','研发部门','/company/show','127.0.0.1','内网IP','{\"coalitionId\":0,\"companyType\":1,\"id\":41,\"layerId\":2,\"name\":\"test\",\"params\":{},\"rep\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 02:18:04',24),(301,'企业信息',2,'com.ruoyi.project.generate.company.controller.CompanyAllController.edit()','PUT',1,'admin','研发部门','/company/show','127.0.0.1','内网IP','{\"coalitionId\":0,\"companyType\":1,\"id\":41,\"layerId\":2,\"name\":\"test\",\"params\":{},\"rep\":1,\"status\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 02:20:11',25),(302,'企业信息',3,'com.ruoyi.project.generate.company.controller.CompanyAllController.remove()','DELETE',1,'admin','研发部门','/company/show/41','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 02:40:32',28),(303,'企业信息',1,'com.ruoyi.project.generate.company.controller.CompanyAllController.add()','POST',1,'admin','研发部门','/company/show','127.0.0.1','内网IP','{\"id\":41,\"layerId\":1,\"name\":\"test\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 02:44:05',55),(304,'企业信息',3,'com.ruoyi.project.generate.company.controller.CompanyAllController.remove()','DELETE',1,'admin','研发部门','/company/show/41','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 02:44:21',26),(305,'企业信息',1,'com.ruoyi.project.generate.company.controller.CompanyAllController.add()','POST',1,'admin','研发部门','/company/show','127.0.0.1','内网IP','{\"id\":41,\"layerId\":1,\"name\":\"test2\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 02:44:38',36),(306,'企业信息',1,'com.ruoyi.project.generate.company.controller.CompanyAllController.add()','POST',1,'admin','研发部门','/company/show','127.0.0.1','内网IP','{\"id\":42,\"layerId\":2,\"name\":\"test\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 02:44:48',36),(307,'企业信息',3,'com.ruoyi.project.generate.company.controller.CompanyAllController.remove()','DELETE',1,'admin','研发部门','/company/show/41,42','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 02:45:00',27),(308,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.synchDb()','GET',1,'admin','研发部门','/tool/gen/synchDb/task_all','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 06:20:59',386),(309,'代码生成',2,'com.ruoyi.project.tool.gen.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"formation\",\"className\":\"TaskAll\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"任务编号\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 08:29:55\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-26 06:20:59\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"任务名称\",\"columnId\":22,\"columnName\":\"name\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 08:29:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2024-04-26 06:20:59\",\"usableColumn\":false},{\"capJavaField\":\"TaskType\",\"columnComment\":\"任务类型(原料供应，零件生产，整机组装，销售和回收)\",\"columnId\":41,\"columnName\":\"task_type\",\"columnType\":\"int\",\"createBy\":\"\",\"createTime\":\"2024-04-26 06:20:59\",\"dictType\":\"chain_stage\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"taskType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Val\",\"columnComment\":\"任务价值\",\"columnId\":23,\"columnName\":\"val\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-04-10 08:29:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isIns','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 06:21:20',376),(310,'任务信息',1,'com.ruoyi.project.generate.taskcoalition.controller.TaskAllController.add()','POST',1,'admin','研发部门','/coalition/formation','127.0.0.1','内网IP','{\"arrivalTime\":\"2024-04-26\",\"chainId\":3,\"companyId\":1,\"duration\":12,\"name\":\"ry-test\",\"params\":{},\"productId\":2,\"taskType\":1,\"val\":12}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 08:37:43',46),(311,'任务信息',3,'com.ruoyi.project.generate.taskcoalition.controller.TaskAllController.remove()','DELETE',1,'admin','研发部门','/coalition/formation/24','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 10:50:28',29),(312,'任务信息',1,'com.ruoyi.project.generate.taskcoalition.controller.TaskAllController.add()','POST',1,'admin','研发部门','/coalition/formation','127.0.0.1','内网IP','{\"arrivalTime\":\"2024-04-26\",\"chainId\":3,\"companyId\":1,\"name\":\"ry-test\",\"params\":{},\"taskType\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 10:51:27',53),(313,'任务信息',3,'com.ruoyi.project.generate.taskcoalition.controller.TaskAllController.remove()','DELETE',1,'admin','研发部门','/coalition/formation/25','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-26 13:22:51',37),(314,'字典类型',1,'com.ruoyi.project.system.controller.SysDictTypeController.add()','POST',1,'admin','研发部门','/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"产业链名称\",\"dictType\":\"chain\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-27 02:01:30',146),(315,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"洗衣机产业链\",\"dictSort\":0,\"dictType\":\"chain\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-27 02:01:47',56),(316,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"空调产业链\",\"dictSort\":0,\"dictType\":\"chain\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-27 02:02:00',59),(317,'字典数据',1,'com.ruoyi.project.system.controller.SysDictDataController.add()','POST',1,'admin','研发部门','/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"汽车产业链\",\"dictSort\":0,\"dictType\":\"chain\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-27 02:02:12',55),(318,'菜单管理',2,'com.ruoyi.project.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"multimode/indexmode\",\"createTime\":\"2024-04-10 08:31:38\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2059,\"menuName\":\"多模式协同\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"xietong\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-27 11:30:49',56),(319,'菜单管理',3,'com.ruoyi.project.system.controller.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2084','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-27 12:19:54',66),(320,'任务信息',1,'com.ruoyi.project.generate.taskcoalition.controller.TaskAllController.add()','POST',1,'admin','研发部门','/coalition/formation','127.0.0.1','内网IP','{\"arrivalTime\":\"2024-04-28\",\"chainId\":2,\"companyId\":1,\"duration\":12,\"name\":\"ry-test\",\"params\":{},\"productId\":9,\"taskType\":1,\"val\":23}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-28 06:54:47',73),(321,'任务信息',3,'com.ruoyi.project.generate.taskcoalition.controller.TaskAllController.remove()','DELETE',1,'admin','研发部门','/coalition/formation/58','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-28 10:58:13',95),(322,'任务信息',1,'com.ruoyi.project.generate.taskcoalition.controller.TaskAllController.add()','POST',1,'admin','研发部门','/coalition/formation','127.0.0.1','内网IP','{\"arrivalTime\":\"2024-04-28\",\"chainId\":2,\"companyId\":1,\"name\":\"ry-test\",\"params\":{},\"productId\":3,\"taskType\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-28 10:59:15',57),(323,'任务信息',1,'com.ruoyi.project.generate.taskcoalition.controller.TaskAllController.add()','POST',1,'admin','研发部门','/coalition/formation','127.0.0.1','内网IP','{\"arrivalTime\":\"2024-04-28\",\"chainId\":1,\"companyId\":1,\"name\":\"ry-test2\",\"params\":{},\"taskType\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-28 10:59:30',37),(324,'任务信息',3,'com.ruoyi.project.generate.taskcoalition.controller.TaskAllController.remove()','DELETE',1,'admin','研发部门','/coalition/formation/60','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-28 10:59:40',79),(325,'任务信息',3,'com.ruoyi.project.generate.taskcoalition.controller.TaskAllController.remove()','DELETE',1,'admin','研发部门','/coalition/formation/59','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-28 10:59:44',84);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2024-04-01 01:29:58','',NULL,''),(2,'se','项目经理',2,'0','admin','2024-04-01 01:29:58','',NULL,''),(3,'hr','人力资源',3,'0','admin','2024-04-01 01:29:58','',NULL,''),(4,'user','普通员工',4,'0','admin','2024-04-01 01:29:58','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-04-01 01:29:59','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2024-04-01 01:29:59','admin','2024-04-11 11:30:18','普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(2,2018),(2,2021),(2,2022),(2,2024),(2,2041);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','若依科技','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-04-28 23:32:06','admin','2024-04-01 01:29:58','','2024-04-28 15:32:07','管理员'),(2,100,'ry','宁德时代','00','ry@qq.com','15666666666','1','','$2a$10$..8/fVwft9/ZbzEK.9nNruJSDHli/vVmiAeOZ3yABbk.bd4bmPBS6','0','0','127.0.0.1','2024-04-11 19:27:53','admin','2024-04-01 01:29:58','xyjd','2024-04-11 11:27:52','测试员'),(3,100,'xyjd','小鸭家电','00','','','0','','$2a$10$zEtz9lMARE2Pum9ULTDVC.Tags45FOtA/FIBTpo.Ek5OeRe22f1H6','0','0','127.0.0.1','2024-04-12 19:10:11','admin','2024-04-02 06:54:07','xyjd','2024-04-12 11:10:11',NULL),(4,100,'rbkj','荣百科技','00','','','0','','$2a$10$/Sl7NGpB1uHL4e6WtMGjiuqEIJCV1AdXJl.hHVrEAB3Fa49C44ufC','0','0','127.0.0.1','2024-04-11 19:35:28','xyjd','2024-04-10 06:30:38','xyjd','2024-04-11 11:35:28',NULL),(5,100,'szjl','苏州捷力','00','','','0','','$2a$10$JMQ8dW8Ij2okz9ELWnQ09.SqqGQU95A06rEeINvqpukaG3twF0nmC','0','0','127.0.0.1','2024-04-11 19:24:30','xyjd','2024-04-10 06:30:58','xyjd','2024-04-11 11:24:30',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2),(5,2),(6,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(3,2),(4,2),(5,2),(6,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_all`
--

DROP TABLE IF EXISTS `task_all`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_all` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '任务编号',
  `name` varchar(20) DEFAULT NULL COMMENT '任务名称',
  `task_type` int DEFAULT NULL COMMENT '任务类型(原料供应，零件生产，整机组装，销售和回收)',
  `val` int DEFAULT '40' COMMENT '任务价值',
  `arrival_time` datetime DEFAULT NULL COMMENT '任务到达时间',
  `coalition_time` datetime DEFAULT NULL COMMENT '联盟形成时间',
  `finish_time` datetime DEFAULT NULL COMMENT '任务完成时间',
  `task_status` int DEFAULT '0' COMMENT '任务状态（0 等待分配，1 已分配，2已完成,3执行失败）',
  `duration` int DEFAULT '30' COMMENT '任务持续时长',
  `product_id` int DEFAULT NULL COMMENT '产品编号',
  `coalition_id` int DEFAULT '0' COMMENT '联盟编号',
  `chain_id` int DEFAULT '1' COMMENT '所属产业链编号',
  `company_id` int DEFAULT '1' COMMENT '任务所属企业编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_all`
--

LOCK TABLES `task_all` WRITE;
/*!40000 ALTER TABLE `task_all` DISABLE KEYS */;
INSERT INTO `task_all` VALUES (1,'橡胶制造',1,29,'2024-04-10 19:13:30','2024-04-28 21:16:27',NULL,1,13,6,45,1,20),(2,'塑料产品生产',1,25,'2024-04-10 19:13:37','2024-04-22 19:48:52',NULL,0,17,7,0,1,39),(3,'半导体制造',1,49,'2024-04-10 19:13:41','2024-04-28 21:16:41',NULL,1,15,2,46,1,7),(4,'功能涂料合成',1,34,'2024-04-10 19:13:43','2024-04-28 20:59:43',NULL,0,10,4,0,1,26),(5,'金属冶炼加工',1,48,'2024-04-10 19:13:45','2024-04-22 19:48:59',NULL,0,11,2,0,1,37),(6,'热镀铝锌生产',1,25,'2024-04-10 19:13:46','2024-04-28 20:43:04',NULL,0,11,5,0,1,38),(7,'电刷材料制造',1,35,'2024-04-10 19:13:48','2024-04-28 16:44:25',NULL,0,15,9,0,1,13),(8,'磁性材料制造',1,28,'2024-04-10 19:13:50','2024-04-20 09:45:09',NULL,2,17,1,3,1,30),(9,'传动材料制造',2,33,'2024-04-11 20:34:28',NULL,NULL,0,15,7,0,1,24),(10,'脱水桶制造',2,33,'2024-04-11 20:33:59','2024-04-19 23:48:44',NULL,0,18,7,0,1,28),(11,'电子元器件制造',2,45,'2024-04-12 00:00:00','2024-04-22 19:48:56',NULL,2,17,1,2,1,38),(12,'金属机箱制造',2,43,'2024-04-22 19:01:01',NULL,NULL,0,18,5,0,1,14),(13,'轴承制造',2,22,'2024-04-22 19:04:12',NULL,NULL,2,11,2,4,1,12),(14,'电机制造',2,49,'2024-04-22 19:04:51','2024-04-28 21:42:13',NULL,1,12,2,51,1,3),(15,'家电检测',3,46,'2024-04-22 19:05:14',NULL,NULL,0,18,8,0,1,8),(16,'洗衣机制造',3,39,'2024-04-22 19:05:35',NULL,NULL,0,19,4,0,1,36),(17,'物流运输',4,33,'2024-04-22 19:06:07',NULL,NULL,3,19,6,1,1,23),(18,'家电零售',4,40,'2024-04-22 19:06:26',NULL,NULL,0,12,7,0,1,8),(19,'设备维护',4,36,'2024-04-22 19:07:03',NULL,NULL,0,10,6,0,1,13),(20,'家电回收',4,48,'2024-04-22 19:08:02',NULL,NULL,0,11,4,0,1,32),(21,'金属冶炼加工',1,43,NULL,'2024-04-28 20:59:51',NULL,0,17,7,0,2,24),(22,'金属导线',1,28,NULL,NULL,NULL,0,18,10,0,2,50),(23,'电路板供应',1,28,NULL,NULL,NULL,0,18,1,0,2,44),(24,'组件及附件制造',2,38,NULL,NULL,NULL,0,11,8,0,2,49),(25,'密封件及减震垫制造',2,39,NULL,NULL,NULL,0,19,3,0,2,24),(26,'压缩机及冷凝器制造',2,48,NULL,NULL,NULL,0,13,7,0,2,11),(27,'过滤网生产',2,37,NULL,NULL,NULL,0,15,5,0,2,55),(28,'冷却和控制系统的电子元件供应',2,24,NULL,NULL,NULL,0,12,10,0,2,48),(29,'绝缘材料制造',3,20,NULL,'2024-04-28 20:59:57',NULL,0,13,10,0,2,31),(30,'遥控器制造',2,39,NULL,NULL,NULL,0,17,2,0,2,50),(31,'家电检测',3,47,NULL,'2024-04-28 21:17:09',NULL,1,18,10,47,2,40),(32,'冰箱制造',3,30,NULL,NULL,NULL,0,18,3,0,2,51),(33,'物流运输',4,34,NULL,NULL,NULL,0,12,7,0,2,30),(34,'家电零售',4,46,NULL,'2024-04-28 21:17:17',NULL,1,19,5,48,2,48),(35,'设备维护',4,25,NULL,NULL,NULL,0,14,4,0,2,10),(36,'家电回收',4,21,NULL,NULL,NULL,0,14,9,0,2,43),(37,'锂矿提供',1,43,NULL,'2024-04-28 21:17:41',NULL,1,12,1,49,3,71),(38,'钴矿提供',1,28,NULL,NULL,NULL,0,18,8,0,3,69),(39,'镍矿提供',1,49,NULL,NULL,NULL,0,10,8,0,3,4),(40,'稀土矿提供',1,24,NULL,NULL,NULL,0,18,1,0,3,84),(41,'橡胶制造',1,48,NULL,NULL,NULL,0,18,4,0,3,61),(42,'正极材料制造',1,33,NULL,NULL,NULL,0,16,3,0,3,81),(43,'负极材料制造',1,34,NULL,NULL,NULL,0,10,3,0,3,59),(44,'塑件制造',1,43,NULL,NULL,NULL,0,16,8,0,3,59),(45,'车灯组装',2,24,NULL,NULL,NULL,0,14,4,0,3,64),(46,'动力电池制造',2,33,NULL,NULL,NULL,0,10,1,0,3,34),(47,'轮胎制造',2,39,NULL,NULL,NULL,0,17,10,0,3,58),(48,'座椅总成',2,39,NULL,NULL,NULL,0,19,5,0,3,2),(49,'电机模块组装',2,23,NULL,NULL,NULL,0,15,10,0,3,34),(50,'车身摸具制造',2,23,NULL,NULL,NULL,0,16,8,0,3,71),(51,'整车制造',3,45,NULL,'2024-04-28 20:46:25',NULL,0,11,8,0,3,87),(52,'汽车维修',3,41,NULL,NULL,NULL,0,19,8,0,3,35),(53,'物流运输',4,30,NULL,NULL,NULL,0,15,2,0,3,63),(54,'汽车销售',4,45,NULL,NULL,NULL,0,18,6,0,3,7),(55,'二手车交易',4,33,NULL,'2024-04-28 20:45:49',NULL,0,14,9,0,3,85),(56,'出行服务',4,48,NULL,NULL,NULL,3,18,10,0,3,61),(57,'充电网络及服务',4,48,NULL,'2024-04-28 21:17:44',NULL,1,11,2,50,3,79);
/*!40000 ALTER TABLE `task_all` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_resource`
--

DROP TABLE IF EXISTS `task_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_resource` (
  `task_id` int NOT NULL COMMENT '任务编号',
  `resource_id` int NOT NULL COMMENT '技能编号',
  `number` int DEFAULT NULL COMMENT '资源需求量',
  PRIMARY KEY (`task_id`,`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='任务技能表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_resource`
--

LOCK TABLES `task_resource` WRITE;
/*!40000 ALTER TABLE `task_resource` DISABLE KEYS */;
INSERT INTO `task_resource` VALUES (1,2,260),(1,4,315),(1,6,340),(1,12,322),(1,13,300),(2,2,241),(2,3,215),(2,7,382),(2,8,353),(2,13,398),(3,4,335),(3,6,346),(3,7,304),(3,12,237),(3,13,332),(4,2,329),(4,5,247),(4,7,378),(4,9,351),(4,12,236),(5,2,301),(5,3,258),(5,4,304),(5,7,314),(5,13,201),(6,3,288),(6,5,331),(6,7,246),(7,3,317),(7,5,320),(7,6,352),(7,7,275),(7,12,376),(8,1,294),(8,3,365),(8,9,280),(8,10,307),(8,15,314),(9,17,265),(9,19,253),(9,22,365),(9,28,231),(9,30,301),(10,21,325),(10,22,252),(10,25,350),(10,26,288),(10,27,283),(11,24,257),(11,26,253),(11,28,321),(11,29,203),(11,30,200),(12,22,304),(12,23,370),(12,26,334),(12,27,318),(12,29,361),(13,16,270),(13,22,328),(13,23,229),(13,24,342),(13,25,361),(14,18,336),(14,19,316),(14,25,329),(14,28,212),(14,29,240),(15,33,395),(15,34,250),(15,40,260),(15,42,219),(15,44,286),(16,34,200),(16,37,204),(16,39,360),(16,40,321),(16,44,266),(17,31,359),(17,32,257),(17,36,236),(17,43,303),(17,44,273),(18,50,140),(18,51,130),(18,56,200),(19,49,280),(19,54,283),(19,56,376),(19,57,372),(20,47,260),(20,48,318),(20,56,242),(20,57,315),(21,1,330),(21,9,343),(21,14,221),(22,2,276),(22,7,239),(22,9,368),(22,12,312),(22,14,323),(23,1,278),(23,6,212),(23,7,392),(23,10,230),(23,14,313),(24,16,208),(24,21,319),(24,23,224),(24,27,273),(24,29,295),(25,18,320),(25,19,239),(25,20,357),(25,24,328),(25,28,215),(26,18,317),(26,21,336),(26,23,268),(26,27,374),(26,28,389),(27,16,385),(27,17,267),(27,23,248),(27,25,351),(27,30,391),(28,17,393),(28,20,267),(28,24,285),(28,28,325),(28,30,279),(29,31,204),(29,34,385),(29,36,218),(29,39,227),(29,42,212),(30,18,356),(30,20,372),(30,21,253),(30,23,394),(30,28,335),(31,32,221),(31,33,234),(31,34,291),(31,43,211),(31,44,306),(32,32,377),(32,33,389),(32,36,284),(32,39,366),(32,40,284),(33,46,309),(33,48,294),(33,49,361),(33,50,275),(34,47,395),(34,48,396),(34,54,272),(34,57,356),(35,49,223),(35,50,374),(35,52,389),(35,54,309),(36,50,343),(36,51,331),(36,54,237),(36,56,321),(37,2,230),(37,3,275),(37,5,203),(38,1,223),(38,2,292),(38,3,276),(38,5,229),(38,6,364),(39,2,386),(39,5,221),(39,7,372),(39,13,264),(39,14,307),(40,6,280),(40,10,271),(40,11,244),(40,12,317),(40,13,242),(41,1,201),(41,5,327),(41,9,365),(41,12,396),(41,14,217),(42,3,266),(42,4,289),(42,10,214),(42,12,211),(42,15,322),(43,2,317),(43,4,307),(43,9,268),(43,10,327),(43,14,203),(44,1,397),(44,3,211),(44,4,391),(44,5,386),(44,13,313),(45,18,294),(45,21,307),(45,22,400),(45,23,325),(45,27,296),(46,16,274),(46,19,226),(46,23,377),(46,25,351),(46,26,320),(47,16,260),(47,22,394),(47,24,247),(47,25,281),(47,27,252),(48,16,216),(48,17,252),(48,19,273),(48,27,263),(48,28,207),(49,18,281),(49,21,262),(49,22,343),(49,23,221),(49,29,217),(50,16,337),(50,17,225),(50,20,318),(50,25,315),(50,28,353),(51,33,380),(51,37,370),(51,41,293),(51,43,370),(51,45,338),(52,32,366),(52,36,263),(52,43,204),(52,44,335),(52,45,311),(53,46,335),(53,52,262),(53,53,308),(53,54,353),(54,51,270),(54,53,342),(54,54,339),(54,57,323),(55,46,362),(55,47,240),(55,51,289),(55,52,358),(56,48,202),(56,51,347),(56,54,231),(56,56,394),(57,46,312),(57,49,256),(57,51,206),(57,54,295);
/*!40000 ALTER TABLE `task_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `taskName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `taskReleaser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `profit` int DEFAULT NULL,
  `dataRelease` date DEFAULT NULL,
  `dataFinish` date DEFAULT NULL,
  `taskState` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dataProviders` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `dataProviderValues` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `dataProviderRates` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `accepter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `chain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `commentScore` int DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `enterpriseRelationshipStrength` int DEFAULT NULL,
  `sharedPointsGain` int DEFAULT NULL,
  `continuousSharingRewards` int DEFAULT NULL,
  `afterSalesEvaluationGain` int DEFAULT NULL,
  `dataNames` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,'四月橡胶销量','小鸭集团',10,'2023-05-01','2023-06-01','已完成','玲珑轮胎,赛轮轮胎','20,15','87,13','南孚电池','汽车产业链',3,'符合要求',8,20,15,5,'南孚电池4月电池销量,超威电池4月电池销量1'),(2,'五月A型芯片计划产量','小鸭集团',50,'2023-04-12','2022-04-13','已完成','中兴公司,台积电','85,15','68,32','台积电','家电产业链',1,'数据量偏小，不推荐',8,20,15,5,'南孚电池4月电池销量,超威电池4月电池销量2'),(3,'618家电类销售综合数据','小鸭集团',100,'2023-02-01','2022-02-12','已完成','淘宝,京东,拼多多','20,15,42','21,25,54','京东','家电产业链',3,'/',8,20,15,5,'南孚电池4月电池销量,超威电池4月电池销量3,超威电池4月电池销量3'),(5,'双十一电视销售数据','闲鱼',100,'2022-05-01','2022-06-01','已完成','小鸭家电,苏宁家电,国美家电','20,15,23','56,13,31','小鸭家电','家电产业链',3,'/',8,20,15,5,'南孚电池4月电池销量,超威电池4月电池销4,超威电池4月电池销4'),(6,'六月橡胶销量','小鸭集团',10,'2023-05-01','2023-06-01','待交付','三维股份,震安科技','19,21','46,54','南孚电池','汽车产业链',4,'符合要求',8,20,15,5,'南孚电池4月电池销量,超威电池4月电池销量5'),(7,'四月电池销量','小鸭集团',10,'2023-05-01','2023-06-01','已完成','南孚电池,超威电池','20,15','87,13','南孚电池','家电产业链',3,'符合要求',8,20,15,5,'南孚电池4月电池销量,超威电池4月电池销量6'),(8,'五月A型芯片计划产量','小鸭集团',50,'2023-04-12','2022-04-13','已完成','中兴公司,台积电','85,15','68,32','台积电','家电产业链',1,'数据量偏小，不推荐',8,20,15,5,'南孚电池4月电池销量,超威电池4月电池销量7'),(9,'618家电类销售综合数据','小鸭集团',100,'2023-02-01','2022-02-12','已完成','淘宝,京东,拼多多','20,15,42','21,25,54','京东','家电产业链',3,'/',8,20,15,5,'南孚电池4月电池销量,超威电池4月电池销量8,超威电池4月电池销量8'),(11,'双十一电视销售数据','闲鱼',100,'2022-05-01','2022-06-01','已完成','小鸭家电,苏宁家电,国美家电','20,15,23','56,13,31','小鸭家电','家电产业链',3,'/',8,20,15,5,'南孚电池4月电池销量,超威电池4月电池销量9,超威电池4月电池销量9'),(12,'六月橡胶销量','小鸭集团',10,'2023-05-01','2023-06-01','待交付','三维股份,震安科技','19,21','46,54','南孚电池','家电产业链',4,'符合要求',8,20,15,5,'南孚电池4月电池销量,超威电池4月电池销量10'),(13,'四月电池销量','小鸭集团',10,'2023-05-01','2023-06-01','已完成','南孚电池,超威电池','20,15','87,13','南孚电池','汽车产业链',3,'符合要求',8,20,15,5,'南孚电池4月电池销量,超威电池4月电池销量11'),(14,'五月A型芯片计划产量','小鸭集团',50,'2023-04-12','2022-04-13','已完成','中兴公司,台积电','85,15','68,32','台积电','家电产业链',1,'数据量偏小，不推荐',8,20,15,5,'南孚电池4月电池销量,超威电池4月电池销量12'),(15,'618家电类销售综合数据','小鸭集团',100,'2023-02-01','2022-02-12','已完成','淘宝,京东,拼多多','20,15,42','21,25,54','京东','家电产业链',3,'/',8,20,15,5,'南孚电池4月电池销量,超威电池4月电池销量13,超威电池4月电池销量13'),(17,'双十一电视销售数据','闲鱼',100,'2022-05-01','2022-06-01','已完成','小鸭家电,苏宁家电,国美家电','20,15,23','56,13,31','小鸭家电','家电产业链',3,'/',8,20,15,5,'南孚电池4月电池销量,超威电池4月电池销量14,超威电池4月电池销量14'),(18,'六月橡胶销量','小鸭集团',10,'2023-05-01','2023-06-01','待交付','三维股份,震安科技','19,21','46,54','南孚电池','家电产业链',4,'符合要求',8,20,15,5,'南孚电池4月电池销量,超威电池4月电池销量15'),(19,'六月橡胶销量','小鸭集团',10,'2023-05-01','2023-06-01','进行中','三维股份,震安科技','19,21','46,54','南孚电池','家电产业链',4,'符合要求',8,20,15,5,'南孚电池4月电池销量,超威电池4月电池销量16'),(20,'六月橡胶销量','小鸭集团',10,'2023-05-01','2023-06-01','进行中','三维股份,震安科技','19,21','46,54','南孚电池','家电产业链',4,'符合要求',8,20,15,5,'南孚电池4月电池销量,超威电池4月电池销量17');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-06 16:19:51
