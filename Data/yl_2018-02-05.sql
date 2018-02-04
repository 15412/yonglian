/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.1.48-log : Database - qdm123767452_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`qdm123767452_db` /*!40100 DEFAULT CHARACTER SET gbk */;

USE `qdm123767452_db`;

/*Table structure for table `yl_action` */

DROP TABLE IF EXISTS `yl_action`;

CREATE TABLE `yl_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text COMMENT '行为规则',
  `log` text COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

/*Data for the table `yl_action` */

insert  into `yl_action`(`id`,`name`,`title`,`remark`,`rule`,`log`,`type`,`status`,`update_time`) values (1,'user_login','用户登录','积分+10，每天一次','table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;','[user|get_nickname]在[time|time_format]登录了后台',1,1,1387181220),(2,'add_article','发布文章','积分+5，每天上限5次','table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5','',2,0,1380173180),(3,'review','评论','评论积分+1，无限制','table:member|field:score|condition:uid={$self}|rule:score+1','',2,1,1383285646),(4,'add_document','发表文档','积分+10，每天上限5次','table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5','[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。',2,0,1386139726),(5,'add_document_topic','发表讨论','积分+5，每天上限10次','table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10','',2,0,1383285551),(6,'update_config','更新配置','新增或修改或删除配置','','',1,1,1383294988),(7,'update_model','更新模型','新增或修改模型','','',1,1,1383295057),(8,'update_attribute','更新属性','新增或更新或删除属性','','',1,1,1383295963),(9,'update_channel','更新导航','新增或修改或删除导航','','',1,1,1383296301),(10,'update_menu','更新菜单','新增或修改或删除菜单','','',1,1,1383296392),(11,'update_category','更新分类','新增或修改或删除分类','','',1,1,1383296765);

/*Table structure for table `yl_action_log` */

DROP TABLE IF EXISTS `yl_action_log`;

CREATE TABLE `yl_action_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`),
  KEY `action_id_ix` (`action_id`),
  KEY `user_id_ix` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=192 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='行为日志表';

/*Data for the table `yl_action_log` */

insert  into `yl_action_log`(`id`,`action_id`,`user_id`,`action_ip`,`model`,`record_id`,`remark`,`status`,`create_time`) values (1,1,1,2130706433,'member',1,'admin在2017-11-14 12:45登录了后台',1,1510634750),(2,9,1,2130706433,'channel',3,'操作url：/wb/admin.php?s=/Channel/edit.html',1,1510635143),(3,9,1,2130706433,'channel',3,'操作url：/wb/admin.php?s=/Channel/edit.html',1,1510635150),(4,9,1,2130706433,'channel',2,'操作url：/wb/admin.php?s=/Channel/edit.html',1,1510635369),(5,9,1,2130706433,'channel',5,'操作url：/yl/admin.php?s=/Channel/edit.html',1,1510638789),(6,1,1,2130706433,'member',1,'admin在2017-12-02 20:42登录了后台',1,1512218551),(7,6,1,2130706433,'config',40,'操作url：/admin.php?s=/Config/edit.html',1,1512305077),(8,6,1,2130706433,'config',38,'操作url：/admin.php?s=/Config/edit.html',1,1512305088),(9,6,1,2130706433,'config',39,'操作url：/admin.php?s=/Config/edit.html',1,1512305117),(10,1,1,2130706433,'member',1,'admin在2017-12-31 13:13登录了后台',1,1514697192),(11,9,1,2130706433,'channel',2,'操作url：/admin.php?s=/Channel/edit.html',1,1514701775),(12,9,1,2130706433,'channel',4,'操作url：/admin.php?s=/Channel/edit.html',1,1514701784),(13,9,1,2130706433,'channel',1,'操作url：/admin.php?s=/Channel/edit.html',1,1514703354),(14,9,1,2130706433,'channel',1,'操作url：/admin.php?s=/Channel/edit.html',1,1514703387),(15,9,1,2130706433,'channel',1,'操作url：/admin.php?s=/Channel/edit.html',1,1514703449),(16,9,1,2130706433,'channel',2,'操作url：/admin.php?s=/Channel/edit.html',1,1514703573),(17,9,1,2130706433,'channel',3,'操作url：/admin.php?s=/Channel/edit.html',1,1514703585),(18,9,1,2130706433,'channel',4,'操作url：/admin.php?s=/Channel/edit.html',1,1514703598),(19,9,1,2130706433,'channel',5,'操作url：/admin.php?s=/Channel/edit.html',1,1514703610),(20,1,1,2130706433,'member',1,'admin在2018-01-02 10:00登录了后台',1,1514858427),(21,1,1,2130706433,'member',1,'admin在2018-01-06 10:16登录了后台',1,1515204964),(22,1,1,2130706433,'member',1,'admin在2018-01-07 21:47登录了后台',1,1515332830),(23,1,1,2130706433,'member',1,'admin在2018-01-12 16:02登录了后台',1,1515744164),(24,7,1,2130706433,'model',4,'操作url：/yl/admin.php?s=/Model/update.html',1,1515745209),(25,7,1,2130706433,'model',4,'操作url：/yl/admin.php?s=/Model/update.html',1,1515745242),(26,8,1,2130706433,'attribute',33,'操作url：/yl/admin.php?s=/Attribute/update.html',1,1515745313),(27,8,1,2130706433,'attribute',34,'操作url：/yl/admin.php?s=/Attribute/update.html',1,1515745366),(28,8,1,2130706433,'attribute',35,'操作url：/yl/admin.php?s=/Attribute/update.html',1,1515745427),(29,8,1,2130706433,'attribute',36,'操作url：/yl/admin.php?s=/Attribute/update.html',1,1515745499),(30,8,1,2130706433,'attribute',37,'操作url：/yl/admin.php?s=/Attribute/update.html',1,1515745550),(31,8,1,2130706433,'attribute',38,'操作url：/yl/admin.php?s=/Attribute/update.html',1,1515745634),(32,8,1,2130706433,'attribute',39,'操作url：/yl/admin.php?s=/Attribute/update.html',1,1515745708),(33,8,1,2130706433,'attribute',40,'操作url：/yl/admin.php?s=/Attribute/update.html',1,1515745850),(34,8,1,2130706433,'attribute',41,'操作url：/yl/admin.php?s=/Attribute/update.html',1,1515745878),(35,10,1,2130706433,'Menu',124,'操作url：/yl/admin.php?s=/Menu/add.html',1,1515753149),(36,10,1,2130706433,'Menu',124,'操作url：/yl/admin.php?s=/Menu/edit.html',1,1515753168),(37,10,1,2130706433,'Menu',125,'操作url：/yl/admin.php?s=/Menu/add.html',1,1515753917),(38,10,1,2130706433,'Menu',126,'操作url：/yl/admin.php?s=/Menu/add.html',1,1515753948),(39,10,1,2130706433,'Menu',127,'操作url：/yl/admin.php?s=/Menu/add.html',1,1515753994),(40,10,1,2130706433,'Menu',126,'操作url：/yl/admin.php?s=/Menu/edit.html',1,1515754053),(41,10,1,2130706433,'Menu',127,'操作url：/yl/admin.php?s=/Menu/edit.html',1,1515754067),(42,10,1,2130706433,'Menu',128,'操作url：/yl/admin.php?s=/Menu/add.html',1,1515754109),(43,10,1,2130706433,'Menu',129,'操作url：/yl/admin.php?s=/Menu/add.html',1,1515754169),(44,10,1,2130706433,'Menu',130,'操作url：/yl/admin.php?s=/Menu/add.html',1,1515754190),(45,7,1,2130706433,'model',5,'操作url：/admin.php?s=/Model/update.html',1,1515769618),(46,8,1,2130706433,'attribute',42,'操作url：/admin.php?s=/Attribute/update.html',1,1515769664),(47,8,1,2130706433,'attribute',43,'操作url：/admin.php?s=/Attribute/update.html',1,1515769933),(48,8,1,2130706433,'attribute',44,'操作url：/admin.php?s=/Attribute/update.html',1,1515769992),(49,8,1,2130706433,'attribute',45,'操作url：/admin.php?s=/Attribute/update.html',1,1515770023),(50,8,1,2130706433,'attribute',46,'操作url：/admin.php?s=/Attribute/update.html',1,1515770137),(51,8,1,2130706433,'attribute',47,'操作url：/admin.php?s=/Attribute/update.html',1,1515770255),(52,8,1,2130706433,'attribute',41,'操作url：/admin.php?s=/Attribute/update.html',1,1515770268),(53,8,1,2130706433,'attribute',41,'操作url：/admin.php?s=/Attribute/update.html',1,1515770278),(54,8,1,2130706433,'attribute',48,'操作url：/admin.php?s=/Attribute/update.html',1,1515770335),(55,8,1,2130706433,'attribute',40,'操作url：/admin.php?s=/Attribute/update.html',1,1515770363),(56,8,1,2130706433,'attribute',47,'操作url：/admin.php?s=/Attribute/update.html',1,1515770404),(57,10,1,2130706433,'Menu',131,'操作url：/admin.php?s=/Menu/add.html',1,1515771005),(58,10,1,2130706433,'Menu',132,'操作url：/admin.php?s=/Menu/add.html',1,1515771065),(59,10,1,2130706433,'Menu',133,'操作url：/admin.php?s=/Menu/add.html',1,1515771086),(60,10,1,2130706433,'Menu',134,'操作url：/admin.php?s=/Menu/add.html',1,1515771098),(61,10,1,2130706433,'Menu',135,'操作url：/admin.php?s=/Menu/add.html',1,1515771122),(62,10,1,2130706433,'Menu',136,'操作url：/admin.php?s=/Menu/add.html',1,1515771434),(63,10,1,2130706433,'Menu',137,'操作url：/admin.php?s=/Menu/add.html',1,1515771472),(64,7,1,2130706433,'model',5,'操作url：/admin.php?s=/Model/update.html',1,1515771654),(65,10,1,2130706433,'Menu',135,'操作url：/admin.php?s=/Menu/edit.html',1,1515772528),(66,8,1,2130706433,'attribute',43,'操作url：/admin.php?s=/Attribute/update.html',1,1515772882),(67,8,1,2130706433,'attribute',43,'操作url：/admin.php?s=/Attribute/update.html',1,1515772914),(68,8,1,2130706433,'attribute',46,'操作url：/admin.php?s=/Attribute/update.html',1,1515772971),(69,1,1,2130706433,'member',1,'admin在2018-01-13 11:17登录了后台',1,1515813462),(70,8,1,2130706433,'attribute',42,'操作url：/yl/admin.php?s=/Attribute/update.html',1,1515814960),(71,7,1,2130706433,'model',5,'操作url：/yl/admin.php?s=/Model/update.html',1,1515815341),(72,8,1,2130706433,'attribute',49,'操作url：/yl/admin.php?s=/Attribute/update.html',1,1515815439),(73,8,1,2130706433,'attribute',49,'操作url：/yl/admin.php?s=/Attribute/update.html',1,1515815677),(74,7,1,2130706433,'model',5,'操作url：/yl/admin.php?s=/Model/update.html',1,1515815910),(75,7,1,2130706433,'model',5,'操作url：/yl/admin.php?s=/Model/update.html',1,1515817470),(76,7,1,2130706433,'model',5,'操作url：/yl/admin.php?s=/Model/update.html',1,1515817504),(77,8,1,2130706433,'attribute',43,'操作url：/admin.php?s=/Attribute/update.html',1,1515921479),(78,9,1,2130706433,'channel',3,'操作url：/admin.php?s=/Channel/edit.html',1,1515938102),(79,1,1,1038842997,'member',1,'admin在2018-01-15 10:27登录了后台',1,1515983233),(80,9,1,1038842997,'channel',4,'操作url：/yl/index.php?s=/Admin/Channel/edit.html',1,1515983255),(81,9,1,1038842997,'channel',4,'操作url：/yl/index.php?s=/Admin/Channel/edit.html',1,1515983285),(82,9,1,2130706433,'channel',3,'操作url：/admin.php?s=/Channel/edit.html',1,1516118384),(83,9,1,2130706433,'channel',3,'操作url：/admin.php?s=/Channel/edit.html',1,1516119613),(84,1,1,2130706433,'member',1,'admin在2018-01-19 12:29登录了后台',1,1516336177),(85,8,1,2130706433,'attribute',43,'操作url：/yl/admin.php?s=/Attribute/update.html',1,1516336332),(86,8,1,2130706433,'attribute',50,'操作url：/yl/admin.php?s=/Attribute/update.html',1,1516336789),(87,8,1,2130706433,'attribute',43,'操作url：/yl/admin.php?s=/Attribute/update.html',1,1516336814),(88,8,1,2130706433,'attribute',50,'操作url：/yl/admin.php?s=/Attribute/update.html',1,1516336845),(89,8,1,2130706433,'attribute',51,'操作url：/yl/admin.php?s=/Attribute/update.html',1,1516336848),(90,8,1,2130706433,'attribute',43,'操作url：/yl/admin.php?s=/Attribute/update.html',1,1516336862),(91,8,1,2130706433,'attribute',52,'操作url：/yl/admin.php?s=/Attribute/update.html',1,1516337864),(92,9,1,2130706433,'channel',3,'操作url：/admin.php?s=/Channel/edit.html',1,1516453964),(93,7,1,2130706433,'model',5,'操作url：/admin.php?s=/Model/update.html',1,1516462003),(94,8,1,2130706433,'attribute',50,'操作url：/admin.php?s=/Attribute/update.html',1,1516462135),(95,8,1,2130706433,'attribute',51,'操作url：/admin.php?s=/Attribute/update.html',1,1516462145),(96,10,1,2130706433,'Menu',124,'操作url：/admin.php?s=/Menu/edit.html',1,1516515589),(97,10,1,2130706433,'Menu',124,'操作url：/admin.php?s=/Menu/edit.html',1,1516515606),(98,1,1,2130706433,'member',1,'admin在2018-01-21 16:10登录了后台',1,1516522234),(99,1,1,2130706433,'member',1,'admin在2018-01-22 09:25登录了后台',1,1516584352),(100,10,1,2130706433,'Menu',2,'操作url：/yl/admin.php?s=/Menu/edit.html',1,1516584378),(101,1,2,2130706433,'member',2,'wingluen在2018-01-22 09:58登录了后台',1,1516586290),(102,1,1,2130706433,'member',1,'admin在2018-01-24 22:27登录了后台',1,1516804074),(103,1,1,2130706433,'member',1,'admin在2018-01-25 00:33登录了后台',1,1516811599),(104,1,2,1032961676,'member',2,'wingluen在2018-01-25 09:30登录了后台',1,1516843832),(105,1,2,3708061929,'member',2,'wingluen在2018-01-25 09:37登录了后台',1,1516844223),(106,1,1,3746200031,'member',1,'admin在2018-01-26 20:48登录了后台',1,1516970929),(107,7,1,2130706433,'model',5,'操作url：/Admin/Model/update.html',1,1516971466),(108,1,2,3746200031,'member',2,'wingluen在2018-01-26 20:58登录了后台',1,1516971486),(109,1,2,3746200031,'member',2,'wingluen在2018-01-26 20:58登录了后台',1,1516971518),(110,1,1,3746200031,'member',1,'admin在2018-01-26 20:59登录了后台',1,1516971543),(111,1,2,3746200031,'member',2,'wingluen在2018-01-26 21:00登录了后台',1,1516971631),(112,1,1,2130706433,'member',1,'admin在2018-01-26 21:03登录了后台',1,1516971785),(113,1,2,2130706433,'member',2,'wingluen在2018-01-26 21:03登录了后台',1,1516971830),(114,1,2,2130706433,'member',2,'wingluen在2018-01-26 21:05登录了后台',1,1516971903),(115,1,2,2130706433,'member',2,'wingluen在2018-01-26 21:07登录了后台',1,1516972041),(116,1,2,3746200031,'member',2,'wingluen在2018-01-26 21:08登录了后台',1,1516972112),(117,1,2,3746200031,'member',2,'wingluen在2018-01-26 21:09登录了后台',1,1516972196),(118,1,2,3746200031,'member',2,'wingluen在2018-01-26 21:10登录了后台',1,1516972255),(119,1,2,2130706433,'member',2,'wingluen在2018-01-26 21:12登录了后台',1,1516972343),(120,1,1,2130706433,'member',1,'admin在2018-01-26 21:14登录了后台',1,1516972448),(121,1,1,3746200031,'member',1,'admin在2018-01-26 21:13登录了后台',1,1516972428),(122,1,1,3746199999,'member',1,'admin在2018-01-29 20:25登录了后台',1,1517228709),(123,1,2,3708061929,'member',2,'wingluen在2018-01-30 13:41登录了后台',1,1517290899),(124,1,1,3682970286,'member',1,'admin在2018-01-30 16:49登录了后台',1,1517302195),(125,1,1,3682970286,'member',1,'admin在2018-01-30 16:51登录了后台',1,1517302298),(126,1,1,3746199999,'member',1,'admin在2018-01-30 21:12登录了后台',1,1517317951),(127,1,1,3746199999,'member',1,'admin在2018-01-30 21:18登录了后台',1,1517318332),(128,1,1,3682970286,'member',1,'admin在2018-01-30 21:24登录了后台',1,1517318684),(129,1,1,2130706433,'member',1,'admin在2018-01-30 22:43登录了后台',1,1517323388),(130,1,1,2004600578,'member',1,'admin在2018-01-30 22:46登录了后台',1,1517323613),(131,1,1,2004600578,'member',1,'admin在2018-01-30 23:15登录了后台',1,1517325312),(132,1,2,3708061929,'member',2,'wingluen在2018-02-02 15:26登录了后台',1,1517556373),(133,1,1,3746209914,'member',1,'admin在2018-02-02 19:41登录了后台',1,1517571671),(134,1,1,3746209914,'member',1,'admin在2018-02-02 19:49登录了后台',1,1517572158),(135,1,1,2130706433,'member',1,'admin在2018-02-02 19:50登录了后台',1,1517572210),(136,1,1,3746209914,'member',1,'admin在2018-02-02 20:08登录了后台',1,1517573325),(137,1,2,3708061929,'member',2,'wingluen在2018-02-03 08:39登录了后台',1,1517618381),(138,1,2,3535281658,'member',2,'wingluen在2018-02-03 09:56登录了后台',1,1517622972),(139,1,1,1032961676,'member',1,'admin在2018-02-03 10:07登录了后台',1,1517623669),(140,6,1,2130706433,'config',3,'操作url：/Admin/Config/edit.html',1,1517750638),(141,6,1,2130706433,'config',10,'操作url：/Admin/Config/edit.html',1,1517750648),(142,6,1,2130706433,'config',13,'操作url：/Admin/Config/edit.html',1,1517750659),(143,6,1,2130706433,'config',4,'操作url：/Admin/Config/edit.html',1,1517750707),(144,6,1,2130706433,'config',42,'操作url：/Admin/Config/edit.html',1,1517751300),(145,6,1,2130706433,'config',42,'操作url：/Admin/Config/edit.html',1,1517751699),(146,6,1,2130706433,'config',44,'操作url：/Admin/Config/edit.html',1,1517751711),(147,6,1,2130706433,'config',43,'操作url：/Admin/Config/edit.html',1,1517751719),(148,7,1,2130706433,'model',6,'操作url：/Admin/Model/update.html',1,1517752411),(149,8,1,2130706433,'attribute',53,'操作url：/Admin/Attribute/update.html',1,1517752620),(150,8,1,2130706433,'attribute',54,'操作url：/Admin/Attribute/update.html',1,1517752641),(151,8,1,2130706433,'attribute',55,'操作url：/Admin/Attribute/update.html',1,1517752674),(152,8,1,2130706433,'attribute',56,'操作url：/Admin/Attribute/update.html',1,1517753225),(153,8,1,2130706433,'attribute',57,'操作url：/Admin/Attribute/update.html',1,1517753249),(154,8,1,2130706433,'attribute',58,'操作url：/Admin/Attribute/update.html',1,1517753266),(155,8,1,2130706433,'attribute',56,'操作url：/Admin/Attribute/update.html',1,1517753286),(156,8,1,2130706433,'attribute',59,'操作url：/Admin/Attribute/update.html',1,1517753325),(157,8,1,2130706433,'attribute',60,'操作url：/Admin/Attribute/update.html',1,1517753345),(158,8,1,2130706433,'attribute',61,'操作url：/Admin/Attribute/update.html',1,1517753364),(159,8,1,2130706433,'attribute',58,'操作url：/Admin/Attribute/update.html',1,1517753376),(160,8,1,2130706433,'attribute',57,'操作url：/Admin/Attribute/update.html',1,1517753380),(161,8,1,2130706433,'attribute',56,'操作url：/Admin/Attribute/update.html',1,1517753384),(162,8,1,2130706433,'attribute',62,'操作url：/Admin/Attribute/update.html',1,1517753421),(163,8,1,2130706433,'attribute',63,'操作url：/Admin/Attribute/update.html',1,1517753436),(164,8,1,2130706433,'attribute',64,'操作url：/Admin/Attribute/update.html',1,1517753451),(165,8,1,2130706433,'attribute',65,'操作url：/Admin/Attribute/update.html',1,1517753504),(166,8,1,2130706433,'attribute',66,'操作url：/Admin/Attribute/update.html',1,1517753523),(167,8,1,2130706433,'attribute',67,'操作url：/Admin/Attribute/update.html',1,1517753538),(168,8,1,2130706433,'attribute',68,'操作url：/Admin/Attribute/update.html',1,1517753662),(169,10,1,2130706433,'Menu',138,'操作url：/Admin/Menu/add.html',1,1517753823),(170,10,1,2130706433,'Menu',138,'操作url：/Admin/Menu/edit.html',1,1517753845),(171,10,1,2130706433,'Menu',138,'操作url：/Admin/Menu/edit.html',1,1517753880),(172,10,1,2130706433,'Menu',138,'操作url：/Admin/Menu/edit.html',1,1517753897),(173,8,1,2130706433,'attribute',68,'操作url：/Admin/Attribute/update.html',1,1517753958),(174,8,1,2130706433,'attribute',68,'操作url：/Admin/Attribute/update.html',1,1517754011),(175,10,1,2130706433,'Menu',139,'操作url：/Admin/Menu/add.html',1,1517754064),(176,10,1,2130706433,'Menu',140,'操作url：/Admin/Menu/add.html',1,1517754077),(177,10,1,2130706433,'Menu',141,'操作url：/Admin/Menu/add.html',1,1517754091),(178,10,1,2130706433,'Menu',142,'操作url：/Admin/Menu/add.html',1,1517754103),(179,10,1,2130706433,'Menu',143,'操作url：/Admin/Menu/add.html',1,1517754119),(180,8,1,2130706433,'attribute',69,'操作url：/Admin/Attribute/update.html',1,1517754679),(181,8,1,2130706433,'attribute',70,'操作url：/Admin/Attribute/update.html',1,1517754724),(182,8,1,2130706433,'attribute',71,'操作url：/Admin/Attribute/update.html',1,1517754773),(183,8,1,2130706433,'attribute',72,'操作url：/Admin/Attribute/update.html',1,1517754800),(184,8,1,2130706433,'attribute',71,'操作url：/Admin/Attribute/update.html',1,1517754827),(185,7,1,2130706433,'model',6,'操作url：/Admin/Model/update.html',1,1517754979),(186,8,1,2130706433,'attribute',72,'操作url：/Admin/Attribute/update.html',1,1517755018),(187,8,1,2130706433,'attribute',70,'操作url：/Admin/Attribute/update.html',1,1517755068),(188,7,1,2130706433,'model',6,'操作url：/Admin/Model/update.html',1,1517757504),(189,8,1,2130706433,'attribute',70,'操作url：/Admin/Attribute/update.html',1,1517757640),(190,8,1,2130706433,'attribute',71,'操作url：/Admin/Attribute/update.html',1,1517757709),(191,8,1,2130706433,'attribute',72,'操作url：/Admin/Attribute/update.html',1,1517757723);

/*Table structure for table `yl_addons` */

DROP TABLE IF EXISTS `yl_addons`;

CREATE TABLE `yl_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='插件表';

