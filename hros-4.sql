/*
 Navicat Premium Data Transfer

 Source Server         : luna-local
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : hros

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 12/03/2023 14:32:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adjustsalary
-- ----------------------------
DROP TABLE IF EXISTS `adjustsalary`;
CREATE TABLE `adjustsalary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `eid` int DEFAULT NULL,
  `asDate` date DEFAULT NULL COMMENT '调薪日期',
  `beforeSalary` int DEFAULT NULL COMMENT '调前薪资',
  `afterSalary` int DEFAULT NULL COMMENT '调后薪资',
  `reason` varchar(255) DEFAULT NULL COMMENT '调薪原因',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`eid`) USING BTREE,
  CONSTRAINT `adjustsalary_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of adjustsalary
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for appraise
-- ----------------------------
DROP TABLE IF EXISTS `appraise`;
CREATE TABLE `appraise` (
  `id` int NOT NULL AUTO_INCREMENT,
  `eid` int DEFAULT NULL,
  `appDate` date DEFAULT NULL COMMENT '考评日期',
  `appResult` varchar(32) DEFAULT NULL COMMENT '考评结果',
  `appContent` varchar(255) DEFAULT NULL COMMENT '考评内容',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`eid`) USING BTREE,
  CONSTRAINT `appraise_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of appraise
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '部门名称',
  `parentId` int DEFAULT NULL,
  `depPath` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `isParent` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------
BEGIN;
INSERT INTO `department` (`id`, `name`, `parentId`, `depPath`, `enabled`, `isParent`) VALUES (1, '总公司', -1, '.1', 1, 1);
INSERT INTO `department` (`id`, `name`, `parentId`, `depPath`, `enabled`, `isParent`) VALUES (148, '小部门', 1, '.1.148', 1, 1);
INSERT INTO `department` (`id`, `name`, `parentId`, `depPath`, `enabled`, `isParent`) VALUES (149, '小小部门', 148, '.1.148.149', 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `name` varchar(10) DEFAULT NULL COMMENT '员工姓名',
  `gender` char(4) DEFAULT NULL COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `idCard` char(18) DEFAULT NULL COMMENT '身份证号',
  `wedlock` enum('已婚','未婚','离异') DEFAULT NULL COMMENT '婚姻状况',
  `nationId` int DEFAULT NULL COMMENT '民族',
  `nativePlace` varchar(20) DEFAULT NULL COMMENT '籍贯',
  `politicId` int DEFAULT NULL COMMENT '政治面貌',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话号码',
  `address` varchar(64) DEFAULT NULL COMMENT '联系地址',
  `departmentId` int DEFAULT NULL COMMENT '所属部门',
  `jobLevelId` int DEFAULT NULL COMMENT '职称ID',
  `posId` int DEFAULT NULL COMMENT '职位ID',
  `engageForm` varchar(8) DEFAULT NULL COMMENT '聘用形式',
  `tiptopDegree` enum('博士','硕士','本科','大专','高中','初中','小学','其他') DEFAULT NULL COMMENT '最高学历',
  `specialty` varchar(32) DEFAULT NULL COMMENT '所属专业',
  `school` varchar(32) DEFAULT NULL COMMENT '毕业院校',
  `beginDate` date DEFAULT NULL COMMENT '入职日期',
  `workState` enum('在职','离职') DEFAULT '在职' COMMENT '在职状态',
  `workID` char(8) DEFAULT NULL COMMENT '工号',
  `contractTerm` double DEFAULT NULL COMMENT '合同期限',
  `conversionTime` date DEFAULT NULL COMMENT '转正日期',
  `notWorkDate` date DEFAULT NULL COMMENT '离职日期',
  `beginContract` date DEFAULT NULL COMMENT '合同起始日期',
  `endContract` date DEFAULT NULL COMMENT '合同终止日期',
  `workAge` int DEFAULT NULL COMMENT '工龄',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `departmentId` (`departmentId`) USING BTREE,
  KEY `jobId` (`jobLevelId`) USING BTREE,
  KEY `dutyId` (`posId`) USING BTREE,
  KEY `nationId` (`nationId`) USING BTREE,
  KEY `politicId` (`politicId`) USING BTREE,
  KEY `workID_key` (`workID`) USING BTREE,
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`) ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`jobLevelId`) REFERENCES `joblevel` (`id`) ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`posId`) REFERENCES `position` (`id`) ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`nationId`) REFERENCES `nation` (`id`) ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`politicId`) REFERENCES `politicsstatus` (`id`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5269 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of employee
-- ----------------------------
BEGIN;
INSERT INTO `employee` (`id`, `name`, `gender`, `birthday`, `idCard`, `wedlock`, `nationId`, `nativePlace`, `politicId`, `email`, `phone`, `address`, `departmentId`, `jobLevelId`, `posId`, `engageForm`, `tiptopDegree`, `specialty`, `school`, `beginDate`, `workState`, `workID`, `contractTerm`, `conversionTime`, `notWorkDate`, `beginContract`, `endContract`, `workAge`) VALUES (5268, '小红', '男', '1998-10-08', '150124199510081276', '未婚', 1, '中国', 3, '00000001@qq.com', '15692756582', '江苏盐城', 1, 14, 33, '劳动合同', '本科', '软件工程', '盐城师范学院', '2023-03-03', '在职', '00000001', 1, '2023-03-03', NULL, '2023-03-03', '2024-03-11', NULL);
COMMIT;

-- ----------------------------
-- Table structure for employee_recycle
-- ----------------------------
DROP TABLE IF EXISTS `employee_recycle`;
CREATE TABLE `employee_recycle` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `name` varchar(10) DEFAULT NULL COMMENT '员工姓名',
  `gender` char(4) DEFAULT NULL COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `idCard` char(18) DEFAULT NULL COMMENT '身份证号',
  `wedlock` enum('已婚','未婚','离异') DEFAULT NULL COMMENT '婚姻状况',
  `nationId` int DEFAULT NULL COMMENT '民族',
  `nativePlace` varchar(20) DEFAULT NULL COMMENT '籍贯',
  `politicId` int DEFAULT NULL COMMENT '政治面貌',
  `email` varchar(20) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话号码',
  `address` varchar(64) DEFAULT NULL COMMENT '联系地址',
  `departmentId` int DEFAULT NULL COMMENT '所属部门',
  `jobLevelId` int DEFAULT NULL COMMENT '职称ID',
  `posId` int DEFAULT NULL COMMENT '职位ID',
  `engageForm` varchar(8) DEFAULT NULL COMMENT '聘用形式',
  `tiptopDegree` enum('博士','硕士','本科','大专','高中','初中','小学','其他') DEFAULT NULL COMMENT '最高学历',
  `specialty` varchar(32) DEFAULT NULL COMMENT '所属专业',
  `school` varchar(32) DEFAULT NULL COMMENT '毕业院校',
  `beginDate` date DEFAULT NULL COMMENT '入职日期',
  `workState` enum('在职','离职') DEFAULT '在职' COMMENT '在职状态',
  `workID` char(8) DEFAULT NULL COMMENT '工号',
  `contractTerm` double DEFAULT NULL COMMENT '合同期限',
  `conversionTime` date DEFAULT NULL COMMENT '转正日期',
  `notWorkDate` date DEFAULT NULL COMMENT '离职日期',
  `beginContract` date DEFAULT NULL COMMENT '合同起始日期',
  `endContract` date DEFAULT NULL COMMENT '合同终止日期',
  `workAge` int DEFAULT NULL COMMENT '工龄',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `departmentId` (`departmentId`) USING BTREE,
  KEY `jobId` (`jobLevelId`) USING BTREE,
  KEY `dutyId` (`posId`) USING BTREE,
  KEY `nationId` (`nationId`) USING BTREE,
  KEY `politicId` (`politicId`) USING BTREE,
  KEY `workID_key` (`workID`) USING BTREE,
  CONSTRAINT `employee_recycle_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`) ON UPDATE RESTRICT,
  CONSTRAINT `employee_recycle_ibfk_2` FOREIGN KEY (`jobLevelId`) REFERENCES `joblevel` (`id`) ON UPDATE RESTRICT,
  CONSTRAINT `employee_recycle_ibfk_3` FOREIGN KEY (`posId`) REFERENCES `position` (`id`) ON UPDATE RESTRICT,
  CONSTRAINT `employee_recycle_ibfk_4` FOREIGN KEY (`nationId`) REFERENCES `nation` (`id`) ON UPDATE RESTRICT,
  CONSTRAINT `employee_recycle_ibfk_5` FOREIGN KEY (`politicId`) REFERENCES `politicsstatus` (`id`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5139 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of employee_recycle
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for employeeec
-- ----------------------------
DROP TABLE IF EXISTS `employeeec`;
CREATE TABLE `employeeec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `eid` int DEFAULT NULL COMMENT '员工编号',
  `ecDate` date DEFAULT NULL COMMENT '奖罚日期',
  `ecReason` varchar(255) DEFAULT NULL COMMENT '奖罚原因',
  `ecPoint` int DEFAULT NULL COMMENT '奖罚分',
  `ecType` int DEFAULT NULL COMMENT '奖罚类别，0：奖，1：罚',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`eid`) USING BTREE,
  CONSTRAINT `employeeec_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of employeeec
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for employeeremove
-- ----------------------------
DROP TABLE IF EXISTS `employeeremove`;
CREATE TABLE `employeeremove` (
  `id` int NOT NULL AUTO_INCREMENT,
  `eid` int DEFAULT NULL,
  `afterDepId` int DEFAULT NULL COMMENT '调动后部门',
  `afterJobId` int DEFAULT NULL COMMENT '调动后职位',
  `removeDate` date DEFAULT NULL COMMENT '调动日期',
  `reason` varchar(255) DEFAULT NULL COMMENT '调动原因',
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`eid`) USING BTREE,
  CONSTRAINT `employeeremove_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of employeeremove
-- ----------------------------
BEGIN;
INSERT INTO `employeeremove` (`id`, `eid`, `afterDepId`, `afterJobId`, `removeDate`, `reason`, `remark`) VALUES (11, 5268, 1, 15, '2023-03-10', NULL, NULL);
INSERT INTO `employeeremove` (`id`, `eid`, `afterDepId`, `afterJobId`, `removeDate`, `reason`, `remark`) VALUES (12, 5268, 1, 14, '2023-03-10', NULL, NULL);
INSERT INTO `employeeremove` (`id`, `eid`, `afterDepId`, `afterJobId`, `removeDate`, `reason`, `remark`) VALUES (13, 5268, 1, 14, '2023-03-10', NULL, NULL);
INSERT INTO `employeeremove` (`id`, `eid`, `afterDepId`, `afterJobId`, `removeDate`, `reason`, `remark`) VALUES (14, 5268, 1, 14, '2023-03-10', NULL, NULL);
INSERT INTO `employeeremove` (`id`, `eid`, `afterDepId`, `afterJobId`, `removeDate`, `reason`, `remark`) VALUES (15, 5268, 1, 14, '2023-03-10', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for employeetrain
-- ----------------------------
DROP TABLE IF EXISTS `employeetrain`;
CREATE TABLE `employeetrain` (
  `id` int NOT NULL AUTO_INCREMENT,
  `eid` int DEFAULT NULL COMMENT '员工编号',
  `trainstartDate` date DEFAULT NULL COMMENT '培训开始日期',
  `trainfinishDate` datetime DEFAULT NULL COMMENT '培训结束日期',
  `trainContent` varchar(255) DEFAULT NULL COMMENT '培训内容',
  `trainstatus` tinyint DEFAULT NULL COMMENT '培训状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`eid`) USING BTREE,
  CONSTRAINT `employeetrain_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of employeetrain
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for empsalary
-- ----------------------------
DROP TABLE IF EXISTS `empsalary`;
CREATE TABLE `empsalary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `eid` int DEFAULT NULL,
  `sid` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `eid` (`eid`) USING BTREE,
  KEY `empsalary_ibfk_2` (`sid`) USING BTREE,
  CONSTRAINT `empsalary_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`),
  CONSTRAINT `empsalary_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `salary` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of empsalary
-- ----------------------------
BEGIN;
INSERT INTO `empsalary` (`id`, `eid`, `sid`) VALUES (109, 5268, 10);
INSERT INTO `empsalary` (`id`, `eid`, `sid`) VALUES (110, 5268, 26);
COMMIT;

-- ----------------------------
-- Table structure for fileup
-- ----------------------------
DROP TABLE IF EXISTS `fileup`;
CREATE TABLE `fileup` (
  `fileld` int unsigned NOT NULL AUTO_INCREMENT,
  `filePath` varchar(255) DEFAULT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `fileSize` varchar(255) DEFAULT NULL,
  `fileType` varchar(255) DEFAULT NULL,
  `fileDate` datetime DEFAULT NULL,
  PRIMARY KEY (`fileld`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of fileup
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for hr
-- ----------------------------
DROP TABLE IF EXISTS `hr`;
CREATE TABLE `hr` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'hrID',
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(16) DEFAULT NULL COMMENT '住宅电话',
  `address` varchar(64) DEFAULT NULL COMMENT '联系地址',
  `enabled` tinyint(1) DEFAULT '1',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `userface` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of hr
-- ----------------------------
BEGIN;
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (3, '系统管理员', '18568887789', '029-82881234', '深圳南山', 1, 'admin', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (5, '李白', '18568123489', '029-82123434', '海口美兰', 1, 'libai', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (10, '韩愈', '18568123666', '029-82111555', '广州番禺', 1, 'hanyu', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/f9ebc3cec3fdfc0323f23563dc3f8794a5c2267e.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (11, '柳宗元', '18568123377', '029-82111333', '广州天河', 1, 'liuzongyuan', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/3ea40f2442a7d933062c32a8a54bd11372f00178.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (12, '曾巩', '18568128888', '029-82111222', '广州越秀', 1, 'zenggong', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/83a0d0a20cf431ad9c5595e24336acaf2fdd9879.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (13, '徐凤年', '18568887789', '029-82881234', '深圳南山', 1, 'xufengnian', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (15, '徐晓', '18568123489', '029-82123434', '海口美兰', 1, 'xuxiao', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (16, '轩辕青峰', '18568123666', '029-82111555', '广州番禺', 1, 'xuanyuanqingfeng', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/f9ebc3cec3fdfc0323f23563dc3f8794a5c2267e.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (17, '青鸟', '18568123377', '029-82111333', '广州天河', 1, 'qingniao', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/3ea40f2442a7d933062c32a8a54bd11372f00178.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (18, '超级用户', '18568128888', '029-82111222', '广州越秀', 1, 'root', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/83a0d0a20cf431ad9c5595e24336acaf2fdd9879.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (19, '徐脂虎', '18568887789', '029-82881234', '深圳南山', 1, 'xuzhihu', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://imgsa.baidu.com/forum/pic/item/3ea40f2442a7d933062c32a8a54bd11372f00178.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (20, '徐渭熊', '18568123489', '029-82123434', '海口美兰', 1, 'xuweixiong', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (21, '徐念凉', '18568123666', '029-82111555', '广州番禺', 1, 'xunianliang', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/f9ebc3cec3fdfc0323f23563dc3f8794a5c2267e.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (22, '太阿剑九黄', '18568123377', '029-82111333', '广州天河', 1, 'laohuang', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/3ea40f2442a7d933062c32a8a54bd11372f00178.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (23, '白衣僧人李当心', '18568128888', '029-82111222', '广州越秀', 1, 'lidangxin', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (24, '武帝城于新郎', '18568887789', '029-82881234', '深圳南山', 1, 'yuxinlang', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://imgsa.baidu.com/forum/pic/item/f9ebc3cec3fdfc0323f23563dc3f8794a5c2267e.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (25, '南诏韦淼', '18568123489', '029-82123434', '海口美兰', 1, 'weita', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/3ea40f2442a7d933062c32a8a54bd11372f00178.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (26, '东越剑池柴青山', '18568123666', '029-82111555', '广州番禺', 1, '东越剑池柴青山', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://imgsa.baidu.com/forum/pic/item/83a0d0a20cf431ad9c5595e24336acaf2fdd9879.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (28, '温华', '18568128888', '029-82111222', '广州越秀', 1, 'zenggong', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517070040185&di=be0375e0c3db6c311b837b28c208f318&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Fpost%2F20150213%2F6%2F20150213141918532.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (29, '李义山', '18568887789', '029-82881234', '深圳南山', 1, 'liyishan', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'http://bpic.588ku.com/element_pic/01/40/00/64573ce2edc0728.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (30, '王初冬', '18568123489', '029-82123434', '海口美兰', 1, 'wangchudong', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514093920321&di=913e88c23f382933ef430024afd9128a&imgtype=0&src=http%3A%2F%2Fp.3761.com%2Fpic%2F9771429316733.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (31, '陆丞燕', '18568123666', '029-82111555', '广州番禺', 1, '陆丞燕', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1406745149,1563524794&fm=27&gp=0.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (32, '鱼玄机', '18568123377', '029-82111333', '广州天河', 1, 'yuxuanji', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1515233756&di=0856d923a0a37a87fd26604a2c871370&imgtype=jpg&er=1&src=http%3A%2F%2Fwww.qqzhi.com%2Fuploadpic%2F2014-09-27%2F041716704.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (33, '南宫仆射', '18568128888', '029-82111222', '广州越秀', 1, '南宫仆射', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517070040185&di=be0375e0c3db6c311b837b28c208f318&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Fpost%2F20150213%2F6%2F20150213141918532.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (34, '姜泥', '18568887789', '029-82881234', '深圳南山', 1, '姜泥', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'http://bpic.588ku.com/element_pic/01/40/00/64573ce2edc0728.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (35, '西楚曹长卿', '18568123489', '029-82123434', '海口美兰', 1, '曹长卿', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514093920321&di=913e88c23f382933ef430024afd9128a&imgtype=0&src=http%3A%2F%2Fp.3761.com%2Fpic%2F9771429316733.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (36, '孙希济　', '18568123666', '029-82111555', '广州番禺', 1, '孙希济', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1406745149,1563524794&fm=27&gp=0.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (38, '耶律洪才', '18568128888', '029-82111222', '广州越秀', 1, '耶律洪才', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517070040185&di=be0375e0c3db6c311b837b28c208f318&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Fpost%2F20150213%2F6%2F20150213141918532.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (39, '赫连武威', '18568887789', '029-82881234', '深圳南山', 1, '赫连武威', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'http://bpic.588ku.com/element_pic/01/40/00/64573ce2edc0728.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (40, '呼延大观', '18568123489', '029-82123434', '海口美兰', 1, '呼延大观', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514093920321&di=913e88c23f382933ef430024afd9128a&imgtype=0&src=http%3A%2F%2Fp.3761.com%2Fpic%2F9771429316733.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (41, '轩辕敬城', '18568123666', '029-82111555', '广州番禺', 1, '轩辕敬城', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1406745149,1563524794&fm=27&gp=0.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (43, '耶律洪才', '18568128888', '029-82111222', '广州越秀', 1, '耶律洪才', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1517070040185&di=be0375e0c3db6c311b837b28c208f318&imgtype=0&src=http%3A%2F%2Fimg2.soyoung.com%2Fpost%2F20150213%2F6%2F20150213141918532.jpg', NULL);
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (44, '小白', '2342342', '32423423', '测试', 1, 'xiaobai', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', '测说');
INSERT INTO `hr` (`id`, `name`, `phone`, `telephone`, `address`, `enabled`, `username`, `password`, `userface`, `remark`) VALUES (45, '小白', '2342342', '32423423', '测试', 0, 'xiaobai', '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', '测说');
COMMIT;

-- ----------------------------
-- Table structure for hr_role
-- ----------------------------
DROP TABLE IF EXISTS `hr_role`;
CREATE TABLE `hr_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hrid` int DEFAULT NULL,
  `rid` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `rid` (`rid`) USING BTREE,
  KEY `hr_role_ibfk_1` (`hrid`) USING BTREE,
  CONSTRAINT `hr_role_ibfk_1` FOREIGN KEY (`hrid`) REFERENCES `hr` (`id`) ON UPDATE RESTRICT,
  CONSTRAINT `hr_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of hr_role
-- ----------------------------
BEGIN;
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (74, 19, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (75, 19, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (76, 35, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (195, 3, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (196, 22, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (197, 22, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (198, 22, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (201, 31, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (206, 18, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (211, 23, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (212, 23, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (213, 24, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (214, 24, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (215, 24, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (216, 20, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (217, 20, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (218, 20, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (219, 20, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (220, 20, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (221, 20, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (222, 20, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (260, 29, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (261, 25, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (262, 33, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (263, 33, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (264, 33, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (265, 33, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (266, 36, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (267, 36, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (268, 43, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (291, 26, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (292, 26, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (293, 26, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (294, 26, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (295, 26, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (380, 41, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (381, 41, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (382, 30, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (383, 30, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (384, 30, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (385, 30, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (386, 15, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (387, 15, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (403, 21, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (404, 21, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (405, 21, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (406, 21, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (416, 28, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (417, 28, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (418, 28, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (419, 28, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (427, 17, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (428, 17, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (429, 17, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (430, 17, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (431, 17, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (432, 17, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (466, 38, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (473, 40, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (474, 40, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (475, 34, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (480, 32, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (481, 32, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (482, 32, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (483, 32, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (490, 16, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (491, 16, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (492, 16, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (493, 16, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (494, 13, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (495, 13, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (496, 13, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (497, 13, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (498, 13, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (499, 13, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (502, 11, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (503, 11, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (504, 12, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (507, 10, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (508, 10, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (509, 39, 6);
INSERT INTO `hr_role` (`id`, `hrid`, `rid`) VALUES (510, 39, NULL);
COMMIT;

-- ----------------------------
-- Table structure for joblevel
-- ----------------------------
DROP TABLE IF EXISTS `joblevel`;
CREATE TABLE `joblevel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '职称名称',
  `titleLevel` enum('正高级','副高级','中级','初级','员级') DEFAULT NULL,
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of joblevel
-- ----------------------------
BEGIN;
INSERT INTO `joblevel` (`id`, `name`, `titleLevel`, `createDate`, `enabled`) VALUES (9, '教授', '正高级', '2018-01-11 21:19:14', 0);
INSERT INTO `joblevel` (`id`, `name`, `titleLevel`, `createDate`, `enabled`) VALUES (14, '初级工程师', '初级', '2018-01-14 16:18:50', 1);
INSERT INTO `joblevel` (`id`, `name`, `titleLevel`, `createDate`, `enabled`) VALUES (15, '中级工程师', '中级', '2018-01-14 16:19:00', 1);
INSERT INTO `joblevel` (`id`, `name`, `titleLevel`, `createDate`, `enabled`) VALUES (16, '高级工程师', '副高级', '2018-01-14 16:19:14', 1);
COMMIT;

-- ----------------------------
-- Table structure for logtype
-- ----------------------------
DROP TABLE IF EXISTS `logtype`;
CREATE TABLE `logtype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `logtypemsg` varchar(255) DEFAULT NULL,
  `adddate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of logtype
-- ----------------------------
BEGIN;
INSERT INTO `logtype` (`id`, `logtypemsg`, `adddate`) VALUES (1, '系统设置修改', '2020-01-06 10:36:46');
INSERT INTO `logtype` (`id`, `logtypemsg`, `adddate`) VALUES (2, '员工入职', '2020-01-06 10:37:08');
INSERT INTO `logtype` (`id`, `logtypemsg`, `adddate`) VALUES (3, '员工奖惩', '2020-01-06 10:37:12');
INSERT INTO `logtype` (`id`, `logtypemsg`, `adddate`) VALUES (4, '员工培训', '2020-01-06 10:37:15');
INSERT INTO `logtype` (`id`, `logtypemsg`, `adddate`) VALUES (5, '员工调薪', '2020-01-06 10:37:19');
COMMIT;

-- ----------------------------
-- Table structure for main_notice
-- ----------------------------
DROP TABLE IF EXISTS `main_notice`;
CREATE TABLE `main_notice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `mainbody` mediumtext COMMENT '内容',
  `authon` varchar(11) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of main_notice
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(64) DEFAULT NULL,
  `path` varchar(64) DEFAULT NULL,
  `component` varchar(64) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `iconCls` varchar(64) DEFAULT NULL,
  `keepAlive` tinyint(1) DEFAULT NULL,
  `requireAuth` tinyint(1) DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parentId` (`parentId`) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `menu` (`id`) ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN;
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (1, '/', NULL, NULL, '主菜单', NULL, NULL, NULL, NULL, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (2, '/', '/home', 'Home', '员工资料', 'fa fa-user-circle-o', NULL, 1, 1, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (3, '/', '/home', 'Home', '人事管理', 'fa fa-address-card-o', NULL, 1, 1, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (4, '/', '/home', 'Home', '薪资管理', 'fa fa-money', NULL, 1, 1, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (5, '/', '/home', 'Home', '统计管理', 'fa fa-bar-chart', NULL, 1, 1, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (6, '/', '/home', 'Home', '系统管理', 'fa fa-windows', NULL, 1, 1, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (7, '/employee/basic/**', '/emp/basic', 'EmpBasic', '员工档案', 'fa fa-id-card-o', NULL, 1, 3, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (8, '/employee/advanced/**', '/emp/adv', 'EmpAdv', '高级资料', 'fa fa-id-card', NULL, 1, 2, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (9, '/employee/basic2/**', '/emp/basic2', 'EmpBasic2', '基本资料', 'fa fa-id-card-o', NULL, 1, 2, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (10, '/personnel/ec/**', '/per/ec', 'PerEc', '员工奖惩', 'fa fa-american-sign-language-interpreting', NULL, 1, 3, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (11, '/personnel/train/**', '/per/train', 'PerTrain', '员工培训', 'fa fa-user-plus', NULL, 1, 3, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (12, '/personnel/salary/**', '/per/salary', 'PerSalary', '员工调薪', 'fa fa-braille', NULL, 1, 3, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (13, '/personnel/remove/**', '/per/mv', 'PerMv', '员工调动', 'fa fa-blind', NULL, 1, 3, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (14, '/salary/sob/**', '/sal/sob', 'SalSob', '工资账套管理', 'fa fa-credit-card-alt ', NULL, 1, 4, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (15, '/salary/sobcfg/**', '/sal/sobcfg', 'SalSobCfg', '员工账套设置', 'fa fa-cc-amex', NULL, 1, 4, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (16, '/salary/table/**', '/sal/table', 'SalTable', '工资表管理', 'fa fa-indent', NULL, 1, 4, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (19, '/statistics/all/**', '/sta/all', 'StaAll', '综合信息统计', 'fa fa-area-chart', NULL, 1, 5, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (20, '/statistics/score/**', '/sta/score', 'StaScore', '员工积分统计', 'fa fa-line-chart', NULL, 1, 5, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (21, '/statistics/personnel/**', '/sta/pers', 'StaPers', '人事信息分析', 'fa fa-pie-chart', NULL, 1, 5, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (22, '/statistics/recored/**', '/sta/record', 'StaRecord', '人事记录分析', 'fa fa-bar-chart', NULL, 1, 5, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (23, '/system/basic/**', '/sys/basic', 'SysBasic', '基础信息设置', 'fa fa-stack-overflow', NULL, 1, 6, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (24, '/system/cfg/**', '/sys/cfg', 'SysCfg', '系统管理', 'fa fa-steam-square', NULL, 1, 6, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (25, '/system/log/**', '/sys/log', 'SysLog', '操作日志管理', 'fa fa-list', NULL, 1, 6, 1);
INSERT INTO `menu` (`id`, `url`, `path`, `component`, `name`, `iconCls`, `keepAlive`, `requireAuth`, `parentId`, `enabled`) VALUES (26, '/system/hr/**', '/sys/hr', 'SysHr', '操作员管理', 'fa fa-users', NULL, 1, 6, 1);
COMMIT;

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int DEFAULT NULL,
  `rid` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `mid` (`mid`) USING BTREE,
  KEY `rid` (`rid`) USING BTREE,
  CONSTRAINT `menu_role_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `menu` (`id`),
  CONSTRAINT `menu_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=957 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
BEGIN;
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (922, 8, 2);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (923, 7, 2);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (924, 10, 2);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (925, 11, 2);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (926, 12, 2);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (927, 13, 2);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (928, 14, 2);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (929, 15, 2);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (930, 16, 2);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (931, 19, 2);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (932, 20, 2);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (933, 21, 2);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (934, 22, 2);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (935, 23, 2);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (936, 24, 2);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (937, 25, 2);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (938, 26, 2);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (939, 8, 6);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (940, 9, 6);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (941, 7, 6);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (942, 10, 6);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (943, 11, 6);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (944, 12, 6);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (945, 13, 6);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (946, 14, 6);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (947, 15, 6);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (948, 16, 6);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (949, 19, 6);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (950, 20, 6);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (951, 21, 6);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (952, 22, 6);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (953, 23, 6);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (954, 24, 6);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (955, 25, 6);
INSERT INTO `menu_role` (`id`, `mid`, `rid`) VALUES (956, 26, 6);
COMMIT;

-- ----------------------------
-- Table structure for msgcontent
-- ----------------------------
DROP TABLE IF EXISTS `msgcontent`;
CREATE TABLE `msgcontent` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(64) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of msgcontent
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for nation
-- ----------------------------
DROP TABLE IF EXISTS `nation`;
CREATE TABLE `nation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of nation
-- ----------------------------
BEGIN;
INSERT INTO `nation` (`id`, `name`) VALUES (1, '汉族');
INSERT INTO `nation` (`id`, `name`) VALUES (2, '蒙古族');
INSERT INTO `nation` (`id`, `name`) VALUES (3, '回族');
INSERT INTO `nation` (`id`, `name`) VALUES (4, '藏族');
INSERT INTO `nation` (`id`, `name`) VALUES (5, '维吾尔族');
INSERT INTO `nation` (`id`, `name`) VALUES (6, '苗族');
INSERT INTO `nation` (`id`, `name`) VALUES (7, '彝族');
INSERT INTO `nation` (`id`, `name`) VALUES (8, '壮族');
INSERT INTO `nation` (`id`, `name`) VALUES (9, '布依族');
INSERT INTO `nation` (`id`, `name`) VALUES (10, '朝鲜族');
INSERT INTO `nation` (`id`, `name`) VALUES (11, '满族');
INSERT INTO `nation` (`id`, `name`) VALUES (12, '侗族');
INSERT INTO `nation` (`id`, `name`) VALUES (13, '瑶族');
INSERT INTO `nation` (`id`, `name`) VALUES (14, '白族');
INSERT INTO `nation` (`id`, `name`) VALUES (15, '土家族');
INSERT INTO `nation` (`id`, `name`) VALUES (16, '哈尼族');
INSERT INTO `nation` (`id`, `name`) VALUES (17, '哈萨克族');
INSERT INTO `nation` (`id`, `name`) VALUES (18, '傣族');
INSERT INTO `nation` (`id`, `name`) VALUES (19, '黎族');
INSERT INTO `nation` (`id`, `name`) VALUES (20, '傈僳族');
INSERT INTO `nation` (`id`, `name`) VALUES (21, '佤族');
INSERT INTO `nation` (`id`, `name`) VALUES (22, '畲族');
INSERT INTO `nation` (`id`, `name`) VALUES (23, '高山族');
INSERT INTO `nation` (`id`, `name`) VALUES (24, '拉祜族');
INSERT INTO `nation` (`id`, `name`) VALUES (25, '水族');
INSERT INTO `nation` (`id`, `name`) VALUES (26, '东乡族');
INSERT INTO `nation` (`id`, `name`) VALUES (27, '纳西族');
INSERT INTO `nation` (`id`, `name`) VALUES (28, '景颇族');
INSERT INTO `nation` (`id`, `name`) VALUES (29, '柯尔克孜族');
INSERT INTO `nation` (`id`, `name`) VALUES (30, '土族');
INSERT INTO `nation` (`id`, `name`) VALUES (31, '达斡尔族');
INSERT INTO `nation` (`id`, `name`) VALUES (32, '仫佬族');
INSERT INTO `nation` (`id`, `name`) VALUES (33, '羌族');
INSERT INTO `nation` (`id`, `name`) VALUES (34, '布朗族');
INSERT INTO `nation` (`id`, `name`) VALUES (35, '撒拉族');
INSERT INTO `nation` (`id`, `name`) VALUES (36, '毛难族');
INSERT INTO `nation` (`id`, `name`) VALUES (37, '仡佬族');
INSERT INTO `nation` (`id`, `name`) VALUES (38, '锡伯族');
INSERT INTO `nation` (`id`, `name`) VALUES (39, '阿昌族');
INSERT INTO `nation` (`id`, `name`) VALUES (40, '普米族');
INSERT INTO `nation` (`id`, `name`) VALUES (41, '塔吉克族');
INSERT INTO `nation` (`id`, `name`) VALUES (42, '怒族');
INSERT INTO `nation` (`id`, `name`) VALUES (43, '乌孜别克族');
INSERT INTO `nation` (`id`, `name`) VALUES (44, '俄罗斯族');
INSERT INTO `nation` (`id`, `name`) VALUES (45, '鄂温克族');
INSERT INTO `nation` (`id`, `name`) VALUES (46, '崩龙族');
INSERT INTO `nation` (`id`, `name`) VALUES (47, '保安族');
INSERT INTO `nation` (`id`, `name`) VALUES (48, '裕固族');
INSERT INTO `nation` (`id`, `name`) VALUES (49, '京族');
INSERT INTO `nation` (`id`, `name`) VALUES (50, '塔塔尔族');
INSERT INTO `nation` (`id`, `name`) VALUES (51, '独龙族');
INSERT INTO `nation` (`id`, `name`) VALUES (52, '鄂伦春族');
INSERT INTO `nation` (`id`, `name`) VALUES (53, '赫哲族');
INSERT INTO `nation` (`id`, `name`) VALUES (54, '门巴族');
INSERT INTO `nation` (`id`, `name`) VALUES (55, '珞巴族');
INSERT INTO `nation` (`id`, `name`) VALUES (56, '基诺族');
COMMIT;

-- ----------------------------
-- Table structure for oplog
-- ----------------------------
DROP TABLE IF EXISTS `oplog`;
CREATE TABLE `oplog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `logtype` tinyint DEFAULT NULL COMMENT '日志类型，',
  `addDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加日期',
  `operate` varchar(255) DEFAULT NULL COMMENT '操作内容',
  `hrname` varchar(255) DEFAULT NULL COMMENT '操作员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2617 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of oplog
-- ----------------------------
BEGIN;
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (5, 3, '2020-03-04 10:31:09', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (6, 2, '2020-03-04 10:31:13', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (7, 4, '2020-03-04 10:31:18', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (8, 5, '2020-03-04 10:31:22', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (9, 7, '2020-03-04 10:31:26', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (10, 7, '2020-03-04 10:31:33', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (11, 3, '2020-03-04 10:31:44', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (12, 1, '2020-03-04 10:31:49', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (13, 3, '2020-03-04 10:32:14', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (14, 3, '2020-03-04 10:32:14', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (15, 1, '2020-03-04 10:31:49', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (16, 3, '2020-03-04 10:31:44', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (17, 5, '2020-03-04 10:31:22', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (18, 4, '2020-03-04 10:31:18', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (19, 2, '2020-03-04 10:31:13', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (21, 2, '2020-03-04 10:47:03', '12', '12');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (22, 3, '2020-03-04 10:49:03', '12', '12');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (24, 3, '2020-03-04 10:32:14', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (25, 1, '2020-03-04 10:31:49', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (26, 3, '2020-03-04 10:31:44', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (27, 5, '2020-03-04 10:31:22', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (28, 4, '2020-03-04 10:31:18', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (29, 2, '2020-03-04 10:31:13', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (30, 3, '2020-03-04 10:31:09', '1', '1');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (31, 1, '2020-10-04 19:41:07', '更新公告Springboot+SpringSecurity实现图片验证码登录问题', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (32, 7, '2021-05-07 23:58:41', '员工套账变动:workId:5265套账编号:13', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (33, 3, '2021-05-07 23:58:55', '员工奖惩删除:eid=5266--id:116', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (34, 4, '2021-05-08 00:29:53', '添加培训:eid=5226', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (35, 1, '2021-05-08 00:34:10', '添加公告基于Spring Boot框架的 人事管理系统的设计与实现', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (36, 1, '2021-05-08 00:34:57', '更新公告Springboot+SpringSecurity实现图片验证码登录问题', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (37, 1, '2021-05-08 00:35:48', '更新公告Springboot+SpringSecurity实现图片验证码登录问题', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (38, 8, '2023-02-13 19:49:04', '操作员信息更新:徐念凉', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (39, 8, '2023-02-13 19:49:06', '操作员信息更新:徐念凉', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (40, 8, '2023-02-13 19:49:15', '操作员角色更新', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (41, 1, '2023-02-13 19:49:37', '更新公告基于Spring Boot框架的 人事管理系统的设计与实现', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (42, 1, '2023-02-13 19:49:41', '更新公告基于Spring Boot框架的 人事管理系统的设计与实现', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (43, 1, '2023-02-13 19:49:49', '更新公告Springboot+SpringSecurity实现图片验证码登录问题', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (44, 7, '2023-02-13 19:50:07', '员工套账变动:workId:5266套账编号:22', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (45, 8, '2023-02-13 19:54:11', '操作员角色更新', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (46, 8, '2023-02-13 19:54:17', '操作员角色更新', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (47, 1, '2023-03-04 20:00:20', '删除公告: id74', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (48, 1, '2023-03-04 20:00:22', '删除公告: id73', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (51, 10, '2023-03-05 17:28:46', '删除员工考评eid:5267', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (55, 7, '2023-03-05 17:37:27', '员工套账变动:workId:5267套账编号:10', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (56, 9, '2023-03-05 17:39:20', '员工离职:name:小芳1---workId:00010534', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (60, 9, '2023-03-05 17:42:34', '员工离职:name:小明9609---workId:00010530', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (61, 9, '2023-03-05 17:42:47', '员工离职:name:小明9608---workId:00010529', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (62, 9, '2023-03-05 17:42:54', '员工离职:name:小明9607---workId:00010528', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (64, 9, '2023-03-05 17:52:15', '员工离职:name:小明9605---workId:00010526', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (70, 9, '2023-03-05 18:02:06', '员工离职:name:小明7032---workId:00007953', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (73, 9, '2023-03-05 18:15:35', '员工离职:name:小明7038---workId:00007959', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (74, 5, '2023-03-05 18:15:46', '删除套账:id=9', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (75, 4, '2023-03-05 18:16:21', '员工培训eid:5226', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (76, 4, '2023-03-05 18:17:13', '添加培训:eid=5227', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (77, 1, '2023-03-05 18:18:14', '添加角色: ROLE_SALARY_MANAGER', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (78, 1, '2023-03-05 18:18:24', '删除奖惩: id = 31', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (79, 11, '2023-03-05 21:04:05', '更新员工资料::name:小明9604---workId:00010525', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (80, 11, '2023-03-05 21:05:03', '更新员工资料::name:小明9606---workId:00010527', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (81, 9, '2023-03-06 11:10:29', '员工批量离职:name:', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (82, 9, '2023-03-06 11:10:34', '员工离职:name:小芳---workId:00010533', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (83, 9, '2023-03-06 11:10:34', '员工离职:name:小王---workId:00010532', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (84, 9, '2023-03-06 11:10:34', '员工离职:name:小明---workId:00010531', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (85, 9, '2023-03-06 11:10:34', '员工离职:name:小明9606---workId:00010527', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (86, 9, '2023-03-06 11:10:34', '员工离职:name:小明9604---workId:00010525', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (87, 9, '2023-03-06 11:10:34', '员工离职:name:小明9603---workId:00010524', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (88, 9, '2023-03-06 11:10:34', '员工离职:name:小明9602---workId:00010523', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (89, 9, '2023-03-06 11:10:34', '员工离职:name:小明9601---workId:00010522', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (90, 9, '2023-03-06 11:10:34', '员工离职:name:小明9600---workId:00010521', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (91, 9, '2023-03-06 11:10:34', '员工离职:name:小明9599---workId:00010520', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (92, 9, '2023-03-06 11:10:34', '员工离职:name:小明9598---workId:00010519', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (93, 9, '2023-03-06 11:10:34', '员工离职:name:小明9597---workId:00010518', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (94, 9, '2023-03-06 11:10:34', '员工离职:name:小明9596---workId:00010517', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (95, 9, '2023-03-06 11:10:43', '员工批量离职:name:', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (96, 9, '2023-03-06 11:10:43', '员工离职:name:小明9595---workId:00010516', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (97, 9, '2023-03-06 11:10:43', '员工离职:name:小明9594---workId:00010515', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (98, 9, '2023-03-06 11:10:43', '员工离职:name:小明9593---workId:00010514', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (99, 9, '2023-03-06 11:10:43', '员工离职:name:小明9592---workId:00010513', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (100, 9, '2023-03-06 11:10:43', '员工离职:name:小明9591---workId:00010512', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (101, 9, '2023-03-06 11:10:43', '员工离职:name:小明9590---workId:00010511', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (102, 9, '2023-03-06 11:10:43', '员工离职:name:小明9589---workId:00010510', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (103, 9, '2023-03-06 11:10:43', '员工离职:name:小明9588---workId:00010509', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (104, 9, '2023-03-06 11:10:43', '员工离职:name:小明9587---workId:00010508', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (105, 9, '2023-03-06 11:10:43', '员工离职:name:小明9586---workId:00010507', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (106, 9, '2023-03-06 11:10:43', '员工离职:name:小明9585---workId:00010506', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (107, 9, '2023-03-06 11:10:43', '员工离职:name:小明9584---workId:00010505', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (108, 9, '2023-03-06 11:10:43', '员工离职:name:小明9544---workId:00010465', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (109, 9, '2023-03-06 11:10:47', '员工批量离职:name:', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (110, 9, '2023-03-06 11:10:47', '员工离职:name:小明9543---workId:00010464', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (111, 9, '2023-03-06 11:10:47', '员工离职:name:小明9542---workId:00010463', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (112, 9, '2023-03-06 11:10:47', '员工离职:name:小明9541---workId:00010462', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (113, 9, '2023-03-06 11:10:47', '员工离职:name:小明9540---workId:00010461', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (114, 9, '2023-03-06 11:10:47', '员工离职:name:小明9539---workId:00010460', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (115, 9, '2023-03-06 11:10:48', '员工离职:name:小明9538---workId:00010459', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (116, 9, '2023-03-06 11:10:48', '员工离职:name:小明9537---workId:00010458', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (117, 9, '2023-03-06 11:10:48', '员工离职:name:小明9536---workId:00010457', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (118, 9, '2023-03-06 11:10:48', '员工离职:name:小明9535---workId:00010456', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (119, 9, '2023-03-06 11:10:48', '员工离职:name:小明9534---workId:00010455', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (120, 9, '2023-03-06 11:10:48', '员工离职:name:小明9533---workId:00010454', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (121, 9, '2023-03-06 11:10:48', '员工离职:name:小明9532---workId:00010453', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (122, 9, '2023-03-06 11:10:48', '员工离职:name:小明9531---workId:00010452', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (123, 9, '2023-03-06 11:12:25', '员工批量离职:name:', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (124, 9, '2023-03-06 11:12:25', '员工离职:name:小明9530---workId:00010451', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (125, 9, '2023-03-06 11:12:25', '员工离职:name:小明9529---workId:00010450', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (126, 9, '2023-03-06 11:12:26', '员工离职:name:小明9528---workId:00010449', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (127, 9, '2023-03-06 11:12:26', '员工离职:name:小明9527---workId:00010448', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (128, 9, '2023-03-06 11:12:26', '员工离职:name:小明9526---workId:00010447', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (129, 9, '2023-03-06 11:12:26', '员工离职:name:小明9525---workId:00010446', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (130, 9, '2023-03-06 11:12:26', '员工离职:name:小明9524---workId:00010445', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (131, 9, '2023-03-06 11:12:26', '员工离职:name:小明9523---workId:00010444', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (132, 9, '2023-03-06 11:12:26', '员工离职:name:小明9522---workId:00010443', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (133, 9, '2023-03-06 11:12:26', '员工离职:name:小明9521---workId:00010442', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (134, 9, '2023-03-06 11:12:26', '员工离职:name:小明9520---workId:00010441', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (135, 9, '2023-03-06 11:12:26', '员工离职:name:小明9519---workId:00010440', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (136, 9, '2023-03-06 11:12:26', '员工离职:name:小明9518---workId:00010439', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (137, 9, '2023-03-06 11:12:26', '员工离职:name:小明9517---workId:00010438', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (138, 9, '2023-03-06 11:12:26', '员工离职:name:小明9516---workId:00010437', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (139, 9, '2023-03-06 11:12:26', '员工离职:name:小明9515---workId:00010436', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (140, 9, '2023-03-06 11:12:26', '员工离职:name:小明9514---workId:00010435', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (141, 9, '2023-03-06 11:12:26', '员工离职:name:小明9513---workId:00010434', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (142, 9, '2023-03-06 11:12:26', '员工离职:name:小明9512---workId:00010433', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (143, 9, '2023-03-06 11:12:26', '员工离职:name:小明9511---workId:00010432', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (144, 9, '2023-03-06 11:12:26', '员工离职:name:小明9510---workId:00010431', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (145, 9, '2023-03-06 11:12:26', '员工离职:name:小明9509---workId:00010430', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (146, 9, '2023-03-06 11:12:26', '员工离职:name:小明9508---workId:00010429', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (147, 9, '2023-03-06 11:12:26', '员工离职:name:小明9457---workId:00010378', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (148, 9, '2023-03-06 11:12:26', '员工离职:name:小明9456---workId:00010377', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (149, 9, '2023-03-06 11:12:26', '员工离职:name:小明9455---workId:00010376', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (150, 9, '2023-03-06 11:12:26', '员工离职:name:小明9454---workId:00010375', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (151, 9, '2023-03-06 11:12:26', '员工离职:name:小明9453---workId:00010374', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (152, 9, '2023-03-06 11:12:26', '员工离职:name:小明9452---workId:00010373', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (153, 9, '2023-03-06 11:12:26', '员工离职:name:小明9451---workId:00010372', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (154, 9, '2023-03-06 11:12:26', '员工离职:name:小明9450---workId:00010371', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (155, 9, '2023-03-06 11:12:26', '员工离职:name:小明9449---workId:00010370', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (156, 9, '2023-03-06 11:12:26', '员工离职:name:小明9448---workId:00010369', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (157, 9, '2023-03-06 11:12:26', '员工离职:name:小明9447---workId:00010368', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (158, 9, '2023-03-06 11:12:26', '员工离职:name:小明9446---workId:00010367', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (159, 9, '2023-03-06 11:12:26', '员工离职:name:小明9445---workId:00010366', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (160, 9, '2023-03-06 11:12:26', '员工离职:name:小明9444---workId:00010365', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (161, 9, '2023-03-06 11:12:26', '员工离职:name:小明9443---workId:00010364', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (162, 9, '2023-03-06 11:12:26', '员工离职:name:小明9442---workId:00010363', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (163, 9, '2023-03-06 11:12:26', '员工离职:name:小明9441---workId:00010362', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (164, 9, '2023-03-06 11:12:26', '员工离职:name:小明9440---workId:00010361', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (165, 9, '2023-03-06 11:12:27', '员工离职:name:小明9439---workId:00010360', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (166, 9, '2023-03-06 11:12:27', '员工离职:name:小明9438---workId:00010359', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (167, 9, '2023-03-06 11:12:27', '员工离职:name:小明9437---workId:00010358', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (168, 9, '2023-03-06 11:12:27', '员工离职:name:小明9436---workId:00010357', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (169, 9, '2023-03-06 11:12:27', '员工离职:name:小明9435---workId:00010356', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (170, 9, '2023-03-06 11:12:27', '员工离职:name:小明9434---workId:00010355', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (171, 9, '2023-03-06 11:12:27', '员工离职:name:小明9433---workId:00010354', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (172, 9, '2023-03-06 11:12:27', '员工离职:name:小明9432---workId:00010353', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (173, 9, '2023-03-06 11:12:27', '员工离职:name:小明9431---workId:00010352', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (174, 9, '2023-03-06 11:12:27', '员工离职:name:小明9430---workId:00010351', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (175, 9, '2023-03-06 11:12:27', '员工离职:name:小明9429---workId:00010350', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (176, 9, '2023-03-06 11:12:27', '员工离职:name:小明9428---workId:00010349', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (177, 9, '2023-03-06 11:12:27', '员工离职:name:小明9427---workId:00010348', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (178, 9, '2023-03-06 11:12:27', '员工离职:name:小明9426---workId:00010347', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (179, 9, '2023-03-06 11:12:27', '员工离职:name:小明9425---workId:00010346', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (180, 9, '2023-03-06 11:12:27', '员工离职:name:小明9424---workId:00010345', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (181, 9, '2023-03-06 11:12:27', '员工离职:name:小明9423---workId:00010344', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (182, 9, '2023-03-06 11:12:27', '员工离职:name:小明9422---workId:00010343', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (183, 9, '2023-03-06 11:12:27', '员工离职:name:小明9421---workId:00010342', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (184, 9, '2023-03-06 11:12:27', '员工离职:name:小明9420---workId:00010341', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (185, 9, '2023-03-06 11:12:27', '员工离职:name:小明9419---workId:00010340', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (186, 9, '2023-03-06 11:12:27', '员工离职:name:小明9418---workId:00010339', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (187, 9, '2023-03-06 11:12:27', '员工离职:name:小明9417---workId:00010338', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (188, 9, '2023-03-06 11:12:27', '员工离职:name:小明9416---workId:00010337', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (189, 9, '2023-03-06 11:12:27', '员工离职:name:小明9415---workId:00010336', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (190, 9, '2023-03-06 11:12:27', '员工离职:name:小明9414---workId:00010335', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (191, 9, '2023-03-06 11:12:27', '员工离职:name:小明9413---workId:00010334', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (192, 9, '2023-03-06 11:12:27', '员工离职:name:小明9412---workId:00010333', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (193, 9, '2023-03-06 11:12:27', '员工离职:name:小明9411---workId:00010332', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (194, 9, '2023-03-06 11:12:27', '员工离职:name:小明9410---workId:00010331', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (195, 9, '2023-03-06 11:12:27', '员工离职:name:小明9409---workId:00010330', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (196, 9, '2023-03-06 11:12:27', '员工离职:name:小明9408---workId:00010329', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (197, 9, '2023-03-06 11:12:27', '员工离职:name:小明9407---workId:00010328', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (198, 9, '2023-03-06 11:12:27', '员工离职:name:小明9406---workId:00010327', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (199, 9, '2023-03-06 11:12:27', '员工离职:name:小明9405---workId:00010326', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (200, 9, '2023-03-06 11:12:27', '员工离职:name:小明9404---workId:00010325', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (201, 9, '2023-03-06 11:12:27', '员工离职:name:小明9403---workId:00010324', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (202, 9, '2023-03-06 11:12:27', '员工离职:name:小明9402---workId:00010323', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (203, 9, '2023-03-06 11:12:27', '员工离职:name:小明9401---workId:00010322', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (204, 9, '2023-03-06 11:12:27', '员工离职:name:小明9400---workId:00010321', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (205, 9, '2023-03-06 11:12:27', '员工离职:name:小明9399---workId:00010320', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (206, 9, '2023-03-06 11:12:27', '员工离职:name:小明9398---workId:00010319', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (207, 9, '2023-03-06 11:12:27', '员工离职:name:小明9397---workId:00010318', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (208, 9, '2023-03-06 11:12:27', '员工离职:name:小明9396---workId:00010317', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (209, 9, '2023-03-06 11:12:27', '员工离职:name:小明9395---workId:00010316', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (210, 9, '2023-03-06 11:12:28', '员工离职:name:小明9394---workId:00010315', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (211, 9, '2023-03-06 11:12:28', '员工离职:name:小明9393---workId:00010314', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (212, 9, '2023-03-06 11:12:28', '员工离职:name:小明9392---workId:00010313', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (213, 9, '2023-03-06 11:12:28', '员工离职:name:小明9391---workId:00010312', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (214, 9, '2023-03-06 11:12:28', '员工离职:name:小明9390---workId:00010311', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (215, 9, '2023-03-06 11:12:28', '员工离职:name:小明9389---workId:00010310', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (216, 9, '2023-03-06 11:12:28', '员工离职:name:小明9388---workId:00010309', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (217, 9, '2023-03-06 11:12:28', '员工离职:name:小明9387---workId:00010308', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (218, 9, '2023-03-06 11:12:28', '员工离职:name:小明9386---workId:00010307', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (219, 9, '2023-03-06 11:12:28', '员工离职:name:小明9385---workId:00010306', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (220, 9, '2023-03-06 11:12:28', '员工离职:name:小明9384---workId:00010305', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (221, 9, '2023-03-06 11:12:28', '员工离职:name:小明9383---workId:00010304', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (222, 9, '2023-03-06 11:12:28', '员工离职:name:小明9382---workId:00010303', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (223, 9, '2023-03-06 11:12:28', '员工离职:name:小明9381---workId:00010302', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (224, 9, '2023-03-06 11:12:28', '员工离职:name:小明9380---workId:00010301', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (225, 9, '2023-03-06 11:12:28', '员工离职:name:小明9379---workId:00010300', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (226, 9, '2023-03-06 11:12:28', '员工离职:name:小明9378---workId:00010299', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (227, 9, '2023-03-06 11:12:28', '员工离职:name:小明9377---workId:00010298', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (228, 9, '2023-03-06 11:12:28', '员工离职:name:小明9376---workId:00010297', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (229, 9, '2023-03-06 11:12:28', '员工离职:name:小明9375---workId:00010296', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (230, 9, '2023-03-06 11:12:28', '员工离职:name:小明9374---workId:00010295', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (231, 9, '2023-03-06 11:12:28', '员工离职:name:小明9373---workId:00010294', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (232, 9, '2023-03-06 11:12:28', '员工离职:name:小明9372---workId:00010293', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (233, 9, '2023-03-06 11:12:28', '员工离职:name:小明9371---workId:00010292', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (234, 9, '2023-03-06 11:12:28', '员工离职:name:小明9370---workId:00010291', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (235, 9, '2023-03-06 11:12:28', '员工离职:name:小明9369---workId:00010290', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (236, 9, '2023-03-06 11:12:28', '员工离职:name:小明9368---workId:00010289', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (237, 9, '2023-03-06 11:12:28', '员工离职:name:小明9367---workId:00010288', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (238, 9, '2023-03-06 11:12:28', '员工离职:name:小明9366---workId:00010287', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (239, 9, '2023-03-06 11:12:28', '员工离职:name:小明9365---workId:00010286', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (240, 9, '2023-03-06 11:12:28', '员工离职:name:小明9364---workId:00010285', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (241, 9, '2023-03-06 11:12:28', '员工离职:name:小明9363---workId:00010284', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (242, 9, '2023-03-06 11:12:28', '员工离职:name:小明9362---workId:00010283', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (243, 9, '2023-03-06 11:12:28', '员工离职:name:小明9361---workId:00010282', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (244, 9, '2023-03-06 11:12:28', '员工离职:name:小明9360---workId:00010281', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (245, 9, '2023-03-06 11:12:28', '员工离职:name:小明9359---workId:00010280', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (246, 9, '2023-03-06 11:12:28', '员工离职:name:小明9358---workId:00010279', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (247, 9, '2023-03-06 11:12:28', '员工离职:name:小明9357---workId:00010278', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (248, 9, '2023-03-06 11:12:28', '员工离职:name:小明9356---workId:00010277', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (249, 9, '2023-03-06 11:12:28', '员工离职:name:小明9355---workId:00010276', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (250, 9, '2023-03-06 11:12:28', '员工离职:name:小明9354---workId:00010275', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (251, 9, '2023-03-06 11:12:28', '员工离职:name:小明9353---workId:00010274', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (252, 9, '2023-03-06 11:12:28', '员工离职:name:小明9352---workId:00010273', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (253, 9, '2023-03-06 11:12:28', '员工离职:name:小明9351---workId:00010272', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (254, 9, '2023-03-06 11:12:28', '员工离职:name:小明9350---workId:00010271', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (255, 9, '2023-03-06 11:12:28', '员工离职:name:小明9349---workId:00010270', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (256, 9, '2023-03-06 11:12:28', '员工离职:name:小明9348---workId:00010269', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (257, 9, '2023-03-06 11:12:28', '员工离职:name:小明9347---workId:00010268', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (258, 9, '2023-03-06 11:12:28', '员工离职:name:小明9346---workId:00010267', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (259, 9, '2023-03-06 11:12:29', '员工离职:name:小明9345---workId:00010266', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (260, 9, '2023-03-06 11:12:29', '员工离职:name:小明9344---workId:00010265', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (261, 9, '2023-03-06 11:12:29', '员工离职:name:小明9343---workId:00010264', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (262, 9, '2023-03-06 11:12:29', '员工离职:name:小明9342---workId:00010263', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (263, 9, '2023-03-06 11:12:29', '员工离职:name:小明9341---workId:00010262', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (264, 9, '2023-03-06 11:12:29', '员工离职:name:小明9340---workId:00010261', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (265, 9, '2023-03-06 11:12:29', '员工离职:name:小明9339---workId:00010260', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (266, 9, '2023-03-06 11:12:29', '员工离职:name:小明9338---workId:00010259', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (267, 9, '2023-03-06 11:12:29', '员工离职:name:小明9337---workId:00010258', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (268, 9, '2023-03-06 11:12:29', '员工离职:name:小明9336---workId:00010257', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (269, 9, '2023-03-06 11:12:29', '员工离职:name:小明9335---workId:00010256', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (270, 9, '2023-03-06 11:12:29', '员工离职:name:小明9334---workId:00010255', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (271, 9, '2023-03-06 11:12:29', '员工离职:name:小明9333---workId:00010254', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (272, 9, '2023-03-06 11:12:29', '员工离职:name:小明9332---workId:00010253', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (273, 9, '2023-03-06 11:12:29', '员工离职:name:小明9331---workId:00010252', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (274, 9, '2023-03-06 11:12:29', '员工离职:name:小明9330---workId:00010251', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (275, 9, '2023-03-06 11:12:29', '员工离职:name:小明9329---workId:00010250', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (276, 9, '2023-03-06 11:12:29', '员工离职:name:小明9328---workId:00010249', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (277, 9, '2023-03-06 11:12:29', '员工离职:name:小明9327---workId:00010248', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (278, 9, '2023-03-06 11:12:29', '员工离职:name:小明9326---workId:00010247', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (279, 9, '2023-03-06 11:12:29', '员工离职:name:小明9292---workId:00010213', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (280, 9, '2023-03-06 11:12:29', '员工离职:name:小明9291---workId:00010212', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (281, 9, '2023-03-06 11:12:29', '员工离职:name:小明9290---workId:00010211', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (282, 9, '2023-03-06 11:12:29', '员工离职:name:小明9289---workId:00010210', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (283, 9, '2023-03-06 11:12:29', '员工离职:name:小明9288---workId:00010209', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (284, 9, '2023-03-06 11:12:29', '员工离职:name:小明9287---workId:00010208', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (285, 9, '2023-03-06 11:12:29', '员工离职:name:小明9286---workId:00010207', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (286, 9, '2023-03-06 11:12:29', '员工离职:name:小明9285---workId:00010206', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (287, 9, '2023-03-06 11:12:29', '员工离职:name:小明9284---workId:00010205', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (288, 9, '2023-03-06 11:12:29', '员工离职:name:小明9283---workId:00010204', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (289, 9, '2023-03-06 11:12:29', '员工离职:name:小明9282---workId:00010203', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (290, 9, '2023-03-06 11:12:29', '员工离职:name:小明9281---workId:00010202', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (291, 9, '2023-03-06 11:12:29', '员工离职:name:小明9280---workId:00010201', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (292, 9, '2023-03-06 11:12:29', '员工离职:name:小明9279---workId:00010200', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (293, 9, '2023-03-06 11:12:29', '员工离职:name:小明9278---workId:00010199', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (294, 9, '2023-03-06 11:12:29', '员工离职:name:小明9277---workId:00010198', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (295, 9, '2023-03-06 11:12:29', '员工离职:name:小明9276---workId:00010197', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (296, 9, '2023-03-06 11:12:29', '员工离职:name:小明9275---workId:00010196', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (297, 9, '2023-03-06 11:12:29', '员工离职:name:小明9274---workId:00010195', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (298, 9, '2023-03-06 11:12:29', '员工离职:name:小明9273---workId:00010194', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (299, 9, '2023-03-06 11:12:29', '员工离职:name:小明9272---workId:00010193', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (300, 9, '2023-03-06 11:12:29', '员工离职:name:小明9271---workId:00010192', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (301, 9, '2023-03-06 11:12:29', '员工离职:name:小明9270---workId:00010191', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (302, 9, '2023-03-06 11:12:29', '员工离职:name:小明9269---workId:00010190', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (303, 9, '2023-03-06 11:12:29', '员工离职:name:小明9268---workId:00010189', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (304, 9, '2023-03-06 11:12:30', '员工离职:name:小明9267---workId:00010188', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (305, 9, '2023-03-06 11:12:30', '员工离职:name:小明9266---workId:00010187', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (306, 9, '2023-03-06 11:12:30', '员工离职:name:小明9265---workId:00010186', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (307, 9, '2023-03-06 11:12:30', '员工离职:name:小明9264---workId:00010185', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (308, 9, '2023-03-06 11:12:30', '员工离职:name:小明9263---workId:00010184', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (309, 9, '2023-03-06 11:12:30', '员工离职:name:小明9262---workId:00010183', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (310, 9, '2023-03-06 11:12:30', '员工离职:name:小明9261---workId:00010182', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (311, 9, '2023-03-06 11:12:30', '员工离职:name:小明9260---workId:00010181', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (312, 9, '2023-03-06 11:12:30', '员工离职:name:小明9259---workId:00010180', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (313, 9, '2023-03-06 11:12:30', '员工离职:name:小明9258---workId:00010179', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (314, 9, '2023-03-06 11:12:30', '员工离职:name:小明9257---workId:00010178', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (315, 9, '2023-03-06 11:12:30', '员工离职:name:小明9256---workId:00010177', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (316, 9, '2023-03-06 11:12:30', '员工离职:name:小明9255---workId:00010176', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (317, 9, '2023-03-06 11:12:30', '员工离职:name:小明9254---workId:00010175', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (318, 9, '2023-03-06 11:12:30', '员工离职:name:小明9253---workId:00010174', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (319, 9, '2023-03-06 11:12:30', '员工离职:name:小明9252---workId:00010173', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (320, 9, '2023-03-06 11:12:30', '员工离职:name:小明9251---workId:00010172', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (321, 9, '2023-03-06 11:12:30', '员工离职:name:小明9250---workId:00010171', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (322, 9, '2023-03-06 11:12:30', '员工离职:name:小明9249---workId:00010170', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (323, 9, '2023-03-06 11:12:30', '员工离职:name:小明9248---workId:00010169', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (324, 9, '2023-03-06 11:12:30', '员工离职:name:小明9247---workId:00010168', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (325, 9, '2023-03-06 11:12:30', '员工离职:name:小明9246---workId:00010167', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (326, 9, '2023-03-06 11:12:30', '员工离职:name:小明9245---workId:00010166', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (327, 9, '2023-03-06 11:12:30', '员工离职:name:小明9244---workId:00010165', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (328, 9, '2023-03-06 11:12:30', '员工离职:name:小明9243---workId:00010164', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (329, 9, '2023-03-06 11:12:30', '员工离职:name:小明9242---workId:00010163', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (330, 9, '2023-03-06 11:12:30', '员工离职:name:小明9241---workId:00010162', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (331, 9, '2023-03-06 11:12:30', '员工离职:name:小明9240---workId:00010161', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (332, 9, '2023-03-06 11:12:30', '员工离职:name:小明9239---workId:00010160', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (333, 9, '2023-03-06 11:12:30', '员工离职:name:小明9238---workId:00010159', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (334, 9, '2023-03-06 11:12:30', '员工离职:name:小明9237---workId:00010158', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (335, 9, '2023-03-06 11:12:30', '员工离职:name:小明9236---workId:00010157', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (336, 9, '2023-03-06 11:12:30', '员工离职:name:小明9235---workId:00010156', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (337, 9, '2023-03-06 11:12:30', '员工离职:name:小明9234---workId:00010155', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (338, 9, '2023-03-06 11:12:30', '员工离职:name:小明9233---workId:00010154', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (339, 9, '2023-03-06 11:12:30', '员工离职:name:小明9232---workId:00010153', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (340, 9, '2023-03-06 11:12:30', '员工离职:name:小明9231---workId:00010152', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (341, 9, '2023-03-06 11:12:30', '员工离职:name:小明9230---workId:00010151', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (342, 9, '2023-03-06 11:12:30', '员工离职:name:小明9229---workId:00010150', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (343, 9, '2023-03-06 11:12:30', '员工离职:name:小明9228---workId:00010149', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (344, 9, '2023-03-06 11:12:30', '员工离职:name:小明9227---workId:00010148', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (345, 9, '2023-03-06 11:12:30', '员工离职:name:小明9226---workId:00010147', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (346, 9, '2023-03-06 11:12:30', '员工离职:name:小明9225---workId:00010146', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (347, 9, '2023-03-06 11:12:30', '员工离职:name:小明9224---workId:00010145', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (348, 9, '2023-03-06 11:12:30', '员工离职:name:小明9223---workId:00010144', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (349, 9, '2023-03-06 11:12:30', '员工离职:name:小明9222---workId:00010143', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (350, 9, '2023-03-06 11:12:30', '员工离职:name:小明9221---workId:00010142', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (351, 9, '2023-03-06 11:12:30', '员工离职:name:小明9220---workId:00010141', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (352, 9, '2023-03-06 11:12:30', '员工离职:name:小明9219---workId:00010140', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (353, 9, '2023-03-06 11:12:30', '员工离职:name:小明9218---workId:00010139', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (354, 9, '2023-03-06 11:12:31', '员工离职:name:小明9217---workId:00010138', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (355, 9, '2023-03-06 11:12:31', '员工离职:name:小明9216---workId:00010137', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (356, 9, '2023-03-06 11:12:31', '员工离职:name:小明9215---workId:00010136', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (357, 9, '2023-03-06 11:12:31', '员工离职:name:小明9214---workId:00010135', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (358, 9, '2023-03-06 11:12:31', '员工离职:name:小明9213---workId:00010134', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (359, 9, '2023-03-06 11:12:31', '员工离职:name:小明9212---workId:00010133', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (360, 9, '2023-03-06 11:12:31', '员工离职:name:小明9211---workId:00010132', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (361, 9, '2023-03-06 11:12:31', '员工离职:name:小明9210---workId:00010131', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (362, 9, '2023-03-06 11:12:31', '员工离职:name:小明9209---workId:00010130', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (363, 9, '2023-03-06 11:12:31', '员工离职:name:小明9208---workId:00010129', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (364, 9, '2023-03-06 11:12:31', '员工离职:name:小明9207---workId:00010128', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (365, 9, '2023-03-06 11:12:31', '员工离职:name:小明9206---workId:00010127', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (366, 9, '2023-03-06 11:12:31', '员工离职:name:小明9205---workId:00010126', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (367, 9, '2023-03-06 11:12:31', '员工离职:name:小明9204---workId:00010125', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (368, 9, '2023-03-06 11:12:31', '员工离职:name:小明9203---workId:00010124', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (369, 9, '2023-03-06 11:12:31', '员工离职:name:小明9202---workId:00010123', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (370, 9, '2023-03-06 11:12:31', '员工离职:name:小明9201---workId:00010122', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (371, 9, '2023-03-06 11:12:31', '员工离职:name:小明9200---workId:00010121', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (372, 9, '2023-03-06 11:12:31', '员工离职:name:小明9199---workId:00010120', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (373, 9, '2023-03-06 11:12:31', '员工离职:name:小明9198---workId:00010119', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (374, 9, '2023-03-06 11:12:31', '员工离职:name:小明9197---workId:00010118', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (375, 9, '2023-03-06 11:12:31', '员工离职:name:小明9196---workId:00010117', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (376, 9, '2023-03-06 11:12:31', '员工离职:name:小明9195---workId:00010116', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (377, 9, '2023-03-06 11:12:31', '员工离职:name:小明9194---workId:00010115', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (378, 9, '2023-03-06 11:12:31', '员工离职:name:小明9193---workId:00010114', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (379, 9, '2023-03-06 11:12:31', '员工离职:name:小明9192---workId:00010113', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (380, 9, '2023-03-06 11:12:31', '员工离职:name:小明9191---workId:00010112', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (381, 9, '2023-03-06 11:12:31', '员工离职:name:小明9190---workId:00010111', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (382, 9, '2023-03-06 11:12:31', '员工离职:name:小明9189---workId:00010110', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (383, 9, '2023-03-06 11:12:31', '员工离职:name:小明9188---workId:00010109', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (384, 9, '2023-03-06 11:12:31', '员工离职:name:小明9187---workId:00010108', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (385, 9, '2023-03-06 11:12:31', '员工离职:name:小明9186---workId:00010107', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (386, 9, '2023-03-06 11:12:31', '员工离职:name:小明9185---workId:00010106', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (387, 9, '2023-03-06 11:12:31', '员工离职:name:小明9184---workId:00010105', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (388, 9, '2023-03-06 11:12:31', '员工离职:name:小明9183---workId:00010104', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (389, 9, '2023-03-06 11:12:31', '员工离职:name:小明9182---workId:00010103', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (390, 9, '2023-03-06 11:12:31', '员工离职:name:小明9181---workId:00010102', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (391, 9, '2023-03-06 11:12:31', '员工离职:name:小明9180---workId:00010101', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (392, 9, '2023-03-06 11:12:31', '员工离职:name:小明9179---workId:00010100', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (393, 9, '2023-03-06 11:12:31', '员工离职:name:小明9178---workId:00010099', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (394, 9, '2023-03-06 11:12:31', '员工离职:name:小明9177---workId:00010098', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (395, 9, '2023-03-06 11:12:31', '员工离职:name:小明9176---workId:00010097', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (396, 9, '2023-03-06 11:12:31', '员工离职:name:小明9175---workId:00010096', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (397, 9, '2023-03-06 11:12:31', '员工离职:name:小明9174---workId:00010095', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (398, 9, '2023-03-06 11:12:31', '员工离职:name:小明9173---workId:00010094', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (399, 9, '2023-03-06 11:12:32', '员工离职:name:小明9172---workId:00010093', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (400, 9, '2023-03-06 11:12:32', '员工离职:name:小明9171---workId:00010092', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (401, 9, '2023-03-06 11:12:32', '员工离职:name:小明9170---workId:00010091', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (402, 9, '2023-03-06 11:12:32', '员工离职:name:小明9169---workId:00010090', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (403, 9, '2023-03-06 11:12:32', '员工离职:name:小明9168---workId:00010089', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (404, 9, '2023-03-06 11:12:32', '员工离职:name:小明9167---workId:00010088', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (405, 9, '2023-03-06 11:12:32', '员工离职:name:小明9166---workId:00010087', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (406, 9, '2023-03-06 11:12:32', '员工离职:name:小明9165---workId:00010086', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (407, 9, '2023-03-06 11:12:32', '员工离职:name:小明9164---workId:00010085', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (408, 9, '2023-03-06 11:12:32', '员工离职:name:小明9163---workId:00010084', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (409, 9, '2023-03-06 11:12:32', '员工离职:name:小明9162---workId:00010083', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (410, 9, '2023-03-06 11:12:32', '员工离职:name:小明9161---workId:00010082', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (411, 9, '2023-03-06 11:12:32', '员工离职:name:小明9160---workId:00010081', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (412, 9, '2023-03-06 11:12:32', '员工离职:name:小明9159---workId:00010080', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (413, 9, '2023-03-06 11:12:32', '员工离职:name:小明9158---workId:00010079', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (414, 9, '2023-03-06 11:12:32', '员工离职:name:小明9157---workId:00010078', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (415, 9, '2023-03-06 11:12:32', '员工离职:name:小明9156---workId:00010077', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (416, 9, '2023-03-06 11:12:32', '员工离职:name:小明9155---workId:00010076', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (417, 9, '2023-03-06 11:12:32', '员工离职:name:小明9154---workId:00010075', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (418, 9, '2023-03-06 11:12:32', '员工离职:name:小明9153---workId:00010074', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (419, 9, '2023-03-06 11:12:32', '员工离职:name:小明9152---workId:00010073', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (420, 9, '2023-03-06 11:12:32', '员工离职:name:小明9151---workId:00010072', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (421, 9, '2023-03-06 11:12:32', '员工离职:name:小明9150---workId:00010071', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (422, 9, '2023-03-06 11:12:32', '员工离职:name:小明9149---workId:00010070', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (423, 9, '2023-03-06 11:12:32', '员工离职:name:小明9148---workId:00010069', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (424, 9, '2023-03-06 11:12:32', '员工离职:name:小明9147---workId:00010068', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (425, 9, '2023-03-06 11:12:32', '员工离职:name:小明9146---workId:00010067', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (426, 9, '2023-03-06 11:12:32', '员工离职:name:小明9145---workId:00010066', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (427, 9, '2023-03-06 11:12:32', '员工离职:name:小明9144---workId:00010065', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (428, 9, '2023-03-06 11:12:32', '员工离职:name:小明9143---workId:00010064', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (429, 9, '2023-03-06 11:12:32', '员工离职:name:小明9142---workId:00010063', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (430, 9, '2023-03-06 11:12:32', '员工离职:name:小明9141---workId:00010062', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (431, 9, '2023-03-06 11:12:32', '员工离职:name:小明9140---workId:00010061', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (432, 9, '2023-03-06 11:12:32', '员工离职:name:小明9139---workId:00010060', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (433, 9, '2023-03-06 11:12:32', '员工离职:name:小明9138---workId:00010059', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (434, 9, '2023-03-06 11:12:32', '员工离职:name:小明9137---workId:00010058', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (435, 9, '2023-03-06 11:12:32', '员工离职:name:小明9136---workId:00010057', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (436, 9, '2023-03-06 11:12:32', '员工离职:name:小明9135---workId:00010056', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (437, 9, '2023-03-06 11:12:32', '员工离职:name:小明9134---workId:00010055', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (438, 9, '2023-03-06 11:12:32', '员工离职:name:小明9133---workId:00010054', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (439, 9, '2023-03-06 11:12:32', '员工离职:name:小明9132---workId:00010053', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (440, 9, '2023-03-06 11:12:32', '员工离职:name:小明9131---workId:00010052', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (441, 9, '2023-03-06 11:12:32', '员工离职:name:小明9130---workId:00010051', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (442, 9, '2023-03-06 11:12:32', '员工离职:name:小明9129---workId:00010050', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (443, 9, '2023-03-06 11:12:32', '员工离职:name:小明9128---workId:00010049', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (444, 9, '2023-03-06 11:12:32', '员工离职:name:小明9127---workId:00010048', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (445, 9, '2023-03-06 11:12:32', '员工离职:name:小明9126---workId:00010047', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (446, 9, '2023-03-06 11:12:32', '员工离职:name:小明9125---workId:00010046', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (447, 9, '2023-03-06 11:12:32', '员工离职:name:小明9124---workId:00010045', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (448, 9, '2023-03-06 11:12:33', '员工离职:name:小明9123---workId:00010044', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (449, 9, '2023-03-06 11:12:33', '员工离职:name:小明9122---workId:00010043', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (450, 9, '2023-03-06 11:12:33', '员工离职:name:小明9121---workId:00010042', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (451, 9, '2023-03-06 11:12:33', '员工离职:name:小明9120---workId:00010041', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (452, 9, '2023-03-06 11:12:33', '员工离职:name:小明9119---workId:00010040', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (453, 9, '2023-03-06 11:12:33', '员工离职:name:小明9118---workId:00010039', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (454, 9, '2023-03-06 11:12:33', '员工离职:name:小明9117---workId:00010038', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (455, 9, '2023-03-06 11:12:33', '员工离职:name:小明9116---workId:00010037', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (456, 9, '2023-03-06 11:12:33', '员工离职:name:小明9115---workId:00010036', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (457, 9, '2023-03-06 11:12:44', '员工批量离职:name:', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (458, 9, '2023-03-06 11:12:44', '员工离职:name:小明9114---workId:00010035', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (459, 9, '2023-03-06 11:12:44', '员工离职:name:小明9113---workId:00010034', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (460, 9, '2023-03-06 11:12:44', '员工离职:name:小明9112---workId:00010033', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (461, 9, '2023-03-06 11:12:44', '员工离职:name:小明9111---workId:00010032', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (462, 9, '2023-03-06 11:12:44', '员工离职:name:小明9110---workId:00010031', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (463, 9, '2023-03-06 11:12:44', '员工离职:name:小明9109---workId:00010030', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (464, 9, '2023-03-06 11:12:44', '员工离职:name:小明9108---workId:00010029', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (465, 9, '2023-03-06 11:12:44', '员工离职:name:小明9107---workId:00010028', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (466, 9, '2023-03-06 11:12:44', '员工离职:name:小明9106---workId:00010027', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (467, 9, '2023-03-06 11:12:44', '员工离职:name:小明9105---workId:00010026', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (468, 9, '2023-03-06 11:12:44', '员工离职:name:小明9104---workId:00010025', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (469, 9, '2023-03-06 11:12:44', '员工离职:name:小明9103---workId:00010024', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (470, 9, '2023-03-06 11:12:44', '员工离职:name:小明9102---workId:00010023', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (471, 9, '2023-03-06 11:12:44', '员工离职:name:小明9101---workId:00010022', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (472, 9, '2023-03-06 11:12:44', '员工离职:name:小明9100---workId:00010021', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (473, 9, '2023-03-06 11:12:44', '员工离职:name:小明9099---workId:00010020', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (474, 9, '2023-03-06 11:12:44', '员工离职:name:小明9098---workId:00010019', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (475, 9, '2023-03-06 11:12:44', '员工离职:name:小明9097---workId:00010018', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (476, 9, '2023-03-06 11:12:44', '员工离职:name:小明9096---workId:00010017', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (477, 9, '2023-03-06 11:12:44', '员工离职:name:小明9095---workId:00010016', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (478, 9, '2023-03-06 11:12:44', '员工离职:name:小明9094---workId:00010015', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (479, 9, '2023-03-06 11:12:45', '员工离职:name:小明9093---workId:00010014', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (480, 9, '2023-03-06 11:12:45', '员工离职:name:小明9092---workId:00010013', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (481, 9, '2023-03-06 11:12:45', '员工离职:name:小明9091---workId:00010012', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (482, 9, '2023-03-06 11:12:45', '员工离职:name:小明9090---workId:00010011', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (483, 9, '2023-03-06 11:12:45', '员工离职:name:小明9089---workId:00010010', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (484, 9, '2023-03-06 11:12:45', '员工离职:name:小明9088---workId:00010009', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (485, 9, '2023-03-06 11:12:45', '员工离职:name:小明9087---workId:00010008', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (486, 9, '2023-03-06 11:12:45', '员工离职:name:小明9086---workId:00010007', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (487, 9, '2023-03-06 11:12:45', '员工离职:name:小明9085---workId:00010006', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (488, 9, '2023-03-06 11:12:45', '员工离职:name:小明9084---workId:00010005', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (489, 9, '2023-03-06 11:12:45', '员工离职:name:小明9083---workId:00010004', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (490, 9, '2023-03-06 11:12:45', '员工离职:name:小明9082---workId:00010003', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (491, 9, '2023-03-06 11:12:45', '员工离职:name:小明9081---workId:00010002', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (492, 9, '2023-03-06 11:12:45', '员工离职:name:小明9080---workId:00010001', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (493, 9, '2023-03-06 11:12:45', '员工离职:name:小明9079---workId:00010000', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (494, 9, '2023-03-06 11:12:45', '员工离职:name:小明9078---workId:00009999', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (495, 9, '2023-03-06 11:12:45', '员工离职:name:小明9077---workId:00009998', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (496, 9, '2023-03-06 11:12:45', '员工离职:name:小明9076---workId:00009997', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (497, 9, '2023-03-06 11:12:45', '员工离职:name:小明9075---workId:00009996', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (498, 9, '2023-03-06 11:12:45', '员工离职:name:小明9074---workId:00009995', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (499, 9, '2023-03-06 11:12:45', '员工离职:name:小明9073---workId:00009994', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (500, 9, '2023-03-06 11:12:45', '员工离职:name:小明9072---workId:00009993', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (501, 9, '2023-03-06 11:12:45', '员工离职:name:小明9071---workId:00009992', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (502, 9, '2023-03-06 11:12:45', '员工离职:name:小明9070---workId:00009991', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (503, 9, '2023-03-06 11:12:45', '员工离职:name:小明9069---workId:00009990', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (504, 9, '2023-03-06 11:12:45', '员工离职:name:小明9068---workId:00009989', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (505, 9, '2023-03-06 11:12:45', '员工离职:name:小明9067---workId:00009988', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (506, 9, '2023-03-06 11:12:45', '员工离职:name:小明9066---workId:00009987', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (507, 9, '2023-03-06 11:12:45', '员工离职:name:小明9065---workId:00009986', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (508, 9, '2023-03-06 11:12:45', '员工离职:name:小明9064---workId:00009985', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (509, 9, '2023-03-06 11:12:45', '员工离职:name:小明9063---workId:00009984', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (510, 9, '2023-03-06 11:12:45', '员工离职:name:小明9062---workId:00009983', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (511, 9, '2023-03-06 11:12:45', '员工离职:name:小明9061---workId:00009982', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (512, 9, '2023-03-06 11:12:45', '员工离职:name:小明9060---workId:00009981', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (513, 9, '2023-03-06 11:12:45', '员工离职:name:小明9059---workId:00009980', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (514, 9, '2023-03-06 11:12:45', '员工离职:name:小明9058---workId:00009979', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (515, 9, '2023-03-06 11:12:45', '员工离职:name:小明9057---workId:00009978', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (516, 9, '2023-03-06 11:12:45', '员工离职:name:小明9056---workId:00009977', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (517, 9, '2023-03-06 11:12:45', '员工离职:name:小明9055---workId:00009976', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (518, 9, '2023-03-06 11:12:46', '员工离职:name:小明9054---workId:00009975', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (519, 9, '2023-03-06 11:12:46', '员工离职:name:小明9053---workId:00009974', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (520, 9, '2023-03-06 11:12:46', '员工离职:name:小明9052---workId:00009973', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (521, 9, '2023-03-06 11:12:46', '员工离职:name:小明9051---workId:00009972', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (522, 9, '2023-03-06 11:12:46', '员工离职:name:小明9050---workId:00009971', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (523, 9, '2023-03-06 11:12:46', '员工离职:name:小明9049---workId:00009970', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (524, 9, '2023-03-06 11:12:46', '员工离职:name:小明9048---workId:00009969', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (525, 9, '2023-03-06 11:12:46', '员工离职:name:小明9047---workId:00009968', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (526, 9, '2023-03-06 11:12:46', '员工离职:name:小明9046---workId:00009967', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (527, 9, '2023-03-06 11:12:46', '员工离职:name:小明9045---workId:00009966', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (528, 9, '2023-03-06 11:12:46', '员工离职:name:小明9044---workId:00009965', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (529, 9, '2023-03-06 11:12:46', '员工离职:name:小明9043---workId:00009964', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (530, 9, '2023-03-06 11:12:46', '员工离职:name:小明9042---workId:00009963', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (531, 9, '2023-03-06 11:12:46', '员工离职:name:小明9041---workId:00009962', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (532, 9, '2023-03-06 11:12:46', '员工离职:name:小明9040---workId:00009961', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (533, 9, '2023-03-06 11:12:46', '员工离职:name:小明9039---workId:00009960', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (534, 9, '2023-03-06 11:12:46', '员工离职:name:小明9038---workId:00009959', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (535, 9, '2023-03-06 11:12:46', '员工离职:name:小明9037---workId:00009958', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (536, 9, '2023-03-06 11:12:46', '员工离职:name:小明9036---workId:00009957', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (537, 9, '2023-03-06 11:12:46', '员工离职:name:小明9035---workId:00009956', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (538, 9, '2023-03-06 11:12:46', '员工离职:name:小明9034---workId:00009955', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (539, 9, '2023-03-06 11:12:46', '员工离职:name:小明9033---workId:00009954', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (540, 9, '2023-03-06 11:12:46', '员工离职:name:小明9032---workId:00009953', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (541, 9, '2023-03-06 11:12:46', '员工离职:name:小明9031---workId:00009952', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (542, 9, '2023-03-06 11:12:46', '员工离职:name:小明9030---workId:00009951', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (543, 9, '2023-03-06 11:12:46', '员工离职:name:小明9029---workId:00009950', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (544, 9, '2023-03-06 11:12:46', '员工离职:name:小明9028---workId:00009949', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (545, 9, '2023-03-06 11:12:46', '员工离职:name:小明9027---workId:00009948', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (546, 9, '2023-03-06 11:12:46', '员工离职:name:小明9026---workId:00009947', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (547, 9, '2023-03-06 11:12:46', '员工离职:name:小明9025---workId:00009946', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (548, 9, '2023-03-06 11:12:46', '员工离职:name:小明9024---workId:00009945', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (549, 9, '2023-03-06 11:12:46', '员工离职:name:小明9023---workId:00009944', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (550, 9, '2023-03-06 11:12:46', '员工离职:name:小明9022---workId:00009943', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (551, 9, '2023-03-06 11:12:46', '员工离职:name:小明9021---workId:00009942', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (552, 9, '2023-03-06 11:12:46', '员工离职:name:小明9020---workId:00009941', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (553, 9, '2023-03-06 11:12:46', '员工离职:name:小明9019---workId:00009940', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (554, 9, '2023-03-06 11:12:46', '员工离职:name:小明9018---workId:00009939', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (555, 9, '2023-03-06 11:12:46', '员工离职:name:小明9017---workId:00009938', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (556, 9, '2023-03-06 11:12:46', '员工离职:name:小明9016---workId:00009937', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (557, 9, '2023-03-06 11:12:46', '员工离职:name:小明9015---workId:00009936', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (558, 9, '2023-03-06 11:12:46', '员工离职:name:小明9014---workId:00009935', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (559, 9, '2023-03-06 11:12:46', '员工离职:name:小明9013---workId:00009934', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (560, 9, '2023-03-06 11:12:46', '员工离职:name:小明9012---workId:00009933', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (561, 9, '2023-03-06 11:12:46', '员工离职:name:小明9011---workId:00009932', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (562, 9, '2023-03-06 11:12:46', '员工离职:name:小明9010---workId:00009931', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (563, 9, '2023-03-06 11:12:46', '员工离职:name:小明9009---workId:00009930', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (564, 9, '2023-03-06 11:12:46', '员工离职:name:小明9008---workId:00009929', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (565, 9, '2023-03-06 11:12:46', '员工离职:name:小明9007---workId:00009928', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (566, 9, '2023-03-06 11:12:47', '员工离职:name:小明9006---workId:00009927', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (567, 9, '2023-03-06 11:12:47', '员工离职:name:小明9005---workId:00009926', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (568, 9, '2023-03-06 11:12:47', '员工离职:name:小明9004---workId:00009925', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (569, 9, '2023-03-06 11:12:47', '员工离职:name:小明9003---workId:00009924', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (570, 9, '2023-03-06 11:12:47', '员工离职:name:小明9002---workId:00009923', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (571, 9, '2023-03-06 11:12:47', '员工离职:name:小明9001---workId:00009922', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (572, 9, '2023-03-06 11:12:47', '员工离职:name:小明9000---workId:00009921', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (573, 9, '2023-03-06 11:12:47', '员工离职:name:小明8999---workId:00009920', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (574, 9, '2023-03-06 11:12:47', '员工离职:name:小明8998---workId:00009919', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (575, 9, '2023-03-06 11:12:47', '员工离职:name:小明8997---workId:00009918', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (576, 9, '2023-03-06 11:12:47', '员工离职:name:小明8996---workId:00009917', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (577, 9, '2023-03-06 11:12:47', '员工离职:name:小明8995---workId:00009916', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (578, 9, '2023-03-06 11:12:47', '员工离职:name:小明8994---workId:00009915', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (579, 9, '2023-03-06 11:12:47', '员工离职:name:小明8993---workId:00009914', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (580, 9, '2023-03-06 11:12:47', '员工离职:name:小明8992---workId:00009913', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (581, 9, '2023-03-06 11:12:47', '员工离职:name:小明8991---workId:00009912', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (582, 9, '2023-03-06 11:12:47', '员工离职:name:小明8990---workId:00009911', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (583, 9, '2023-03-06 11:12:47', '员工离职:name:小明8989---workId:00009910', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (584, 9, '2023-03-06 11:12:47', '员工离职:name:小明8988---workId:00009909', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (585, 9, '2023-03-06 11:12:47', '员工离职:name:小明8987---workId:00009908', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (586, 9, '2023-03-06 11:12:47', '员工离职:name:小明8986---workId:00009907', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (587, 9, '2023-03-06 11:12:47', '员工离职:name:小明8985---workId:00009906', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (588, 9, '2023-03-06 11:12:47', '员工离职:name:小明8984---workId:00009905', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (589, 9, '2023-03-06 11:12:47', '员工离职:name:小明8983---workId:00009904', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (590, 9, '2023-03-06 11:12:47', '员工离职:name:小明8982---workId:00009903', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (591, 9, '2023-03-06 11:12:47', '员工离职:name:小明8981---workId:00009902', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (592, 9, '2023-03-06 11:12:47', '员工离职:name:小明8980---workId:00009901', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (593, 9, '2023-03-06 11:12:47', '员工离职:name:小明8979---workId:00009900', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (594, 9, '2023-03-06 11:12:47', '员工离职:name:小明8978---workId:00009899', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (595, 9, '2023-03-06 11:12:47', '员工离职:name:小明8977---workId:00009898', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (596, 9, '2023-03-06 11:12:47', '员工离职:name:小明8976---workId:00009897', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (597, 9, '2023-03-06 11:12:47', '员工离职:name:小明8975---workId:00009896', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (598, 9, '2023-03-06 11:12:47', '员工离职:name:小明8974---workId:00009895', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (599, 9, '2023-03-06 11:12:47', '员工离职:name:小明8973---workId:00009894', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (600, 9, '2023-03-06 11:12:47', '员工离职:name:小明8972---workId:00009893', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (601, 9, '2023-03-06 11:12:47', '员工离职:name:小明8971---workId:00009892', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (602, 9, '2023-03-06 11:12:47', '员工离职:name:小明8970---workId:00009891', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (603, 9, '2023-03-06 11:12:47', '员工离职:name:小明8969---workId:00009890', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (604, 9, '2023-03-06 11:12:47', '员工离职:name:小明8968---workId:00009889', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (605, 9, '2023-03-06 11:12:47', '员工离职:name:小明8967---workId:00009888', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (606, 9, '2023-03-06 11:12:47', '员工离职:name:小明8966---workId:00009887', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (607, 9, '2023-03-06 11:12:47', '员工离职:name:小明8965---workId:00009886', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (608, 9, '2023-03-06 11:12:47', '员工离职:name:小明8964---workId:00009885', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (609, 9, '2023-03-06 11:12:47', '员工离职:name:小明8963---workId:00009884', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (610, 9, '2023-03-06 11:12:47', '员工离职:name:小明8962---workId:00009883', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (611, 9, '2023-03-06 11:12:48', '员工离职:name:小明8961---workId:00009882', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (612, 9, '2023-03-06 11:12:48', '员工离职:name:小明8960---workId:00009881', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (613, 9, '2023-03-06 11:12:48', '员工离职:name:小明8959---workId:00009880', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (614, 9, '2023-03-06 11:12:48', '员工离职:name:小明8958---workId:00009879', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (615, 9, '2023-03-06 11:12:48', '员工离职:name:小明8957---workId:00009878', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (616, 9, '2023-03-06 11:12:48', '员工离职:name:小明8956---workId:00009877', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (617, 9, '2023-03-06 11:12:48', '员工离职:name:小明8955---workId:00009876', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (618, 9, '2023-03-06 11:12:48', '员工离职:name:小明8954---workId:00009875', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (619, 9, '2023-03-06 11:12:48', '员工离职:name:小明8953---workId:00009874', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (620, 9, '2023-03-06 11:12:48', '员工离职:name:小明8952---workId:00009873', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (621, 9, '2023-03-06 11:12:48', '员工离职:name:小明8951---workId:00009872', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (622, 9, '2023-03-06 11:12:48', '员工离职:name:小明8950---workId:00009871', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (623, 9, '2023-03-06 11:12:48', '员工离职:name:小明8949---workId:00009870', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (624, 9, '2023-03-06 11:12:48', '员工离职:name:小明8948---workId:00009869', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (625, 9, '2023-03-06 11:12:48', '员工离职:name:小明8947---workId:00009868', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (626, 9, '2023-03-06 11:12:48', '员工离职:name:小明8946---workId:00009867', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (627, 9, '2023-03-06 11:12:48', '员工离职:name:小明8945---workId:00009866', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (628, 9, '2023-03-06 11:12:48', '员工离职:name:小明8944---workId:00009865', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (629, 9, '2023-03-06 11:12:48', '员工离职:name:小明8943---workId:00009864', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (630, 9, '2023-03-06 11:12:48', '员工离职:name:小明8942---workId:00009863', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (631, 9, '2023-03-06 11:12:48', '员工离职:name:小明8941---workId:00009862', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (632, 9, '2023-03-06 11:12:48', '员工离职:name:小明8940---workId:00009861', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (633, 9, '2023-03-06 11:12:48', '员工离职:name:小明8939---workId:00009860', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (634, 9, '2023-03-06 11:12:48', '员工离职:name:小明8938---workId:00009859', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (635, 9, '2023-03-06 11:12:48', '员工离职:name:小明8937---workId:00009858', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (636, 9, '2023-03-06 11:12:48', '员工离职:name:小明8936---workId:00009857', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (637, 9, '2023-03-06 11:12:48', '员工离职:name:小明8935---workId:00009856', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (638, 9, '2023-03-06 11:12:48', '员工离职:name:小明8934---workId:00009855', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (639, 9, '2023-03-06 11:12:48', '员工离职:name:小明8933---workId:00009854', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (640, 9, '2023-03-06 11:12:48', '员工离职:name:小明8932---workId:00009853', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (641, 9, '2023-03-06 11:12:48', '员工离职:name:小明8931---workId:00009852', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (642, 9, '2023-03-06 11:12:48', '员工离职:name:小明8930---workId:00009851', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (643, 9, '2023-03-06 11:12:48', '员工离职:name:小明8929---workId:00009850', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (644, 9, '2023-03-06 11:12:48', '员工离职:name:小明8928---workId:00009849', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (645, 9, '2023-03-06 11:12:48', '员工离职:name:小明8927---workId:00009848', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (646, 9, '2023-03-06 11:12:48', '员工离职:name:小明8926---workId:00009847', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (647, 9, '2023-03-06 11:12:48', '员工离职:name:小明8925---workId:00009846', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (648, 9, '2023-03-06 11:12:48', '员工离职:name:小明8924---workId:00009845', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (649, 9, '2023-03-06 11:12:48', '员工离职:name:小明8923---workId:00009844', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (650, 9, '2023-03-06 11:12:48', '员工离职:name:小明8922---workId:00009843', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (651, 9, '2023-03-06 11:12:48', '员工离职:name:小明8921---workId:00009842', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (652, 9, '2023-03-06 11:12:48', '员工离职:name:小明8920---workId:00009841', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (653, 9, '2023-03-06 11:12:48', '员工离职:name:小明8919---workId:00009840', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (654, 9, '2023-03-06 11:12:48', '员工离职:name:小明8918---workId:00009839', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (655, 9, '2023-03-06 11:12:48', '员工离职:name:小明8917---workId:00009838', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (656, 9, '2023-03-06 11:12:48', '员工离职:name:小明8916---workId:00009837', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (657, 9, '2023-03-06 11:12:49', '员工离职:name:小明8915---workId:00009836', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (658, 9, '2023-03-06 11:12:49', '员工离职:name:小明8914---workId:00009835', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (659, 9, '2023-03-06 11:12:49', '员工离职:name:小明8913---workId:00009834', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (660, 9, '2023-03-06 11:12:49', '员工离职:name:小明8912---workId:00009833', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (661, 9, '2023-03-06 11:12:49', '员工离职:name:小明8911---workId:00009832', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (662, 9, '2023-03-06 11:12:49', '员工离职:name:小明8910---workId:00009831', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (663, 9, '2023-03-06 11:12:49', '员工离职:name:小明8909---workId:00009830', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (664, 9, '2023-03-06 11:12:49', '员工离职:name:小明8908---workId:00009829', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (665, 9, '2023-03-06 11:12:49', '员工离职:name:小明8907---workId:00009828', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (666, 9, '2023-03-06 11:12:49', '员工离职:name:小明8906---workId:00009827', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (667, 9, '2023-03-06 11:12:49', '员工离职:name:小明8905---workId:00009826', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (668, 9, '2023-03-06 11:12:49', '员工离职:name:小明8904---workId:00009825', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (669, 9, '2023-03-06 11:12:49', '员工离职:name:小明8903---workId:00009824', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (670, 9, '2023-03-06 11:12:49', '员工离职:name:小明8902---workId:00009823', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (671, 9, '2023-03-06 11:12:49', '员工离职:name:小明8901---workId:00009822', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (672, 9, '2023-03-06 11:12:49', '员工离职:name:小明8900---workId:00009821', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (673, 9, '2023-03-06 11:12:49', '员工离职:name:小明8899---workId:00009820', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (674, 9, '2023-03-06 11:12:49', '员工离职:name:小明8898---workId:00009819', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (675, 9, '2023-03-06 11:12:49', '员工离职:name:小明8897---workId:00009818', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (676, 9, '2023-03-06 11:12:49', '员工离职:name:小明8896---workId:00009817', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (677, 9, '2023-03-06 11:12:49', '员工离职:name:小明8895---workId:00009816', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (678, 9, '2023-03-06 11:12:49', '员工离职:name:小明8894---workId:00009815', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (679, 9, '2023-03-06 11:12:49', '员工离职:name:小明8893---workId:00009814', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (680, 9, '2023-03-06 11:12:49', '员工离职:name:小明8892---workId:00009813', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (681, 9, '2023-03-06 11:12:50', '员工离职:name:小明8891---workId:00009812', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (682, 9, '2023-03-06 11:12:50', '员工离职:name:小明8890---workId:00009811', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (683, 9, '2023-03-06 11:12:50', '员工离职:name:小明8889---workId:00009810', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (684, 9, '2023-03-06 11:12:50', '员工离职:name:小明8888---workId:00009809', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (685, 9, '2023-03-06 11:12:50', '员工离职:name:小明8887---workId:00009808', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (686, 9, '2023-03-06 11:12:50', '员工离职:name:小明8886---workId:00009807', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (687, 9, '2023-03-06 11:12:50', '员工离职:name:小明8885---workId:00009806', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (688, 9, '2023-03-06 11:12:50', '员工离职:name:小明8884---workId:00009805', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (689, 9, '2023-03-06 11:12:50', '员工离职:name:小明8883---workId:00009804', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (690, 9, '2023-03-06 11:12:50', '员工离职:name:小明8882---workId:00009803', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (691, 9, '2023-03-06 11:12:50', '员工离职:name:小明8881---workId:00009802', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (692, 9, '2023-03-06 11:12:50', '员工离职:name:小明8880---workId:00009801', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (693, 9, '2023-03-06 11:12:50', '员工离职:name:小明8879---workId:00009800', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (694, 9, '2023-03-06 11:12:50', '员工离职:name:小明8878---workId:00009799', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (695, 9, '2023-03-06 11:12:50', '员工离职:name:小明8877---workId:00009798', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (696, 9, '2023-03-06 11:12:50', '员工离职:name:小明8876---workId:00009797', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (697, 9, '2023-03-06 11:12:50', '员工离职:name:小明8875---workId:00009796', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (698, 9, '2023-03-06 11:12:50', '员工离职:name:小明8874---workId:00009795', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (699, 9, '2023-03-06 11:12:50', '员工离职:name:小明8873---workId:00009794', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (700, 9, '2023-03-06 11:12:50', '员工离职:name:小明8872---workId:00009793', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (701, 9, '2023-03-06 11:12:50', '员工离职:name:小明8871---workId:00009792', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (702, 9, '2023-03-06 11:12:50', '员工离职:name:小明8870---workId:00009791', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (703, 9, '2023-03-06 11:12:50', '员工离职:name:小明8869---workId:00009790', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (704, 9, '2023-03-06 11:12:50', '员工离职:name:小明8868---workId:00009789', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (705, 9, '2023-03-06 11:12:50', '员工离职:name:小明8867---workId:00009788', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (706, 9, '2023-03-06 11:12:50', '员工离职:name:小明8866---workId:00009787', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (707, 9, '2023-03-06 11:12:50', '员工离职:name:小明8866---workId:00009787', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (708, 9, '2023-03-06 11:12:51', '员工离职:name:小明8865---workId:00009786', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (709, 9, '2023-03-06 11:12:51', '员工离职:name:小明8864---workId:00009785', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (710, 9, '2023-03-06 11:12:51', '员工离职:name:小明8863---workId:00009784', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (711, 9, '2023-03-06 11:12:51', '员工离职:name:小明8862---workId:00009783', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (712, 9, '2023-03-06 11:12:51', '员工离职:name:小明8861---workId:00009782', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (713, 9, '2023-03-06 11:12:51', '员工离职:name:小明8860---workId:00009781', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (714, 9, '2023-03-06 11:12:51', '员工离职:name:小明8859---workId:00009780', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (715, 9, '2023-03-06 11:12:51', '员工离职:name:小明8858---workId:00009779', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (716, 9, '2023-03-06 11:12:51', '员工离职:name:小明8857---workId:00009778', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (717, 9, '2023-03-06 11:12:51', '员工离职:name:小明8856---workId:00009777', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (718, 9, '2023-03-06 11:12:51', '员工离职:name:小明8855---workId:00009776', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (719, 9, '2023-03-06 11:12:51', '员工离职:name:小明8854---workId:00009775', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (720, 9, '2023-03-06 11:12:51', '员工离职:name:小明8853---workId:00009774', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (721, 9, '2023-03-06 11:12:51', '员工离职:name:小明8852---workId:00009773', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (722, 9, '2023-03-06 11:12:51', '员工离职:name:小明8851---workId:00009772', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (723, 9, '2023-03-06 11:12:51', '员工离职:name:小明8850---workId:00009771', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (724, 9, '2023-03-06 11:12:51', '员工离职:name:小明8849---workId:00009770', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (725, 9, '2023-03-06 11:12:51', '员工离职:name:小明8848---workId:00009769', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (726, 9, '2023-03-06 11:12:51', '员工离职:name:小明8847---workId:00009768', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (727, 9, '2023-03-06 11:12:51', '员工离职:name:小明8846---workId:00009767', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (728, 9, '2023-03-06 11:12:51', '员工离职:name:小明8845---workId:00009766', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (729, 9, '2023-03-06 11:12:51', '员工离职:name:小明8844---workId:00009765', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (730, 9, '2023-03-06 11:12:51', '员工离职:name:小明8843---workId:00009764', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (731, 9, '2023-03-06 11:12:51', '员工离职:name:小明8842---workId:00009763', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (732, 9, '2023-03-06 11:12:51', '员工离职:name:小明8841---workId:00009762', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (733, 9, '2023-03-06 11:12:52', '员工离职:name:小明8840---workId:00009761', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (734, 9, '2023-03-06 11:12:52', '员工离职:name:小明8839---workId:00009760', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (735, 9, '2023-03-06 11:12:52', '员工离职:name:小明8838---workId:00009759', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (736, 9, '2023-03-06 11:12:52', '员工离职:name:小明8837---workId:00009758', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (737, 9, '2023-03-06 11:12:52', '员工离职:name:小明8836---workId:00009757', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (738, 9, '2023-03-06 11:12:52', '员工离职:name:小明8835---workId:00009756', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (739, 9, '2023-03-06 11:12:52', '员工离职:name:小明8834---workId:00009755', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (740, 9, '2023-03-06 11:12:52', '员工离职:name:小明8833---workId:00009754', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (741, 9, '2023-03-06 11:12:52', '员工离职:name:小明8832---workId:00009753', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (742, 9, '2023-03-06 11:12:52', '员工离职:name:小明8831---workId:00009752', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (743, 9, '2023-03-06 11:12:52', '员工离职:name:小明8830---workId:00009751', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (744, 9, '2023-03-06 11:12:52', '员工离职:name:小明8829---workId:00009750', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (745, 9, '2023-03-06 11:12:52', '员工离职:name:小明8828---workId:00009749', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (746, 9, '2023-03-06 11:12:52', '员工离职:name:小明8827---workId:00009748', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (747, 9, '2023-03-06 11:12:52', '员工离职:name:小明8826---workId:00009747', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (748, 9, '2023-03-06 11:12:52', '员工离职:name:小明8825---workId:00009746', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (749, 9, '2023-03-06 11:12:52', '员工离职:name:小明8824---workId:00009745', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (750, 9, '2023-03-06 11:12:52', '员工离职:name:小明8823---workId:00009744', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (751, 9, '2023-03-06 11:12:52', '员工离职:name:小明8822---workId:00009743', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (752, 9, '2023-03-06 11:12:52', '员工离职:name:小明8821---workId:00009742', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (753, 9, '2023-03-06 11:12:52', '员工离职:name:小明8820---workId:00009741', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (754, 9, '2023-03-06 11:12:52', '员工离职:name:小明8819---workId:00009740', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (755, 9, '2023-03-06 11:12:52', '员工离职:name:小明8818---workId:00009739', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (756, 9, '2023-03-06 11:12:52', '员工离职:name:小明8817---workId:00009738', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (757, 9, '2023-03-06 11:12:52', '员工离职:name:小明8816---workId:00009737', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (758, 9, '2023-03-06 11:12:52', '员工离职:name:小明8815---workId:00009736', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (759, 9, '2023-03-06 11:12:52', '员工离职:name:小明8814---workId:00009735', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (760, 9, '2023-03-06 11:12:52', '员工离职:name:小明8813---workId:00009734', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (761, 9, '2023-03-06 11:12:52', '员工离职:name:小明8812---workId:00009733', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (762, 9, '2023-03-06 11:12:52', '员工离职:name:小明8811---workId:00009732', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (763, 9, '2023-03-06 11:12:52', '员工离职:name:小明8810---workId:00009731', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (764, 9, '2023-03-06 11:12:52', '员工离职:name:小明8809---workId:00009730', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (765, 9, '2023-03-06 11:12:52', '员工离职:name:小明8808---workId:00009729', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (766, 9, '2023-03-06 11:12:52', '员工离职:name:小明8807---workId:00009728', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (767, 9, '2023-03-06 11:12:52', '员工离职:name:小明8806---workId:00009727', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (768, 9, '2023-03-06 11:12:52', '员工离职:name:小明8805---workId:00009726', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (769, 9, '2023-03-06 11:12:52', '员工离职:name:小明8804---workId:00009725', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (770, 9, '2023-03-06 11:12:52', '员工离职:name:小明8803---workId:00009724', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (771, 9, '2023-03-06 11:12:52', '员工离职:name:小明8802---workId:00009723', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (772, 9, '2023-03-06 11:12:52', '员工离职:name:小明8801---workId:00009722', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (773, 9, '2023-03-06 11:12:52', '员工离职:name:小明8800---workId:00009721', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (774, 9, '2023-03-06 11:12:53', '员工离职:name:小明8799---workId:00009720', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (775, 9, '2023-03-06 11:12:53', '员工离职:name:小明8798---workId:00009719', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (776, 9, '2023-03-06 11:12:53', '员工离职:name:小明8797---workId:00009718', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (777, 9, '2023-03-06 11:12:53', '员工离职:name:小明8796---workId:00009717', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (778, 9, '2023-03-06 11:12:53', '员工离职:name:小明8795---workId:00009716', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (779, 9, '2023-03-06 11:12:53', '员工离职:name:小明8794---workId:00009715', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (780, 9, '2023-03-06 11:12:53', '员工离职:name:小明8793---workId:00009714', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (781, 9, '2023-03-06 11:12:53', '员工离职:name:小明8792---workId:00009713', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (782, 9, '2023-03-06 11:12:53', '员工离职:name:小明8791---workId:00009712', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (783, 9, '2023-03-06 11:12:53', '员工离职:name:小明8790---workId:00009711', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (784, 9, '2023-03-06 11:12:53', '员工离职:name:小明8789---workId:00009710', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (785, 9, '2023-03-06 11:12:53', '员工离职:name:小明8788---workId:00009709', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (786, 9, '2023-03-06 11:12:53', '员工离职:name:小明8787---workId:00009708', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (787, 9, '2023-03-06 11:12:53', '员工离职:name:小明8786---workId:00009707', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (788, 9, '2023-03-06 11:12:53', '员工离职:name:小明8785---workId:00009706', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (789, 9, '2023-03-06 11:12:53', '员工离职:name:小明8784---workId:00009705', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (790, 9, '2023-03-06 11:12:53', '员工离职:name:小明8783---workId:00009704', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (791, 9, '2023-03-06 11:13:04', '员工批量离职:name:', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (792, 9, '2023-03-06 11:13:04', '员工离职:name:小明8782---workId:00009703', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (793, 9, '2023-03-06 11:13:04', '员工离职:name:小明8781---workId:00009702', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (794, 9, '2023-03-06 11:13:04', '员工离职:name:小明8780---workId:00009701', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (795, 9, '2023-03-06 11:13:04', '员工离职:name:小明8779---workId:00009700', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (796, 9, '2023-03-06 11:13:04', '员工离职:name:小明8778---workId:00009699', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (797, 9, '2023-03-06 11:13:04', '员工离职:name:小明8777---workId:00009698', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (798, 9, '2023-03-06 11:13:04', '员工离职:name:小明8776---workId:00009697', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (799, 9, '2023-03-06 11:13:04', '员工离职:name:小明8775---workId:00009696', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (800, 9, '2023-03-06 11:13:04', '员工离职:name:小明8774---workId:00009695', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (801, 9, '2023-03-06 11:13:04', '员工离职:name:小明8773---workId:00009694', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (802, 9, '2023-03-06 11:13:04', '员工离职:name:小明8772---workId:00009693', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (803, 9, '2023-03-06 11:13:04', '员工离职:name:小明8771---workId:00009692', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (804, 9, '2023-03-06 11:13:04', '员工离职:name:小明8770---workId:00009691', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (805, 9, '2023-03-06 11:13:05', '员工离职:name:小明8769---workId:00009690', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (806, 9, '2023-03-06 11:13:05', '员工离职:name:小明8768---workId:00009689', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (807, 9, '2023-03-06 11:13:05', '员工离职:name:小明8767---workId:00009688', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (808, 9, '2023-03-06 11:13:05', '员工离职:name:小明8766---workId:00009687', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (809, 9, '2023-03-06 11:13:05', '员工离职:name:小明8765---workId:00009686', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (810, 9, '2023-03-06 11:13:05', '员工离职:name:小明8764---workId:00009685', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (811, 9, '2023-03-06 11:13:05', '员工离职:name:小明8763---workId:00009684', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (812, 9, '2023-03-06 11:13:05', '员工离职:name:小明8762---workId:00009683', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (813, 9, '2023-03-06 11:13:05', '员工离职:name:小明8761---workId:00009682', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (814, 9, '2023-03-06 11:13:05', '员工离职:name:小明8760---workId:00009681', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (815, 9, '2023-03-06 11:13:05', '员工离职:name:小明8759---workId:00009680', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (816, 9, '2023-03-06 11:13:05', '员工离职:name:小明8758---workId:00009679', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (817, 9, '2023-03-06 11:13:05', '员工离职:name:小明8757---workId:00009678', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (818, 9, '2023-03-06 11:13:05', '员工离职:name:小明8756---workId:00009677', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (819, 9, '2023-03-06 11:13:05', '员工离职:name:小明8755---workId:00009676', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (820, 9, '2023-03-06 11:13:05', '员工离职:name:小明8754---workId:00009675', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (821, 9, '2023-03-06 11:13:05', '员工离职:name:小明8753---workId:00009674', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (822, 9, '2023-03-06 11:13:05', '员工离职:name:小明8752---workId:00009673', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (823, 9, '2023-03-06 11:13:05', '员工离职:name:小明8751---workId:00009672', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (824, 9, '2023-03-06 11:13:05', '员工离职:name:小明8750---workId:00009671', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (825, 9, '2023-03-06 11:13:05', '员工离职:name:小明8749---workId:00009670', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (826, 9, '2023-03-06 11:13:05', '员工离职:name:小明8748---workId:00009669', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (827, 9, '2023-03-06 11:13:05', '员工离职:name:小明8747---workId:00009668', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (828, 9, '2023-03-06 11:13:05', '员工离职:name:小明8746---workId:00009667', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (829, 9, '2023-03-06 11:13:05', '员工离职:name:小明8745---workId:00009666', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (830, 9, '2023-03-06 11:13:05', '员工离职:name:小明8744---workId:00009665', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (831, 9, '2023-03-06 11:13:05', '员工离职:name:小明8743---workId:00009664', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (832, 9, '2023-03-06 11:13:05', '员工离职:name:小明8742---workId:00009663', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (833, 9, '2023-03-06 11:13:05', '员工离职:name:小明8741---workId:00009662', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (834, 9, '2023-03-06 11:13:05', '员工离职:name:小明8740---workId:00009661', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (835, 9, '2023-03-06 11:13:05', '员工离职:name:小明8739---workId:00009660', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (836, 9, '2023-03-06 11:13:05', '员工离职:name:小明8738---workId:00009659', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (837, 9, '2023-03-06 11:13:05', '员工离职:name:小明8737---workId:00009658', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (838, 9, '2023-03-06 11:13:05', '员工离职:name:小明8736---workId:00009657', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (839, 9, '2023-03-06 11:13:05', '员工离职:name:小明8735---workId:00009656', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (840, 9, '2023-03-06 11:13:05', '员工离职:name:小明8734---workId:00009655', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (841, 9, '2023-03-06 11:13:05', '员工离职:name:小明8733---workId:00009654', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (842, 9, '2023-03-06 11:13:05', '员工离职:name:小明8732---workId:00009653', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (843, 9, '2023-03-06 11:13:05', '员工离职:name:小明8731---workId:00009652', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (844, 9, '2023-03-06 11:13:05', '员工离职:name:小明8730---workId:00009651', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (845, 9, '2023-03-06 11:13:05', '员工离职:name:小明8729---workId:00009650', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (846, 9, '2023-03-06 11:13:05', '员工离职:name:小明8728---workId:00009649', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (847, 9, '2023-03-06 11:13:05', '员工离职:name:小明8727---workId:00009648', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (848, 9, '2023-03-06 11:13:05', '员工离职:name:小明8726---workId:00009647', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (849, 9, '2023-03-06 11:13:06', '员工离职:name:小明8725---workId:00009646', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (850, 9, '2023-03-06 11:13:06', '员工离职:name:小明8724---workId:00009645', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (851, 9, '2023-03-06 11:13:06', '员工离职:name:小明8723---workId:00009644', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (852, 9, '2023-03-06 11:13:06', '员工离职:name:小明8722---workId:00009643', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (853, 9, '2023-03-06 11:13:06', '员工离职:name:小明8721---workId:00009642', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (854, 9, '2023-03-06 11:13:06', '员工离职:name:小明8720---workId:00009641', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (855, 9, '2023-03-06 11:13:06', '员工离职:name:小明8719---workId:00009640', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (856, 9, '2023-03-06 11:13:06', '员工离职:name:小明8718---workId:00009639', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (857, 9, '2023-03-06 11:13:06', '员工离职:name:小明8717---workId:00009638', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (858, 9, '2023-03-06 11:13:06', '员工离职:name:小明8716---workId:00009637', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (859, 9, '2023-03-06 11:13:06', '员工离职:name:小明8715---workId:00009636', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (860, 9, '2023-03-06 11:13:06', '员工离职:name:小明8714---workId:00009635', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (861, 9, '2023-03-06 11:13:06', '员工离职:name:小明8713---workId:00009634', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (862, 9, '2023-03-06 11:13:06', '员工离职:name:小明8712---workId:00009633', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (863, 9, '2023-03-06 11:13:06', '员工离职:name:小明8711---workId:00009632', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (864, 9, '2023-03-06 11:13:06', '员工离职:name:小明8710---workId:00009631', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (865, 9, '2023-03-06 11:13:06', '员工离职:name:小明8709---workId:00009630', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (866, 9, '2023-03-06 11:13:06', '员工离职:name:小明8708---workId:00009629', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (867, 9, '2023-03-06 11:13:06', '员工离职:name:小明8707---workId:00009628', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (868, 9, '2023-03-06 11:13:06', '员工离职:name:小明8706---workId:00009627', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (869, 9, '2023-03-06 11:13:06', '员工离职:name:小明8705---workId:00009626', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (870, 9, '2023-03-06 11:13:06', '员工离职:name:小明8704---workId:00009625', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (871, 9, '2023-03-06 11:13:06', '员工离职:name:小明8703---workId:00009624', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (872, 9, '2023-03-06 11:13:06', '员工离职:name:小明8702---workId:00009623', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (873, 9, '2023-03-06 11:13:06', '员工离职:name:小明8701---workId:00009622', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (874, 9, '2023-03-06 11:13:06', '员工离职:name:小明8700---workId:00009621', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (875, 9, '2023-03-06 11:13:06', '员工离职:name:小明8699---workId:00009620', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (876, 9, '2023-03-06 11:13:06', '员工离职:name:小明8698---workId:00009619', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (877, 9, '2023-03-06 11:13:06', '员工离职:name:小明8697---workId:00009618', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (878, 9, '2023-03-06 11:13:06', '员工离职:name:小明8696---workId:00009617', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (879, 9, '2023-03-06 11:13:06', '员工离职:name:小明8695---workId:00009616', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (880, 9, '2023-03-06 11:13:06', '员工离职:name:小明8694---workId:00009615', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (881, 9, '2023-03-06 11:13:06', '员工离职:name:小明8693---workId:00009614', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (882, 9, '2023-03-06 11:13:06', '员工离职:name:小明8692---workId:00009613', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (883, 9, '2023-03-06 11:13:06', '员工离职:name:小明8691---workId:00009612', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (884, 9, '2023-03-06 11:13:06', '员工离职:name:小明8690---workId:00009611', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (885, 9, '2023-03-06 11:13:06', '员工离职:name:小明8689---workId:00009610', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (886, 9, '2023-03-06 11:13:06', '员工离职:name:小明8688---workId:00009609', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (887, 9, '2023-03-06 11:13:06', '员工离职:name:小明8687---workId:00009608', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (888, 9, '2023-03-06 11:13:06', '员工离职:name:小明8686---workId:00009607', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (889, 9, '2023-03-06 11:13:06', '员工离职:name:小明8685---workId:00009606', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (890, 9, '2023-03-06 11:13:06', '员工离职:name:小明8684---workId:00009605', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (891, 9, '2023-03-06 11:13:06', '员工离职:name:小明8683---workId:00009604', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (892, 9, '2023-03-06 11:13:06', '员工离职:name:小明8682---workId:00009603', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (893, 9, '2023-03-06 11:13:06', '员工离职:name:小明8681---workId:00009602', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (894, 9, '2023-03-06 11:13:06', '员工离职:name:小明8680---workId:00009601', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (895, 9, '2023-03-06 11:13:06', '员工离职:name:小明8679---workId:00009600', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (896, 9, '2023-03-06 11:13:06', '员工离职:name:小明8678---workId:00009599', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (897, 9, '2023-03-06 11:13:07', '员工离职:name:小明8677---workId:00009598', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (898, 9, '2023-03-06 11:13:07', '员工离职:name:小明8676---workId:00009597', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (899, 9, '2023-03-06 11:13:07', '员工离职:name:小明8675---workId:00009596', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (900, 9, '2023-03-06 11:13:07', '员工离职:name:小明8674---workId:00009595', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (901, 9, '2023-03-06 11:13:07', '员工离职:name:小明8673---workId:00009594', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (902, 9, '2023-03-06 11:13:07', '员工离职:name:小明8672---workId:00009593', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (903, 9, '2023-03-06 11:13:07', '员工离职:name:小明8671---workId:00009592', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (904, 9, '2023-03-06 11:13:07', '员工离职:name:小明8670---workId:00009591', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (905, 9, '2023-03-06 11:13:07', '员工离职:name:小明8669---workId:00009590', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (906, 9, '2023-03-06 11:13:07', '员工离职:name:小明8668---workId:00009589', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (907, 9, '2023-03-06 11:13:07', '员工离职:name:小明8667---workId:00009588', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (908, 9, '2023-03-06 11:13:07', '员工离职:name:小明8666---workId:00009587', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (909, 9, '2023-03-06 11:13:07', '员工离职:name:小明8665---workId:00009586', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (910, 9, '2023-03-06 11:13:07', '员工离职:name:小明8664---workId:00009585', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (911, 9, '2023-03-06 11:13:07', '员工离职:name:小明8663---workId:00009584', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (912, 9, '2023-03-06 11:13:07', '员工离职:name:小明8662---workId:00009583', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (913, 9, '2023-03-06 11:13:07', '员工离职:name:小明8661---workId:00009582', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (914, 9, '2023-03-06 11:13:07', '员工离职:name:小明8660---workId:00009581', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (915, 9, '2023-03-06 11:13:07', '员工离职:name:小明8659---workId:00009580', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (916, 9, '2023-03-06 11:13:07', '员工离职:name:小明8658---workId:00009579', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (917, 9, '2023-03-06 11:13:07', '员工离职:name:小明8657---workId:00009578', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (918, 9, '2023-03-06 11:13:07', '员工离职:name:小明8656---workId:00009577', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (919, 9, '2023-03-06 11:13:07', '员工离职:name:小明8655---workId:00009576', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (920, 9, '2023-03-06 11:13:07', '员工离职:name:小明8654---workId:00009575', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (921, 9, '2023-03-06 11:13:07', '员工离职:name:小明8653---workId:00009574', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (922, 9, '2023-03-06 11:13:07', '员工离职:name:小明8652---workId:00009573', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (923, 9, '2023-03-06 11:13:07', '员工离职:name:小明8651---workId:00009572', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (924, 9, '2023-03-06 11:13:07', '员工离职:name:小明8650---workId:00009571', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (925, 9, '2023-03-06 11:13:07', '员工离职:name:小明8649---workId:00009570', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (926, 9, '2023-03-06 11:13:07', '员工离职:name:小明8648---workId:00009569', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (927, 9, '2023-03-06 11:13:07', '员工离职:name:小明8647---workId:00009568', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (928, 9, '2023-03-06 11:13:07', '员工离职:name:小明8646---workId:00009567', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (929, 9, '2023-03-06 11:13:07', '员工离职:name:小明8645---workId:00009566', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (930, 9, '2023-03-06 11:13:07', '员工离职:name:小明8644---workId:00009565', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (931, 9, '2023-03-06 11:13:07', '员工离职:name:小明8643---workId:00009564', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (932, 9, '2023-03-06 11:13:07', '员工离职:name:小明8642---workId:00009563', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (933, 9, '2023-03-06 11:13:07', '员工离职:name:小明8641---workId:00009562', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (934, 9, '2023-03-06 11:13:07', '员工离职:name:小明8640---workId:00009561', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (935, 9, '2023-03-06 11:13:07', '员工离职:name:小明8639---workId:00009560', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (936, 9, '2023-03-06 11:13:07', '员工离职:name:小明8638---workId:00009559', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (937, 9, '2023-03-06 11:13:07', '员工离职:name:小明8637---workId:00009558', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (938, 9, '2023-03-06 11:13:07', '员工离职:name:小明8636---workId:00009557', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (939, 9, '2023-03-06 11:13:07', '员工离职:name:小明8635---workId:00009556', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (940, 9, '2023-03-06 11:13:07', '员工离职:name:小明8634---workId:00009555', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (941, 9, '2023-03-06 11:13:07', '员工离职:name:小明8633---workId:00009554', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (942, 9, '2023-03-06 11:13:07', '员工离职:name:小明8632---workId:00009553', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (943, 9, '2023-03-06 11:13:07', '员工离职:name:小明8631---workId:00009552', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (944, 9, '2023-03-06 11:13:07', '员工离职:name:小明8630---workId:00009551', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (945, 9, '2023-03-06 11:13:08', '员工离职:name:小明8629---workId:00009550', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (946, 9, '2023-03-06 11:13:08', '员工离职:name:小明8628---workId:00009549', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (947, 9, '2023-03-06 11:13:08', '员工离职:name:小明8627---workId:00009548', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (948, 9, '2023-03-06 11:13:08', '员工离职:name:小明8626---workId:00009547', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (949, 9, '2023-03-06 11:13:08', '员工离职:name:小明8625---workId:00009546', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (950, 9, '2023-03-06 11:13:08', '员工离职:name:小明8624---workId:00009545', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (951, 9, '2023-03-06 11:13:08', '员工离职:name:小明8623---workId:00009544', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (952, 9, '2023-03-06 11:13:08', '员工离职:name:小明8622---workId:00009543', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (953, 9, '2023-03-06 11:13:08', '员工离职:name:小明8621---workId:00009542', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (954, 9, '2023-03-06 11:13:08', '员工离职:name:小明8620---workId:00009541', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (955, 9, '2023-03-06 11:13:08', '员工离职:name:小明8619---workId:00009540', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (956, 9, '2023-03-06 11:13:08', '员工离职:name:小明8618---workId:00009539', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (957, 9, '2023-03-06 11:13:08', '员工离职:name:小明8617---workId:00009538', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (958, 9, '2023-03-06 11:13:08', '员工离职:name:小明8616---workId:00009537', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (959, 9, '2023-03-06 11:13:08', '员工离职:name:小明8615---workId:00009536', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (960, 9, '2023-03-06 11:13:08', '员工离职:name:小明8614---workId:00009535', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (961, 9, '2023-03-06 11:13:08', '员工离职:name:小明8613---workId:00009534', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (962, 9, '2023-03-06 11:13:08', '员工离职:name:小明8612---workId:00009533', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (963, 9, '2023-03-06 11:13:08', '员工离职:name:小明8611---workId:00009532', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (964, 9, '2023-03-06 11:13:08', '员工离职:name:小明8610---workId:00009531', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (965, 9, '2023-03-06 11:13:08', '员工离职:name:小明8609---workId:00009530', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (966, 9, '2023-03-06 11:13:08', '员工离职:name:小明8608---workId:00009529', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (967, 9, '2023-03-06 11:13:08', '员工离职:name:小明8607---workId:00009528', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (968, 9, '2023-03-06 11:13:08', '员工离职:name:小明8606---workId:00009527', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (969, 9, '2023-03-06 11:13:08', '员工离职:name:小明8605---workId:00009526', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (970, 9, '2023-03-06 11:13:08', '员工离职:name:小明8604---workId:00009525', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (971, 9, '2023-03-06 11:13:08', '员工离职:name:小明8603---workId:00009524', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (972, 9, '2023-03-06 11:13:08', '员工离职:name:小明8602---workId:00009523', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (973, 9, '2023-03-06 11:13:08', '员工离职:name:小明8601---workId:00009522', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (974, 9, '2023-03-06 11:13:08', '员工离职:name:小明8600---workId:00009521', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (975, 9, '2023-03-06 11:13:08', '员工离职:name:小明8599---workId:00009520', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (976, 9, '2023-03-06 11:13:08', '员工离职:name:小明8598---workId:00009519', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (977, 9, '2023-03-06 11:13:08', '员工离职:name:小明8597---workId:00009518', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (978, 9, '2023-03-06 11:13:08', '员工离职:name:小明8596---workId:00009517', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (979, 9, '2023-03-06 11:13:08', '员工离职:name:小明8595---workId:00009516', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (980, 9, '2023-03-06 11:13:08', '员工离职:name:小明8594---workId:00009515', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (981, 9, '2023-03-06 11:13:08', '员工离职:name:小明8593---workId:00009514', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (982, 9, '2023-03-06 11:13:08', '员工离职:name:小明8592---workId:00009513', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (983, 9, '2023-03-06 11:13:08', '员工离职:name:小明8591---workId:00009512', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (984, 9, '2023-03-06 11:13:08', '员工离职:name:小明8590---workId:00009511', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (985, 9, '2023-03-06 11:13:08', '员工离职:name:小明8589---workId:00009510', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (986, 9, '2023-03-06 11:13:08', '员工离职:name:小明8588---workId:00009509', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (987, 9, '2023-03-06 11:13:08', '员工离职:name:小明8587---workId:00009508', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (988, 9, '2023-03-06 11:13:08', '员工离职:name:小明8586---workId:00009507', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (989, 9, '2023-03-06 11:13:09', '员工离职:name:小明8585---workId:00009506', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (990, 9, '2023-03-06 11:13:09', '员工离职:name:小明8584---workId:00009505', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (991, 9, '2023-03-06 11:13:09', '员工离职:name:小明8583---workId:00009504', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (992, 9, '2023-03-06 11:13:09', '员工离职:name:小明8582---workId:00009503', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (993, 9, '2023-03-06 11:13:09', '员工离职:name:小明8581---workId:00009502', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (994, 9, '2023-03-06 11:13:09', '员工离职:name:小明8580---workId:00009501', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (995, 9, '2023-03-06 11:13:09', '员工离职:name:小明8579---workId:00009500', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (996, 9, '2023-03-06 11:13:09', '员工离职:name:小明8578---workId:00009499', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (997, 9, '2023-03-06 11:13:09', '员工离职:name:小明8577---workId:00009498', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (998, 9, '2023-03-06 11:13:09', '员工离职:name:小明8576---workId:00009497', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (999, 9, '2023-03-06 11:13:09', '员工离职:name:小明8575---workId:00009496', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1000, 9, '2023-03-06 11:13:09', '员工离职:name:小明8574---workId:00009495', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1001, 9, '2023-03-06 11:13:09', '员工离职:name:小明8573---workId:00009494', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1002, 9, '2023-03-06 11:13:09', '员工离职:name:小明8572---workId:00009493', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1003, 9, '2023-03-06 11:13:09', '员工离职:name:小明8571---workId:00009492', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1004, 9, '2023-03-06 11:13:09', '员工离职:name:小明8570---workId:00009491', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1005, 9, '2023-03-06 11:13:09', '员工离职:name:小明8569---workId:00009490', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1006, 9, '2023-03-06 11:13:09', '员工离职:name:小明8568---workId:00009489', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1007, 9, '2023-03-06 11:13:09', '员工离职:name:小明8567---workId:00009488', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1008, 9, '2023-03-06 11:13:09', '员工离职:name:小明8566---workId:00009487', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1009, 9, '2023-03-06 11:13:09', '员工离职:name:小明8565---workId:00009486', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1010, 9, '2023-03-06 11:13:09', '员工离职:name:小明8564---workId:00009485', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1011, 9, '2023-03-06 11:13:09', '员工离职:name:小明8563---workId:00009484', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1012, 9, '2023-03-06 11:13:09', '员工离职:name:小明8562---workId:00009483', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1013, 9, '2023-03-06 11:13:09', '员工离职:name:小明8561---workId:00009482', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1014, 9, '2023-03-06 11:13:09', '员工离职:name:小明8560---workId:00009481', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1015, 9, '2023-03-06 11:13:09', '员工离职:name:小明8559---workId:00009480', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1016, 9, '2023-03-06 11:13:09', '员工离职:name:小明8558---workId:00009479', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1017, 9, '2023-03-06 11:13:09', '员工离职:name:小明8557---workId:00009478', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1018, 9, '2023-03-06 11:13:09', '员工离职:name:小明8556---workId:00009477', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1019, 9, '2023-03-06 11:13:09', '员工离职:name:小明8555---workId:00009476', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1020, 9, '2023-03-06 11:13:09', '员工离职:name:小明8554---workId:00009475', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1021, 9, '2023-03-06 11:13:09', '员工离职:name:小明8553---workId:00009474', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1022, 9, '2023-03-06 11:13:09', '员工离职:name:小明8552---workId:00009473', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1023, 9, '2023-03-06 11:13:10', '员工离职:name:小明8551---workId:00009472', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1024, 9, '2023-03-06 11:13:10', '员工离职:name:小明8550---workId:00009471', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1025, 9, '2023-03-06 11:13:10', '员工离职:name:小明8549---workId:00009470', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1026, 9, '2023-03-06 11:13:10', '员工离职:name:小明8548---workId:00009469', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1027, 9, '2023-03-06 11:13:10', '员工离职:name:小明8547---workId:00009468', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1028, 9, '2023-03-06 11:13:10', '员工离职:name:小明8546---workId:00009467', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1029, 9, '2023-03-06 11:13:10', '员工离职:name:小明8545---workId:00009466', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1030, 9, '2023-03-06 11:13:10', '员工离职:name:小明8544---workId:00009465', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1031, 9, '2023-03-06 11:13:10', '员工离职:name:小明8543---workId:00009464', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1032, 9, '2023-03-06 11:13:10', '员工离职:name:小明8542---workId:00009463', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1033, 9, '2023-03-06 11:13:10', '员工离职:name:小明8541---workId:00009462', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1034, 9, '2023-03-06 11:13:10', '员工离职:name:小明8540---workId:00009461', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1035, 9, '2023-03-06 11:13:10', '员工离职:name:小明8539---workId:00009460', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1036, 9, '2023-03-06 11:13:10', '员工离职:name:小明8538---workId:00009459', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1037, 9, '2023-03-06 11:13:10', '员工离职:name:小明8537---workId:00009458', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1038, 9, '2023-03-06 11:13:10', '员工离职:name:小明8536---workId:00009457', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1039, 9, '2023-03-06 11:13:10', '员工离职:name:小明8535---workId:00009456', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1040, 9, '2023-03-06 11:13:10', '员工离职:name:小明8534---workId:00009455', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1041, 9, '2023-03-06 11:13:10', '员工离职:name:小明8533---workId:00009454', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1042, 9, '2023-03-06 11:13:10', '员工离职:name:小明8532---workId:00009453', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1043, 9, '2023-03-06 11:13:10', '员工离职:name:小明8531---workId:00009452', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1044, 9, '2023-03-06 11:13:10', '员工离职:name:小明8530---workId:00009451', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1045, 9, '2023-03-06 11:13:10', '员工离职:name:小明8529---workId:00009450', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1046, 9, '2023-03-06 11:13:10', '员工离职:name:小明8528---workId:00009449', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1047, 9, '2023-03-06 11:13:10', '员工离职:name:小明8527---workId:00009448', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1048, 9, '2023-03-06 11:13:10', '员工离职:name:小明8526---workId:00009447', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1049, 9, '2023-03-06 11:13:10', '员工离职:name:小明8525---workId:00009446', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1050, 9, '2023-03-06 11:13:10', '员工离职:name:小明8524---workId:00009445', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1051, 9, '2023-03-06 11:13:10', '员工离职:name:小明8523---workId:00009444', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1052, 9, '2023-03-06 11:13:10', '员工离职:name:小明8522---workId:00009443', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1053, 9, '2023-03-06 11:13:10', '员工离职:name:小明8521---workId:00009442', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1054, 9, '2023-03-06 11:13:10', '员工离职:name:小明8520---workId:00009441', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1055, 9, '2023-03-06 11:13:10', '员工离职:name:小明8519---workId:00009440', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1056, 9, '2023-03-06 11:13:10', '员工离职:name:小明8518---workId:00009439', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1057, 9, '2023-03-06 11:13:10', '员工离职:name:小明8517---workId:00009438', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1058, 9, '2023-03-06 11:13:10', '员工离职:name:小明8516---workId:00009437', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1059, 9, '2023-03-06 11:13:10', '员工离职:name:小明8515---workId:00009436', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1060, 9, '2023-03-06 11:13:10', '员工离职:name:小明8514---workId:00009435', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1061, 9, '2023-03-06 11:13:10', '员工离职:name:小明8513---workId:00009434', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1062, 9, '2023-03-06 11:13:10', '员工离职:name:小明8512---workId:00009433', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1063, 9, '2023-03-06 11:13:10', '员工离职:name:小明8511---workId:00009432', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1064, 9, '2023-03-06 11:13:10', '员工离职:name:小明8510---workId:00009431', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1065, 9, '2023-03-06 11:13:10', '员工离职:name:小明8509---workId:00009430', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1066, 9, '2023-03-06 11:13:10', '员工离职:name:小明8508---workId:00009429', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1067, 9, '2023-03-06 11:13:10', '员工离职:name:小明8507---workId:00009428', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1068, 9, '2023-03-06 11:13:11', '员工离职:name:小明8506---workId:00009427', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1069, 9, '2023-03-06 11:13:11', '员工离职:name:小明8505---workId:00009426', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1070, 9, '2023-03-06 11:13:11', '员工离职:name:小明8504---workId:00009425', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1071, 9, '2023-03-06 11:13:11', '员工离职:name:小明8503---workId:00009424', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1072, 9, '2023-03-06 11:13:11', '员工离职:name:小明8502---workId:00009423', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1073, 9, '2023-03-06 11:13:11', '员工离职:name:小明8501---workId:00009422', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1074, 9, '2023-03-06 11:13:11', '员工离职:name:小明8500---workId:00009421', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1075, 9, '2023-03-06 11:13:11', '员工离职:name:小明8499---workId:00009420', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1076, 9, '2023-03-06 11:13:11', '员工离职:name:小明8498---workId:00009419', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1077, 9, '2023-03-06 11:13:11', '员工离职:name:小明8497---workId:00009418', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1078, 9, '2023-03-06 11:13:11', '员工离职:name:小明8496---workId:00009417', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1079, 9, '2023-03-06 11:13:11', '员工离职:name:小明8495---workId:00009416', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1080, 9, '2023-03-06 11:13:11', '员工离职:name:小明8494---workId:00009415', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1081, 9, '2023-03-06 11:13:11', '员工离职:name:小明8493---workId:00009414', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1082, 9, '2023-03-06 11:13:11', '员工离职:name:小明8492---workId:00009413', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1083, 9, '2023-03-06 11:13:11', '员工离职:name:小明8491---workId:00009412', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1084, 9, '2023-03-06 11:13:11', '员工离职:name:小明8490---workId:00009411', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1085, 9, '2023-03-06 11:13:11', '员工离职:name:小明8489---workId:00009410', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1086, 9, '2023-03-06 11:13:11', '员工离职:name:小明8488---workId:00009409', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1087, 9, '2023-03-06 11:13:11', '员工离职:name:小明8487---workId:00009408', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1088, 9, '2023-03-06 11:13:11', '员工离职:name:小明8486---workId:00009407', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1089, 9, '2023-03-06 11:13:11', '员工离职:name:小明8485---workId:00009406', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1090, 9, '2023-03-06 11:13:11', '员工离职:name:小明8484---workId:00009405', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1091, 9, '2023-03-06 11:13:11', '员工离职:name:小明8483---workId:00009404', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1092, 9, '2023-03-06 11:13:11', '员工离职:name:小明8482---workId:00009403', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1093, 9, '2023-03-06 11:13:11', '员工离职:name:小明8481---workId:00009402', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1094, 9, '2023-03-06 11:13:11', '员工离职:name:小明8480---workId:00009401', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1095, 9, '2023-03-06 11:13:11', '员工离职:name:小明8479---workId:00009400', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1096, 9, '2023-03-06 11:13:11', '员工离职:name:小明8478---workId:00009399', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1097, 9, '2023-03-06 11:13:11', '员工离职:name:小明8477---workId:00009398', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1098, 9, '2023-03-06 11:13:11', '员工离职:name:小明8476---workId:00009397', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1099, 9, '2023-03-06 11:13:11', '员工离职:name:小明8475---workId:00009396', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1100, 9, '2023-03-06 11:13:11', '员工离职:name:小明8474---workId:00009395', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1101, 9, '2023-03-06 11:13:11', '员工离职:name:小明8473---workId:00009394', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1102, 9, '2023-03-06 11:13:11', '员工离职:name:小明8472---workId:00009393', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1103, 9, '2023-03-06 11:13:11', '员工离职:name:小明8471---workId:00009392', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1104, 9, '2023-03-06 11:13:11', '员工离职:name:小明8470---workId:00009391', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1105, 9, '2023-03-06 11:13:11', '员工离职:name:小明8469---workId:00009390', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1106, 9, '2023-03-06 11:13:11', '员工离职:name:小明8468---workId:00009389', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1107, 9, '2023-03-06 11:13:11', '员工离职:name:小明8467---workId:00009388', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1108, 9, '2023-03-06 11:13:11', '员工离职:name:小明8466---workId:00009387', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1109, 9, '2023-03-06 11:13:11', '员工离职:name:小明8465---workId:00009386', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1110, 9, '2023-03-06 11:13:11', '员工离职:name:小明8464---workId:00009385', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1111, 9, '2023-03-06 11:13:11', '员工离职:name:小明8463---workId:00009384', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1112, 9, '2023-03-06 11:13:11', '员工离职:name:小明8462---workId:00009383', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1113, 9, '2023-03-06 11:13:11', '员工离职:name:小明8461---workId:00009382', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1114, 9, '2023-03-06 11:13:11', '员工离职:name:小明8460---workId:00009381', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1115, 9, '2023-03-06 11:13:11', '员工离职:name:小明8459---workId:00009380', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1116, 9, '2023-03-06 11:13:11', '员工离职:name:小明8458---workId:00009379', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1117, 9, '2023-03-06 11:13:12', '员工离职:name:小明8457---workId:00009378', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1118, 9, '2023-03-06 11:13:12', '员工离职:name:小明8456---workId:00009377', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1119, 9, '2023-03-06 11:13:12', '员工离职:name:小明8455---workId:00009376', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1120, 9, '2023-03-06 11:13:12', '员工离职:name:小明8454---workId:00009375', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1121, 9, '2023-03-06 11:13:12', '员工离职:name:小明8453---workId:00009374', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1122, 9, '2023-03-06 11:13:12', '员工离职:name:小明8452---workId:00009373', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1123, 9, '2023-03-06 11:13:12', '员工离职:name:小明8451---workId:00009372', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1124, 9, '2023-03-06 11:13:12', '员工离职:name:小明8450---workId:00009371', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1125, 9, '2023-03-06 11:13:49', '员工批量离职:name:', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1126, 9, '2023-03-06 11:13:49', '员工离职:name:小明8449---workId:00009370', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1127, 9, '2023-03-06 11:13:49', '员工离职:name:小明8448---workId:00009369', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1128, 9, '2023-03-06 11:13:49', '员工离职:name:小明8447---workId:00009368', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1129, 9, '2023-03-06 11:13:49', '员工离职:name:小明8446---workId:00009367', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1130, 9, '2023-03-06 11:13:49', '员工离职:name:小明8445---workId:00009366', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1131, 9, '2023-03-06 11:13:49', '员工离职:name:小明8444---workId:00009365', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1132, 9, '2023-03-06 11:13:49', '员工离职:name:小明8443---workId:00009364', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1133, 9, '2023-03-06 11:13:49', '员工离职:name:小明8442---workId:00009363', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1134, 9, '2023-03-06 11:13:49', '员工离职:name:小明8441---workId:00009362', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1135, 9, '2023-03-06 11:13:49', '员工离职:name:小明8440---workId:00009361', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1136, 9, '2023-03-06 11:13:49', '员工离职:name:小明8439---workId:00009360', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1137, 9, '2023-03-06 11:13:49', '员工离职:name:小明8438---workId:00009359', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1138, 9, '2023-03-06 11:13:49', '员工离职:name:小明8437---workId:00009358', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1139, 9, '2023-03-06 11:13:49', '员工离职:name:小明8436---workId:00009357', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1140, 9, '2023-03-06 11:13:49', '员工离职:name:小明8435---workId:00009356', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1141, 9, '2023-03-06 11:13:49', '员工离职:name:小明8434---workId:00009355', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1142, 9, '2023-03-06 11:13:49', '员工离职:name:小明8433---workId:00009354', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1143, 9, '2023-03-06 11:13:49', '员工离职:name:小明8432---workId:00009353', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1144, 9, '2023-03-06 11:13:49', '员工离职:name:小明8431---workId:00009352', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1145, 9, '2023-03-06 11:13:49', '员工离职:name:小明8430---workId:00009351', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1146, 9, '2023-03-06 11:13:49', '员工离职:name:小明8429---workId:00009350', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1147, 9, '2023-03-06 11:13:49', '员工离职:name:小明8428---workId:00009349', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1148, 9, '2023-03-06 11:13:49', '员工离职:name:小明8427---workId:00009348', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1149, 9, '2023-03-06 11:13:49', '员工离职:name:小明8426---workId:00009347', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1150, 9, '2023-03-06 11:13:49', '员工离职:name:小明8425---workId:00009346', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1151, 9, '2023-03-06 11:13:49', '员工离职:name:小明8424---workId:00009345', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1152, 9, '2023-03-06 11:13:50', '员工离职:name:小明8423---workId:00009344', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1153, 9, '2023-03-06 11:13:50', '员工离职:name:小明8422---workId:00009343', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1154, 9, '2023-03-06 11:13:50', '员工离职:name:小明8421---workId:00009342', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1155, 9, '2023-03-06 11:13:50', '员工离职:name:小明8420---workId:00009341', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1156, 9, '2023-03-06 11:13:50', '员工离职:name:小明8419---workId:00009340', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1157, 9, '2023-03-06 11:13:50', '员工离职:name:小明8418---workId:00009339', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1158, 9, '2023-03-06 11:13:50', '员工离职:name:小明8417---workId:00009338', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1159, 9, '2023-03-06 11:13:50', '员工离职:name:小明8416---workId:00009337', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1160, 9, '2023-03-06 11:13:50', '员工离职:name:小明8415---workId:00009336', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1161, 9, '2023-03-06 11:13:50', '员工离职:name:小明8414---workId:00009335', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1162, 9, '2023-03-06 11:13:50', '员工离职:name:小明8413---workId:00009334', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1163, 9, '2023-03-06 11:13:50', '员工离职:name:小明8412---workId:00009333', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1164, 9, '2023-03-06 11:13:50', '员工离职:name:小明8411---workId:00009332', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1165, 9, '2023-03-06 11:13:50', '员工离职:name:小明8410---workId:00009331', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1166, 9, '2023-03-06 11:13:50', '员工离职:name:小明8409---workId:00009330', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1167, 9, '2023-03-06 11:13:50', '员工离职:name:小明8408---workId:00009329', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1168, 9, '2023-03-06 11:13:50', '员工离职:name:小明8407---workId:00009328', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1169, 9, '2023-03-06 11:13:50', '员工离职:name:小明8406---workId:00009327', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1170, 9, '2023-03-06 11:13:50', '员工离职:name:小明8405---workId:00009326', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1171, 9, '2023-03-06 11:13:50', '员工离职:name:小明8404---workId:00009325', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1172, 9, '2023-03-06 11:13:50', '员工离职:name:小明8403---workId:00009324', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1173, 9, '2023-03-06 11:13:50', '员工离职:name:小明8402---workId:00009323', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1174, 9, '2023-03-06 11:13:50', '员工离职:name:小明8401---workId:00009322', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1175, 9, '2023-03-06 11:13:50', '员工离职:name:小明8400---workId:00009321', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1176, 9, '2023-03-06 11:13:50', '员工离职:name:小明8399---workId:00009320', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1177, 9, '2023-03-06 11:13:50', '员工离职:name:小明8398---workId:00009319', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1178, 9, '2023-03-06 11:13:50', '员工离职:name:小明8397---workId:00009318', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1179, 9, '2023-03-06 11:13:50', '员工离职:name:小明8396---workId:00009317', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1180, 9, '2023-03-06 11:13:50', '员工离职:name:小明8395---workId:00009316', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1181, 9, '2023-03-06 11:13:50', '员工离职:name:小明8394---workId:00009315', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1182, 9, '2023-03-06 11:13:50', '员工离职:name:小明8393---workId:00009314', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1183, 9, '2023-03-06 11:13:50', '员工离职:name:小明8392---workId:00009313', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1184, 9, '2023-03-06 11:13:50', '员工离职:name:小明8391---workId:00009312', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1185, 9, '2023-03-06 11:13:50', '员工离职:name:小明8390---workId:00009311', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1186, 9, '2023-03-06 11:13:50', '员工离职:name:小明8389---workId:00009310', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1187, 9, '2023-03-06 11:13:50', '员工离职:name:小明8388---workId:00009309', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1188, 9, '2023-03-06 11:13:50', '员工离职:name:小明8387---workId:00009308', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1189, 9, '2023-03-06 11:13:50', '员工离职:name:小明8386---workId:00009307', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1190, 9, '2023-03-06 11:13:50', '员工离职:name:小明8385---workId:00009306', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1191, 9, '2023-03-06 11:13:50', '员工离职:name:小明8384---workId:00009305', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1192, 9, '2023-03-06 11:13:50', '员工离职:name:小明8383---workId:00009304', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1193, 9, '2023-03-06 11:13:50', '员工离职:name:小明8382---workId:00009303', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1194, 9, '2023-03-06 11:13:50', '员工离职:name:小明8381---workId:00009302', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1195, 9, '2023-03-06 11:13:50', '员工离职:name:小明8380---workId:00009301', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1196, 9, '2023-03-06 11:13:50', '员工离职:name:小明8379---workId:00009300', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1197, 9, '2023-03-06 11:13:50', '员工离职:name:小明8378---workId:00009299', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1198, 9, '2023-03-06 11:13:50', '员工离职:name:小明8377---workId:00009298', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1199, 9, '2023-03-06 11:13:51', '员工离职:name:小明8376---workId:00009297', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1200, 9, '2023-03-06 11:13:51', '员工离职:name:小明8375---workId:00009296', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1201, 9, '2023-03-06 11:13:51', '员工离职:name:小明8374---workId:00009295', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1202, 9, '2023-03-06 11:13:51', '员工离职:name:小明8373---workId:00009294', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1203, 9, '2023-03-06 11:13:51', '员工离职:name:小明8372---workId:00009293', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1204, 9, '2023-03-06 11:13:51', '员工离职:name:小明8371---workId:00009292', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1205, 9, '2023-03-06 11:13:51', '员工离职:name:小明8370---workId:00009291', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1206, 9, '2023-03-06 11:13:51', '员工离职:name:小明8369---workId:00009290', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1207, 9, '2023-03-06 11:13:51', '员工离职:name:小明8368---workId:00009289', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1208, 9, '2023-03-06 11:13:51', '员工离职:name:小明8367---workId:00009288', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1209, 9, '2023-03-06 11:13:51', '员工离职:name:小明8366---workId:00009287', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1210, 9, '2023-03-06 11:13:51', '员工离职:name:小明8365---workId:00009286', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1211, 9, '2023-03-06 11:13:51', '员工离职:name:小明8364---workId:00009285', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1212, 9, '2023-03-06 11:13:51', '员工离职:name:小明8363---workId:00009284', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1213, 9, '2023-03-06 11:13:51', '员工离职:name:小明8362---workId:00009283', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1214, 9, '2023-03-06 11:13:51', '员工离职:name:小明8361---workId:00009282', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1215, 9, '2023-03-06 11:13:51', '员工离职:name:小明8360---workId:00009281', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1216, 9, '2023-03-06 11:13:51', '员工离职:name:小明8359---workId:00009280', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1217, 9, '2023-03-06 11:13:51', '员工离职:name:小明8358---workId:00009279', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1218, 9, '2023-03-06 11:13:51', '员工离职:name:小明8357---workId:00009278', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1219, 9, '2023-03-06 11:13:51', '员工离职:name:小明8356---workId:00009277', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1220, 9, '2023-03-06 11:13:51', '员工离职:name:小明8355---workId:00009276', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1221, 9, '2023-03-06 11:13:51', '员工离职:name:小明8354---workId:00009275', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1222, 9, '2023-03-06 11:13:51', '员工离职:name:小明8353---workId:00009274', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1223, 9, '2023-03-06 11:13:51', '员工离职:name:小明8352---workId:00009273', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1224, 9, '2023-03-06 11:13:51', '员工离职:name:小明8351---workId:00009272', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1225, 9, '2023-03-06 11:13:51', '员工离职:name:小明8350---workId:00009271', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1226, 9, '2023-03-06 11:13:51', '员工离职:name:小明8349---workId:00009270', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1227, 9, '2023-03-06 11:13:51', '员工离职:name:小明8348---workId:00009269', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1228, 9, '2023-03-06 11:13:51', '员工离职:name:小明8347---workId:00009268', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1229, 9, '2023-03-06 11:13:51', '员工离职:name:小明8346---workId:00009267', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1230, 9, '2023-03-06 11:13:51', '员工离职:name:小明8345---workId:00009266', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1231, 9, '2023-03-06 11:13:51', '员工离职:name:小明8344---workId:00009265', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1232, 9, '2023-03-06 11:13:51', '员工离职:name:小明8343---workId:00009264', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1233, 9, '2023-03-06 11:13:51', '员工离职:name:小明8342---workId:00009263', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1234, 9, '2023-03-06 11:13:51', '员工离职:name:小明8341---workId:00009262', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1235, 9, '2023-03-06 11:13:51', '员工离职:name:小明8340---workId:00009261', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1236, 9, '2023-03-06 11:13:51', '员工离职:name:小明8339---workId:00009260', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1237, 9, '2023-03-06 11:13:51', '员工离职:name:小明8338---workId:00009259', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1238, 9, '2023-03-06 11:13:51', '员工离职:name:小明8337---workId:00009258', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1239, 9, '2023-03-06 11:13:51', '员工离职:name:小明8336---workId:00009257', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1240, 9, '2023-03-06 11:13:51', '员工离职:name:小明8335---workId:00009256', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1241, 9, '2023-03-06 11:13:51', '员工离职:name:小明8334---workId:00009255', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1242, 9, '2023-03-06 11:13:51', '员工离职:name:小明8333---workId:00009254', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1243, 9, '2023-03-06 11:13:51', '员工离职:name:小明8332---workId:00009253', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1244, 9, '2023-03-06 11:13:51', '员工离职:name:小明8331---workId:00009252', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1245, 9, '2023-03-06 11:13:51', '员工离职:name:小明8330---workId:00009251', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1246, 9, '2023-03-06 11:13:52', '员工离职:name:小明8329---workId:00009250', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1247, 9, '2023-03-06 11:13:52', '员工离职:name:小明8328---workId:00009249', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1248, 9, '2023-03-06 11:13:52', '员工离职:name:小明8327---workId:00009248', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1249, 9, '2023-03-06 11:13:52', '员工离职:name:小明8326---workId:00009247', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1250, 9, '2023-03-06 11:13:52', '员工离职:name:小明8325---workId:00009246', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1251, 9, '2023-03-06 11:13:52', '员工离职:name:小明8324---workId:00009245', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1252, 9, '2023-03-06 11:13:52', '员工离职:name:小明8323---workId:00009244', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1253, 9, '2023-03-06 11:13:52', '员工离职:name:小明8322---workId:00009243', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1254, 9, '2023-03-06 11:13:52', '员工离职:name:小明8321---workId:00009242', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1255, 9, '2023-03-06 11:13:52', '员工离职:name:小明8320---workId:00009241', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1256, 9, '2023-03-06 11:13:52', '员工离职:name:小明8319---workId:00009240', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1257, 9, '2023-03-06 11:13:52', '员工离职:name:小明8318---workId:00009239', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1258, 9, '2023-03-06 11:13:52', '员工离职:name:小明8317---workId:00009238', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1259, 9, '2023-03-06 11:13:52', '员工离职:name:小明8316---workId:00009237', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1260, 9, '2023-03-06 11:13:52', '员工离职:name:小明8315---workId:00009236', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1261, 9, '2023-03-06 11:13:52', '员工离职:name:小明8314---workId:00009235', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1262, 9, '2023-03-06 11:13:52', '员工离职:name:小明8313---workId:00009234', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1263, 9, '2023-03-06 11:13:52', '员工离职:name:小明8312---workId:00009233', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1264, 9, '2023-03-06 11:13:52', '员工离职:name:小明8311---workId:00009232', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1265, 9, '2023-03-06 11:13:52', '员工离职:name:小明8310---workId:00009231', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1266, 9, '2023-03-06 11:13:52', '员工离职:name:小明8309---workId:00009230', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1267, 9, '2023-03-06 11:13:52', '员工离职:name:小明8308---workId:00009229', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1268, 9, '2023-03-06 11:13:52', '员工离职:name:小明8307---workId:00009228', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1269, 9, '2023-03-06 11:13:52', '员工离职:name:小明8306---workId:00009227', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1270, 9, '2023-03-06 11:13:52', '员工离职:name:小明8305---workId:00009226', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1271, 9, '2023-03-06 11:13:52', '员工离职:name:小明8304---workId:00009225', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1272, 9, '2023-03-06 11:13:52', '员工离职:name:小明8303---workId:00009224', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1273, 9, '2023-03-06 11:13:52', '员工离职:name:小明8302---workId:00009223', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1274, 9, '2023-03-06 11:13:52', '员工离职:name:小明8301---workId:00009222', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1275, 9, '2023-03-06 11:13:52', '员工离职:name:小明8300---workId:00009221', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1276, 9, '2023-03-06 11:13:52', '员工离职:name:小明8299---workId:00009220', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1277, 9, '2023-03-06 11:13:52', '员工离职:name:小明8298---workId:00009219', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1278, 9, '2023-03-06 11:13:52', '员工离职:name:小明8297---workId:00009218', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1279, 9, '2023-03-06 11:13:52', '员工离职:name:小明8296---workId:00009217', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1280, 9, '2023-03-06 11:13:52', '员工离职:name:小明8295---workId:00009216', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1281, 9, '2023-03-06 11:13:52', '员工离职:name:小明8294---workId:00009215', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1282, 9, '2023-03-06 11:13:52', '员工离职:name:小明8293---workId:00009214', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1283, 9, '2023-03-06 11:13:52', '员工离职:name:小明8292---workId:00009213', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1284, 9, '2023-03-06 11:13:52', '员工离职:name:小明8291---workId:00009212', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1285, 9, '2023-03-06 11:13:52', '员工离职:name:小明8290---workId:00009211', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1286, 9, '2023-03-06 11:13:52', '员工离职:name:小明8289---workId:00009210', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1287, 9, '2023-03-06 11:13:52', '员工离职:name:小明8288---workId:00009209', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1288, 9, '2023-03-06 11:13:52', '员工离职:name:小明8287---workId:00009208', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1289, 9, '2023-03-06 11:13:52', '员工离职:name:小明8286---workId:00009207', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1290, 9, '2023-03-06 11:13:52', '员工离职:name:小明8285---workId:00009206', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1291, 9, '2023-03-06 11:13:52', '员工离职:name:小明8284---workId:00009205', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1292, 9, '2023-03-06 11:13:52', '员工离职:name:小明8283---workId:00009204', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1293, 9, '2023-03-06 11:13:52', '员工离职:name:小明8282---workId:00009203', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1294, 9, '2023-03-06 11:13:52', '员工离职:name:小明8281---workId:00009202', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1295, 9, '2023-03-06 11:13:52', '员工离职:name:小明8280---workId:00009201', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1296, 9, '2023-03-06 11:13:53', '员工离职:name:小明8279---workId:00009200', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1297, 9, '2023-03-06 11:13:53', '员工离职:name:小明8278---workId:00009199', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1298, 9, '2023-03-06 11:13:53', '员工离职:name:小明8277---workId:00009198', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1299, 9, '2023-03-06 11:13:53', '员工离职:name:小明8277---workId:00009198', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1300, 9, '2023-03-06 11:13:53', '员工离职:name:小明8276---workId:00009197', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1301, 9, '2023-03-06 11:13:53', '员工离职:name:小明8275---workId:00009196', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1302, 9, '2023-03-06 11:13:53', '员工离职:name:小明8274---workId:00009195', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1303, 9, '2023-03-06 11:13:53', '员工离职:name:小明8273---workId:00009194', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1304, 9, '2023-03-06 11:13:53', '员工离职:name:小明8272---workId:00009193', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1305, 9, '2023-03-06 11:13:53', '员工离职:name:小明8271---workId:00009192', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1306, 9, '2023-03-06 11:13:53', '员工离职:name:小明8270---workId:00009191', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1307, 9, '2023-03-06 11:13:53', '员工离职:name:小明8269---workId:00009190', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1308, 9, '2023-03-06 11:13:53', '员工离职:name:小明8268---workId:00009189', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1309, 9, '2023-03-06 11:13:53', '员工离职:name:小明8267---workId:00009188', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1310, 9, '2023-03-06 11:13:53', '员工离职:name:小明8266---workId:00009187', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1311, 9, '2023-03-06 11:13:53', '员工离职:name:小明8265---workId:00009186', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1312, 9, '2023-03-06 11:13:53', '员工离职:name:小明8264---workId:00009185', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1313, 9, '2023-03-06 11:13:53', '员工离职:name:小明8263---workId:00009184', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1314, 9, '2023-03-06 11:13:53', '员工离职:name:小明8262---workId:00009183', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1315, 9, '2023-03-06 11:13:53', '员工离职:name:小明8261---workId:00009182', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1316, 9, '2023-03-06 11:13:53', '员工离职:name:小明8260---workId:00009181', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1317, 9, '2023-03-06 11:13:53', '员工离职:name:小明8259---workId:00009180', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1318, 9, '2023-03-06 11:13:53', '员工离职:name:小明8258---workId:00009179', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1319, 9, '2023-03-06 11:13:53', '员工离职:name:小明8257---workId:00009178', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1320, 9, '2023-03-06 11:13:53', '员工离职:name:小明8256---workId:00009177', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1321, 9, '2023-03-06 11:13:53', '员工离职:name:小明8255---workId:00009176', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1322, 9, '2023-03-06 11:13:53', '员工离职:name:小明8254---workId:00009175', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1323, 9, '2023-03-06 11:13:53', '员工离职:name:小明8253---workId:00009174', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1324, 9, '2023-03-06 11:13:53', '员工离职:name:小明8252---workId:00009173', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1325, 9, '2023-03-06 11:13:53', '员工离职:name:小明8251---workId:00009172', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1326, 9, '2023-03-06 11:13:53', '员工离职:name:小明8250---workId:00009171', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1327, 9, '2023-03-06 11:13:53', '员工离职:name:小明8249---workId:00009170', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1328, 9, '2023-03-06 11:13:53', '员工离职:name:小明8248---workId:00009169', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1329, 9, '2023-03-06 11:13:53', '员工离职:name:小明8247---workId:00009168', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1330, 9, '2023-03-06 11:13:53', '员工离职:name:小明8246---workId:00009167', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1331, 9, '2023-03-06 11:13:53', '员工离职:name:小明8245---workId:00009166', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1332, 9, '2023-03-06 11:13:53', '员工离职:name:小明8244---workId:00009165', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1333, 9, '2023-03-06 11:13:53', '员工离职:name:小明8243---workId:00009164', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1334, 9, '2023-03-06 11:13:53', '员工离职:name:小明8242---workId:00009163', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1335, 9, '2023-03-06 11:13:53', '员工离职:name:小明8241---workId:00009162', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1336, 9, '2023-03-06 11:13:53', '员工离职:name:小明8240---workId:00009161', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1337, 9, '2023-03-06 11:13:53', '员工离职:name:小明8239---workId:00009160', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1338, 9, '2023-03-06 11:13:53', '员工离职:name:小明8238---workId:00009159', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1339, 9, '2023-03-06 11:13:53', '员工离职:name:小明8237---workId:00009158', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1340, 9, '2023-03-06 11:13:53', '员工离职:name:小明8236---workId:00009157', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1341, 9, '2023-03-06 11:13:53', '员工离职:name:小明8235---workId:00009156', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1342, 9, '2023-03-06 11:13:53', '员工离职:name:小明8234---workId:00009155', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1343, 9, '2023-03-06 11:13:53', '员工离职:name:小明8233---workId:00009154', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1344, 9, '2023-03-06 11:13:54', '员工离职:name:小明8232---workId:00009153', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1345, 9, '2023-03-06 11:13:54', '员工离职:name:小明8231---workId:00009152', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1346, 9, '2023-03-06 11:13:54', '员工离职:name:小明8230---workId:00009151', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1347, 9, '2023-03-06 11:13:54', '员工离职:name:小明8229---workId:00009150', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1348, 9, '2023-03-06 11:13:54', '员工离职:name:小明8228---workId:00009149', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1349, 9, '2023-03-06 11:13:54', '员工离职:name:小明8227---workId:00009148', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1350, 9, '2023-03-06 11:13:54', '员工离职:name:小明8226---workId:00009147', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1351, 9, '2023-03-06 11:13:54', '员工离职:name:小明8225---workId:00009146', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1352, 9, '2023-03-06 11:13:54', '员工离职:name:小明8224---workId:00009145', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1353, 9, '2023-03-06 11:13:54', '员工离职:name:小明8223---workId:00009144', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1354, 9, '2023-03-06 11:13:54', '员工离职:name:小明8222---workId:00009143', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1355, 9, '2023-03-06 11:13:54', '员工离职:name:小明8221---workId:00009142', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1356, 9, '2023-03-06 11:13:54', '员工离职:name:小明8220---workId:00009141', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1357, 9, '2023-03-06 11:13:54', '员工离职:name:小明8219---workId:00009140', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1358, 9, '2023-03-06 11:13:54', '员工离职:name:小明8218---workId:00009139', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1359, 9, '2023-03-06 11:13:54', '员工离职:name:小明8217---workId:00009138', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1360, 9, '2023-03-06 11:13:54', '员工离职:name:小明8216---workId:00009137', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1361, 9, '2023-03-06 11:13:54', '员工离职:name:小明8215---workId:00009136', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1362, 9, '2023-03-06 11:13:54', '员工离职:name:小明8214---workId:00009135', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1363, 9, '2023-03-06 11:13:54', '员工离职:name:小明8213---workId:00009134', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1364, 9, '2023-03-06 11:13:54', '员工离职:name:小明8212---workId:00009133', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1365, 9, '2023-03-06 11:13:54', '员工离职:name:小明8211---workId:00009132', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1366, 9, '2023-03-06 11:13:54', '员工离职:name:小明8210---workId:00009131', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1367, 9, '2023-03-06 11:13:54', '员工离职:name:小明8209---workId:00009130', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1368, 9, '2023-03-06 11:13:54', '员工离职:name:小明8208---workId:00009129', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1369, 9, '2023-03-06 11:13:54', '员工离职:name:小明8207---workId:00009128', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1370, 9, '2023-03-06 11:13:54', '员工离职:name:小明8206---workId:00009127', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1371, 9, '2023-03-06 11:13:54', '员工离职:name:小明8205---workId:00009126', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1372, 9, '2023-03-06 11:13:54', '员工离职:name:小明8204---workId:00009125', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1373, 9, '2023-03-06 11:13:54', '员工离职:name:小明8203---workId:00009124', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1374, 9, '2023-03-06 11:13:54', '员工离职:name:小明8202---workId:00009123', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1375, 9, '2023-03-06 11:13:54', '员工离职:name:小明8201---workId:00009122', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1376, 9, '2023-03-06 11:13:54', '员工离职:name:小明8200---workId:00009121', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1377, 9, '2023-03-06 11:13:54', '员工离职:name:小明8199---workId:00009120', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1378, 9, '2023-03-06 11:13:54', '员工离职:name:小明8198---workId:00009119', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1379, 9, '2023-03-06 11:13:54', '员工离职:name:小明8197---workId:00009118', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1380, 9, '2023-03-06 11:13:54', '员工离职:name:小明8196---workId:00009117', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1381, 9, '2023-03-06 11:13:54', '员工离职:name:小明8195---workId:00009116', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1382, 9, '2023-03-06 11:13:54', '员工离职:name:小明8194---workId:00009115', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1383, 9, '2023-03-06 11:13:54', '员工离职:name:小明8193---workId:00009114', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1384, 9, '2023-03-06 11:13:54', '员工离职:name:小明8192---workId:00009113', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1385, 9, '2023-03-06 11:13:54', '员工离职:name:小明8191---workId:00009112', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1386, 9, '2023-03-06 11:13:54', '员工离职:name:小明8190---workId:00009111', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1387, 9, '2023-03-06 11:13:54', '员工离职:name:小明8189---workId:00009110', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1388, 9, '2023-03-06 11:13:54', '员工离职:name:小明8188---workId:00009109', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1389, 9, '2023-03-06 11:13:54', '员工离职:name:小明8187---workId:00009108', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1390, 9, '2023-03-06 11:13:54', '员工离职:name:小明8186---workId:00009107', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1391, 9, '2023-03-06 11:13:54', '员工离职:name:小明8185---workId:00009106', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1392, 9, '2023-03-06 11:13:54', '员工离职:name:小明8184---workId:00009105', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1393, 9, '2023-03-06 11:13:54', '员工离职:name:小明8183---workId:00009104', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1394, 9, '2023-03-06 11:13:55', '员工离职:name:小明8182---workId:00009103', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1395, 9, '2023-03-06 11:13:55', '员工离职:name:小明8181---workId:00009102', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1396, 9, '2023-03-06 11:13:55', '员工离职:name:小明8180---workId:00009101', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1397, 9, '2023-03-06 11:13:55', '员工离职:name:小明8179---workId:00009100', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1398, 9, '2023-03-06 11:13:55', '员工离职:name:小明8178---workId:00009099', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1399, 9, '2023-03-06 11:13:55', '员工离职:name:小明8177---workId:00009098', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1400, 9, '2023-03-06 11:13:55', '员工离职:name:小明8176---workId:00009097', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1401, 9, '2023-03-06 11:13:55', '员工离职:name:小明8175---workId:00009096', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1402, 9, '2023-03-06 11:13:55', '员工离职:name:小明8174---workId:00009095', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1403, 9, '2023-03-06 11:13:55', '员工离职:name:小明8173---workId:00009094', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1404, 9, '2023-03-06 11:13:55', '员工离职:name:小明8172---workId:00009093', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1405, 9, '2023-03-06 11:13:55', '员工离职:name:小明8171---workId:00009092', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1406, 9, '2023-03-06 11:13:55', '员工离职:name:小明8170---workId:00009091', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1407, 9, '2023-03-06 11:13:55', '员工离职:name:小明8169---workId:00009090', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1408, 9, '2023-03-06 11:13:55', '员工离职:name:小明8168---workId:00009089', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1409, 9, '2023-03-06 11:13:55', '员工离职:name:小明8167---workId:00009088', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1410, 9, '2023-03-06 11:13:55', '员工离职:name:小明8166---workId:00009087', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1411, 9, '2023-03-06 11:13:55', '员工离职:name:小明8165---workId:00009086', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1412, 9, '2023-03-06 11:13:55', '员工离职:name:小明8164---workId:00009085', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1413, 9, '2023-03-06 11:13:55', '员工离职:name:小明8163---workId:00009084', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1414, 9, '2023-03-06 11:13:55', '员工离职:name:小明8162---workId:00009083', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1415, 9, '2023-03-06 11:13:55', '员工离职:name:小明8161---workId:00009082', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1416, 9, '2023-03-06 11:13:55', '员工离职:name:小明8160---workId:00009081', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1417, 9, '2023-03-06 11:13:55', '员工离职:name:小明8159---workId:00009080', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1418, 9, '2023-03-06 11:13:55', '员工离职:name:小明8158---workId:00009079', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1419, 9, '2023-03-06 11:13:55', '员工离职:name:小明8157---workId:00009078', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1420, 9, '2023-03-06 11:13:55', '员工离职:name:小明8156---workId:00009077', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1421, 9, '2023-03-06 11:13:55', '员工离职:name:小明8155---workId:00009076', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1422, 9, '2023-03-06 11:13:55', '员工离职:name:小明8154---workId:00009075', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1423, 9, '2023-03-06 11:13:55', '员工离职:name:小明8153---workId:00009074', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1424, 9, '2023-03-06 11:13:55', '员工离职:name:小明8152---workId:00009073', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1425, 9, '2023-03-06 11:13:55', '员工离职:name:小明8151---workId:00009072', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1426, 9, '2023-03-06 11:13:55', '员工离职:name:小明8150---workId:00009071', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1427, 9, '2023-03-06 11:13:55', '员工离职:name:小明8149---workId:00009070', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1428, 9, '2023-03-06 11:13:55', '员工离职:name:小明8148---workId:00009069', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1429, 9, '2023-03-06 11:13:55', '员工离职:name:小明8147---workId:00009068', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1430, 9, '2023-03-06 11:13:55', '员工离职:name:小明8146---workId:00009067', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1431, 9, '2023-03-06 11:13:55', '员工离职:name:小明8145---workId:00009066', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1432, 9, '2023-03-06 11:13:55', '员工离职:name:小明8144---workId:00009065', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1433, 9, '2023-03-06 11:13:55', '员工离职:name:小明8143---workId:00009064', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1434, 9, '2023-03-06 11:13:55', '员工离职:name:小明8142---workId:00009063', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1435, 9, '2023-03-06 11:13:55', '员工离职:name:小明8141---workId:00009062', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1436, 9, '2023-03-06 11:13:55', '员工离职:name:小明8140---workId:00009061', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1437, 9, '2023-03-06 11:13:55', '员工离职:name:小明8139---workId:00009060', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1438, 9, '2023-03-06 11:13:55', '员工离职:name:小明8138---workId:00009059', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1439, 9, '2023-03-06 11:13:55', '员工离职:name:小明8137---workId:00009058', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1440, 9, '2023-03-06 11:13:55', '员工离职:name:小明8136---workId:00009057', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1441, 9, '2023-03-06 11:13:55', '员工离职:name:小明8135---workId:00009056', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1442, 9, '2023-03-06 11:13:55', '员工离职:name:小明8134---workId:00009055', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1443, 9, '2023-03-06 11:13:56', '员工离职:name:小明8133---workId:00009054', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1444, 9, '2023-03-06 11:13:56', '员工离职:name:小明8132---workId:00009053', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1445, 9, '2023-03-06 11:13:56', '员工离职:name:小明8131---workId:00009052', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1446, 9, '2023-03-06 11:13:56', '员工离职:name:小明8130---workId:00009051', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1447, 9, '2023-03-06 11:13:56', '员工离职:name:小明8129---workId:00009050', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1448, 9, '2023-03-06 11:13:56', '员工离职:name:小明8128---workId:00009049', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1449, 9, '2023-03-06 11:13:56', '员工离职:name:小明8127---workId:00009048', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1450, 9, '2023-03-06 11:13:56', '员工离职:name:小明8126---workId:00009047', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1451, 9, '2023-03-06 11:13:56', '员工离职:name:小明8125---workId:00009046', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1452, 9, '2023-03-06 11:13:56', '员工离职:name:小明8124---workId:00009045', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1453, 9, '2023-03-06 11:13:56', '员工离职:name:小明8123---workId:00009044', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1454, 9, '2023-03-06 11:13:56', '员工离职:name:小明8122---workId:00009043', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1455, 9, '2023-03-06 11:13:56', '员工离职:name:小明8121---workId:00009042', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1456, 9, '2023-03-06 11:13:56', '员工离职:name:小明8120---workId:00009041', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1457, 9, '2023-03-06 11:13:56', '员工离职:name:小明8119---workId:00009040', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1458, 9, '2023-03-06 11:13:56', '员工离职:name:小明8118---workId:00009039', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1459, 9, '2023-03-06 11:14:03', '员工批量离职:name:', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1460, 9, '2023-03-06 11:14:03', '员工离职:name:小明8117---workId:00009038', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1461, 9, '2023-03-06 11:14:03', '员工离职:name:小明8116---workId:00009037', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1462, 9, '2023-03-06 11:14:03', '员工离职:name:小明8115---workId:00009036', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1463, 9, '2023-03-06 11:14:03', '员工离职:name:小明8114---workId:00009035', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1464, 9, '2023-03-06 11:14:03', '员工离职:name:小明8113---workId:00009034', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1465, 9, '2023-03-06 11:14:03', '员工离职:name:小明8112---workId:00009033', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1466, 9, '2023-03-06 11:14:03', '员工离职:name:小明8111---workId:00009032', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1467, 9, '2023-03-06 11:14:03', '员工离职:name:小明8110---workId:00009031', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1468, 9, '2023-03-06 11:14:03', '员工离职:name:小明8109---workId:00009030', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1469, 9, '2023-03-06 11:14:03', '员工离职:name:小明8108---workId:00009029', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1470, 9, '2023-03-06 11:14:03', '员工离职:name:小明8107---workId:00009028', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1471, 9, '2023-03-06 11:14:03', '员工离职:name:小明8106---workId:00009027', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1472, 9, '2023-03-06 11:14:03', '员工离职:name:小明8105---workId:00009026', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1473, 9, '2023-03-06 11:14:03', '员工离职:name:小明8104---workId:00009025', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1474, 9, '2023-03-06 11:14:03', '员工离职:name:小明8103---workId:00009024', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1475, 9, '2023-03-06 11:14:03', '员工离职:name:小明8102---workId:00009023', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1476, 9, '2023-03-06 11:14:03', '员工离职:name:小明8101---workId:00009022', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1477, 9, '2023-03-06 11:14:03', '员工离职:name:小明8100---workId:00009021', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1478, 9, '2023-03-06 11:14:03', '员工离职:name:小明8099---workId:00009020', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1479, 9, '2023-03-06 11:14:04', '员工离职:name:小明8098---workId:00009019', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1480, 9, '2023-03-06 11:14:04', '员工离职:name:小明8097---workId:00009018', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1481, 9, '2023-03-06 11:14:04', '员工离职:name:小明8096---workId:00009017', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1482, 9, '2023-03-06 11:14:04', '员工离职:name:小明8095---workId:00009016', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1483, 9, '2023-03-06 11:14:04', '员工离职:name:小明8094---workId:00009015', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1484, 9, '2023-03-06 11:14:04', '员工离职:name:小明8093---workId:00009014', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1485, 9, '2023-03-06 11:14:04', '员工离职:name:小明8092---workId:00009013', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1486, 9, '2023-03-06 11:14:04', '员工离职:name:小明8091---workId:00009012', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1487, 9, '2023-03-06 11:14:04', '员工离职:name:小明8090---workId:00009011', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1488, 9, '2023-03-06 11:14:04', '员工离职:name:小明8089---workId:00009010', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1489, 9, '2023-03-06 11:14:04', '员工离职:name:小明8088---workId:00009009', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1490, 9, '2023-03-06 11:14:04', '员工离职:name:小明8087---workId:00009008', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1491, 9, '2023-03-06 11:14:04', '员工离职:name:小明8086---workId:00009007', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1492, 9, '2023-03-06 11:14:04', '员工离职:name:小明8085---workId:00009006', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1493, 9, '2023-03-06 11:14:04', '员工离职:name:小明8084---workId:00009005', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1494, 9, '2023-03-06 11:14:04', '员工离职:name:小明8083---workId:00009004', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1495, 9, '2023-03-06 11:14:04', '员工离职:name:小明8082---workId:00009003', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1496, 9, '2023-03-06 11:14:04', '员工离职:name:小明8081---workId:00009002', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1497, 9, '2023-03-06 11:14:04', '员工离职:name:小明8080---workId:00009001', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1498, 9, '2023-03-06 11:14:04', '员工离职:name:小明8079---workId:00009000', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1499, 9, '2023-03-06 11:14:04', '员工离职:name:小明8078---workId:00008999', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1500, 9, '2023-03-06 11:14:04', '员工离职:name:小明8077---workId:00008998', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1501, 9, '2023-03-06 11:14:04', '员工离职:name:小明8076---workId:00008997', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1502, 9, '2023-03-06 11:14:04', '员工离职:name:小明8075---workId:00008996', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1503, 9, '2023-03-06 11:14:04', '员工离职:name:小明8074---workId:00008995', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1504, 9, '2023-03-06 11:14:04', '员工离职:name:小明8073---workId:00008994', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1505, 9, '2023-03-06 11:14:04', '员工离职:name:小明8072---workId:00008993', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1506, 9, '2023-03-06 11:14:04', '员工离职:name:小明8071---workId:00008992', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1507, 9, '2023-03-06 11:14:04', '员工离职:name:小明8070---workId:00008991', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1508, 9, '2023-03-06 11:14:04', '员工离职:name:小明8069---workId:00008990', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1509, 9, '2023-03-06 11:14:04', '员工离职:name:小明8068---workId:00008989', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1510, 9, '2023-03-06 11:14:04', '员工离职:name:小明8067---workId:00008988', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1511, 9, '2023-03-06 11:14:04', '员工离职:name:小明8066---workId:00008987', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1512, 9, '2023-03-06 11:14:04', '员工离职:name:小明8065---workId:00008986', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1513, 9, '2023-03-06 11:14:04', '员工离职:name:小明8064---workId:00008985', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1514, 9, '2023-03-06 11:14:04', '员工离职:name:小明8063---workId:00008984', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1515, 9, '2023-03-06 11:14:04', '员工离职:name:小明8062---workId:00008983', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1516, 9, '2023-03-06 11:14:04', '员工离职:name:小明8061---workId:00008982', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1517, 9, '2023-03-06 11:14:04', '员工离职:name:小明8060---workId:00008981', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1518, 9, '2023-03-06 11:14:04', '员工离职:name:小明8059---workId:00008980', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1519, 9, '2023-03-06 11:14:04', '员工离职:name:小明8058---workId:00008979', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1520, 9, '2023-03-06 11:14:04', '员工离职:name:小明8057---workId:00008978', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1521, 9, '2023-03-06 11:14:04', '员工离职:name:小明8056---workId:00008977', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1522, 9, '2023-03-06 11:14:04', '员工离职:name:小明8055---workId:00008976', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1523, 9, '2023-03-06 11:14:05', '员工离职:name:小明8054---workId:00008975', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1524, 9, '2023-03-06 11:14:05', '员工离职:name:小明8053---workId:00008974', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1525, 9, '2023-03-06 11:14:05', '员工离职:name:小明8052---workId:00008973', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1526, 9, '2023-03-06 11:14:05', '员工离职:name:小明8051---workId:00008972', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1527, 9, '2023-03-06 11:14:05', '员工离职:name:小明8050---workId:00008971', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1528, 9, '2023-03-06 11:14:05', '员工离职:name:小明8049---workId:00008970', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1529, 9, '2023-03-06 11:14:05', '员工离职:name:小明8048---workId:00008969', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1530, 9, '2023-03-06 11:14:05', '员工离职:name:小明8047---workId:00008968', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1531, 9, '2023-03-06 11:14:05', '员工离职:name:小明8046---workId:00008967', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1532, 9, '2023-03-06 11:14:05', '员工离职:name:小明8045---workId:00008966', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1533, 9, '2023-03-06 11:14:05', '员工离职:name:小明8044---workId:00008965', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1534, 9, '2023-03-06 11:14:05', '员工离职:name:小明8043---workId:00008964', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1535, 9, '2023-03-06 11:14:05', '员工离职:name:小明8042---workId:00008963', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1536, 9, '2023-03-06 11:14:05', '员工离职:name:小明8041---workId:00008962', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1537, 9, '2023-03-06 11:14:05', '员工离职:name:小明8040---workId:00008961', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1538, 9, '2023-03-06 11:14:05', '员工离职:name:小明8039---workId:00008960', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1539, 9, '2023-03-06 11:14:05', '员工离职:name:小明8038---workId:00008959', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1540, 9, '2023-03-06 11:14:05', '员工离职:name:小明8037---workId:00008958', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1541, 9, '2023-03-06 11:14:05', '员工离职:name:小明8036---workId:00008957', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1542, 9, '2023-03-06 11:14:05', '员工离职:name:小明8035---workId:00008956', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1543, 9, '2023-03-06 11:14:05', '员工离职:name:小明8034---workId:00008955', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1544, 9, '2023-03-06 11:14:05', '员工离职:name:小明8033---workId:00008954', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1545, 9, '2023-03-06 11:14:05', '员工离职:name:小明8032---workId:00008953', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1546, 9, '2023-03-06 11:14:05', '员工离职:name:小明8031---workId:00008952', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1547, 9, '2023-03-06 11:14:05', '员工离职:name:小明8030---workId:00008951', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1548, 9, '2023-03-06 11:14:05', '员工离职:name:小明8029---workId:00008950', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1549, 9, '2023-03-06 11:14:05', '员工离职:name:小明8028---workId:00008949', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1550, 9, '2023-03-06 11:14:05', '员工离职:name:小明8027---workId:00008948', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1551, 9, '2023-03-06 11:14:05', '员工离职:name:小明8026---workId:00008947', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1552, 9, '2023-03-06 11:14:05', '员工离职:name:小明8025---workId:00008946', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1553, 9, '2023-03-06 11:14:05', '员工离职:name:小明8024---workId:00008945', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1554, 9, '2023-03-06 11:14:05', '员工离职:name:小明8023---workId:00008944', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1555, 9, '2023-03-06 11:14:05', '员工离职:name:小明8022---workId:00008943', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1556, 9, '2023-03-06 11:14:05', '员工离职:name:小明8021---workId:00008942', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1557, 9, '2023-03-06 11:14:05', '员工离职:name:小明8020---workId:00008941', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1558, 9, '2023-03-06 11:14:05', '员工离职:name:小明8019---workId:00008940', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1559, 9, '2023-03-06 11:14:05', '员工离职:name:小明8018---workId:00008939', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1560, 9, '2023-03-06 11:14:05', '员工离职:name:小明8017---workId:00008938', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1561, 9, '2023-03-06 11:14:05', '员工离职:name:小明8016---workId:00008937', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1562, 9, '2023-03-06 11:14:05', '员工离职:name:小明8015---workId:00008936', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1563, 9, '2023-03-06 11:14:05', '员工离职:name:小明8014---workId:00008935', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1564, 9, '2023-03-06 11:14:05', '员工离职:name:小明8013---workId:00008934', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1565, 9, '2023-03-06 11:14:05', '员工离职:name:小明8012---workId:00008933', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1566, 9, '2023-03-06 11:14:05', '员工离职:name:小明8011---workId:00008932', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1567, 9, '2023-03-06 11:14:05', '员工离职:name:小明8010---workId:00008931', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1568, 9, '2023-03-06 11:14:05', '员工离职:name:小明8009---workId:00008930', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1569, 9, '2023-03-06 11:14:05', '员工离职:name:小明8008---workId:00008929', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1570, 9, '2023-03-06 11:14:05', '员工离职:name:小明8007---workId:00008928', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1571, 9, '2023-03-06 11:14:05', '员工离职:name:小明8006---workId:00008927', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1572, 9, '2023-03-06 11:14:05', '员工离职:name:小明8005---workId:00008926', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1573, 9, '2023-03-06 11:14:06', '员工离职:name:小明8004---workId:00008925', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1574, 9, '2023-03-06 11:14:06', '员工离职:name:小明8003---workId:00008924', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1575, 9, '2023-03-06 11:14:06', '员工离职:name:小明8002---workId:00008923', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1576, 9, '2023-03-06 11:14:06', '员工离职:name:小明8001---workId:00008922', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1577, 9, '2023-03-06 11:14:06', '员工离职:name:小明8000---workId:00008921', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1578, 9, '2023-03-06 11:14:06', '员工离职:name:小明7999---workId:00008920', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1579, 9, '2023-03-06 11:14:06', '员工离职:name:小明7998---workId:00008919', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1580, 9, '2023-03-06 11:14:06', '员工离职:name:小明7997---workId:00008918', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1581, 9, '2023-03-06 11:14:06', '员工离职:name:小明7996---workId:00008917', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1582, 9, '2023-03-06 11:14:06', '员工离职:name:小明7995---workId:00008916', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1583, 9, '2023-03-06 11:14:06', '员工离职:name:小明7994---workId:00008915', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1584, 9, '2023-03-06 11:14:06', '员工离职:name:小明7993---workId:00008914', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1585, 9, '2023-03-06 11:14:06', '员工离职:name:小明7992---workId:00008913', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1586, 9, '2023-03-06 11:14:06', '员工离职:name:小明7991---workId:00008912', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1587, 9, '2023-03-06 11:14:06', '员工离职:name:小明7990---workId:00008911', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1588, 9, '2023-03-06 11:14:06', '员工离职:name:小明7989---workId:00008910', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1589, 9, '2023-03-06 11:14:06', '员工离职:name:小明7988---workId:00008909', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1590, 9, '2023-03-06 11:14:06', '员工离职:name:小明7987---workId:00008908', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1591, 9, '2023-03-06 11:14:06', '员工离职:name:小明7986---workId:00008907', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1592, 9, '2023-03-06 11:14:06', '员工离职:name:小明7985---workId:00008906', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1593, 9, '2023-03-06 11:14:06', '员工离职:name:小明7984---workId:00008905', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1594, 9, '2023-03-06 11:14:06', '员工离职:name:小明7983---workId:00008904', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1595, 9, '2023-03-06 11:14:06', '员工离职:name:小明7982---workId:00008903', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1596, 9, '2023-03-06 11:14:06', '员工离职:name:小明7981---workId:00008902', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1597, 9, '2023-03-06 11:14:06', '员工离职:name:小明7980---workId:00008901', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1598, 9, '2023-03-06 11:14:06', '员工离职:name:小明7979---workId:00008900', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1599, 9, '2023-03-06 11:14:06', '员工离职:name:小明7978---workId:00008899', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1600, 9, '2023-03-06 11:14:06', '员工离职:name:小明7977---workId:00008898', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1601, 9, '2023-03-06 11:14:06', '员工离职:name:小明7976---workId:00008897', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1602, 9, '2023-03-06 11:14:06', '员工离职:name:小明7975---workId:00008896', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1603, 9, '2023-03-06 11:14:06', '员工离职:name:小明7974---workId:00008895', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1604, 9, '2023-03-06 11:14:06', '员工离职:name:小明7973---workId:00008894', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1605, 9, '2023-03-06 11:14:06', '员工离职:name:小明7972---workId:00008893', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1606, 9, '2023-03-06 11:14:06', '员工离职:name:小明7971---workId:00008892', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1607, 9, '2023-03-06 11:14:06', '员工离职:name:小明7970---workId:00008891', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1608, 9, '2023-03-06 11:14:06', '员工离职:name:小明7969---workId:00008890', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1609, 9, '2023-03-06 11:14:06', '员工离职:name:小明7968---workId:00008889', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1610, 9, '2023-03-06 11:14:06', '员工离职:name:小明7967---workId:00008888', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1611, 9, '2023-03-06 11:14:06', '员工离职:name:小明7966---workId:00008887', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1612, 9, '2023-03-06 11:14:06', '员工离职:name:小明7965---workId:00008886', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1613, 9, '2023-03-06 11:14:06', '员工离职:name:小明7964---workId:00008885', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1614, 9, '2023-03-06 11:14:06', '员工离职:name:小明7963---workId:00008884', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1615, 9, '2023-03-06 11:14:06', '员工离职:name:小明7962---workId:00008883', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1616, 9, '2023-03-06 11:14:06', '员工离职:name:小明7961---workId:00008882', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1617, 9, '2023-03-06 11:14:06', '员工离职:name:小明7960---workId:00008881', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1618, 9, '2023-03-06 11:14:06', '员工离职:name:小明7959---workId:00008880', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1619, 9, '2023-03-06 11:14:06', '员工离职:name:小明7958---workId:00008879', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1620, 9, '2023-03-06 11:14:06', '员工离职:name:小明7957---workId:00008878', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1621, 9, '2023-03-06 11:14:06', '员工离职:name:小明7956---workId:00008877', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1622, 9, '2023-03-06 11:14:06', '员工离职:name:小明7955---workId:00008876', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1623, 9, '2023-03-06 11:14:07', '员工离职:name:小明7954---workId:00008875', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1624, 9, '2023-03-06 11:14:07', '员工离职:name:小明7953---workId:00008874', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1625, 9, '2023-03-06 11:14:07', '员工离职:name:小明7952---workId:00008873', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1626, 9, '2023-03-06 11:14:07', '员工离职:name:小明7951---workId:00008872', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1627, 9, '2023-03-06 11:14:07', '员工离职:name:小明7950---workId:00008871', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1628, 9, '2023-03-06 11:14:07', '员工离职:name:小明7949---workId:00008870', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1629, 9, '2023-03-06 11:14:07', '员工离职:name:小明7948---workId:00008869', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1630, 9, '2023-03-06 11:14:07', '员工离职:name:小明7947---workId:00008868', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1631, 9, '2023-03-06 11:14:07', '员工离职:name:小明7946---workId:00008867', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1632, 9, '2023-03-06 11:14:07', '员工离职:name:小明7945---workId:00008866', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1633, 9, '2023-03-06 11:14:07', '员工离职:name:小明7944---workId:00008865', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1634, 9, '2023-03-06 11:14:07', '员工离职:name:小明7943---workId:00008864', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1635, 9, '2023-03-06 11:14:07', '员工离职:name:小明7942---workId:00008863', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1636, 9, '2023-03-06 11:14:07', '员工离职:name:小明7941---workId:00008862', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1637, 9, '2023-03-06 11:14:07', '员工离职:name:小明7940---workId:00008861', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1638, 9, '2023-03-06 11:14:07', '员工离职:name:小明7939---workId:00008860', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1639, 9, '2023-03-06 11:14:07', '员工离职:name:小明7938---workId:00008859', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1640, 9, '2023-03-06 11:14:07', '员工离职:name:小明7937---workId:00008858', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1641, 9, '2023-03-06 11:14:07', '员工离职:name:小明7936---workId:00008857', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1642, 9, '2023-03-06 11:14:07', '员工离职:name:小明7935---workId:00008856', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1643, 9, '2023-03-06 11:14:07', '员工离职:name:小明7934---workId:00008855', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1644, 9, '2023-03-06 11:14:07', '员工离职:name:小明7933---workId:00008854', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1645, 9, '2023-03-06 11:14:07', '员工离职:name:小明7932---workId:00008853', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1646, 9, '2023-03-06 11:14:07', '员工离职:name:小明7931---workId:00008852', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1647, 9, '2023-03-06 11:14:07', '员工离职:name:小明7930---workId:00008851', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1648, 9, '2023-03-06 11:14:07', '员工离职:name:小明7929---workId:00008850', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1649, 9, '2023-03-06 11:14:07', '员工离职:name:小明7928---workId:00008849', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1650, 9, '2023-03-06 11:14:07', '员工离职:name:小明7927---workId:00008848', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1651, 9, '2023-03-06 11:14:07', '员工离职:name:小明7926---workId:00008847', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1652, 9, '2023-03-06 11:14:07', '员工离职:name:小明7925---workId:00008846', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1653, 9, '2023-03-06 11:14:07', '员工离职:name:小明7924---workId:00008845', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1654, 9, '2023-03-06 11:14:07', '员工离职:name:小明7923---workId:00008844', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1655, 9, '2023-03-06 11:14:07', '员工离职:name:小明7922---workId:00008843', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1656, 9, '2023-03-06 11:14:07', '员工离职:name:小明7921---workId:00008842', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1657, 9, '2023-03-06 11:14:07', '员工离职:name:小明7920---workId:00008841', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1658, 9, '2023-03-06 11:14:07', '员工离职:name:小明7919---workId:00008840', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1659, 9, '2023-03-06 11:14:07', '员工离职:name:小明7918---workId:00008839', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1660, 9, '2023-03-06 11:14:07', '员工离职:name:小明7917---workId:00008838', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1661, 9, '2023-03-06 11:14:07', '员工离职:name:小明7916---workId:00008837', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1662, 9, '2023-03-06 11:14:07', '员工离职:name:小明7915---workId:00008836', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1663, 9, '2023-03-06 11:14:07', '员工离职:name:小明7914---workId:00008835', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1664, 9, '2023-03-06 11:14:07', '员工离职:name:小明7913---workId:00008834', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1665, 9, '2023-03-06 11:14:07', '员工离职:name:小明7912---workId:00008833', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1666, 9, '2023-03-06 11:14:07', '员工离职:name:小明7911---workId:00008832', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1667, 9, '2023-03-06 11:14:07', '员工离职:name:小明7910---workId:00008831', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1668, 9, '2023-03-06 11:14:07', '员工离职:name:小明7909---workId:00008830', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1669, 9, '2023-03-06 11:14:07', '员工离职:name:小明7908---workId:00008829', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1670, 9, '2023-03-06 11:14:07', '员工离职:name:小明7907---workId:00008828', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1671, 9, '2023-03-06 11:14:07', '员工离职:name:小明7906---workId:00008827', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1672, 9, '2023-03-06 11:14:08', '员工离职:name:小明7905---workId:00008826', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1673, 9, '2023-03-06 11:14:08', '员工离职:name:小明7904---workId:00008825', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1674, 9, '2023-03-06 11:14:08', '员工离职:name:小明7903---workId:00008824', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1675, 9, '2023-03-06 11:14:08', '员工离职:name:小明7902---workId:00008823', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1676, 9, '2023-03-06 11:14:08', '员工离职:name:小明7901---workId:00008822', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1677, 9, '2023-03-06 11:14:08', '员工离职:name:小明7900---workId:00008821', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1678, 9, '2023-03-06 11:14:08', '员工离职:name:小明7899---workId:00008820', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1679, 9, '2023-03-06 11:14:08', '员工离职:name:小明7898---workId:00008819', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1680, 9, '2023-03-06 11:14:08', '员工离职:name:小明7897---workId:00008818', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1681, 9, '2023-03-06 11:14:08', '员工离职:name:小明7896---workId:00008817', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1682, 9, '2023-03-06 11:14:08', '员工离职:name:小明7895---workId:00008816', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1683, 9, '2023-03-06 11:14:08', '员工离职:name:小明7894---workId:00008815', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1684, 9, '2023-03-06 11:14:08', '员工离职:name:小明7893---workId:00008814', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1685, 9, '2023-03-06 11:14:08', '员工离职:name:小明7892---workId:00008813', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1686, 9, '2023-03-06 11:14:08', '员工离职:name:小明7891---workId:00008812', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1687, 9, '2023-03-06 11:14:08', '员工离职:name:小明7890---workId:00008811', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1688, 9, '2023-03-06 11:14:08', '员工离职:name:小明7889---workId:00008810', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1689, 9, '2023-03-06 11:14:08', '员工离职:name:小明7888---workId:00008809', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1690, 9, '2023-03-06 11:14:08', '员工离职:name:小明7887---workId:00008808', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1691, 9, '2023-03-06 11:14:08', '员工离职:name:小明7886---workId:00008807', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1692, 9, '2023-03-06 11:14:08', '员工离职:name:小明7885---workId:00008806', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1693, 9, '2023-03-06 11:14:08', '员工离职:name:小明7884---workId:00008805', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1694, 9, '2023-03-06 11:14:08', '员工离职:name:小明7883---workId:00008804', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1695, 9, '2023-03-06 11:14:08', '员工离职:name:小明7882---workId:00008803', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1696, 9, '2023-03-06 11:14:08', '员工离职:name:小明7881---workId:00008802', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1697, 9, '2023-03-06 11:14:08', '员工离职:name:小明7880---workId:00008801', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1698, 9, '2023-03-06 11:14:08', '员工离职:name:小明7879---workId:00008800', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1699, 9, '2023-03-06 11:14:08', '员工离职:name:小明7878---workId:00008799', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1700, 9, '2023-03-06 11:14:08', '员工离职:name:小明7877---workId:00008798', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1701, 9, '2023-03-06 11:14:08', '员工离职:name:小明7876---workId:00008797', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1702, 9, '2023-03-06 11:14:08', '员工离职:name:小明7875---workId:00008796', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1703, 9, '2023-03-06 11:14:08', '员工离职:name:小明7874---workId:00008795', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1704, 9, '2023-03-06 11:14:08', '员工离职:name:小明7873---workId:00008794', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1705, 9, '2023-03-06 11:14:08', '员工离职:name:小明7872---workId:00008793', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1706, 9, '2023-03-06 11:14:08', '员工离职:name:小明7871---workId:00008792', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1707, 9, '2023-03-06 11:14:08', '员工离职:name:小明7870---workId:00008791', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1708, 9, '2023-03-06 11:14:08', '员工离职:name:小明7869---workId:00008790', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1709, 9, '2023-03-06 11:14:08', '员工离职:name:小明7868---workId:00008789', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1710, 9, '2023-03-06 11:14:08', '员工离职:name:小明7867---workId:00008788', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1711, 9, '2023-03-06 11:14:08', '员工离职:name:小明7866---workId:00008787', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1712, 9, '2023-03-06 11:14:08', '员工离职:name:小明7865---workId:00008786', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1713, 9, '2023-03-06 11:14:08', '员工离职:name:小明7864---workId:00008785', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1714, 9, '2023-03-06 11:14:08', '员工离职:name:小明7863---workId:00008784', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1715, 9, '2023-03-06 11:14:08', '员工离职:name:小明7862---workId:00008783', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1716, 9, '2023-03-06 11:14:08', '员工离职:name:小明7861---workId:00008782', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1717, 9, '2023-03-06 11:14:09', '员工离职:name:小明7860---workId:00008781', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1718, 9, '2023-03-06 11:14:09', '员工离职:name:小明7859---workId:00008780', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1719, 9, '2023-03-06 11:14:09', '员工离职:name:小明7858---workId:00008779', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1720, 9, '2023-03-06 11:14:09', '员工离职:name:小明7857---workId:00008778', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1721, 9, '2023-03-06 11:14:09', '员工离职:name:小明7856---workId:00008777', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1722, 9, '2023-03-06 11:14:09', '员工离职:name:小明7855---workId:00008776', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1723, 9, '2023-03-06 11:14:09', '员工离职:name:小明7854---workId:00008775', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1724, 9, '2023-03-06 11:14:09', '员工离职:name:小明7853---workId:00008774', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1725, 9, '2023-03-06 11:14:09', '员工离职:name:小明7852---workId:00008773', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1726, 9, '2023-03-06 11:14:09', '员工离职:name:小明7851---workId:00008772', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1727, 9, '2023-03-06 11:14:09', '员工离职:name:小明7850---workId:00008771', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1728, 9, '2023-03-06 11:14:09', '员工离职:name:小明7849---workId:00008770', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1729, 9, '2023-03-06 11:14:09', '员工离职:name:小明7848---workId:00008769', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1730, 9, '2023-03-06 11:14:09', '员工离职:name:小明7847---workId:00008768', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1731, 9, '2023-03-06 11:14:09', '员工离职:name:小明7846---workId:00008767', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1732, 9, '2023-03-06 11:14:09', '员工离职:name:小明7845---workId:00008766', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1733, 9, '2023-03-06 11:14:09', '员工离职:name:小明7844---workId:00008765', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1734, 9, '2023-03-06 11:14:09', '员工离职:name:小明7843---workId:00008764', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1735, 9, '2023-03-06 11:14:09', '员工离职:name:小明7842---workId:00008763', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1736, 9, '2023-03-06 11:14:09', '员工离职:name:小明7841---workId:00008762', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1737, 9, '2023-03-06 11:14:09', '员工离职:name:小明7840---workId:00008761', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1738, 9, '2023-03-06 11:14:09', '员工离职:name:小明7839---workId:00008760', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1739, 9, '2023-03-06 11:14:09', '员工离职:name:小明7838---workId:00008759', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1740, 9, '2023-03-06 11:14:09', '员工离职:name:小明7837---workId:00008758', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1741, 9, '2023-03-06 11:14:09', '员工离职:name:小明7836---workId:00008757', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1742, 9, '2023-03-06 11:14:09', '员工离职:name:小明7835---workId:00008756', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1743, 9, '2023-03-06 11:14:09', '员工离职:name:小明7834---workId:00008755', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1744, 9, '2023-03-06 11:14:09', '员工离职:name:小明7833---workId:00008754', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1745, 9, '2023-03-06 11:14:09', '员工离职:name:小明7832---workId:00008753', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1746, 9, '2023-03-06 11:14:09', '员工离职:name:小明7831---workId:00008752', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1747, 9, '2023-03-06 11:14:09', '员工离职:name:小明7830---workId:00008751', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1748, 9, '2023-03-06 11:14:09', '员工离职:name:小明7829---workId:00008750', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1749, 9, '2023-03-06 11:14:09', '员工离职:name:小明7828---workId:00008749', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1750, 9, '2023-03-06 11:14:09', '员工离职:name:小明7827---workId:00008748', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1751, 9, '2023-03-06 11:14:09', '员工离职:name:小明7826---workId:00008747', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1752, 9, '2023-03-06 11:14:09', '员工离职:name:小明7825---workId:00008746', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1753, 9, '2023-03-06 11:14:10', '员工离职:name:小明7824---workId:00008745', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1754, 9, '2023-03-06 11:14:10', '员工离职:name:小明7823---workId:00008744', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1755, 9, '2023-03-06 11:14:10', '员工离职:name:小明7822---workId:00008743', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1756, 9, '2023-03-06 11:14:10', '员工离职:name:小明7821---workId:00008742', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1757, 9, '2023-03-06 11:14:10', '员工离职:name:小明7820---workId:00008741', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1758, 9, '2023-03-06 11:14:10', '员工离职:name:小明7819---workId:00008740', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1759, 9, '2023-03-06 11:14:10', '员工离职:name:小明7818---workId:00008739', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1760, 9, '2023-03-06 11:14:10', '员工离职:name:小明7817---workId:00008738', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1761, 9, '2023-03-06 11:14:10', '员工离职:name:小明7816---workId:00008737', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1762, 9, '2023-03-06 11:14:10', '员工离职:name:小明7815---workId:00008736', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1763, 9, '2023-03-06 11:14:10', '员工离职:name:小明7814---workId:00008735', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1764, 9, '2023-03-06 11:14:10', '员工离职:name:小明7813---workId:00008734', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1765, 9, '2023-03-06 11:14:10', '员工离职:name:小明7812---workId:00008733', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1766, 9, '2023-03-06 11:14:10', '员工离职:name:小明7811---workId:00008732', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1767, 9, '2023-03-06 11:14:10', '员工离职:name:小明7810---workId:00008731', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1768, 9, '2023-03-06 11:14:10', '员工离职:name:小明7809---workId:00008730', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1769, 9, '2023-03-06 11:14:10', '员工离职:name:小明7808---workId:00008729', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1770, 9, '2023-03-06 11:14:10', '员工离职:name:小明7807---workId:00008728', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1771, 9, '2023-03-06 11:14:10', '员工离职:name:小明7806---workId:00008727', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1772, 9, '2023-03-06 11:14:10', '员工离职:name:小明7805---workId:00008726', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1773, 9, '2023-03-06 11:14:10', '员工离职:name:小明7804---workId:00008725', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1774, 9, '2023-03-06 11:14:10', '员工离职:name:小明7803---workId:00008724', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1775, 9, '2023-03-06 11:14:10', '员工离职:name:小明7802---workId:00008723', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1776, 9, '2023-03-06 11:14:10', '员工离职:name:小明7801---workId:00008722', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1777, 9, '2023-03-06 11:14:10', '员工离职:name:小明7800---workId:00008721', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1778, 9, '2023-03-06 11:14:10', '员工离职:name:小明7799---workId:00008720', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1779, 9, '2023-03-06 11:14:10', '员工离职:name:小明7798---workId:00008719', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1780, 9, '2023-03-06 11:14:10', '员工离职:name:小明7797---workId:00008718', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1781, 9, '2023-03-06 11:14:10', '员工离职:name:小明7796---workId:00008717', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1782, 9, '2023-03-06 11:14:10', '员工离职:name:小明7795---workId:00008716', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1783, 9, '2023-03-06 11:14:10', '员工离职:name:小明7794---workId:00008715', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1784, 9, '2023-03-06 11:14:10', '员工离职:name:小明7793---workId:00008714', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1785, 9, '2023-03-06 11:14:10', '员工离职:name:小明7792---workId:00008713', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1786, 9, '2023-03-06 11:14:10', '员工离职:name:小明7791---workId:00008712', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1787, 9, '2023-03-06 11:14:10', '员工离职:name:小明7790---workId:00008711', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1788, 9, '2023-03-06 11:14:10', '员工离职:name:小明7789---workId:00008710', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1789, 9, '2023-03-06 11:14:10', '员工离职:name:小明7788---workId:00008709', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1790, 9, '2023-03-06 11:14:10', '员工离职:name:小明7787---workId:00008708', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1791, 9, '2023-03-06 11:14:10', '员工离职:name:小明7786---workId:00008707', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1792, 9, '2023-03-06 11:14:10', '员工离职:name:小明7785---workId:00008706', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1793, 9, '2023-03-06 11:14:19', '员工批量离职:name:', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1794, 9, '2023-03-06 11:14:19', '员工离职:name:小明7784---workId:00008705', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1795, 9, '2023-03-06 11:14:19', '员工离职:name:小明7783---workId:00008704', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1796, 9, '2023-03-06 11:14:19', '员工离职:name:小明7782---workId:00008703', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1797, 9, '2023-03-06 11:14:19', '员工离职:name:小明7781---workId:00008702', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1798, 9, '2023-03-06 11:14:19', '员工离职:name:小明7780---workId:00008701', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1799, 9, '2023-03-06 11:14:19', '员工离职:name:小明7779---workId:00008700', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1800, 9, '2023-03-06 11:14:19', '员工离职:name:小明7778---workId:00008699', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1801, 9, '2023-03-06 11:14:19', '员工离职:name:小明7777---workId:00008698', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1802, 9, '2023-03-06 11:14:19', '员工离职:name:小明7776---workId:00008697', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1803, 9, '2023-03-06 11:14:19', '员工离职:name:小明7775---workId:00008696', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1804, 9, '2023-03-06 11:14:19', '员工离职:name:小明7774---workId:00008695', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1805, 9, '2023-03-06 11:14:19', '员工离职:name:小明7773---workId:00008694', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1806, 9, '2023-03-06 11:14:19', '员工离职:name:小明7772---workId:00008693', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1807, 9, '2023-03-06 11:14:19', '员工离职:name:小明7771---workId:00008692', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1808, 9, '2023-03-06 11:14:19', '员工离职:name:小明7770---workId:00008691', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1809, 9, '2023-03-06 11:14:19', '员工离职:name:小明7769---workId:00008690', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1810, 9, '2023-03-06 11:14:19', '员工离职:name:小明7768---workId:00008689', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1811, 9, '2023-03-06 11:14:19', '员工离职:name:小明7767---workId:00008688', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1812, 9, '2023-03-06 11:14:19', '员工离职:name:小明7766---workId:00008687', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1813, 9, '2023-03-06 11:14:19', '员工离职:name:小明7765---workId:00008686', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1814, 9, '2023-03-06 11:14:19', '员工离职:name:小明7764---workId:00008685', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1815, 9, '2023-03-06 11:14:19', '员工离职:name:小明7763---workId:00008684', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1816, 9, '2023-03-06 11:14:19', '员工离职:name:小明7762---workId:00008683', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1817, 9, '2023-03-06 11:14:19', '员工离职:name:小明7761---workId:00008682', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1818, 9, '2023-03-06 11:14:19', '员工离职:name:小明7760---workId:00008681', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1819, 9, '2023-03-06 11:14:19', '员工离职:name:小明7759---workId:00008680', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1820, 9, '2023-03-06 11:14:19', '员工离职:name:小明7758---workId:00008679', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1821, 9, '2023-03-06 11:14:19', '员工离职:name:小明7757---workId:00008678', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1822, 9, '2023-03-06 11:14:19', '员工离职:name:小明7756---workId:00008677', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1823, 9, '2023-03-06 11:14:19', '员工离职:name:小明7755---workId:00008676', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1824, 9, '2023-03-06 11:14:19', '员工离职:name:小明7754---workId:00008675', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1825, 9, '2023-03-06 11:14:19', '员工离职:name:小明7753---workId:00008674', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1826, 9, '2023-03-06 11:14:19', '员工离职:name:小明7752---workId:00008673', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1827, 9, '2023-03-06 11:14:20', '员工离职:name:小明7751---workId:00008672', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1828, 9, '2023-03-06 11:14:20', '员工离职:name:小明7750---workId:00008671', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1829, 9, '2023-03-06 11:14:20', '员工离职:name:小明7749---workId:00008670', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1830, 9, '2023-03-06 11:14:20', '员工离职:name:小明7748---workId:00008669', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1831, 9, '2023-03-06 11:14:20', '员工离职:name:小明7747---workId:00008668', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1832, 9, '2023-03-06 11:14:20', '员工离职:name:小明7746---workId:00008667', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1833, 9, '2023-03-06 11:14:20', '员工离职:name:小明7745---workId:00008666', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1834, 9, '2023-03-06 11:14:20', '员工离职:name:小明7744---workId:00008665', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1835, 9, '2023-03-06 11:14:20', '员工离职:name:小明7743---workId:00008664', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1836, 9, '2023-03-06 11:14:20', '员工离职:name:小明7742---workId:00008663', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1837, 9, '2023-03-06 11:14:20', '员工离职:name:小明7741---workId:00008662', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1838, 9, '2023-03-06 11:14:20', '员工离职:name:小明7740---workId:00008661', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1839, 9, '2023-03-06 11:14:20', '员工离职:name:小明7739---workId:00008660', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1840, 9, '2023-03-06 11:14:20', '员工离职:name:小明7738---workId:00008659', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1841, 9, '2023-03-06 11:14:20', '员工离职:name:小明7737---workId:00008658', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1842, 9, '2023-03-06 11:14:20', '员工离职:name:小明7736---workId:00008657', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1843, 9, '2023-03-06 11:14:20', '员工离职:name:小明7735---workId:00008656', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1844, 9, '2023-03-06 11:14:20', '员工离职:name:小明7734---workId:00008655', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1845, 9, '2023-03-06 11:14:20', '员工离职:name:小明7733---workId:00008654', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1846, 9, '2023-03-06 11:14:20', '员工离职:name:小明7732---workId:00008653', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1847, 9, '2023-03-06 11:14:20', '员工离职:name:小明7731---workId:00008652', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1848, 9, '2023-03-06 11:14:20', '员工离职:name:小明7730---workId:00008651', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1849, 9, '2023-03-06 11:14:20', '员工离职:name:小明7729---workId:00008650', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1850, 9, '2023-03-06 11:14:20', '员工离职:name:小明7728---workId:00008649', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1851, 9, '2023-03-06 11:14:20', '员工离职:name:小明7727---workId:00008648', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1852, 9, '2023-03-06 11:14:20', '员工离职:name:小明7726---workId:00008647', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1853, 9, '2023-03-06 11:14:20', '员工离职:name:小明7725---workId:00008646', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1854, 9, '2023-03-06 11:14:20', '员工离职:name:小明7724---workId:00008645', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1855, 9, '2023-03-06 11:14:20', '员工离职:name:小明7723---workId:00008644', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1856, 9, '2023-03-06 11:14:20', '员工离职:name:小明7722---workId:00008643', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1857, 9, '2023-03-06 11:14:20', '员工离职:name:小明7721---workId:00008642', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1858, 9, '2023-03-06 11:14:20', '员工离职:name:小明7720---workId:00008641', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1859, 9, '2023-03-06 11:14:20', '员工离职:name:小明7719---workId:00008640', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1860, 9, '2023-03-06 11:14:20', '员工离职:name:小明7718---workId:00008639', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1861, 9, '2023-03-06 11:14:20', '员工离职:name:小明7717---workId:00008638', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1862, 9, '2023-03-06 11:14:20', '员工离职:name:小明7716---workId:00008637', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1863, 9, '2023-03-06 11:14:20', '员工离职:name:小明7715---workId:00008636', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1864, 9, '2023-03-06 11:14:20', '员工离职:name:小明7714---workId:00008635', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1865, 9, '2023-03-06 11:14:20', '员工离职:name:小明7713---workId:00008634', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1866, 9, '2023-03-06 11:14:20', '员工离职:name:小明7712---workId:00008633', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1867, 9, '2023-03-06 11:14:20', '员工离职:name:小明7711---workId:00008632', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1868, 9, '2023-03-06 11:14:20', '员工离职:name:小明7710---workId:00008631', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1869, 9, '2023-03-06 11:14:20', '员工离职:name:小明7709---workId:00008630', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1870, 9, '2023-03-06 11:14:20', '员工离职:name:小明7708---workId:00008629', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1871, 9, '2023-03-06 11:14:20', '员工离职:name:小明7707---workId:00008628', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1872, 9, '2023-03-06 11:14:20', '员工离职:name:小明7706---workId:00008627', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1873, 9, '2023-03-06 11:14:20', '员工离职:name:小明7705---workId:00008626', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1874, 9, '2023-03-06 11:14:20', '员工离职:name:小明7704---workId:00008625', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1875, 9, '2023-03-06 11:14:20', '员工离职:name:小明7703---workId:00008624', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1876, 9, '2023-03-06 11:14:20', '员工离职:name:小明7702---workId:00008623', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1877, 9, '2023-03-06 11:14:21', '员工离职:name:小明7701---workId:00008622', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1878, 9, '2023-03-06 11:14:21', '员工离职:name:小明7700---workId:00008621', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1879, 9, '2023-03-06 11:14:21', '员工离职:name:小明7699---workId:00008620', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1880, 9, '2023-03-06 11:14:21', '员工离职:name:小明7698---workId:00008619', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1881, 9, '2023-03-06 11:14:21', '员工离职:name:小明7697---workId:00008618', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1882, 9, '2023-03-06 11:14:21', '员工离职:name:小明7696---workId:00008617', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1883, 9, '2023-03-06 11:14:21', '员工离职:name:小明7695---workId:00008616', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1884, 9, '2023-03-06 11:14:21', '员工离职:name:小明7694---workId:00008615', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1885, 9, '2023-03-06 11:14:21', '员工离职:name:小明7693---workId:00008614', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1886, 9, '2023-03-06 11:14:21', '员工离职:name:小明7692---workId:00008613', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1887, 9, '2023-03-06 11:14:21', '员工离职:name:小明7691---workId:00008612', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1888, 9, '2023-03-06 11:14:21', '员工离职:name:小明7690---workId:00008611', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1889, 9, '2023-03-06 11:14:21', '员工离职:name:小明7689---workId:00008610', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1890, 9, '2023-03-06 11:14:21', '员工离职:name:小明7688---workId:00008609', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1891, 9, '2023-03-06 11:14:21', '员工离职:name:小明7687---workId:00008608', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1892, 9, '2023-03-06 11:14:21', '员工离职:name:小明7686---workId:00008607', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1893, 9, '2023-03-06 11:14:21', '员工离职:name:小明7685---workId:00008606', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1894, 9, '2023-03-06 11:14:21', '员工离职:name:小明7684---workId:00008605', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1895, 9, '2023-03-06 11:14:21', '员工离职:name:小明7683---workId:00008604', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1896, 9, '2023-03-06 11:14:21', '员工离职:name:小明7682---workId:00008603', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1897, 9, '2023-03-06 11:14:21', '员工离职:name:小明7681---workId:00008602', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1898, 9, '2023-03-06 11:14:21', '员工离职:name:小明7680---workId:00008601', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1899, 9, '2023-03-06 11:14:21', '员工离职:name:小明7679---workId:00008600', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1900, 9, '2023-03-06 11:14:21', '员工离职:name:小明7678---workId:00008599', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1901, 9, '2023-03-06 11:14:21', '员工离职:name:小明7677---workId:00008598', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1902, 9, '2023-03-06 11:14:21', '员工离职:name:小明7676---workId:00008597', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1903, 9, '2023-03-06 11:14:21', '员工离职:name:小明7675---workId:00008596', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1904, 9, '2023-03-06 11:14:21', '员工离职:name:小明7674---workId:00008595', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1905, 9, '2023-03-06 11:14:21', '员工离职:name:小明7673---workId:00008594', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1906, 9, '2023-03-06 11:14:21', '员工离职:name:小明7672---workId:00008593', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1907, 9, '2023-03-06 11:14:21', '员工离职:name:小明7671---workId:00008592', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1908, 9, '2023-03-06 11:14:21', '员工离职:name:小明7670---workId:00008591', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1909, 9, '2023-03-06 11:14:21', '员工离职:name:小明7669---workId:00008590', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1910, 9, '2023-03-06 11:14:21', '员工离职:name:小明7668---workId:00008589', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1911, 9, '2023-03-06 11:14:21', '员工离职:name:小明7667---workId:00008588', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1912, 9, '2023-03-06 11:14:21', '员工离职:name:小明7666---workId:00008587', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1913, 9, '2023-03-06 11:14:21', '员工离职:name:小明7665---workId:00008586', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1914, 9, '2023-03-06 11:14:21', '员工离职:name:小明7664---workId:00008585', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1915, 9, '2023-03-06 11:14:21', '员工离职:name:小明7663---workId:00008584', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1916, 9, '2023-03-06 11:14:21', '员工离职:name:小明7662---workId:00008583', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1917, 9, '2023-03-06 11:14:21', '员工离职:name:小明7661---workId:00008582', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1918, 9, '2023-03-06 11:14:21', '员工离职:name:小明7660---workId:00008581', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1919, 9, '2023-03-06 11:14:21', '员工离职:name:小明7659---workId:00008580', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1920, 9, '2023-03-06 11:14:21', '员工离职:name:小明7658---workId:00008579', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1921, 9, '2023-03-06 11:14:21', '员工离职:name:小明7657---workId:00008578', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1922, 9, '2023-03-06 11:14:21', '员工离职:name:小明7656---workId:00008577', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1923, 9, '2023-03-06 11:14:22', '员工离职:name:小明7655---workId:00008576', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1924, 9, '2023-03-06 11:14:22', '员工离职:name:小明7654---workId:00008575', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1925, 9, '2023-03-06 11:14:22', '员工离职:name:小明7653---workId:00008574', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1926, 9, '2023-03-06 11:14:22', '员工离职:name:小明7652---workId:00008573', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1927, 9, '2023-03-06 11:14:22', '员工离职:name:小明7651---workId:00008572', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1928, 9, '2023-03-06 11:14:22', '员工离职:name:小明7650---workId:00008571', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1929, 9, '2023-03-06 11:14:22', '员工离职:name:小明7649---workId:00008570', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1930, 9, '2023-03-06 11:14:22', '员工离职:name:小明7648---workId:00008569', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1931, 9, '2023-03-06 11:14:22', '员工离职:name:小明7647---workId:00008568', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1932, 9, '2023-03-06 11:14:22', '员工离职:name:小明7646---workId:00008567', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1933, 9, '2023-03-06 11:14:22', '员工离职:name:小明7645---workId:00008566', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1934, 9, '2023-03-06 11:14:22', '员工离职:name:小明7644---workId:00008565', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1935, 9, '2023-03-06 11:14:22', '员工离职:name:小明7643---workId:00008564', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1936, 9, '2023-03-06 11:14:22', '员工离职:name:小明7642---workId:00008563', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1937, 9, '2023-03-06 11:14:22', '员工离职:name:小明7641---workId:00008562', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1938, 9, '2023-03-06 11:14:22', '员工离职:name:小明7640---workId:00008561', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1939, 9, '2023-03-06 11:14:22', '员工离职:name:小明7639---workId:00008560', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1940, 9, '2023-03-06 11:14:22', '员工离职:name:小明7638---workId:00008559', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1941, 9, '2023-03-06 11:14:22', '员工离职:name:小明7637---workId:00008558', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1942, 9, '2023-03-06 11:14:22', '员工离职:name:小明7636---workId:00008557', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1943, 9, '2023-03-06 11:14:22', '员工离职:name:小明7635---workId:00008556', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1944, 9, '2023-03-06 11:14:22', '员工离职:name:小明7634---workId:00008555', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1945, 9, '2023-03-06 11:14:22', '员工离职:name:小明7633---workId:00008554', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1946, 9, '2023-03-06 11:14:22', '员工离职:name:小明7632---workId:00008553', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1947, 9, '2023-03-06 11:14:22', '员工离职:name:小明7631---workId:00008552', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1948, 9, '2023-03-06 11:14:22', '员工离职:name:小明7630---workId:00008551', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1949, 9, '2023-03-06 11:14:22', '员工离职:name:小明7629---workId:00008550', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1950, 9, '2023-03-06 11:14:22', '员工离职:name:小明7628---workId:00008549', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1951, 9, '2023-03-06 11:14:22', '员工离职:name:小明7627---workId:00008548', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1952, 9, '2023-03-06 11:14:22', '员工离职:name:小明7626---workId:00008547', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1953, 9, '2023-03-06 11:14:22', '员工离职:name:小明7625---workId:00008546', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1954, 9, '2023-03-06 11:14:22', '员工离职:name:小明7624---workId:00008545', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1955, 9, '2023-03-06 11:14:22', '员工离职:name:小明7623---workId:00008544', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1956, 9, '2023-03-06 11:14:22', '员工离职:name:小明7622---workId:00008543', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1957, 9, '2023-03-06 11:14:22', '员工离职:name:小明7621---workId:00008542', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1958, 9, '2023-03-06 11:14:22', '员工离职:name:小明7620---workId:00008541', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1959, 9, '2023-03-06 11:14:22', '员工离职:name:小明7619---workId:00008540', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1960, 9, '2023-03-06 11:14:22', '员工离职:name:小明7618---workId:00008539', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1961, 9, '2023-03-06 11:14:23', '员工离职:name:小明7617---workId:00008538', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1962, 9, '2023-03-06 11:14:23', '员工离职:name:小明7616---workId:00008537', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1963, 9, '2023-03-06 11:14:23', '员工离职:name:小明7615---workId:00008536', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1964, 9, '2023-03-06 11:14:23', '员工离职:name:小明7614---workId:00008535', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1965, 9, '2023-03-06 11:14:23', '员工离职:name:小明7613---workId:00008534', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1966, 9, '2023-03-06 11:14:23', '员工离职:name:小明7612---workId:00008533', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1967, 9, '2023-03-06 11:14:23', '员工离职:name:小明7611---workId:00008532', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1968, 9, '2023-03-06 11:14:23', '员工离职:name:小明7610---workId:00008531', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1969, 9, '2023-03-06 11:14:23', '员工离职:name:小明7609---workId:00008530', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1970, 9, '2023-03-06 11:14:23', '员工离职:name:小明7608---workId:00008529', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1971, 9, '2023-03-06 11:14:23', '员工离职:name:小明7607---workId:00008528', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1972, 9, '2023-03-06 11:14:23', '员工离职:name:小明7606---workId:00008527', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1973, 9, '2023-03-06 11:14:23', '员工离职:name:小明7605---workId:00008526', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1974, 9, '2023-03-06 11:14:23', '员工离职:name:小明7604---workId:00008525', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1975, 9, '2023-03-06 11:14:23', '员工离职:name:小明7603---workId:00008524', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1976, 9, '2023-03-06 11:14:23', '员工离职:name:小明7602---workId:00008523', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1977, 9, '2023-03-06 11:14:23', '员工离职:name:小明7601---workId:00008522', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1978, 9, '2023-03-06 11:14:23', '员工离职:name:小明7600---workId:00008521', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1979, 9, '2023-03-06 11:14:23', '员工离职:name:小明7599---workId:00008520', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1980, 9, '2023-03-06 11:14:23', '员工离职:name:小明7598---workId:00008519', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1981, 9, '2023-03-06 11:14:23', '员工离职:name:小明7597---workId:00008518', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1982, 9, '2023-03-06 11:14:23', '员工离职:name:小明7596---workId:00008517', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1983, 9, '2023-03-06 11:14:23', '员工离职:name:小明7595---workId:00008516', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1984, 9, '2023-03-06 11:14:23', '员工离职:name:小明7594---workId:00008515', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1985, 9, '2023-03-06 11:14:23', '员工离职:name:小明7593---workId:00008514', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1986, 9, '2023-03-06 11:14:23', '员工离职:name:小明7592---workId:00008513', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1987, 9, '2023-03-06 11:14:23', '员工离职:name:小明7591---workId:00008512', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1988, 9, '2023-03-06 11:14:23', '员工离职:name:小明7590---workId:00008511', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1989, 9, '2023-03-06 11:14:23', '员工离职:name:小明7589---workId:00008510', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1990, 9, '2023-03-06 11:14:23', '员工离职:name:小明7588---workId:00008509', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1991, 9, '2023-03-06 11:14:23', '员工离职:name:小明7587---workId:00008508', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1992, 9, '2023-03-06 11:14:23', '员工离职:name:小明7586---workId:00008507', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1993, 9, '2023-03-06 11:14:23', '员工离职:name:小明7585---workId:00008506', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1994, 9, '2023-03-06 11:14:23', '员工离职:name:小明7584---workId:00008505', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1995, 9, '2023-03-06 11:14:23', '员工离职:name:小明7583---workId:00008504', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1996, 9, '2023-03-06 11:14:23', '员工离职:name:小明7582---workId:00008503', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1997, 9, '2023-03-06 11:14:23', '员工离职:name:小明7581---workId:00008502', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1998, 9, '2023-03-06 11:14:23', '员工离职:name:小明7580---workId:00008501', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (1999, 9, '2023-03-06 11:14:23', '员工离职:name:小明7579---workId:00008500', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2000, 9, '2023-03-06 11:14:23', '员工离职:name:小明7578---workId:00008499', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2001, 9, '2023-03-06 11:14:23', '员工离职:name:小明7577---workId:00008498', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2002, 9, '2023-03-06 11:14:23', '员工离职:name:小明7576---workId:00008497', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2003, 9, '2023-03-06 11:14:23', '员工离职:name:小明7575---workId:00008496', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2004, 9, '2023-03-06 11:14:24', '员工离职:name:小明7574---workId:00008495', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2005, 9, '2023-03-06 11:14:24', '员工离职:name:小明7573---workId:00008494', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2006, 9, '2023-03-06 11:14:24', '员工离职:name:小明7572---workId:00008493', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2007, 9, '2023-03-06 11:14:24', '员工离职:name:小明7571---workId:00008492', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2008, 9, '2023-03-06 11:14:24', '员工离职:name:小明7570---workId:00008491', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2009, 9, '2023-03-06 11:14:24', '员工离职:name:小明7569---workId:00008490', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2010, 9, '2023-03-06 11:14:24', '员工离职:name:小明7568---workId:00008489', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2011, 9, '2023-03-06 11:14:24', '员工离职:name:小明7567---workId:00008488', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2012, 9, '2023-03-06 11:14:24', '员工离职:name:小明7566---workId:00008487', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2013, 9, '2023-03-06 11:14:24', '员工离职:name:小明7565---workId:00008486', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2014, 9, '2023-03-06 11:14:24', '员工离职:name:小明7564---workId:00008485', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2015, 9, '2023-03-06 11:14:24', '员工离职:name:小明7563---workId:00008484', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2016, 9, '2023-03-06 11:14:24', '员工离职:name:小明7562---workId:00008483', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2017, 9, '2023-03-06 11:14:24', '员工离职:name:小明7561---workId:00008482', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2018, 9, '2023-03-06 11:14:24', '员工离职:name:小明7560---workId:00008481', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2019, 9, '2023-03-06 11:14:24', '员工离职:name:小明7559---workId:00008480', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2020, 9, '2023-03-06 11:14:24', '员工离职:name:小明7558---workId:00008479', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2021, 9, '2023-03-06 11:14:24', '员工离职:name:小明7557---workId:00008478', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2022, 9, '2023-03-06 11:14:24', '员工离职:name:小明7556---workId:00008477', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2023, 9, '2023-03-06 11:14:24', '员工离职:name:小明7555---workId:00008476', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2024, 9, '2023-03-06 11:14:24', '员工离职:name:小明7554---workId:00008475', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2025, 9, '2023-03-06 11:14:24', '员工离职:name:小明7553---workId:00008474', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2026, 9, '2023-03-06 11:14:24', '员工离职:name:小明7552---workId:00008473', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2027, 9, '2023-03-06 11:14:24', '员工离职:name:小明7551---workId:00008472', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2028, 9, '2023-03-06 11:14:24', '员工离职:name:小明7550---workId:00008471', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2029, 9, '2023-03-06 11:14:24', '员工离职:name:小明7549---workId:00008470', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2030, 9, '2023-03-06 11:14:24', '员工离职:name:小明7548---workId:00008469', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2031, 9, '2023-03-06 11:14:24', '员工离职:name:小明7547---workId:00008468', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2032, 9, '2023-03-06 11:14:24', '员工离职:name:小明7546---workId:00008467', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2033, 9, '2023-03-06 11:14:24', '员工离职:name:小明7545---workId:00008466', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2034, 9, '2023-03-06 11:14:24', '员工离职:name:小明7544---workId:00008465', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2035, 9, '2023-03-06 11:14:24', '员工离职:name:小明7543---workId:00008464', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2036, 9, '2023-03-06 11:14:24', '员工离职:name:小明7542---workId:00008463', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2037, 9, '2023-03-06 11:14:24', '员工离职:name:小明7541---workId:00008462', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2038, 9, '2023-03-06 11:14:24', '员工离职:name:小明7540---workId:00008461', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2039, 9, '2023-03-06 11:14:24', '员工离职:name:小明7539---workId:00008460', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2040, 9, '2023-03-06 11:14:24', '员工离职:name:小明7538---workId:00008459', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2041, 9, '2023-03-06 11:14:24', '员工离职:name:小明7537---workId:00008458', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2042, 9, '2023-03-06 11:14:24', '员工离职:name:小明7536---workId:00008457', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2043, 9, '2023-03-06 11:14:24', '员工离职:name:小明7535---workId:00008456', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2044, 9, '2023-03-06 11:14:24', '员工离职:name:小明7534---workId:00008455', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2045, 9, '2023-03-06 11:14:24', '员工离职:name:小明7533---workId:00008454', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2046, 9, '2023-03-06 11:14:24', '员工离职:name:小明7532---workId:00008453', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2047, 9, '2023-03-06 11:14:24', '员工离职:name:小明7531---workId:00008452', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2048, 9, '2023-03-06 11:14:24', '员工离职:name:小明7530---workId:00008451', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2049, 9, '2023-03-06 11:14:24', '员工离职:name:小明7529---workId:00008450', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2050, 9, '2023-03-06 11:14:25', '员工离职:name:小明7528---workId:00008449', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2051, 9, '2023-03-06 11:14:25', '员工离职:name:小明7527---workId:00008448', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2052, 9, '2023-03-06 11:14:25', '员工离职:name:小明7526---workId:00008447', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2053, 9, '2023-03-06 11:14:25', '员工离职:name:小明7525---workId:00008446', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2054, 9, '2023-03-06 11:14:25', '员工离职:name:小明7524---workId:00008445', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2055, 9, '2023-03-06 11:14:25', '员工离职:name:小明7523---workId:00008444', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2056, 9, '2023-03-06 11:14:25', '员工离职:name:小明7522---workId:00008443', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2057, 9, '2023-03-06 11:14:25', '员工离职:name:小明7521---workId:00008442', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2058, 9, '2023-03-06 11:14:25', '员工离职:name:小明7520---workId:00008441', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2059, 9, '2023-03-06 11:14:25', '员工离职:name:小明7519---workId:00008440', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2060, 9, '2023-03-06 11:14:25', '员工离职:name:小明7518---workId:00008439', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2061, 9, '2023-03-06 11:14:25', '员工离职:name:小明7517---workId:00008438', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2062, 9, '2023-03-06 11:14:25', '员工离职:name:小明7516---workId:00008437', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2063, 9, '2023-03-06 11:14:25', '员工离职:name:小明7515---workId:00008436', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2064, 9, '2023-03-06 11:14:25', '员工离职:name:小明7514---workId:00008435', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2065, 9, '2023-03-06 11:14:25', '员工离职:name:小明7513---workId:00008434', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2066, 9, '2023-03-06 11:14:25', '员工离职:name:小明7512---workId:00008433', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2067, 9, '2023-03-06 11:14:25', '员工离职:name:小明7511---workId:00008432', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2068, 9, '2023-03-06 11:14:25', '员工离职:name:小明7510---workId:00008431', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2069, 9, '2023-03-06 11:14:25', '员工离职:name:小明7509---workId:00008430', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2070, 9, '2023-03-06 11:14:25', '员工离职:name:小明7508---workId:00008429', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2071, 9, '2023-03-06 11:14:25', '员工离职:name:小明7507---workId:00008428', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2072, 9, '2023-03-06 11:14:25', '员工离职:name:小明7506---workId:00008427', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2073, 9, '2023-03-06 11:14:25', '员工离职:name:小明7505---workId:00008426', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2074, 9, '2023-03-06 11:14:25', '员工离职:name:小明7504---workId:00008425', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2075, 9, '2023-03-06 11:14:25', '员工离职:name:小明7503---workId:00008424', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2076, 9, '2023-03-06 11:14:25', '员工离职:name:小明7502---workId:00008423', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2077, 9, '2023-03-06 11:14:25', '员工离职:name:小明7501---workId:00008422', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2078, 9, '2023-03-06 11:14:25', '员工离职:name:小明7500---workId:00008421', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2079, 9, '2023-03-06 11:14:25', '员工离职:name:小明7499---workId:00008420', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2080, 9, '2023-03-06 11:14:25', '员工离职:name:小明7498---workId:00008419', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2081, 9, '2023-03-06 11:14:25', '员工离职:name:小明7497---workId:00008418', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2082, 9, '2023-03-06 11:14:25', '员工离职:name:小明7496---workId:00008417', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2083, 9, '2023-03-06 11:14:25', '员工离职:name:小明7495---workId:00008416', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2084, 9, '2023-03-06 11:14:25', '员工离职:name:小明7494---workId:00008415', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2085, 9, '2023-03-06 11:14:25', '员工离职:name:小明7493---workId:00008414', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2086, 9, '2023-03-06 11:14:25', '员工离职:name:小明7492---workId:00008413', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2087, 9, '2023-03-06 11:14:25', '员工离职:name:小明7491---workId:00008412', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2088, 9, '2023-03-06 11:14:25', '员工离职:name:小明7490---workId:00008411', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2089, 9, '2023-03-06 11:14:25', '员工离职:name:小明7489---workId:00008410', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2090, 9, '2023-03-06 11:14:25', '员工离职:name:小明7488---workId:00008409', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2091, 9, '2023-03-06 11:14:25', '员工离职:name:小明7487---workId:00008408', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2092, 9, '2023-03-06 11:14:25', '员工离职:name:小明7486---workId:00008407', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2093, 9, '2023-03-06 11:14:25', '员工离职:name:小明7485---workId:00008406', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2094, 9, '2023-03-06 11:14:25', '员工离职:name:小明7484---workId:00008405', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2095, 9, '2023-03-06 11:14:25', '员工离职:name:小明7483---workId:00008404', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2096, 9, '2023-03-06 11:14:25', '员工离职:name:小明7482---workId:00008403', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2097, 9, '2023-03-06 11:14:25', '员工离职:name:小明7481---workId:00008402', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2098, 9, '2023-03-06 11:14:25', '员工离职:name:小明7480---workId:00008401', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2099, 9, '2023-03-06 11:14:26', '员工离职:name:小明7479---workId:00008400', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2100, 9, '2023-03-06 11:14:26', '员工离职:name:小明7478---workId:00008399', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2101, 9, '2023-03-06 11:14:26', '员工离职:name:小明7477---workId:00008398', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2102, 9, '2023-03-06 11:14:26', '员工离职:name:小明7476---workId:00008397', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2103, 9, '2023-03-06 11:14:26', '员工离职:name:小明7475---workId:00008396', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2104, 9, '2023-03-06 11:14:26', '员工离职:name:小明7474---workId:00008395', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2105, 9, '2023-03-06 11:14:26', '员工离职:name:小明7473---workId:00008394', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2106, 9, '2023-03-06 11:14:26', '员工离职:name:小明7472---workId:00008393', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2107, 9, '2023-03-06 11:14:26', '员工离职:name:小明7471---workId:00008392', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2108, 9, '2023-03-06 11:14:26', '员工离职:name:小明7470---workId:00008391', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2109, 9, '2023-03-06 11:14:26', '员工离职:name:小明7469---workId:00008390', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2110, 9, '2023-03-06 11:14:26', '员工离职:name:小明7468---workId:00008389', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2111, 9, '2023-03-06 11:14:26', '员工离职:name:小明7467---workId:00008388', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2112, 9, '2023-03-06 11:14:26', '员工离职:name:小明7466---workId:00008387', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2113, 9, '2023-03-06 11:14:26', '员工离职:name:小明7465---workId:00008386', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2114, 9, '2023-03-06 11:14:26', '员工离职:name:小明7464---workId:00008385', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2115, 9, '2023-03-06 11:14:26', '员工离职:name:小明7463---workId:00008384', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2116, 9, '2023-03-06 11:14:26', '员工离职:name:小明7462---workId:00008383', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2117, 9, '2023-03-06 11:14:26', '员工离职:name:小明7461---workId:00008382', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2118, 9, '2023-03-06 11:14:26', '员工离职:name:小明7460---workId:00008381', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2119, 9, '2023-03-06 11:14:26', '员工离职:name:小明7459---workId:00008380', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2120, 9, '2023-03-06 11:14:26', '员工离职:name:小明7458---workId:00008379', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2121, 9, '2023-03-06 11:14:26', '员工离职:name:小明7457---workId:00008378', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2122, 9, '2023-03-06 11:14:26', '员工离职:name:小明7456---workId:00008377', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2123, 9, '2023-03-06 11:14:26', '员工离职:name:小明7455---workId:00008376', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2124, 9, '2023-03-06 11:14:26', '员工离职:name:小明7454---workId:00008375', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2125, 9, '2023-03-06 11:14:26', '员工离职:name:小明7453---workId:00008374', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2126, 9, '2023-03-06 11:14:26', '员工离职:name:小明7452---workId:00008373', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2127, 9, '2023-03-06 11:14:34', '员工批量离职:name:', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2128, 9, '2023-03-06 11:14:34', '员工离职:name:小明7451---workId:00008372', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2129, 9, '2023-03-06 11:14:34', '员工离职:name:小明7450---workId:00008371', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2130, 9, '2023-03-06 11:14:34', '员工离职:name:小明7449---workId:00008370', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2131, 9, '2023-03-06 11:14:34', '员工离职:name:小明7448---workId:00008369', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2132, 9, '2023-03-06 11:14:34', '员工离职:name:小明7447---workId:00008368', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2133, 9, '2023-03-06 11:14:34', '员工离职:name:小明7446---workId:00008367', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2134, 9, '2023-03-06 11:14:34', '员工离职:name:小明7445---workId:00008366', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2135, 9, '2023-03-06 11:14:34', '员工离职:name:小明7444---workId:00008365', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2136, 9, '2023-03-06 11:14:34', '员工离职:name:小明7443---workId:00008364', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2137, 9, '2023-03-06 11:14:34', '员工离职:name:小明7442---workId:00008363', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2138, 9, '2023-03-06 11:14:34', '员工离职:name:小明7441---workId:00008362', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2139, 9, '2023-03-06 11:14:34', '员工离职:name:小明7440---workId:00008361', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2140, 9, '2023-03-06 11:14:34', '员工离职:name:小明7439---workId:00008360', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2141, 9, '2023-03-06 11:14:34', '员工离职:name:小明7438---workId:00008359', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2142, 9, '2023-03-06 11:14:34', '员工离职:name:小明7437---workId:00008358', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2143, 9, '2023-03-06 11:14:34', '员工离职:name:小明7436---workId:00008357', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2144, 9, '2023-03-06 11:14:34', '员工离职:name:小明7435---workId:00008356', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2145, 9, '2023-03-06 11:14:34', '员工离职:name:小明7434---workId:00008355', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2146, 9, '2023-03-06 11:14:35', '员工离职:name:小明7433---workId:00008354', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2147, 9, '2023-03-06 11:14:35', '员工离职:name:小明7432---workId:00008353', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2148, 9, '2023-03-06 11:14:35', '员工离职:name:小明7431---workId:00008352', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2149, 9, '2023-03-06 11:14:35', '员工离职:name:小明7430---workId:00008351', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2150, 9, '2023-03-06 11:14:35', '员工离职:name:小明7429---workId:00008350', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2151, 9, '2023-03-06 11:14:35', '员工离职:name:小明7428---workId:00008349', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2152, 9, '2023-03-06 11:14:35', '员工离职:name:小明7427---workId:00008348', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2153, 9, '2023-03-06 11:14:35', '员工离职:name:小明7426---workId:00008347', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2154, 9, '2023-03-06 11:14:35', '员工离职:name:小明7425---workId:00008346', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2155, 9, '2023-03-06 11:14:35', '员工离职:name:小明7424---workId:00008345', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2156, 9, '2023-03-06 11:14:35', '员工离职:name:小明7423---workId:00008344', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2157, 9, '2023-03-06 11:14:35', '员工离职:name:小明7422---workId:00008343', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2158, 9, '2023-03-06 11:14:35', '员工离职:name:小明7421---workId:00008342', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2159, 9, '2023-03-06 11:14:35', '员工离职:name:小明7420---workId:00008341', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2160, 9, '2023-03-06 11:14:35', '员工离职:name:小明7419---workId:00008340', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2161, 9, '2023-03-06 11:14:35', '员工离职:name:小明7418---workId:00008339', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2162, 9, '2023-03-06 11:14:35', '员工离职:name:小明7417---workId:00008338', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2163, 9, '2023-03-06 11:14:35', '员工离职:name:小明7416---workId:00008337', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2164, 9, '2023-03-06 11:14:35', '员工离职:name:小明7415---workId:00008336', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2165, 9, '2023-03-06 11:14:35', '员工离职:name:小明7414---workId:00008335', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2166, 9, '2023-03-06 11:14:35', '员工离职:name:小明7413---workId:00008334', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2167, 9, '2023-03-06 11:14:35', '员工离职:name:小明7412---workId:00008333', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2168, 9, '2023-03-06 11:14:35', '员工离职:name:小明7411---workId:00008332', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2169, 9, '2023-03-06 11:14:35', '员工离职:name:小明7410---workId:00008331', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2170, 9, '2023-03-06 11:14:35', '员工离职:name:小明7409---workId:00008330', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2171, 9, '2023-03-06 11:14:35', '员工离职:name:小明7408---workId:00008329', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2172, 9, '2023-03-06 11:14:35', '员工离职:name:小明7407---workId:00008328', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2173, 9, '2023-03-06 11:14:35', '员工离职:name:小明7406---workId:00008327', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2174, 9, '2023-03-06 11:14:35', '员工离职:name:小明7405---workId:00008326', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2175, 9, '2023-03-06 11:14:35', '员工离职:name:小明7404---workId:00008325', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2176, 9, '2023-03-06 11:14:35', '员工离职:name:小明7403---workId:00008324', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2177, 9, '2023-03-06 11:14:35', '员工离职:name:小明7402---workId:00008323', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2178, 9, '2023-03-06 11:14:35', '员工离职:name:小明7401---workId:00008322', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2179, 9, '2023-03-06 11:14:35', '员工离职:name:小明7400---workId:00008321', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2180, 9, '2023-03-06 11:14:35', '员工离职:name:小明7399---workId:00008320', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2181, 9, '2023-03-06 11:14:35', '员工离职:name:小明7398---workId:00008319', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2182, 9, '2023-03-06 11:14:35', '员工离职:name:小明7397---workId:00008318', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2183, 9, '2023-03-06 11:14:35', '员工离职:name:小明7396---workId:00008317', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2184, 9, '2023-03-06 11:14:35', '员工离职:name:小明7395---workId:00008316', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2185, 9, '2023-03-06 11:14:35', '员工离职:name:小明7394---workId:00008315', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2186, 9, '2023-03-06 11:14:35', '员工离职:name:小明7393---workId:00008314', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2187, 9, '2023-03-06 11:14:35', '员工离职:name:小明7392---workId:00008313', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2188, 9, '2023-03-06 11:14:35', '员工离职:name:小明7391---workId:00008312', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2189, 9, '2023-03-06 11:14:35', '员工离职:name:小明7390---workId:00008311', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2190, 9, '2023-03-06 11:14:35', '员工离职:name:小明7389---workId:00008310', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2191, 9, '2023-03-06 11:14:35', '员工离职:name:小明7388---workId:00008309', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2192, 9, '2023-03-06 11:14:35', '员工离职:name:小明7387---workId:00008308', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2193, 9, '2023-03-06 11:14:35', '员工离职:name:小明7386---workId:00008307', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2194, 9, '2023-03-06 11:14:35', '员工离职:name:小明7385---workId:00008306', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2195, 9, '2023-03-06 11:14:36', '员工离职:name:小明7384---workId:00008305', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2196, 9, '2023-03-06 11:14:36', '员工离职:name:小明7383---workId:00008304', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2197, 9, '2023-03-06 11:14:36', '员工离职:name:小明7382---workId:00008303', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2198, 9, '2023-03-06 11:14:36', '员工离职:name:小明7381---workId:00008302', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2199, 9, '2023-03-06 11:14:36', '员工离职:name:小明7380---workId:00008301', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2200, 9, '2023-03-06 11:14:36', '员工离职:name:小明7379---workId:00008300', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2201, 9, '2023-03-06 11:14:36', '员工离职:name:小明7378---workId:00008299', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2202, 9, '2023-03-06 11:14:36', '员工离职:name:小明7377---workId:00008298', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2203, 9, '2023-03-06 11:14:36', '员工离职:name:小明7376---workId:00008297', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2204, 9, '2023-03-06 11:14:36', '员工离职:name:小明7375---workId:00008296', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2205, 9, '2023-03-06 11:14:36', '员工离职:name:小明7374---workId:00008295', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2206, 9, '2023-03-06 11:14:36', '员工离职:name:小明7373---workId:00008294', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2207, 9, '2023-03-06 11:14:36', '员工离职:name:小明7372---workId:00008293', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2208, 9, '2023-03-06 11:14:36', '员工离职:name:小明7371---workId:00008292', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2209, 9, '2023-03-06 11:14:36', '员工离职:name:小明7370---workId:00008291', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2210, 9, '2023-03-06 11:14:36', '员工离职:name:小明7369---workId:00008290', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2211, 9, '2023-03-06 11:14:36', '员工离职:name:小明7368---workId:00008289', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2212, 9, '2023-03-06 11:14:36', '员工离职:name:小明7367---workId:00008288', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2213, 9, '2023-03-06 11:14:36', '员工离职:name:小明7366---workId:00008287', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2214, 9, '2023-03-06 11:14:36', '员工离职:name:小明7365---workId:00008286', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2215, 9, '2023-03-06 11:14:36', '员工离职:name:小明7364---workId:00008285', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2216, 9, '2023-03-06 11:14:36', '员工离职:name:小明7363---workId:00008284', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2217, 9, '2023-03-06 11:14:36', '员工离职:name:小明7362---workId:00008283', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2218, 9, '2023-03-06 11:14:36', '员工离职:name:小明7361---workId:00008282', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2219, 9, '2023-03-06 11:14:36', '员工离职:name:小明7360---workId:00008281', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2220, 9, '2023-03-06 11:14:36', '员工离职:name:小明7359---workId:00008280', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2221, 9, '2023-03-06 11:14:36', '员工离职:name:小明7358---workId:00008279', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2222, 9, '2023-03-06 11:14:36', '员工离职:name:小明7357---workId:00008278', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2223, 9, '2023-03-06 11:14:36', '员工离职:name:小明7356---workId:00008277', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2224, 9, '2023-03-06 11:14:36', '员工离职:name:小明7355---workId:00008276', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2225, 9, '2023-03-06 11:14:36', '员工离职:name:小明7354---workId:00008275', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2226, 9, '2023-03-06 11:14:36', '员工离职:name:小明7353---workId:00008274', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2227, 9, '2023-03-06 11:14:36', '员工离职:name:小明7352---workId:00008273', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2228, 9, '2023-03-06 11:14:36', '员工离职:name:小明7351---workId:00008272', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2229, 9, '2023-03-06 11:14:36', '员工离职:name:小明7350---workId:00008271', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2230, 9, '2023-03-06 11:14:36', '员工离职:name:小明7349---workId:00008270', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2231, 9, '2023-03-06 11:14:36', '员工离职:name:小明7348---workId:00008269', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2232, 9, '2023-03-06 11:14:36', '员工离职:name:小明7347---workId:00008268', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2233, 9, '2023-03-06 11:14:36', '员工离职:name:小明7346---workId:00008267', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2234, 9, '2023-03-06 11:14:36', '员工离职:name:小明7345---workId:00008266', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2235, 9, '2023-03-06 11:14:36', '员工离职:name:小明7344---workId:00008265', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2236, 9, '2023-03-06 11:14:36', '员工离职:name:小明7343---workId:00008264', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2237, 9, '2023-03-06 11:14:36', '员工离职:name:小明7342---workId:00008263', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2238, 9, '2023-03-06 11:14:36', '员工离职:name:小明7341---workId:00008262', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2239, 9, '2023-03-06 11:14:36', '员工离职:name:小明7340---workId:00008261', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2240, 9, '2023-03-06 11:14:36', '员工离职:name:小明7339---workId:00008260', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2241, 9, '2023-03-06 11:14:36', '员工离职:name:小明7338---workId:00008259', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2242, 9, '2023-03-06 11:14:36', '员工离职:name:小明7337---workId:00008258', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2243, 9, '2023-03-06 11:14:36', '员工离职:name:小明7336---workId:00008257', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2244, 9, '2023-03-06 11:14:37', '员工离职:name:小明7335---workId:00008256', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2245, 9, '2023-03-06 11:14:37', '员工离职:name:小明7334---workId:00008255', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2246, 9, '2023-03-06 11:14:37', '员工离职:name:小明7333---workId:00008254', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2247, 9, '2023-03-06 11:14:37', '员工离职:name:小明7332---workId:00008253', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2248, 9, '2023-03-06 11:14:37', '员工离职:name:小明7331---workId:00008252', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2249, 9, '2023-03-06 11:14:37', '员工离职:name:小明7330---workId:00008251', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2250, 9, '2023-03-06 11:14:37', '员工离职:name:小明7329---workId:00008250', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2251, 9, '2023-03-06 11:14:37', '员工离职:name:小明7328---workId:00008249', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2252, 9, '2023-03-06 11:14:37', '员工离职:name:小明7327---workId:00008248', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2253, 9, '2023-03-06 11:14:37', '员工离职:name:小明7326---workId:00008247', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2254, 9, '2023-03-06 11:14:37', '员工离职:name:小明7325---workId:00008246', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2255, 9, '2023-03-06 11:14:37', '员工离职:name:小明7324---workId:00008245', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2256, 9, '2023-03-06 11:14:37', '员工离职:name:小明7323---workId:00008244', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2257, 9, '2023-03-06 11:14:37', '员工离职:name:小明7322---workId:00008243', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2258, 9, '2023-03-06 11:14:37', '员工离职:name:小明7321---workId:00008242', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2259, 9, '2023-03-06 11:14:37', '员工离职:name:小明7320---workId:00008241', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2260, 9, '2023-03-06 11:14:37', '员工离职:name:小明7319---workId:00008240', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2261, 9, '2023-03-06 11:14:37', '员工离职:name:小明7318---workId:00008239', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2262, 9, '2023-03-06 11:14:37', '员工离职:name:小明7317---workId:00008238', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2263, 9, '2023-03-06 11:14:37', '员工离职:name:小明7316---workId:00008237', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2264, 9, '2023-03-06 11:14:37', '员工离职:name:小明7315---workId:00008236', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2265, 9, '2023-03-06 11:14:37', '员工离职:name:小明7314---workId:00008235', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2266, 9, '2023-03-06 11:14:37', '员工离职:name:小明7313---workId:00008234', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2267, 9, '2023-03-06 11:14:37', '员工离职:name:小明7312---workId:00008233', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2268, 9, '2023-03-06 11:14:37', '员工离职:name:小明7311---workId:00008232', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2269, 9, '2023-03-06 11:14:37', '员工离职:name:小明7310---workId:00008231', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2270, 9, '2023-03-06 11:14:37', '员工离职:name:小明7309---workId:00008230', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2271, 9, '2023-03-06 11:14:37', '员工离职:name:小明7308---workId:00008229', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2272, 9, '2023-03-06 11:14:37', '员工离职:name:小明7307---workId:00008228', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2273, 9, '2023-03-06 11:14:37', '员工离职:name:小明7306---workId:00008227', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2274, 9, '2023-03-06 11:14:37', '员工离职:name:小明7305---workId:00008226', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2275, 9, '2023-03-06 11:14:37', '员工离职:name:小明7304---workId:00008225', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2276, 9, '2023-03-06 11:14:37', '员工离职:name:小明7303---workId:00008224', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2277, 9, '2023-03-06 11:14:37', '员工离职:name:小明7302---workId:00008223', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2278, 9, '2023-03-06 11:14:37', '员工离职:name:小明7301---workId:00008222', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2279, 9, '2023-03-06 11:14:37', '员工离职:name:小明7300---workId:00008221', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2280, 9, '2023-03-06 11:14:37', '员工离职:name:小明7299---workId:00008220', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2281, 9, '2023-03-06 11:14:37', '员工离职:name:小明7298---workId:00008219', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2282, 9, '2023-03-06 11:14:37', '员工离职:name:小明7297---workId:00008218', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2283, 9, '2023-03-06 11:14:37', '员工离职:name:小明7296---workId:00008217', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2284, 9, '2023-03-06 11:14:37', '员工离职:name:小明7295---workId:00008216', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2285, 9, '2023-03-06 11:14:37', '员工离职:name:小明7294---workId:00008215', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2286, 9, '2023-03-06 11:14:37', '员工离职:name:小明7293---workId:00008214', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2287, 9, '2023-03-06 11:14:37', '员工离职:name:小明7292---workId:00008213', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2288, 9, '2023-03-06 11:14:37', '员工离职:name:小明7291---workId:00008212', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2289, 9, '2023-03-06 11:14:37', '员工离职:name:小明7290---workId:00008211', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2290, 9, '2023-03-06 11:14:37', '员工离职:name:小明7289---workId:00008210', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2291, 9, '2023-03-06 11:14:37', '员工离职:name:小明7288---workId:00008209', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2292, 9, '2023-03-06 11:14:37', '员工离职:name:小明7287---workId:00008208', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2293, 9, '2023-03-06 11:14:38', '员工离职:name:小明7286---workId:00008207', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2294, 9, '2023-03-06 11:14:38', '员工离职:name:小明7285---workId:00008206', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2295, 9, '2023-03-06 11:14:38', '员工离职:name:小明7284---workId:00008205', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2296, 9, '2023-03-06 11:14:38', '员工离职:name:小明7283---workId:00008204', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2297, 9, '2023-03-06 11:14:38', '员工离职:name:小明7282---workId:00008203', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2298, 9, '2023-03-06 11:14:38', '员工离职:name:小明7281---workId:00008202', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2299, 9, '2023-03-06 11:14:38', '员工离职:name:小明7280---workId:00008201', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2300, 9, '2023-03-06 11:14:38', '员工离职:name:小明7279---workId:00008200', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2301, 9, '2023-03-06 11:14:38', '员工离职:name:小明7278---workId:00008199', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2302, 9, '2023-03-06 11:14:38', '员工离职:name:小明7277---workId:00008198', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2303, 9, '2023-03-06 11:14:38', '员工离职:name:小明7276---workId:00008197', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2304, 9, '2023-03-06 11:14:38', '员工离职:name:小明7275---workId:00008196', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2305, 9, '2023-03-06 11:14:38', '员工离职:name:小明7274---workId:00008195', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2306, 9, '2023-03-06 11:14:38', '员工离职:name:小明7273---workId:00008194', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2307, 9, '2023-03-06 11:14:38', '员工离职:name:小明7272---workId:00008193', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2308, 9, '2023-03-06 11:14:38', '员工离职:name:小明7271---workId:00008192', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2309, 9, '2023-03-06 11:14:38', '员工离职:name:小明7270---workId:00008191', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2310, 9, '2023-03-06 11:14:38', '员工离职:name:小明7269---workId:00008190', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2311, 9, '2023-03-06 11:14:38', '员工离职:name:小明7268---workId:00008189', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2312, 9, '2023-03-06 11:14:38', '员工离职:name:小明7267---workId:00008188', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2313, 9, '2023-03-06 11:14:38', '员工离职:name:小明7266---workId:00008187', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2314, 9, '2023-03-06 11:14:38', '员工离职:name:小明7265---workId:00008186', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2315, 9, '2023-03-06 11:14:38', '员工离职:name:小明7264---workId:00008185', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2316, 9, '2023-03-06 11:14:38', '员工离职:name:小明7263---workId:00008184', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2317, 9, '2023-03-06 11:14:38', '员工离职:name:小明7262---workId:00008183', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2318, 9, '2023-03-06 11:14:38', '员工离职:name:小明7261---workId:00008182', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2319, 9, '2023-03-06 11:14:38', '员工离职:name:小明7260---workId:00008181', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2320, 9, '2023-03-06 11:14:38', '员工离职:name:小明7259---workId:00008180', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2321, 9, '2023-03-06 11:14:38', '员工离职:name:小明7258---workId:00008179', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2322, 9, '2023-03-06 11:14:38', '员工离职:name:小明7257---workId:00008178', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2323, 9, '2023-03-06 11:14:38', '员工离职:name:小明7256---workId:00008177', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2324, 9, '2023-03-06 11:14:38', '员工离职:name:小明7255---workId:00008176', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2325, 9, '2023-03-06 11:14:38', '员工离职:name:小明7254---workId:00008175', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2326, 9, '2023-03-06 11:14:38', '员工离职:name:小明7253---workId:00008174', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2327, 9, '2023-03-06 11:14:38', '员工离职:name:小明7252---workId:00008173', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2328, 9, '2023-03-06 11:14:38', '员工离职:name:小明7251---workId:00008172', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2329, 9, '2023-03-06 11:14:38', '员工离职:name:小明7250---workId:00008171', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2330, 9, '2023-03-06 11:14:38', '员工离职:name:小明7249---workId:00008170', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2331, 9, '2023-03-06 11:14:38', '员工离职:name:小明7215---workId:00008136', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2332, 9, '2023-03-06 11:14:38', '员工离职:name:小明7214---workId:00008135', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2333, 9, '2023-03-06 11:14:38', '员工离职:name:小明7213---workId:00008134', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2334, 9, '2023-03-06 11:14:38', '员工离职:name:小明7212---workId:00008133', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2335, 9, '2023-03-06 11:14:38', '员工离职:name:小明7211---workId:00008132', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2336, 9, '2023-03-06 11:14:38', '员工离职:name:小明7210---workId:00008131', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2337, 9, '2023-03-06 11:14:38', '员工离职:name:小明7209---workId:00008130', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2338, 9, '2023-03-06 11:14:39', '员工离职:name:小明7208---workId:00008129', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2339, 9, '2023-03-06 11:14:39', '员工离职:name:小明7207---workId:00008128', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2340, 9, '2023-03-06 11:14:39', '员工离职:name:小明7206---workId:00008127', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2341, 9, '2023-03-06 11:14:39', '员工离职:name:小明7205---workId:00008126', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2342, 9, '2023-03-06 11:14:39', '员工离职:name:小明7204---workId:00008125', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2343, 9, '2023-03-06 11:14:39', '员工离职:name:小明7203---workId:00008124', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2344, 9, '2023-03-06 11:14:39', '员工离职:name:小明7202---workId:00008123', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2345, 9, '2023-03-06 11:14:39', '员工离职:name:小明7201---workId:00008122', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2346, 9, '2023-03-06 11:14:39', '员工离职:name:小明7200---workId:00008121', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2347, 9, '2023-03-06 11:14:39', '员工离职:name:小明7199---workId:00008120', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2348, 9, '2023-03-06 11:14:39', '员工离职:name:小明7198---workId:00008119', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2349, 9, '2023-03-06 11:14:39', '员工离职:name:小明7197---workId:00008118', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2350, 9, '2023-03-06 11:14:39', '员工离职:name:小明7196---workId:00008117', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2351, 9, '2023-03-06 11:14:39', '员工离职:name:小明7195---workId:00008116', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2352, 9, '2023-03-06 11:14:39', '员工离职:name:小明7194---workId:00008115', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2353, 9, '2023-03-06 11:14:39', '员工离职:name:小明7193---workId:00008114', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2354, 9, '2023-03-06 11:14:39', '员工离职:name:小明7192---workId:00008113', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2355, 9, '2023-03-06 11:14:39', '员工离职:name:小明7191---workId:00008112', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2356, 9, '2023-03-06 11:14:39', '员工离职:name:小明7190---workId:00008111', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2357, 9, '2023-03-06 11:14:39', '员工离职:name:小明7189---workId:00008110', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2358, 9, '2023-03-06 11:14:39', '员工离职:name:小明7188---workId:00008109', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2359, 9, '2023-03-06 11:14:39', '员工离职:name:小明7187---workId:00008108', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2360, 9, '2023-03-06 11:14:39', '员工离职:name:小明7186---workId:00008107', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2361, 9, '2023-03-06 11:14:39', '员工离职:name:小明7185---workId:00008106', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2362, 9, '2023-03-06 11:14:39', '员工离职:name:小明7184---workId:00008105', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2363, 9, '2023-03-06 11:14:39', '员工离职:name:小明7183---workId:00008104', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2364, 9, '2023-03-06 11:14:39', '员工离职:name:小明7182---workId:00008103', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2365, 9, '2023-03-06 11:14:39', '员工离职:name:小明7181---workId:00008102', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2366, 9, '2023-03-06 11:14:39', '员工离职:name:小明7180---workId:00008101', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2367, 9, '2023-03-06 11:14:39', '员工离职:name:小明7179---workId:00008100', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2368, 9, '2023-03-06 11:14:39', '员工离职:name:小明7178---workId:00008099', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2369, 9, '2023-03-06 11:14:39', '员工离职:name:小明7177---workId:00008098', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2370, 9, '2023-03-06 11:14:39', '员工离职:name:小明7176---workId:00008097', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2371, 9, '2023-03-06 11:14:39', '员工离职:name:小明7175---workId:00008096', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2372, 9, '2023-03-06 11:14:39', '员工离职:name:小明7174---workId:00008095', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2373, 9, '2023-03-06 11:14:39', '员工离职:name:小明7173---workId:00008094', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2374, 9, '2023-03-06 11:14:39', '员工离职:name:小明7172---workId:00008093', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2375, 9, '2023-03-06 11:14:39', '员工离职:name:小明7171---workId:00008092', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2376, 9, '2023-03-06 11:14:39', '员工离职:name:小明7170---workId:00008091', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2377, 9, '2023-03-06 11:14:40', '员工离职:name:小明7169---workId:00008090', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2378, 9, '2023-03-06 11:14:40', '员工离职:name:小明7168---workId:00008089', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2379, 9, '2023-03-06 11:14:40', '员工离职:name:小明7167---workId:00008088', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2380, 9, '2023-03-06 11:14:40', '员工离职:name:小明7166---workId:00008087', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2381, 9, '2023-03-06 11:14:40', '员工离职:name:小明7165---workId:00008086', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2382, 9, '2023-03-06 11:14:40', '员工离职:name:小明7164---workId:00008085', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2383, 9, '2023-03-06 11:14:40', '员工离职:name:小明7163---workId:00008084', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2384, 9, '2023-03-06 11:14:40', '员工离职:name:小明7162---workId:00008083', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2385, 9, '2023-03-06 11:14:40', '员工离职:name:小明7161---workId:00008082', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2386, 9, '2023-03-06 11:14:40', '员工离职:name:小明7160---workId:00008081', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2387, 9, '2023-03-06 11:14:40', '员工离职:name:小明7159---workId:00008080', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2388, 9, '2023-03-06 11:14:40', '员工离职:name:小明7158---workId:00008079', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2389, 9, '2023-03-06 11:14:40', '员工离职:name:小明7157---workId:00008078', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2390, 9, '2023-03-06 11:14:40', '员工离职:name:小明7156---workId:00008077', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2391, 9, '2023-03-06 11:14:40', '员工离职:name:小明7155---workId:00008076', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2392, 9, '2023-03-06 11:14:40', '员工离职:name:小明7154---workId:00008075', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2393, 9, '2023-03-06 11:14:40', '员工离职:name:小明7153---workId:00008074', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2394, 9, '2023-03-06 11:14:40', '员工离职:name:小明7152---workId:00008073', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2395, 9, '2023-03-06 11:14:40', '员工离职:name:小明7151---workId:00008072', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2396, 9, '2023-03-06 11:14:40', '员工离职:name:小明7150---workId:00008071', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2397, 9, '2023-03-06 11:14:40', '员工离职:name:小明7149---workId:00008070', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2398, 9, '2023-03-06 11:14:40', '员工离职:name:小明7148---workId:00008069', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2399, 9, '2023-03-06 11:14:40', '员工离职:name:小明7147---workId:00008068', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2400, 9, '2023-03-06 11:14:40', '员工离职:name:小明7146---workId:00008067', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2401, 9, '2023-03-06 11:14:40', '员工离职:name:小明7145---workId:00008066', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2402, 9, '2023-03-06 11:14:40', '员工离职:name:小明7144---workId:00008065', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2403, 9, '2023-03-06 11:14:40', '员工离职:name:小明7143---workId:00008064', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2404, 9, '2023-03-06 11:14:40', '员工离职:name:小明7142---workId:00008063', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2405, 9, '2023-03-06 11:14:40', '员工离职:name:小明7141---workId:00008062', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2406, 9, '2023-03-06 11:14:40', '员工离职:name:小明7140---workId:00008061', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2407, 9, '2023-03-06 11:14:40', '员工离职:name:小明7139---workId:00008060', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2408, 9, '2023-03-06 11:14:40', '员工离职:name:小明7138---workId:00008059', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2409, 9, '2023-03-06 11:14:40', '员工离职:name:小明7137---workId:00008058', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2410, 9, '2023-03-06 11:14:40', '员工离职:name:小明7136---workId:00008057', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2411, 9, '2023-03-06 11:14:40', '员工离职:name:小明7135---workId:00008056', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2412, 9, '2023-03-06 11:14:40', '员工离职:name:小明7134---workId:00008055', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2413, 9, '2023-03-06 11:14:40', '员工离职:name:小明7133---workId:00008054', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2414, 9, '2023-03-06 11:14:40', '员工离职:name:小明7132---workId:00008053', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2415, 9, '2023-03-06 11:14:40', '员工离职:name:小明7131---workId:00008052', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2416, 9, '2023-03-06 11:14:40', '员工离职:name:小明7130---workId:00008051', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2417, 9, '2023-03-06 11:14:40', '员工离职:name:小明7129---workId:00008050', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2418, 9, '2023-03-06 11:14:40', '员工离职:name:小明7128---workId:00008049', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2419, 9, '2023-03-06 11:14:40', '员工离职:name:小明7127---workId:00008048', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2420, 9, '2023-03-06 11:14:40', '员工离职:name:小明7126---workId:00008047', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2421, 9, '2023-03-06 11:14:41', '员工离职:name:小明7125---workId:00008046', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2422, 9, '2023-03-06 11:14:41', '员工离职:name:小明7124---workId:00008045', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2423, 9, '2023-03-06 11:14:41', '员工离职:name:小明7123---workId:00008044', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2424, 9, '2023-03-06 11:14:41', '员工离职:name:小明7122---workId:00008043', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2425, 9, '2023-03-06 11:14:41', '员工离职:name:小明7121---workId:00008042', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2426, 9, '2023-03-06 11:14:41', '员工离职:name:小明7120---workId:00008041', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2427, 9, '2023-03-06 11:14:41', '员工离职:name:小明7119---workId:00008040', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2428, 9, '2023-03-06 11:14:41', '员工离职:name:小明7118---workId:00008039', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2429, 9, '2023-03-06 11:14:41', '员工离职:name:小明7117---workId:00008038', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2430, 9, '2023-03-06 11:14:41', '员工离职:name:小明7116---workId:00008037', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2431, 9, '2023-03-06 11:14:41', '员工离职:name:小明7102---workId:00008023', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2432, 9, '2023-03-06 11:14:41', '员工离职:name:小明7101---workId:00008022', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2433, 9, '2023-03-06 11:14:41', '员工离职:name:小明7100---workId:00008021', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2434, 9, '2023-03-06 11:14:41', '员工离职:name:小明7099---workId:00008020', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2435, 9, '2023-03-06 11:14:41', '员工离职:name:小明7098---workId:00008019', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2436, 9, '2023-03-06 11:14:41', '员工离职:name:小明7097---workId:00008018', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2437, 9, '2023-03-06 11:14:41', '员工离职:name:小明7096---workId:00008017', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2438, 9, '2023-03-06 11:14:41', '员工离职:name:小明7095---workId:00008016', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2439, 9, '2023-03-06 11:14:41', '员工离职:name:小明7094---workId:00008015', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2440, 9, '2023-03-06 11:14:41', '员工离职:name:小明7093---workId:00008014', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2441, 9, '2023-03-06 11:14:41', '员工离职:name:小明7092---workId:00008013', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2442, 9, '2023-03-06 11:14:41', '员工离职:name:小明7091---workId:00008012', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2443, 9, '2023-03-06 11:14:41', '员工离职:name:小明7090---workId:00008011', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2444, 9, '2023-03-06 11:14:41', '员工离职:name:小明7089---workId:00008010', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2445, 9, '2023-03-06 11:14:41', '员工离职:name:小明7088---workId:00008009', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2446, 9, '2023-03-06 11:14:41', '员工离职:name:小明7087---workId:00008008', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2447, 9, '2023-03-06 11:14:41', '员工离职:name:小明7086---workId:00008007', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2448, 9, '2023-03-06 11:14:41', '员工离职:name:小明7085---workId:00008006', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2449, 9, '2023-03-06 11:14:41', '员工离职:name:小明7084---workId:00008005', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2450, 9, '2023-03-06 11:14:41', '员工离职:name:小明7083---workId:00008004', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2451, 9, '2023-03-06 11:14:41', '员工离职:name:小明7082---workId:00008003', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2452, 9, '2023-03-06 11:14:41', '员工离职:name:小明7081---workId:00008002', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2453, 9, '2023-03-06 11:14:41', '员工离职:name:小明7080---workId:00008001', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2454, 9, '2023-03-06 11:14:41', '员工离职:name:小明7079---workId:00008000', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2455, 9, '2023-03-06 11:14:41', '员工离职:name:小明7078---workId:00007999', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2456, 9, '2023-03-06 11:14:41', '员工离职:name:小明7077---workId:00007998', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2457, 9, '2023-03-06 11:14:41', '员工离职:name:小明7076---workId:00007997', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2458, 9, '2023-03-06 11:14:41', '员工离职:name:小明7075---workId:00007996', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2459, 9, '2023-03-06 11:14:41', '员工离职:name:小明7074---workId:00007995', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2460, 9, '2023-03-06 11:14:41', '员工离职:name:小明7073---workId:00007994', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2461, 9, '2023-03-06 11:14:47', '员工批量离职:name:', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2462, 9, '2023-03-06 11:14:47', '员工离职:name:小明7072---workId:00007993', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2463, 9, '2023-03-06 11:14:47', '员工离职:name:小明7071---workId:00007992', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2464, 9, '2023-03-06 11:14:47', '员工离职:name:小明7070---workId:00007991', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2465, 9, '2023-03-06 11:14:47', '员工离职:name:小明7069---workId:00007990', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2466, 9, '2023-03-06 11:14:47', '员工离职:name:小明7068---workId:00007989', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2467, 9, '2023-03-06 11:14:47', '员工离职:name:小明7067---workId:00007988', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2468, 9, '2023-03-06 11:14:47', '员工离职:name:小明7066---workId:00007987', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2469, 9, '2023-03-06 11:14:47', '员工离职:name:小明7065---workId:00007986', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2470, 9, '2023-03-06 11:14:47', '员工离职:name:小明7064---workId:00007985', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2471, 9, '2023-03-06 11:14:47', '员工离职:name:小明7063---workId:00007984', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2472, 9, '2023-03-06 11:14:47', '员工离职:name:小明7062---workId:00007983', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2473, 9, '2023-03-06 11:14:47', '员工离职:name:小明7061---workId:00007982', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2474, 9, '2023-03-06 11:14:47', '员工离职:name:小明7060---workId:00007981', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2475, 9, '2023-03-06 11:14:47', '员工离职:name:小明7059---workId:00007980', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2476, 9, '2023-03-06 11:14:47', '员工离职:name:小明7058---workId:00007979', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2477, 9, '2023-03-06 11:14:47', '员工离职:name:小明7057---workId:00007978', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2478, 9, '2023-03-06 11:14:47', '员工离职:name:小明7056---workId:00007977', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2479, 9, '2023-03-06 11:14:47', '员工离职:name:小明7055---workId:00007976', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2480, 9, '2023-03-06 11:14:47', '员工离职:name:小明7054---workId:00007975', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2481, 9, '2023-03-06 11:14:47', '员工离职:name:小明7053---workId:00007974', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2482, 9, '2023-03-06 11:14:48', '员工离职:name:小明7052---workId:00007973', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2483, 9, '2023-03-06 11:14:48', '员工离职:name:小明7051---workId:00007972', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2484, 9, '2023-03-06 11:14:48', '员工离职:name:小明7050---workId:00007971', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2485, 9, '2023-03-06 11:14:48', '员工离职:name:小明7049---workId:00007970', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2486, 9, '2023-03-06 11:14:48', '员工离职:name:小明7048---workId:00007969', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2487, 9, '2023-03-06 11:14:48', '员工离职:name:小明7047---workId:00007968', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2488, 9, '2023-03-06 11:14:48', '员工离职:name:小明7046---workId:00007967', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2489, 9, '2023-03-06 11:14:48', '员工离职:name:小明7045---workId:00007966', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2490, 9, '2023-03-06 11:14:48', '员工离职:name:小明7044---workId:00007965', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2491, 9, '2023-03-06 11:14:48', '员工离职:name:小明7043---workId:00007964', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2492, 9, '2023-03-06 11:14:48', '员工离职:name:小明7042---workId:00007963', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2493, 9, '2023-03-06 11:14:48', '员工离职:name:小明7041---workId:00007962', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2494, 9, '2023-03-06 11:14:48', '员工离职:name:小明7040---workId:00007961', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2495, 9, '2023-03-06 11:14:48', '员工离职:name:小明7039---workId:00007960', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2496, 9, '2023-03-06 11:14:48', '员工离职:name:小明7037---workId:00007958', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2497, 9, '2023-03-06 11:14:48', '员工离职:name:小明7036---workId:00007957', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2498, 9, '2023-03-06 11:14:48', '员工离职:name:小明7035---workId:00007956', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2499, 9, '2023-03-06 11:14:48', '员工离职:name:小明7034---workId:00007955', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2500, 9, '2023-03-06 11:14:48', '员工离职:name:小明7033---workId:00007954', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2501, 9, '2023-03-06 11:14:48', '员工离职:name:小明7031---workId:00007952', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2502, 9, '2023-03-06 11:14:48', '员工离职:name:小明7030---workId:00007951', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2503, 9, '2023-03-06 11:14:48', '员工离职:name:小明7029---workId:00007950', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2504, 9, '2023-03-06 11:14:48', '员工离职:name:小明7027---workId:00007948', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2505, 9, '2023-03-06 11:14:48', '员工离职:name:小明7026---workId:00007947', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2506, 9, '2023-03-06 11:14:48', '员工离职:name:小明7025---workId:00007946', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2507, 9, '2023-03-06 11:14:48', '员工离职:name:小明7024---workId:00007945', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2508, 5, '2023-03-06 11:15:07', '删除套账:id=25', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2509, 5, '2023-03-06 11:15:09', '删除套账:id=24', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2510, 5, '2023-03-06 11:15:11', '删除套账:id=23', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2511, 5, '2023-03-06 11:15:13', '删除套账:id=22', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2512, 5, '2023-03-06 11:15:15', '删除套账:id=21', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2513, 5, '2023-03-06 11:15:17', '删除套账:id=20', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2514, 1, '2023-03-06 11:15:36', '删除部门:id=4', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2516, 1, '2023-03-06 11:16:03', '删除职位: id = 121', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2523, 1, '2023-03-06 11:30:48', '删除职位: id = 120', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2524, 1, '2023-03-06 11:31:11', '删除职位: id = 119', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2525, 1, '2023-03-06 11:31:13', '删除职位: id = 116', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2526, 1, '2023-03-06 11:31:26', '删除职称 : id=12', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2527, 1, '2023-03-06 11:31:31', '删除职称 : id=10', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2528, 1, '2023-03-06 11:31:36', '删除部门:id=81', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2529, 1, '2023-03-06 11:31:44', '删除部门:id=120', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2530, 1, '2023-03-06 11:31:48', '删除部门:id=92', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2531, 1, '2023-03-06 11:31:51', '删除部门:id=92', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2532, 1, '2023-03-06 11:31:55', '删除部门:id=119', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2533, 1, '2023-03-06 11:31:58', '删除部门:id=118', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2534, 1, '2023-03-06 11:32:00', '删除部门:id=117', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2535, 1, '2023-03-06 11:32:02', '删除部门:id=116', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2536, 1, '2023-03-06 11:32:06', '删除部门:id=92', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2537, 1, '2023-03-06 11:32:08', '删除部门:id=115', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2538, 1, '2023-03-06 11:32:10', '删除部门:id=114', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2539, 1, '2023-03-06 11:32:12', '删除部门:id=113', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2540, 1, '2023-03-06 11:32:15', '删除部门:id=91', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2541, 1, '2023-03-06 11:32:16', '删除部门:id=144', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2542, 1, '2023-03-06 11:32:18', '删除部门:id=142', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2543, 1, '2023-03-06 11:32:20', '删除部门:id=87', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2544, 1, '2023-03-06 11:32:22', '删除部门:id=86', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2545, 1, '2023-03-06 11:32:24', '删除部门:id=82', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2546, 1, '2023-03-06 11:32:25', '删除部门:id=133', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2547, 1, '2023-03-06 11:32:27', '删除部门:id=146', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2548, 1, '2023-03-06 11:32:28', '删除部门:id=145', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2549, 1, '2023-03-06 11:32:30', '删除部门:id=132', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2550, 1, '2023-03-06 11:32:32', '删除部门:id=131', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2551, 1, '2023-03-06 11:32:33', '删除部门:id=81', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2552, 1, '2023-03-06 11:32:35', '删除部门:id=78', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2553, 1, '2023-03-06 11:32:37', '删除部门:id=109', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2554, 1, '2023-03-06 11:32:39', '删除部门:id=8', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2555, 1, '2023-03-06 11:32:44', '删除部门:id=5', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2556, 1, '2023-03-06 11:32:46', '删除部门:id=4', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2557, 1, '2023-03-06 11:32:49', '删除部门:id=1', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2558, 1, '2023-03-06 11:39:54', '添加部门:测试', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2559, 1, '2023-03-06 11:40:03', '删除部门:id=147', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2564, 8, '2023-03-06 13:56:20', '操作员信息更新:小白', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2565, 8, '2023-03-06 13:56:43', '操作员信息更新:小白', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2568, 1, '2023-03-06 20:34:52', '删除奖惩: id = 30', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2574, 1, '2023-03-06 20:39:56', '删除角色: id = 14', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2575, 1, '2023-03-06 20:40:07', '删除角色: id = 5', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2576, 1, '2023-03-06 20:40:15', '删除角色: id = 3', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2577, 1, '2023-03-06 20:40:58', '角色权限变更', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2578, 2, '2023-03-06 20:45:06', '员工入职::name:小红workId:00000001', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2579, 1, '2023-03-06 20:46:22', '删除角色: id = 1', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2580, 1, '2023-03-06 20:46:26', '删除角色: id = 4', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2581, 1, '2023-03-06 20:46:31', '角色权限变更', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2582, 1, '2023-03-06 20:47:11', '角色权限变更', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2583, 1, '2023-03-06 20:47:22', '角色权限变更', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2584, 1, '2023-03-06 20:47:39', '角色权限变更', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2585, 1, '2023-03-06 20:48:12', '角色权限变更', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2586, 1, '2023-03-06 20:49:01', '角色权限变更', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2587, 1, '2023-03-06 20:51:01', '角色权限变更', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2588, 1, '2023-03-06 20:52:25', '角色权限变更', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2589, 7, '2023-03-06 20:56:58', '员工套账变动:workId:5268套账编号:10', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2590, 1, '2023-03-10 20:36:56', '角色权限变更', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2591, 1, '2023-03-10 20:50:37', '更新职位:技术总监', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2592, 1, '2023-03-10 20:58:54', '更新职位:技术总监', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2593, 1, '2023-03-10 21:04:42', '更新职称初级工程师', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2594, 5, '2023-03-10 21:07:53', '添加套账:name=测试讨帐', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2595, 7, '2023-03-10 21:08:11', '员工套账变动:workId:5268套账编号:26', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2596, 5, '2023-03-10 21:13:24', '更新套账:测试讨帐', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2597, 5, '2023-03-10 21:15:39', '更新套账:测试讨帐', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2598, 5, '2023-03-10 21:17:04', '更新套账:测试讨帐', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2599, 5, '2023-03-10 21:19:25', '更新套账:测试讨帐', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2600, 5, '2023-03-10 21:23:49', '更新套账:测试讨帐', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2601, 5, '2023-03-10 21:27:01', '更新套账:测试讨帐', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2602, 5, '2023-03-10 21:28:28', '更新套账:测试讨帐', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2603, 5, '2023-03-10 21:29:04', '更新套账:测试讨帐', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2604, 11, '2023-03-10 21:38:01', '更新员工资料::name:小红---workId:00000001', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2605, 6, '2023-03-10 21:38:01', '员工调动:eid=5268', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2606, 11, '2023-03-10 21:43:01', '更新员工资料::name:小红---workId:00000001', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2607, 6, '2023-03-10 21:43:01', '员工调动:eid=5268', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2608, 11, '2023-03-10 21:43:07', '更新员工资料::name:小红---workId:00000001', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2609, 6, '2023-03-10 21:43:07', '员工调动:eid=5268', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2610, 11, '2023-03-10 21:43:19', '更新员工资料::name:小红---workId:00000001', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2611, 6, '2023-03-10 21:43:19', '员工调动:eid=5268', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2612, 11, '2023-03-10 21:44:20', '更新员工资料::name:小红---workId:00000001', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2613, 6, '2023-03-10 21:44:20', '员工调动:eid=5268', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2614, 8, '2023-03-12 14:02:01', '操作员角色更新', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2615, 1, '2023-03-12 14:07:09', '添加部门:小部门', '系统管理员');
INSERT INTO `oplog` (`id`, `logtype`, `addDate`, `operate`, `hrname`) VALUES (2616, 1, '2023-03-12 14:08:15', '添加部门:小小部门', '系统管理员');
COMMIT;

-- ----------------------------
-- Table structure for politicsstatus
-- ----------------------------
DROP TABLE IF EXISTS `politicsstatus`;
CREATE TABLE `politicsstatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of politicsstatus
-- ----------------------------
BEGIN;
INSERT INTO `politicsstatus` (`id`, `name`) VALUES (1, '中共党员');
INSERT INTO `politicsstatus` (`id`, `name`) VALUES (2, '中共预备党员');
INSERT INTO `politicsstatus` (`id`, `name`) VALUES (3, '群众');
COMMIT;

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '职位',
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of position
-- ----------------------------
BEGIN;
INSERT INTO `position` (`id`, `name`, `createDate`, `enabled`) VALUES (29, '技术总监', '2023-03-10 20:58:54', 1);
INSERT INTO `position` (`id`, `name`, `createDate`, `enabled`) VALUES (30, '运营总监', '2020-01-05 17:51:25', 1);
INSERT INTO `position` (`id`, `name`, `createDate`, `enabled`) VALUES (33, '研发工程师', '2019-12-26 10:41:10', 1);
INSERT INTO `position` (`id`, `name`, `createDate`, `enabled`) VALUES (34, '运维工程师', '2020-01-14 23:02:49', 1);
INSERT INTO `position` (`id`, `name`, `createDate`, `enabled`) VALUES (115, '前端工程师', '2020-01-21 19:48:54', 0);
INSERT INTO `position` (`id`, `name`, `createDate`, `enabled`) VALUES (117, '销售工程师', '2020-01-05 17:52:12', 1);
INSERT INTO `position` (`id`, `name`, `createDate`, `enabled`) VALUES (118, '技术顾问', '2020-01-05 17:52:18', 1);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `nameZh` varchar(64) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `nameZh` (`nameZh`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` (`id`, `name`, `nameZh`) VALUES (2, 'ROLE_personnel', '人事专员');
INSERT INTO `role` (`id`, `name`, `nameZh`) VALUES (6, 'ROLE_admin', '系统管理员');
COMMIT;

-- ----------------------------
-- Table structure for rwards_punishments
-- ----------------------------
DROP TABLE IF EXISTS `rwards_punishments`;
CREATE TABLE `rwards_punishments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rpsystem_id` int DEFAULT NULL,
  `rpmsg` varchar(255) DEFAULT NULL,
  `rpiont` int DEFAULT NULL,
  `createrp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `rpmsg` (`rpmsg`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of rwards_punishments
-- ----------------------------
BEGIN;
INSERT INTO `rwards_punishments` (`id`, `rpsystem_id`, `rpmsg`, `rpiont`, `createrp`) VALUES (2, 1, '记小功', 3, '2019-12-28 10:32:50');
INSERT INTO `rwards_punishments` (`id`, `rpsystem_id`, `rpmsg`, `rpiont`, `createrp`) VALUES (3, 1, '记大功', 5, '2019-12-28 10:33:33');
INSERT INTO `rwards_punishments` (`id`, `rpsystem_id`, `rpmsg`, `rpiont`, `createrp`) VALUES (4, 1, '通报批评', -1, '2019-12-28 10:33:58');
INSERT INTO `rwards_punishments` (`id`, `rpsystem_id`, `rpmsg`, `rpiont`, `createrp`) VALUES (5, 1, '记小过', -5, '2019-12-28 10:34:19');
INSERT INTO `rwards_punishments` (`id`, `rpsystem_id`, `rpmsg`, `rpiont`, `createrp`) VALUES (9, 3, '罚款500元', -5, '2019-12-28 10:35:02');
INSERT INTO `rwards_punishments` (`id`, `rpsystem_id`, `rpmsg`, `rpiont`, `createrp`) VALUES (10, 3, '奖金50元', -2, '2019-12-28 10:35:03');
INSERT INTO `rwards_punishments` (`id`, `rpsystem_id`, `rpmsg`, `rpiont`, `createrp`) VALUES (19, 1, '嘉奖', 4, '2020-01-01 16:25:25');
INSERT INTO `rwards_punishments` (`id`, `rpsystem_id`, `rpmsg`, `rpiont`, `createrp`) VALUES (20, 5, '带薪调休', 1, '2020-01-01 16:53:07');
INSERT INTO `rwards_punishments` (`id`, `rpsystem_id`, `rpmsg`, `rpiont`, `createrp`) VALUES (21, 1, '晋职晋级', -2, '2020-01-06 10:40:26');
INSERT INTO `rwards_punishments` (`id`, `rpsystem_id`, `rpmsg`, `rpiont`, `createrp`) VALUES (22, 5, '年假+1', 3, '2020-01-11 19:05:55');
INSERT INTO `rwards_punishments` (`id`, `rpsystem_id`, `rpmsg`, `rpiont`, `createrp`) VALUES (23, 5, '团建+1', 2, '2020-01-11 19:07:07');
COMMIT;

-- ----------------------------
-- Table structure for rwardsandpunishments
-- ----------------------------
DROP TABLE IF EXISTS `rwardsandpunishments`;
CREATE TABLE `rwardsandpunishments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rpsystem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of rwardsandpunishments
-- ----------------------------
BEGIN;
INSERT INTO `rwardsandpunishments` (`id`, `rpsystem`) VALUES (1, '行政奖惩类');
INSERT INTO `rwardsandpunishments` (`id`, `rpsystem`) VALUES (3, '经济奖惩类');
INSERT INTO `rwardsandpunishments` (`id`, `rpsystem`) VALUES (5, '专项奖励类');
COMMIT;

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `basicSalary` int DEFAULT NULL COMMENT '基本工资',
  `bonus` int DEFAULT NULL COMMENT '奖金',
  `lunchSalary` int DEFAULT NULL COMMENT '午餐补助',
  `trafficSalary` int DEFAULT NULL COMMENT '交通补助',
  `allSalary` int DEFAULT NULL COMMENT '应发工资',
  `pensionBase` int DEFAULT NULL COMMENT '养老金基数',
  `pensionPer` float DEFAULT NULL COMMENT '养老金比率',
  `createDate` timestamp NULL DEFAULT NULL COMMENT '启用时间',
  `medicalBase` int DEFAULT NULL COMMENT '医疗基数',
  `medicalPer` float DEFAULT NULL COMMENT '医疗保险比率',
  `accumulationFundBase` int DEFAULT NULL COMMENT '公积金基数',
  `accumulationFundPer` float DEFAULT NULL COMMENT '公积金比率',
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of salary
-- ----------------------------
BEGIN;
INSERT INTO `salary` (`id`, `basicSalary`, `bonus`, `lunchSalary`, `trafficSalary`, `allSalary`, `pensionBase`, `pensionPer`, `createDate`, `medicalBase`, `medicalPer`, `accumulationFundBase`, `accumulationFundPer`, `name`) VALUES (10, 2000, 2000, 400, 1000, 7400, 2000, 0.07, '2020-01-11 19:54:24', 2000, 0.07, 2000, 0.07, '人事部工资账套');
INSERT INTO `salary` (`id`, `basicSalary`, `bonus`, `lunchSalary`, `trafficSalary`, `allSalary`, `pensionBase`, `pensionPer`, `createDate`, `medicalBase`, `medicalPer`, `accumulationFundBase`, `accumulationFundPer`, `name`) VALUES (13, 10000, 3000, 500, 500, 18000, 4000, 0.07, '2020-01-11 19:54:24', 4000, 0.07, 4000, 0.07, '运维部工资账套');
INSERT INTO `salary` (`id`, `basicSalary`, `bonus`, `lunchSalary`, `trafficSalary`, `allSalary`, `pensionBase`, `pensionPer`, `createDate`, `medicalBase`, `medicalPer`, `accumulationFundBase`, `accumulationFundPer`, `name`) VALUES (26, 10000, 50, 200, 100, 7850, 10000, 0.08, '2023-03-10 21:07:53', 10000, 0.05, 10000, 0.12, '测试讨帐');
COMMIT;

-- ----------------------------
-- Table structure for sysmsg
-- ----------------------------
DROP TABLE IF EXISTS `sysmsg`;
CREATE TABLE `sysmsg` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int DEFAULT NULL COMMENT '消息id',
  `type` int DEFAULT '0' COMMENT '0表示群发消息',
  `hrid` int DEFAULT NULL COMMENT '这条消息是给谁的',
  `state` int DEFAULT '0' COMMENT '0 未读 1 已读',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `hrid` (`hrid`) USING BTREE,
  KEY `sysmsg_ibfk_1` (`mid`) USING BTREE,
  CONSTRAINT `sysmsg_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `msgcontent` (`id`),
  CONSTRAINT `sysmsg_ibfk_2` FOREIGN KEY (`hrid`) REFERENCES `hr` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sysmsg
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Procedure structure for addDep
-- ----------------------------
DROP PROCEDURE IF EXISTS `addDep`;
delimiter ;;
CREATE PROCEDURE `addDep`(in depName varchar(32),in parentId int,in enabled boolean,out result int,out result2 int)
begin
  declare did int;
  declare pDepPath varchar(64);
  insert into department set name=depName,parentId=parentId,enabled=enabled;
  select row_count() into result;
  select last_insert_id() into did;
  set result2=did;
  select depPath into pDepPath from department where id=parentId;
  update department set depPath=concat(pDepPath,'.',did) where id=did;
  update department set isParent=true where id=parentId;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for deleteDep
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteDep`;
delimiter ;;
CREATE PROCEDURE `deleteDep`(in did int,out result int)
begin
  declare ecount int;
  declare pid int;
  declare pcount int;
  select count(*) into ecount from employee where departmentId=did;
  if ecount>0 then set result=-1;
  else 
  select parentId into pid from department where id=did;
  delete from department where id=did and isParent=false;
  select row_count() into result;
  select count(*) into pcount from department where parentId=pid;
  if pcount=0 then update department set isParent=false where id=pid;
  end if;
  end if;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
