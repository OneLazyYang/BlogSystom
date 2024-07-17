/*
 Navicat Premium Data Transfer

 Source Server         : Mysql
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 17/07/2024 16:10:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `time` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (3, '删除日志记录', '2024-07-17 10:38:55', '懒羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (4, '登录网站', '2024-07-17 10:42:40', '懒羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (5, '登录网站', '2024-07-17 11:18:37', '懒羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (7, '修改个人信息', '2024-07-17 11:22:02', '懒羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (8, '删除日志记录', '2024-07-17 11:23:14', '懒羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (9, '登录网站', '2024-07-17 11:25:15', '沸羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (10, '修改个人信息', '2024-07-17 11:28:06', '沸羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (11, '修改个人信息', '2024-07-17 11:30:51', '沸羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (12, '修改个人信息', '2024-07-17 11:33:53', '沸羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (13, '修改个人信息', '2024-07-17 11:34:23', '沸羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (14, '登录网站', '2024-07-17 11:34:45', '懒羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (15, '修改个人信息', '2024-07-17 11:34:53', '懒羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (16, '登录网站', '2024-07-17 11:35:06', '喜羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (17, '修改个人信息', '2024-07-17 11:35:19', '喜羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (19, '删除日志记录', '2024-07-17 11:36:45', '喜羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (20, '修改个人信息', '2024-07-17 11:37:24', '喜羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (21, '登录网站', '2024-07-17 11:37:29', '懒羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (22, '修改个人信息', '2024-07-17 11:37:36', '懒羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (23, '登录网站', '2024-07-17 11:37:46', '沸羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (24, '修改个人信息', '2024-07-17 11:37:55', '沸羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (26, '删除日志记录', '2024-07-17 11:54:27', '懒羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (27, '删除一条博客', '2024-07-17 11:56:24', '懒羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (28, '登录网站', '2024-07-17 13:19:56', '懒羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (29, '登录网站', '2024-07-17 14:17:06', '懒羊羊', '0:0:0:0:0:0:0:1');
INSERT INTO `log` VALUES (30, '登录网站', '2024-07-17 14:37:08', '懒羊羊', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `post_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `user_id` int NULL DEFAULT NULL,
  `created` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `last_modified` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of post
-- ----------------------------
INSERT INTO `post` VALUES (1, '2024届', '啦啦啦啦啦啦啦啦啦啦', 1, '2024-07-17 10:18:59', '2024-07-17 10:30:59');
INSERT INTO `post` VALUES (3, '博客', '发布博客咳咳咳', 2, '2024-07-17 11:35:56', '2024-07-17 11:35:56');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `last_modified` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '懒羊羊', '010908', '20164@qq.com', '2024-07-17 9:18:59', '2024-07-17 11:37:36', '1721187455904');
INSERT INTO `user` VALUES (2, '喜羊羊', '123456', '20164@163.com', '2024-07-17 10:18:59', '2024-07-17 11:37:24', '1721187442867');
INSERT INTO `user` VALUES (3, '沸羊羊', '456789', NULL, '2024-07-17 11:25:05', '2024-07-17 11:37:55', '1721187473980');

SET FOREIGN_KEY_CHECKS = 1;