/*Data for the table `yl_addons` */

insert  into `yl_addons`(`id`,`name`,`title`,`description`,`status`,`config`,`author`,`version`,`create_time`,`has_adminlist`) values (15,'EditorForAdmin','后台编辑器','用于增强整站长文本的输入和显示',1,'{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"500px\",\"editor_resize_type\":\"1\"}','thinkphp','0.1',1383126253,0),(2,'SiteStat','站点统计信息','统计站点的基础信息',0,'{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"1\",\"display\":\"1\",\"status\":\"0\"}','thinkphp','0.1',1379512015,0),(3,'DevTeam','开发团队信息','开发团队成员信息',0,'{\"title\":\"OneThink\\u5f00\\u53d1\\u56e2\\u961f\",\"width\":\"2\",\"display\":\"1\"}','thinkphp','0.1',1379512022,0),(4,'SystemInfo','系统环境信息','用于显示一些服务器的信息',1,'{\"title\":\"\\u7cfb\\u7edf\\u4fe1\\u606f\",\"width\":\"4\",\"display\":\"1\"}','thinkphp','0.1',1379512036,0),(5,'Editor','前台编辑器','用于增强整站长文本的输入和显示',1,'{\"editor_type\":\"2\",\"editor_wysiwyg\":\"1\",\"editor_height\":\"300px\",\"editor_resize_type\":\"1\"}','thinkphp','0.1',1379830910,0),(6,'Attachment','附件','用于文档模型上传附件',1,'null','thinkphp','0.1',1379842319,1),(9,'SocialComment','通用社交化评论','集成了各种社交化评论插件，轻松集成到系统中。',1,'{\"comment_type\":\"1\",\"comment_uid_youyan\":\"\",\"comment_short_name_duoshuo\":\"\",\"comment_data_list_duoshuo\":\"\"}','thinkphp','0.1',1380273962,0);

/*Table structure for table `yl_attachment` */

DROP TABLE IF EXISTS `yl_attachment`;

