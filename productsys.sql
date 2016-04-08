/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50027
Source Host           : localhost:3306
Source Database       : productsys

Target Server Type    : MYSQL
Target Server Version : 50027
File Encoding         : 65001

Date: 2015-03-10 20:11:27
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `bases`
-- ----------------------------
DROP TABLE IF EXISTS `bases`;
CREATE TABLE `bases` (
  `id` int(11) NOT NULL auto_increment,
  `bname` varchar(255) default NULL,
  `baddrs` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bases
-- ----------------------------
INSERT INTO `bases` VALUES ('1', '北一号仓库', '...');
INSERT INTO `bases` VALUES ('2', '北二号仓库', '...');
INSERT INTO `bases` VALUES ('3', '南一号仓库', '...');

-- ----------------------------
-- Table structure for `gysxx`
-- ----------------------------
DROP TABLE IF EXISTS `gysxx`;
CREATE TABLE `gysxx` (
  `id` int(11) NOT NULL auto_increment,
  `gname` varchar(500) default NULL,
  `gno` varchar(500) default NULL,
  `lxr` varchar(500) default NULL,
  `lxtel` varchar(500) default NULL,
  `addrs` varchar(500) default NULL,
  `zy` varchar(500) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gysxx
-- ----------------------------
INSERT INTO `gysxx` VALUES ('6', '武汉打印机公司', 'fa.001', '阿汤', '02788888888', '北京中北三路346', '打印机');

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL auto_increment,
  `orderno` varchar(500) default NULL,
  `memberno` varchar(500) default NULL,
  `pinfo` varchar(500) default NULL,
  `ywy` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', 'jd.001', '大发彩印公司', '要十五台打印机', 'ywy.01');
INSERT INTO `orders` VALUES ('2', 'jd.002', '大发彩印公司', '要十台打印机', 'ywy.01');

-- ----------------------------
-- Table structure for `sysuser`
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser` (
  `id` int(11) NOT NULL auto_increment,
  `uname` varchar(255) default NULL,
  `upass` varchar(255) default NULL,
  `utype` varchar(255) default NULL,
  `tname` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `addrs` varchar(255) default NULL,
  `filename` varchar(255) default NULL,
  `savetime` varchar(255) default NULL,
  `zyfw` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sysuser
-- ----------------------------
INSERT INTO `sysuser` VALUES ('1', 'admin', '123', '系统管理员', '小王', '女', '02711111112', '51889090@QQ.com', '苏州', '201412261120550001.gif', '2013-03-01 00:00:00', null);
INSERT INTO `sysuser` VALUES ('6', 'kc01', '123', '库存管理员', '阿张', '女', '02788888888', '213@21.com', '山东济南友谊大道', '201304211512140001.jpg', '2013-02-24 19:55:08', null);
INSERT INTO `sysuser` VALUES ('9', 'yw01', '123', '业务管理员', '小王', '女', '02711111111', '123@qq.com', '北京中北三路346', '201412261121160002.jpg', '2013-04-18 09:39:52', null);
INSERT INTO `sysuser` VALUES ('10', '大发彩印公司', '', '客户', '老王', '女', '02711111111', '1123111@qq.com', '...', '201412221615270007.jpg', '2014-04-04 15:15:24', '打印机');
INSERT INTO `sysuser` VALUES ('11', '武汉办公器材厂', '', '供应商', '王小姐', '女', '02711111111', '1123111@qq.com', '武汉', '', '2014-12-26 11:32:36', '办公器材');

-- ----------------------------
-- Table structure for `wpcrinfo`
-- ----------------------------
DROP TABLE IF EXISTS `wpcrinfo`;
CREATE TABLE `wpcrinfo` (
  `id` int(11) NOT NULL auto_increment,
  `optype` varchar(500) default NULL,
  `opdate` varchar(500) default NULL,
  `member` varchar(500) default NULL,
  `pchi` varchar(500) default NULL,
  `wpno` varchar(255) default NULL,
  `spname` varchar(500) default NULL,
  `price` varchar(255) default NULL,
  `yprice` varchar(255) default NULL,
  `tnum` varchar(500) default NULL,
  `nnum` varchar(500) default NULL,
  `jcontent` varchar(255) default NULL,
  `je` varchar(255) default NULL,
  `guig` varchar(500) default NULL,
  `gys` varchar(500) default NULL,
  `scdate` varchar(500) default NULL,
  `yxdate` varchar(500) default NULL,
  `cfwz` varchar(500) default NULL,
  `uname` varchar(500) default NULL,
  `savetime` varchar(500) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wpcrinfo
-- ----------------------------
INSERT INTO `wpcrinfo` VALUES ('38', '入库', '2014-12-11', '', 'rk.001', 'no.001', '打印机', '1000', '2000', '100', '100', null, '100000', 'G0020', '武汉办公器材厂', '2014-12-25', '2015-01-08', '南一号仓库', 'admin', '2014-12-26 16:33:56');
INSERT INTO `wpcrinfo` VALUES ('39', '入库', '2014-12-10', '', 'rk.002', 'no.002', '传真机', '2000', '4000', '50', '35', null, '100000', 'G0010', '武汉办公器材厂', '2014-12-24', '2015-01-09', '南一号仓库', 'admin', '2014-12-26 16:34:56');
INSERT INTO `wpcrinfo` VALUES ('50', '报损', '2014-12-11', '', 'rk.002', 'no.002', '传真机', '2000', '', '10', '35', '坏了，返修', '20000', '', '武汉办公器材厂', '', '', '', 'admin', '2014-12-27 09:44:44');
INSERT INTO `wpcrinfo` VALUES ('51', '出库', '2014-12-01', '大发彩印公司', 'rk.002', 'no.002', '传真机', '', '4000', '10', '35', '', '40000', '', '武汉办公器材厂', '', '', '', 'admin', '2014-12-27 09:45:23');
INSERT INTO `wpcrinfo` VALUES ('52', '退货', '2014-12-17', '大发彩印公司', 'rk.002', 'no.002', '传真机', '', '4000', '5', '', '质量不行', '20000', '51', '武汉办公器材厂', '', '', '', 'admin', '2014-12-27 09:46:31');
INSERT INTO `wpcrinfo` VALUES ('53', '入库', '2014-12-26', '', 'rk.003', 'no.001', '打印机', '1000', '3000', '100', '100', '', '100000', 'G0010', '武汉办公器材厂', '2014-12-24', '2015-01-10', '南一号仓库', 'admin', '2014-12-27 09:49:41');

-- ----------------------------
-- Table structure for `wpjbxx`
-- ----------------------------
DROP TABLE IF EXISTS `wpjbxx`;
CREATE TABLE `wpjbxx` (
  `id` int(11) NOT NULL auto_increment,
  `wpno` varchar(500) default NULL,
  `wpname` varchar(500) default NULL,
  `danwei` varchar(500) default NULL,
  `wptype` varchar(500) default NULL,
  `maxnum` varchar(255) default NULL,
  `minum` varchar(255) default NULL,
  `bei` varchar(500) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wpjbxx
-- ----------------------------
INSERT INTO `wpjbxx` VALUES ('1', 'no.002', '传真机', '台', '办公器材类', '100', '10', '...');
INSERT INTO `wpjbxx` VALUES ('2', 'no.001', '打印机', '台', '办公器材类', '100', '10', '...');

-- ----------------------------
-- Table structure for `wptypes`
-- ----------------------------
DROP TABLE IF EXISTS `wptypes`;
CREATE TABLE `wptypes` (
  `id` int(11) NOT NULL auto_increment,
  `tname` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wptypes
-- ----------------------------
INSERT INTO `wptypes` VALUES ('1', '办公器材类');
INSERT INTO `wptypes` VALUES ('2', '办公耗材类');
