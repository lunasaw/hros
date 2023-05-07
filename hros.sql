/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80021 (8.0.21)
 Source Host           : localhost:3306
 Source Schema         : hros

 Target Server Type    : MySQL
 Target Server Version : 80021 (8.0.21)
 File Encoding         : 65001

 Date: 05/05/2023 22:53:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for adjustsalary
-- ----------------------------
DROP TABLE IF EXISTS `adjustsalary`;
CREATE TABLE `adjustsalary`
(
  `id`           int                                                     NOT NULL AUTO_INCREMENT,
  `eid`          int                                                     NULL DEFAULT NULL,
  `asDate`       date                                                    NULL DEFAULT NULL COMMENT '调薪日期',
  `beforeSalary` int                                                     NULL DEFAULT NULL COMMENT '调前薪资',
  `afterSalary`  int                                                     NULL DEFAULT NULL COMMENT '调后薪资',
  `reason`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调薪原因',
  `remark`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid` (`eid` ASC) USING BTREE,
  CONSTRAINT `adjustsalary_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of adjustsalary
-- ----------------------------

-- ----------------------------
-- Table structure for appraise
-- ----------------------------
DROP TABLE IF EXISTS `appraise`;
CREATE TABLE `appraise`
(
  `id`         int                                                     NOT NULL AUTO_INCREMENT,
  `eid`        int                                                     NULL DEFAULT NULL,
  `appDate`    date                                                    NULL DEFAULT NULL COMMENT '考评日期',
  `appResult`  varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '考评结果',
  `appContent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考评内容',
  `remark`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid` (`eid` ASC) USING BTREE,
  CONSTRAINT `appraise_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 49
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of appraise
-- ----------------------------
INSERT INTO `appraise`
VALUES (43, 5271, '2023-03-15', '5', '转正考评', '转正通过');
INSERT INTO `appraise`
VALUES (46, 5289, '2023-04-05', '4', '运营专员月度考评', '检测');
INSERT INTO `appraise`
VALUES (47, 5288, '2023-04-05', '4', '运营专员月度考评', '检测');
INSERT INTO `appraise`
VALUES (48, 5287, '2023-04-05', '4', '运营专员月度考评', '检测');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`
(
  `id`       int                                                     NOT NULL AUTO_INCREMENT,
  `name`     varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '部门名称',
  `parentId` int                                                     NULL DEFAULT NULL,
  `depPath`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enabled`  tinyint(1)                                              NULL DEFAULT 1,
  `isParent` tinyint(1)                                              NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 155
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department`
VALUES (1, '总公司', -1, '.1', 1, 1);
INSERT INTO `department`
VALUES (148, '财务部', 1, '.1.148', 1, 0);
INSERT INTO `department`
VALUES (150, '人事部', 1, '.1.150', 1, 0);
INSERT INTO `department`
VALUES (151, 'IT技术部', 1, '.1.151', 1, 0);
INSERT INTO `department`
VALUES (152, '市场部', 1, '.1.152', 1, 0);
INSERT INTO `department`
VALUES (154, '法务部', 1, '.1.154', 1, 0);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`
(
  `id`             int                                                                                                       NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `name`           varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci                                                    NULL DEFAULT NULL COMMENT '员工姓名',
  `gender`         char(4) CHARACTER SET utf8 COLLATE utf8_general_ci                                                        NULL DEFAULT NULL COMMENT '性别',
  `birthday`       date                                                                                                      NULL DEFAULT NULL COMMENT '出生日期',
  `idCard`         char(18) CHARACTER SET utf8 COLLATE utf8_general_ci                                                       NULL DEFAULT NULL COMMENT '身份证号',
  `wedlock`        enum ('已婚','未婚','离异') CHARACTER SET utf8 COLLATE utf8_general_ci                                    NULL DEFAULT NULL COMMENT '婚姻状况',
  `nationId`       int                                                                                                       NULL DEFAULT NULL COMMENT '民族',
  `nativePlace`    varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci                                                    NULL DEFAULT NULL COMMENT '籍贯',
  `politicId`      int                                                                                                       NULL DEFAULT NULL COMMENT '政治面貌',
  `email`          varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci                                                    NULL DEFAULT NULL COMMENT '邮箱',
  `phone`          varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci                                                    NULL DEFAULT NULL COMMENT '电话号码',
  `address`        varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci                                                    NULL DEFAULT NULL COMMENT '联系地址',
  `departmentId`   int                                                                                                       NULL DEFAULT NULL COMMENT '所属部门',
  `jobLevelId`     int                                                                                                       NULL DEFAULT NULL COMMENT '职称ID',
  `posId`          int                                                                                                       NULL DEFAULT NULL COMMENT '职位ID',
  `engageForm`     varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci                                                     NULL DEFAULT NULL COMMENT '聘用形式',
  `tiptopDegree`   enum ('博士','硕士','本科','大专','高中','初中','小学','其他') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最高学历',
  `specialty`      varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci                                                    NULL DEFAULT NULL COMMENT '所属专业',
  `school`         varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci                                                    NULL DEFAULT NULL COMMENT '毕业院校',
  `beginDate`      date                                                                                                      NULL DEFAULT NULL COMMENT '入职日期',
  `workState`      enum ('在职','离职') CHARACTER SET utf8 COLLATE utf8_general_ci                                           NULL DEFAULT '在职' COMMENT '在职状态',
  `workID`         char(8) CHARACTER SET utf8 COLLATE utf8_general_ci                                                        NULL DEFAULT NULL COMMENT '工号',
  `contractTerm`   double                                                                                                    NULL DEFAULT NULL COMMENT '合同期限',
  `conversionTime` date                                                                                                      NULL DEFAULT NULL COMMENT '转正日期',
  `notWorkDate`    date                                                                                                      NULL DEFAULT NULL COMMENT '离职日期',
  `beginContract`  date                                                                                                      NULL DEFAULT NULL COMMENT '合同起始日期',
  `endContract`    date                                                                                                      NULL DEFAULT NULL COMMENT '合同终止日期',
  `workAge`        int                                                                                                       NULL DEFAULT NULL COMMENT '工龄',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name` (`name` ASC) USING BTREE,
  INDEX `departmentId` (`departmentId` ASC) USING BTREE,
  INDEX `jobId` (`jobLevelId` ASC) USING BTREE,
  INDEX `dutyId` (`posId` ASC) USING BTREE,
  INDEX `nationId` (`nationId` ASC) USING BTREE,
  INDEX `politicId` (`politicId` ASC) USING BTREE,
  INDEX `workID_key` (`workID` ASC) USING BTREE,
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`jobLevelId`) REFERENCES `joblevel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`posId`) REFERENCES `position` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`nationId`) REFERENCES `nation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`politicId`) REFERENCES `politicsstatus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 5297
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee`
VALUES (5268, '小红', '女', '1998-10-08', '150124199510081276', '未婚', 1, '江苏盐城', 3, '00000001@163.com',
        '15692756582', '江苏徐州', 148, 17, 33, '劳动合同', '本科', '会计学', '盐城师范学院', '2023-02-28', '在职',
        '00000001', 1, '2023-03-28', NULL, '2023-02-28', '2024-02-28', NULL);
INSERT INTO `employee`
VALUES (5271, '小白', '男', '1999-10-01', '405326199910013537', '未婚', 1, '重庆', 3, '00000002@163.com', '15696756582',
        '江苏徐州', 148, 17, 30, '劳动合同', '本科', '会计学', '盐城师范学院', '2023-03-06', '在职', '00000002', 1,
        '2023-04-06', NULL, '2023-03-06', '2024-04-06', NULL);
INSERT INTO `employee`
VALUES (5272, '小李', '女', '1999-07-06', '320323199907065241', '未婚', 1, '江苏徐州', 1, '00000003@163.com',
        '16652479681', '江苏徐州', 148, 17, 33, '劳动合同', '本科', '会计学', '徐州工程学院', '2023-03-03', '在职',
        '00000003', 1, '2023-04-03', NULL, '2023-03-03', '2024-03-03', NULL);
INSERT INTO `employee`
VALUES (5273, '小黄', '男', '2000-08-01', '312467200008013417', '未婚', 1, '陕西西安', 2, '00000004@163.com',
        '18956541369', '江苏徐州', 148, 17, 30, '劳动合同', '本科', '会计学', '盐城师范学院', '2023-03-03', '在职',
        '00000004', 1, '2023-04-03', NULL, '2023-03-03', '2024-03-03', NULL);
INSERT INTO `employee`
VALUES (5274, '张希', '女', '1990-01-09', '320315199001093463', '未婚', 1, '江苏南京', 1, '00000005@163.com',
        '19961450057', '江苏徐州', 148, 17, 29, '劳动合同', '硕士', '金融管理', '东北财经大学', '2018-07-07', '在职',
        '00000005', 5, '2018-08-07', NULL, '2018-07-07', '2023-07-07', NULL);
INSERT INTO `employee`
VALUES (5275, '李维', '男', '1988-06-13', '320351198806133457', '未婚', 1, '江苏苏州', 1, '000000006@163.com',
        '15352601336', '江苏徐州', 150, 17, 126, '劳动合同', '硕士', '人力资源管理', '对外经济贸易大学', '2018-03-03',
        '在职', '00000006', 5, '2018-04-03', NULL, '2018-03-03', '2023-03-03', NULL);
INSERT INTO `employee`
VALUES (5276, '小苏', '女', '1999-11-18', '320513199911183464', '未婚', 1, '江苏徐州', 2, '00000007@163.com',
        '18756270991', '江苏徐州', 150, 17, 124, '劳动合同', '本科', '人力资源管理', '淮阴师范学院', '2022-03-07',
        '在职', '00000007', 2, '2022-04-07', NULL, '2022-03-07', '2024-03-07', NULL);
INSERT INTO `employee`
VALUES (5277, '小何', '男', '1999-12-18', '320323199912183617', '未婚', 1, '江苏泰州', 3, '00000008@163.com',
        '15362095167', '江苏徐州', 150, 17, 124, '劳动合同', '本科', '人力资源管理', '盐城师范学院', '2023-03-03',
        '在职', '00000008', 1, '2023-04-03', NULL, '2023-03-03', '2024-03-03', NULL);
INSERT INTO `employee`
VALUES (5278, '小杨', '女', '1999-01-08', '320323199901083647', '未婚', 1, '江苏徐州', 2, '00000009@163.com',
        '13850179805', '江苏徐州', 150, 17, 125, '劳动合同', '本科', '人力资源管理', '徐州工程学院', '2023-03-03',
        '在职', '00000009', 1, '2023-04-03', NULL, '2023-03-03', '2024-03-03', NULL);
INSERT INTO `employee`
VALUES (5279, '小钱', '男', '1999-04-08', '320357199904081737', '未婚', 1, '江苏泰州', 3, '00000010@163.com',
        '15862003417', '江苏徐州', 150, 17, 125, '劳动合同', '本科', '人力资源管理', '泰州学院', '2023-03-03', '在职',
        '00000010', 1, '2023-04-03', NULL, '2023-03-03', '2024-03-03', NULL);
INSERT INTO `employee`
VALUES (5280, '李森', '男', '1998-10-02', '412517199810023515', '未婚', 1, '浙江温州', 3, '00000011@163.com',
        '16815276043', '江苏徐州', 151, 17, 120, '劳动合同', '本科', '软件工程', '江南大学', '2020-02-03', '在职',
        '00000011', 4, '2020-03-03', NULL, '2020-02-03', '2024-02-03', NULL);
INSERT INTO `employee`
VALUES (5281, '李琴', '女', '1998-05-08', '320323199805086224', '未婚', 1, '江苏徐州', 1, '0000012@163.com',
        '18852476017', '江苏徐州', 151, 17, 120, '劳动合同', '本科', '软件工程', '江苏师范大学', '2020-03-03', '在职',
        '00000012', 4, '2020-04-03', NULL, '2020-03-03', '2024-03-03', NULL);
INSERT INTO `employee`
VALUES (5282, '小孙', '男', '1998-10-08', '320167199810085413', '未婚', 1, '江苏苏州', 3, '00000013@163.com',
        '13752411903', '江苏徐州', 151, 14, 119, '劳动合同', '本科', '软件工程', '盐城工学院', '2020-03-03', '在职',
        '00000013', 4, '2020-04-03', NULL, '2020-03-03', '2024-03-03', NULL);
INSERT INTO `employee`
VALUES (5283, '小周', '女', '2000-12-19', '320514200012196346', '未婚', 1, '江苏苏州', 1, '00000014@163.com',
        '18752410063', '江苏徐州', 151, 15, 119, '劳动合同', '本科', '软件工程', '盐城师范学院', '2022-03-03', '在职',
        '00000014', 2, '2022-04-03', NULL, '2022-03-03', '2024-03-03', NULL);
INSERT INTO `employee`
VALUES (5284, '小明', '男', '2000-10-08', '320323200010083417', '未婚', 1, '江苏徐州', 2, '00000015@163.com',
        '15754675120', '江苏徐州', 151, 16, 119, '劳动合同', '硕士', '软件工程', '中国矿业大学', '2023-03-11', '在职',
        '00000015', 1, '2023-04-11', NULL, '2023-03-11', '2024-03-11', NULL);
INSERT INTO `employee`
VALUES (5285, '小齐', '男', '1998-10-08', '320513199810083513', '未婚', 1, '江苏盐城', 1, '00000016@163.com',
        '15362015435', '江苏徐州', 151, 14, 34, '劳动合同', '本科', '计算机技术与科学', '盐城师范学院', '2020-03-03',
        '在职', '00000016', 4, '2020-04-03', NULL, '2020-03-03', '2024-03-03', NULL);
INSERT INTO `employee`
VALUES (5286, '小时', '男', '1999-10-08', '320314199910085413', '未婚', 1, '江苏宿迁', 3, '00000017@163.com',
        '13252196405', '江苏徐州', 151, 15, 34, '劳动合同', '本科', '计算机技术与科学', '盐城师范学院', '2021-03-03',
        '在职', '00000017', 3, '2021-04-03', NULL, '2021-03-03', '2024-03-03', NULL);
INSERT INTO `employee`
VALUES (5287, '小西', '女', '2000-10-18', '320312200010183466', '未婚', 1, '浙江嘉兴', 3, '00000018@163.com',
        '15252601237', '江苏徐州', 152, 17, 121, '劳动合同', '本科', '市场营销', '淮阴师范学院', '2023-03-03', '在职',
        '00000018', 1, '2023-04-03', NULL, '2023-03-03', '2024-03-03', NULL);
INSERT INTO `employee`
VALUES (5288, '小林', '男', '1998-10-08', '320323199810083217', '未婚', 1, '江苏徐州', 3, '00000019@163.com',
        '18952174060', '江苏徐州', 152, 17, 121, '劳动合同', '本科', '市场营销', '徐州工程学院', '2023-03-03', '在职',
        '00000019', 1, '2023-04-03', NULL, '2023-03-03', '2024-03-03', NULL);
INSERT INTO `employee`
VALUES (5289, '小南', '女', '1997-10-08', '320168199710083246', '未婚', 1, '江苏宿迁', 1, '00000020@163.com',
        '13852190067', '江苏徐州', 152, 17, 121, '劳动合同', '本科', '市场营销', '泰州学院', '2020-03-03', '在职',
        '00000020', 4, '2020-04-03', NULL, '2020-03-03', '2024-03-03', NULL);
INSERT INTO `employee`
VALUES (5290, '小美', '女', '1999-08-08', '320323199908081422', '未婚', 1, '江苏徐州', 3, '00000021@163.com',
        '13260170505', '江苏徐州', 152, 17, 122, '劳务合同', '大专', '电子商务', '徐州财经高等技术学校', '2023-03-03',
        '在职', '00000021', 1, '2023-04-03', NULL, '2023-03-03', '2024-03-03', NULL);
INSERT INTO `employee`
VALUES (5291, '小秦', '男', '1998-10-08', '320312199810080049', '未婚', 1, '江苏南京', 3, '00000022@163.com',
        '15850241668', '江苏徐州', 152, 17, 122, '劳务合同', '大专', '电子商务', '徐州财经高等职业技术学校',
        '2023-03-03', '在职', '00000022', 1, '2023-04-03', NULL, '2023-03-03', '2024-03-03', NULL);
INSERT INTO `employee`
VALUES (5292, '小飞', '男', '1998-10-08', '320312199810083415', '未婚', 1, '江苏宿迁', 3, '00000023@163.com',
        '15805190047', '江苏徐州', 152, 17, 122, '劳务合同', '大专', '电子商务', '徐州财经高等职业技术学校',
        '2023-03-03', '在职', '00000023', 1, '2023-04-03', NULL, '2023-03-03', '2024-03-03', NULL);
INSERT INTO `employee`
VALUES (5293, '小枫', '女', '1998-06-16', '320315199806163628', '未婚', 1, '江苏南京', 2, '00000024@163.com',
        '13520153467', '江苏徐州', 154, 17, 123, '劳动合同', '本科', '经济法学', '苏州大学', '2020-03-03', '在职',
        '00000024', 4, '2020-04-03', NULL, '2020-03-03', '2024-03-03', NULL);
INSERT INTO `employee`
VALUES (5294, '小程', '男', '1998-05-05', '320323199805053617', '未婚', 1, '江苏南京', 1, '00000025@163.com',
        '15896270049', '江苏徐州', 154, 17, 123, '劳动合同', '本科', '民商法学', '苏州大学', '2020-03-03', '在职',
        '00000025', 4, '2020-04-03', NULL, '2020-03-03', '2024-03-03', NULL);

-- ----------------------------
-- Table structure for employee_recycle
-- ----------------------------
DROP TABLE IF EXISTS `employee_recycle`;
CREATE TABLE `employee_recycle`
(
  `id`             int                                                                                                       NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `name`           varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci                                                    NULL DEFAULT NULL COMMENT '员工姓名',
  `gender`         char(4) CHARACTER SET utf8 COLLATE utf8_general_ci                                                        NULL DEFAULT NULL COMMENT '性别',
  `birthday`       date                                                                                                      NULL DEFAULT NULL COMMENT '出生日期',
  `idCard`         char(18) CHARACTER SET utf8 COLLATE utf8_general_ci                                                       NULL DEFAULT NULL COMMENT '身份证号',
  `wedlock`        enum ('已婚','未婚','离异') CHARACTER SET utf8 COLLATE utf8_general_ci                                    NULL DEFAULT NULL COMMENT '婚姻状况',
  `nationId`       int                                                                                                       NULL DEFAULT NULL COMMENT '民族',
  `nativePlace`    varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci                                                    NULL DEFAULT NULL COMMENT '籍贯',
  `politicId`      int                                                                                                       NULL DEFAULT NULL COMMENT '政治面貌',
  `email`          varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci                                                    NULL DEFAULT NULL COMMENT '邮箱',
  `phone`          varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci                                                    NULL DEFAULT NULL COMMENT '电话号码',
  `address`        varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci                                                    NULL DEFAULT NULL COMMENT '联系地址',
  `departmentId`   int                                                                                                       NULL DEFAULT NULL COMMENT '所属部门',
  `jobLevelId`     int                                                                                                       NULL DEFAULT NULL COMMENT '职称ID',
  `posId`          int                                                                                                       NULL DEFAULT NULL COMMENT '职位ID',
  `engageForm`     varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci                                                     NULL DEFAULT NULL COMMENT '聘用形式',
  `tiptopDegree`   enum ('博士','硕士','本科','大专','高中','初中','小学','其他') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最高学历',
  `specialty`      varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci                                                    NULL DEFAULT NULL COMMENT '所属专业',
  `school`         varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci                                                    NULL DEFAULT NULL COMMENT '毕业院校',
  `beginDate`      date                                                                                                      NULL DEFAULT NULL COMMENT '入职日期',
  `workState`      enum ('在职','离职') CHARACTER SET utf8 COLLATE utf8_general_ci                                           NULL DEFAULT '在职' COMMENT '在职状态',
  `workID`         char(8) CHARACTER SET utf8 COLLATE utf8_general_ci                                                        NULL DEFAULT NULL COMMENT '工号',
  `contractTerm`   double                                                                                                    NULL DEFAULT NULL COMMENT '合同期限',
  `conversionTime` date                                                                                                      NULL DEFAULT NULL COMMENT '转正日期',
  `notWorkDate`    date                                                                                                      NULL DEFAULT NULL COMMENT '离职日期',
  `beginContract`  date                                                                                                      NULL DEFAULT NULL COMMENT '合同起始日期',
  `endContract`    date                                                                                                      NULL DEFAULT NULL COMMENT '合同终止日期',
  `workAge`        int                                                                                                       NULL DEFAULT NULL COMMENT '工龄',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `departmentId` (`departmentId` ASC) USING BTREE,
  INDEX `jobId` (`jobLevelId` ASC) USING BTREE,
  INDEX `dutyId` (`posId` ASC) USING BTREE,
  INDEX `nationId` (`nationId` ASC) USING BTREE,
  INDEX `politicId` (`politicId` ASC) USING BTREE,
  INDEX `workID_key` (`workID` ASC) USING BTREE,
  CONSTRAINT `employee_recycle_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_recycle_ibfk_2` FOREIGN KEY (`jobLevelId`) REFERENCES `joblevel` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_recycle_ibfk_3` FOREIGN KEY (`posId`) REFERENCES `position` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_recycle_ibfk_4` FOREIGN KEY (`nationId`) REFERENCES `nation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `employee_recycle_ibfk_5` FOREIGN KEY (`politicId`) REFERENCES `politicsstatus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employee_recycle
-- ----------------------------
INSERT INTO `employee_recycle`
VALUES (1, 'test', '男', '1998-10-08', '320322199810083517', '未婚', 1, '江苏徐州', 3, '111111@163.com', '11111111111',
        '江苏徐州', 152, 17, 122, '劳务合同', '本科', '市场营销', '盐城师范学院', '2023-03-03', '离职', '00000026', 0,
        '2023-03-03', '2023-04-23', '2023-03-03', '2023-03-03', 0);
INSERT INTO `employee_recycle`
VALUES (2, 'test', '男', '1998-10-08', '320323199810083417', '未婚', 1, '江苏徐州', 3, '1111111@163.com', '11111111111',
        '江苏徐州', 152, 17, 122, '劳务合同', '本科', '市场营销', '盐城师范学院', '2023-03-03', '离职', '00000026', 0,
        '2023-03-03', '2023-04-23', '2023-03-03', '2023-03-03', 0);

-- ----------------------------
-- Table structure for employeeec
-- ----------------------------
DROP TABLE IF EXISTS `employeeec`;
CREATE TABLE `employeeec`
(
  `id`       int                                                     NOT NULL AUTO_INCREMENT,
  `eid`      int                                                     NULL DEFAULT NULL COMMENT '员工编号',
  `ecDate`   date                                                    NULL DEFAULT NULL COMMENT '奖罚日期',
  `ecReason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖罚原因',
  `ecPoint`  int                                                     NULL DEFAULT NULL COMMENT '奖罚分',
  `ecType`   int                                                     NULL DEFAULT NULL COMMENT '奖罚类别，0：奖，1：罚',
  `remark`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid` (`eid` ASC) USING BTREE,
  CONSTRAINT `employeeec_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 138
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employeeec
-- ----------------------------
INSERT INTO `employeeec`
VALUES (131, 5271, '2023-03-15', '测试', NULL, 19, '测试');
INSERT INTO `employeeec`
VALUES (132, 5290, '2023-04-23', '表现出色', NULL, 10, '无');
INSERT INTO `employeeec`
VALUES (133, 5292, '2023-04-23', '拓展业务完成出色', NULL, 20, '无');
INSERT INTO `employeeec`
VALUES (135, 5291, '2023-04-23', '月度考评缺席', NULL, 4, '下次不要再犯');
INSERT INTO `employeeec`
VALUES (136, 5286, '2023-04-23', '项目工作表现突出', NULL, 21, '再接再厉');
INSERT INTO `employeeec`
VALUES (137, 5286, '2023-04-23', '项目工作表现突出', NULL, 22, '再接再厉');

-- ----------------------------
-- Table structure for employeeremove
-- ----------------------------
DROP TABLE IF EXISTS `employeeremove`;
CREATE TABLE `employeeremove`
(
  `id`         int                                                     NOT NULL AUTO_INCREMENT,
  `eid`        int                                                     NULL DEFAULT NULL,
  `afterDepId` int                                                     NULL DEFAULT NULL COMMENT '调动后部门',
  `afterJobId` int                                                     NULL DEFAULT NULL COMMENT '调动后职位',
  `removeDate` date                                                    NULL DEFAULT NULL COMMENT '调动日期',
  `reason`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调动原因',
  `remark`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `afterPid`   int                                                     NULL DEFAULT NULL COMMENT '调动后的职称',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid` (`eid` ASC) USING BTREE,
  CONSTRAINT `employeeremove_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 25
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employeeremove
-- ----------------------------
INSERT INTO `employeeremove`
VALUES (11, 5268, 1, 15, '2023-03-10', NULL, NULL, NULL);
INSERT INTO `employeeremove`
VALUES (12, 5268, 1, 14, '2023-03-10', NULL, NULL, NULL);
INSERT INTO `employeeremove`
VALUES (13, 5268, 1, 14, '2023-03-10', NULL, NULL, NULL);
INSERT INTO `employeeremove`
VALUES (14, 5268, 1, 14, '2023-03-10', NULL, NULL, NULL);
INSERT INTO `employeeremove`
VALUES (15, 5268, 1, 14, '2023-03-10', NULL, NULL, NULL);
INSERT INTO `employeeremove`
VALUES (16, 5271, 148, 16, '2023-03-15', NULL, NULL, NULL);
INSERT INTO `employeeremove`
VALUES (17, 5268, 148, 14, '2023-04-22', NULL, NULL, NULL);
INSERT INTO `employeeremove`
VALUES (24, 5282, 151, 14, '2023-04-24', NULL, NULL, 119);

-- ----------------------------
-- Table structure for employeetrain
-- ----------------------------
DROP TABLE IF EXISTS `employeetrain`;
CREATE TABLE `employeetrain`
(
  `id`              int                                                     NOT NULL AUTO_INCREMENT,
  `eid`             int                                                     NULL DEFAULT NULL COMMENT '员工编号',
  `trainstartDate`  date                                                    NULL DEFAULT NULL COMMENT '培训开始日期',
  `trainfinishDate` datetime                                                NULL DEFAULT NULL COMMENT '培训结束日期',
  `trainContent`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '培训内容',
  `trainstatus`     tinyint                                                 NULL DEFAULT NULL COMMENT '培训状态',
  `remark`          varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid` (`eid` ASC) USING BTREE,
  CONSTRAINT `employeetrain_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 233
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of employeetrain
-- ----------------------------
INSERT INTO `employeetrain`
VALUES (228, 5271, '2023-03-15', '2023-03-16 00:00:00', '转正', 4, '转正培训');
INSERT INTO `employeetrain`
VALUES (229, 5292, '2023-04-15', '2023-04-23 00:00:00', '产品销售培训', 1, '无');
INSERT INTO `employeetrain`
VALUES (230, 5291, '2023-04-15', '2023-04-23 00:00:00', '产品销售培训', 1, '无');
INSERT INTO `employeetrain`
VALUES (231, 5290, '2023-04-15', '2023-04-23 00:00:00', '产品销售培训', 1, '无');
INSERT INTO `employeetrain`
VALUES (232, 5285, '2023-04-13', '2023-04-15 00:00:00', '专业技术培训', 1, '无');

-- ----------------------------
-- Table structure for empsalary
-- ----------------------------
DROP TABLE IF EXISTS `empsalary`;
CREATE TABLE `empsalary`
(
  `id`  int NOT NULL AUTO_INCREMENT,
  `eid` int NULL DEFAULT NULL,
  `sid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `eid` (`eid` ASC) USING BTREE,
  INDEX `empsalary_ibfk_2` (`sid` ASC) USING BTREE,
  CONSTRAINT `empsalary_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `empsalary_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `salary` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 150
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of empsalary
-- ----------------------------
INSERT INTO `empsalary`
VALUES (109, 5268, 10);
INSERT INTO `empsalary`
VALUES (110, 5268, 26);
INSERT INTO `empsalary`
VALUES (111, 5271, 10);
INSERT INTO `empsalary`
VALUES (112, 5271, 10);
INSERT INTO `empsalary`
VALUES (113, 5279, 26);
INSERT INTO `empsalary`
VALUES (114, 5278, 26);
INSERT INTO `empsalary`
VALUES (115, 5277, 26);
INSERT INTO `empsalary`
VALUES (116, 5276, 26);
INSERT INTO `empsalary`
VALUES (117, 5275, 27);
INSERT INTO `empsalary`
VALUES (118, 5274, 13);
INSERT INTO `empsalary`
VALUES (119, 5273, 10);
INSERT INTO `empsalary`
VALUES (120, 5272, 10);
INSERT INTO `empsalary`
VALUES (121, 5268, 10);
INSERT INTO `empsalary`
VALUES (122, 5268, 10);
INSERT INTO `empsalary`
VALUES (124, 5268, 10);
INSERT INTO `empsalary`
VALUES (125, 5268, 10);
INSERT INTO `empsalary`
VALUES (126, 5268, 10);
INSERT INTO `empsalary`
VALUES (127, 5268, 10);
INSERT INTO `empsalary`
VALUES (128, 5268, 10);
INSERT INTO `empsalary`
VALUES (129, 5268, 27);
INSERT INTO `empsalary`
VALUES (130, 5268, 10);
INSERT INTO `empsalary`
VALUES (131, 5274, 10);
INSERT INTO `empsalary`
VALUES (132, 5274, 13);
INSERT INTO `empsalary`
VALUES (133, 5268, 10);
INSERT INTO `empsalary`
VALUES (134, 5268, 13);
INSERT INTO `empsalary`
VALUES (135, 5280, 28);
INSERT INTO `empsalary`
VALUES (136, 5281, 28);
INSERT INTO `empsalary`
VALUES (137, 5282, 30);
INSERT INTO `empsalary`
VALUES (138, 5283, 30);
INSERT INTO `empsalary`
VALUES (139, 5284, 30);
INSERT INTO `empsalary`
VALUES (140, 5285, 29);
INSERT INTO `empsalary`
VALUES (141, 5286, 29);
INSERT INTO `empsalary`
VALUES (142, 5287, 31);
INSERT INTO `empsalary`
VALUES (143, 5288, 31);
INSERT INTO `empsalary`
VALUES (144, 5289, 31);
INSERT INTO `empsalary`
VALUES (145, 5290, 32);
INSERT INTO `empsalary`
VALUES (146, 5291, 32);
INSERT INTO `empsalary`
VALUES (147, 5292, 32);
INSERT INTO `empsalary`
VALUES (148, 5293, 33);
INSERT INTO `empsalary`
VALUES (149, 5294, 33);

-- ----------------------------
-- Table structure for fileup
-- ----------------------------
DROP TABLE IF EXISTS `fileup`;
CREATE TABLE `fileup`
(
  `fileld`   int UNSIGNED                                            NOT NULL AUTO_INCREMENT,
  `filePath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fileSize` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fileType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fileDate` datetime                                                NULL DEFAULT NULL,
  PRIMARY KEY (`fileld`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fileup
-- ----------------------------

-- ----------------------------
-- Table structure for hr
-- ----------------------------
DROP TABLE IF EXISTS `hr`;
CREATE TABLE `hr`
(
  `id`          int                                                     NOT NULL AUTO_INCREMENT COMMENT 'hrID',
  `name`        varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '姓名',
  `phone`       char(11) CHARACTER SET utf8 COLLATE utf8_general_ci     NULL DEFAULT NULL COMMENT '手机号码',
  `telephone`   varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '住宅电话',
  `address`     varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '联系地址',
  `enabled`     tinyint(1)                                              NULL DEFAULT 1,
  `username`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `userface`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark`      varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `employee_id` int                                                     NULL DEFAULT NULL COMMENT '员工Id',
  `work_date`   text CHARACTER SET utf8 COLLATE utf8_general_ci         NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 77
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hr
-- ----------------------------
INSERT INTO `hr`
VALUES (3, '系统管理员', '18568887789', '0516-82123434', '江苏徐州', 1, 'admin',
        '$2a$10$ey5EvT8bEjRGvlAV2Bs6Su8ct9V/h69UxTs7TSn8t8..nNpLs3igu', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL,
        '2023-02-28,2023-03-07,2023-03-14,2023-03-15,2023-03-20,2023-03-08,2023-03-02,2023-03-10,2023-03-16,2023-03-24,2023-03-06,2023-04-04,2023-04-12,2023-04-11,2023-04-14,2023-04-19,2023-04-13,2023-03-26,2023-02-26,2023-02-27,2023-03-01,2023-03-27,2023-03-28,2023-03-29,2023-03-30,2023-03-31,2023-04-03,2023-04-05,2023-04-06,2023-04-07,2023-04-10,2023-04-17,2023-04-18,2023-04-20,2023-04-21,2023-03-09,2023-03-03,2023-03-17,2023-03-23,2023-03-22,2023-03-21,2023-03-13,2023-04-02,2023-04-09,2023-04-16');
INSERT INTO `hr`
VALUES (5, '李维', '18568123489', '0516-82123434', '江苏徐州', 1, 'liwei',
        '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (10, '韩愈', '18568123666', '0516-82123434', '江苏徐州', 1, 'hanyu',
        '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (11, '柳宗元', '18568123377', '0516-82123434', '江苏徐州', 1, 'liuzongyuan',
        '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (12, '曾巩', '18568128888', '0516-82123434', '江苏徐州', 1, 'zenggong',
        '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (13, '徐凤年', '18568887789', '0516-82123434', '江苏徐州', 1, 'xufengnian',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (15, '徐晓', '18568123489', '0516-82123434', '江苏徐州', 1, 'xuxiao',
        '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (16, '轩辕青峰', '18568123666', '0516-82123434', '江苏徐州', 1, 'xuanyuanqingfeng',
        '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (17, '青鸟', '18568123377', '0516-82123434', '江苏徐州', 1, 'qingniao',
        '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (18, '超级用户', '18568128888', '0516-82123434', '江苏徐州', 1, 'root',
        '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (19, '徐脂虎', '18568887789', '0516-82123434', '江苏徐州', 1, 'xuzhihu',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (20, '徐渭熊', '18568123489', '0516-82123434', '江苏徐州', 1, 'xuweixiong',
        '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (21, '徐念凉', '18568123666', '0516-82123434', '江苏徐州', 1, 'xunianliang',
        '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (22, '太阿剑九黄', '18568123377', '0516-82123434', '江苏徐州', 1, 'laohuang',
        '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (23, '白衣僧人李当心', '18568128888', '0516-82123434', '江苏徐州', 1, 'lidangxin',
        '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (24, '武帝城于新郎', '18568887789', '0516-82123434', '江苏徐州', 1, 'yuxinlang',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (25, '南诏韦淼', '18568123489', '0516-82123434', '江苏徐州', 1, 'weita',
        '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (26, '东越剑池柴青山', '18568123666', '0516-82123434', '江苏徐州', 1, '东越剑池柴青山',
        '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (28, '温华', '18568128888', '0516-82123434', '江苏徐州', 1, 'zenggong',
        '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (29, '李义山', '18568887789', '0516-82123434', '江苏徐州', 1, 'liyishan',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (30, '王初冬', '18568123489', '0516-82123434', '江苏徐州', 1, 'wangchudong',
        '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (31, '陆丞燕', '18568123666', '0516-82123434', '江苏徐州', 1, '陆丞燕',
        '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (32, '鱼玄机', '18568123377', '0516-82123434', '江苏徐州', 1, 'yuxuanji',
        '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, NULL, NULL);
INSERT INTO `hr`
VALUES (44, '员工角色', '2342342', '0516-82123434', '江苏徐州', 1, '员工角色',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        '员工角色', NULL, NULL);
INSERT INTO `hr`
VALUES (45, '小红', '2342342', '0516-82123434', '江苏徐州', 1, '小红',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        '测试小红', 5268, NULL);
INSERT INTO `hr`
VALUES (46, '小白', '15696756582', '0516-82123434', '江苏徐州', 1, '小白',
        '$2a$10$KGgUwzjGXyIwLovDLccnkOfTYMVMSIFs4CMVpH/.f1DxRN.DPvnuO', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5271, '2023-03-09,2023-03-14,2023-03-19,2023-03-27,2023-04-04,2023-04-03,2023-03-29');
INSERT INTO `hr`
VALUES (47, '小李', '16652479681', '16652479681', '江苏徐州', 1, '小李',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5272,
        '2023-04-13,2023-04-11,2023-04-19,2023-04-18,2023-04-17,2023-04-12,2023-03-01,2023-03-02,2023-03-03,2023-03-10,2023-03-09,2023-03-08,2023-03-07,2023-03-06,2023-03-13,2023-03-20,2023-03-14,2023-03-21,2023-03-15,2023-03-22,2023-03-16,2023-03-23,2023-03-17,2023-03-24,2023-03-27,2023-03-28,2023-03-29,2023-03-30,2023-03-31,2023-02-28,2023-02-27,2023-01-30,2023-01-31,2023-02-01,2023-02-02,2023-02-06,2023-02-13,2023-02-07,2023-02-08,2023-02-09,2023-02-16,2023-02-23,2023-02-22,2023-02-15,2023-02-21,2023-02-14,2023-02-20,2023-02-03,2023-02-10,2023-02-24,2023-02-17,2023-04-05');
INSERT INTO `hr`
VALUES (48, '小黄', '18956541369', '18956541369', '江苏徐州', 1, '小黄',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5273, NULL);
INSERT INTO `hr`
VALUES (49, '张希', '19961450057', '19961450057', '江苏徐州', 1, '张希',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5274, NULL);
INSERT INTO `hr`
VALUES (50, '李维', '15352601336', '15352601336', '江苏徐州', 1, '李维',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5275, NULL);
INSERT INTO `hr`
VALUES (51, '小苏', '18756270991', '18756270991', '江苏徐州', 1, '小苏',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5276, NULL);
INSERT INTO `hr`
VALUES (52, '小何', '15362095167', '15362095167', '江苏徐州', 1, '小何',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5277, NULL);
INSERT INTO `hr`
VALUES (53, '小杨', '13850179805', '13850179805', '江苏徐州', 1, '小杨',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5278, NULL);
INSERT INTO `hr`
VALUES (54, '小钱', '15862003417', '15862003417', '江苏徐州', 1, '小钱',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5279, NULL);
INSERT INTO `hr`
VALUES (55, '李森', '16815276043', '16815276043', '江苏徐州', 1, '李森',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5280, NULL);
INSERT INTO `hr`
VALUES (56, '李琴', '18852476017', '18852476017', '江苏徐州', 1, '李琴',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5281, NULL);
INSERT INTO `hr`
VALUES (57, '小孙', '13752411903', '13752411903', '江苏徐州', 1, '小孙',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5282, '2023-04-24,2023-03-27,2023-03-28,2023-03-29');
INSERT INTO `hr`
VALUES (58, '小周', '18752410063', '18752410063', '江苏徐州', 1, '小周',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5283, NULL);
INSERT INTO `hr`
VALUES (59, '小明', '15754675120', '15754675120', '江苏徐州', 1, '小明',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5284, NULL);
INSERT INTO `hr`
VALUES (60, '小齐', '15362015435', '15362015435', '江苏徐州', 1, '小齐',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5285, NULL);
INSERT INTO `hr`
VALUES (61, '小时', '13252196405', '13252196405', '江苏徐州', 1, '小时',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5286, NULL);
INSERT INTO `hr`
VALUES (62, '小西', '15252601237', '15252601237', '江苏徐州', 1, '小西',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5287, NULL);
INSERT INTO `hr`
VALUES (63, '小林', '18952174060', '18952174060', '江苏徐州', 1, '小林',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5288, NULL);
INSERT INTO `hr`
VALUES (64, '小南', '13852190067', '13852190067', '江苏徐州', 1, '小南',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5289, NULL);
INSERT INTO `hr`
VALUES (65, '小美', '13260170505', '13260170505', '江苏徐州', 1, '小美',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5290, NULL);
INSERT INTO `hr`
VALUES (66, '小秦', '15850241668', '15850241668', '江苏徐州', 1, '小秦',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5291, NULL);
INSERT INTO `hr`
VALUES (67, '小飞', '15805190047', '15805190047', '江苏徐州', 1, '小飞',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5292, NULL);
INSERT INTO `hr`
VALUES (68, '小枫', '13520153467', '13520153467', '江苏徐州', 1, '小枫',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5293, NULL);
INSERT INTO `hr`
VALUES (69, '小程', '15896270049', '15896270049', '江苏徐州', 1, '小程',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5294, NULL);
INSERT INTO `hr`
VALUES (70, 'test', '11111111111', '11111111111', '江苏徐州', 1, 'test',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5295, NULL);
INSERT INTO `hr`
VALUES (71, 'test', '11111111111', '11111111111', '江苏徐州', 1, 'test',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 5296, NULL);
INSERT INTO `hr`
VALUES (72, '李维', '15352601336', '15352601336', '江苏徐州', 1, '李维',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 0, NULL);
INSERT INTO `hr`
VALUES (73, '张希', '19961450057', '19961450057', '江苏徐州', 1, '张希',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 0, NULL);
INSERT INTO `hr`
VALUES (74, 'test', '12121212121', '121212121', '江苏徐州', 1, 'test',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm', 'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg',
        NULL, 0, NULL);
INSERT INTO `hr`
VALUES (75, '测试', '1231231231', '1231231231', '江苏徐州', 1, '测试',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm',
        'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg',
        'https://s1.ax1x.com/2023/04/27/p9Q5cqJ.jpg', 0, NULL);
INSERT INTO `hr`
VALUES (76, 'lin', '12312312312', '12312312312', '江苏徐州', 1, '林',
        '$2a$10$ySG2lkvjFHY5O0./CPIE1OI8VJsuKYEzOYzqIa7AJR6sEgSzUFOAm',
        'https://imgsa.baidu.com/forum/pic/item/a832bc315c6034a8df786e5ac31349540823766e.jpg', NULL, 0, NULL);

-- ----------------------------
-- Table structure for hr_role
-- ----------------------------
DROP TABLE IF EXISTS `hr_role`;
CREATE TABLE `hr_role`
(
  `id`   int NOT NULL AUTO_INCREMENT,
  `hrid` int NULL DEFAULT NULL,
  `rid`  int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `rid` (`rid` ASC) USING BTREE,
  INDEX `hr_role_ibfk_1` (`hrid` ASC) USING BTREE,
  CONSTRAINT `hr_role_ibfk_1` FOREIGN KEY (`hrid`) REFERENCES `hr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `hr_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 566
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hr_role
-- ----------------------------
INSERT INTO `hr_role`
VALUES (511, 45, 34);
INSERT INTO `hr_role`
VALUES (512, 44, 34);
INSERT INTO `hr_role`
VALUES (524, 16, 6);
INSERT INTO `hr_role`
VALUES (525, 16, 2);
INSERT INTO `hr_role`
VALUES (530, 10, 6);
INSERT INTO `hr_role`
VALUES (532, 3, 6);
INSERT INTO `hr_role`
VALUES (536, 46, 34);
INSERT INTO `hr_role`
VALUES (537, 47, 34);
INSERT INTO `hr_role`
VALUES (538, 48, 34);
INSERT INTO `hr_role`
VALUES (539, 49, 34);
INSERT INTO `hr_role`
VALUES (540, 50, 34);
INSERT INTO `hr_role`
VALUES (541, 51, 34);
INSERT INTO `hr_role`
VALUES (542, 52, 34);
INSERT INTO `hr_role`
VALUES (543, 53, 34);
INSERT INTO `hr_role`
VALUES (544, 54, 34);
INSERT INTO `hr_role`
VALUES (545, 55, 34);
INSERT INTO `hr_role`
VALUES (546, 56, 34);
INSERT INTO `hr_role`
VALUES (547, 57, 34);
INSERT INTO `hr_role`
VALUES (548, 58, 34);
INSERT INTO `hr_role`
VALUES (549, 59, 34);
INSERT INTO `hr_role`
VALUES (550, 60, 34);
INSERT INTO `hr_role`
VALUES (551, 61, 34);
INSERT INTO `hr_role`
VALUES (552, 62, 34);
INSERT INTO `hr_role`
VALUES (553, 63, 34);
INSERT INTO `hr_role`
VALUES (554, 64, 34);
INSERT INTO `hr_role`
VALUES (555, 65, 34);
INSERT INTO `hr_role`
VALUES (556, 66, 34);
INSERT INTO `hr_role`
VALUES (557, 67, 34);
INSERT INTO `hr_role`
VALUES (558, 68, 34);
INSERT INTO `hr_role`
VALUES (559, 69, 34);
INSERT INTO `hr_role`
VALUES (560, 70, 34);
INSERT INTO `hr_role`
VALUES (561, 71, 34);
INSERT INTO `hr_role`
VALUES (563, 11, 35);
INSERT INTO `hr_role`
VALUES (564, 12, 36);
INSERT INTO `hr_role`
VALUES (565, 5, 2);

-- ----------------------------
-- Table structure for joblevel
-- ----------------------------
DROP TABLE IF EXISTS `joblevel`;
CREATE TABLE `joblevel`
(
  `id`         int                                                                                      NOT NULL AUTO_INCREMENT,
  `name`       varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci                                   NULL DEFAULT NULL COMMENT '职称名称',
  `titleLevel` enum ('正高级','副高级','中级','初级','员级') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `createDate` timestamp                                                                                NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled`    tinyint(1)                                                                               NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 18
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of joblevel
-- ----------------------------
INSERT INTO `joblevel`
VALUES (14, '初级工程师', '初级', '2023-03-14 16:18:50', 1);
INSERT INTO `joblevel`
VALUES (15, '中级工程师', '中级', '2023-03-14 16:19:00', 1);
INSERT INTO `joblevel`
VALUES (16, '高级工程师', '副高级', '2023-03-14 16:19:14', 1);
INSERT INTO `joblevel`
VALUES (17, '普通员工', '员级', '2023-03-14 23:41:16', 1);

-- ----------------------------
-- Table structure for logtype
-- ----------------------------
DROP TABLE IF EXISTS `logtype`;
CREATE TABLE `logtype`
(
  `id`         int                                                     NOT NULL AUTO_INCREMENT,
  `logtypemsg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adddate`    timestamp                                               NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logtype
-- ----------------------------
INSERT INTO `logtype`
VALUES (1, '系统设置修改', '2020-01-06 10:36:46');
INSERT INTO `logtype`
VALUES (2, '员工入职', '2020-01-06 10:37:08');
INSERT INTO `logtype`
VALUES (3, '员工奖惩', '2020-01-06 10:37:12');
INSERT INTO `logtype`
VALUES (4, '员工培训', '2020-01-06 10:37:15');
INSERT INTO `logtype`
VALUES (5, '员工调薪', '2020-01-06 10:37:19');

-- ----------------------------
-- Table structure for main_notice
-- ----------------------------
DROP TABLE IF EXISTS `main_notice`;
CREATE TABLE `main_notice`
(
  `id`          int                                                     NOT NULL AUTO_INCREMENT,
  `title`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mainbody`    mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci   NULL COMMENT '内容',
  `authon`      varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL,
  `create_time` datetime                                                NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime                                                NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of main_notice
-- ----------------------------
INSERT INTO `main_notice`
VALUES (1, '五一放假公告',
        '<p>根据我司实际情况，现将五一节放假有关事宜通知如下：</p><p>一、劳动节：5月1日至5月3日放假，共3天。5月4日(星期四)照常上班。</p><p>二、公司各职员应保持节假期间的通讯流畅，以便公司工作需要。</p><p>三、公司有节假日活动行程将另行通知，希望全体员工在节假日外出期间，应注意自身人身安全和财务安全，愉快的度过假期。</p><p>特此通知!</p><p><br></p><p><img src=\"data:image/jpeg;base64,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\"></p>',
        '系统管理员', '2023-04-24 17:20:57', '2023-04-27 22:18:27');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`
(
  `id`          int                                                    NOT NULL AUTO_INCREMENT,
  `url`         varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path`        varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `component`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name`        varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `iconCls`     varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `keepAlive`   tinyint(1)                                             NULL DEFAULT NULL,
  `requireAuth` tinyint(1)                                             NULL DEFAULT NULL,
  `parentId`    int                                                    NULL DEFAULT NULL,
  `enabled`     tinyint(1)                                             NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `parentId` (`parentId` ASC) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 34
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu`
VALUES (1, '/', NULL, NULL, '主菜单', NULL, NULL, NULL, NULL, 1);
INSERT INTO `menu`
VALUES (2, '/', '/home', 'Home', '员工资料', 'fa fa-user-circle-o', NULL, 1, 1, 1);
INSERT INTO `menu`
VALUES (3, '/', '/home', 'Home', '人事管理', 'fa fa-address-card-o', NULL, 1, 1, 1);
INSERT INTO `menu`
VALUES (4, '/', '/home', 'Home', '薪资管理', 'fa fa-money', NULL, 1, 1, 1);
INSERT INTO `menu`
VALUES (5, '/', '/home', 'Home', '统计管理', 'fa fa-bar-chart', NULL, 1, 1, 1);
INSERT INTO `menu`
VALUES (6, '/', '/home', 'Home', '系统管理', 'fa fa-windows', NULL, 1, 1, 1);
INSERT INTO `menu`
VALUES (7, '/employee/basic/**', '/emp/basic', 'EmpBasic', '档案管理', 'fa fa-id-card-o', NULL, 1, 3, 1);
INSERT INTO `menu`
VALUES (8, '/employee/advanced/**', '/emp/adv', 'EmpAdv', '高级资料', 'fa fa-id-card', NULL, 1, 2, 1);
INSERT INTO `menu`
VALUES (9, '/employee/basic/**', '/emp/basic2', 'EmpBasic2', '基本资料', 'fa fa-id-card-o', NULL, 1, 2, 1);
INSERT INTO `menu`
VALUES (10, '/personnel/ec/**', '/per/ec', 'PerEc', '员工奖惩', 'fa fa-american-sign-language-interpreting', NULL, 1, 3,
        1);
INSERT INTO `menu`
VALUES (11, '/personnel/train/**', '/per/train', 'PerTrain', '培训考评', 'fa fa-user-plus', NULL, 1, 3, 1);
INSERT INTO `menu`
VALUES (12, '/personnel/salary/**', '/per/salary', 'PerSalary', '员工调薪', 'fa fa-braille', NULL, 1, 3, 1);
INSERT INTO `menu`
VALUES (13, '/personnel/remove/**', '/per/mv', 'PerMv', '员工调动', 'fa fa-blind', NULL, 1, 3, 1);
INSERT INTO `menu`
VALUES (14, '/salary/sob/**', '/sal/sob', 'SalSob', '工资账套管理', 'fa fa-credit-card-alt ', NULL, 1, 4, 1);
INSERT INTO `menu`
VALUES (15, '/salary/sobcfg/**', '/sal/sobcfg', 'SalSobCfg', '员工账套设置', 'fa fa-cc-amex', NULL, 1, 4, 1);
INSERT INTO `menu`
VALUES (16, '/salary/table/**', '/sal/table', 'SalTable', '工资表管理', 'fa fa-indent', NULL, 1, 4, 1);
INSERT INTO `menu`
VALUES (19, '/statistics/all/**', '/sta/all', 'StaAll', '薪资信息统计', 'fa fa-area-chart', NULL, 1, 5, 1);
INSERT INTO `menu`
VALUES (20, '/statistics/score/**', '/sta/score', 'StaScore', '员工积分统计', 'fa fa-line-chart', NULL, 1, 5, 1);
INSERT INTO `menu`
VALUES (21, '/statistics/personnel/**', '/sta/pers', 'StaPers', '人事信息分析', 'fa fa-pie-chart', NULL, 1, 5, 1);
INSERT INTO `menu`
VALUES (22, '/statistics/recored/**', '/sta/record', 'StaRecord', '人事记录分析', 'fa fa-bar-chart', NULL, 1, 5, 1);
INSERT INTO `menu`
VALUES (23, '/system/basic/**', '/sys/basic', 'SysBasic', '基础信息设置', 'fa fa-stack-overflow', NULL, 1, 6, 1);
INSERT INTO `menu`
VALUES (24, '/system/cfg/**', '/sys/cfg', 'SysCfg', '公告管理', 'fa fa-steam-square', NULL, 1, 6, 1);
INSERT INTO `menu`
VALUES (25, '/system/log/**', '/sys/log', 'SysLog', '操作日志管理', 'fa fa-list', NULL, 1, 6, 1);
INSERT INTO `menu`
VALUES (26, '/system/hr/**', '/sys/hr', 'SysHr', '操作员管理', 'fa fa-users', NULL, 1, 6, 1);
INSERT INTO `menu`
VALUES (27, '/system/hr/**', '/sys/hrbase', 'SysHrBase', '个人中心', 'fa fa-users', NULL, 1, 6, 1);
INSERT INTO `menu`
VALUES (28, '/employee/basic/**', '/emp/calenderBox', 'EmpCalenderBox', '员工打卡', 'fa fa-braille', NULL, 1, 2, 1);
INSERT INTO `menu`
VALUES (29, '/personnel/train/**', '/per/train2', 'PerTrain2', '个人培训', 'fa fa-user-plus', NULL, 1, 2, 1);
INSERT INTO `menu`
VALUES (30, '/personnel/ec/**', '/per/ec2', 'PerEc2', '个人奖惩', 'fa fa-american-sign-language-interpreting', NULL, 1,
        2, 1);
INSERT INTO `menu`
VALUES (31, '/personnel/remove/**', '/per/mv2', 'PerMv2', '个人调动', 'fa fa-blind', NULL, 1, 2, 1);
INSERT INTO `menu`
VALUES (32, '/personnel/salary/**', '/per/salary2', 'PerSalary2', '个人调薪', 'fa fa-braille', NULL, 1, 2, 1);
INSERT INTO `menu`
VALUES (33, '/personnel/ec/**', '/per/work', 'PerWork', '考勤管理', 'fa fa-american-sign-language-interpreting', NULL,
        1, 3, 1);

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role`
(
  `id`  int NOT NULL AUTO_INCREMENT,
  `mid` int NULL DEFAULT NULL,
  `rid` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `mid` (`mid` ASC) USING BTREE,
  INDEX `rid` (`rid` ASC) USING BTREE,
  CONSTRAINT `menu_role_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `menu_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 1364
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
INSERT INTO `menu_role`
VALUES (1306, 28, 34);
INSERT INTO `menu_role`
VALUES (1307, 29, 34);
INSERT INTO `menu_role`
VALUES (1308, 30, 34);
INSERT INTO `menu_role`
VALUES (1309, 31, 34);
INSERT INTO `menu_role`
VALUES (1310, 27, 34);
INSERT INTO `menu_role`
VALUES (1311, 8, 35);
INSERT INTO `menu_role`
VALUES (1312, 9, 35);
INSERT INTO `menu_role`
VALUES (1313, 14, 35);
INSERT INTO `menu_role`
VALUES (1314, 15, 35);
INSERT INTO `menu_role`
VALUES (1315, 16, 35);
INSERT INTO `menu_role`
VALUES (1316, 24, 35);
INSERT INTO `menu_role`
VALUES (1317, 27, 35);
INSERT INTO `menu_role`
VALUES (1318, 8, 36);
INSERT INTO `menu_role`
VALUES (1319, 9, 36);
INSERT INTO `menu_role`
VALUES (1320, 7, 36);
INSERT INTO `menu_role`
VALUES (1321, 10, 36);
INSERT INTO `menu_role`
VALUES (1322, 11, 36);
INSERT INTO `menu_role`
VALUES (1323, 13, 36);
INSERT INTO `menu_role`
VALUES (1324, 33, 36);
INSERT INTO `menu_role`
VALUES (1325, 19, 36);
INSERT INTO `menu_role`
VALUES (1326, 20, 36);
INSERT INTO `menu_role`
VALUES (1327, 21, 36);
INSERT INTO `menu_role`
VALUES (1328, 22, 36);
INSERT INTO `menu_role`
VALUES (1329, 24, 36);
INSERT INTO `menu_role`
VALUES (1330, 27, 36);
INSERT INTO `menu_role`
VALUES (1331, 8, 2);
INSERT INTO `menu_role`
VALUES (1332, 9, 2);
INSERT INTO `menu_role`
VALUES (1333, 7, 2);
INSERT INTO `menu_role`
VALUES (1334, 10, 2);
INSERT INTO `menu_role`
VALUES (1335, 11, 2);
INSERT INTO `menu_role`
VALUES (1336, 13, 2);
INSERT INTO `menu_role`
VALUES (1337, 33, 2);
INSERT INTO `menu_role`
VALUES (1338, 24, 2);
INSERT INTO `menu_role`
VALUES (1339, 27, 2);
INSERT INTO `menu_role`
VALUES (1340, 8, 6);
INSERT INTO `menu_role`
VALUES (1341, 9, 6);
INSERT INTO `menu_role`
VALUES (1342, 28, 6);
INSERT INTO `menu_role`
VALUES (1343, 29, 6);
INSERT INTO `menu_role`
VALUES (1344, 30, 6);
INSERT INTO `menu_role`
VALUES (1345, 31, 6);
INSERT INTO `menu_role`
VALUES (1346, 32, 6);
INSERT INTO `menu_role`
VALUES (1347, 7, 6);
INSERT INTO `menu_role`
VALUES (1348, 10, 6);
INSERT INTO `menu_role`
VALUES (1349, 11, 6);
INSERT INTO `menu_role`
VALUES (1350, 13, 6);
INSERT INTO `menu_role`
VALUES (1351, 33, 6);
INSERT INTO `menu_role`
VALUES (1352, 14, 6);
INSERT INTO `menu_role`
VALUES (1353, 15, 6);
INSERT INTO `menu_role`
VALUES (1354, 16, 6);
INSERT INTO `menu_role`
VALUES (1355, 19, 6);
INSERT INTO `menu_role`
VALUES (1356, 20, 6);
INSERT INTO `menu_role`
VALUES (1357, 21, 6);
INSERT INTO `menu_role`
VALUES (1358, 22, 6);
INSERT INTO `menu_role`
VALUES (1359, 23, 6);
INSERT INTO `menu_role`
VALUES (1360, 24, 6);
INSERT INTO `menu_role`
VALUES (1361, 25, 6);
INSERT INTO `menu_role`
VALUES (1362, 26, 6);
INSERT INTO `menu_role`
VALUES (1363, 27, 6);

-- ----------------------------
-- Table structure for msgcontent
-- ----------------------------
DROP TABLE IF EXISTS `msgcontent`;
CREATE TABLE `msgcontent`
(
  `id`         int                                                     NOT NULL AUTO_INCREMENT,
  `title`      varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL     DEFAULT NULL,
  `message`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL     DEFAULT NULL,
  `createDate` timestamp                                               NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of msgcontent
-- ----------------------------

-- ----------------------------
-- Table structure for nation
-- ----------------------------
DROP TABLE IF EXISTS `nation`;
CREATE TABLE `nation`
(
  `id`   int                                                    NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 57
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of nation
-- ----------------------------
INSERT INTO `nation`
VALUES (1, '汉族');
INSERT INTO `nation`
VALUES (2, '蒙古族');
INSERT INTO `nation`
VALUES (3, '回族');
INSERT INTO `nation`
VALUES (4, '藏族');
INSERT INTO `nation`
VALUES (5, '维吾尔族');
INSERT INTO `nation`
VALUES (6, '苗族');
INSERT INTO `nation`
VALUES (7, '彝族');
INSERT INTO `nation`
VALUES (8, '壮族');
INSERT INTO `nation`
VALUES (9, '布依族');
INSERT INTO `nation`
VALUES (10, '朝鲜族');
INSERT INTO `nation`
VALUES (11, '满族');
INSERT INTO `nation`
VALUES (12, '侗族');
INSERT INTO `nation`
VALUES (13, '瑶族');
INSERT INTO `nation`
VALUES (14, '白族');
INSERT INTO `nation`
VALUES (15, '土家族');
INSERT INTO `nation`
VALUES (16, '哈尼族');
INSERT INTO `nation`
VALUES (17, '哈萨克族');
INSERT INTO `nation`
VALUES (18, '傣族');
INSERT INTO `nation`
VALUES (19, '黎族');
INSERT INTO `nation`
VALUES (20, '傈僳族');
INSERT INTO `nation`
VALUES (21, '佤族');
INSERT INTO `nation`
VALUES (22, '畲族');
INSERT INTO `nation`
VALUES (23, '高山族');
INSERT INTO `nation`
VALUES (24, '拉祜族');
INSERT INTO `nation`
VALUES (25, '水族');
INSERT INTO `nation`
VALUES (26, '东乡族');
INSERT INTO `nation`
VALUES (27, '纳西族');
INSERT INTO `nation`
VALUES (28, '景颇族');
INSERT INTO `nation`
VALUES (29, '柯尔克孜族');
INSERT INTO `nation`
VALUES (30, '土族');
INSERT INTO `nation`
VALUES (31, '达斡尔族');
INSERT INTO `nation`
VALUES (32, '仫佬族');
INSERT INTO `nation`
VALUES (33, '羌族');
INSERT INTO `nation`
VALUES (34, '布朗族');
INSERT INTO `nation`
VALUES (35, '撒拉族');
INSERT INTO `nation`
VALUES (36, '毛难族');
INSERT INTO `nation`
VALUES (37, '仡佬族');
INSERT INTO `nation`
VALUES (38, '锡伯族');
INSERT INTO `nation`
VALUES (39, '阿昌族');
INSERT INTO `nation`
VALUES (40, '普米族');
INSERT INTO `nation`
VALUES (41, '塔吉克族');
INSERT INTO `nation`
VALUES (42, '怒族');
INSERT INTO `nation`
VALUES (43, '乌孜别克族');
INSERT INTO `nation`
VALUES (44, '俄罗斯族');
INSERT INTO `nation`
VALUES (45, '鄂温克族');
INSERT INTO `nation`
VALUES (46, '崩龙族');
INSERT INTO `nation`
VALUES (47, '保安族');
INSERT INTO `nation`
VALUES (48, '裕固族');
INSERT INTO `nation`
VALUES (49, '京族');
INSERT INTO `nation`
VALUES (50, '塔塔尔族');
INSERT INTO `nation`
VALUES (51, '独龙族');
INSERT INTO `nation`
VALUES (52, '鄂伦春族');
INSERT INTO `nation`
VALUES (53, '赫哲族');
INSERT INTO `nation`
VALUES (54, '门巴族');
INSERT INTO `nation`
VALUES (55, '珞巴族');
INSERT INTO `nation`
VALUES (56, '基诺族');

-- ----------------------------
-- Table structure for oplog
-- ----------------------------
DROP TABLE IF EXISTS `oplog`;
CREATE TABLE `oplog`
(
  `id`      int                                                     NOT NULL AUTO_INCREMENT,
  `logtype` tinyint                                                 NULL DEFAULT NULL COMMENT '日志类型，',
  `addDate` timestamp                                               NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加日期',
  `operate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作内容',
  `hrname`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2883
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oplog
-- ----------------------------
INSERT INTO `oplog`
VALUES (2649, 1, '2023-03-19 16:38:35', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2650, 1, '2023-03-19 16:54:31', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2651, 1, '2023-03-19 17:30:50', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2652, 1, '2023-03-19 17:31:55', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2653, 1, '2023-03-19 17:36:49', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2654, 1, '2023-03-19 17:36:57', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2655, 8, '2023-03-27 21:28:49', '操作员角色更新', '小白');
INSERT INTO `oplog`
VALUES (2656, 8, '2023-03-27 21:28:55', '操作员角色更新', '小白');
INSERT INTO `oplog`
VALUES (2657, 8, '2023-03-27 21:29:27', '操作员角色更新', '小白');
INSERT INTO `oplog`
VALUES (2658, 1, '2023-04-06 21:01:26', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2659, 2, '2023-04-18 22:25:00', '员工入职::name:小李workId:00000003', '系统管理员');
INSERT INTO `oplog`
VALUES (2660, 1, '2023-04-21 13:48:08', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2661, 1, '2023-04-21 13:48:53', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2662, 1, '2023-04-21 13:49:57', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2663, 1, '2023-04-21 13:59:52', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2664, 10, '2023-04-22 00:25:01', '批量添加员工考评', '系统管理员');
INSERT INTO `oplog`
VALUES (2665, 10, '2023-04-22 00:25:18', '删除员工考评eid:5268', '系统管理员');
INSERT INTO `oplog`
VALUES (2666, 10, '2023-04-22 00:25:22', '删除员工考评eid:5272', '系统管理员');
INSERT INTO `oplog`
VALUES (2667, 11, '2023-04-22 22:33:03', '更新员工资料::name:小李---workId:00000003', '系统管理员');
INSERT INTO `oplog`
VALUES (2668, 11, '2023-04-22 22:33:40', '更新员工资料::name:小红---workId:00000001', '系统管理员');
INSERT INTO `oplog`
VALUES (2669, 6, '2023-04-22 22:33:40', '员工调动:eid=5268', '系统管理员');
INSERT INTO `oplog`
VALUES (2670, 1, '2023-04-22 22:33:59', '删除部门:id=149', '系统管理员');
INSERT INTO `oplog`
VALUES (2671, 1, '2023-04-22 22:34:23', '添加部门:人事部', '系统管理员');
INSERT INTO `oplog`
VALUES (2672, 1, '2023-04-22 22:35:37', '添加部门:IT技术部', '系统管理员');
INSERT INTO `oplog`
VALUES (2673, 1, '2023-04-22 22:35:52', '添加部门:市场部', '系统管理员');
INSERT INTO `oplog`
VALUES (2674, 1, '2023-04-22 22:52:27', '添加部门:后勤部', '系统管理员');
INSERT INTO `oplog`
VALUES (2675, 11, '2023-04-22 23:22:34', '更新员工资料::name:小李---workId:00000003', '系统管理员');
INSERT INTO `oplog`
VALUES (2676, 11, '2023-04-22 23:23:25', '更新员工资料::name:小白---workId:00000002', '系统管理员');
INSERT INTO `oplog`
VALUES (2677, 11, '2023-04-22 23:23:36', '更新员工资料::name:小白---workId:00000002', '系统管理员');
INSERT INTO `oplog`
VALUES (2678, 1, '2023-04-22 23:34:56', '更新职位:销售专员', '系统管理员');
INSERT INTO `oplog`
VALUES (2679, 1, '2023-04-22 23:40:39', '删除职称 : id=9', '系统管理员');
INSERT INTO `oplog`
VALUES (2680, 1, '2023-04-22 23:41:16', '添加职称普通员工', '系统管理员');
INSERT INTO `oplog`
VALUES (2681, 1, '2023-04-22 23:43:58', '添加角色: ROLE_finance', '系统管理员');
INSERT INTO `oplog`
VALUES (2682, 1, '2023-04-22 23:44:13', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2683, 1, '2023-04-22 23:44:21', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2684, 1, '2023-04-22 23:44:29', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2685, 1, '2023-04-22 23:45:12', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2686, 1, '2023-04-22 23:47:05', '添加角色: ROLE_leader', '系统管理员');
INSERT INTO `oplog`
VALUES (2687, 1, '2023-04-22 23:47:59', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2688, 1, '2023-04-23 09:54:50', '添加部门:法务部', '系统管理员');
INSERT INTO `oplog`
VALUES (2689, 1, '2023-04-23 09:54:55', '删除部门:id=153', '系统管理员');
INSERT INTO `oplog`
VALUES (2690, 1, '2023-04-23 09:56:44', '更新职位:财务专员', '系统管理员');
INSERT INTO `oplog`
VALUES (2691, 1, '2023-04-23 09:57:12', '删除职位: id = 118', '系统管理员');
INSERT INTO `oplog`
VALUES (2692, 1, '2023-04-23 09:57:44', '更新职位:财务经理', '系统管理员');
INSERT INTO `oplog`
VALUES (2693, 1, '2023-04-23 09:59:16', '删除职位: id = 117', '系统管理员');
INSERT INTO `oplog`
VALUES (2694, 1, '2023-04-23 09:59:50', '更新职位:前端工程师', '系统管理员');
INSERT INTO `oplog`
VALUES (2695, 1, '2023-04-23 10:00:29', '添加职位: 人事专员', '系统管理员');
INSERT INTO `oplog`
VALUES (2696, 1, '2023-04-23 10:00:41', '添加职位: 人事经理', '系统管理员');
INSERT INTO `oplog`
VALUES (2698, 1, '2023-04-23 10:04:53', '更新职位:会计', '系统管理员');
INSERT INTO `oplog`
VALUES (2699, 1, '2023-04-23 10:05:02', '更新职位:财务经理', '系统管理员');
INSERT INTO `oplog`
VALUES (2701, 1, '2023-04-23 10:07:33', '更新职位:出纳', '系统管理员');
INSERT INTO `oplog`
VALUES (2702, 1, '2023-04-23 10:08:03', '更新职位:招聘专员', '系统管理员');
INSERT INTO `oplog`
VALUES (2703, 1, '2023-04-23 10:08:11', '更新职位:人事经理', '系统管理员');
INSERT INTO `oplog`
VALUES (2704, 1, '2023-04-23 10:09:25', '更新职位:研发工程师', '系统管理员');
INSERT INTO `oplog`
VALUES (2705, 1, '2023-04-23 10:10:02', '更新职位:项目经理', '系统管理员');
INSERT INTO `oplog`
VALUES (2706, 1, '2023-04-23 10:10:11', '添加职位: 产品经理', '系统管理员');
INSERT INTO `oplog`
VALUES (2707, 1, '2023-04-23 10:10:29', '删除职位: id = 115', '系统管理员');
INSERT INTO `oplog`
VALUES (2708, 1, '2023-04-23 10:16:26', '更新职位:营销专员', '系统管理员');
INSERT INTO `oplog`
VALUES (2709, 1, '2023-04-23 10:16:44', '添加职位: 销售专员', '系统管理员');
INSERT INTO `oplog`
VALUES (2710, 1, '2023-04-23 10:17:09', '添加职位: 法律顾问', '系统管理员');
INSERT INTO `oplog`
VALUES (2711, 1, '2023-04-23 10:17:48', '更新职称初级工程师', '系统管理员');
INSERT INTO `oplog`
VALUES (2712, 1, '2023-04-23 10:29:52', '更新奖惩: 罚款200元', '系统管理员');
INSERT INTO `oplog`
VALUES (2713, 1, '2023-04-23 10:30:00', '更新奖惩: 奖金200元', '系统管理员');
INSERT INTO `oplog`
VALUES (2714, 1, '2023-04-23 10:31:48', '更新奖惩: 升职晋级', '系统管理员');
INSERT INTO `oplog`
VALUES (2715, 1, '2023-04-23 10:32:02', '删除奖惩: id = 23', '系统管理员');
INSERT INTO `oplog`
VALUES (2716, 1, '2023-04-23 10:32:45', '更新奖惩: 记大过', '系统管理员');
INSERT INTO `oplog`
VALUES (2717, 1, '2023-04-23 10:33:11', '更新奖惩: 罚金200元', '系统管理员');
INSERT INTO `oplog`
VALUES (2718, 1, '2023-04-23 10:33:52', '更新奖惩: 书面嘉奖', '系统管理员');
INSERT INTO `oplog`
VALUES (2719, 1, '2023-04-23 10:34:13', '更新奖惩: 奖金200元', '系统管理员');
INSERT INTO `oplog`
VALUES (2720, 1, '2023-04-23 10:34:37', '更新奖惩: 记小过', '系统管理员');
INSERT INTO `oplog`
VALUES (2721, 11, '2023-04-23 10:41:34', '更新员工资料::name:小李---workId:00000003', '系统管理员');
INSERT INTO `oplog`
VALUES (2722, 11, '2023-04-23 10:42:02', '更新员工资料::name:小李---workId:00000003', '系统管理员');
INSERT INTO `oplog`
VALUES (2723, 2, '2023-04-23 10:46:41', '员工入职::name:小黄workId:00000004', '系统管理员');
INSERT INTO `oplog`
VALUES (2724, 11, '2023-04-23 10:47:33', '更新员工资料::name:小李---workId:00000003', '系统管理员');
INSERT INTO `oplog`
VALUES (2725, 11, '2023-04-23 10:55:55', '更新员工资料::name:小李---workId:00000003', '系统管理员');
INSERT INTO `oplog`
VALUES (2726, 11, '2023-04-23 10:58:35', '更新员工资料::name:小白---workId:00000002', '系统管理员');
INSERT INTO `oplog`
VALUES (2727, 11, '2023-04-23 11:02:13', '更新员工资料::name:小李---workId:00000003', '系统管理员');
INSERT INTO `oplog`
VALUES (2728, 11, '2023-04-23 11:03:00', '更新员工资料::name:小白---workId:00000002', '系统管理员');
INSERT INTO `oplog`
VALUES (2729, 2, '2023-04-23 11:15:55', '员工入职::name:张希workId:00000005', '系统管理员');
INSERT INTO `oplog`
VALUES (2730, 7, '2023-04-23 11:16:25', '员工套账变动:workId:5271套账编号:10', '系统管理员');
INSERT INTO `oplog`
VALUES (2731, 5, '2023-04-23 11:17:53', '更新套账:会计工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2732, 1, '2023-04-23 11:19:16', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2733, 1, '2023-04-23 11:26:07', '添加职位: 招聘专员', '系统管理员');
INSERT INTO `oplog`
VALUES (2734, 1, '2023-04-23 11:26:33', '添加职位: 培训专员', '系统管理员');
INSERT INTO `oplog`
VALUES (2735, 1, '2023-04-23 11:26:39', '添加职位: 人事经理', '系统管理员');
INSERT INTO `oplog`
VALUES (2736, 2, '2023-04-23 11:31:34', '员工入职::name:李维workId:00000006', '系统管理员');
INSERT INTO `oplog`
VALUES (2737, 2, '2023-04-23 11:34:12', '员工入职::name:小苏workId:00000007', '系统管理员');
INSERT INTO `oplog`
VALUES (2738, 2, '2023-04-23 11:44:40', '员工入职::name:小何workId:00000008', '系统管理员');
INSERT INTO `oplog`
VALUES (2739, 2, '2023-04-23 11:47:28', '员工入职::name:小杨workId:00000009', '系统管理员');
INSERT INTO `oplog`
VALUES (2740, 2, '2023-04-23 11:49:52', '员工入职::name:小钱workId:00000010', '系统管理员');
INSERT INTO `oplog`
VALUES (2741, 5, '2023-04-23 11:50:20', '更新套账:会计出纳工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2742, 5, '2023-04-23 11:50:53', '更新套账:财务经理工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2743, 5, '2023-04-23 11:51:46', '更新套账:招聘专员、培训专员工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2744, 7, '2023-04-23 11:52:09', '员工套账变动:workId:5279套账编号:26', '系统管理员');
INSERT INTO `oplog`
VALUES (2745, 7, '2023-04-23 11:52:14', '员工套账变动:workId:5278套账编号:26', '系统管理员');
INSERT INTO `oplog`
VALUES (2746, 7, '2023-04-23 11:52:22', '员工套账变动:workId:5277套账编号:26', '系统管理员');
INSERT INTO `oplog`
VALUES (2747, 7, '2023-04-23 11:52:29', '员工套账变动:workId:5276套账编号:26', '系统管理员');
INSERT INTO `oplog`
VALUES (2748, 5, '2023-04-23 11:54:57', '添加套账:name=人事经理工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2749, 7, '2023-04-23 11:55:05', '员工套账变动:workId:5275套账编号:27', '系统管理员');
INSERT INTO `oplog`
VALUES (2750, 7, '2023-04-23 11:55:12', '员工套账变动:workId:5274套账编号:13', '系统管理员');
INSERT INTO `oplog`
VALUES (2751, 7, '2023-04-23 11:55:16', '员工套账变动:workId:5273套账编号:10', '系统管理员');
INSERT INTO `oplog`
VALUES (2752, 7, '2023-04-23 11:55:20', '员工套账变动:workId:5272套账编号:10', '系统管理员');
INSERT INTO `oplog`
VALUES (2753, 7, '2023-04-23 11:55:31', '员工套账变动:workId:5268套账编号:10', '系统管理员');
INSERT INTO `oplog`
VALUES (2754, 7, '2023-04-23 11:55:37', '员工套账变动:workId:5268套账编号:10', '系统管理员');
INSERT INTO `oplog`
VALUES (2755, 7, '2023-04-23 11:55:45', '员工套账变动:workId:5268套账编号:27', '系统管理员');
INSERT INTO `oplog`
VALUES (2756, 7, '2023-04-23 11:55:49', '员工套账变动:workId:5268套账编号:10', '系统管理员');
INSERT INTO `oplog`
VALUES (2757, 7, '2023-04-23 11:55:55', '员工套账变动:workId:5268套账编号:10', '系统管理员');
INSERT INTO `oplog`
VALUES (2758, 7, '2023-04-23 11:57:04', '员工套账变动:workId:5268套账编号:10', '系统管理员');
INSERT INTO `oplog`
VALUES (2759, 7, '2023-04-23 11:57:14', '员工套账变动:workId:5268套账编号:10', '系统管理员');
INSERT INTO `oplog`
VALUES (2760, 7, '2023-04-23 11:58:50', '员工套账变动:workId:5268套账编号:10', '系统管理员');
INSERT INTO `oplog`
VALUES (2761, 7, '2023-04-23 11:59:10', '员工套账变动:workId:5268套账编号:27', '系统管理员');
INSERT INTO `oplog`
VALUES (2762, 7, '2023-04-23 11:59:23', '员工套账变动:workId:5268套账编号:10', '系统管理员');
INSERT INTO `oplog`
VALUES (2763, 7, '2023-04-23 11:59:31', '员工套账变动:workId:5274套账编号:10', '系统管理员');
INSERT INTO `oplog`
VALUES (2764, 7, '2023-04-23 11:59:35', '员工套账变动:workId:5274套账编号:13', '系统管理员');
INSERT INTO `oplog`
VALUES (2765, 7, '2023-04-23 11:59:41', '员工套账变动:workId:5268套账编号:10', '系统管理员');
INSERT INTO `oplog`
VALUES (2766, 7, '2023-04-23 12:00:25', '员工套账变动:workId:5268套账编号:13', '系统管理员');
INSERT INTO `oplog`
VALUES (2767, 2, '2023-04-23 12:04:07', '员工入职::name:李森workId:00000011', '系统管理员');
INSERT INTO `oplog`
VALUES (2768, 2, '2023-04-23 12:06:13', '员工入职::name:李琴workId:00000012', '系统管理员');
INSERT INTO `oplog`
VALUES (2769, 2, '2023-04-23 12:13:24', '员工入职::name:小孙workId:00000013', '系统管理员');
INSERT INTO `oplog`
VALUES (2770, 2, '2023-04-23 12:15:54', '员工入职::name:小周workId:00000014', '系统管理员');
INSERT INTO `oplog`
VALUES (2771, 2, '2023-04-23 12:18:51', '员工入职::name:小明workId:00000015', '系统管理员');
INSERT INTO `oplog`
VALUES (2772, 2, '2023-04-23 12:21:11', '员工入职::name:小齐workId:00000016', '系统管理员');
INSERT INTO `oplog`
VALUES (2773, 2, '2023-04-23 12:23:40', '员工入职::name:小时workId:00000017', '系统管理员');
INSERT INTO `oplog`
VALUES (2774, 5, '2023-04-23 12:25:02', '添加套账:name=项目经理工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2775, 5, '2023-04-23 12:25:25', '添加套账:name=运维工程师工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2776, 5, '2023-04-23 12:25:46', '添加套账:name=研发工程师工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2777, 7, '2023-04-23 12:26:19', '员工套账变动:workId:5280套账编号:28', '系统管理员');
INSERT INTO `oplog`
VALUES (2778, 7, '2023-04-23 12:26:26', '员工套账变动:workId:5281套账编号:28', '系统管理员');
INSERT INTO `oplog`
VALUES (2779, 7, '2023-04-23 12:26:36', '员工套账变动:workId:5282套账编号:30', '系统管理员');
INSERT INTO `oplog`
VALUES (2780, 7, '2023-04-23 12:26:40', '员工套账变动:workId:5283套账编号:30', '系统管理员');
INSERT INTO `oplog`
VALUES (2781, 7, '2023-04-23 12:26:43', '员工套账变动:workId:5284套账编号:30', '系统管理员');
INSERT INTO `oplog`
VALUES (2782, 7, '2023-04-23 12:26:47', '员工套账变动:workId:5285套账编号:29', '系统管理员');
INSERT INTO `oplog`
VALUES (2783, 7, '2023-04-23 12:26:52', '员工套账变动:workId:5286套账编号:29', '系统管理员');
INSERT INTO `oplog`
VALUES (2784, 1, '2023-04-23 14:38:48', '更新职位:运营专员', '系统管理员');
INSERT INTO `oplog`
VALUES (2785, 2, '2023-04-23 14:43:20', '员工入职::name:小西workId:00000018', '系统管理员');
INSERT INTO `oplog`
VALUES (2786, 2, '2023-04-23 14:44:58', '员工入职::name:小林workId:00000019', '系统管理员');
INSERT INTO `oplog`
VALUES (2787, 2, '2023-04-23 14:47:40', '员工入职::name:小南workId:00000020', '系统管理员');
INSERT INTO `oplog`
VALUES (2788, 2, '2023-04-23 14:53:36', '员工入职::name:小美workId:00000021', '系统管理员');
INSERT INTO `oplog`
VALUES (2789, 2, '2023-04-23 14:55:51', '员工入职::name:小秦workId:00000022', '系统管理员');
INSERT INTO `oplog`
VALUES (2790, 2, '2023-04-23 14:58:23', '员工入职::name:小飞workId:00000023', '系统管理员');
INSERT INTO `oplog`
VALUES (2791, 5, '2023-04-23 14:59:01', '添加套账:name=运营专员工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2792, 5, '2023-04-23 15:00:17', '添加套账:name=销售专员工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2793, 7, '2023-04-23 15:00:28', '员工套账变动:workId:5287套账编号:31', '系统管理员');
INSERT INTO `oplog`
VALUES (2794, 7, '2023-04-23 15:00:34', '员工套账变动:workId:5288套账编号:31', '系统管理员');
INSERT INTO `oplog`
VALUES (2795, 7, '2023-04-23 15:00:42', '员工套账变动:workId:5289套账编号:31', '系统管理员');
INSERT INTO `oplog`
VALUES (2796, 7, '2023-04-23 15:00:46', '员工套账变动:workId:5290套账编号:32', '系统管理员');
INSERT INTO `oplog`
VALUES (2797, 7, '2023-04-23 15:00:51', '员工套账变动:workId:5291套账编号:32', '系统管理员');
INSERT INTO `oplog`
VALUES (2798, 7, '2023-04-23 15:00:55', '员工套账变动:workId:5292套账编号:32', '系统管理员');
INSERT INTO `oplog`
VALUES (2799, 2, '2023-04-23 15:07:53', '员工入职::name:小枫workId:00000024', '系统管理员');
INSERT INTO `oplog`
VALUES (2800, 2, '2023-04-23 15:09:43', '员工入职::name:小程workId:00000025', '系统管理员');
INSERT INTO `oplog`
VALUES (2801, 5, '2023-04-23 15:11:19', '添加套账:name=法律顾问工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2802, 5, '2023-04-23 15:12:10', '更新套账:人事经理工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2803, 7, '2023-04-23 15:12:21', '员工套账变动:workId:5293套账编号:33', '系统管理员');
INSERT INTO `oplog`
VALUES (2804, 7, '2023-04-23 15:12:25', '员工套账变动:workId:5294套账编号:33', '系统管理员');
INSERT INTO `oplog`
VALUES (2805, 3, '2023-04-23 15:25:59', '员工奖惩添加:eid=5290--ids:[10]', '系统管理员');
INSERT INTO `oplog`
VALUES (2806, 3, '2023-04-23 15:26:49', '员工奖惩添加:eid=5292--ids:[20]', '系统管理员');
INSERT INTO `oplog`
VALUES (2807, 3, '2023-04-23 15:27:58', '员工奖惩添加:eid=5291--ids:[2, 4]', '系统管理员');
INSERT INTO `oplog`
VALUES (2808, 3, '2023-04-23 15:28:05', '员工奖惩删除:eid=5291--id:134', '系统管理员');
INSERT INTO `oplog`
VALUES (2809, 3, '2023-04-23 15:29:29', '员工奖惩添加:eid=5286--ids:[21, 22]', '系统管理员');
INSERT INTO `oplog`
VALUES (2810, 2, '2023-04-23 15:39:28', '员工入职::name:testworkId:00000026', '系统管理员');
INSERT INTO `oplog`
VALUES (2811, 9, '2023-04-23 15:39:46', '员工离职:name:test---workId:00000026', '系统管理员');
INSERT INTO `oplog`
VALUES (2812, 2, '2023-04-23 15:40:56', '员工入职::name:testworkId:00000026', '系统管理员');
INSERT INTO `oplog`
VALUES (2813, 9, '2023-04-23 15:41:13', '员工离职:name:test---workId:00000026', '系统管理员');
INSERT INTO `oplog`
VALUES (2814, 1, '2023-04-23 15:47:22', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2815, 1, '2023-04-23 15:47:55', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2816, 4, '2023-04-23 15:58:06', '批量添加培训:', '系统管理员');
INSERT INTO `oplog`
VALUES (2817, 10, '2023-04-23 16:01:52', '批量添加员工考评', '系统管理员');
INSERT INTO `oplog`
VALUES (2818, 11, '2023-04-23 17:30:13', '更新员工资料::name:小孙---workId:00000013', '系统管理员');
INSERT INTO `oplog`
VALUES (2819, 6, '2023-04-23 17:30:13', '员工调动:eid=5282', '系统管理员');
INSERT INTO `oplog`
VALUES (2820, 5, '2023-04-23 20:18:23', '更新套账:招聘专员、培训专员工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2821, 5, '2023-04-23 20:19:09', '更新套账:财务经理工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2822, 5, '2023-04-23 20:20:15', '更新套账:人事经理工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2823, 5, '2023-04-23 20:21:35', '更新套账:项目经理工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2824, 5, '2023-04-23 20:22:13', '更新套账:会计出纳工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2825, 5, '2023-04-23 20:23:33', '更新套账:运维工程师工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2826, 5, '2023-04-23 20:24:12', '更新套账:项目经理工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2827, 5, '2023-04-23 20:24:52', '更新套账:研发工程师工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2828, 5, '2023-04-23 20:25:43', '更新套账:运营专员工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2829, 5, '2023-04-23 20:26:34', '更新套账:销售专员工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2830, 5, '2023-04-23 20:27:22', '更新套账:法律顾问工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2832, 5, '2023-04-23 20:37:51', '更新套账:法律顾问工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2833, 5, '2023-04-23 20:47:16', '更新套账:法律顾问工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2834, 11, '2023-04-23 22:00:23', '更新员工资料::name:小程---workId:00000025', '系统管理员');
INSERT INTO `oplog`
VALUES (2835, 11, '2023-04-23 22:00:54', '更新员工资料::name:小程---workId:00000025', '系统管理员');
INSERT INTO `oplog`
VALUES (2836, 11, '2023-04-23 22:29:32', '更新员工资料::name:小孙---workId:00000013', '系统管理员');
INSERT INTO `oplog`
VALUES (2837, 6, '2023-04-23 22:29:32', '员工调动:eid=5282', '系统管理员');
INSERT INTO `oplog`
VALUES (2838, 11, '2023-04-23 22:31:33', '更新员工资料::name:小孙---workId:00000013', '系统管理员');
INSERT INTO `oplog`
VALUES (2839, 6, '2023-04-23 22:31:33', '员工调动:eid=5282', '系统管理员');
INSERT INTO `oplog`
VALUES (2840, 11, '2023-04-23 23:15:10', '更新员工资料::name:小孙---workId:00000013', '系统管理员');
INSERT INTO `oplog`
VALUES (2841, 6, '2023-04-23 23:15:10', '员工调动:eid=5282', '系统管理员');
INSERT INTO `oplog`
VALUES (2842, 11, '2023-04-23 23:15:37', '更新员工资料::name:小孙---workId:00000013', '系统管理员');
INSERT INTO `oplog`
VALUES (2843, 6, '2023-04-23 23:15:37', '员工调动:eid=5282', '系统管理员');
INSERT INTO `oplog`
VALUES (2844, 11, '2023-04-23 23:17:32', '更新员工资料::name:小枫---workId:00000024', '系统管理员');
INSERT INTO `oplog`
VALUES (2845, 4, '2023-04-23 23:18:35', '添加培训:eid=5285', '系统管理员');
INSERT INTO `oplog`
VALUES (2846, 11, '2023-04-23 23:29:20', '更新员工资料::name:小孙---workId:00000013', '系统管理员');
INSERT INTO `oplog`
VALUES (2847, 6, '2023-04-23 23:29:20', '员工调动:eid=5282', '系统管理员');
INSERT INTO `oplog`
VALUES (2848, 11, '2023-04-24 00:08:52', '更新员工资料::name:小孙---workId:00000013', '系统管理员');
INSERT INTO `oplog`
VALUES (2849, 6, '2023-04-24 00:08:52', '员工调动:eid=5282', '系统管理员');
INSERT INTO `oplog`
VALUES (2850, 1, '2023-04-24 00:47:35', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2851, 1, '2023-04-24 00:47:59', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2852, 1, '2023-04-24 00:48:57', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2853, 1, '2023-04-24 00:49:25', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2854, 1, '2023-04-24 00:50:18', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2855, 1, '2023-04-24 00:50:56', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2856, 8, '2023-04-24 01:03:22', '操作员角色更新', '系统管理员');
INSERT INTO `oplog`
VALUES (2857, 8, '2023-04-24 13:48:10', '操作员角色更新', '系统管理员');
INSERT INTO `oplog`
VALUES (2858, 8, '2023-04-24 13:48:23', '操作员角色更新', '系统管理员');
INSERT INTO `oplog`
VALUES (2859, 8, '2023-04-24 13:48:35', '删除操作员: id=33', '系统管理员');
INSERT INTO `oplog`
VALUES (2860, 8, '2023-04-24 13:48:39', '删除操作员: id=34', '系统管理员');
INSERT INTO `oplog`
VALUES (2861, 8, '2023-04-24 13:48:47', '删除操作员: id=35', '系统管理员');
INSERT INTO `oplog`
VALUES (2862, 8, '2023-04-24 13:48:50', '删除操作员: id=36', '系统管理员');
INSERT INTO `oplog`
VALUES (2863, 8, '2023-04-24 13:48:53', '删除操作员: id=38', '系统管理员');
INSERT INTO `oplog`
VALUES (2864, 8, '2023-04-24 13:48:56', '删除操作员: id=39', '系统管理员');
INSERT INTO `oplog`
VALUES (2865, 8, '2023-04-24 13:48:57', '删除操作员: id=40', '系统管理员');
INSERT INTO `oplog`
VALUES (2866, 8, '2023-04-24 13:49:01', '删除操作员: id=41', '系统管理员');
INSERT INTO `oplog`
VALUES (2867, 8, '2023-04-24 13:49:05', '删除操作员: id=43', '系统管理员');
INSERT INTO `oplog`
VALUES (2868, 8, '2023-04-24 13:49:47', '操作员角色更新', '系统管理员');
INSERT INTO `oplog`
VALUES (2869, 1, '2023-04-24 17:20:58', '添加公告五一放假公告', '系统管理员');
INSERT INTO `oplog`
VALUES (2870, 1, '2023-04-24 17:21:35', '更新公告五一放假公告', '系统管理员');
INSERT INTO `oplog`
VALUES (2871, 1, '2023-04-25 19:16:56', '角色权限变更', '系统管理员');
INSERT INTO `oplog`
VALUES (2872, 4, '2023-04-25 20:38:10', '员工培训eid:5285', '系统管理员');
INSERT INTO `oplog`
VALUES (2873, 5, '2023-04-25 23:42:05', '更新套账:会计出纳工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2874, 5, '2023-04-25 23:42:18', '更新套账:会计出纳工资账套', '系统管理员');
INSERT INTO `oplog`
VALUES (2875, 1, '2023-04-27 22:18:27', '更新公告五一放假公告', '系统管理员');
INSERT INTO `oplog`
VALUES (2876, 8, '2023-05-02 15:47:02', '操作员信息更新:李维', '系统管理员');
INSERT INTO `oplog`
VALUES (2877, 8, '2023-05-02 15:49:38', '操作员信息更新:张希', '系统管理员');
INSERT INTO `oplog`
VALUES (2878, 8, '2023-05-02 15:50:17', '操作员信息更新:test', '系统管理员');
INSERT INTO `oplog`
VALUES (2879, 8, '2023-05-02 15:53:02', '操作员信息更新:测试', '系统管理员');
INSERT INTO `oplog`
VALUES (2880, 1, '2023-05-02 23:28:03', '添加角色: ROLE_testa', '系统管理员');
INSERT INTO `oplog`
VALUES (2881, 1, '2023-05-02 23:28:08', '删除角色: id = 37', '系统管理员');
INSERT INTO `oplog`
VALUES (2882, 8, '2023-05-03 16:35:04', '操作员信息更新:lin', '系统管理员');

-- ----------------------------
-- Table structure for politicsstatus
-- ----------------------------
DROP TABLE IF EXISTS `politicsstatus`;
CREATE TABLE `politicsstatus`
(
  `id`   int                                                    NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of politicsstatus
-- ----------------------------
INSERT INTO `politicsstatus`
VALUES (1, '中共党员');
INSERT INTO `politicsstatus`
VALUES (2, '中共预备党员');
INSERT INTO `politicsstatus`
VALUES (3, '群众');

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`
(
  `id`         int                                                    NOT NULL AUTO_INCREMENT,
  `name`       varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位',
  `createDate` timestamp                                              NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled`    tinyint(1)                                             NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name` (`name` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 127
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position`
VALUES (29, '财务经理', '2023-03-13 10:05:02', 1);
INSERT INTO `position`
VALUES (30, '会计', '2023-03-13 10:04:53', 1);
INSERT INTO `position`
VALUES (33, '出纳', '2023-03-13 10:07:33', 1);
INSERT INTO `position`
VALUES (34, '运维工程师', '2023-03-13 23:02:49', 1);
INSERT INTO `position`
VALUES (119, '研发工程师', '2023-03-13 10:09:25', 1);
INSERT INTO `position`
VALUES (120, '项目经理', '2023-03-13 10:10:02', 1);
INSERT INTO `position`
VALUES (121, '运营专员', '2023-04-23 14:38:48', 1);
INSERT INTO `position`
VALUES (122, '销售专员', '2023-03-13 10:16:44', 1);
INSERT INTO `position`
VALUES (123, '法律顾问', '2023-03-13 10:17:09', 1);
INSERT INTO `position`
VALUES (124, '招聘专员', '2023-04-23 11:26:07', 1);
INSERT INTO `position`
VALUES (125, '培训专员', '2023-04-23 11:26:33', 1);
INSERT INTO `position`
VALUES (126, '人事经理', '2023-04-23 11:26:39', 1);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`
(
  `id`     int                                                    NOT NULL AUTO_INCREMENT,
  `name`   varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nameZh` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name` (`name` ASC) USING BTREE,
  UNIQUE INDEX `nameZh` (`nameZh` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 38
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role`
VALUES (2, 'ROLE_personnel', '人事经理');
INSERT INTO `role`
VALUES (6, 'ROLE_admin', '系统管理员');
INSERT INTO `role`
VALUES (34, 'ROLE_员工角色', '员工角色');
INSERT INTO `role`
VALUES (35, 'ROLE_finance', '财务经理');
INSERT INTO `role`
VALUES (36, 'ROLE_leader', '总经理');

-- ----------------------------
-- Table structure for rwards_punishments
-- ----------------------------
DROP TABLE IF EXISTS `rwards_punishments`;
CREATE TABLE `rwards_punishments`
(
  `id`          int                                                     NOT NULL AUTO_INCREMENT,
  `rpsystem_id` int                                                     NULL DEFAULT NULL,
  `rpmsg`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rpiont`      int                                                     NULL DEFAULT NULL,
  `createrp`    timestamp                                               NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `rpmsg` (`rpmsg` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 24
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rwards_punishments
-- ----------------------------
INSERT INTO `rwards_punishments`
VALUES (2, 1, '记小功', 3, '2019-12-28 10:32:50');
INSERT INTO `rwards_punishments`
VALUES (3, 1, '记大功', 5, '2019-12-28 10:33:33');
INSERT INTO `rwards_punishments`
VALUES (4, 1, '通报批评', -1, '2019-12-28 10:33:58');
INSERT INTO `rwards_punishments`
VALUES (5, 1, '记小过', -3, '2019-12-28 10:34:19');
INSERT INTO `rwards_punishments`
VALUES (9, 1, '记大过', -5, '2019-12-28 10:35:02');
INSERT INTO `rwards_punishments`
VALUES (10, 1, '书面嘉奖', 1, '2019-12-28 10:35:03');
INSERT INTO `rwards_punishments`
VALUES (19, 3, '罚金200元', -2, '2020-01-01 16:25:25');
INSERT INTO `rwards_punishments`
VALUES (20, 3, '奖金200元', 2, '2020-01-01 16:53:07');
INSERT INTO `rwards_punishments`
VALUES (21, 1, '升职晋级', 5, '2020-01-06 10:40:26');
INSERT INTO `rwards_punishments`
VALUES (22, 5, '年假+1', 3, '2020-01-11 19:05:55');

-- ----------------------------
-- Table structure for rwardsandpunishments
-- ----------------------------
DROP TABLE IF EXISTS `rwardsandpunishments`;
CREATE TABLE `rwardsandpunishments`
(
  `id`       int                                                     NOT NULL AUTO_INCREMENT,
  `rpsystem` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rwardsandpunishments
-- ----------------------------
INSERT INTO `rwardsandpunishments`
VALUES (1, '行政奖惩类');
INSERT INTO `rwardsandpunishments`
VALUES (3, '经济奖惩类');
INSERT INTO `rwardsandpunishments`
VALUES (5, '专项奖励类');

-- ----------------------------
-- Table structure for salary
-- ----------------------------
DROP TABLE IF EXISTS `salary`;
CREATE TABLE `salary`
(
  `id`                   int                                                    NOT NULL AUTO_INCREMENT,
  `basicSalary`          int                                                    NULL DEFAULT NULL COMMENT '基本工资',
  `bonus`                int                                                    NULL DEFAULT NULL COMMENT '奖金',
  `lunchSalary`          int                                                    NULL DEFAULT NULL COMMENT '午餐补助',
  `trafficSalary`        int                                                    NULL DEFAULT NULL COMMENT '交通补助',
  `allSalary`            int                                                    NULL DEFAULT NULL COMMENT '应发工资',
  `pensionBase`          int                                                    NULL DEFAULT NULL COMMENT '养老金基数',
  `pensionPer`           float                                                  NULL DEFAULT NULL COMMENT '养老金比率',
  `createDate`           timestamp                                              NULL DEFAULT NULL COMMENT '启用时间',
  `medicalBase`          int                                                    NULL DEFAULT NULL COMMENT '医疗基数',
  `medicalPer`           float                                                  NULL DEFAULT NULL COMMENT '医疗保险比率',
  `accumulationFundBase` int                                                    NULL DEFAULT NULL COMMENT '公积金基数',
  `accumulationFundPer`  float                                                  NULL DEFAULT NULL COMMENT '公积金比率',
  `name`                 varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 34
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of salary
-- ----------------------------
INSERT INTO `salary`
VALUES (10, 5000, 500, 300, 300, 5350, 5000, 0.05, '2020-01-11 19:54:24', 5000, 0.05, 5000, 0.05, '会计出纳工资账套');
INSERT INTO `salary`
VALUES (13, 10000, 1000, 500, 500, 9900, 10000, 0.07, '2020-01-11 19:54:24', 10000, 0.07, 10000, 0.07,
        '财务经理工资账套');
INSERT INTO `salary`
VALUES (26, 5000, 200, 300, 300, 5050, 5000, 0.05, '2023-03-10 21:07:53', 5000, 0.05, 5000, 0.05,
        '招聘专员、培训专员工资账套');
INSERT INTO `salary`
VALUES (27, 10000, 1000, 500, 500, 9900, 10000, 0.07, '2023-04-23 11:54:57', 10000, 0.07, 10000, 0.07,
        '人事经理工资账套');
INSERT INTO `salary`
VALUES (28, 12000, 1000, 500, 500, 11480, 12000, 0.07, '2023-04-23 12:25:02', 12000, 0.07, 12000, 0.07,
        '项目经理工资账套');
INSERT INTO `salary`
VALUES (29, 12000, 1000, 500, 500, 11480, 12000, 0.07, '2023-04-23 12:25:25', 12000, 0.07, 12000, 0.07,
        '运维工程师工资账套');
INSERT INTO `salary`
VALUES (30, 15000, 1000, 500, 500, 13850, 15000, 0.07, '2023-04-23 12:25:46', 15000, 0.07, 15000, 0.07,
        '研发工程师工资账套');
INSERT INTO `salary`
VALUES (31, 5500, 500, 300, 300, 5775, 5500, 0.05, '2023-04-23 14:59:01', 5500, 0.05, 5500, 0.05, '运营专员工资账套');
INSERT INTO `salary`
VALUES (32, 4000, 200, 200, 200, 4000, 4000, 0.05, '2023-04-23 15:00:17', 4000, 0.05, 4000, 0.05, '销售专员工资账套');
INSERT INTO `salary`
VALUES (33, 15000, 1000, 500, 500, 13850, 15000, 0.07, '2023-04-23 15:11:19', 15000, 0.07, 15000, 0.07,
        '法律顾问工资账套');

-- ----------------------------
-- Table structure for sysmsg
-- ----------------------------
DROP TABLE IF EXISTS `sysmsg`;
CREATE TABLE `sysmsg`
(
  `id`    int NOT NULL AUTO_INCREMENT,
  `mid`   int NULL DEFAULT NULL COMMENT '消息id',
  `type`  int NULL DEFAULT 0 COMMENT '0表示群发消息',
  `hrid`  int NULL DEFAULT NULL COMMENT '这条消息是给谁的',
  `state` int NULL DEFAULT 0 COMMENT '0 未读 1 已读',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `hrid` (`hrid` ASC) USING BTREE,
  INDEX `sysmsg_ibfk_1` (`mid` ASC) USING BTREE,
  CONSTRAINT `sysmsg_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `msgcontent` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sysmsg_ibfk_2` FOREIGN KEY (`hrid`) REFERENCES `hr` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sysmsg
-- ----------------------------

-- ----------------------------
-- Procedure structure for addDep
-- ----------------------------
DROP PROCEDURE IF EXISTS `addDep`;
delimiter ;;
CREATE PROCEDURE `addDep`(in depName varchar(32), in parentId int, in enabled boolean, out result int, out result2 int)
begin
  declare did int;
  declare pDepPath varchar(64);
  insert into department set name=depName, parentId=parentId, enabled=enabled;
  select row_count() into result;
  select last_insert_id() into did;
  set result2 = did;
  select depPath into pDepPath from department where id = parentId;
  update department set depPath=concat(pDepPath, '.', did) where id = did;
  update department set isParent= true where id = parentId;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for deleteDep
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteDep`;
delimiter ;;
CREATE PROCEDURE `deleteDep`(in did int, out result int)
begin
  declare ecount int;
  declare pid int;
  declare pcount int;
  select count(*) into ecount from employee where departmentId = did;
  if ecount > 0 then
    set result = -1;
  else
    select parentId into pid from department where id = did;
    delete from department where id = did and isParent = false;
    select row_count() into result;
    select count(*) into pcount from department where parentId = pid;
    if pcount = 0 then
      update department set isParent= false where id = pid;
    end if;
  end if;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