CREATE TABLE `yl_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

/*Data for the table `yl_attachment` */

/*Table structure for table `yl_attribute` */

DROP TABLE IF EXISTS `yl_attribute`;

CREATE TABLE `yl_attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL DEFAULT '',
  `validate_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `error_info` varchar(100) NOT NULL DEFAULT '',
  `validate_type` varchar(25) NOT NULL DEFAULT '',
  `auto_rule` varchar(100) NOT NULL DEFAULT '',
  `auto_time` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `auto_type` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='模型属性表';

/*Data for the table `yl_attribute` */

insert  into `yl_attribute`(`id`,`name`,`title`,`field`,`type`,`value`,`remark`,`is_show`,`extra`,`model_id`,`is_must`,`status`,`update_time`,`create_time`,`validate_rule`,`validate_time`,`error_info`,`validate_type`,`auto_rule`,`auto_time`,`auto_type`) values (1,'uid','用户ID','int(10) unsigned NOT NULL ','num','0','',0,'',1,0,1,1384508362,1383891233,'',0,'','','',0,''),(2,'name','标识','char(40) NOT NULL ','string','','同一根节点下标识不重复',1,'',1,0,1,1383894743,1383891233,'',0,'','','',0,''),(3,'title','标题','char(80) NOT NULL ','string','','文档标题',1,'',1,0,1,1383894778,1383891233,'',0,'','','',0,''),(4,'category_id','所属分类','int(10) unsigned NOT NULL ','string','','',0,'',1,0,1,1384508336,1383891233,'',0,'','','',0,''),(5,'description','描述','char(140) NOT NULL ','textarea','','',1,'',1,0,1,1383894927,1383891233,'',0,'','','',0,''),(6,'root','根节点','int(10) unsigned NOT NULL ','num','0','该文档的顶级文档编号',0,'',1,0,1,1384508323,1383891233,'',0,'','','',0,''),(7,'pid','所属ID','int(10) unsigned NOT NULL ','num','0','父文档编号',0,'',1,0,1,1384508543,1383891233,'',0,'','','',0,''),(8,'model_id','内容模型ID','tinyint(3) unsigned NOT NULL ','num','0','该文档所对应的模型',0,'',1,0,1,1384508350,1383891233,'',0,'','','',0,''),(9,'type','内容类型','tinyint(3) unsigned NOT NULL ','select','2','',1,'1:目录\r\n2:主题\r\n3:段落',1,0,1,1384511157,1383891233,'',0,'','','',0,''),(10,'position','推荐位','smallint(5) unsigned NOT NULL ','checkbox','0','多个推荐则将其推荐值相加',1,'[DOCUMENT_POSITION]',1,0,1,1383895640,1383891233,'',0,'','','',0,''),(11,'link_id','外链','int(10) unsigned NOT NULL ','num','0','0-非外链，大于0-外链ID,需要函数进行链接与编号的转换',1,'',1,0,1,1383895757,1383891233,'',0,'','','',0,''),(12,'cover_id','封面','int(10) unsigned NOT NULL ','picture','0','0-无封面，大于0-封面图片ID，需要函数处理',1,'',1,0,1,1384147827,1383891233,'',0,'','','',0,''),(13,'display','可见性','tinyint(3) unsigned NOT NULL ','radio','1','',1,'0:不可见\r\n1:所有人可见',1,0,1,1386662271,1383891233,'',0,'','regex','',0,'function'),(14,'deadline','截至时间','int(10) unsigned NOT NULL ','datetime','0','0-永久有效',1,'',1,0,1,1387163248,1383891233,'',0,'','regex','',0,'function'),(15,'attach','附件数量','tinyint(3) unsigned NOT NULL ','num','0','',0,'',1,0,1,1387260355,1383891233,'',0,'','regex','',0,'function'),(16,'view','浏览量','int(10) unsigned NOT NULL ','num','0','',1,'',1,0,1,1383895835,1383891233,'',0,'','','',0,''),(17,'comment','评论数','int(10) unsigned NOT NULL ','num','0','',1,'',1,0,1,1383895846,1383891233,'',0,'','','',0,''),(18,'extend','扩展统计字段','int(10) unsigned NOT NULL ','num','0','根据需求自行使用',0,'',1,0,1,1384508264,1383891233,'',0,'','','',0,''),(19,'level','优先级','int(10) unsigned NOT NULL ','num','0','越高排序越靠前',1,'',1,0,1,1383895894,1383891233,'',0,'','','',0,''),(20,'create_time','创建时间','int(10) unsigned NOT NULL ','datetime','0','',1,'',1,0,1,1383895903,1383891233,'',0,'','','',0,''),(21,'update_time','更新时间','int(10) unsigned NOT NULL ','datetime','0','',0,'',1,0,1,1384508277,1383891233,'',0,'','','',0,''),(22,'status','数据状态','tinyint(4) NOT NULL ','radio','0','',0,'-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿',1,0,1,1384508496,1383891233,'',0,'','','',0,''),(23,'parse','内容解析类型','tinyint(3) unsigned NOT NULL ','select','0','',0,'0:html\r\n1:ubb\r\n2:markdown',2,0,1,1384511049,1383891243,'',0,'','','',0,''),(24,'content','文章内容','text NOT NULL ','editor','','',1,'',2,0,1,1383896225,1383891243,'',0,'','','',0,''),(25,'template','详情页显示模板','varchar(100) NOT NULL ','string','','参照display方法参数的定义',1,'',2,0,1,1383896190,1383891243,'',0,'','','',0,''),(26,'bookmark','收藏数','int(10) unsigned NOT NULL ','num','0','',1,'',2,0,1,1383896103,1383891243,'',0,'','','',0,''),(27,'parse','内容解析类型','tinyint(3) unsigned NOT NULL ','select','0','',0,'0:html\r\n1:ubb\r\n2:markdown',3,0,1,1387260461,1383891252,'',0,'','regex','',0,'function'),(28,'content','下载详细描述','text NOT NULL ','editor','','',1,'',3,0,1,1383896438,1383891252,'',0,'','','',0,''),(29,'template','详情页显示模板','varchar(100) NOT NULL ','string','','',1,'',3,0,1,1383896429,1383891252,'',0,'','','',0,''),(30,'file_id','文件ID','int(10) unsigned NOT NULL ','file','0','需要函数处理',1,'',3,0,1,1383896415,1383891252,'',0,'','','',0,''),(31,'download','下载次数','int(10) unsigned NOT NULL ','num','0','',1,'',3,0,1,1383896380,1383891252,'',0,'','','',0,''),(32,'size','文件大小','bigint(20) unsigned NOT NULL ','num','0','单位bit',1,'',3,0,1,1383896371,1383891252,'',0,'','','',0,''),(33,'name','名称','varchar(255) NOT NULL','string','','名称',1,'',4,1,1,1515745314,1515745314,'',3,'','regex','',3,'function'),(34,'pid','父ID','int(10) UNSIGNED NOT NULL','num','0','',0,'',4,1,1,1515745367,1515745367,'',3,'','regex','',3,'function'),(35,'type','类型','tinyint(2) NOT NULL','radio','1','类型',1,'1:图片分类',4,1,1,1515745428,1515745428,'',3,'','regex','',3,'function'),(36,'is_hot','是否热门分类','tinyint(1) NOT NULL','radio','0','是否热门分类',1,'0:否\r\n1:是',4,1,1,1515745500,1515745500,'',3,'','regex','',3,'function'),(37,'sort','排序','int(10) UNSIGNED NOT NULL','num','0','排序（同级有效）',1,'',4,1,1,1515745551,1515745551,'',3,'','regex','',3,'function'),(38,'admin_id','管理员ID','int(10) UNSIGNED NOT NULL','num','','管理员ID',0,'',4,1,1,1515745635,1515745635,'',3,'','regex','is_login',3,'function'),(39,'status','是否启用','tinyint(1) NOT NULL','radio','1','是否启用',3,'0:停用\r\n1:启用',4,1,1,1515745709,1515745709,'',3,'','regex','',3,'function'),(40,'create_time','创建时间','int(10) NOT NULL','datetime','','创建时间',0,'',4,1,1,1515770364,1515745850,'',3,'','regex','time',1,'function'),(41,'update_time','更新时间','int(10) NOT NULL','datetime','','更新时间',0,'',4,1,1,1515770278,1515745879,'',3,'','regex','time',3,'function'),(42,'image_category_id','分类','int(10) UNSIGNED NOT NULL','num','','分类',1,'',5,1,1,1515814961,1515769664,'',3,'','regex','',3,'function'),(43,'chs_picture_id','简体图片','int(10) UNSIGNED NOT NULL','picture','','简体图片',1,'',5,1,1,1516336863,1515769933,'',3,'','regex','',3,'function'),(44,'name','名称','varchar(255) NOT NULL','string','','名称',1,'',5,1,1,1515769993,1515769993,'',3,'','regex','',3,'function'),(45,'desc','描述','varchar(255) NOT NULL','string','','描述',1,'',5,0,1,1515770024,1515770024,'',3,'','regex','',3,'function'),(46,'status','是否启用','tinyint(1) NOT NULL','radio','1','是否启用',3,'0:停用\r\n1:启用',5,1,1,1515772972,1515770137,'',3,'','regex','',3,'function'),(47,'create_time','创建时间','int(10) NOT NULL','datetime','','创建时间',0,'',5,1,1,1515770405,1515770256,'',3,'','regex','time',1,'function'),(48,'update_time','更新时间','int(10) NOT NULL','datetime','','更新时间',0,'',5,1,1,1515770336,1515770336,'',3,'','regex','time',3,'function'),(49,'sort','排序','int(10) UNSIGNED NOT NULL','num','','',1,'',5,1,1,1515815678,1515815439,'',3,'','regex','',3,'function'),(50,'cht_picture_id','繁体图片','int(10) UNSIGNED NOT NULL','picture','','繁体图片',1,'',5,0,1,1516462136,1516336790,'',3,'','regex','',3,'function'),(51,'eng_picture_id','英文图片','int(10) UNSIGNED NOT NULL','picture','','英文图片',1,'',5,0,1,1516462146,1516336848,'',3,'','regex','',3,'function'),(52,'tag','标签','varchar(255) NOT NULL','string','','标签',1,'',4,1,1,1516337865,1516337865,'',3,'','regex','',3,'function'),(53,'company_name_chs','公司名称(简)','varchar(255) NOT NULL','string','','公司名称(简)',1,'',6,1,1,1517752621,1517752621,'',3,'','regex','',3,'function'),(54,'company_name_cht','公司名称(繁)','varchar(255) NOT NULL','string','','公司名称(繁)',1,'',6,1,1,1517752642,1517752642,'',3,'','regex','',3,'function'),(55,'company_name_eng','公司名称(英)','varchar(255) NOT NULL','string','','公司名称(英)',1,'',6,1,1,1517752674,1517752674,'',3,'','regex','',3,'function'),(56,'tel_chs','总机(简)','varchar(255) NOT NULL','string','','总机(简)',1,'',6,0,1,1517753385,1517753226,'',3,'','regex','',3,'function'),(57,'tel_cht','总机(繁)','varchar(255) NOT NULL','string','','总机(繁)',1,'',6,0,1,1517753381,1517753249,'',3,'','regex','',3,'function'),(58,'tel_eng','总机(英)','varchar(255) NOT NULL','string','','总机(英)',1,'',6,0,1,1517753377,1517753267,'',3,'','regex','',3,'function'),(59,'fax_chs','传真(简)','varchar(255) NOT NULL','string','','传真(简)',1,'',6,0,1,1517753326,1517753326,'',3,'','regex','',3,'function'),(60,'fax_cht','传真(繁)','varchar(255) NOT NULL','string','','传真(繁)',1,'',6,0,1,1517753346,1517753346,'',3,'','regex','',3,'function'),(61,'fax_eng','传真(英)','varchar(255) NOT NULL','string','','传真(英)',1,'',6,0,1,1517753365,1517753365,'',3,'','regex','',3,'function'),(62,'email_chs','邮箱(简)','varchar(255) NOT NULL','string','','邮箱(简)',1,'',6,0,1,1517753422,1517753422,'',3,'','regex','',3,'function'),(63,'email_cht','邮箱(繁)','varchar(255) NOT NULL','string','','邮箱(繁)',1,'',6,0,1,1517753436,1517753436,'',3,'','regex','',3,'function'),(64,'email_eng','邮箱(英)','varchar(255) NOT NULL','string','','邮箱(英)',1,'',6,0,1,1517753451,1517753451,'',3,'','regex','',3,'function'),(65,'address_chs','地址(简)','varchar(255) NOT NULL','string','','地址(简)',1,'',6,0,1,1517753505,1517753505,'',3,'','regex','',3,'function'),(66,'address_cht','地址(繁)','varchar(255) NOT NULL','string','','地址(繁)',1,'',6,0,1,1517753523,1517753523,'',3,'','regex','',3,'function'),(67,'address_eng','地址(英)','varchar(255) NOT NULL','string','','地址(英)',1,'',6,0,1,1517753538,1517753538,'',3,'','regex','',3,'function'),(68,'is_show_prefix','是否显示前缀','tinyint(2) NOT NULL','bool','1','是否显示前缀',1,'0:否\r\n1:是',6,0,1,1517754012,1517753663,'',3,'','regex','',3,'function'),(69,'sort','排序','int(10) UNSIGNED NOT NULL','num','','排序',1,'',6,1,1,1517754680,1517754680,'',3,'','regex','',3,'function'),(70,'status','是否启用','int(10) UNSIGNED NOT NULL','radio','1','是否启用',3,'0:否\r\n1:是',6,1,1,1517757641,1517754725,'',3,'','regex','',3,'function'),(71,'create_time','创建时间','int(10) NOT NULL','datetime','','创建时间',0,'',6,0,1,1517757710,1517754774,'',3,'','regex','time',1,'function'),(72,'update_time','更新时间','int(10) NOT NULL','datetime','','更新时间',0,'',6,0,1,1517757724,1517754801,'',3,'','regex','time',3,'function');

/*Table structure for table `yl_auth_extend` */

DROP TABLE IF EXISTS `yl_auth_extend`;

CREATE TABLE `yl_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限',
  UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`),
  KEY `uid` (`group_id`),
  KEY `group_id` (`extend_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

/*Data for the table `yl_auth_extend` */

insert  into `yl_auth_extend`(`group_id`,`extend_id`,`type`) values (1,1,1),(1,1,2),(1,2,1),(1,2,2),(1,3,1),(1,3,2),(1,4,1),(1,37,1);

/*Table structure for table `yl_auth_group` */

DROP TABLE IF EXISTS `yl_auth_group`;

CREATE TABLE `yl_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `yl_auth_group` */

insert  into `yl_auth_group`(`id`,`module`,`type`,`title`,`description`,`status`,`rules`) values (1,'admin',1,'默认用户组','',1,'19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,100,102,103,224,225,226,227,229,231,232'),(2,'admin',1,'管理员用户','管理员用户',1,'1,3,5,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,80,82,83,84,88,89,90,91,92,93,94,95,100,102,103,107,108,109,110,195,207,212,213,214,215,216,219,220,221,222,223,224,225,226,227,228,229,230,231,232');

/*Table structure for table `yl_auth_group_access` */

DROP TABLE IF EXISTS `yl_auth_group_access`;

CREATE TABLE `yl_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `yl_auth_group_access` */

insert  into `yl_auth_group_access`(`uid`,`group_id`) values (2,1);

/*Table structure for table `yl_auth_rule` */

DROP TABLE IF EXISTS `yl_auth_rule`;

