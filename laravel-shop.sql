/*
Navicat MySQL Data Transfer

Source Server         : homestead(192.168.10.10)
Source Server Version : 50728
Source Host           : 192.168.10.10:3306
Source Database       : laravel-shop

Target Server Type    : MYSQL
Target Server Version : 50728
File Encoding         : 65001

Date: 2020-01-17 16:54:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '0', '1', '首页', 'fa-bar-chart', '/', null, null, '2020-01-10 07:14:05');
INSERT INTO `admin_menu` VALUES ('2', '0', '3', '系统管理', 'fa-tasks', null, null, null, '2020-01-10 07:49:38');
INSERT INTO `admin_menu` VALUES ('3', '2', '4', '管理员', 'fa-users', 'auth/users', null, null, '2020-01-10 07:49:38');
INSERT INTO `admin_menu` VALUES ('4', '2', '5', '角色', 'fa-user', 'auth/roles', null, null, '2020-01-10 07:49:38');
INSERT INTO `admin_menu` VALUES ('5', '2', '6', '权限', 'fa-ban', 'auth/permissions', null, null, '2020-01-10 07:49:38');
INSERT INTO `admin_menu` VALUES ('6', '2', '7', '菜单', 'fa-bars', 'auth/menu', null, null, '2020-01-10 07:49:38');
INSERT INTO `admin_menu` VALUES ('7', '2', '8', '操作日志', 'fa-history', 'auth/logs', null, null, '2020-01-10 07:49:38');
INSERT INTO `admin_menu` VALUES ('8', '0', '2', '用户管理', 'fa-users', '/users', null, '2020-01-10 07:48:41', '2020-01-10 07:49:38');
INSERT INTO `admin_menu` VALUES ('9', '0', '9', '商品管理', 'fa-cubes', '/products', null, '2020-01-13 08:25:38', '2020-01-13 08:25:55');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES ('1', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-01-10 07:10:35', '2020-01-10 07:10:35');
INSERT INTO `admin_operation_log` VALUES ('2', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:10:56', '2020-01-10 07:10:56');
INSERT INTO `admin_operation_log` VALUES ('3', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:11:04', '2020-01-10 07:11:04');
INSERT INTO `admin_operation_log` VALUES ('4', '1', 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:11:07', '2020-01-10 07:11:07');
INSERT INTO `admin_operation_log` VALUES ('5', '1', 'admin/auth/users', 'GET', '192.168.10.1', '[]', '2020-01-10 07:12:37', '2020-01-10 07:12:37');
INSERT INTO `admin_operation_log` VALUES ('6', '1', 'admin/auth/users', 'GET', '192.168.10.1', '[]', '2020-01-10 07:12:40', '2020-01-10 07:12:40');
INSERT INTO `admin_operation_log` VALUES ('7', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:13:17', '2020-01-10 07:13:17');
INSERT INTO `admin_operation_log` VALUES ('8', '1', 'admin/auth/menu/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:13:31', '2020-01-10 07:13:31');
INSERT INTO `admin_operation_log` VALUES ('9', '1', 'admin/auth/menu/1', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u9996\\u9875\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"REtJrZpJyLmlTYIZrsKPQA7MusvDJeGcO2sXQkOc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2020-01-10 07:14:05', '2020-01-10 07:14:05');
INSERT INTO `admin_operation_log` VALUES ('10', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-01-10 07:14:06', '2020-01-10 07:14:06');
INSERT INTO `admin_operation_log` VALUES ('11', '1', 'admin/auth/menu/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:14:23', '2020-01-10 07:14:23');
INSERT INTO `admin_operation_log` VALUES ('12', '1', 'admin/auth/menu/2', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"icon\":\"fa-tasks\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"REtJrZpJyLmlTYIZrsKPQA7MusvDJeGcO2sXQkOc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2020-01-10 07:14:31', '2020-01-10 07:14:31');
INSERT INTO `admin_operation_log` VALUES ('13', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-01-10 07:14:31', '2020-01-10 07:14:31');
INSERT INTO `admin_operation_log` VALUES ('14', '1', 'admin/auth/menu/3/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:14:39', '2020-01-10 07:14:39');
INSERT INTO `admin_operation_log` VALUES ('15', '1', 'admin/auth/menu/3', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u7ba1\\u7406\\u5458\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"REtJrZpJyLmlTYIZrsKPQA7MusvDJeGcO2sXQkOc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2020-01-10 07:14:44', '2020-01-10 07:14:44');
INSERT INTO `admin_operation_log` VALUES ('16', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-01-10 07:14:46', '2020-01-10 07:14:46');
INSERT INTO `admin_operation_log` VALUES ('17', '1', 'admin/auth/menu/4/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:14:56', '2020-01-10 07:14:56');
INSERT INTO `admin_operation_log` VALUES ('18', '1', 'admin/auth/menu/4', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"permission\":null,\"_token\":\"REtJrZpJyLmlTYIZrsKPQA7MusvDJeGcO2sXQkOc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2020-01-10 07:15:01', '2020-01-10 07:15:01');
INSERT INTO `admin_operation_log` VALUES ('19', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-01-10 07:15:02', '2020-01-10 07:15:02');
INSERT INTO `admin_operation_log` VALUES ('20', '1', 'admin/auth/menu/6/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:15:07', '2020-01-10 07:15:07');
INSERT INTO `admin_operation_log` VALUES ('21', '1', 'admin/auth/menu/6', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u83dc\\u5355\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"permission\":null,\"_token\":\"REtJrZpJyLmlTYIZrsKPQA7MusvDJeGcO2sXQkOc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2020-01-10 07:15:12', '2020-01-10 07:15:12');
INSERT INTO `admin_operation_log` VALUES ('22', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-01-10 07:15:13', '2020-01-10 07:15:13');
INSERT INTO `admin_operation_log` VALUES ('23', '1', 'admin/auth/menu/5/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:15:16', '2020-01-10 07:15:16');
INSERT INTO `admin_operation_log` VALUES ('24', '1', 'admin/auth/menu/5', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u6743\\u9650\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"permission\":null,\"_token\":\"REtJrZpJyLmlTYIZrsKPQA7MusvDJeGcO2sXQkOc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2020-01-10 07:15:22', '2020-01-10 07:15:22');
INSERT INTO `admin_operation_log` VALUES ('25', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-01-10 07:15:23', '2020-01-10 07:15:23');
INSERT INTO `admin_operation_log` VALUES ('26', '1', 'admin/auth/menu/7/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:15:26', '2020-01-10 07:15:26');
INSERT INTO `admin_operation_log` VALUES ('27', '1', 'admin/auth/menu/7', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"permission\":null,\"_token\":\"REtJrZpJyLmlTYIZrsKPQA7MusvDJeGcO2sXQkOc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/menu\"}', '2020-01-10 07:15:32', '2020-01-10 07:15:32');
INSERT INTO `admin_operation_log` VALUES ('28', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-01-10 07:15:33', '2020-01-10 07:15:33');
INSERT INTO `admin_operation_log` VALUES ('29', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-01-10 07:25:46', '2020-01-10 07:25:46');
INSERT INTO `admin_operation_log` VALUES ('30', '1', 'admin/auth/setting', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:34:02', '2020-01-10 07:34:02');
INSERT INTO `admin_operation_log` VALUES ('31', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:47:18', '2020-01-10 07:47:18');
INSERT INTO `admin_operation_log` VALUES ('32', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:47:23', '2020-01-10 07:47:23');
INSERT INTO `admin_operation_log` VALUES ('33', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-users\",\"uri\":\"\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"REtJrZpJyLmlTYIZrsKPQA7MusvDJeGcO2sXQkOc\"}', '2020-01-10 07:48:41', '2020-01-10 07:48:41');
INSERT INTO `admin_operation_log` VALUES ('34', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-01-10 07:48:42', '2020-01-10 07:48:42');
INSERT INTO `admin_operation_log` VALUES ('35', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:48:45', '2020-01-10 07:48:45');
INSERT INTO `admin_operation_log` VALUES ('36', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-01-10 07:48:47', '2020-01-10 07:48:47');
INSERT INTO `admin_operation_log` VALUES ('37', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"REtJrZpJyLmlTYIZrsKPQA7MusvDJeGcO2sXQkOc\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8}]\"}', '2020-01-10 07:48:57', '2020-01-10 07:48:57');
INSERT INTO `admin_operation_log` VALUES ('38', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:48:57', '2020-01-10 07:48:57');
INSERT INTO `admin_operation_log` VALUES ('39', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:49:03', '2020-01-10 07:49:03');
INSERT INTO `admin_operation_log` VALUES ('40', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-01-10 07:49:04', '2020-01-10 07:49:04');
INSERT INTO `admin_operation_log` VALUES ('41', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:49:13', '2020-01-10 07:49:13');
INSERT INTO `admin_operation_log` VALUES ('42', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"REtJrZpJyLmlTYIZrsKPQA7MusvDJeGcO2sXQkOc\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2020-01-10 07:49:38', '2020-01-10 07:49:38');
INSERT INTO `admin_operation_log` VALUES ('43', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:49:39', '2020-01-10 07:49:39');
INSERT INTO `admin_operation_log` VALUES ('44', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-01-10 07:50:29', '2020-01-10 07:50:29');
INSERT INTO `admin_operation_log` VALUES ('45', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:50:33', '2020-01-10 07:50:33');
INSERT INTO `admin_operation_log` VALUES ('46', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-01-10 07:50:34', '2020-01-10 07:50:34');
INSERT INTO `admin_operation_log` VALUES ('47', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:50:38', '2020-01-10 07:50:38');
INSERT INTO `admin_operation_log` VALUES ('48', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:50:40', '2020-01-10 07:50:40');
INSERT INTO `admin_operation_log` VALUES ('49', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:50:41', '2020-01-10 07:50:41');
INSERT INTO `admin_operation_log` VALUES ('50', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:50:42', '2020-01-10 07:50:42');
INSERT INTO `admin_operation_log` VALUES ('51', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:50:44', '2020-01-10 07:50:44');
INSERT INTO `admin_operation_log` VALUES ('52', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:50:45', '2020-01-10 07:50:45');
INSERT INTO `admin_operation_log` VALUES ('53', '1', 'admin/users', 'GET', '192.168.10.1', '[]', '2020-01-10 07:50:48', '2020-01-10 07:50:48');
INSERT INTO `admin_operation_log` VALUES ('54', '1', 'admin/users', 'GET', '192.168.10.1', '[]', '2020-01-10 07:50:50', '2020-01-10 07:50:50');
INSERT INTO `admin_operation_log` VALUES ('55', '1', 'admin/users', 'GET', '192.168.10.1', '[]', '2020-01-10 07:50:51', '2020-01-10 07:50:51');
INSERT INTO `admin_operation_log` VALUES ('56', '1', 'admin/users', 'GET', '192.168.10.1', '[]', '2020-01-10 07:50:53', '2020-01-10 07:50:53');
INSERT INTO `admin_operation_log` VALUES ('57', '1', 'admin/users', 'GET', '192.168.10.1', '[]', '2020-01-10 07:50:54', '2020-01-10 07:50:54');
INSERT INTO `admin_operation_log` VALUES ('58', '1', 'admin/users', 'GET', '192.168.10.1', '[]', '2020-01-10 07:50:55', '2020-01-10 07:50:55');
INSERT INTO `admin_operation_log` VALUES ('59', '1', 'admin/users', 'GET', '192.168.10.1', '[]', '2020-01-10 07:50:57', '2020-01-10 07:50:57');
INSERT INTO `admin_operation_log` VALUES ('60', '1', 'admin/users', 'GET', '192.168.10.1', '[]', '2020-01-10 07:50:58', '2020-01-10 07:50:58');
INSERT INTO `admin_operation_log` VALUES ('61', '1', 'admin/users', 'GET', '192.168.10.1', '[]', '2020-01-10 07:51:00', '2020-01-10 07:51:00');
INSERT INTO `admin_operation_log` VALUES ('62', '1', 'admin/users', 'GET', '192.168.10.1', '[]', '2020-01-10 07:51:01', '2020-01-10 07:51:01');
INSERT INTO `admin_operation_log` VALUES ('63', '1', 'admin/users', 'GET', '192.168.10.1', '[]', '2020-01-10 07:51:02', '2020-01-10 07:51:02');
INSERT INTO `admin_operation_log` VALUES ('64', '1', 'admin/users', 'GET', '192.168.10.1', '[]', '2020-01-10 07:51:03', '2020-01-10 07:51:03');
INSERT INTO `admin_operation_log` VALUES ('65', '1', 'admin/users', 'GET', '192.168.10.1', '[]', '2020-01-10 07:51:05', '2020-01-10 07:51:05');
INSERT INTO `admin_operation_log` VALUES ('66', '1', 'admin/users', 'GET', '192.168.10.1', '[]', '2020-01-10 07:52:39', '2020-01-10 07:52:39');
INSERT INTO `admin_operation_log` VALUES ('67', '1', 'admin/users', 'GET', '192.168.10.1', '[]', '2020-01-10 07:52:52', '2020-01-10 07:52:52');
INSERT INTO `admin_operation_log` VALUES ('68', '1', 'admin/users', 'GET', '192.168.10.1', '[]', '2020-01-10 07:53:28', '2020-01-10 07:53:28');
INSERT INTO `admin_operation_log` VALUES ('69', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:56:23', '2020-01-10 07:56:23');
INSERT INTO `admin_operation_log` VALUES ('70', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:56:28', '2020-01-10 07:56:28');
INSERT INTO `admin_operation_log` VALUES ('71', '1', 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:56:30', '2020-01-10 07:56:30');
INSERT INTO `admin_operation_log` VALUES ('72', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:56:40', '2020-01-10 07:56:40');
INSERT INTO `admin_operation_log` VALUES ('73', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:57:06', '2020-01-10 07:57:06');
INSERT INTO `admin_operation_log` VALUES ('74', '1', 'admin/auth/permissions/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:57:13', '2020-01-10 07:57:13');
INSERT INTO `admin_operation_log` VALUES ('75', '1', 'admin/auth/permissions', 'POST', '192.168.10.1', '{\"slug\":\"users\",\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/user*\",\"_token\":\"REtJrZpJyLmlTYIZrsKPQA7MusvDJeGcO2sXQkOc\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/permissions\"}', '2020-01-10 07:58:07', '2020-01-10 07:58:07');
INSERT INTO `admin_operation_log` VALUES ('76', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2020-01-10 07:58:08', '2020-01-10 07:58:08');
INSERT INTO `admin_operation_log` VALUES ('77', '1', 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:58:27', '2020-01-10 07:58:27');
INSERT INTO `admin_operation_log` VALUES ('78', '1', 'admin/auth/roles/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 07:58:33', '2020-01-10 07:58:33');
INSERT INTO `admin_operation_log` VALUES ('79', '1', 'admin/auth/roles', 'POST', '192.168.10.1', '{\"slug\":\"operation\",\"name\":\"\\u8fd0\\u7ef4\",\"permissions\":[\"2\",\"3\",\"4\",\"6\",null],\"_token\":\"REtJrZpJyLmlTYIZrsKPQA7MusvDJeGcO2sXQkOc\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/roles\"}', '2020-01-10 07:59:45', '2020-01-10 07:59:45');
INSERT INTO `admin_operation_log` VALUES ('80', '1', 'admin/auth/roles', 'GET', '192.168.10.1', '[]', '2020-01-10 07:59:46', '2020-01-10 07:59:46');
INSERT INTO `admin_operation_log` VALUES ('81', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-01-10 09:51:21', '2020-01-10 09:51:21');
INSERT INTO `admin_operation_log` VALUES ('82', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 09:53:42', '2020-01-10 09:53:42');
INSERT INTO `admin_operation_log` VALUES ('83', '1', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 10:04:18', '2020-01-10 10:04:18');
INSERT INTO `admin_operation_log` VALUES ('84', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 10:04:22', '2020-01-10 10:04:22');
INSERT INTO `admin_operation_log` VALUES ('85', '1', 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 10:04:24', '2020-01-10 10:04:24');
INSERT INTO `admin_operation_log` VALUES ('86', '1', 'admin/auth/users/1', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 10:04:29', '2020-01-10 10:04:29');
INSERT INTO `admin_operation_log` VALUES ('87', '1', 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 10:04:37', '2020-01-10 10:04:37');
INSERT INTO `admin_operation_log` VALUES ('88', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 10:04:39', '2020-01-10 10:04:39');
INSERT INTO `admin_operation_log` VALUES ('89', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-10 10:04:41', '2020-01-10 10:04:41');
INSERT INTO `admin_operation_log` VALUES ('90', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-01-13 07:26:27', '2020-01-13 07:26:27');
INSERT INTO `admin_operation_log` VALUES ('91', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-01-13 07:27:57', '2020-01-13 07:27:57');
INSERT INTO `admin_operation_log` VALUES ('92', '1', 'admin/auth/logout', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 07:28:00', '2020-01-13 07:28:00');
INSERT INTO `admin_operation_log` VALUES ('93', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-01-13 07:28:12', '2020-01-13 07:28:12');
INSERT INTO `admin_operation_log` VALUES ('94', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 07:28:52', '2020-01-13 07:28:52');
INSERT INTO `admin_operation_log` VALUES ('95', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 07:28:55', '2020-01-13 07:28:55');
INSERT INTO `admin_operation_log` VALUES ('96', '1', 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 07:29:29', '2020-01-13 07:29:29');
INSERT INTO `admin_operation_log` VALUES ('97', '1', 'admin/auth/roles/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 07:29:31', '2020-01-13 07:29:31');
INSERT INTO `admin_operation_log` VALUES ('98', '1', 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 07:29:43', '2020-01-13 07:29:43');
INSERT INTO `admin_operation_log` VALUES ('99', '1', 'admin/auth/roles/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 07:29:48', '2020-01-13 07:29:48');
INSERT INTO `admin_operation_log` VALUES ('100', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 07:29:57', '2020-01-13 07:29:57');
INSERT INTO `admin_operation_log` VALUES ('101', '1', 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 07:30:04', '2020-01-13 07:30:04');
INSERT INTO `admin_operation_log` VALUES ('102', '1', 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 07:30:07', '2020-01-13 07:30:07');
INSERT INTO `admin_operation_log` VALUES ('103', '1', 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 07:30:11', '2020-01-13 07:30:11');
INSERT INTO `admin_operation_log` VALUES ('104', '1', 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 07:30:13', '2020-01-13 07:30:13');
INSERT INTO `admin_operation_log` VALUES ('105', '1', 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 07:30:49', '2020-01-13 07:30:49');
INSERT INTO `admin_operation_log` VALUES ('106', '1', 'admin/auth/users/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 07:30:58', '2020-01-13 07:30:58');
INSERT INTO `admin_operation_log` VALUES ('107', '1', 'admin/auth/users', 'POST', '192.168.10.1', '{\"username\":\"operator\",\"name\":\"\\u8fd0\\u7ef4\",\"password\":\"123456\",\"password_confirmation\":\"123456\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"aWrLmXutvDYB8cPaeB9jVTqh4tb52BHVcJRlMDbC\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/auth\\/users\"}', '2020-01-13 07:33:53', '2020-01-13 07:33:53');
INSERT INTO `admin_operation_log` VALUES ('108', '1', 'admin/auth/users', 'GET', '192.168.10.1', '[]', '2020-01-13 07:33:54', '2020-01-13 07:33:54');
INSERT INTO `admin_operation_log` VALUES ('109', '1', 'admin/auth/logout', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 07:34:17', '2020-01-13 07:34:17');
INSERT INTO `admin_operation_log` VALUES ('110', '2', 'admin', 'GET', '192.168.10.1', '[]', '2020-01-13 07:34:25', '2020-01-13 07:34:25');
INSERT INTO `admin_operation_log` VALUES ('111', '2', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 07:34:30', '2020-01-13 07:34:30');
INSERT INTO `admin_operation_log` VALUES ('112', '2', 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 07:34:33', '2020-01-13 07:34:33');
INSERT INTO `admin_operation_log` VALUES ('113', '2', 'admin', 'GET', '192.168.10.1', '[]', '2020-01-13 08:23:49', '2020-01-13 08:23:49');
INSERT INTO `admin_operation_log` VALUES ('114', '2', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 08:23:52', '2020-01-13 08:23:52');
INSERT INTO `admin_operation_log` VALUES ('115', '2', 'admin/auth/logout', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 08:23:56', '2020-01-13 08:23:56');
INSERT INTO `admin_operation_log` VALUES ('116', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-01-13 08:24:04', '2020-01-13 08:24:04');
INSERT INTO `admin_operation_log` VALUES ('117', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 08:24:29', '2020-01-13 08:24:29');
INSERT INTO `admin_operation_log` VALUES ('118', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-cubes\",\"uri\":\"\\/products\",\"roles\":[null],\"permission\":null,\"_token\":\"AhePZ3o2IIUdGjD5lH2BSJGWZTqfPck9xTKNM2Ih\"}', '2020-01-13 08:25:38', '2020-01-13 08:25:38');
INSERT INTO `admin_operation_log` VALUES ('119', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-01-13 08:25:38', '2020-01-13 08:25:38');
INSERT INTO `admin_operation_log` VALUES ('120', '1', 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"AhePZ3o2IIUdGjD5lH2BSJGWZTqfPck9xTKNM2Ih\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":9}]\"}', '2020-01-13 08:25:55', '2020-01-13 08:25:55');
INSERT INTO `admin_operation_log` VALUES ('121', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 08:25:56', '2020-01-13 08:25:56');
INSERT INTO `admin_operation_log` VALUES ('122', '1', 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-01-13 08:26:01', '2020-01-13 08:26:01');
INSERT INTO `admin_operation_log` VALUES ('123', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 08:26:03', '2020-01-13 08:26:03');
INSERT INTO `admin_operation_log` VALUES ('124', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 09:59:54', '2020-01-13 09:59:54');
INSERT INTO `admin_operation_log` VALUES ('125', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-13 10:00:11', '2020-01-13 10:00:11');
INSERT INTO `admin_operation_log` VALUES ('126', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-01-14 03:17:37', '2020-01-14 03:17:37');
INSERT INTO `admin_operation_log` VALUES ('127', '1', 'admin/auth/login', 'GET', '192.168.10.1', '[]', '2020-01-14 03:17:39', '2020-01-14 03:17:39');
INSERT INTO `admin_operation_log` VALUES ('128', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 03:17:42', '2020-01-14 03:17:42');
INSERT INTO `admin_operation_log` VALUES ('129', '1', 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 03:17:45', '2020-01-14 03:17:45');
INSERT INTO `admin_operation_log` VALUES ('130', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 03:17:56', '2020-01-14 03:17:56');
INSERT INTO `admin_operation_log` VALUES ('131', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 03:18:00', '2020-01-14 03:18:00');
INSERT INTO `admin_operation_log` VALUES ('132', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 03:18:53', '2020-01-14 03:18:53');
INSERT INTO `admin_operation_log` VALUES ('133', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 03:18:56', '2020-01-14 03:18:56');
INSERT INTO `admin_operation_log` VALUES ('134', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 03:18:58', '2020-01-14 03:18:58');
INSERT INTO `admin_operation_log` VALUES ('135', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 03:19:06', '2020-01-14 03:19:06');
INSERT INTO `admin_operation_log` VALUES ('136', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 03:19:10', '2020-01-14 03:19:10');
INSERT INTO `admin_operation_log` VALUES ('137', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 03:21:01', '2020-01-14 03:21:01');
INSERT INTO `admin_operation_log` VALUES ('138', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 03:21:11', '2020-01-14 03:21:11');
INSERT INTO `admin_operation_log` VALUES ('139', '1', 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 03:21:13', '2020-01-14 03:21:13');
INSERT INTO `admin_operation_log` VALUES ('140', '1', 'admin/products/create', 'GET', '192.168.10.1', '[]', '2020-01-14 03:22:54', '2020-01-14 03:22:54');
INSERT INTO `admin_operation_log` VALUES ('141', '1', 'admin/products/create', 'GET', '192.168.10.1', '[]', '2020-01-14 03:22:56', '2020-01-14 03:22:56');
INSERT INTO `admin_operation_log` VALUES ('142', '1', 'admin/products/create', 'GET', '192.168.10.1', '[]', '2020-01-14 03:23:06', '2020-01-14 03:23:06');
INSERT INTO `admin_operation_log` VALUES ('143', '1', 'admin/products/create', 'GET', '192.168.10.1', '[]', '2020-01-14 03:23:09', '2020-01-14 03:23:09');
INSERT INTO `admin_operation_log` VALUES ('144', '1', 'admin/products/create', 'GET', '192.168.10.1', '[]', '2020-01-14 03:23:18', '2020-01-14 03:23:18');
INSERT INTO `admin_operation_log` VALUES ('145', '1', 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 03:23:23', '2020-01-14 03:23:23');
INSERT INTO `admin_operation_log` VALUES ('146', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 03:23:25', '2020-01-14 03:23:25');
INSERT INTO `admin_operation_log` VALUES ('147', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 03:23:26', '2020-01-14 03:23:26');
INSERT INTO `admin_operation_log` VALUES ('148', '1', 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 03:23:27', '2020-01-14 03:23:27');
INSERT INTO `admin_operation_log` VALUES ('149', '1', 'admin/products/create', 'GET', '192.168.10.1', '[]', '2020-01-14 03:26:42', '2020-01-14 03:26:42');
INSERT INTO `admin_operation_log` VALUES ('150', '1', 'admin/products/create', 'GET', '192.168.10.1', '[]', '2020-01-14 03:26:45', '2020-01-14 03:26:45');
INSERT INTO `admin_operation_log` VALUES ('151', '1', 'admin/products/create', 'GET', '192.168.10.1', '[]', '2020-01-14 03:26:53', '2020-01-14 03:26:53');
INSERT INTO `admin_operation_log` VALUES ('152', '1', 'admin/products/create', 'GET', '192.168.10.1', '[]', '2020-01-14 03:27:18', '2020-01-14 03:27:18');
INSERT INTO `admin_operation_log` VALUES ('153', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 03:56:38', '2020-01-14 03:56:38');
INSERT INTO `admin_operation_log` VALUES ('154', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 03:56:46', '2020-01-14 03:56:46');
INSERT INTO `admin_operation_log` VALUES ('155', '1', 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 03:56:48', '2020-01-14 03:56:48');
INSERT INTO `admin_operation_log` VALUES ('156', '1', 'admin/products/create', 'GET', '192.168.10.1', '[]', '2020-01-14 03:56:50', '2020-01-14 03:56:50');
INSERT INTO `admin_operation_log` VALUES ('157', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 03:56:57', '2020-01-14 03:56:57');
INSERT INTO `admin_operation_log` VALUES ('158', '1', 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 03:56:58', '2020-01-14 03:56:58');
INSERT INTO `admin_operation_log` VALUES ('159', '1', 'admin/products', 'POST', '192.168.10.1', '{\"title\":\"\\u5c0f\\u7c73K20\",\"description\":\"<p>\\u5c0f\\u7c73k20 \\u5168\\u7f51\\u9996\\u53d1\\u5c31\\u6b64\\u4e00\\u5bb6<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"new_1\":{\"title\":\"\\u5929\\u7a7a\\u84dd 64G\",\"description\":\"\\u5c0f\\u7c73k20 \\u5929\\u7a7a\\u84dd 64G\",\"price\":\"1999\",\"stock\":\"10000\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"title\":\"\\u7fe1\\u7fe0\\u7eff 128G\",\"description\":\"\\u5c0f\\u7c73k20 \\u7fe1\\u7fe0\\u7eff 128G\",\"price\":\"2999\",\"stock\":\"1000\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"zVZvu9TRzGZJurK7JEsjj5rRiXqAa7Qz3fVuvA2a\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/products\"}', '2020-01-14 03:58:53', '2020-01-14 03:58:53');
INSERT INTO `admin_operation_log` VALUES ('160', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 03:58:54', '2020-01-14 03:58:54');
INSERT INTO `admin_operation_log` VALUES ('161', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 03:59:08', '2020-01-14 03:59:08');
INSERT INTO `admin_operation_log` VALUES ('162', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 04:02:59', '2020-01-14 04:02:59');
INSERT INTO `admin_operation_log` VALUES ('163', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 04:04:09', '2020-01-14 04:04:09');
INSERT INTO `admin_operation_log` VALUES ('164', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 04:04:13', '2020-01-14 04:04:13');
INSERT INTO `admin_operation_log` VALUES ('165', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 04:05:50', '2020-01-14 04:05:50');
INSERT INTO `admin_operation_log` VALUES ('166', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 04:05:53', '2020-01-14 04:05:53');
INSERT INTO `admin_operation_log` VALUES ('167', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 04:06:03', '2020-01-14 04:06:03');
INSERT INTO `admin_operation_log` VALUES ('168', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 04:06:09', '2020-01-14 04:06:09');
INSERT INTO `admin_operation_log` VALUES ('169', '1', 'admin/products/1', 'PUT', '192.168.10.1', '{\"title\":\"\\u5c0f\\u7c73K20\",\"description\":\"<p>\\u5c0f\\u7c73k20 \\u5168\\u7f51\\u9996\\u53d1\\u5c31\\u6b64\\u4e00\\u5bb6<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"\\u5929\\u7a7a\\u84dd 64G\",\"description\":\"\\u5c0f\\u7c73k20 \\u5929\\u7a7a\\u84dd 64G\",\"price\":\"1998.00\",\"stock\":\"10000\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u7fe1\\u7fe0\\u7eff 128G\",\"description\":\"\\u5c0f\\u7c73k20 \\u7fe1\\u7fe0\\u7eff 128G\",\"price\":\"2999.00\",\"stock\":\"1000\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"zVZvu9TRzGZJurK7JEsjj5rRiXqAa7Qz3fVuvA2a\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/products\"}', '2020-01-14 04:06:43', '2020-01-14 04:06:43');
INSERT INTO `admin_operation_log` VALUES ('170', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 04:06:44', '2020-01-14 04:06:44');
INSERT INTO `admin_operation_log` VALUES ('171', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 04:06:49', '2020-01-14 04:06:49');
INSERT INTO `admin_operation_log` VALUES ('172', '1', 'admin/products/1', 'PUT', '192.168.10.1', '{\"title\":\"\\u5c0f\\u7c73 K20\",\"description\":\"<p>\\u5c0f\\u7c73k20 \\u5168\\u7f51\\u9996\\u53d1\\u5c31\\u6b64\\u4e00\\u5bb6<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"\\u5929\\u7a7a\\u84dd 64G\",\"description\":\"\\u5c0f\\u7c73k20 \\u5929\\u7a7a\\u84dd 64G\",\"price\":\"1998.00\",\"stock\":\"10000\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u7fe1\\u7fe0\\u7eff 128G\",\"description\":\"\\u5c0f\\u7c73k20 \\u7fe1\\u7fe0\\u7eff 128G\",\"price\":\"2999.00\",\"stock\":\"1000\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"zVZvu9TRzGZJurK7JEsjj5rRiXqAa7Qz3fVuvA2a\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/products\"}', '2020-01-14 04:06:53', '2020-01-14 04:06:53');
INSERT INTO `admin_operation_log` VALUES ('173', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 04:06:53', '2020-01-14 04:06:53');
INSERT INTO `admin_operation_log` VALUES ('174', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 04:06:56', '2020-01-14 04:06:56');
INSERT INTO `admin_operation_log` VALUES ('175', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '[]', '2020-01-14 04:07:51', '2020-01-14 04:07:51');
INSERT INTO `admin_operation_log` VALUES ('176', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '[]', '2020-01-14 04:08:17', '2020-01-14 04:08:17');
INSERT INTO `admin_operation_log` VALUES ('177', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 04:08:20', '2020-01-14 04:08:20');
INSERT INTO `admin_operation_log` VALUES ('178', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 04:08:25', '2020-01-14 04:08:25');
INSERT INTO `admin_operation_log` VALUES ('179', '1', 'admin/auth/login', 'GET', '192.168.10.1', '[]', '2020-01-14 06:14:45', '2020-01-14 06:14:45');
INSERT INTO `admin_operation_log` VALUES ('180', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-01-14 06:14:46', '2020-01-14 06:14:46');
INSERT INTO `admin_operation_log` VALUES ('181', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 06:14:51', '2020-01-14 06:14:51');
INSERT INTO `admin_operation_log` VALUES ('182', '1', 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 06:14:56', '2020-01-14 06:14:56');
INSERT INTO `admin_operation_log` VALUES ('183', '1', 'admin/products/create', 'GET', '192.168.10.1', '[]', '2020-01-14 06:17:38', '2020-01-14 06:17:38');
INSERT INTO `admin_operation_log` VALUES ('184', '1', 'admin/products/create', 'GET', '192.168.10.1', '[]', '2020-01-14 06:17:42', '2020-01-14 06:17:42');
INSERT INTO `admin_operation_log` VALUES ('185', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 06:27:27', '2020-01-14 06:27:27');
INSERT INTO `admin_operation_log` VALUES ('186', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 06:27:33', '2020-01-14 06:27:33');
INSERT INTO `admin_operation_log` VALUES ('187', '1', 'admin/products/1', 'PUT', '192.168.10.1', '{\"title\":\"\\u5c0f\\u7c73 K20\",\"description\":\"<p>\\u5c0f\\u7c73k20 \\u5168\\u7f51\\u9996\\u53d1\\u5c31\\u6b64\\u4e00\\u5bb6<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"\\u5929\\u7a7a\\u84dd 64G\",\"description\":\"\\u5c0f\\u7c73k20 \\u5929\\u7a7a\\u84dd 64G\",\"price\":\"1998.00\",\"stock\":\"10000\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u7fe1\\u7fe0\\u7eff 128G\",\"description\":\"\\u5c0f\\u7c73k20 \\u7fe1\\u7fe0\\u7eff 128G\",\"price\":\"2999.00\",\"stock\":\"1000\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"zVZvu9TRzGZJurK7JEsjj5rRiXqAa7Qz3fVuvA2a\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/products\"}', '2020-01-14 06:27:46', '2020-01-14 06:27:46');
INSERT INTO `admin_operation_log` VALUES ('188', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 06:27:47', '2020-01-14 06:27:47');
INSERT INTO `admin_operation_log` VALUES ('189', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 06:28:28', '2020-01-14 06:28:28');
INSERT INTO `admin_operation_log` VALUES ('190', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 06:28:32', '2020-01-14 06:28:32');
INSERT INTO `admin_operation_log` VALUES ('191', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '[]', '2020-01-14 06:28:40', '2020-01-14 06:28:40');
INSERT INTO `admin_operation_log` VALUES ('192', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '[]', '2020-01-14 06:28:50', '2020-01-14 06:28:50');
INSERT INTO `admin_operation_log` VALUES ('193', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 06:28:53', '2020-01-14 06:28:53');
INSERT INTO `admin_operation_log` VALUES ('194', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 06:30:28', '2020-01-14 06:30:28');
INSERT INTO `admin_operation_log` VALUES ('195', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 06:30:33', '2020-01-14 06:30:33');
INSERT INTO `admin_operation_log` VALUES ('196', '1', 'admin/products/1', 'PUT', '192.168.10.1', '{\"title\":\"\\u5c0f\\u7c73 K20\",\"description\":\"<p>\\u5c0f\\u7c73k20 \\u5168\\u7f51\\u9996\\u53d1\\u5c31\\u6b64\\u4e00\\u5bb6<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"\\u5929\\u7a7a\\u84dd 64G\",\"description\":\"\\u5c0f\\u7c73k20 \\u5929\\u7a7a\\u84dd 64G\",\"price\":\"1998.00\",\"stock\":\"10000\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u7fe1\\u7fe0\\u7eff 128G\",\"description\":\"\\u5c0f\\u7c73k20 \\u7fe1\\u7fe0\\u7eff 128G\",\"price\":\"2999.00\",\"stock\":\"1000\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"zVZvu9TRzGZJurK7JEsjj5rRiXqAa7Qz3fVuvA2a\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/products\"}', '2020-01-14 06:30:43', '2020-01-14 06:30:43');
INSERT INTO `admin_operation_log` VALUES ('197', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 06:30:44', '2020-01-14 06:30:44');
INSERT INTO `admin_operation_log` VALUES ('198', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 06:31:04', '2020-01-14 06:31:04');
INSERT INTO `admin_operation_log` VALUES ('199', '1', 'admin/products/1', 'PUT', '192.168.10.1', '{\"title\":\"\\u5c0f\\u7c73 K20\",\"description\":\"<p>\\u5c0f\\u7c73k20 \\u5168\\u7f51\\u9996\\u53d1\\u5c31\\u6b64\\u4e00\\u5bb6<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"\\u5929\\u7a7a\\u84dd 64G\",\"description\":\"\\u5c0f\\u7c73k20 \\u5929\\u7a7a\\u84dd 64G\",\"price\":\"1998.00\",\"stock\":\"10000\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u7fe1\\u7fe0\\u7eff 128G\",\"description\":\"\\u5c0f\\u7c73k20 \\u7fe1\\u7fe0\\u7eff 128G\",\"price\":\"2999.00\",\"stock\":\"1000\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"zVZvu9TRzGZJurK7JEsjj5rRiXqAa7Qz3fVuvA2a\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/products\"}', '2020-01-14 06:33:38', '2020-01-14 06:33:38');
INSERT INTO `admin_operation_log` VALUES ('200', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 06:33:40', '2020-01-14 06:33:40');
INSERT INTO `admin_operation_log` VALUES ('201', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 06:41:59', '2020-01-14 06:41:59');
INSERT INTO `admin_operation_log` VALUES ('202', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '[]', '2020-01-14 06:42:10', '2020-01-14 06:42:10');
INSERT INTO `admin_operation_log` VALUES ('203', '1', 'admin/products/1', 'PUT', '192.168.10.1', '{\"title\":\"\\u5c0f\\u7c73 K20\",\"description\":\"<p>\\u5c0f\\u7c73k20 \\u5168\\u7f51\\u9996\\u53d1\\u5c31\\u6b64\\u4e00\\u5bb6<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"\\u5929\\u7a7a\\u84dd 64G\",\"description\":\"\\u5c0f\\u7c73k20 \\u5929\\u7a7a\\u84dd 64G\",\"price\":\"1998.00\",\"stock\":\"10000\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u7fe1\\u7fe0\\u7eff 128G\",\"description\":\"\\u5c0f\\u7c73k20 \\u7fe1\\u7fe0\\u7eff 128G\",\"price\":\"2999.00\",\"stock\":\"1000\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"zVZvu9TRzGZJurK7JEsjj5rRiXqAa7Qz3fVuvA2a\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/products\"}', '2020-01-14 06:42:26', '2020-01-14 06:42:26');
INSERT INTO `admin_operation_log` VALUES ('204', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 06:42:27', '2020-01-14 06:42:27');
INSERT INTO `admin_operation_log` VALUES ('205', '1', 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 06:44:31', '2020-01-14 06:44:31');
INSERT INTO `admin_operation_log` VALUES ('206', '1', 'admin/products', 'POST', '192.168.10.1', '{\"title\":\"\\u5c0f\\u7c73\\u6d17\\u8863\\u673a1\\u4ee3\",\"description\":\"<p>\\u5168\\u5c4b\\u9996\\u4ed8,\\u9001\\u5b8c\\u5373\\u6b62<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"new_1\":{\"title\":\"\\u767d\\u8272 2w\",\"description\":\"\\u5c0f\\u7c73\\u6d17\\u8863\\u673a1\\u4ee3 \\u767d\\u8272 2w\",\"price\":\"998\",\"stock\":\"1000\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"title\":\"\\u9ed1\\u8272 12w\",\"description\":\"\\u5c0f\\u7c73\\u6d17\\u8863\\u673a1\\u4ee3 \\u9ed1\\u8272 12w\",\"price\":\"2999\",\"stock\":\"1000\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"zVZvu9TRzGZJurK7JEsjj5rRiXqAa7Qz3fVuvA2a\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/products\"}', '2020-01-14 06:46:12', '2020-01-14 06:46:12');
INSERT INTO `admin_operation_log` VALUES ('207', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 06:46:14', '2020-01-14 06:46:14');
INSERT INTO `admin_operation_log` VALUES ('208', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 06:46:29', '2020-01-14 06:46:29');
INSERT INTO `admin_operation_log` VALUES ('209', '1', 'admin/products/1', 'PUT', '192.168.10.1', '{\"title\":\"\\u5c0f\\u7c73 K20\",\"description\":\"<p>\\u5c0f\\u7c73k20 \\u5168\\u7f51\\u9996\\u53d1\\u5c31\\u6b64\\u4e00\\u5bb6<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"\\u5929\\u7a7a\\u84dd 64G\",\"description\":\"\\u5c0f\\u7c73k20 \\u5929\\u7a7a\\u84dd 64G\",\"price\":\"1998.00\",\"stock\":\"10000\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u7fe1\\u7fe0\\u7eff 128G\",\"description\":\"\\u5c0f\\u7c73k20 \\u7fe1\\u7fe0\\u7eff 128G\",\"price\":\"2999.00\",\"stock\":\"1000\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"zVZvu9TRzGZJurK7JEsjj5rRiXqAa7Qz3fVuvA2a\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/products\"}', '2020-01-14 06:46:38', '2020-01-14 06:46:38');
INSERT INTO `admin_operation_log` VALUES ('210', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 06:46:39', '2020-01-14 06:46:39');
INSERT INTO `admin_operation_log` VALUES ('211', '1', 'admin/auth/login', 'GET', '192.168.10.1', '[]', '2020-01-14 07:02:19', '2020-01-14 07:02:19');
INSERT INTO `admin_operation_log` VALUES ('212', '1', 'admin', 'GET', '192.168.10.1', '[]', '2020-01-14 07:02:19', '2020-01-14 07:02:19');
INSERT INTO `admin_operation_log` VALUES ('213', '1', 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 07:02:21', '2020-01-14 07:02:21');
INSERT INTO `admin_operation_log` VALUES ('214', '1', 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 07:02:26', '2020-01-14 07:02:26');
INSERT INTO `admin_operation_log` VALUES ('215', '1', 'admin/products/1', 'PUT', '192.168.10.1', '{\"title\":\"\\u5c0f\\u7c73 K20\",\"description\":\"<p>\\u5c0f\\u7c73k20 \\u5168\\u7f51\\u9996\\u53d1\\u5c31\\u6b64\\u4e00\\u5bb6<\\/p>\",\"on_sale\":\"0\",\"skus\":{\"1\":{\"title\":\"\\u5929\\u7a7a\\u84dd 64G\",\"description\":\"\\u5c0f\\u7c73k20 \\u5929\\u7a7a\\u84dd 64G\",\"price\":\"1998.00\",\"stock\":\"10000\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u7fe1\\u7fe0\\u7eff 128G\",\"description\":\"\\u5c0f\\u7c73k20 \\u7fe1\\u7fe0\\u7eff 128G\",\"price\":\"2999.00\",\"stock\":\"1000\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"zVZvu9TRzGZJurK7JEsjj5rRiXqAa7Qz3fVuvA2a\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/products\"}', '2020-01-14 07:02:31', '2020-01-14 07:02:31');
INSERT INTO `admin_operation_log` VALUES ('216', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 07:02:31', '2020-01-14 07:02:31');
INSERT INTO `admin_operation_log` VALUES ('217', '1', 'admin/products/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-14 07:02:34', '2020-01-14 07:02:34');
INSERT INTO `admin_operation_log` VALUES ('218', '1', 'admin/products/2', 'PUT', '192.168.10.1', '{\"title\":\"\\u5c0f\\u7c73\\u6d17\\u8863\\u673a1\\u4ee3\",\"description\":\"<p>\\u5168\\u5c4b\\u9996\\u4ed8,\\u9001\\u5b8c\\u5373\\u6b62<\\/p>\",\"on_sale\":\"0\",\"skus\":{\"3\":{\"title\":\"\\u767d\\u8272 2w\",\"description\":\"\\u5c0f\\u7c73\\u6d17\\u8863\\u673a1\\u4ee3 \\u767d\\u8272 2w\",\"price\":\"998.00\",\"stock\":\"1000\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"title\":\"\\u9ed1\\u8272 12w\",\"description\":\"\\u5c0f\\u7c73\\u6d17\\u8863\\u673a1\\u4ee3 \\u9ed1\\u8272 12w\",\"price\":\"2999.00\",\"stock\":\"1000\",\"id\":\"4\",\"_remove_\":\"0\"}},\"_token\":\"zVZvu9TRzGZJurK7JEsjj5rRiXqAa7Qz3fVuvA2a\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/products\"}', '2020-01-14 07:02:40', '2020-01-14 07:02:40');
INSERT INTO `admin_operation_log` VALUES ('219', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-14 07:02:40', '2020-01-14 07:02:40');
INSERT INTO `admin_operation_log` VALUES ('220', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-16 02:42:24', '2020-01-16 02:42:24');
INSERT INTO `admin_operation_log` VALUES ('221', '1', 'admin/products/5/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-16 02:42:42', '2020-01-16 02:42:42');
INSERT INTO `admin_operation_log` VALUES ('222', '1', 'admin/products/5', 'PUT', '192.168.10.1', '{\"title\":\"rerum\",\"description\":\"<p>Quidem eveniet error impedit quod voluptatem.<\\/p>\",\"on_sale\":\"0\",\"skus\":{\"11\":{\"title\":\"labore\",\"description\":\"Occaecati vel omnis adipisci sed repellendus laudantium assumenda.\",\"price\":\"3199.00\",\"stock\":\"58736\",\"id\":\"11\",\"_remove_\":\"0\"},\"12\":{\"title\":\"quis\",\"description\":\"Aspernatur sit odit sequi natus id voluptatem accusantium.\",\"price\":\"2744.00\",\"stock\":\"96554\",\"id\":\"12\",\"_remove_\":\"0\"},\"13\":{\"title\":\"ipsam\",\"description\":\"Tenetur ea alias omnis dolores et quaerat omnis.\",\"price\":\"4595.00\",\"stock\":\"35009\",\"id\":\"13\",\"_remove_\":\"0\"}},\"_token\":\"sk89RPboAeDJfvPQFwdx12j74cGqXIUQvEMZMVOj\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/products\"}', '2020-01-16 02:42:48', '2020-01-16 02:42:48');
INSERT INTO `admin_operation_log` VALUES ('223', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-16 02:42:48', '2020-01-16 02:42:48');
INSERT INTO `admin_operation_log` VALUES ('224', '1', 'admin/products/3/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-01-16 03:05:39', '2020-01-16 03:05:39');
INSERT INTO `admin_operation_log` VALUES ('225', '1', 'admin/products/3', 'PUT', '192.168.10.1', '{\"title\":\"sint\",\"description\":\"<p>Vitae facilis nesciunt accusamus saepe exercitationem.<\\/p>\",\"on_sale\":\"0\",\"skus\":{\"5\":{\"title\":\"quia\",\"description\":\"Odio ratione sed dolore qui.\",\"price\":\"8198.00\",\"stock\":\"81258\",\"id\":\"5\",\"_remove_\":\"0\"},\"6\":{\"title\":\"velit\",\"description\":\"Quia earum voluptatum atque mollitia provident pariatur.\",\"price\":\"8415.00\",\"stock\":\"80886\",\"id\":\"6\",\"_remove_\":\"0\"},\"7\":{\"title\":\"et\",\"description\":\"Nam commodi et excepturi fuga nihil.\",\"price\":\"3965.00\",\"stock\":\"98637\",\"id\":\"7\",\"_remove_\":\"0\"}},\"_token\":\"sk89RPboAeDJfvPQFwdx12j74cGqXIUQvEMZMVOj\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.test\\/admin\\/products\"}', '2020-01-16 03:05:45', '2020-01-16 03:05:45');
INSERT INTO `admin_operation_log` VALUES ('226', '1', 'admin/products', 'GET', '192.168.10.1', '[]', '2020-01-16 03:05:45', '2020-01-16 03:05:45');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES ('1', 'All permission', '*', '', '*', null, null);
INSERT INTO `admin_permissions` VALUES ('2', 'Dashboard', 'dashboard', 'GET', '/', null, null);
INSERT INTO `admin_permissions` VALUES ('3', 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', null, null);
INSERT INTO `admin_permissions` VALUES ('4', 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', null, null);
INSERT INTO `admin_permissions` VALUES ('5', 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', null, null);
INSERT INTO `admin_permissions` VALUES ('6', '用户管理', 'users', '', '/user*', '2020-01-10 07:58:07', '2020-01-10 07:58:07');

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES ('1', '2', null, null);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES ('1', '1', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '2', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '3', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '4', null, null);
INSERT INTO `admin_role_permissions` VALUES ('2', '6', null, null);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES ('1', '1', null, null);
INSERT INTO `admin_role_users` VALUES ('2', '2', null, null);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('1', 'Administrator', 'administrator', '2020-01-10 06:54:09', '2020-01-10 06:54:09');
INSERT INTO `admin_roles` VALUES ('2', '运维', 'operation', '2020-01-10 07:59:46', '2020-01-10 07:59:46');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('1', 'admin', '$2y$10$frDquMgKzfIildevxq8CrO4Per0QSMM/OJrqCMOeAiigLd8VUJP/y', 'Administrator', null, 'r5Ynpfql2c2KF8tbd9YV3Z05svOtxSow0IGdETJp3Lndpg24eLJ1Vk2Y42LM', '2020-01-10 06:54:09', '2020-01-10 06:54:09');
INSERT INTO `admin_users` VALUES ('2', 'operator', '$2y$10$OKRsCrk4TIdttSouDkVxauGbfWKNU0zKdxtW/ABsTSZZTHyQ/mAQW', '运维', null, 'X8u1CiW4fmnkxfNtSlZReMmp0kXxyZi0jybYukPWdeIe3W8fGUjBE5oZW49M', '2020-01-13 07:33:53', '2020-01-13 07:33:53');

-- ----------------------------
-- Table structure for cart_items
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_sku_id` bigint(20) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_user_id_foreign` (`user_id`),
  KEY `cart_items_product_sku_id_foreign` (`product_sku_id`),
  CONSTRAINT `cart_items_product_sku_id_foreign` FOREIGN KEY (`product_sku_id`) REFERENCES `product_skus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cart_items
-- ----------------------------
INSERT INTO `cart_items` VALUES ('5', '1', '15', '4');
INSERT INTO `cart_items` VALUES ('7', '1', '20', '1');
INSERT INTO `cart_items` VALUES ('8', '1', '42', '1');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2019_08_19_000000_create_failed_jobs_table', '1');
INSERT INTO `migrations` VALUES ('4', '2020_01_09_091140_create_user_addresses_table', '2');
INSERT INTO `migrations` VALUES ('5', '2016_01_04_173148_create_admin_tables', '3');
INSERT INTO `migrations` VALUES ('6', '2020_01_13_073959_create_products_table', '4');
INSERT INTO `migrations` VALUES ('7', '2020_01_13_074005_create_product_skus_table', '4');
INSERT INTO `migrations` VALUES ('8', '2020_01_14_124338_create_user_favorite_products_table', '5');
INSERT INTO `migrations` VALUES ('9', '2020_01_14_140913_create_cart_items_table', '5');
INSERT INTO `migrations` VALUES ('10', '2020_01_16_065156_create_orders_table', '6');
INSERT INTO `migrations` VALUES ('11', '2020_01_16_065204_create_order_items_table', '6');

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `product_sku_id` bigint(20) unsigned NOT NULL,
  `amount` int(10) unsigned NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `rating` int(10) unsigned DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `reviewed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`),
  KEY `order_items_product_sku_id_foreign` (`product_sku_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_product_sku_id_foreign` FOREIGN KEY (`product_sku_id`) REFERENCES `product_skus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES ('1', '1', '7', '18', '1', '2158.00', null, null, null);
INSERT INTO `order_items` VALUES ('2', '1', '15', '41', '1', '6745.00', null, null, null);
INSERT INTO `order_items` VALUES ('3', '1', '6', '15', '2', '6081.00', null, null, null);
INSERT INTO `order_items` VALUES ('4', '2', '7', '18', '1', '2158.00', null, null, null);
INSERT INTO `order_items` VALUES ('5', '2', '15', '41', '1', '6745.00', null, null, null);
INSERT INTO `order_items` VALUES ('6', '2', '6', '15', '3', '6081.00', null, null, null);
INSERT INTO `order_items` VALUES ('7', '3', '7', '18', '1', '2158.00', null, null, null);
INSERT INTO `order_items` VALUES ('8', '3', '15', '41', '1', '6745.00', null, null, null);
INSERT INTO `order_items` VALUES ('9', '3', '6', '15', '3', '6081.00', null, null, null);
INSERT INTO `order_items` VALUES ('10', '4', '7', '18', '1', '2158.00', null, null, null);
INSERT INTO `order_items` VALUES ('11', '4', '15', '41', '1', '6745.00', null, null, null);
INSERT INTO `order_items` VALUES ('12', '4', '6', '15', '3', '6081.00', null, null, null);
INSERT INTO `order_items` VALUES ('13', '5', '7', '18', '1', '2158.00', null, null, null);
INSERT INTO `order_items` VALUES ('14', '5', '15', '41', '1', '6745.00', null, null, null);
INSERT INTO `order_items` VALUES ('15', '5', '6', '15', '3', '6081.00', null, null, null);
INSERT INTO `order_items` VALUES ('16', '5', '6', '14', '1', '6762.00', null, null, null);
INSERT INTO `order_items` VALUES ('17', '6', '6', '15', '4', '6081.00', null, null, null);
INSERT INTO `order_items` VALUES ('18', '7', '6', '15', '4', '6081.00', null, null, null);
INSERT INTO `order_items` VALUES ('19', '7', '8', '20', '1', '9712.00', null, null, null);
INSERT INTO `order_items` VALUES ('20', '8', '6', '15', '4', '6081.00', null, null, null);
INSERT INTO `order_items` VALUES ('21', '8', '8', '20', '1', '9712.00', null, null, null);
INSERT INTO `order_items` VALUES ('22', '8', '15', '42', '1', '9409.00', null, null, null);
INSERT INTO `order_items` VALUES ('23', '9', '6', '15', '4', '6081.00', null, null, null);
INSERT INTO `order_items` VALUES ('24', '9', '8', '20', '1', '9712.00', null, null, null);
INSERT INTO `order_items` VALUES ('25', '9', '15', '42', '1', '9409.00', null, null, null);
INSERT INTO `order_items` VALUES ('26', '10', '6', '15', '4', '6081.00', null, null, null);
INSERT INTO `order_items` VALUES ('27', '10', '8', '20', '1', '9712.00', null, null, null);
INSERT INTO `order_items` VALUES ('28', '10', '15', '42', '1', '9409.00', null, null, null);
INSERT INTO `order_items` VALUES ('29', '11', '6', '15', '4', '6081.00', null, null, null);
INSERT INTO `order_items` VALUES ('30', '11', '8', '20', '1', '9712.00', null, null, null);
INSERT INTO `order_items` VALUES ('31', '11', '15', '42', '1', '9409.00', null, null, null);
INSERT INTO `order_items` VALUES ('32', '12', '6', '15', '4', '6081.00', null, null, null);
INSERT INTO `order_items` VALUES ('33', '12', '8', '20', '1', '9712.00', null, null, null);
INSERT INTO `order_items` VALUES ('34', '12', '15', '42', '1', '9409.00', null, null, null);
INSERT INTO `order_items` VALUES ('35', '13', '6', '15', '4', '6081.00', null, null, null);
INSERT INTO `order_items` VALUES ('36', '13', '8', '20', '1', '9712.00', null, null, null);
INSERT INTO `order_items` VALUES ('37', '13', '15', '42', '1', '9409.00', null, null, null);
INSERT INTO `order_items` VALUES ('38', '14', '6', '15', '4', '6081.00', null, null, null);
INSERT INTO `order_items` VALUES ('39', '14', '8', '20', '1', '9712.00', null, null, null);
INSERT INTO `order_items` VALUES ('40', '14', '15', '42', '1', '9409.00', null, null, null);
INSERT INTO `order_items` VALUES ('41', '15', '6', '15', '4', '6081.00', null, null, null);
INSERT INTO `order_items` VALUES ('42', '15', '8', '20', '1', '9712.00', null, null, null);
INSERT INTO `order_items` VALUES ('43', '15', '15', '42', '1', '9409.00', null, null, null);
INSERT INTO `order_items` VALUES ('44', '16', '6', '15', '4', '6081.00', null, null, null);
INSERT INTO `order_items` VALUES ('45', '16', '8', '20', '1', '9712.00', null, null, null);
INSERT INTO `order_items` VALUES ('46', '16', '15', '42', '1', '9409.00', null, null, null);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `remark` text COLLATE utf8mb4_unicode_ci,
  `paid_at` datetime DEFAULT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `refund_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `reviewed` tinyint(1) NOT NULL DEFAULT '0',
  `ship_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `ship_data` text COLLATE utf8mb4_unicode_ci,
  `extra` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_no_unique` (`no`),
  UNIQUE KEY `orders_refund_no_unique` (`refund_no`),
  KEY `orders_user_id_foreign` (`user_id`),
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '20200117060122965211', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5e38\\u5dde\\u5e02\\u6b66\\u8fdb\\u533a\\u7b2c65\\u8857\\u9053\\u7b2c919\\u53f7\",\"zip\":711401,\"contact_name\":\"\\u51cc\\u8fdf\",\"contact_phone\":\"13530832131\"}', '21065.00', '请尽快送到!!', null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2020-01-17 06:01:22', '2020-01-17 06:01:22');
INSERT INTO `orders` VALUES ('2', '20200117065441092475', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5e38\\u5dde\\u5e02\\u6b66\\u8fdb\\u533a\\u7b2c65\\u8857\\u9053\\u7b2c919\\u53f7\",\"zip\":711401,\"contact_name\":\"\\u51cc\\u8fdf\",\"contact_phone\":\"13530832131\"}', '27146.00', 'fdd', null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2020-01-17 06:54:41', '2020-01-17 06:54:41');
INSERT INTO `orders` VALUES ('3', '20200117065452562986', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5e38\\u5dde\\u5e02\\u6b66\\u8fdb\\u533a\\u7b2c65\\u8857\\u9053\\u7b2c919\\u53f7\",\"zip\":711401,\"contact_name\":\"\\u51cc\\u8fdf\",\"contact_phone\":\"13530832131\"}', '27146.00', 'fdd', null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2020-01-17 06:54:52', '2020-01-17 06:54:52');
INSERT INTO `orders` VALUES ('4', '20200117065705070059', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5e38\\u5dde\\u5e02\\u6b66\\u8fdb\\u533a\\u7b2c65\\u8857\\u9053\\u7b2c919\\u53f7\",\"zip\":711401,\"contact_name\":\"\\u51cc\\u8fdf\",\"contact_phone\":\"13530832131\"}', '27146.00', 'fdd', null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2020-01-17 06:57:05', '2020-01-17 06:57:05');
INSERT INTO `orders` VALUES ('5', '20200117065800053878', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5e38\\u5dde\\u5e02\\u6b66\\u8fdb\\u533a\\u7b2c65\\u8857\\u9053\\u7b2c919\\u53f7\",\"zip\":711401,\"contact_name\":\"\\u51cc\\u8fdf\",\"contact_phone\":\"13530832131\"}', '33908.00', null, null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2020-01-17 06:58:00', '2020-01-17 06:58:00');
INSERT INTO `orders` VALUES ('6', '20200117081145677387', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5e38\\u5dde\\u5e02\\u6b66\\u8fdb\\u533a\\u7b2c65\\u8857\\u9053\\u7b2c919\\u53f7\",\"zip\":711401,\"contact_name\":\"\\u51cc\\u8fdf\",\"contact_phone\":\"13530832131\"}', '24324.00', 'test', null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2020-01-17 08:11:45', '2020-01-17 08:11:45');
INSERT INTO `orders` VALUES ('7', '20200117082746709695', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5e38\\u5dde\\u5e02\\u6b66\\u8fdb\\u533a\\u7b2c65\\u8857\\u9053\\u7b2c919\\u53f7\",\"zip\":711401,\"contact_name\":\"\\u51cc\\u8fdf\",\"contact_phone\":\"13530832131\"}', '34036.00', null, null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2020-01-17 08:27:46', '2020-01-17 08:27:46');
INSERT INTO `orders` VALUES ('8', '20200117082911360165', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5e38\\u5dde\\u5e02\\u6b66\\u8fdb\\u533a\\u7b2c65\\u8857\\u9053\\u7b2c919\\u53f7\",\"zip\":711401,\"contact_name\":\"\\u51cc\\u8fdf\",\"contact_phone\":\"13530832131\"}', '43445.00', null, null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2020-01-17 08:29:11', '2020-01-17 08:29:11');
INSERT INTO `orders` VALUES ('9', '20200117082922708311', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5e38\\u5dde\\u5e02\\u6b66\\u8fdb\\u533a\\u7b2c65\\u8857\\u9053\\u7b2c919\\u53f7\",\"zip\":711401,\"contact_name\":\"\\u51cc\\u8fdf\",\"contact_phone\":\"13530832131\"}', '43445.00', null, null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2020-01-17 08:29:22', '2020-01-17 08:29:22');
INSERT INTO `orders` VALUES ('10', '20200117082935876867', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5e38\\u5dde\\u5e02\\u6b66\\u8fdb\\u533a\\u7b2c65\\u8857\\u9053\\u7b2c919\\u53f7\",\"zip\":711401,\"contact_name\":\"\\u51cc\\u8fdf\",\"contact_phone\":\"13530832131\"}', '43445.00', null, null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2020-01-17 08:29:35', '2020-01-17 08:29:35');
INSERT INTO `orders` VALUES ('11', '20200117082942450613', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5e38\\u5dde\\u5e02\\u6b66\\u8fdb\\u533a\\u7b2c65\\u8857\\u9053\\u7b2c919\\u53f7\",\"zip\":711401,\"contact_name\":\"\\u51cc\\u8fdf\",\"contact_phone\":\"13530832131\"}', '43445.00', null, null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2020-01-17 08:29:42', '2020-01-17 08:29:42');
INSERT INTO `orders` VALUES ('12', '20200117082959855225', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5e38\\u5dde\\u5e02\\u6b66\\u8fdb\\u533a\\u7b2c65\\u8857\\u9053\\u7b2c919\\u53f7\",\"zip\":711401,\"contact_name\":\"\\u51cc\\u8fdf\",\"contact_phone\":\"13530832131\"}', '43445.00', null, null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2020-01-17 08:29:59', '2020-01-17 08:29:59');
INSERT INTO `orders` VALUES ('13', '20200117083018127268', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5e38\\u5dde\\u5e02\\u6b66\\u8fdb\\u533a\\u7b2c65\\u8857\\u9053\\u7b2c919\\u53f7\",\"zip\":711401,\"contact_name\":\"\\u51cc\\u8fdf\",\"contact_phone\":\"13530832131\"}', '43445.00', null, null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2020-01-17 08:30:18', '2020-01-17 08:30:18');
INSERT INTO `orders` VALUES ('14', '20200117083022398042', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5e38\\u5dde\\u5e02\\u6b66\\u8fdb\\u533a\\u7b2c65\\u8857\\u9053\\u7b2c919\\u53f7\",\"zip\":711401,\"contact_name\":\"\\u51cc\\u8fdf\",\"contact_phone\":\"13530832131\"}', '43445.00', null, null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2020-01-17 08:30:22', '2020-01-17 08:30:22');
INSERT INTO `orders` VALUES ('15', '20200117083039786374', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5e38\\u5dde\\u5e02\\u6b66\\u8fdb\\u533a\\u7b2c65\\u8857\\u9053\\u7b2c919\\u53f7\",\"zip\":711401,\"contact_name\":\"\\u51cc\\u8fdf\",\"contact_phone\":\"13530832131\"}', '43445.00', null, null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2020-01-17 08:30:39', '2020-01-17 08:30:39');
INSERT INTO `orders` VALUES ('16', '20200117083046559808', '1', '{\"address\":\"\\u6c5f\\u82cf\\u7701\\u5e38\\u5dde\\u5e02\\u6b66\\u8fdb\\u533a\\u7b2c65\\u8857\\u9053\\u7b2c919\\u53f7\",\"zip\":711401,\"contact_name\":\"\\u51cc\\u8fdf\",\"contact_phone\":\"13530832131\"}', '43445.00', null, null, null, null, 'pending', null, '0', '0', 'pending', null, null, '2020-01-17 08:30:46', '2020-01-17 08:30:46');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for product_skus
-- ----------------------------
DROP TABLE IF EXISTS `product_skus`;
CREATE TABLE `product_skus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(10) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_skus_product_id_foreign` (`product_id`),
  CONSTRAINT `product_skus_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_skus
-- ----------------------------
INSERT INTO `product_skus` VALUES ('1', '天空蓝 64G', '小米k20 天空蓝 64G', '1998.00', '10000', '1', '2020-01-14 03:58:54', '2020-01-14 04:06:43');
INSERT INTO `product_skus` VALUES ('2', '翡翠绿 128G', '小米k20 翡翠绿 128G', '2999.00', '1000', '1', '2020-01-14 03:58:54', '2020-01-14 03:58:54');
INSERT INTO `product_skus` VALUES ('3', '白色 2w', '小米洗衣机1代 白色 2w', '998.00', '1000', '2', '2020-01-14 06:46:13', '2020-01-14 06:46:13');
INSERT INTO `product_skus` VALUES ('4', '黑色 12w', '小米洗衣机1代 黑色 12w', '2999.00', '1000', '2', '2020-01-14 06:46:13', '2020-01-14 06:46:13');
INSERT INTO `product_skus` VALUES ('5', 'quia', 'Odio ratione sed dolore qui.', '8198.00', '81258', '3', '2020-01-14 07:00:03', '2020-01-14 07:00:03');
INSERT INTO `product_skus` VALUES ('6', 'velit', 'Quia earum voluptatum atque mollitia provident pariatur.', '8415.00', '80886', '3', '2020-01-14 07:00:03', '2020-01-14 07:00:03');
INSERT INTO `product_skus` VALUES ('7', 'et', 'Nam commodi et excepturi fuga nihil.', '3965.00', '98637', '3', '2020-01-14 07:00:03', '2020-01-14 07:00:03');
INSERT INTO `product_skus` VALUES ('8', 'corporis', 'Qui ut alias consequatur fugit voluptas aut deleniti.', '5244.00', '84916', '4', '2020-01-14 07:00:03', '2020-01-14 07:00:03');
INSERT INTO `product_skus` VALUES ('9', 'in', 'Repudiandae ea occaecati id ut.', '6749.00', '13378', '4', '2020-01-14 07:00:03', '2020-01-14 07:00:03');
INSERT INTO `product_skus` VALUES ('10', 'distinctio', 'Hic voluptas qui est et inventore.', '7974.00', '92983', '4', '2020-01-14 07:00:03', '2020-01-14 07:00:03');
INSERT INTO `product_skus` VALUES ('11', 'labore', 'Occaecati vel omnis adipisci sed repellendus laudantium assumenda.', '3199.00', '58736', '5', '2020-01-14 07:00:03', '2020-01-14 07:00:03');
INSERT INTO `product_skus` VALUES ('12', 'quis', 'Aspernatur sit odit sequi natus id voluptatem accusantium.', '2744.00', '96554', '5', '2020-01-14 07:00:03', '2020-01-14 07:00:03');
INSERT INTO `product_skus` VALUES ('13', 'ipsam', 'Tenetur ea alias omnis dolores et quaerat omnis.', '4595.00', '35009', '5', '2020-01-14 07:00:03', '2020-01-14 07:00:03');
INSERT INTO `product_skus` VALUES ('14', 'unde', 'A dolorum harum repellendus pariatur iusto est.', '6762.00', '99971', '6', '2020-01-14 07:00:03', '2020-01-17 06:58:31');
INSERT INTO `product_skus` VALUES ('15', 'enim', 'Voluptatem assumenda deserunt est aut vel beatae.', '6081.00', '82969', '6', '2020-01-14 07:00:03', '2020-01-17 08:30:46');
INSERT INTO `product_skus` VALUES ('16', 'quia', 'Quia aperiam voluptas quis nisi exercitationem excepturi.', '103.00', '15284', '6', '2020-01-14 07:00:03', '2020-01-14 07:00:03');
INSERT INTO `product_skus` VALUES ('17', 'ipsam', 'Aut illum nihil iste molestiae nihil qui eveniet.', '6400.00', '32376', '7', '2020-01-14 07:00:03', '2020-01-14 07:00:03');
INSERT INTO `product_skus` VALUES ('18', 'facere', 'Similique praesentium ipsum et non excepturi est ipsa.', '2158.00', '22428', '7', '2020-01-14 07:00:03', '2020-01-17 06:58:31');
INSERT INTO `product_skus` VALUES ('19', 'maiores', 'Magnam dolorem adipisci omnis.', '6647.00', '87672', '7', '2020-01-14 07:00:03', '2020-01-14 07:00:03');
INSERT INTO `product_skus` VALUES ('20', 'esse', 'Beatae dignissimos impedit rerum consequatur.', '9712.00', '28702', '8', '2020-01-14 07:00:03', '2020-01-17 08:30:46');
INSERT INTO `product_skus` VALUES ('21', 'optio', 'Quidem dignissimos autem sunt et.', '9652.00', '26641', '8', '2020-01-14 07:00:03', '2020-01-14 07:00:03');
INSERT INTO `product_skus` VALUES ('22', 'qui', 'Velit quas eos vel enim.', '7003.00', '94724', '8', '2020-01-14 07:00:03', '2020-01-14 07:00:03');
INSERT INTO `product_skus` VALUES ('23', 'omnis', 'Et minima vitae id.', '7451.00', '7201', '9', '2020-01-14 07:00:03', '2020-01-14 07:00:03');
INSERT INTO `product_skus` VALUES ('24', 'dolor', 'Ab voluptatem et consequuntur qui perspiciatis enim vel.', '9503.00', '41789', '9', '2020-01-14 07:00:03', '2020-01-14 07:00:03');
INSERT INTO `product_skus` VALUES ('25', 'dolorem', 'Sed voluptas porro a sint velit autem nihil.', '6121.00', '23981', '9', '2020-01-14 07:00:03', '2020-01-14 07:00:03');
INSERT INTO `product_skus` VALUES ('26', 'distinctio', 'Commodi et sit explicabo recusandae alias eius.', '1748.00', '90720', '10', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('27', 'natus', 'Qui vitae omnis sed voluptatum quam dolorem.', '1729.00', '422', '10', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('28', 'pariatur', 'Maiores delectus pariatur itaque est pariatur.', '2831.00', '40429', '10', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('29', 'aut', 'Incidunt ullam beatae eaque ipsam est.', '766.00', '55234', '11', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('30', 'aut', 'Corporis reprehenderit ab explicabo soluta ratione nihil beatae.', '6427.00', '13083', '11', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('31', 'dolor', 'Beatae eos dolorem quo molestias.', '4822.00', '547', '11', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('32', 'nemo', 'Excepturi deleniti nam praesentium alias vel in veniam facilis.', '667.00', '42102', '12', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('33', 'quo', 'Reprehenderit consectetur debitis reprehenderit.', '9871.00', '16972', '12', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('34', 'quia', 'Est autem repellat aut.', '485.00', '40445', '12', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('35', 'animi', 'Doloribus aperiam autem ipsam quod ut harum a.', '2632.00', '21056', '13', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('36', 'hic', 'Dignissimos ut harum est corrupti.', '4092.00', '54348', '13', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('37', 'ipsa', 'Nemo deserunt accusamus qui magni et doloremque sed quod.', '8887.00', '77534', '13', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('38', 'et', 'Quo et rerum quaerat quidem.', '9679.00', '91717', '14', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('39', 'voluptatum', 'Velit maiores totam repellat consequatur ut.', '2378.00', '92652', '14', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('40', 'sit', 'Quasi impedit saepe est delectus necessitatibus esse laudantium.', '822.00', '41314', '14', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('41', 'eos', 'Labore alias eligendi ipsa distinctio.', '6745.00', '20459', '15', '2020-01-14 07:00:04', '2020-01-17 06:58:31');
INSERT INTO `product_skus` VALUES ('42', 'temporibus', 'Non dolor ducimus maiores qui quasi labore et.', '9409.00', '20006', '15', '2020-01-14 07:00:04', '2020-01-17 08:30:46');
INSERT INTO `product_skus` VALUES ('43', 'temporibus', 'Accusamus consequatur magnam provident quia.', '2100.00', '51302', '15', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('44', 'commodi', 'Laudantium et nihil molestiae qui qui minus.', '5378.00', '14215', '16', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('45', 'aliquid', 'Qui explicabo voluptatibus unde fugiat.', '1812.00', '78841', '16', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('46', 'suscipit', 'Laborum accusantium numquam deleniti veritatis temporibus adipisci.', '9738.00', '95699', '16', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('47', 'voluptatum', 'Numquam dolores qui ut perferendis quisquam id.', '996.00', '76611', '17', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('48', 'quasi', 'Tempora doloremque architecto libero quia totam in temporibus vitae.', '2564.00', '52457', '17', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('49', 'amet', 'Suscipit voluptatem iste id id ullam vitae expedita consectetur.', '6443.00', '25029', '17', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('50', 'voluptas', 'Dolores nesciunt voluptates esse eveniet.', '7332.00', '57919', '18', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('51', 'tempora', 'Provident accusantium necessitatibus doloremque amet suscipit saepe quia.', '5524.00', '88338', '18', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('52', 'quaerat', 'Ab adipisci et facilis non ut excepturi.', '2634.00', '42586', '18', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('53', 'est', 'Cum consequuntur dicta magnam ad quisquam.', '341.00', '75721', '19', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('54', 'porro', 'Quas porro aspernatur quia error cumque ea.', '8996.00', '75185', '19', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('55', 'deserunt', 'Unde similique quae excepturi dolorem animi ducimus.', '1274.00', '57602', '19', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('56', 'rerum', 'Officia eaque blanditiis voluptatem vero non voluptatem.', '4511.00', '55171', '20', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('57', 'omnis', 'Laborum neque dolorem in.', '4111.00', '9776', '20', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('58', 'reiciendis', 'Voluptas dolores voluptatem et.', '935.00', '58744', '20', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('59', 'ut', 'Et totam sed cupiditate omnis a.', '8132.00', '28472', '21', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('60', 'libero', 'Reiciendis fugit itaque dolore quas.', '5370.00', '60967', '21', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('61', 'ab', 'Culpa dolor dolores sit sapiente nam nisi.', '7567.00', '40532', '21', '2020-01-14 07:00:04', '2020-01-14 07:00:04');
INSERT INTO `product_skus` VALUES ('62', 'provident', 'Recusandae dolor vitae saepe voluptatem facere a.', '8898.00', '35806', '22', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('63', 'non', 'Ut ratione et optio qui.', '8240.00', '49415', '22', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('64', 'eaque', 'Reprehenderit aut aliquam dolores dolores ea sint.', '7781.00', '51448', '22', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('65', 'sit', 'Et corrupti facilis consequatur ut eos nihil.', '3025.00', '93352', '23', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('66', 'porro', 'Rerum tenetur magnam explicabo fugit.', '3359.00', '12559', '23', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('67', 'corporis', 'Soluta aliquid ullam perspiciatis et vero commodi nostrum iusto.', '8817.00', '33377', '23', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('68', 'praesentium', 'Non quas fugit natus.', '5613.00', '63642', '24', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('69', 'nihil', 'Explicabo animi minima perspiciatis occaecati.', '6885.00', '42481', '24', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('70', 'veniam', 'Molestias architecto cupiditate magnam totam est.', '7076.00', '87220', '24', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('71', 'quos', 'Asperiores et maiores qui.', '3753.00', '90258', '25', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('72', 'sed', 'Id qui sit corrupti rem.', '2569.00', '17313', '25', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('73', 'voluptates', 'Enim consequatur veniam enim nobis soluta possimus et.', '106.00', '12509', '25', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('74', 'aut', 'Blanditiis excepturi corporis reprehenderit.', '5507.00', '52621', '26', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('75', 'sed', 'Eaque magnam reiciendis qui ut modi.', '8615.00', '89947', '26', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('76', 'provident', 'Doloribus repudiandae similique debitis quo dicta.', '1615.00', '56427', '26', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('77', 'sapiente', 'Sint id sed tempore quia recusandae est.', '7401.00', '57', '27', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('78', 'quia', 'Voluptatem sit in vel ea magnam qui.', '6720.00', '22208', '27', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('79', 'qui', 'Et amet rem enim sed.', '160.00', '89710', '27', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('80', 'suscipit', 'Ut suscipit nemo voluptatum itaque dolor voluptates sit.', '5571.00', '88627', '28', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('81', 'architecto', 'Ullam quaerat animi ab cupiditate.', '3355.00', '78353', '28', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('82', 'distinctio', 'Nisi eveniet dignissimos debitis quo qui possimus et quasi.', '1480.00', '55094', '28', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('83', 'aspernatur', 'Voluptatum nobis voluptatem beatae nam omnis quia.', '5165.00', '96182', '29', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('84', 'quasi', 'A id quae vitae mollitia facilis labore.', '5522.00', '54808', '29', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('85', 'rem', 'Qui officia facilis dolorum omnis incidunt.', '306.00', '22925', '29', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('86', 'consequatur', 'Et cum voluptatum harum expedita eaque quibusdam.', '7462.00', '76378', '30', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('87', 'in', 'Dolorem totam quod non maxime harum.', '4696.00', '92071', '30', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('88', 'officia', 'Magni et saepe ut sint ea sunt.', '8363.00', '24659', '30', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('89', 'voluptas', 'Facere omnis at dolores.', '1314.00', '51885', '31', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('90', 'commodi', 'In ea est iste ad et autem accusantium.', '4033.00', '78799', '31', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('91', 'placeat', 'Et ipsum quas eos ea placeat quia placeat.', '2575.00', '72334', '31', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('92', 'velit', 'Natus sed eum quidem ut ea repellendus sit.', '1299.00', '46808', '32', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('93', 'dignissimos', 'Consequatur rerum assumenda consectetur in consequatur beatae.', '6427.00', '48032', '32', '2020-01-14 07:00:05', '2020-01-14 07:00:05');
INSERT INTO `product_skus` VALUES ('94', 'expedita', 'Ullam molestiae atque tenetur.', '1432.00', '27087', '32', '2020-01-14 07:00:06', '2020-01-14 07:00:06');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `on_sale` tinyint(1) NOT NULL DEFAULT '1',
  `rating` double(8,2) NOT NULL DEFAULT '5.00',
  `sold_count` int(10) unsigned NOT NULL DEFAULT '0',
  `review_count` int(10) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', '小米 K20', '<p>小米k20 全网首发就此一家</p>', 'images/pms_1575881724.54265668.jpg', '0', '5.00', '0', '0', '1998.00', '2020-01-14 03:58:54', '2020-01-14 07:02:31');
INSERT INTO `products` VALUES ('2', '小米洗衣机1代', '<p>全屋首付,送完即止</p>', 'images/pms_1552868299.27348967.jpg', '0', '5.00', '0', '0', '998.00', '2020-01-14 06:46:13', '2020-01-14 07:02:40');
INSERT INTO `products` VALUES ('3', 'sint', '<p>Vitae facilis nesciunt accusamus saepe exercitationem.</p>', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', '0', '2.00', '0', '0', '3965.00', '2020-01-14 06:59:57', '2020-01-16 03:05:45');
INSERT INTO `products` VALUES ('4', 'aliquam', 'Ullam quam ut debitis quia animi vitae.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', '1', '3.00', '0', '0', '5244.00', '2020-01-14 07:00:02', '2020-01-14 07:00:03');
INSERT INTO `products` VALUES ('5', 'rerum', '<p>Quidem eveniet error impedit quod voluptatem.</p>', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', '0', '3.00', '0', '0', '2744.00', '2020-01-14 07:00:02', '2020-01-16 02:42:48');
INSERT INTO `products` VALUES ('6', 'laudantium', 'Corporis voluptas consequatur corrupti sed quos porro.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', '1', '4.00', '0', '0', '103.00', '2020-01-14 07:00:02', '2020-01-14 07:00:03');
INSERT INTO `products` VALUES ('7', 'in', 'Et quam eos atque non velit tempore.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', '1', '3.00', '0', '0', '2158.00', '2020-01-14 07:00:03', '2020-01-14 07:00:03');
INSERT INTO `products` VALUES ('8', 'similique', 'Hic quam deserunt dolor consectetur aliquid ratione.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', '1', '5.00', '0', '0', '7003.00', '2020-01-14 07:00:03', '2020-01-14 07:00:03');
INSERT INTO `products` VALUES ('9', 'laudantium', 'Iure quidem dolores et ut.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', '1', '4.00', '0', '0', '6121.00', '2020-01-14 07:00:03', '2020-01-14 07:00:04');
INSERT INTO `products` VALUES ('10', 'cupiditate', 'Aut aliquam aut aut sit ut praesentium aut.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', '1', '0.00', '0', '0', '1729.00', '2020-01-14 07:00:03', '2020-01-14 07:00:04');
INSERT INTO `products` VALUES ('11', 'reprehenderit', 'Quibusdam recusandae alias officiis voluptas repellendus.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', '1', '3.00', '0', '0', '766.00', '2020-01-14 07:00:03', '2020-01-14 07:00:04');
INSERT INTO `products` VALUES ('12', 'excepturi', 'Fugit voluptatem velit quasi ut.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', '1', '0.00', '0', '0', '485.00', '2020-01-14 07:00:03', '2020-01-14 07:00:04');
INSERT INTO `products` VALUES ('13', 'voluptas', 'Assumenda ut itaque nam voluptatem voluptatibus dolores perspiciatis.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', '1', '2.00', '0', '0', '2632.00', '2020-01-14 07:00:03', '2020-01-14 07:00:04');
INSERT INTO `products` VALUES ('14', 'voluptatem', 'Rerum et est quia necessitatibus veniam sed necessitatibus modi.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', '1', '1.00', '0', '0', '822.00', '2020-01-14 07:00:03', '2020-01-14 07:00:04');
INSERT INTO `products` VALUES ('15', 'quis', 'Voluptate vel sint quo fugiat natus ipsa doloribus aut.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', '1', '4.00', '0', '0', '2100.00', '2020-01-14 07:00:03', '2020-01-14 07:00:04');
INSERT INTO `products` VALUES ('16', 'molestias', 'Qui placeat tenetur vero sunt.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', '1', '0.00', '0', '0', '1812.00', '2020-01-14 07:00:03', '2020-01-14 07:00:04');
INSERT INTO `products` VALUES ('17', 'ex', 'Et dolorem ipsum molestias assumenda mollitia.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', '1', '4.00', '0', '0', '996.00', '2020-01-14 07:00:03', '2020-01-14 07:00:04');
INSERT INTO `products` VALUES ('18', 'rerum', 'Repellat laborum voluptatibus est blanditiis.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', '1', '1.00', '0', '0', '2634.00', '2020-01-14 07:00:03', '2020-01-14 07:00:04');
INSERT INTO `products` VALUES ('19', 'magnam', 'Unde adipisci officia dolorem eligendi quo ad enim.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', '1', '1.00', '0', '0', '341.00', '2020-01-14 07:00:03', '2020-01-14 07:00:04');
INSERT INTO `products` VALUES ('20', 'dolorum', 'Nostrum nisi iusto exercitationem maiores tenetur autem dolorum.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', '1', '4.00', '0', '0', '935.00', '2020-01-14 07:00:03', '2020-01-14 07:00:04');
INSERT INTO `products` VALUES ('21', 'minus', 'Cumque magni et sed optio rerum consequatur dolorum quaerat.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', '1', '4.00', '0', '0', '5370.00', '2020-01-14 07:00:03', '2020-01-14 07:00:05');
INSERT INTO `products` VALUES ('22', 'magni', 'Deleniti magnam ut nulla quibusdam.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', '1', '0.00', '0', '0', '7781.00', '2020-01-14 07:00:03', '2020-01-14 07:00:05');
INSERT INTO `products` VALUES ('23', 'harum', 'Maiores natus deserunt ipsa saepe sint.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', '1', '5.00', '0', '0', '3025.00', '2020-01-14 07:00:03', '2020-01-14 07:00:05');
INSERT INTO `products` VALUES ('24', 'modi', 'Et tenetur repudiandae perferendis temporibus dolor magnam.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', '1', '2.00', '0', '0', '5613.00', '2020-01-14 07:00:03', '2020-01-14 07:00:05');
INSERT INTO `products` VALUES ('25', 'quis', 'Praesentium tempora enim eius minus.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', '1', '2.00', '0', '0', '106.00', '2020-01-14 07:00:03', '2020-01-14 07:00:05');
INSERT INTO `products` VALUES ('26', 'nesciunt', 'Animi ullam rerum quidem repudiandae.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', '1', '3.00', '0', '0', '1615.00', '2020-01-14 07:00:03', '2020-01-14 07:00:05');
INSERT INTO `products` VALUES ('27', 'corrupti', 'Rerum est ad enim odit velit.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', '1', '3.00', '0', '0', '160.00', '2020-01-14 07:00:03', '2020-01-14 07:00:05');
INSERT INTO `products` VALUES ('28', 'et', 'Nostrum vero qui sunt consequatur sapiente voluptate.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', '1', '2.00', '0', '0', '1480.00', '2020-01-14 07:00:03', '2020-01-14 07:00:05');
INSERT INTO `products` VALUES ('29', 'possimus', 'Ea veniam omnis ad corporis eos facere.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', '1', '4.00', '0', '0', '306.00', '2020-01-14 07:00:03', '2020-01-14 07:00:05');
INSERT INTO `products` VALUES ('30', 'qui', 'At voluptas voluptas et ut quo.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', '1', '3.00', '0', '0', '4696.00', '2020-01-14 07:00:03', '2020-01-14 07:00:05');
INSERT INTO `products` VALUES ('31', 'modi', 'Et aliquid et cum voluptas non fugit.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', '1', '5.00', '0', '0', '1314.00', '2020-01-14 07:00:03', '2020-01-14 07:00:05');
INSERT INTO `products` VALUES ('32', 'aliquam', 'Tempore sunt soluta voluptatibus illo.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', '1', '1.00', '0', '0', '1299.00', '2020-01-14 07:00:03', '2020-01-14 07:00:06');

-- ----------------------------
-- Table structure for user_addresses
-- ----------------------------
DROP TABLE IF EXISTS `user_addresses`;
CREATE TABLE `user_addresses` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` int(10) unsigned NOT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_used_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_addresses
-- ----------------------------
INSERT INTO `user_addresses` VALUES ('1', '1', '江苏省', '常州市', '武进区', '第65街道第919号', '711401', '凌迟', '13530832131', '2020-01-17 08:30:46', '2020-01-09 10:08:41', '2020-01-17 08:30:46');
INSERT INTO `user_addresses` VALUES ('2', '1', '广东省', '深圳市', '福田区', '第93街道第933号', '643900', '虞志强', '13530832131', null, '2020-01-09 10:08:41', '2020-01-16 08:33:21');
INSERT INTO `user_addresses` VALUES ('3', '1', '江苏省', '苏州市', '相城区', '第15街道第309号', '772800', '毕伦', '13530832131', null, '2020-01-09 10:08:41', '2020-01-16 08:33:25');

-- ----------------------------
-- Table structure for user_favorite_products
-- ----------------------------
DROP TABLE IF EXISTS `user_favorite_products`;
CREATE TABLE `user_favorite_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `product_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_favorite_products_user_id_foreign` (`user_id`),
  KEY `user_favorite_products_product_id_foreign` (`product_id`),
  CONSTRAINT `user_favorite_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_favorite_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_favorite_products
-- ----------------------------
INSERT INTO `user_favorite_products` VALUES ('1', '1', '5', '2020-01-16 01:57:26', '2020-01-16 01:57:26');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'weiy', '2049874524@qq.com', '2020-01-09 09:04:29', '$2y$10$nTcAAfZ/0udgoTT15TyskeOVOXcowOHj16xM7vK5eMSOu5JxML1Ti', null, '2020-01-09 07:56:33', '2020-01-09 09:04:29');
INSERT INTO `users` VALUES ('2', 'system_root1', '2049874521@qq.com', null, '$2y$10$wEqLSAs4jX3qBo90mcUbwuXQUfInLPrJwkeh2AkW1Xgdke/seQdIK', null, '2020-01-09 09:06:19', '2020-01-09 09:06:19');
