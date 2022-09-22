/*
Navicat MySQL Data Transfer

Source Server         : ADSO_VIRTUAL
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : dbcardio

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2022-09-21 18:12:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `barrios`
-- ----------------------------
DROP TABLE IF EXISTS `barrios`;
CREATE TABLE `barrios` (
  `id_barrio` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_barrio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of barrios
-- ----------------------------
INSERT INTO `barrios` VALUES ('1', 'CENTRO');
INSERT INTO `barrios` VALUES ('2', 'SAN JUAN');
INSERT INTO `barrios` VALUES ('3', 'VILLA OLIMPICA');

-- ----------------------------
-- Table structure for `ciudades`
-- ----------------------------
DROP TABLE IF EXISTS `ciudades`;
CREATE TABLE `ciudades` (
  `id_ciudad` varchar(6) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_ciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ciudades
-- ----------------------------
INSERT INTO `ciudades` VALUES ('01', 'SAN GI');
INSERT INTO `ciudades` VALUES ('02', 'socorro');
INSERT INTO `ciudades` VALUES ('03', 'OIBA');
INSERT INTO `ciudades` VALUES ('04', 'CURITI');
INSERT INTO `ciudades` VALUES ('05', 'VILLANUEVA');

-- ----------------------------
-- Table structure for `clientes`
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `departamento` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES ('1', 'Juan', 'Montoya', '3358974', 'juankj@gmail.com', 'Calle 23 # 78-74', 'Cali', 'Valle');

-- ----------------------------
-- Table structure for `cum_programas`
-- ----------------------------
DROP TABLE IF EXISTS `cum_programas`;
CREATE TABLE `cum_programas` (
  `id_programa` int(10) NOT NULL AUTO_INCREMENT,
  `id_cedula` varchar(18) DEFAULT NULL,
  `fec_ingreso` date DEFAULT NULL,
  `fec_egreso` date DEFAULT NULL,
  `causa_egreso` varchar(200) DEFAULT NULL,
  `fec_hospitalizacion` date DEFAULT NULL,
  PRIMARY KEY (`id_programa`),
  KEY `id_cedula` (`id_cedula`),
  CONSTRAINT `fk_cum_progra_pac` FOREIGN KEY (`id_cedula`) REFERENCES `pacientes` (`id_cedula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cum_programas
-- ----------------------------
INSERT INTO `cum_programas` VALUES ('5', '1100952166', null, null, null, null);

-- ----------------------------
-- Table structure for `deabetes`
-- ----------------------------
DROP TABLE IF EXISTS `deabetes`;
CREATE TABLE `deabetes` (
  `id_deabetes` int(11) NOT NULL AUTO_INCREMENT,
  `id_cedula` varchar(18) DEFAULT NULL,
  `fec_realizacion_exa` date DEFAULT NULL,
  `cons_medico_general` int(1) DEFAULT NULL,
  `cons_enfermeria` int(1) DEFAULT NULL,
  `cons_nutricion` int(1) DEFAULT NULL,
  `colesterol_total` decimal(10,2) DEFAULT NULL,
  `colesterol_hdl` decimal(10,2) DEFAULT NULL,
  `trigliceridos` decimal(10,2) DEFAULT NULL,
  `creatinina` decimal(10,2) DEFAULT NULL,
  `hemoglobina` decimal(10,2) DEFAULT NULL,
  `uroanalisis` decimal(10,2) DEFAULT NULL,
  `ekg` varchar(10) DEFAULT NULL,
  `id_medicamento1` varchar(20) DEFAULT NULL,
  `id_medicamento2` varchar(20) DEFAULT NULL,
  `edu_grupal` varchar(10) DEFAULT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `acciones_realizar` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_deabetes`),
  KEY `id_cedula` (`id_cedula`),
  CONSTRAINT `fk_deabetes_pac` FOREIGN KEY (`id_cedula`) REFERENCES `pacientes` (`id_cedula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deabetes
-- ----------------------------
INSERT INTO `deabetes` VALUES ('1', '1100952166', '2016-10-24', '1', '1', '1', '1.00', '1.00', '2.00', '1.00', '1.00', '2.00', '2', '000001', '000001', '1', '1', '1');

-- ----------------------------
-- Table structure for `hipercolesterolemia`
-- ----------------------------
DROP TABLE IF EXISTS `hipercolesterolemia`;
CREATE TABLE `hipercolesterolemia` (
  `id_hipercolesterolemia` int(11) NOT NULL AUTO_INCREMENT,
  `id_cedula` varchar(18) DEFAULT NULL,
  `fec_realizacion_exa` date DEFAULT NULL,
  `cons_medico_general` int(1) DEFAULT NULL,
  `cons_enfermeria` int(1) DEFAULT NULL,
  `cons_nutricion` int(1) DEFAULT NULL,
  `glicemia_basal` decimal(10,2) DEFAULT NULL,
  `hemoglobin` decimal(10,2) DEFAULT NULL,
  `hematocritos` decimal(10,2) DEFAULT NULL,
  `colesterol_total` decimal(10,2) DEFAULT NULL,
  `colesterol_hdl` decimal(10,2) DEFAULT NULL,
  `trigliceridos` decimal(10,2) DEFAULT NULL,
  `creatinina` decimal(10,2) DEFAULT NULL,
  `uroanalisis` varchar(10) DEFAULT NULL,
  `ekg` varchar(10) DEFAULT NULL,
  `id_medicamento1` varchar(20) DEFAULT NULL,
  `id_medicamento2` varchar(20) DEFAULT NULL,
  `edu_grupal` varchar(10) DEFAULT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `acciones_realizar` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_hipercolesterolemia`),
  KEY `id_cedula` (`id_cedula`),
  CONSTRAINT `fk_hipercolesterolemia_pac` FOREIGN KEY (`id_cedula`) REFERENCES `pacientes` (`id_cedula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hipercolesterolemia
-- ----------------------------
INSERT INTO `hipercolesterolemia` VALUES ('3', '1100952166', '2016-10-24', '1', '1', '1', '1.00', '1.00', '1.00', '1.00', '1.00', '1.00', '1.00', '1', '40', '000001', '000001', '1', '1', '1');

-- ----------------------------
-- Table structure for `hipertension_arterial`
-- ----------------------------
DROP TABLE IF EXISTS `hipertension_arterial`;
CREATE TABLE `hipertension_arterial` (
  `id_hiper_arterial` int(11) NOT NULL AUTO_INCREMENT,
  `id_cedula` varchar(18) DEFAULT NULL,
  `fec_realizacion_exa` date DEFAULT NULL,
  `cf_tensionales` varchar(10) DEFAULT NULL,
  `tm_signos_vitales` varchar(10) DEFAULT NULL,
  `cons_medico_general` int(1) DEFAULT NULL,
  `cons_enfermeria` int(1) DEFAULT NULL,
  `cons_nutricion` int(1) DEFAULT NULL,
  `glicemia_basal` decimal(10,2) DEFAULT NULL,
  `hemoglobin` decimal(10,2) DEFAULT NULL,
  `hematocritos` decimal(10,2) DEFAULT NULL,
  `colesterol_total` decimal(10,2) DEFAULT NULL,
  `colesterol_hdl` decimal(10,2) DEFAULT NULL,
  `trigliceridos` decimal(10,2) DEFAULT NULL,
  `potasio` decimal(10,2) DEFAULT NULL,
  `creatinina` decimal(10,2) DEFAULT NULL,
  `uroanalisis` varchar(10) DEFAULT NULL,
  `ekg` varchar(10) DEFAULT NULL,
  `id_medicamento` varchar(20) DEFAULT NULL,
  `edu_grupal` varchar(10) DEFAULT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `acciones_realizar` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_hiper_arterial`),
  KEY `id_cedula` (`id_cedula`),
  CONSTRAINT `fk_hipertencion_arterial_pac` FOREIGN KEY (`id_cedula`) REFERENCES `pacientes` (`id_cedula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hipertension_arterial
-- ----------------------------
INSERT INTO `hipertension_arterial` VALUES ('1', '1100952166', '2016-10-24', '1', '1', '1', '1', '1', '1.00', '1.00', '1.00', '1.00', '1.00', '1.00', '1.00', '1.00', '1', '11', '000001', '1', '1', '1');
INSERT INTO `hipertension_arterial` VALUES ('2', '1100970785', '2017-12-13', '1', '1', '1', '1', '1', '1.00', '1.00', null, '1.00', '1.00', '1.00', '1.00', '1.00', '1', '1', '000001', '1', '1', '2');

-- ----------------------------
-- Table structure for `medicamentos`
-- ----------------------------
DROP TABLE IF EXISTS `medicamentos`;
CREATE TABLE `medicamentos` (
  `id_medicamento` varchar(20) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_medicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medicamentos
-- ----------------------------
INSERT INTO `medicamentos` VALUES ('000001', 'ASPIRINAS');
INSERT INTO `medicamentos` VALUES ('000222', 'MAREOL');
INSERT INTO `medicamentos` VALUES ('0008', 'DOLEX');

-- ----------------------------
-- Table structure for `obesidad`
-- ----------------------------
DROP TABLE IF EXISTS `obesidad`;
CREATE TABLE `obesidad` (
  `id_obesidad` int(11) NOT NULL AUTO_INCREMENT,
  `id_cedula` varchar(18) DEFAULT NULL,
  `fec_realizacion_exa` date DEFAULT NULL,
  `tm_signos_vitales` varchar(10) DEFAULT NULL,
  `peso` decimal(10,2) DEFAULT NULL,
  `talla` decimal(10,2) DEFAULT NULL,
  `imc` decimal(10,2) DEFAULT NULL,
  `gd_obesidad` int(2) DEFAULT NULL,
  `cons_medico_general` int(1) DEFAULT NULL,
  `cons_nutricion` int(1) DEFAULT NULL,
  `glicemia_basal` decimal(10,2) DEFAULT NULL,
  `colesterol_total` decimal(10,2) DEFAULT NULL,
  `colesterol_hdl` decimal(10,2) DEFAULT NULL,
  `trigliceridos` decimal(10,2) DEFAULT NULL,
  `id_medicamento1` varchar(20) DEFAULT NULL,
  `id_medicamento2` varchar(20) DEFAULT NULL,
  `edu_grupal` varchar(10) DEFAULT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `acciones_realizar` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_obesidad`),
  KEY `id_cedula` (`id_cedula`),
  CONSTRAINT `fk_obesidad_pac` FOREIGN KEY (`id_cedula`) REFERENCES `pacientes` (`id_cedula`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of obesidad
-- ----------------------------
INSERT INTO `obesidad` VALUES ('1', '1100952166', '0000-00-00', null, '1.00', '1.00', '1.00', '1', '1', '1', '1.00', '1.00', '1.00', '1.00', '', '', '1', '1', '1');

-- ----------------------------
-- Table structure for `pacientes`
-- ----------------------------
DROP TABLE IF EXISTS `pacientes`;
CREATE TABLE `pacientes` (
  `id_cedula` varchar(15) NOT NULL,
  `nombres` varchar(40) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `fec_nac` date DEFAULT NULL,
  `edad` int(3) DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `id_barrio` int(10) DEFAULT NULL,
  `id_ciudad` varchar(6) DEFAULT NULL,
  `tp_paciente` char(1) DEFAULT NULL,
  `seguridad_social` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pacientes
-- ----------------------------
INSERT INTO `pacientes` VALUES ('11', '11', '11', '2017-12-15', '1', '2', '3204207701', 'cra 14 # 21-22', '0', 'SAN GI', '1', '1');
INSERT INTO `pacientes` VALUES ('1100', 'JOSE', 'LARA', '2017-12-14', '1', '2', '3204207701', 'cra 14 # 21-22', '0', 'SAN GI', '1', '1');
INSERT INTO `pacientes` VALUES ('1100952166', 'ISRAEL', 'ARBONA GUERRERO', '1988-01-19', '28', 'M', '3204207701', 'CRA 14 # 21-25', '1', '01', 'C', 'C');
INSERT INTO `pacientes` VALUES ('1100970785', 'NESTOR IVAN', 'APARICIO OSORIO', '1997-03-26', '19', 'M', '3015717789', 'CRA 8 # 25-33', '1', '01', 'S', 'C');

-- ----------------------------
-- Table structure for `soporte_usuarios`
-- ----------------------------
DROP TABLE IF EXISTS `soporte_usuarios`;
CREATE TABLE `soporte_usuarios` (
  `idusuario` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mensajeria` varchar(100) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `preferenciacomunicacion` char(1) NOT NULL,
  `rangonomolestar` varchar(50) DEFAULT NULL,
  `tipousuario` char(1) NOT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of soporte_usuarios
-- ----------------------------
INSERT INTO `soporte_usuarios` VALUES ('1', 'ISRAEL', 'ARBONA', 'i.arbona@misena.edu.co', null, null, '', null, '');
INSERT INTO `soporte_usuarios` VALUES ('1100', 'PEDRO', 'DIAZ SIERRA', 'thecreyzy_.0328@hotmail.com', null, null, '', null, '');
INSERT INTO `soporte_usuarios` VALUES ('110010', 'OSCAR', 'SIERRA', 'OSCAR@GMAIL.COM', null, null, '', null, '');
INSERT INTO `soporte_usuarios` VALUES ('1100952166', 'ISRAEL', 'ARBONA GUERRERO', 'I.ARBONA@MISENA.EDU.CO', null, null, '', null, '');
INSERT INTO `soporte_usuarios` VALUES ('1111', 'POCHO ISRAEL', 'ARBONA GUERRERO', 'I.ARBONA@MISENA.EDU.CO', null, null, '', null, '');
INSERT INTO `soporte_usuarios` VALUES ('111111', 'JOSE', 'ARMANDO', 'I.ARBONA@MISENA.EDU.CO', null, null, '', null, '');
INSERT INTO `soporte_usuarios` VALUES ('333', 'JOSE', 'ARIAS', 'thecreyzy_.0328@hotmail.com', null, null, '', null, '');
INSERT INTO `soporte_usuarios` VALUES ('9999', 'POCHO', 'ARBONA', 'I.ARBONA@MISENA.EDU.CO', null, null, '', null, '');
INSERT INTO `soporte_usuarios` VALUES ('J', 'J', 'J', 'jjgamboa86@misena.edu.co', null, null, '', null, '');

-- ----------------------------
-- Table structure for `usuarios`
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `usuario` varchar(18) NOT NULL,
  `clave` varchar(18) DEFAULT NULL,
  `rol` int(1) DEFAULT NULL,
  `estado` int(1) DEFAULT NULL,
  PRIMARY KEY (`usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('admin', 'admin', '1', '1');
INSERT INTO `usuarios` VALUES ('adso', 'adso', '2', '1');
INSERT INTO `usuarios` VALUES ('FABIO', '1234455', '2', '1');
INSERT INTO `usuarios` VALUES ('Juan', '1234', '2', '1');
INSERT INTO `usuarios` VALUES ('Maria', '1234', '1', '1');

-- ----------------------------
-- Table structure for `wine`
-- ----------------------------
DROP TABLE IF EXISTS `wine`;
CREATE TABLE `wine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `grapes` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `region` varchar(45) DEFAULT NULL,
  `description` blob DEFAULT NULL,
  `picture` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of wine
-- ----------------------------
INSERT INTO `wine` VALUES ('1', 'CHATEAU DE SAINT COSME', '2009', 'Grenache / Syrah', 'France', 'Southern Rhone / Gigondas', 0x5468652061726F6D6173206F6620667275697420616E642073706963652067697665206F6E6520612068696E74206F6620746865206C69676874206472696E6B6162696C697479206F662074686973206C6F76656C792077696E652C207768696368206D616B657320616E20657863656C6C656E7420636F6D706C656D656E7420746F2066697368206469736865732E, 'saint_cosme.jpg');
INSERT INTO `wine` VALUES ('2', 'LAN RIOJA CRIANZA', '2006', 'Tempranillo', 'Spain', 'Rioja', 0x4120726573757267656E6365206F6620696E74657265737420696E20626F7574697175652076696E65796172647320686173206F70656E65642074686520646F6F7220666F72207468697320657863656C6C656E7420666F72617920696E746F2074686520646573736572742077696E65206D61726B65742E204C6967687420616E6420626F756E63792C207769746820612068696E74206F6620626C61636B2074727566666C652C20746869732077696E652077696C6C206E6F74206661696C20746F207469636B6C652074686520746173746520627564732E, 'lan_rioja.jpg');
INSERT INTO `wine` VALUES ('3', 'MARGERUM SYBARITE', '2010', 'Sauvignon Blanc', 'USA', 'California Central Cosat', 0x546865206361636865206F6620612066696E652043616265726E657420696E206F6E65732077696E652063656C6C61722063616E206E6F77206265207265706C6163656420776974682061206368696C646973686C7920706C617966756C2077696E6520627562626C696E67206F76657220776974682074656D7074696E6720746173746573206F660A626C61636B2063686572727920616E64206C69636F726963652E20546869732069732061207461737465207375726520746F207472616E73706F727420796F75206261636B20696E2074696D652E, 'margerum.jpg');
INSERT INTO `wine` VALUES ('4', 'OWEN ROE \"EX UMBRIS\"', '2009', 'Syrah', 'USA', 'Washington', 0x41206F6E652D74776F2070756E6368206F6620626C61636B2070657070657220616E64206A616C6170656E6F2077696C6C2073656E6420796F75722073656E736573207265656C696E672C20617320746865206F72616E676520657373656E636520736E61707320796F75206261636B20746F207265616C6974792E20446F6E2774206D6973730A746869732061776172642D77696E6E696E672074617374652073656E736174696F6E2E, 'ex_umbris.jpg');
INSERT INTO `wine` VALUES ('5', 'REX HILL', '2009', 'Pinot Noir', 'USA', 'Oregon', 0x4F6E652063616E6E6F7420646F756274207468617420746869732077696C6C206265207468652077696E65207365727665642061742074686520486F6C6C79776F6F642061776172642073686F77732C20626563617573652069742068617320756E64656E6961626C65207374617220706F7765722E2042652074686520666972737420746F2063617463680A74686520646562757420746861742065766572796F6E652077696C6C2062652074616C6B696E672061626F757420746F6D6F72726F772E, 'rex_hill.jpg');
INSERT INTO `wine` VALUES ('6', 'VITICCIO CLASSICO RISERVA', '2007', 'Sangiovese Merlot', 'Italy', 'Tuscany', 0x54686F75676820736F667420616E6420726F756E64656420696E20746578747572652C2074686520626F6479206F6620746869732077696E652069732066756C6C20616E64207269636820616E64206F682D736F2D61707065616C696E672E20546869732064656C6976657279206973206576656E206D6F726520696D7072657373697665207768656E206F6E652074616B6573206E6F7465206F66207468652074656E6465722074616E6E696E732074686174206C656176652074686520746173746520627564732077686F6C6C79207361746973666965642E, 'viticcio.jpg');
INSERT INTO `wine` VALUES ('7', 'CHATEAU LE DOYENNE', '2005', 'Merlot', 'France', 'Bordeaux', 0x54686F7567682064656E736520616E642063686577792C20746869732077696E6520646F6573206E6F74206F766572706F7765722077697468206974732066696E656C792062616C616E63656420646570746820616E64207374727563747572652E2049742069732061207472756C79206C75787572696F757320657870657269656E636520666F72207468650A73656E7365732E, 'le_doyenne.jpg');
INSERT INTO `wine` VALUES ('8', 'DOMAINE DU BOUSCAT', '2009', 'Merlot', 'France', 'Bordeaux', 0x546865206C6967687420676F6C64656E20636F6C6F72206F6620746869732077696E652062656C696573207468652062726967687420666C61766F7220697420686F6C64732E204120747275652073756D6D65722077696E652C206974206265677320666F722061207069636E6963206C756E636820696E20612073756E2D736F616B65642076696E65796172642E, 'bouscat.jpg');
INSERT INTO `wine` VALUES ('9', 'BLOCK NINE', '2009', 'Pinot Noir', 'USA', 'California', 0x576974682068696E7473206F662067696E67657220616E642073706963652C20746869732077696E65206D616B657320616E20657863656C6C656E7420636F6D706C656D656E7420746F206C69676874206170706574697A657220616E642064657373657274206661726520666F72206120686F6C6964617920676174686572696E672E, 'block_nine.jpg');
INSERT INTO `wine` VALUES ('10', 'DOMAINE SERENE', '2007', 'Pinot Noir', 'USA', 'Oregon', 0x54686F75676820737562746C6520696E2069747320636F6D706C657869746965732C20746869732077696E65206973207375726520746F20706C65617365206120776964652072616E6765206F6620656E7468757369617374732E204E6F746573206F6620706F6D656772616E6174652077696C6C2064656C6967687420617320746865206E757474792066696E69736820636F6D706C65746573207468652070696374757265206F6620612066696E652073697070696E6720657870657269656E63652E, 'domaine_serene.jpg');
INSERT INTO `wine` VALUES ('11', 'BODEGA LURTON', '2011', 'Pinot Gris', 'Argentina', 'Mendoza', 0x536F6C6964206E6F746573206F6620626C61636B2063757272616E7420626C656E64656420776974682061206C6967687420636974727573206D616B6520746869732077696E6520616E206561737920706F757220666F72207661726965642070616C617465732E, 'bodega_lurton.jpg');
INSERT INTO `wine` VALUES ('12', 'LES MORIZOTTES', '2009', 'Chardonnay', 'France', 'Burgundy', 0x427265616B696E6720746865206D6F6C64206F662074686520636C6173736963732C2074686973206F66666572696E672077696C6C20737572707269736520616E6420756E646F75627465646C792067657420746F6E677565732077616767696E672077697468207468652068696E7473206F6620636F6666656520616E6420746F626163636F20696E0A7065726665637420616C69676E6D656E742077697468206D6F726520747261646974696F6E616C206E6F7465732E20427265616B696E6720746865206D6F6C64206F662074686520636C6173736963732C2074686973206F66666572696E672077696C6C20737572707269736520616E640A756E646F75627465646C792067657420746F6E677565732077616767696E672077697468207468652068696E7473206F6620636F6666656520616E6420746F626163636F20696E0A7065726665637420616C69676E6D656E742077697468206D6F726520747261646974696F6E616C206E6F7465732E205375726520746F20706C6561736520746865206C6174652D6E696768742063726F776420776974682074686520736C69676874206A6F6C74206F6620616472656E616C696E65206974206272696E67732E, 'morizottes.jpg');