CREATE TABLE `yl_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=233 DEFAULT CHARSET=utf8;

/*Data for the table `yl_auth_rule` */

insert  into `yl_auth_rule`(`id`,`module`,`type`,`name`,`title`,`status`,`condition`) values (1,'admin',2,'Admin/Index/index','首页',1,''),(2,'admin',2,'Admin/Article/index','内容',1,''),(3,'admin',2,'Admin/User/index','用户',1,''),(4,'admin',2,'Admin/Addons/index','扩展',1,''),(5,'admin',2,'Admin/Config/group','系统',1,''),(7,'admin',1,'Admin/article/add','新增',1,''),(8,'admin',1,'Admin/article/edit','编辑',1,''),(9,'admin',1,'Admin/article/setStatus','改变状态',1,''),(10,'admin',1,'Admin/article/update','保存',1,''),(11,'admin',1,'Admin/article/autoSave','保存草稿',1,''),(12,'admin',1,'Admin/article/move','移动',1,''),(13,'admin',1,'Admin/article/copy','复制',1,''),(14,'admin',1,'Admin/article/paste','粘贴',1,''),(15,'admin',1,'Admin/article/permit','还原',1,''),(16,'admin',1,'Admin/article/clear','清空',1,''),(17,'admin',1,'Admin/Article/examine','审核列表',1,''),(18,'admin',1,'Admin/article/recycle','回收站',1,''),(19,'admin',1,'Admin/User/addaction','新增用户行为',1,''),(20,'admin',1,'Admin/User/editaction','编辑用户行为',1,''),(21,'admin',1,'Admin/User/saveAction','保存用户行为',1,''),(22,'admin',1,'Admin/User/setStatus','变更行为状态',1,''),(23,'admin',1,'Admin/User/changeStatus?method=forbidUser','禁用会员',1,''),(24,'admin',1,'Admin/User/changeStatus?method=resumeUser','启用会员',1,''),(25,'admin',1,'Admin/User/changeStatus?method=deleteUser','删除会员',1,''),(26,'admin',1,'Admin/User/index','用户信息',1,''),(27,'admin',1,'Admin/User/action','用户行为',1,''),(28,'admin',1,'Admin/AuthManager/changeStatus?method=deleteGroup','删除',1,''),(29,'admin',1,'Admin/AuthManager/changeStatus?method=forbidGroup','禁用',1,''),(30,'admin',1,'Admin/AuthManager/changeStatus?method=resumeGroup','恢复',1,''),(31,'admin',1,'Admin/AuthManager/createGroup','新增',1,''),(32,'admin',1,'Admin/AuthManager/editGroup','编辑',1,''),(33,'admin',1,'Admin/AuthManager/writeGroup','保存用户组',1,''),(34,'admin',1,'Admin/AuthManager/group','授权',1,''),(35,'admin',1,'Admin/AuthManager/access','访问授权',1,''),(36,'admin',1,'Admin/AuthManager/user','成员授权',1,''),(37,'admin',1,'Admin/AuthManager/removeFromGroup','解除授权',1,''),(38,'admin',1,'Admin/AuthManager/addToGroup','保存成员授权',1,''),(39,'admin',1,'Admin/AuthManager/category','分类授权',1,''),(40,'admin',1,'Admin/AuthManager/addToCategory','保存分类授权',1,''),(41,'admin',1,'Admin/AuthManager/index','权限管理',1,''),(42,'admin',1,'Admin/Addons/create','创建',1,''),(43,'admin',1,'Admin/Addons/checkForm','检测创建',1,''),(44,'admin',1,'Admin/Addons/preview','预览',1,''),(45,'admin',1,'Admin/Addons/build','快速生成插件',1,''),(46,'admin',1,'Admin/Addons/config','设置',1,''),(47,'admin',1,'Admin/Addons/disable','禁用',1,''),(48,'admin',1,'Admin/Addons/enable','启用',1,''),(49,'admin',1,'Admin/Addons/install','安装',1,''),(50,'admin',1,'Admin/Addons/uninstall','卸载',1,''),(51,'admin',1,'Admin/Addons/saveconfig','更新配置',1,''),(52,'admin',1,'Admin/Addons/adminList','插件后台列表',1,''),(53,'admin',1,'Admin/Addons/execute','URL方式访问插件',1,''),(54,'admin',1,'Admin/Addons/index','插件管理',1,''),(55,'admin',1,'Admin/Addons/hooks','钩子管理',1,''),(56,'admin',1,'Admin/model/add','新增',1,''),(57,'admin',1,'Admin/model/edit','编辑',1,''),(58,'admin',1,'Admin/model/setStatus','改变状态',1,''),(59,'admin',1,'Admin/model/update','保存数据',1,''),(60,'admin',1,'Admin/Model/index','模型管理',1,''),(61,'admin',1,'Admin/Config/edit','编辑',1,''),(62,'admin',1,'Admin/Config/del','删除',1,''),(63,'admin',1,'Admin/Config/add','新增',1,''),(64,'admin',1,'Admin/Config/save','保存',1,''),(65,'admin',1,'Admin/Config/group','网站设置',1,''),(66,'admin',1,'Admin/Config/index','配置管理',1,''),(67,'admin',1,'Admin/Channel/add','新增',1,''),(68,'admin',1,'Admin/Channel/edit','编辑',1,''),(69,'admin',1,'Admin/Channel/del','删除',1,''),(70,'admin',1,'Admin/Channel/index','导航管理',1,''),(71,'admin',1,'Admin/Category/edit','编辑',1,''),(72,'admin',1,'Admin/Category/add','新增',1,''),(73,'admin',1,'Admin/Category/remove','删除',1,''),(74,'admin',1,'Admin/Category/index','分类管理',1,''),(75,'admin',1,'Admin/file/upload','上传控件',-1,''),(76,'admin',1,'Admin/file/uploadPicture','上传图片',-1,''),(77,'admin',1,'Admin/file/download','下载',-1,''),(94,'admin',1,'Admin/AuthManager/modelauth','模型授权',1,''),(79,'admin',1,'Admin/article/batchOperate','导入',1,''),(80,'admin',1,'Admin/Database/index?type=export','备份数据库',1,''),(81,'admin',1,'Admin/Database/index?type=import','还原数据库',1,''),(82,'admin',1,'Admin/Database/export','备份',1,''),(83,'admin',1,'Admin/Database/optimize','优化表',1,''),(84,'admin',1,'Admin/Database/repair','修复表',1,''),(86,'admin',1,'Admin/Database/import','恢复',1,''),(87,'admin',1,'Admin/Database/del','删除',1,''),(88,'admin',1,'Admin/User/add','新增用户',1,''),(89,'admin',1,'Admin/Attribute/index','属性管理',1,''),(90,'admin',1,'Admin/Attribute/add','新增',1,''),(91,'admin',1,'Admin/Attribute/edit','编辑',1,''),(92,'admin',1,'Admin/Attribute/setStatus','改变状态',1,''),(93,'admin',1,'Admin/Attribute/update','保存数据',1,''),(95,'admin',1,'Admin/AuthManager/addToModel','保存模型授权',1,''),(96,'admin',1,'Admin/Category/move','移动',-1,''),(97,'admin',1,'Admin/Category/merge','合并',-1,''),(98,'admin',1,'Admin/Config/menu','后台菜单管理',-1,''),(99,'admin',1,'Admin/Article/mydocument','内容',-1,''),(100,'admin',1,'Admin/Menu/index','菜单管理',1,''),(101,'admin',1,'Admin/other','其他',-1,''),(102,'admin',1,'Admin/Menu/add','新增',1,''),(103,'admin',1,'Admin/Menu/edit','编辑',1,''),(104,'admin',1,'Admin/Think/lists?model=article','文章管理',-1,''),(105,'admin',1,'Admin/Think/lists?model=download','下载管理',-1,''),(106,'admin',1,'Admin/Think/lists?model=config','配置管理',-1,''),(107,'admin',1,'Admin/Action/actionlog','行为日志',1,''),(108,'admin',1,'Admin/User/updatePassword','修改密码',1,''),(109,'admin',1,'Admin/User/updateNickname','修改昵称',1,''),(110,'admin',1,'Admin/action/edit','查看行为日志',1,''),(205,'admin',1,'Admin/think/add','新增数据',1,''),(111,'admin',2,'Admin/article/index','文档列表',-1,''),(112,'admin',2,'Admin/article/add','新增',-1,''),(113,'admin',2,'Admin/article/edit','编辑',-1,''),(114,'admin',2,'Admin/article/setStatus','改变状态',-1,''),(115,'admin',2,'Admin/article/update','保存',-1,''),(116,'admin',2,'Admin/article/autoSave','保存草稿',-1,''),(117,'admin',2,'Admin/article/move','移动',-1,''),(118,'admin',2,'Admin/article/copy','复制',-1,''),(119,'admin',2,'Admin/article/paste','粘贴',-1,''),(120,'admin',2,'Admin/article/batchOperate','导入',-1,''),(121,'admin',2,'Admin/article/recycle','回收站',-1,''),(122,'admin',2,'Admin/article/permit','还原',-1,''),(123,'admin',2,'Admin/article/clear','清空',-1,''),(124,'admin',2,'Admin/User/add','新增用户',-1,''),(125,'admin',2,'Admin/User/action','用户行为',-1,''),(126,'admin',2,'Admin/User/addAction','新增用户行为',-1,''),(127,'admin',2,'Admin/User/editAction','编辑用户行为',-1,''),(128,'admin',2,'Admin/User/saveAction','保存用户行为',-1,''),(129,'admin',2,'Admin/User/setStatus','变更行为状态',-1,''),(130,'admin',2,'Admin/User/changeStatus?method=forbidUser','禁用会员',-1,''),(131,'admin',2,'Admin/User/changeStatus?method=resumeUser','启用会员',-1,''),(132,'admin',2,'Admin/User/changeStatus?method=deleteUser','删除会员',-1,''),(133,'admin',2,'Admin/AuthManager/index','权限管理',-1,''),(134,'admin',2,'Admin/AuthManager/changeStatus?method=deleteGroup','删除',-1,''),(135,'admin',2,'Admin/AuthManager/changeStatus?method=forbidGroup','禁用',-1,''),(136,'admin',2,'Admin/AuthManager/changeStatus?method=resumeGroup','恢复',-1,''),(137,'admin',2,'Admin/AuthManager/createGroup','新增',-1,''),(138,'admin',2,'Admin/AuthManager/editGroup','编辑',-1,''),(139,'admin',2,'Admin/AuthManager/writeGroup','保存用户组',-1,''),(140,'admin',2,'Admin/AuthManager/group','授权',-1,''),(141,'admin',2,'Admin/AuthManager/access','访问授权',-1,''),(142,'admin',2,'Admin/AuthManager/user','成员授权',-1,''),(143,'admin',2,'Admin/AuthManager/removeFromGroup','解除授权',-1,''),(144,'admin',2,'Admin/AuthManager/addToGroup','保存成员授权',-1,''),(145,'admin',2,'Admin/AuthManager/category','分类授权',-1,''),(146,'admin',2,'Admin/AuthManager/addToCategory','保存分类授权',-1,''),(147,'admin',2,'Admin/AuthManager/modelauth','模型授权',-1,''),(148,'admin',2,'Admin/AuthManager/addToModel','保存模型授权',-1,''),(149,'admin',2,'Admin/Addons/create','创建',-1,''),(150,'admin',2,'Admin/Addons/checkForm','检测创建',-1,''),(151,'admin',2,'Admin/Addons/preview','预览',-1,''),(152,'admin',2,'Admin/Addons/build','快速生成插件',-1,''),(153,'admin',2,'Admin/Addons/config','设置',-1,''),(154,'admin',2,'Admin/Addons/disable','禁用',-1,''),(155,'admin',2,'Admin/Addons/enable','启用',-1,''),(156,'admin',2,'Admin/Addons/install','安装',-1,''),(157,'admin',2,'Admin/Addons/uninstall','卸载',-1,''),(158,'admin',2,'Admin/Addons/saveconfig','更新配置',-1,''),(159,'admin',2,'Admin/Addons/adminList','插件后台列表',-1,''),(160,'admin',2,'Admin/Addons/execute','URL方式访问插件',-1,''),(161,'admin',2,'Admin/Addons/hooks','钩子管理',-1,''),(162,'admin',2,'Admin/Model/index','模型管理',-1,''),(163,'admin',2,'Admin/model/add','新增',-1,''),(164,'admin',2,'Admin/model/edit','编辑',-1,''),(165,'admin',2,'Admin/model/setStatus','改变状态',-1,''),(166,'admin',2,'Admin/model/update','保存数据',-1,''),(167,'admin',2,'Admin/Attribute/index','属性管理',-1,''),(168,'admin',2,'Admin/Attribute/add','新增',-1,''),(169,'admin',2,'Admin/Attribute/edit','编辑',-1,''),(170,'admin',2,'Admin/Attribute/setStatus','改变状态',-1,''),(171,'admin',2,'Admin/Attribute/update','保存数据',-1,''),(172,'admin',2,'Admin/Config/index','配置管理',-1,''),(173,'admin',2,'Admin/Config/edit','编辑',-1,''),(174,'admin',2,'Admin/Config/del','删除',-1,''),(175,'admin',2,'Admin/Config/add','新增',-1,''),(176,'admin',2,'Admin/Config/save','保存',-1,''),(177,'admin',2,'Admin/Menu/index','菜单管理',-1,''),(178,'admin',2,'Admin/Channel/index','导航管理',-1,''),(179,'admin',2,'Admin/Channel/add','新增',-1,''),(180,'admin',2,'Admin/Channel/edit','编辑',-1,''),(181,'admin',2,'Admin/Channel/del','删除',-1,''),(182,'admin',2,'Admin/Category/index','分类管理',-1,''),(183,'admin',2,'Admin/Category/edit','编辑',-1,''),(184,'admin',2,'Admin/Category/add','新增',-1,''),(185,'admin',2,'Admin/Category/remove','删除',-1,''),(186,'admin',2,'Admin/Category/move','移动',-1,''),(187,'admin',2,'Admin/Category/merge','合并',-1,''),(188,'admin',2,'Admin/Database/index?type=export','备份数据库',-1,''),(189,'admin',2,'Admin/Database/export','备份',-1,''),(190,'admin',2,'Admin/Database/optimize','优化表',-1,''),(191,'admin',2,'Admin/Database/repair','修复表',-1,''),(192,'admin',2,'Admin/Database/index?type=import','还原数据库',-1,''),(193,'admin',2,'Admin/Database/import','恢复',-1,''),(194,'admin',2,'Admin/Database/del','删除',-1,''),(195,'admin',2,'Admin/other','其他',1,''),(196,'admin',2,'Admin/Menu/add','新增',-1,''),(197,'admin',2,'Admin/Menu/edit','编辑',-1,''),(198,'admin',2,'Admin/Think/lists?model=article','应用',-1,''),(199,'admin',2,'Admin/Think/lists?model=download','下载管理',-1,''),(200,'admin',2,'Admin/Think/lists?model=config','应用',-1,''),(201,'admin',2,'Admin/Action/actionlog','行为日志',-1,''),(202,'admin',2,'Admin/User/updatePassword','修改密码',-1,''),(203,'admin',2,'Admin/User/updateNickname','修改昵称',-1,''),(204,'admin',2,'Admin/action/edit','查看行为日志',-1,''),(206,'admin',1,'Admin/think/edit','编辑数据',1,''),(207,'admin',1,'Admin/Menu/import','导入',1,''),(208,'admin',1,'Admin/Model/generate','生成',1,''),(209,'admin',1,'Admin/Addons/addHook','新增钩子',1,''),(210,'admin',1,'Admin/Addons/edithook','编辑钩子',1,''),(211,'admin',1,'Admin/Article/sort','文档排序',1,''),(212,'admin',1,'Admin/Config/sort','排序',1,''),(213,'admin',1,'Admin/Menu/sort','排序',1,''),(214,'admin',1,'Admin/Channel/sort','排序',1,''),(215,'admin',1,'Admin/Category/operate/type/move','移动',1,''),(216,'admin',1,'Admin/Category/operate/type/merge','合并',1,''),(217,'admin',1,'Admin/article/index','文档列表',1,''),(218,'admin',1,'Admin/think/lists','数据列表',1,''),(219,'admin',1,'Admin/ImageCategory/lists','列表',1,''),(220,'admin',1,'Admin/ImageCategory/add','新增',1,''),(221,'admin',1,'Admin/ImageCategory/edit','编辑',1,''),(222,'admin',1,'Admin/ImageCategory/remove','删除',1,''),(223,'admin',1,'Admin/ImageCategory/operate/type/move','移动',1,''),(224,'admin',1,'Admin/Image/lists','列表',1,''),(225,'admin',1,'Admin/Image/add','新增',1,''),(226,'admin',1,'Admin/Image/edit','编辑',1,''),(227,'admin',1,'Admin/Image/del','删除',1,''),(228,'admin',1,'Admin/ImageCategory/setStatus','改变状态',1,''),(229,'admin',1,'Admin/Image/setStatus','改变状态',1,''),(230,'admin',1,'Admin/ImageCategory/index','图片分类',1,''),(231,'admin',2,'Admin/Image/index','管理',1,''),(232,'admin',1,'Admin/Image/index','图片',1,'');

/*Table structure for table `yl_category` */

DROP TABLE IF EXISTS `yl_category`;

CREATE TABLE `yl_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL DEFAULT '' COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL DEFAULT '' COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '列表绑定模型',
  `model_sub` varchar(100) NOT NULL DEFAULT '' COMMENT '子文档绑定模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标',
  `groups` varchar(255) NOT NULL DEFAULT '' COMMENT '分组定义',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='分类表';

