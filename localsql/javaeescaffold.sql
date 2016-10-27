/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : javaeescaffold

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-10-28 01:22:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_organization`
-- ----------------------------
DROP TABLE IF EXISTS `t_organization`;
CREATE TABLE `t_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `creator_name` varchar(255) DEFAULT NULL,
  `available` bit(1) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_organization
-- ----------------------------

-- ----------------------------
-- Table structure for `t_resource`
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` time DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `available` bit(1) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `permission` varchar(100) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `creator_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resource
-- ----------------------------
INSERT INTO `t_resource` VALUES ('1', null, null, '', '用户管理', '0', 'user:menu', '1', 'menu', 'user/all', null);
INSERT INTO `t_resource` VALUES ('2', null, null, '', '创建用户', '1', 'user:create', '1', 'button', '', null);
INSERT INTO `t_resource` VALUES ('3', null, null, '', '删除用户', '1', 'user:delete', '1', 'button', null, null);
INSERT INTO `t_resource` VALUES ('4', null, null, '', '编辑用户', '1', 'user:update', '1', 'button', null, null);
INSERT INTO `t_resource` VALUES ('5', null, null, '', '查询用户', '1', 'user:view', '1', 'button', null, null);
INSERT INTO `t_resource` VALUES ('6', null, null, '', '角色管理', '0', 'role:menu', '2', 'menu', 'role/all', null);
INSERT INTO `t_resource` VALUES ('7', null, null, '', '创建角色', '6', 'role:create', '1', 'button', '', null);
INSERT INTO `t_resource` VALUES ('8', null, null, '', '删除角色', '6', 'role:delete', '1', 'button', '2', null);
INSERT INTO `t_resource` VALUES ('9', null, null, '', '编辑角色', '6', 'role:update', '1', 'button', '', null);
INSERT INTO `t_resource` VALUES ('10', null, null, '', '查询角色', '6', 'role:view', '1', 'button', '', null);
INSERT INTO `t_resource` VALUES ('11', '14:15:19', null, '', '资源管理', '0', 'resource:menu', '3', 'menu', 'resource/all', 'admin');
INSERT INTO `t_resource` VALUES ('12', '15:22:35', null, '', '创建资源', '11', 'resource:create', '1', 'button', '', 'admin');
INSERT INTO `t_resource` VALUES ('13', '15:22:52', null, '', '删除资源', '11', 'resource:delete', '1', 'button', '', 'admin');
INSERT INTO `t_resource` VALUES ('14', '15:23:23', null, '', '查询资源', '11', 'resource:view', '1', 'button', '', 'admin');
INSERT INTO `t_resource` VALUES ('15', '15:23:47', null, '', '编辑资源', '11', 'resource:update', '1', 'button', '', 'admin');
INSERT INTO `t_resource` VALUES ('18', '19:27:09', null, '', '绑定角色', '1', 'user:bind', '1', 'button', '', 'admin');
INSERT INTO `t_resource` VALUES ('19', '19:34:06', null, '', '绑定资源', '6', 'role:bind', '1', 'button', '', 'admin');
INSERT INTO `t_resource` VALUES ('30', '14:12:57', null, '', '上传用户', '1', 'user:upload', '1', 'button', '', 'admin');
INSERT INTO `t_resource` VALUES ('31', '14:13:13', null, '', '下载用户', '1', 'user:download', '1', 'button', '', 'admin');
INSERT INTO `t_resource` VALUES ('38', '23:32:16', null, '', '监控系统', '0', 'monitor:view', '4', 'menu', 'druid', 'admin');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `available` bit(1) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `mark` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `creator_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '2015-10-19 22:18:02', null, '', '超管', null, 'admin', 'guest');
INSERT INTO `t_role` VALUES ('21', '2015-10-18 13:36:34', null, '', 'fg', null, 'admin2', 'admin');
INSERT INTO `t_role` VALUES ('25', '2015-10-28 14:36:22', null, '', '来宾', null, 'guest', 'admin');
INSERT INTO `t_role` VALUES ('26', '2016-10-28 01:02:00', null, '', '课程管理', null, 'course', 'admin');

-- ----------------------------
-- Table structure for `t_role_resource`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_resource`;
CREATE TABLE `t_role_resource` (
  `role_id` bigint(20) NOT NULL,
  `resource_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`,`resource_id`),
  KEY `FK_hvd3v1xf4men57mo38osb4ih1` (`resource_id`),
  CONSTRAINT `FK_hvd3v1xf4men57mo38osb4ih1` FOREIGN KEY (`resource_id`) REFERENCES `t_resource` (`id`),
  CONSTRAINT `FK_qie95ky0tnqn6cl36rd606yxo` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_resource
