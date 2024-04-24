CREATE DATABASE  IF NOT EXISTS `mingsha_cloud` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `mingsha_cloud`;
-- MySQL dump 10.13  Distrib 8.0.32, for macos13 (x86_64)
--
-- Host: 127.0.0.1    Database: mingsha_cloud
-- ------------------------------------------------------
-- Server version	5.7.31

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
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) DEFAULT NULL COMMENT '归属表编号',
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
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-04-16 17:55:14','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-04-16 17:55:14','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-04-16 17:55:14','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-04-16 17:55:14','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(5,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-04-16 17:55:14','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
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
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','鸣沙科技',0,'鸣沙','18388888888','mingsha@site.com','0','0','admin','2024-04-16 17:55:14','',NULL),(101,100,'0,100','大研发事业群',1,'鸣沙','18388888888','mingsha@site.com','0','0','admin','2024-04-16 17:55:14','admin','2024-04-17 17:23:15'),(103,101,'0,100,101','研发部门',1,'鸣沙','18388888888','mingsha@site.com','0','0','admin','2024-04-16 17:55:14','',NULL),(105,101,'0,100,101','测试部门',3,'鸣沙','18388888888','mingsha@site.com','0','0','admin','2024-04-16 17:55:14','',NULL),(107,101,'0,100,101','运维部门',5,'鸣沙','18388888888','mingsha@site.com','0','0','admin','2024-04-16 17:55:14','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-04-16 17:55:14','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-04-16 17:55:14','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-04-16 17:55:14','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-04-16 17:55:14','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-04-16 17:55:14','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-04-16 17:55:14','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-04-16 17:55:14','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-04-16 17:55:14','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-04-16 17:55:14','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-04-16 17:55:14','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-04-16 17:55:14','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-04-16 17:55:14','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-04-16 17:55:14','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-04-16 17:55:14','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-04-16 17:55:14','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-04-16 17:55:14','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-04-16 17:55:14','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-04-16 17:55:14','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-04-16 17:55:14','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-04-16 17:55:14','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-04-16 17:55:14','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-04-16 17:55:14','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-04-16 17:55:14','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-04-16 17:55:14','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-04-16 17:55:14','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-04-16 17:55:14','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-04-16 17:55:14','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-04-16 17:55:14','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-04-16 17:55:14','',NULL,'停用状态');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-04-16 17:55:14','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-04-16 17:55:14','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-04-16 17:55:14','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-04-16 17:55:14','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-04-16 17:55:14','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-04-16 17:55:14','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-04-16 17:55:14','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-04-16 17:55:14','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-04-16 17:55:14','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-04-16 17:55:14','',NULL,'登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-04-16 17:55:15','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-04-16 17:55:15','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-04-16 17:55:15','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度日志表';
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
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示信息',
  `access_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`access_time`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','0','登录成功','2024-04-16 19:15:50'),(101,'admin','192.168.65.1','0','退出成功','2024-04-17 11:18:28'),(102,'admin','192.168.65.1','0','登录成功','2024-04-17 11:18:41'),(103,'admin','192.168.65.1','0','退出成功','2024-04-17 11:21:47'),(104,'admin','192.168.65.1','0','登录成功','2024-04-17 11:21:50'),(105,'admin','192.168.65.1','0','登录成功','2024-04-17 16:55:42'),(106,'admin','192.168.65.1','0','退出成功','2024-04-17 17:02:44'),(107,'admin','192.168.65.1','0','登录成功','2024-04-17 17:02:51'),(108,'admin','192.168.65.1','0','退出成功','2024-04-17 17:06:20'),(109,'admin','192.168.65.1','0','登录成功','2024-04-17 17:06:27'),(110,'admin','192.168.65.1','0','退出成功','2024-04-17 17:30:41'),(111,'mingsha','192.168.65.1','0','登录成功','2024-04-17 17:30:50'),(112,'mingsha','192.168.65.1','0','退出成功','2024-04-17 17:31:23'),(113,'admin','192.168.65.1','0','登录成功','2024-04-17 17:31:27'),(114,'admin','192.168.65.1','0','退出成功','2024-04-17 17:31:37'),(115,'mingsha','192.168.65.1','0','登录成功','2024-04-17 17:31:47'),(116,'mingsha','192.168.65.1','0','退出成功','2024-04-17 17:32:00'),(117,'admin','127.0.0.1','0','登录成功','2024-04-17 17:34:32'),(118,'admin','192.168.65.1','0','退出成功','2024-04-17 17:43:26'),(119,'admin','192.168.65.1','0','登录成功','2024-04-17 17:43:28'),(120,'admin','192.168.65.1','0','登录成功','2024-04-17 17:43:59'),(121,'admin','192.168.65.1','0','登录成功','2024-04-19 11:40:42'),(122,'admin','192.168.65.1','0','退出成功','2024-04-19 13:31:15'),(123,'admin','192.168.65.1','0','登录成功','2024-04-19 13:31:20'),(124,'admin','192.168.65.1','0','退出成功','2024-04-19 13:31:30'),(125,'admin','192.168.65.1','0','登录成功','2024-04-19 13:31:35'),(126,'admin','192.168.65.1','0','登录成功','2024-04-21 00:35:41'),(127,'admin','192.168.65.1','0','登录成功','2024-04-21 00:36:02'),(128,'admin','192.168.65.1','0','退出成功','2024-04-21 00:37:31'),(129,'admin','192.168.65.1','0','登录成功','2024-04-21 00:37:35'),(130,'admin','192.168.65.1','0','退出成功','2024-04-21 00:39:17'),(131,'admin','192.168.65.1','0','登录成功','2024-04-21 00:39:18'),(132,'admin','192.168.65.1','0','登录成功','2024-04-21 02:23:51'),(133,'admin','192.168.65.1','0','登录成功','2024-04-21 04:03:18'),(134,'admin','192.168.65.1','0','登录成功','2024-04-21 04:21:24'),(135,'admin','192.168.65.1','0','退出成功','2024-04-21 06:27:40'),(136,'admin','192.168.65.1','0','登录成功','2024-04-21 06:27:43'),(137,'admin','192.168.65.1','0','退出成功','2024-04-21 07:39:35'),(138,'admin','192.168.65.1','0','登录成功','2024-04-21 07:39:39'),(139,'admin','192.168.65.1','0','退出成功','2024-04-21 07:55:13'),(140,'admin','192.168.65.1','0','登录成功','2024-04-21 07:55:21'),(141,'admin','192.168.65.1','0','退出成功','2024-04-21 07:55:32'),(142,'admin','192.168.65.1','0','登录成功','2024-04-21 07:56:04'),(143,'admin','192.168.65.1','0','退出成功','2024-04-21 08:01:00'),(144,'admin','192.168.65.1','0','登录成功','2024-04-21 08:01:04'),(145,'admin','192.168.65.1','0','退出成功','2024-04-21 08:01:09'),(146,'admin','192.168.65.1','0','登录成功','2024-04-21 08:02:10'),(147,'admin','192.168.65.1','0','登录成功','2024-04-22 15:46:49'),(148,'admin','192.168.65.1','0','退出成功','2024-04-22 16:58:49'),(149,'admin','192.168.65.1','0','登录成功','2024-04-22 16:58:52');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
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
) ENGINE=InnoDB AUTO_INCREMENT=1066 DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'平台管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2024-04-16 17:55:14','admin','2024-04-19 11:44:40','系统管理目录'),(2,'平台监控',0,3,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2024-04-16 17:55:14','admin','2024-04-19 11:44:59','系统监控目录'),(3,'平台工具',0,2,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2024-04-16 17:55:14','admin','2024-04-19 11:47:22','系统工具目录'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2024-04-16 17:55:14','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2024-04-16 17:55:14','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-04-16 17:55:14','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2024-04-16 17:55:14','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2024-04-16 17:55:14','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2024-04-16 17:55:14','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2024-04-16 17:55:14','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2024-04-16 17:55:14','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2024-04-16 17:55:14','',NULL,'日志管理菜单'),(109,'在线用户',3,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2024-04-16 17:55:14','admin','2024-04-19 11:42:15','在线用户菜单'),(111,'Sentinel',2,3,'http://localhost:8858','','',0,0,'C','0','0','monitor:sentinel','client','admin','2024-04-16 17:55:14','admin','2024-04-21 02:40:13','流量控制菜单'),(112,'Nacos',2,2,'http://localhost:8848/nacos','','',0,0,'C','0','0','monitor:nacos','client','admin','2024-04-16 17:55:14','admin','2024-04-21 02:40:18','服务治理菜单'),(113,'Minitor',2,4,'http://localhost:8005','','',0,0,'C','0','0','monitor:server','client','admin','2024-04-16 17:55:14','admin','2024-04-21 02:40:08','服务监控菜单'),(114,'表单构建',3,3,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2024-04-16 17:55:14','admin','2024-04-19 11:43:15','表单构建菜单'),(115,'代码生成',3,4,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2024-04-16 17:55:14','admin','2024-04-19 11:43:31','代码生成菜单'),(116,'接口文档',3,5,'http://localhost:8001/swagger-ui/index.html','','',0,0,'C','0','0','tool:swagger:list','swagger','admin','2024-04-16 17:55:14','admin','2024-04-19 11:45:48','系统接口菜单'),(500,'操作日志',108,1,'operlog','system/operlog/index','',1,0,'C','0','0','system:operlog:list','form','admin','2024-04-16 17:55:14','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','system/logininfor/index','',1,0,'C','0','0','system:logininfor:list','logininfor','admin','2024-04-16 17:55:14','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2024-04-16 17:55:14','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2024-04-16 17:55:14','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2024-04-16 17:55:14','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2024-04-16 17:55:14','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2024-04-16 17:55:14','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2024-04-16 17:55:14','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-04-16 17:55:14','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2024-04-16 17:55:14','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2024-04-16 17:55:14','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2024-04-16 17:55:14','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2024-04-16 17:55:14','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2024-04-16 17:55:14','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2024-04-16 17:55:14','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2024-04-16 17:55:14','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-04-16 17:55:14','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-04-16 17:55:14','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2024-04-16 17:55:14','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2024-04-16 17:55:14','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-04-16 17:55:14','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-04-16 17:55:14','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2024-04-16 17:55:14','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2024-04-16 17:55:14','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2024-04-16 17:55:14','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2024-04-16 17:55:14','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2024-04-16 17:55:14','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2024-04-16 17:55:14','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2024-04-16 17:55:14','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-04-16 17:55:14','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-04-16 17:55:14','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2024-04-16 17:55:14','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2024-04-16 17:55:14','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2024-04-16 17:55:14','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2024-04-16 17:55:14','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2024-04-16 17:55:14','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2024-04-16 17:55:14','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2024-04-16 17:55:14','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2024-04-16 17:55:14','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-04-16 17:55:14','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-04-16 17:55:14','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','system:operlog:query','#','admin','2024-04-16 17:55:14','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','system:operlog:remove','#','admin','2024-04-16 17:55:14','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','system:operlog:export','#','admin','2024-04-16 17:55:14','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','system:logininfor:query','#','admin','2024-04-16 17:55:14','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','system:logininfor:remove','#','admin','2024-04-16 17:55:14','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','system:logininfor:export','#','admin','2024-04-16 17:55:14','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','system:logininfor:unlock','#','admin','2024-04-16 17:55:14','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-04-16 17:55:14','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-04-16 17:55:14','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-04-16 17:55:14','',NULL,''),(1055,'生成查询',115,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-04-16 17:55:14','',NULL,''),(1056,'生成修改',115,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-04-16 17:55:14','',NULL,''),(1057,'生成删除',115,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-04-16 17:55:14','',NULL,''),(1058,'导入代码',115,2,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-04-16 17:55:14','',NULL,''),(1059,'预览代码',115,4,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-04-16 17:55:14','',NULL,''),(1060,'生成代码',115,5,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-04-16 17:55:14','',NULL,''),(1061,'Adminer',2,1,'http://localhost:8085','','',0,0,'C','0','0','monitor:adminer','client','admin','2024-04-16 17:55:14','admin','2024-04-21 02:40:22','流量控制菜单'),(1062,'Prometheus',2,5,'http://localhost:9090','','',0,0,'C','0','0','monitor:prometheus','client','admin','2024-04-16 17:55:14','admin','2024-04-21 02:40:03','流量控制菜单'),(1063,'Grafana',2,6,'http://localhost:3000','','',0,0,'C','0','0','monitor:grafana','client','admin','2024-04-16 17:55:14','admin','2024-04-21 02:39:59','流量控制菜单'),(1064,'Skywalking',2,7,'http://localhost:8080',NULL,NULL,0,0,'C','0','0','monitor:skywalking','client','admin','2024-04-21 02:18:23','admin','2024-04-21 02:39:52',''),(1065,'Kibana',2,8,'http://localhost:5601/status',NULL,NULL,0,0,'C','0','0','monitor:kibana','client','admin','2024-04-21 03:09:03','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (2,'维护通知：2024-05-01 鸣沙系统凌晨维护','1',_binary '维护内容','0','admin','2024-04-16 17:55:15','',NULL,'管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'菜单管理',3,'site.mingsha.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/menu/4','127.0.0.1','','{}','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2024-04-16 19:21:04',27),(101,'角色管理',2,'site.mingsha.system.controller.SysRoleController.edit()','PUT',1,'admin',NULL,'/role','127.0.0.1','','{\"admin\":false,\"createTime\":\"2024-04-16 17:55:14\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 19:21:13',126),(102,'菜单管理',3,'site.mingsha.system.controller.SysMenuController.remove()','DELETE',1,'admin',NULL,'/menu/4','127.0.0.1','','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 19:21:22',46),(103,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','127.0.0.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 17:55:14\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":113,\"menuName\":\"Admin控制台\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:9000/login\",\"perms\":\"monitor:server:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 19:21:36',37),(104,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"sentinel\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":111,\"menuName\":\"Sentinel控制台\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8858\",\"perms\":\"monitor:sentinel:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-17 17:15:02',43),(105,'部门管理',3,'site.mingsha.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/102','192.168.65.1','','{}','{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}',0,NULL,'2024-04-17 17:22:30',9),(106,'部门管理',3,'site.mingsha.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/109','192.168.65.1','','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-17 17:22:33',24),(107,'部门管理',3,'site.mingsha.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/108','192.168.65.1','','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-17 17:22:36',18),(108,'部门管理',3,'site.mingsha.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/102','192.168.65.1','','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-17 17:22:38',15),(109,'部门管理',3,'site.mingsha.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/106','192.168.65.1','','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-17 17:22:42',28),(110,'部门管理',3,'site.mingsha.system.controller.SysDeptController.remove()','DELETE',1,'admin',NULL,'/dept/104','192.168.65.1','','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-17 17:22:45',28),(111,'部门管理',2,'site.mingsha.system.controller.SysDeptController.edit()','PUT',1,'admin',NULL,'/dept','192.168.65.1','','{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2024-04-16 09:55:14\",\"delFlag\":\"0\",\"deptId\":101,\"deptName\":\"大研发事业群\",\"email\":\"mingsha@site.com\",\"leader\":\"鸣沙\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"phone\":\"18388888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-17 17:23:15',63),(112,'岗位管理',3,'site.mingsha.system.controller.SysPostController.remove()','DELETE',1,'admin',NULL,'/post/3','192.168.65.1','','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-17 17:23:28',13),(113,'岗位管理',2,'site.mingsha.system.controller.SysPostController.edit()','PUT',1,'admin',NULL,'/post','192.168.65.1','','{\"createBy\":\"admin\",\"createTime\":\"2024-04-16 09:55:14\",\"flag\":false,\"params\":{},\"postCode\":\"ceo\",\"postId\":1,\"postName\":\"CEO\",\"postSort\":1,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-17 17:23:41',33),(114,'岗位管理',2,'site.mingsha.system.controller.SysPostController.edit()','PUT',1,'admin',NULL,'/post','192.168.65.1','','{\"createBy\":\"admin\",\"createTime\":\"2024-04-16 09:55:14\",\"flag\":false,\"params\":{},\"postCode\":\"se\",\"postId\":2,\"postName\":\"SE\",\"postSort\":2,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-17 17:23:50',16),(115,'岗位管理',2,'site.mingsha.system.controller.SysPostController.edit()','PUT',1,'admin',NULL,'/post','192.168.65.1','','{\"createBy\":\"admin\",\"createTime\":\"2024-04-16 09:55:14\",\"flag\":false,\"params\":{},\"postCode\":\"se\",\"postId\":2,\"postName\":\"技术专家\",\"postSort\":2,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-17 17:24:09',15),(116,'用户管理',2,'site.mingsha.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/user','192.168.65.1','','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-04-16 09:55:14\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"鸣沙\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"mingsha@site.com\",\"loginDate\":\"2024-04-16 09:55:14\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"鸣沙\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":2,\"userName\":\"ry\"}','{\"msg\":\"修改用户\'ry\'失败，邮箱账号已存在\",\"code\":500}',0,NULL,'2024-04-17 17:24:54',84),(117,'用户管理',3,'site.mingsha.system.controller.SysUserController.remove()','DELETE',1,'admin',NULL,'/user/2','192.168.65.1','','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-17 17:25:02',48),(118,'用户管理',2,'site.mingsha.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/user','192.168.65.1','','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-04-16 09:55:14\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"鸣沙\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"mingsha@site.com\",\"loginDate\":\"2024-04-16 09:55:14\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"鸣沙\",\"params\":{},\"phonenumber\":\"18388888889\",\"postIds\":[4],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"userId\":2,\"userName\":\"mingsha\"}','{\"msg\":\"修改用户\'mingsha\'失败，邮箱账号已存在\",\"code\":500}',0,NULL,'2024-04-17 17:29:56',19),(119,'用户管理',2,'site.mingsha.system.controller.SysUserController.edit()','PUT',1,'admin',NULL,'/user','192.168.65.1','','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-04-16 09:55:14\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"鸣沙\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"mingsha@site.com\",\"loginDate\":\"2024-04-16 09:55:14\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"鸣沙\",\"params\":{},\"phonenumber\":\"18388888889\",\"postIds\":[4],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"mingsha\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-17 17:30:34',78),(120,'角色管理',2,'site.mingsha.system.controller.SysRoleController.edit()','PUT',1,'mingsha',NULL,'/role','192.168.65.1','','{\"admin\":false,\"createTime\":\"2024-04-16 09:55:14\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1058,1056,1057,1059,1060,116],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"mingsha\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-17 17:31:19',53),(121,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"monitor/online/index\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"online\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":109,\"menuName\":\"在线用户\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"online\",\"perms\":\"monitor:online:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:42:16',39),(122,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"monitor/job/index\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":110,\"menuName\":\"定时任务\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":3,\"path\":\"job\",\"perms\":\"monitor:job:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:42:28',14),(123,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:42:35',18),(124,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:42:40',18),(125,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"tool/build/index\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":114,\"menuName\":\"表单构建\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":3,\"path\":\"build\",\"perms\":\"tool:build:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:43:15',31),(126,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"tool/gen/index\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"code\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":115,\"menuName\":\"代码生成\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":3,\"path\":\"gen\",\"perms\":\"tool:gen:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:43:31',25),(127,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"swagger\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":116,\"menuName\":\"系统接口\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":3,\"path\":\"http://localhost:8001/swagger-ui/index.html\",\"perms\":\"tool:swagger:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:43:37',18),(128,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"平台管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:44:40',16),(129,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"平台监控\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:44:59',19),(130,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"内置工具\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:45:07',16),(131,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"swagger\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":116,\"menuName\":\"接口文档\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":3,\"path\":\"http://localhost:8001/swagger-ui/index.html\",\"perms\":\"tool:swagger:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:45:48',12),(132,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"平台工具\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:47:22',22),(133,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":1061,\"menuName\":\"Adminer\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8085\",\"perms\":\"monitor:adminer:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:51:35',13),(134,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"nacos\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":112,\"menuName\":\"Nacos控制台\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8848/nacos\",\"perms\":\"monitor:nacos:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:51:41',18),(135,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":113,\"menuName\":\"Admin控制台\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:9000/login\",\"perms\":\"monitor:server:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:51:53',15),(136,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":1062,\"menuName\":\"Prometheus\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:9090\",\"perms\":\"monitor:prometheus:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:53:27',17),(137,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":1063,\"menuName\":\"Grafana\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:3000\",\"perms\":\"monitor:grafana:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:53:35',23),(138,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"sentinel\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":111,\"menuName\":\"Sentinel\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8858\",\"perms\":\"monitor:sentinel:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:53:57',28),(139,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"nacos\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":112,\"menuName\":\"Nacos\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8848/nacos\",\"perms\":\"monitor:nacos:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:54:03',18),(140,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":113,\"menuName\":\"Minitor\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:9000/login\",\"perms\":\"monitor:server:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:54:21',22),(141,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":113,\"menuName\":\"Minitor\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8007\",\"perms\":\"monitor:server:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-19 11:55:08',22),(142,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"monitor/job/index\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":110,\"menuName\":\"定时任务\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":3,\"path\":\"job\",\"perms\":\"monitor:job:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 00:38:53',38),(143,'在线用户',7,'site.mingsha.system.controller.SysUserOnlineController.forceLogout()','DELETE',1,'admin',NULL,'/online/2dba57cb-ec16-40d9-b346-7c868e3ea3be','192.168.65.1','','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 00:39:13',15),(144,'在线用户',7,'site.mingsha.system.controller.SysUserOnlineController.forceLogout()','DELETE',1,'admin',NULL,'/online/062f0720-63e5-492f-8453-99943c90d4eb','192.168.65.1','','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 00:39:15',3),(145,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":113,\"menuName\":\"Minitor\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8005\",\"perms\":\"monitor:server:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 00:41:27',23),(146,'字典类型',9,'site.mingsha.system.controller.SysDictTypeController.refreshCache()','DELETE',1,'admin',NULL,'/dict/type/refreshCache','192.168.65.1','','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 00:57:41',51),(147,'菜单管理',1,'site.mingsha.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"Skywalking\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8080\",\"perms\":\"monitor:skywalking:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:18:23',16),(148,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":112,\"menuName\":\"Nacos\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8848/nacos\",\"perms\":\"monitor:nacos:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:19:11',13),(149,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":111,\"menuName\":\"Sentinel\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8858\",\"perms\":\"monitor:sentinel:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:19:17',10),(150,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":113,\"menuName\":\"Minitor\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8005\",\"perms\":\"monitor:server:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:19:23',11),(151,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"Grafana\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:3000\",\"perms\":\"monitor:grafana:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:20:36',31),(152,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"Prometheus\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:9090\",\"perms\":\"monitor:prometheus:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:20:44',11),(153,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":111,\"menuName\":\"Sentinel\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8858\",\"perms\":\"monitor:sentinel:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:20:49',14),(154,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":112,\"menuName\":\"Nacos\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8848/nacos\",\"perms\":\"monitor:nacos:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:20:53',12),(155,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"Adminer\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8085\",\"perms\":\"monitor:adminer:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:20:58',16),(156,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":113,\"menuName\":\"Minitor\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8005\",\"perms\":\"monitor:server:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:21:32',11),(157,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"createTime\":\"2024-04-20 18:18:23\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1064,\"menuName\":\"Skywalking\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8080\",\"perms\":\"monitor:skywalking\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:22:55',22),(158,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"Grafana\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:3000\",\"perms\":\"monitor:grafana\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:23:02',20),(159,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"Prometheus\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:9090\",\"perms\":\"monitor:prometheus\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:23:07',11),(160,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":113,\"menuName\":\"Minitor\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8005\",\"perms\":\"monitor:server\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:23:12',26),(161,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":111,\"menuName\":\"Sentinel\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8858\",\"perms\":\"monitor:sentinel\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:23:21',18),(162,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":112,\"menuName\":\"Nacos\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8848/nacos\",\"perms\":\"monitor:nacos\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:23:27',19),(163,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"Adminer\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8085\",\"perms\":\"monitor:adminer\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:23:31',13),(164,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"Grafana\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:3000/?orgId=1\",\"perms\":\"monitor:grafana\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:30:46',37),(165,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"Grafana\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:3000\",\"perms\":\"monitor:grafana\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:31:47',21),(166,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"createTime\":\"2024-04-20 18:18:23\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":1064,\"menuName\":\"Skywalking\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8080\",\"perms\":\"monitor:skywalking\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:39:52',14),(167,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":1063,\"menuName\":\"Grafana\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:3000\",\"perms\":\"monitor:grafana\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:39:59',12),(168,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":1062,\"menuName\":\"Prometheus\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:9090\",\"perms\":\"monitor:prometheus\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:40:03',10),(169,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":113,\"menuName\":\"Minitor\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8005\",\"perms\":\"monitor:server\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:40:08',11),(170,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":111,\"menuName\":\"Sentinel\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8858\",\"perms\":\"monitor:sentinel\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:40:13',13),(171,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":112,\"menuName\":\"Nacos\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8848/nacos\",\"perms\":\"monitor:nacos\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:40:18',9),(172,'菜单管理',2,'site.mingsha.system.controller.SysMenuController.edit()','PUT',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"component\":\"\",\"createTime\":\"2024-04-16 09:55:14\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":1061,\"menuName\":\"Adminer\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:8085\",\"perms\":\"monitor:adminer\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 02:40:22',11),(173,'菜单管理',1,'site.mingsha.system.controller.SysMenuController.add()','POST',1,'admin',NULL,'/menu','192.168.65.1','','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"client\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuName\":\"Kibana\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":2,\"path\":\"http://localhost:5601/status\",\"perms\":\"monitor:kibana\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 03:09:05',74),(174,'通知公告',3,'site.mingsha.system.controller.SysNoticeController.remove()','DELETE',1,'admin',NULL,'/notice/1','192.168.65.1','','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-21 06:28:21',57);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','CEO',1,'0','admin','2024-04-16 17:55:14','admin','2024-04-17 17:23:41',''),(2,'se','技术专家',2,'0','admin','2024-04-16 17:55:14','admin','2024-04-17 17:24:09',''),(4,'user','普通员工',4,'0','admin','2024-04-16 17:55:14','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-04-16 17:55:14','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2024-04-16 17:55:14','mingsha','2024-04-17 17:31:19','普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,2),(2,3),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','鸣沙','00','admin@site.com','18388888888','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-04-16 17:55:14','admin','2024-04-16 17:55:14','',NULL,'管理员'),(2,105,'mingsha','鸣沙','00','mingsha@site.com','18388888889','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2024-04-16 17:55:14','admin','2024-04-16 17:55:14','admin','2024-04-17 17:30:34','测试员');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,4);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-23  4:37:05