/*Data for the table `yl_category` */

insert  into `yl_category`(`id`,`name`,`title`,`pid`,`sort`,`list_row`,`meta_title`,`keywords`,`description`,`template_index`,`template_lists`,`template_detail`,`template_edit`,`model`,`model_sub`,`type`,`link_id`,`allow_publish`,`display`,`reply`,`check`,`reply_model`,`extend`,`create_time`,`update_time`,`status`,`icon`,`groups`) values (1,'blog','博客',0,0,10,'','','','','','','','2,3','2','2,1',0,0,1,0,0,'1','',1379474947,1382701539,1,0,''),(2,'default_blog','默认分类',1,1,10,'','','','','','','','2,3','2','2,1,3',0,1,1,0,1,'1','',1379475028,1386839751,1,0,'');

/*Table structure for table `yl_channel` */

DROP TABLE IF EXISTS `yl_channel`;

CREATE TABLE `yl_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `yl_channel` */

insert  into `yl_channel`(`id`,`pid`,`title`,`url`,`sort`,`create_time`,`update_time`,`status`,`target`) values (1,0,'MENU_INDEX','Index/index',1,1379475111,1514703449,1,0),(2,0,'MENU_ABOUT','Index/about',2,1379475131,1514703573,1,0),(3,0,'MENU_VIDEO','Index/video',3,1379475154,1516453964,1,0),(4,0,'MENU_PARTNERS','Index/partners',4,1510635195,1515983285,1,0),(5,0,'MENU_CONTACT','Index/contact',5,1510635223,1514703610,1,0),(6,2,'MENU_PROFILE','Index/profile',1,1516454015,1516454015,1,0),(7,2,'MENU_HONOR','Index/honor',2,1516454029,1516454029,1,0),(8,2,'MENU_HISTORY','Index/history',3,1516454047,1516454047,1,0);

/*Table structure for table `yl_config` */

DROP TABLE IF EXISTS `yl_config`;

CREATE TABLE `yl_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `yl_config` */

insert  into `yl_config`(`id`,`name`,`type`,`title`,`group`,`extra`,`remark`,`create_time`,`update_time`,`status`,`value`,`sort`) values (1,'WEB_SITE_TITLE',1,'网站标题',1,'','网站标题前台显示标题',1378898976,1379235274,1,'永联织造厂',0),(2,'WEB_SITE_DESCRIPTION',2,'网站描述',1,'','网站搜索引擎描述',1378898976,1379235841,1,'永联织造厂',1),(3,'WEB_SITE_KEYWORD',2,'网站关键字',1,'','网站搜索引擎关键字',1378898976,1517750638,1,'永联织造厂',4),(4,'WEB_SITE_CLOSE',4,'关闭站点',1,'0:关闭,1:开启','站点关闭后其他用户不能访问，管理员可以正常访问',1378898976,1517750707,1,'1',3),(9,'CONFIG_TYPE_LIST',3,'配置类型列表',4,'','主要用于数据解析和页面表单的生成',1378898976,1379235348,1,'0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举',2),(10,'WEB_SITE_ICP',1,'网站备案号',1,'','设置在网站底部显示的备案号，如“沪ICP备12007941号-2',1378900335,1517750648,1,'',5),(11,'DOCUMENT_POSITION',3,'文档推荐位',2,'','文档推荐位，推荐到多个位置KEY值相加即可',1379053380,1379235329,1,'1:列表推荐\r\n2:频道推荐\r\n4:首页推荐',3),(12,'DOCUMENT_DISPLAY',3,'文档可见性',2,'','文章可见性仅影响前台显示，后台不收影响',1379056370,1379235322,1,'0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见',4),(13,'COLOR_STYLE',4,'后台色系',1,'default_color:默认\r\nblue_color:紫罗兰','后台颜色风格',1379122533,1517750659,1,'default_color',6),(20,'CONFIG_GROUP_LIST',3,'配置分组',4,'','配置分组',1379228036,1384418383,1,'1:基本\r\n2:内容\r\n3:用户\r\n4:系统',4),(21,'HOOKS_TYPE',3,'钩子的类型',4,'','类型 1-用于扩展显示内容，2-用于扩展业务处理',1379313397,1379313407,1,'1:视图\r\n2:控制器',6),(22,'AUTH_CONFIG',3,'Auth配置',4,'','自定义Auth.class.php类配置',1379409310,1379409564,1,'AUTH_ON:1\r\nAUTH_TYPE:2',8),(23,'OPEN_DRAFTBOX',4,'是否开启草稿功能',2,'0:关闭草稿功能\r\n1:开启草稿功能\r\n','新增文章时的草稿功能配置',1379484332,1379484591,1,'1',1),(24,'DRAFT_AOTOSAVE_INTERVAL',0,'自动保存草稿时间',2,'','自动保存草稿的时间间隔，单位：秒',1379484574,1386143323,1,'60',2),(25,'LIST_ROWS',0,'后台每页记录数',2,'','后台数据每页显示记录数',1379503896,1380427745,1,'10',10),(26,'USER_ALLOW_REGISTER',4,'是否允许用户注册',3,'0:关闭注册\r\n1:允许注册','是否开放用户注册',1379504487,1379504580,1,'0',3),(27,'CODEMIRROR_THEME',4,'预览插件的CodeMirror主题',4,'3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight','详情见CodeMirror官网',1379814385,1384740813,1,'ambiance',3),(28,'DATA_BACKUP_PATH',1,'数据库备份根路径',4,'','路径必须以 / 结尾',1381482411,1381482411,1,'./Data/',5),(29,'DATA_BACKUP_PART_SIZE',0,'数据库备份卷大小',4,'','该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M',1381482488,1381729564,1,'20971520',7),(30,'DATA_BACKUP_COMPRESS',4,'数据库备份文件是否启用压缩',4,'0:不压缩\r\n1:启用压缩','压缩备份文件需要PHP环境支持gzopen,gzwrite函数',1381713345,1381729544,1,'1',9),(31,'DATA_BACKUP_COMPRESS_LEVEL',4,'数据库备份文件压缩级别',4,'1:普通\r\n4:一般\r\n9:最高','数据库备份文件的压缩级别，该配置在开启压缩时生效',1381713408,1381713408,1,'9',10),(32,'DEVELOP_MODE',4,'开启开发者模式',4,'0:关闭\r\n1:开启','是否开启开发者模式',1383105995,1383291877,1,'1',11),(33,'ALLOW_VISIT',3,'不受限控制器方法',0,'','',1386644047,1386644741,1,'0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname\r\n10:file/uploadpicture',0),(34,'DENY_VISIT',3,'超管专限控制器方法',0,'','仅超级管理员可访问的控制器方法',1386644141,1386644659,1,'0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree',0),(35,'REPLY_LIST_ROWS',0,'回复列表每页条数',2,'','',1386645376,1387178083,1,'10',0),(36,'ADMIN_ALLOW_IP',2,'后台允许访问IP',4,'','多个用逗号分隔，如果不配置表示不限制IP访问',1387165454,1387165553,1,'',12),(37,'SHOW_PAGE_TRACE',4,'是否显示页面Trace',4,'0:关闭\r\n1:开启','是否显示页面Trace信息',1387165685,1387165685,1,'0',1),(38,'WEB_SITE_WECHAT_LINK',1,'微信链接',1,'','微信链接配置',1512304915,1512305088,1,'javascrip:;',7),(39,'WEB_SITE_SINA_LINK',1,'新浪微博链接',1,'','新浪微博链接配置',1512304961,1512305117,1,'javascrip:;',8),(40,'WEB_SITE_TMALL_LINK',1,'天猫链接',1,'','天猫链接配置',1512304996,1512305077,1,'https://minicaryibengbeng.tmall.com/',9),(41,'WEB_SITE_SHARE_LINK',1,'分享链接',1,'','分享链接配置',1512305033,1512305033,1,'javascrip:;',10),(42,'WEB_SITE_PROFILE_CHS',2,'公司简介(简)',1,'','公司简介(简)',1517751128,1517751699,1,'永联织造是世界前三的童装生产商，成立于1972年在香港成立，由阮氏家族和（王）氏家族 拥有公司100%的股权。1986年在大陆先后于东莞和广东韶关开设永联织造厂，拥有32间车间， 总员工数超过10000人，主要生产婴儿及儿童服装，年产量约1.2亿件。公司拥有超过40年的生 产和出口经营优势，产品出口到美国，英国，欧洲，加拿大，澳大利亚和亚洲各地，并获得了 Carter’s 、Tesco、Nike、Target、Walmart等公司的指定生产商。公司以专注生产婴儿、 儿童服装为核心，注重关爱儿童健康成长，成为儿童服装市场的前驱和专家。',6),(43,'WEB_SITE_PROFILE_CHT',2,'公司简介(繁)',1,'','公司简介(繁)',1517751219,1517751719,1,'永聯織造是世界前三的童裝生產商，成立於1972年在香港成立，由阮氏家族和（王）氏家族擁有公司100%的股權。1986年在大陸先後於東莞和廣東韶關開設永聯織造廠，擁有32間車間，總員工數超過10000人，主要生產嬰兒及兒童服裝，年產量約1.2億件。公司擁有超過40年的生 產和出口經營優勢，產品出口到美國，英國，歐洲，加拿大，澳大利亞和亞洲各地，並獲得了Carter’s、Tesco、Nike、Target、Walmart等公司的指定生產商。公司以專注生產嬰兒、兒童服裝為覈心，注重關愛兒童健康成長，成為兒童服裝市場的前驅和專家。',6),(44,'WEB_SITE_PROFILE_ENG',2,'公司简介(英)',1,'','公司简介(英)',1517751260,1517751711,1,'Wingluen weaving is the world\'s top three children\'s clothing manufacturer, founded in Hongkong in 1972, and by the Yuen family (wang) family owned a 100% stake in the company. In 1986, in mainland China, Dongguan evergreen weaving workshop was opened in Shaoguan and Guangdong. It has 32 workshops, with a total number of employees over 10000, mainly producing baby and children\'s clothing, with an annual output of about 120 million. The company has more than 40 years of students Products and export business advantages, products exported to the United States, Britain, Europe, Canada, Australia and Asia, and get the Carter, s, Tesco, Nike, Target, Walmart and other designated manufacturers. The company focuses on the production of infants and children\'s clothing, and pays attention to the healthy growth of children. It has become a pioneer and expert in the children\'s clothing market.',6);

/*Table structure for table `yl_contact` */

DROP TABLE IF EXISTS `yl_contact`;

CREATE TABLE `yl_contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_name_chs` varchar(255) NOT NULL COMMENT '公司名称(简)',
  `company_name_cht` varchar(255) NOT NULL COMMENT '公司名称(繁)',
  `company_name_eng` varchar(255) NOT NULL COMMENT '公司名称(英)',
  `tel_chs` varchar(255) NOT NULL COMMENT '总机(简)',
  `tel_cht` varchar(255) NOT NULL COMMENT '总机(繁)',
  `tel_eng` varchar(255) NOT NULL COMMENT '总机(英)',
  `fax_chs` varchar(255) NOT NULL COMMENT '传真(简)',
  `fax_cht` varchar(255) NOT NULL COMMENT '传真(繁)',
  `fax_eng` varchar(255) NOT NULL COMMENT '传真(英)',
  `email_chs` varchar(255) NOT NULL COMMENT '邮箱(简)',
  `email_cht` varchar(255) NOT NULL COMMENT '邮箱(繁)',
  `email_eng` varchar(255) NOT NULL COMMENT '邮箱(英)',
  `address_chs` varchar(255) NOT NULL COMMENT '地址(简)',
  `address_cht` varchar(255) NOT NULL COMMENT '地址(繁)',
  `address_eng` varchar(255) NOT NULL COMMENT '地址(英)',
  `is_show_prefix` tinyint(2) NOT NULL DEFAULT '1' COMMENT '是否显示前缀',
  `sort` int(10) unsigned NOT NULL COMMENT '排序',
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `yl_contact` */