-- ----------------------------
INSERT INTO `t_role_resource` VALUES ('1', '1');
INSERT INTO `t_role_resource` VALUES ('21', '1');
INSERT INTO `t_role_resource` VALUES ('25', '1');
INSERT INTO `t_role_resource` VALUES ('1', '2');
INSERT INTO `t_role_resource` VALUES ('21', '2');
INSERT INTO `t_role_resource` VALUES ('1', '3');
INSERT INTO `t_role_resource` VALUES ('21', '3');
INSERT INTO `t_role_resource` VALUES ('1', '4');
INSERT INTO `t_role_resource` VALUES ('21', '4');
INSERT INTO `t_role_resource` VALUES ('1', '5');
INSERT INTO `t_role_resource` VALUES ('21', '5');
INSERT INTO `t_role_resource` VALUES ('25', '5');
INSERT INTO `t_role_resource` VALUES ('1', '6');
INSERT INTO `t_role_resource` VALUES ('21', '6');
INSERT INTO `t_role_resource` VALUES ('25', '6');
INSERT INTO `t_role_resource` VALUES ('1', '7');
INSERT INTO `t_role_resource` VALUES ('21', '7');
INSERT INTO `t_role_resource` VALUES ('1', '8');
INSERT INTO `t_role_resource` VALUES ('21', '8');
INSERT INTO `t_role_resource` VALUES ('1', '9');
INSERT INTO `t_role_resource` VALUES ('21', '9');
INSERT INTO `t_role_resource` VALUES ('1', '10');
INSERT INTO `t_role_resource` VALUES ('21', '10');
INSERT INTO `t_role_resource` VALUES ('25', '10');
INSERT INTO `t_role_resource` VALUES ('1', '11');
INSERT INTO `t_role_resource` VALUES ('21', '11');
INSERT INTO `t_role_resource` VALUES ('25', '11');
INSERT INTO `t_role_resource` VALUES ('1', '12');
INSERT INTO `t_role_resource` VALUES ('21', '12');
INSERT INTO `t_role_resource` VALUES ('1', '13');
INSERT INTO `t_role_resource` VALUES ('21', '13');
INSERT INTO `t_role_resource` VALUES ('1', '14');
INSERT INTO `t_role_resource` VALUES ('21', '14');
INSERT INTO `t_role_resource` VALUES ('25', '14');
INSERT INTO `t_role_resource` VALUES ('1', '15');
INSERT INTO `t_role_resource` VALUES ('21', '15');
INSERT INTO `t_role_resource` VALUES ('1', '18');
INSERT INTO `t_role_resource` VALUES ('21', '18');
INSERT INTO `t_role_resource` VALUES ('1', '19');
INSERT INTO `t_role_resource` VALUES ('21', '19');
INSERT INTO `t_role_resource` VALUES ('1', '30');
INSERT INTO `t_role_resource` VALUES ('1', '31');
INSERT INTO `t_role_resource` VALUES ('1', '38');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `locked` bit(1) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  `user_alias` varchar(50) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `creator_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('98', '2015-10-18 13:37:12', null, '2015-11-17 19:40:08', '', '2015-11-19 16:27:56', 'bf97b99d87c941ec977cd4dc6ec945f0', '9aff3745b94a4d705464bdd0e8dfb4ca', '访客', 'guest', 'admin');
INSERT INTO `t_user` VALUES ('100', '2015-10-19 22:27:00', null, '2016-10-28 01:17:08', '', '2016-10-28 01:17:09', 'e5e5730c57233c3a56c2b6fe9c77f3ec', 'd71e5418430e88094ec30d71c9a6ad04', '超级管理员', 'admin', 'guest');
INSERT INTO `t_user` VALUES ('101', '2015-11-29 20:21:13', null, null, '', null, 'a8525bbddb233340143f298f1a739dde', '5030e98c0e24ac273151410aa1e48627', 'zczxc', 'xzc', 'admin');
INSERT INTO `t_user` VALUES ('102', '2016-10-28 00:59:49', null, null, '', null, '0a3e0e360dc938434edb4cefec75649d', 'c83663a779f7d576dd99cbb031d45977', 'smacheng', 'strongspeed', 'admin');

-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK_4uvv76e86ms8ru0kk9s01d3s2` (`role_id`),
  CONSTRAINT `FK_4uvv76e86ms8ru0kk9s01d3s2` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `FK_kefwen29p9h9ilvry31mgyc94` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('100', '1');
INSERT INTO `t_user_role` VALUES ('102', '1');
INSERT INTO `t_user_role` VALUES ('98', '25');
