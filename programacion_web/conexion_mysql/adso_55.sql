/*
Navicat MySQL Data Transfer

Source Server         : ADSO_VIRTUAL
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : adso_55

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2022-09-14 19:08:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `pr_tabla`
-- ----------------------------
DROP TABLE IF EXISTS `pr_tabla`;
CREATE TABLE `pr_tabla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) DEFAULT NULL,
  `pr_apellido` varchar(100) DEFAULT NULL,
  `sg_apellido` varchar(100) DEFAULT NULL,
  `estado` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of pr_tabla
-- ----------------------------
INSERT INTO `pr_tabla` VALUES ('1', 'Andres', 'Diaz', 'Lara', '1');
INSERT INTO `pr_tabla` VALUES ('2', 'Maria', 'Lopez', 'Muñoz', '1');
INSERT INTO `pr_tabla` VALUES ('3', 'Juan', 'Florez', 'Camargo', '1');

-- ----------------------------
-- Table structure for `usuarios`
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `login` varchar(100) NOT NULL,
  `contrasena` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('admin', 'admin');
INSERT INTO `usuarios` VALUES ('adso', '12345');