insert  into `yl_contact`(`id`,`company_name_chs`,`company_name_cht`,`company_name_eng`,`tel_chs`,`tel_cht`,`tel_eng`,`fax_chs`,`fax_cht`,`fax_eng`,`email_chs`,`email_cht`,`email_eng`,`address_chs`,`address_cht`,`address_eng`,`is_show_prefix`,`sort`,`status`,`create_time`,`update_time`) values (1,'永联织造厂','永聯織造廠','Wing Luen Knitting Factory','(852)2741 3933','(852)2741 3933','(852)2741 3933','(852)2785 4050','(852)2785 4050','(852)2785 4050','enquiry@wingluen.com.hk','enquiry@wingluen.com.hk','enquiry@wingluen.com.hk','香港九龙长沙湾长裕街2号嘉图工厂大厦9字楼','香港九龍長沙灣長裕街2號嘉圖工廠大廈9字樓','9/F,Ka To Factory Building,2 Cheung Yue Steet, Cheung Sha Wan, Kowloon,Hong Kong',1,1,1,0,0),(2,'东莞茶山永联织造厂','東莞茶山永聯織造廠','ChaShan Wing Luen Knitting Factory','(86)0769-8865 5088','(86)0769-8865 5088','(86)0769-8865 5088','(86)0769-8865 5089','(86)0769-8865 5089','(86)0769-8865 5089','enquiry@wingluen.com.hk','enquiry@wingluen.com.hk','enquiry@wingluen.com.hk','广东省东莞市茶山镇南社工业区立本工业园  523391','廣東省東莞市茶山鎮南社工業區立本工業園  523391','Li Ben Industrial Park, Nan She Industrial Dist, Cha Shan ,Dongguan , Guangdong Province, China.  523391',1,2,1,0,0),(3,'始兴县天河制衣有限公司','始興縣天河制衣有限公司','Shixing Tianhe Garment co.Ltd','(86)0751-3442888','(86)0751-3442888','(86)0751-3442888','(86)0751-3442883','(86)0751-3442883','(86)0751-3442883','enquiry@wingluen.com.hk','enquiry@wingluen.com.hk','enquiry@wingluen.com.hk','广东省韶关市始兴县江口兴盛工业园  512500','廣東省韶關市始興縣江口興盛工業園  512500','Xingsheng Industrial Park, Jiangkou Town, Shixing County, ShaoguanCity, Guangdong Province, China. 512500',1,3,1,1517757794,1517757794),(4,'Y&W Garment Co. Ltd.','Y&W Garment Co. Ltd.','Y&W Garment Co. Ltd.','','','','','','','','','','No. 272 ST217 Phum Prek Chrey, Sangkat Spean Thmor, Khan Dangkor, Phnom Penh, Cambodia','No. 272 ST217 Phum Prek Chrey, Sangkat Spean Thmor, Khan Dangkor, Phnom Penh, Cambodia','No. 272 ST217 Phum Prek Chrey, Sangkat Spean Thmor, Khan Dangkor, Phnom Penh, Cambodia',0,4,1,1517757843,1517757843);

/*Table structure for table `yl_document` */

DROP TABLE IF EXISTS `yl_document`;

CREATE TABLE `yl_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `group_id` smallint(3) unsigned NOT NULL COMMENT '所属分组',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  PRIMARY KEY (`id`),
  KEY `idx_category_status` (`category_id`,`status`),
  KEY `idx_status_type_pid` (`status`,`uid`,`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='文档模型基础表';

/*Data for the table `yl_document` */

insert  into `yl_document`(`id`,`uid`,`name`,`title`,`category_id`,`group_id`,`description`,`root`,`pid`,`model_id`,`type`,`position`,`link_id`,`cover_id`,`display`,`deadline`,`attach`,`view`,`comment`,`extend`,`level`,`create_time`,`update_time`,`status`) values (1,1,'','1.1开发版发布',2,0,'期待已久的最新版发布',0,0,2,2,0,0,0,1,0,0,10,0,0,0,1406001360,1512221017,1);

/*Table structure for table `yl_document_article` */

DROP TABLE IF EXISTS `yl_document_article`;

CREATE TABLE `yl_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

/*Data for the table `yl_document_article` */

insert  into `yl_document_article`(`id`,`parse`,`content`,`template`,`bookmark`) values (1,0,'<h1>\r\n	1.1开发版发布&nbsp;\r\n</h1>\r\n<p>\r\n	<strong>是一个开源的内容管理框架，基于最新的ThinkPHP3.2版本开发，提供更方便、更安全的WEB应用开发体验，采用了全新的架构设计和命名空间机制，融合了模块化、驱动化和插件化的设计理念于一体，开启了国内WEB应用傻瓜式开发的新潮流。&nbsp;</strong>\r\n</p>\r\n<h2>\r\n	主要特性：\r\n</h2>\r\n<p>\r\n	1. 基于ThinkPHP最新3.2版本。\r\n</p>\r\n<p>\r\n	2. 模块化：全新的架构和模块化的开发机制，便于灵活扩展和二次开发。&nbsp;\r\n</p>\r\n<p>\r\n	3. 文档模型/分类体系：通过和文档模型绑定，以及不同的文档类型，不同分类可以实现差异化的功能，轻松实现诸如资讯、下载、讨论和图片等功能。\r\n</p>\r\n<p>\r\n	4. 开源免费：遵循Apache2开源协议,免费提供使用。&nbsp;\r\n</p>\r\n<p>\r\n	5. 用户行为：支持自定义用户行为，可以对单个用户或者群体用户的行为进行记录及分享，为您的运营决策提供有效参考数据。\r\n</p>\r\n<p>\r\n	6. 云端部署：通过驱动的方式可以轻松支持平台的部署，让您的网站无缝迁移，内置已经支持SAE和BAE3.0。\r\n</p>\r\n<p>\r\n	7. 云服务支持：即将启动支持云存储、云安全、云过滤和云统计等服务，更多贴心的服务让您的网站更安心。\r\n</p>\r\n<p>\r\n	8. 安全稳健：提供稳健的安全策略，包括备份恢复、容错、防止恶意攻击登录，网页防篡改等多项安全管理功能，保证系统安全，可靠、稳定的运行。&nbsp;\r\n</p>\r\n<p>\r\n	9. 应用仓库：官方应用仓库拥有大量来自第三方插件和应用模块、模板主题，有众多来自开源社区的贡献，让您的网站“One”美无缺。&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>集成了一个完善的后台管理体系和前台模板标签系统，让你轻松管理数据和进行前台网站的标签式开发。&nbsp;</strong> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<h2>\r\n	后台主要功能：\r\n</h2>\r\n<p>\r\n	1. 用户Passport系统\r\n</p>\r\n<p>\r\n	2. 配置管理系统&nbsp;\r\n</p>\r\n<p>\r\n	3. 权限控制系统\r\n</p>\r\n<p>\r\n	4. 后台建模系统&nbsp;\r\n</p>\r\n<p>\r\n	5. 多级分类系统&nbsp;\r\n</p>\r\n<p>\r\n	6. 用户行为系统&nbsp;\r\n</p>\r\n<p>\r\n	7. 钩子和插件系统\r\n</p>\r\n<p>\r\n	8. 系统日志系统&nbsp;\r\n</p>\r\n<p>\r\n	9. 数据备份和还原\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	&nbsp;[ 官方下载：&nbsp;<a href=\"http://www.onethink.cn/download.html\" target=\"_blank\">http://www.onethink.cn/download.html</a>&nbsp;&nbsp;开发手册：<a href=\"http://document.onethink.cn/\" target=\"_blank\">http://document.onethink.cn/</a>&nbsp;]&nbsp;\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<strong>开发团队 2013~2014</strong> \r\n</p>','',0);

/*Table structure for table `yl_document_download` */

DROP TABLE IF EXISTS `yl_document_download`;

CREATE TABLE `yl_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

/*Data for the table `yl_document_download` */

/*Table structure for table `yl_file` */

DROP TABLE IF EXISTS `yl_file`;

CREATE TABLE `yl_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '远程地址',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_md5` (`md5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文件表';

/*Data for the table `yl_file` */

/*Table structure for table `yl_general_category` */

DROP TABLE IF EXISTS `yl_general_category`;

CREATE TABLE `yl_general_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '类型',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否热门分类',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `admin_id` int(10) unsigned NOT NULL COMMENT '管理员ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  `tag` varchar(255) NOT NULL COMMENT '标签',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `yl_general_category` */

insert  into `yl_general_category`(`id`,`name`,`pid`,`type`,`is_hot`,`sort`,`admin_id`,`status`,`create_time`,`update_time`,`tag`) values (1,'首页',0,1,0,1,1,1,1515754523,1516337885,'index'),(2,'关于永联',0,1,0,2,1,1,1515754536,1516338041,'about'),(3,'横幅',1,1,0,1,1,1,1516337158,1516337902,'index_banner'),(4,'内容',1,1,0,2,1,1,1516337173,1516337920,'index_content'),(5,'公司简介',1,1,0,3,1,1,1516337229,1516337939,'index_profile'),(6,'企业文化',1,1,0,4,1,1,1516337250,1516337974,'index_culture'),(7,'生产实力',1,1,0,5,1,1,1516337280,1516338014,'index_strength'),(8,'产品中心',1,1,0,6,1,1,1516337292,1516338027,'index_product'),(9,'公司简介',2,1,0,1,1,1,1516337402,1516338055,'about_profile'),(10,'公司荣誉',2,1,0,2,1,1,1516337757,1516338069,'about_honor'),(11,'发展历程',2,1,0,3,1,1,1516337768,1516338080,'about_history'),(12,'合作伙伴',0,1,0,4,1,1,1516337799,1516515411,'partners'),(13,'横幅',12,1,0,1,1,1,1516337811,1516338118,'partners_banner'),(14,'内容',12,1,0,2,1,1,1516337822,1516338132,'partners_content'),(15,'板房',7,1,0,1,1,1,1516513423,1516514878,'index_strength_sample_room'),(16,'布仓区',7,1,0,2,1,1,1516513528,1516514891,'index_strength_cloth_warehouse_area'),(17,'裁床区',7,1,0,3,1,1,1516513576,1516514902,'index_strength_cutting_table_area'),(18,'车缝区',7,1,0,4,1,1,1516513793,1516518812,'index_strength_sewing_area'),(19,'烫衣区',7,1,0,5,1,1,1516513848,1516514925,'index_strength_ironing_area'),(20,'成品区',7,1,0,6,1,1,1516513973,1516514936,'index_strength_finished_product_area'),(21,'物流区',7,1,0,7,1,1,1516514012,1516514950,'index_strength_logistic_area'),(22,'联系我们',0,1,0,5,1,1,1516515392,1516515919,'contact'),(23,'横幅',22,1,0,1,1,1,1516515468,1516515929,'contact_banner'),(24,'公司视频',0,1,0,3,1,0,1516515546,1516973089,'index_video'),(25,'公司视频',0,1,0,3,1,0,1516515951,1516973107,'video');

/*Table structure for table `yl_hooks` */

DROP TABLE IF EXISTS `yl_hooks`;

CREATE TABLE `yl_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `yl_hooks` */

insert  into `yl_hooks`(`id`,`name`,`description`,`type`,`update_time`,`addons`,`status`) values (1,'pageHeader','页面header钩子，一般用于加载插件CSS文件和代码',1,0,'',1),(2,'pageFooter','页面footer钩子，一般用于加载插件JS文件和JS代码',1,0,'ReturnTop',1),(3,'documentEditForm','添加编辑表单的 扩展内容钩子',1,0,'Attachment',1),(4,'documentDetailAfter','文档末尾显示',1,0,'Attachment,SocialComment',1),(5,'documentDetailBefore','页面内容前显示用钩子',1,0,'',1),(6,'documentSaveComplete','保存文档数据后的扩展钩子',2,0,'Attachment',1),(7,'documentEditFormContent','添加编辑表单的内容显示钩子',1,0,'Editor',1),(8,'adminArticleEdit','后台内容编辑页编辑器',1,1378982734,'EditorForAdmin',1),(13,'AdminIndex','首页小格子个性化显示',1,1382596073,'SiteStat,SystemInfo,DevTeam',1),(14,'topicComment','评论提交方式扩展钩子。',1,1380163518,'Editor',1),(16,'app_begin','应用开始',2,1384481614,'',1);

/*Table structure for table `yl_image` */

DROP TABLE IF EXISTS `yl_image`;

CREATE TABLE `yl_image` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `image_category_id` int(10) unsigned NOT NULL COMMENT '分类',
  `chs_picture_id` int(10) unsigned NOT NULL COMMENT '简体图片',
  `cht_picture_id` int(10) unsigned NOT NULL COMMENT '繁体图片',
  `eng_picture_id` int(10) unsigned NOT NULL COMMENT '英文图片',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `desc` varchar(255) NOT NULL COMMENT '描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  `sort` int(10) unsigned NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `yl_image` */

insert  into `yl_image`(`id`,`image_category_id`,`chs_picture_id`,`cht_picture_id`,`eng_picture_id`,`name`,`desc`,`status`,`create_time`,`update_time`,`sort`) values (1,9,53,0,0,'简介中间1','简介中间1',1,1515816116,1517324513,1),(2,9,55,0,0,'简介右侧1','简介右侧1',1,1515817022,1517326379,2),(3,9,56,0,0,'简介右侧2','简介右侧2',1,1515817125,1517326406,3),(4,9,57,0,0,'简介右侧3','简介右侧3',1,1515817145,1517326410,4),(5,9,58,0,0,'简介右侧4','简介右侧4',1,1515817166,1517326414,5),(6,9,54,0,0,'简介中间2','简介中间2',1,1515817197,1517326417,6),(7,9,52,0,0,'简介左侧4','简介左侧4',1,1515817237,1517324500,7),(8,9,51,0,0,'简介左侧3','简介左侧3',1,1515817351,1517324492,8),(9,9,50,0,0,'简介左侧2','简介左侧2',1,1515817369,1517324482,9),(10,9,49,0,0,'简介左侧1','简介左侧1',1,1515817394,1517323867,10),(11,3,23,0,0,'首页横幅1','首页横幅1',1,1516512895,1516512895,1),(12,4,44,48,43,'首页内容1','首页内容1',1,1516513159,1517318353,1),(13,5,3,0,0,'首页公司简介1','首页公司简介1',1,1516513252,1516513252,1),(14,6,25,0,0,'首页企业文化1','首页企业文化1',1,1516513334,1516513334,1),(15,15,26,0,0,'首页生产实力板房1','首页生产实力板房1',1,1516514166,1516514166,1),(16,16,27,0,0,'首页生产实力布仓区1','首页生产实力布仓区1',1,1516514208,1516541456,1),(17,17,28,0,0,'首页生产实力裁床区1','首页生产实力裁床区1',1,1516514256,1516514256,1),(18,18,29,0,0,'首页生产实力车缝区1','首页生产实力车缝区1',1,1516514279,1516514279,1),(19,19,30,0,0,'首页生产实力烫衣区1','首页生产实力烫衣区1',1,1516514307,1516514307,1),(20,20,30,0,0,'首页生产实力成品区1','首页生产实力成品区1',1,1516514336,1516514336,1),(21,21,31,0,0,'首页生产实力物流区1','首页生产实力物流区1',1,1516514382,1516514382,1),(22,8,39,0,0,'首页产品中心1','首页产品中心1',1,1516514842,1516805525,1),(23,10,46,0,45,'公司荣耀1','公司荣耀1',1,1516515121,1516810040,1),(24,11,46,0,45,'发展历程1','发展历程1',1,1516515148,1516811632,1),(25,13,34,0,0,'合作伙伴横幅1','合作伙伴横幅1',1,1516515190,1516515190,1),(26,14,59,0,0,'合作伙伴内容1','合作伙伴内容1',1,1516515237,1517572913,1),(27,23,36,0,0,'联系我们横幅1','联系我们横幅1',1,1516719980,1516719980,1);

/*Table structure for table `yl_member` */

DROP TABLE IF EXISTS `yl_member`;

CREATE TABLE `yl_member` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `nickname` char(16) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '1970-01-01' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`uid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员表';

/*Data for the table `yl_member` */

insert  into `yl_member`(`uid`,`nickname`,`sex`,`birthday`,`qq`,`score`,`login`,`reg_ip`,`reg_time`,`last_login_ip`,`last_login_time`,`status`) values (1,'admin',0,'1970-01-01','',140,34,0,1510634101,1032961676,1517623669,1),(2,'wingluen',0,'1970-01-01','',50,17,0,0,3535281658,1517622972,1);

/*Table structure for table `yl_menu` */

DROP TABLE IF EXISTS `yl_menu`;

CREATE TABLE `yl_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

/*Data for the table `yl_menu` */

insert  into `yl_menu`(`id`,`title`,`pid`,`sort`,`url`,`hide`,`tip`,`group`,`is_dev`,`status`) values (1,'首页',0,1,'Index/index',0,'','',0,1),(2,'内容',0,2,'Article/index',1,'','',0,1),(3,'文档列表',2,0,'article/index',1,'','内容',0,1),(4,'新增',3,0,'article/add',0,'','',0,1),(5,'编辑',3,0,'article/edit',0,'','',0,1),(6,'改变状态',3,0,'article/setStatus',0,'','',0,1),(7,'保存',3,0,'article/update',0,'','',0,1),(8,'保存草稿',3,0,'article/autoSave',0,'','',0,1),(9,'移动',3,0,'article/move',0,'','',0,1),(10,'复制',3,0,'article/copy',0,'','',0,1),(11,'粘贴',3,0,'article/paste',0,'','',0,1),(12,'导入',3,0,'article/batchOperate',0,'','',0,1),(13,'回收站',2,0,'article/recycle',1,'','内容',0,1),(14,'还原',13,0,'article/permit',0,'','',0,1),(15,'清空',13,0,'article/clear',0,'','',0,1),(16,'用户',0,3,'User/index',0,'','',0,1),(17,'用户信息',16,0,'User/index',0,'','用户管理',0,1),(18,'新增用户',17,0,'User/add',0,'添加新用户','',0,1),(19,'用户行为',16,0,'User/action',0,'','行为管理',0,1),(20,'新增用户行为',19,0,'User/addaction',0,'','',0,1),(21,'编辑用户行为',19,0,'User/editaction',0,'','',0,1),(22,'保存用户行为',19,0,'User/saveAction',0,'\"用户->用户行为\"保存编辑和新增的用户行为','',0,1),(23,'变更行为状态',19,0,'User/setStatus',0,'\"用户->用户行为\"中的启用,禁用和删除权限','',0,1),(24,'禁用会员',19,0,'User/changeStatus?method=forbidUser',0,'\"用户->用户信息\"中的禁用','',0,1),(25,'启用会员',19,0,'User/changeStatus?method=resumeUser',0,'\"用户->用户信息\"中的启用','',0,1),(26,'删除会员',19,0,'User/changeStatus?method=deleteUser',0,'\"用户->用户信息\"中的删除','',0,1),(27,'权限管理',16,0,'AuthManager/index',0,'','用户管理',0,1),(28,'删除',27,0,'AuthManager/changeStatus?method=deleteGroup',0,'删除用户组','',0,1),(29,'禁用',27,0,'AuthManager/changeStatus?method=forbidGroup',0,'禁用用户组','',0,1),(30,'恢复',27,0,'AuthManager/changeStatus?method=resumeGroup',0,'恢复已禁用的用户组','',0,1),(31,'新增',27,0,'AuthManager/createGroup',0,'创建新的用户组','',0,1),(32,'编辑',27,0,'AuthManager/editGroup',0,'编辑用户组名称和描述','',0,1),(33,'保存用户组',27,0,'AuthManager/writeGroup',0,'新增和编辑用户组的\"保存\"按钮','',0,1),(34,'授权',27,0,'AuthManager/group',0,'\"后台 \\ 用户 \\ 用户信息\"列表页的\"授权\"操作按钮,用于设置用户所属用户组','',0,1),(35,'访问授权',27,0,'AuthManager/access',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"访问授权\"操作按钮','',0,1),(36,'成员授权',27,0,'AuthManager/user',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"成员授权\"操作按钮','',0,1),(37,'解除授权',27,0,'AuthManager/removeFromGroup',0,'\"成员授权\"列表页内的解除授权操作按钮','',0,1),(38,'保存成员授权',27,0,'AuthManager/addToGroup',0,'\"用户信息\"列表页\"授权\"时的\"保存\"按钮和\"成员授权\"里右上角的\"添加\"按钮)','',0,1),(39,'分类授权',27,0,'AuthManager/category',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"分类授权\"操作按钮','',0,1),(40,'保存分类授权',27,0,'AuthManager/addToCategory',0,'\"分类授权\"页面的\"保存\"按钮','',0,1),(41,'模型授权',27,0,'AuthManager/modelauth',0,'\"后台 \\ 用户 \\ 权限管理\"列表页的\"模型授权\"操作按钮','',0,1),(42,'保存模型授权',27,0,'AuthManager/addToModel',0,'\"分类授权\"页面的\"保存\"按钮','',0,1),(43,'扩展',0,7,'Addons/index',0,'','',0,1),(44,'插件管理',43,1,'Addons/index',0,'','扩展',0,1),(45,'创建',44,0,'Addons/create',0,'服务器上创建插件结构向导','',0,1),(46,'检测创建',44,0,'Addons/checkForm',0,'检测插件是否可以创建','',0,1),(47,'预览',44,0,'Addons/preview',0,'预览插件定义类文件','',0,1),(48,'快速生成插件',44,0,'Addons/build',0,'开始生成插件结构','',0,1),(49,'设置',44,0,'Addons/config',0,'设置插件配置','',0,1),(50,'禁用',44,0,'Addons/disable',0,'禁用插件','',0,1),(51,'启用',44,0,'Addons/enable',0,'启用插件','',0,1),(52,'安装',44,0,'Addons/install',0,'安装插件','',0,1),(53,'卸载',44,0,'Addons/uninstall',0,'卸载插件','',0,1),(54,'更新配置',44,0,'Addons/saveconfig',0,'更新插件配置处理','',0,1),(55,'插件后台列表',44,0,'Addons/adminList',0,'','',0,1),(56,'URL方式访问插件',44,0,'Addons/execute',0,'控制是否有权限通过url访问插件控制器方法','',0,1),(57,'钩子管理',43,2,'Addons/hooks',0,'','扩展',0,1),(58,'模型管理',68,3,'Model/index',0,'','系统设置',0,1),(59,'新增',58,0,'model/add',0,'','',0,1),(60,'编辑',58,0,'model/edit',0,'','',0,1),(61,'改变状态',58,0,'model/setStatus',0,'','',0,1),(62,'保存数据',58,0,'model/update',0,'','',0,1),(63,'属性管理',68,0,'Attribute/index',1,'网站属性配置。','',0,1),(64,'新增',63,0,'Attribute/add',0,'','',0,1),(65,'编辑',63,0,'Attribute/edit',0,'','',0,1),(66,'改变状态',63,0,'Attribute/setStatus',0,'','',0,1),(67,'保存数据',63,0,'Attribute/update',0,'','',0,1),(68,'系统',0,4,'Config/group',0,'','',0,1),(69,'网站设置',68,1,'Config/group',0,'','系统设置',0,1),(70,'配置管理',68,4,'Config/index',0,'','系统设置',0,1),(71,'编辑',70,0,'Config/edit',0,'新增编辑和保存配置','',0,1),(72,'删除',70,0,'Config/del',0,'删除配置','',0,1),(73,'新增',70,0,'Config/add',0,'新增配置','',0,1),(74,'保存',70,0,'Config/save',0,'保存配置','',0,1),(75,'菜单管理',68,5,'Menu/index',0,'','系统设置',0,1),(76,'导航管理',68,6,'Channel/index',0,'','系统设置',0,1),(77,'新增',76,0,'Channel/add',0,'','',0,1),(78,'编辑',76,0,'Channel/edit',0,'','',0,1),(79,'删除',76,0,'Channel/del',0,'','',0,1),(80,'分类管理',68,2,'Category/index',0,'','系统设置',0,1),(81,'编辑',80,0,'Category/edit',0,'编辑和保存栏目分类','',0,1),(82,'新增',80,0,'Category/add',0,'新增栏目分类','',0,1),(83,'删除',80,0,'Category/remove',0,'删除栏目分类','',0,1),(84,'移动',80,0,'Category/operate/type/move',0,'移动栏目分类','',0,1),(85,'合并',80,0,'Category/operate/type/merge',0,'合并栏目分类','',0,1),(86,'备份数据库',68,0,'Database/index?type=export',0,'','数据备份',0,1),(87,'备份',86,0,'Database/export',0,'备份数据库','',0,1),(88,'优化表',86,0,'Database/optimize',0,'优化数据表','',0,1),(89,'修复表',86,0,'Database/repair',0,'修复数据表','',0,1),(90,'还原数据库',68,0,'Database/index?type=import',0,'','数据备份',0,1),(91,'恢复',90,0,'Database/import',0,'数据库恢复','',0,1),(92,'删除',90,0,'Database/del',0,'删除备份文件','',0,1),(93,'其他',0,5,'other',1,'','',0,1),(96,'新增',75,0,'Menu/add',0,'','系统设置',0,1),(98,'编辑',75,0,'Menu/edit',0,'','',0,1),(106,'行为日志',16,0,'Action/actionlog',0,'','行为管理',0,1),(108,'修改密码',16,0,'User/updatePassword',1,'','',0,1),(109,'修改昵称',16,0,'User/updateNickname',1,'','',0,1),(110,'查看行为日志',106,0,'action/edit',1,'','',0,1),(112,'新增数据',58,0,'think/add',1,'','',0,1),(113,'编辑数据',58,0,'think/edit',1,'','',0,1),(114,'导入',75,0,'Menu/import',0,'','',0,1),(115,'生成',58,0,'Model/generate',0,'','',0,1),(116,'新增钩子',57,0,'Addons/addHook',0,'','',0,1),(117,'编辑钩子',57,0,'Addons/edithook',0,'','',0,1),(118,'文档排序',3,0,'Article/sort',1,'','',0,1),(119,'排序',70,0,'Config/sort',1,'','',0,1),(120,'排序',75,0,'Menu/sort',1,'','',0,1),(121,'排序',76,0,'Channel/sort',1,'','',0,1),(122,'数据列表',58,0,'think/lists',1,'','',0,1),(123,'审核列表',3,0,'Article/examine',1,'','',0,1),(124,'管理',0,2,'Image/index',0,'','',0,1),(138,'联系我们',124,3,'Contact/index',0,'','联系我们',0,1),(125,'图片分类',124,1,'ImageCategory/index',0,'','图片管理',0,1),(126,'列表',125,0,'ImageCategory/lists',0,'','',0,1),(127,'新增',125,0,'ImageCategory/add',0,'','',0,1),(128,'编辑',125,0,'ImageCategory/edit',0,'','',0,1),(129,'删除',125,0,'ImageCategory/remove',0,'','',0,1),(130,'移动',125,0,'ImageCategory/operate/type/move',0,'','',0,1),(131,'图片',124,2,'Image/index',0,'','图片管理',0,1),(132,'列表',131,0,'Image/lists',0,'','',0,1),(133,'新增',131,0,'Image/add',0,'','',0,1),(134,'编辑',131,0,'Image/edit',0,'','',0,1),(135,'删除',131,0,'Image/del',0,'','',0,1),(136,'改变状态',125,0,'ImageCategory/setStatus',0,'','',0,1),(137,'改变状态',131,0,'Image/setStatus',0,'','',0,1),(139,'列表',138,1,'Contact/lists',0,'','',0,1),(140,'新增',138,2,'Contact/add',0,'','',0,1),(141,'编辑',138,3,'Contact/edit',0,'','',0,1),(142,'删除',138,4,'Contact/del',0,'','',0,1),(143,'改变状态',138,5,'Contact/setStatus',0,'','',0,1);

/*Table structure for table `yl_model` */

DROP TABLE IF EXISTS `yl_model`;

CREATE TABLE `yl_model` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text COMMENT '属性列表（表的字段）',
  `attribute_alias` varchar(255) NOT NULL DEFAULT '' COMMENT '属性别名定义',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='文档模型表';

/*Data for the table `yl_model` */

insert  into `yl_model`(`id`,`name`,`title`,`extend`,`relation`,`need_pk`,`field_sort`,`field_group`,`attribute_list`,`attribute_alias`,`template_list`,`template_add`,`template_edit`,`list_grid`,`list_row`,`search_key`,`search_list`,`create_time`,`update_time`,`status`,`engine_type`) values (1,'document','基础文档',0,'',1,'{\"1\":[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\",\"13\",\"14\",\"15\",\"16\",\"17\",\"18\",\"19\",\"20\",\"21\",\"22\"]}','1:基础','','','','','','id:编号\r\ntitle:标题:[EDIT]\r\ntype:类型\r\nupdate_time:最后更新\r\nstatus:状态\r\nview:浏览\r\nid:操作:[EDIT]|编辑,[DELETE]|删除',0,'','',1383891233,1384507827,1,'MyISAM'),(2,'article','文章',1,'',1,'{\"1\":[\"3\",\"24\",\"2\",\"5\"],\"2\":[\"9\",\"13\",\"19\",\"10\",\"12\",\"16\",\"17\",\"26\",\"20\",\"14\",\"11\",\"25\"]}','1:基础,2:扩展','','','','','','',0,'','',1383891243,1387260622,1,'MyISAM'),(3,'download','下载',1,'',1,'{\"1\":[\"3\",\"28\",\"30\",\"32\",\"2\",\"5\",\"31\"],\"2\":[\"13\",\"10\",\"27\",\"9\",\"12\",\"16\",\"17\",\"19\",\"11\",\"20\",\"14\",\"29\"]}','1:基础,2:扩展','','','','','','',0,'','',1383891252,1387260449,1,'MyISAM'),(4,'general_category','通用分类',0,'',1,'','1:基础','','','','','','id:编号\r\nname:名称:[EDIT]\r\ntype:类型\r\nstatus:是否启用\r\ncreate_time:创建时间\r\nupdate_time:更新时间',10,'name','type',1515745209,1515745242,1,'MyISAM'),(5,'image','图片',0,'',1,'{\"1\":[\"42\",\"43\",\"50\",\"51\",\"49\",\"44\",\"45\"]}','1:基础','','','','','','id:编号\r\nimage_category_id|get_general_category_name:分类\r\nname:名称:[EDIT]\r\nsort:排序\r\ndesc:描述\r\nstatus:是否启用\r\ncreate_time:创建时间\r\nupdate_time:更新时间\r\nid:操作:[EDIT]|编辑,[STATUS]|状态,[REMOVE]|删除',20,'name','category_id',1515769618,1516971466,1,'MyISAM'),(6,'contact','联系我们',0,'',1,'{\"1\":[\"53\",\"54\",\"55\",\"56\",\"57\",\"58\",\"59\",\"60\",\"61\",\"62\",\"63\",\"64\",\"65\",\"66\",\"67\",\"69\",\"68\",\"70\"]}','1:基础','','','','','','id:编号\r\ncompany_name_chs:公司名称:[EDIT]\r\nsort:排序\r\nstatus:是否启用\r\ncreate_time:创建时间\r\nupdate_time:更新时间\r\nid:操作:[EDIT]|编辑,[STATUS]|状态,[REMOVE]|删除',10,'','',1517752411,1517757504,1,'MyISAM');

/*Table structure for table `yl_picture` */

DROP TABLE IF EXISTS `yl_picture`;

CREATE TABLE `yl_picture` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

/*Data for the table `yl_picture` */

insert  into `yl_picture`(`id`,`path`,`url`,`md5`,`sha1`,`status`,`create_time`) values (1,'/Uploads/Picture/2018-01-14/5a58dc8a2f824.jpg','','0f009f4af3053459289ccf4a8a919d6f','c00e2ca743fc2898620ebdcbb45869da40611a1e',1,1515773065),(2,'/Uploads/Picture/2018-01-14/5a5b262ea0fcd.png','','672d160249ffadef83f5fd4e3e2afa39','f2e9419fb8ada3fa7d839ac34194c14cf9157b37',1,1515922990),(3,'/Uploads/Picture/2018-01-14/5a5b266a84bd9.png','','4093ec62efeb9e81b2f015f5839496a9','c7f87ce72d10e457b498de84bcb3e04f68fc928b',1,1515923050),(4,'/Uploads/Picture/2018-01-14/5a5b267ab7d44.png','','0a1ff3f160390025a26176e3fae4d433','d63ed156094afb880d5a0f8ce7e5720349b7e205',1,1515923066),(5,'/Uploads/Picture/2018-01-14/5a5b268136eb6.png','','9966e1b1b4a474173a0454d54371ef75','a6f58318df4d5a28c4387397876c4bea44defb07',1,1515923072),(6,'/Uploads/Picture/2018-01-14/5a5b268614d03.png','','c9cd9906b1b9a245bbdfc662b97c9b8e','38569831f42d0160535ce1f5a9ee270dd1df375d',1,1515923077),(7,'/Uploads/Picture/2018-01-14/5a5b268c180bb.png','','006f13c8ed83fb8f07bb56e41b2211d9','8e4654417b33ff392f2357ba4ac554150c31c757',1,1515923083),(8,'/Uploads/Picture/2018-01-14/5a5b2672f16c0.png','','8e63902a5ed009feaeec490ca3f97e2f','dcdf634365a6ec72537f26d36fba5eb7cb8619d1',1,1515923058),(9,'/Uploads/Picture/2018-01-14/5a5b2664e24ae.png','','ee05d54d12168ba76665f6fa8c0b4cfa','53e23c712177b9d1b7f6942fbfa0b112b9111ac6',1,1515923044),(10,'/Uploads/Picture/2018-01-14/5a5b2660573c7.png','','0bbe1958ac98839f0e4ea4cd6472b856','5d9a50a5a2c56a01bde3abb26f53dc2504310f62',1,1515923039),(11,'/Uploads/Picture/2018-01-14/5a5b2632d3995.png','','f9110f682c4eabdf0e883aae6d7c2562','c28f79782457f154db5078d2be236fba8f9b8546',1,1515922994),(12,'/Uploads/Picture/2018-01-14/5a5b266ee834f.png','','49737c7351d83bdd6059c23e6c7a3824','df156ca6562b790283c6aac8883ab566f966f2ca',1,1515923054),(23,'/Uploads/Picture/2018-01-21/5a64266cad426.png','','17cc0d938feb3e36c0a77badc6846a8f','dade646285aad496a23dcc3a513172cc083546a5',1,1516512875),(24,'/Uploads/Picture/2018-01-21/5a6427817012c.png','','aa58dd4cc9a06edc12ec6aede5829785','0d199f16132c6c76c64b964abc80f5ccb8550a4a',1,1516513148),(25,'/Uploads/Picture/2018-01-21/5a64282c319a9.png','','3d22b4ebe217b719d17c5d4ec1f1cf45','d7f3aa84ac4492414ad19a4536d458be0a34416d',1,1516513323),(26,'/Uploads/Picture/2018-01-21/5a642b60ae7c4.jpg','','82ee20200b5089456bf5de67e43d8f98','db657b5fd50d5d4a7545c5e72c68afdc0f30a104',1,1516514144),(27,'/Uploads/Picture/2018-01-21/5a642b9d79494.jpg','','0bda06f290a601ffcc7250a2def3905f','dc1cb2cf6e563141686f95d3104373cb75dfb6c1',1,1516514201),(28,'/Uploads/Picture/2018-01-21/5a642bbec6c8a.jpg','','fa39c0fa31c0b91454f551ff99f68443','935e72c2f291d47e7153b63d17352d97e9ebceb9',1,1516514234),(29,'/Uploads/Picture/2018-01-21/5a642bdfeb78c.jpg','','3610621ce252c777fcf76a6389501c9e','b109ec1f390373c23fde3e2427d04f41a9ffdb94',1,1516514271),(30,'/Uploads/Picture/2018-01-21/5a642bfa933df.jpg','','8a9ad398fa341456c6dd5cb3798979f6','db6e057ce80d54e86acca7e47f335547b9382b8f',1,1516514297),(31,'/Uploads/Picture/2018-01-21/5a642c419d455.jpg','','fcb651684a41390d3faed62b24b1c9bb','37cbb8ec1d10e28e9956befd974cb2ebd88eb4e1',1,1516514365),(32,'/Uploads/Picture/2018-01-21/5a642e136b351.jpg','','6b3598db47b4b3771b4c8fdcf8654e75','28bc607314255765017c9715ba16e4a8147e1cb8',1,1516514834),(33,'/Uploads/Picture/2018-01-21/5a642f2a6aa10.png','','18491b1d4a191b988efeffaf0047f41e','92dc1a41154cc8ada4631d08740c48c0047e5be3',1,1516515113),(34,'/Uploads/Picture/2018-01-21/5a642f67ec80c.png','','10b284cec3507c0e0d890b35b60ad69c','5323d1d7622cff197c3e3ac66b8f87b479f0ad0f',1,1516515175),(35,'/Uploads/Picture/2018-01-21/5a642f9a2ae37.jpg','','00c8bcdf0e4ccd9c33d3772f45a01317','b165f54217e596b1fb4a4c86f9c86b77f44d7ee1',1,1516515225),(36,'/Uploads/Picture/2018-01-23/5a674f4dedab3.jpg','','80e950861ce8823839b3e328dc2123fd','af56062336063f7b323f466a7c0fc66b93555601',1,1516719949),(37,'/Uploads/Picture/2018-01-24/5a68981a8915b.gif','','6c20920c9c14297813edb765fc1972ca','769bc04432ae2176942fdb686d98a323efabea18',1,1516804121),(38,'/Uploads/Picture/2018-01-24/5a689cfad514a.png','','71e0fa3bfea84bd6cb2b79472bdd6477','a33889331c1a253da26a60f69acafe5dac2716b2',1,1516805370),(39,'/Uploads/Picture/2018-01-24/5a689d92c187e.png','','bce36d0b046c8ae3b523bb768194967f','75456b6d8d7d2d33e06f6d1d397759756dfb741b',1,1516805520),(40,'/Uploads/Picture/2018-01-24/5a689dc20db7c.png','','51cddcd9d05ded469a52ee47dd6e1804','6fe073c6f30aa47f771993b0f2f6721ae684c5a2',1,1516805568),(41,'/Uploads/Picture/2018-01-24/5a689dc8995bc.png','','8a9f413bdb066db9570b42e78d7dc0a8','5e4738a6408c290b39323d661dbae1d4cb29aed9',1,1516805576),(42,'/Uploads/Picture/2018-01-24/5a68aa3fac7eb.png','','53ced1c04abf3d72e2c022a2628cf234','ba3d10580b7f8926e0175ab025f6044e0ac6509f',1,1516808767),(43,'/Uploads/Picture/2018-01-24/5a68aa456ff32.png','','1a7dc2672872790dc4ac73771e19bfad','60e371c98928c561e050c6cec4320b4a1bb5d37f',1,1516808772),(44,'/Uploads/Picture/2018-01-24/5a68aa855f193.png','','78e6e84ef65a6012cdbd96f591bf7625','1756fe83ff2aa7a3573e2b5bafa02ccf8a2582eb',1,1516808834),(45,'/Uploads/Picture/2018-01-25/5a68af260cbe9.png','','ef7de93ffb6978032f1aa69c9a9826b4','79fdc8d78b0c8cb920703f4658f5be83251a0b1a',1,1516810021),(46,'/Uploads/Picture/2018-01-25/5a68af349878d.png','','b113361b3a2ab25b42c6e4915668b359','804403c5b31efab1b1c194a13a19560b288757ec',1,1516810036),(47,'/Uploads/Picture/2018-01-30/5a706fc1aca92.png','','050376e79729475ff43d297aa39b18f5','8498761dab14bf9754bbe54971c63a655178f9a1',1,1517318081),(48,'/Uploads/Picture/2018-01-30/5a7070c90a409.png','','679838c065011a08f29e2713c43ad039','0d25928bb79942e19a95fb0b414e7797abb39bc3',1,1517318344),(49,'/Uploads/Picture/2018-01-30/5a7086590bd23.png','','9d04177d5c7d436cfff83ab0a1fd00e5','246dc8f490849cb85e0802c7c1a80d4dca92dc09',1,1517323864),(50,'/Uploads/Picture/2018-01-30/5a7088c0a98f4.png','','e9fba997fdfed698ee91bd99571b93f5','514f67cc1b9a63354d7f31c52a15a7869fce68bc',1,1517324480),(51,'/Uploads/Picture/2018-01-30/5a7088ca68f9b.png','','a9781589db65ca7e8be1decd647c1a05','441d5f38b9453323a0dd9f1ddce72b529277e447',1,1517324490),(52,'/Uploads/Picture/2018-01-30/5a7088d1f359f.png','','ad1bda8b4935ab9acd468a274e5a410e','34841107193196793453274fa5d5e0ebf5735c05',1,1517324497),(53,'/Uploads/Picture/2018-01-30/5a7088df07801.png','','ad8c79df684d4f7ae66be35c130d4810','afd4cd1039d7e35546b20ed395cb7eaf40a77f95',1,1517324510),(54,'/Uploads/Picture/2018-01-30/5a7088e6a1bca.png','','051d3537c60906db5ad245f4be8a8b9c','02e9d54207bde957d10813d8afc4f70f9e22bd84',1,1517324518),(55,'/Uploads/Picture/2018-01-30/5a708a88c0a04.png','','da33e80cfdb9fd40e53df6dc49a8785c','1e22b5df4b2fec8e1f3b8b4fd709e2cd5fd7f40a',1,1517324936),(56,'/Uploads/Picture/2018-01-30/5a708a90d29e8.png','','2d45b91223256edd2eef02ab8eae979f','8cfded3b36437ead04bd2bba9b54547a63b49fc8',1,1517324944),(57,'/Uploads/Picture/2018-01-30/5a708a99ef133.png','','bc7a9879053960f8f3969b9464e0c61d','e10e4bb9bf45d39dfbfdba045bc1f68e96ff8dbe',1,1517324953),(58,'/Uploads/Picture/2018-01-30/5a708aa2ce81b.png','','7bb08dc3efe4103ca107fc7db011d63d','703d7d20d5e23f8cbeae3aed18d7f2fd3582f10e',1,1517324962),(59,'/Uploads/Picture/2018-02-02/5a74532da4ccb.png','','67e4f50b1c57bb313cce4350c2b373b5','d7a29c2d6ffdbe1e363fe6d7e541b67aff4c0b88',1,1517572908);

/*Table structure for table `yl_ucenter_admin` */

DROP TABLE IF EXISTS `yl_ucenter_admin`;

CREATE TABLE `yl_ucenter_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表';

/*Data for the table `yl_ucenter_admin` */

/*Table structure for table `yl_ucenter_app` */

DROP TABLE IF EXISTS `yl_ucenter_app`;

CREATE TABLE `yl_ucenter_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL DEFAULT '' COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

/*Data for the table `yl_ucenter_app` */

/*Table structure for table `yl_ucenter_member` */

DROP TABLE IF EXISTS `yl_ucenter_member`;

CREATE TABLE `yl_ucenter_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` char(16) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(64) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL DEFAULT '' COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `yl_ucenter_member` */

insert  into `yl_ucenter_member`(`id`,`username`,`password`,`email`,`mobile`,`reg_time`,`reg_ip`,`last_login_time`,`last_login_ip`,`update_time`,`status`) values (1,'admin','493988d6adb336960813f86eae6959ae','admin@qq.com','',1510634101,2130706433,1517623669,1032961676,1510634101,1),(2,'wingluen','8c2b44aea90ac7126d27837270310ee2','Reception.Reception@winluen.com.hk','',1516584655,2130706433,1517622972,3535281658,1516584655,1);

/*Table structure for table `yl_ucenter_setting` */

DROP TABLE IF EXISTS `yl_ucenter_setting`;

CREATE TABLE `yl_ucenter_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表';

/*Data for the table `yl_ucenter_setting` */

/*Table structure for table `yl_url` */

DROP TABLE IF EXISTS `yl_url`;

CREATE TABLE `yl_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表';

/*Data for the table `yl_url` */

/*Table structure for table `yl_userdata` */

DROP TABLE IF EXISTS `yl_userdata`;

CREATE TABLE `yl_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id',
  UNIQUE KEY `uid` (`uid`,`type`,`target_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `yl_userdata` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
