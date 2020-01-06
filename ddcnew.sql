/*
 Navicat Premium Data Transfer

 Source Server         : 爽嗨
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : rm-bp1813j5rjfd6hu3b2o.mysql.rds.aliyuncs.com:3306
 Source Schema         : ddcnew

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 06/01/2020 10:58:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for d_admin
-- ----------------------------
DROP TABLE IF EXISTS `d_admin`;
CREATE TABLE `d_admin`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用戶名',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密碼',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `login_time` int(11) NOT NULL DEFAULT 0 COMMENT '登录时间',
  `login_ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '管理员登录IP',
  `addtime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `salt` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '随机加密字符串',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=未删除  1=删除',
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0正常  1禁用',
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限组id',
  `store_id` int(11) DEFAULT 0 COMMENT '是否绑定商户id 不绑定则可以看全部数据,绑定则只能看自己的数据',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '用户头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_admin
-- ----------------------------
INSERT INTO `d_admin` VALUES (7, 'admin', '22d8733f7ef6ce5969d8a611caade541', '爽嗨超级管理员', 1571373882, '127.0.0.1', 0, '', 0, 0, NULL, '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42', 0, 'user/20191209/d94e62c863d9d5827f6518f957ff0570.png');
INSERT INTO `d_admin` VALUES (9, 'ceshi', '22d8733f7ef6ce5969d8a611caade541', '', 0, '', 0, '', 0, 0, NULL, '1,2,12,13,14,15,3,16,17,4,18,5,19,20,21,22,23,6,24,25,7,26,8,27,28,29,30,31,32,33,9,34,35,10,36,11,37,38', 0, NULL);
INSERT INTO `d_admin` VALUES (11, 'ce', '22d8733f7ef6ce5969d8a611caade541', '', 0, '', 0, '', 0, 0, NULL, '1,2,12,13,14,15', 0, NULL);

-- ----------------------------
-- Table structure for d_alarm
-- ----------------------------
DROP TABLE IF EXISTS `d_alarm`;
CREATE TABLE `d_alarm`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `car_id` int(11) NOT NULL DEFAULT 0 COMMENT '车子ID',
  `car_coding` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '车子编号',
  `IMEI` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '车子的IMEI编号',
  `addtime` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地区',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '警报信息',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '报警类型 关联alarm_list  ID',
  `store_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '代理商ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车子报警信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_alarm
-- ----------------------------
INSERT INTO `d_alarm` VALUES (1, 1, '1', '', 0, '', 'sjajsjasjasaj', 2, 1);
INSERT INTO `d_alarm` VALUES (2, 2, '0', '', 0, '', '撒大声地', 1, 1);

-- ----------------------------
-- Table structure for d_alarm_list
-- ----------------------------
DROP TABLE IF EXISTS `d_alarm_list`;
CREATE TABLE `d_alarm_list`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车子报警的类型',
  `time` int(11) NOT NULL DEFAULT 0 COMMENT '添加的时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_alarm_list
-- ----------------------------
INSERT INTO `d_alarm_list` VALUES (1, '点低', 0);
INSERT INTO `d_alarm_list` VALUES (2, '唉', 0);

-- ----------------------------
-- Table structure for d_announcement
-- ----------------------------
DROP TABLE IF EXISTS `d_announcement`;
CREATE TABLE `d_announcement`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '发布公告的管理员ID',
  `time` int(11) NOT NULL DEFAULT 0 COMMENT '发布公告的时间',
  `centons` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公告内容',
  `state` int(11) DEFAULT 2 COMMENT '1展示2不展示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for d_arrears
-- ----------------------------
DROP TABLE IF EXISTS `d_arrears`;
CREATE TABLE `d_arrears`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '欠款金额  值为负数',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '订单Id',
  `return` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=未归还欠款 2=归还欠款',
  `time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '补款时间',
  `addtime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '生成记录时间',
  `is_delete` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=正常 2=删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '欠款记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_arrears
-- ----------------------------
INSERT INTO `d_arrears` VALUES (64, 12.00, 102, '741', 2, 1576400763, 1576400581, 1);
INSERT INTO `d_arrears` VALUES (65, 12.00, 105, '746', 2, 1576400776, 1576400716, 1);
INSERT INTO `d_arrears` VALUES (66, 4.00, 102, '747', 2, 1576401011, 1576400905, 1);
INSERT INTO `d_arrears` VALUES (67, 53.99, 104, '748', 2, 1576401286, 1576401180, 1);
INSERT INTO `d_arrears` VALUES (68, 8.00, 104, '751', 2, 1576402233, 1576402227, 1);
INSERT INTO `d_arrears` VALUES (69, 0.00, 104, '754', 2, 1576403387, 1576403379, 1);
INSERT INTO `d_arrears` VALUES (70, 12.00, 104, '756', 2, 1576403724, 1576403599, 1);
INSERT INTO `d_arrears` VALUES (71, 6.00, 104, '759', 2, 1576404079, 1576404075, 1);
INSERT INTO `d_arrears` VALUES (72, 6.00, 104, '760', 2, 1576404226, 1576404120, 1);
INSERT INTO `d_arrears` VALUES (73, 12.00, 105, '762', 2, 1576404629, 1576404580, 1);
INSERT INTO `d_arrears` VALUES (74, 8.00, 95, '763', 2, 1576404685, 1576404682, 1);
INSERT INTO `d_arrears` VALUES (75, 4.00, 104, '774', 2, 1576471421, 1576471378, 1);
INSERT INTO `d_arrears` VALUES (76, 8.00, 95, '785', 2, 1576480071, 1576479997, 1);
INSERT INTO `d_arrears` VALUES (77, 4.00, 87, '837', 2, 1576555788, 1576555167, 1);
INSERT INTO `d_arrears` VALUES (78, 12.00, 105, '878', 2, 1576571740, 1576571681, 1);
INSERT INTO `d_arrears` VALUES (79, 4.00, 95, '893', 2, 1576632381, 1576575109, 1);
INSERT INTO `d_arrears` VALUES (80, 8.00, 105, '881', 2, 1576650667, 1576649401, 1);

-- ----------------------------
-- Table structure for d_car
-- ----------------------------
DROP TABLE IF EXISTS `d_car`;
CREATE TABLE `d_car`  (
  `car_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `car_coding` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '车辆编码',
  `car_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车辆型号',
  `car_frame` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '车架编号',
  `iccid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '流量卡编号',
  `IMEI` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'IMEI号码',
  `sver` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '软件版本号',
  `hver` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '' COMMENT '硬件版本号',
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '地区',
  `electricityb` tinyint(3) UNSIGNED DEFAULT 100 COMMENT '设备备用电池电量  只用于显示',
  `electricity` tinyint(3) UNSIGNED DEFAULT 100 COMMENT '电池电量 用于比较是否低电量',
  `distance` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '可骑行多少公里',
  `mileage` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '车子里程',
  `billing` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '计费方式 ',
  `img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '车子图片',
  `type` tinyint(3) UNSIGNED DEFAULT 5 COMMENT '车子状态 0未租未锁  1未租未断电 2长时间未还   3长时间未查看 4长时间未使用  6车辆故障  5正常 9服务区外  10定位失败  11未租未查',
  `lat` decimal(20, 10) DEFAULT 0.0000000000 COMMENT '维度',
  `lng` decimal(20, 10) DEFAULT 0.0000000000 COMMENT '经度',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '具体位置',
  `landmark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '地标',
  `addtime` int(11) UNSIGNED DEFAULT 0 COMMENT '添加车子信息时间',
  `state` tinyint(1) DEFAULT 0 COMMENT '车子状态  0=正常 1=异常',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '车子异常的原因',
  `is_login` tinyint(1) UNSIGNED DEFAULT 2 COMMENT '1=上线 2=新添加未登录 3=下线',
  `login_time` int(11) DEFAULT 0 COMMENT '上线时间',
  `login_location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '上线位置',
  `car_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '车子的类型',
  `offline_time` int(11) DEFAULT 0 COMMENT '下线时间',
  `offline_reason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '下线原因',
  `store_id` int(11) DEFAULT 0 COMMENT '上锁时所属的代理商',
  `offline_location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '下线位置',
  `is_malfunction` int(11) DEFAULT 0 COMMENT '0 没有故障   有故障就是故障的ID   关联 malfunction_list',
  `malfunction_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '0=没有故障  反之是故障的类型',
  `is_electricity` tinyint(1) UNSIGNED DEFAULT 1 COMMENT '1 正常  2断电',
  `time` int(11) DEFAULT 0 COMMENT '车子更新时间',
  `use_time` int(11) UNSIGNED DEFAULT 0 COMMENT '租用状态下使用了多久',
  `precipitation_time` int(20) NOT NULL DEFAULT 0 COMMENT '沉淀时长 也就是未被使用的时间  小時',
  `warn` tinyint(1) UNSIGNED DEFAULT 1 COMMENT '1=正常 2= 被盗',
  `is_beyond` tinyint(1) UNSIGNED DEFAULT 1 COMMENT '1=正常  2=超区  3=车子没发送位置',
  PRIMARY KEY (`car_id`) USING BTREE,
  UNIQUE INDEX `car_coding`(`car_coding`) USING BTREE COMMENT '车子上的编码',
  UNIQUE INDEX `IMEI`(`IMEI`) USING BTREE COMMENT 'IMEI'
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车辆表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_car
-- ----------------------------
INSERT INTO `d_car` VALUES (61, '1000000014', 'v.10', 'v.10', '680001234512345', '1000000014', '1.2-191218', '1.2-191218', '成都市郫都区', 0, 59, '35.4', '0', '分钟', '', 6, 30.7771500000, 103.8580400000, '中国四川省成都市郫都区德源嘉业花园(红旗大道南段北)', '德源', 1576717663, 0, '', 3, 1576754880, '', '电动车', 1576771202, '长时间未通讯', 44, '', 106, '电源系统', 1, 1576771202, 0, 6, 1, 1);
INSERT INTO `d_car` VALUES (65, '1000000012', '123124', '13212', '680001234512345', '1000000012', '1.2-191218', '1.2-191218', '成都郫县', 0, 0, '46.2', '0', '分钟', '', 5, 30.5517300000, 104.0642800000, '中国四川省成都市武侯区雄川金融中心(天府二街北)', '雄川金融中心', 1576740181, 1, '车子异常移动', 3, 1576746187, '', '电动车', 1576749241, '长时间未通讯', 45, '', 0, '', 1, 1576749241, 0, 0, 1, 2);

-- ----------------------------
-- Table structure for d_car_location
-- ----------------------------
DROP TABLE IF EXISTS `d_car_location`;
CREATE TABLE `d_car_location`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '城市',
  `store_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '代理商ID',
  `location` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '还车点',
  `location1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '第一个还车地址区域坐标',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=正常使用 2=已下线不可使用区域',
  `handling_fee` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '超出去区域的调度费',
  `range` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '左边点的范围 单位米',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '还车区域' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_car_location
-- ----------------------------
INSERT INTO `d_car_location` VALUES (95, '成都市郫都区', 44, '', '{\"lat\":\"30.777426706547747\",\"lng\":\"103.85832488536835\"}', 1, 10.00, 50.00);
INSERT INTO `d_car_location` VALUES (96, '成都市郫都区', 44, '', '{\"lat\":\"30.777827680308\",\"lng\":\"103.85798692703247\"}', 1, 10.00, 30.00);
INSERT INTO `d_car_location` VALUES (97, '成都市郫都区', 44, '', '{\"lat\":\"30.77691050816296\",\"lng\":\"103.85820150375366\"}', 1, 10.00, 10.00);
INSERT INTO `d_car_location` VALUES (100, '成都郫县', 45, '', '{\"lat\":\"30.55286508822412\",\"lng\":\"104.06415224075317\"}', 1, 5.00, 50.00);
INSERT INTO `d_car_location` VALUES (101, '二街1', 45, '', '{\"lat\":\"30.551553105877094\",\"lng\":\"104.0642112493515\"}', 1, 10.00, 30.00);
INSERT INTO `d_car_location` VALUES (102, '二街2', 45, '', '{\"lat\":\"30.552731119008666\",\"lng\":\"104.06308472156525\"}', 1, 10.00, 50.00);
INSERT INTO `d_car_location` VALUES (103, '成都郫县', 45, '', '{\"lat\":\"30.55417705283775\",\"lng\":\"104.06454920768738\"}', 1, 10.00, 50.00);

-- ----------------------------
-- Table structure for d_car_lock
-- ----------------------------
DROP TABLE IF EXISTS `d_car_lock`;
CREATE TABLE `d_car_lock`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `car_id` int(11) NOT NULL DEFAULT 0 COMMENT '车子ID',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户Id',
  `time` int(11) NOT NULL DEFAULT 0 COMMENT '车子解锁时间',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=成功 2=失败',
  `centent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '失败原因',
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车子解锁的坐标',
  `car_type` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车子类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车子解锁列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for d_car_price
-- ----------------------------
DROP TABLE IF EXISTS `d_car_price`;
CREATE TABLE `d_car_price`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `store_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '代理ID',
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '区域',
  `car_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车的类型',
  `one_time` int(11) NOT NULL DEFAULT 0 COMMENT '二段收费   第一段是多少分钟',
  `one_price` decimal(10, 2) NOT NULL COMMENT '二段收费   第一段是多少钱',
  `two_time` int(11) NOT NULL COMMENT '二段收费   第二段是多少分钟',
  `two_price` decimal(10, 2) NOT NULL COMMENT '二段收费   第二段每分钟是多少钱',
  `addtime` int(11) NOT NULL DEFAULT 0 COMMENT '录入信息的时间',
  `is_delete` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=正常  2=删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '骑行价格表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_car_price
-- ----------------------------
INSERT INTO `d_car_price` VALUES (12, 44, '', '电动车', 20, 1.00, 1, 0.10, 1576739532, 1);
INSERT INTO `d_car_price` VALUES (14, 44, '', '1', 1, 1.00, 1, 0.10, 1576740657, 1);

-- ----------------------------
-- Table structure for d_card
-- ----------------------------
DROP TABLE IF EXISTS `d_card`;
CREATE TABLE `d_card`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '代理商ID',
  `card_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最近一次购买的类型关联card_list 的主键',
  `day_count` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最近一次购买的天数',
  `start_time` int(11) NOT NULL DEFAULT 0 COMMENT '购卡开始时间',
  `end_time` int(11) NOT NULL DEFAULT 0 COMMENT '卡到期时间',
  `free_ride` tinyint(5) NOT NULL DEFAULT 0 COMMENT '免费骑行的次数',
  `is_expired` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0不过期   1过期',
  `addtime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '数据写入时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_card
-- ----------------------------
INSERT INTO `d_card` VALUES (15, 110, 3, 6, '30', 1576711785, 1579303785, 0, 0, 1576711785);
INSERT INTO `d_card` VALUES (16, 111, 3, 8, '365', 1576714606, 1608250606, 0, 0, 1576714606);
INSERT INTO `d_card` VALUES (17, 108, 3, 6, '30', 1576718852, 1579310852, 0, 0, 1576718852);
INSERT INTO `d_card` VALUES (18, 112, 3, 6, '30', 1576742215, 1579334215, 0, 0, 1576742215);

-- ----------------------------
-- Table structure for d_card_list
-- ----------------------------
DROP TABLE IF EXISTS `d_card_list`;
CREATE TABLE `d_card_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_type` tinyint(1) UNSIGNED NOT NULL COMMENT '1=周卡  2=月卡 3=年卡',
  `day_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '月卡持续天数',
  `money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '金额',
  `discount_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '折扣后金额',
  `sum` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '赠送骑行次数',
  `addtime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1正常  2异常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '卡列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_card_list
-- ----------------------------
INSERT INTO `d_card_list` VALUES (6, 2, 30, 3.90, 3.90, '0', 0, 1);
INSERT INTO `d_card_list` VALUES (8, 3, 365, 19.90, 19.90, '0', 0, 1);

-- ----------------------------
-- Table structure for d_card_order
-- ----------------------------
DROP TABLE IF EXISTS `d_card_order`;
CREATE TABLE `d_card_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '代理商ID',
  `card_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'card_list 的主键',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '支付数额',
  `pay_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '付款时间',
  `is_pay` tinyint(1) UNSIGNED NOT NULL DEFAULT 2 COMMENT '1=支付成功 2=未支付',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '订单号',
  `pay_type` smallint(6) NOT NULL DEFAULT 1 COMMENT '支付方式：1=微信支付  ',
  `card_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=周卡  2=月卡 3赠送',
  `is_success` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=未到账 2=到账',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '月卡订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_card_order
-- ----------------------------
INSERT INTO `d_card_order` VALUES (72, 110, 3, 6, 3.90, 1576711775, 1, '201912190729355870274511', 1, 0, 2);
INSERT INTO `d_card_order` VALUES (73, 111, 3, 8, 19.90, 1576714595, 1, '201912190816353736842712', 1, 0, 2);
INSERT INTO `d_card_order` VALUES (74, 108, 3, 6, 3.90, 1576718828, 1, '201912190927086992059603', 1, 0, 2);
INSERT INTO `d_card_order` VALUES (75, 112, 3, 6, 3.90, 1576742206, 1, '201912191556465649064410', 1, 0, 2);

-- ----------------------------
-- Table structure for d_change
-- ----------------------------
DROP TABLE IF EXISTS `d_change`;
CREATE TABLE `d_change`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `car_id` int(11) NOT NULL DEFAULT 0 COMMENT '车子ID',
  `car_coding` int(11) NOT NULL DEFAULT 0 COMMENT '车子编号',
  `manager` int(11) NOT NULL DEFAULT 0 COMMENT '管理人员的ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '换电人员',
  `start_time` int(11) NOT NULL DEFAULT 0 COMMENT '开始换电时间',
  `end_time` int(11) NOT NULL DEFAULT 0 COMMENT '结束换电时间',
  `time` int(11) NOT NULL DEFAULT 0 COMMENT '换电时间',
  `is_delete` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=未删除  2=删除',
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地区',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '换电记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for d_city_region
-- ----------------------------
DROP TABLE IF EXISTS `d_city_region`;
CREATE TABLE `d_city_region`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT ' 城市',
  `location_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '坐标',
  `addtime` int(11) NOT NULL COMMENT '增加时间',
  `store_id` int(11) NOT NULL COMMENT '代理商id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '骑行区域坐标' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_city_region
-- ----------------------------
INSERT INTO `d_city_region` VALUES (17, '成都市郫都区', '{\"lat\":\"30.78174054217191\",\"lng\":\"103.85766506195068\"}-{\"lat\":\"30.77862501382964\",\"lng\":\"103.86240720748901\"}-{\"lat\":\"30.77233834455977\",\"lng\":\"103.85837316513062\"}-{\"lat\":\"30.77711330099719\",\"lng\":\"103.85268688201904\"}-{\"lat\":\"30.779823305903236\",\"lng\":\"103.8557767868042\"}', 1576716117, 44);
INSERT INTO `d_city_region` VALUES (18, '二街01', '{\"lat\":\"30.551456092393803\",\"lng\":\"104.06512320041656\"}-{\"lat\":\"30.551465331777347\",\"lng\":\"104.06408250331879\"}-{\"lat\":\"30.55146071208569\",\"lng\":\"104.06290769577026\"}-{\"lat\":\"30.552906664839586\",\"lng\":\"104.06284868717194\"}-{\"lat\":\"30.554306400501257\",\"lng\":\"104.0627521276474\"}-{\"lat\":\"30.55427406360154\",\"lng\":\"104.06461894512177\"}-{\"lat\":\"30.552892805969748\",\"lng\":\"104.0651285648346\"}', 1576722457, 45);

-- ----------------------------
-- Table structure for d_codesend
-- ----------------------------
DROP TABLE IF EXISTS `d_codesend`;
CREATE TABLE `d_codesend`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0' COMMENT '短信编号',
  `centon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '短信内容',
  `time` int(11) DEFAULT 0 COMMENT '一天只能发送一次',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短信模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_codesend
-- ----------------------------
INSERT INTO `d_codesend` VALUES (8, 'SMS_178585256', '验证码', 0);

-- ----------------------------
-- Table structure for d_deposit
-- ----------------------------
DROP TABLE IF EXISTS `d_deposit`;
CREATE TABLE `d_deposit`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `one_month` decimal(10, 2) DEFAULT NULL COMMENT '3.9元每月',
  `three_month` decimal(10, 2) DEFAULT NULL COMMENT '9.9元每月',
  `one_year` decimal(10, 2) DEFAULT NULL COMMENT '19.9元每月',
  `one_month_second` int(11) DEFAULT NULL COMMENT '3.9元每月送的骑行次数',
  `three_month_second` int(11) DEFAULT NULL COMMENT '9.9元每月送的骑行次数',
  `one_year_second` int(11) DEFAULT NULL COMMENT '19.9元每月送的骑行次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_deposit
-- ----------------------------
INSERT INTO `d_deposit` VALUES (1, 3.90, 9.90, 19.90, 1, 6, 10);

-- ----------------------------
-- Table structure for d_deposit_order
-- ----------------------------
DROP TABLE IF EXISTS `d_deposit_order`;
CREATE TABLE `d_deposit_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '代理商ID',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '押金数额',
  `pay_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '付款时间',
  `is_pay` tinyint(1) UNSIGNED NOT NULL DEFAULT 2 COMMENT '1=支付成功 2=未支付',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '订单号',
  `pay_type` smallint(6) NOT NULL DEFAULT 1 COMMENT '支付方式：1=微信支付  ',
  `refund_type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1退款中  2正常',
  `addtime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '申请时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '押金订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_deposit_order
-- ----------------------------
INSERT INTO `d_deposit_order` VALUES (86, 49, 3, 0.01, 1575444398, 1, '201912041526384150162829', 1, 2, 0);
INSERT INTO `d_deposit_order` VALUES (87, 65, 3, 0.01, 1575444594, 1, '201912041529548537063716', 1, 1, 0);
INSERT INTO `d_deposit_order` VALUES (88, 65, 3, 500.00, 1575444626, 2, '201912041530263077428033', 1, 2, 0);
INSERT INTO `d_deposit_order` VALUES (89, 65, 3, 500.00, 1575444739, 2, '201912041532192778248220', 1, 2, 0);
INSERT INTO `d_deposit_order` VALUES (90, 66, 3, 500.00, 1575444761, 2, '201912041532419806935322', 1, 2, 0);
INSERT INTO `d_deposit_order` VALUES (91, 66, 3, 0.01, 1575444776, 1, '201912041532565508744224', 1, 1, 0);
INSERT INTO `d_deposit_order` VALUES (92, 65, 3, 500.00, 1575445234, 2, '201912041540343551623930', 1, 2, 0);
INSERT INTO `d_deposit_order` VALUES (93, 68, 3, 0.01, 1575447015, 1, '201912041610159862393918', 1, 2, 0);
INSERT INTO `d_deposit_order` VALUES (94, 67, 3, 0.01, 1575510890, 1, '201912050954504348039125', 1, 2, 0);
INSERT INTO `d_deposit_order` VALUES (95, 70, 3, 0.01, 1575527901, 1, '201912051438217867620520', 1, 2, 0);
INSERT INTO `d_deposit_order` VALUES (96, 71, 3, 0.01, 1575602548, 1, '201912061122286174257328', 1, 2, 0);
INSERT INTO `d_deposit_order` VALUES (97, 72, 3, 0.01, 1575608497, 1, '201912061301378049998116', 1, 2, 0);
INSERT INTO `d_deposit_order` VALUES (98, 73, 3, 0.01, 1575945332, 1, '201912101035321150141255', 1, 1, 0);

-- ----------------------------
-- Table structure for d_detail
-- ----------------------------
DROP TABLE IF EXISTS `d_detail`;
CREATE TABLE `d_detail`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '代理商ID',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '金额',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=押金支出 2=押金收入 3= 骑车支出  4=余额充值  5=月卡购买',
  `time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '写入时间',
  `pay_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=维信  2=余额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 644 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_detail
-- ----------------------------
INSERT INTO `d_detail` VALUES (337, 65, 3, 100.00, 4, 1575444718, 1);
INSERT INTO `d_detail` VALUES (338, 66, 3, 0.01, 1, 1575445178, 1);
INSERT INTO `d_detail` VALUES (339, 65, 3, 0.01, 1, 1575445447, 1);
INSERT INTO `d_detail` VALUES (343, 66, 3, 0.01, 1, 1575446490, 1);
INSERT INTO `d_detail` VALUES (345, 68, 3, 0.01, 1, 1575447028, 1);
INSERT INTO `d_detail` VALUES (346, 68, 3, 50.00, 4, 1575447057, 1);
INSERT INTO `d_detail` VALUES (348, 68, 3, 37.00, 3, 1575447568, 1);
INSERT INTO `d_detail` VALUES (349, 68, 3, 37.00, 3, 1575448024, 1);
INSERT INTO `d_detail` VALUES (352, 68, 3, 37.00, 3, 1575449905, 1);
INSERT INTO `d_detail` VALUES (353, 68, 3, 37.00, 3, 1575450113, 1);
INSERT INTO `d_detail` VALUES (354, 68, 3, 220.37, 5, 1575450254, 1);
INSERT INTO `d_detail` VALUES (356, 68, 3, 36.00, 3, 1575450366, 1);
INSERT INTO `d_detail` VALUES (368, 67, 3, 50.00, 4, 1575510871, 1);
INSERT INTO `d_detail` VALUES (369, 67, 3, 0.01, 1, 1575510905, 1);
INSERT INTO `d_detail` VALUES (370, 67, 3, 1.00, 3, 1575511195, 1);
INSERT INTO `d_detail` VALUES (371, 66, 3, 100.00, 4, 1575527584, 1);
INSERT INTO `d_detail` VALUES (372, 66, 3, 37.00, 3, 1575527725, 1);
INSERT INTO `d_detail` VALUES (373, 70, 3, 0.01, 1, 1575527908, 1);
INSERT INTO `d_detail` VALUES (374, 70, 3, 50.00, 4, 1575527925, 1);
INSERT INTO `d_detail` VALUES (377, 66, 3, 46.00, 3, 1575597891, 1);
INSERT INTO `d_detail` VALUES (378, 68, 3, 36.00, 3, 1575599538, 1);
INSERT INTO `d_detail` VALUES (379, 68, 3, 36.00, 3, 1575599653, 1);
INSERT INTO `d_detail` VALUES (380, 71, 3, 0.01, 1, 1575602555, 1);
INSERT INTO `d_detail` VALUES (381, 71, 3, 50.00, 4, 1575602570, 1);
INSERT INTO `d_detail` VALUES (382, 67, 3, 46.00, 3, 1575603329, 1);
INSERT INTO `d_detail` VALUES (383, 67, 3, 46.00, 3, 1575603518, 1);
INSERT INTO `d_detail` VALUES (384, 71, 3, 10.00, 3, 1575603682, 1);
INSERT INTO `d_detail` VALUES (385, 71, 3, 10.00, 3, 1575607007, 1);
INSERT INTO `d_detail` VALUES (386, 71, 3, 10.00, 3, 1575607110, 1);
INSERT INTO `d_detail` VALUES (387, 72, 3, 0.01, 1, 1575608504, 1);
INSERT INTO `d_detail` VALUES (388, 72, 3, 50.00, 4, 1575608523, 1);
INSERT INTO `d_detail` VALUES (389, 71, 3, 46.00, 3, 1575617685, 1);
INSERT INTO `d_detail` VALUES (390, 67, 3, 46.00, 3, 1575619072, 1);
INSERT INTO `d_detail` VALUES (391, 71, 3, 46.00, 3, 1575620257, 1);
INSERT INTO `d_detail` VALUES (392, 68, 3, 36.00, 3, 1575620705, 1);
INSERT INTO `d_detail` VALUES (393, 68, 3, 36.00, 3, 1575623359, 1);
INSERT INTO `d_detail` VALUES (394, 68, 3, 36.00, 3, 1575624976, 1);
INSERT INTO `d_detail` VALUES (395, 73, 3, 0.01, 1, 1575945339, 1);
INSERT INTO `d_detail` VALUES (396, 73, 3, 100.00, 4, 1575945362, 1);
INSERT INTO `d_detail` VALUES (397, 73, 3, 220.37, 5, 1575945502, 1);
INSERT INTO `d_detail` VALUES (398, 67, 3, 11.00, 3, 1575961445, 1);
INSERT INTO `d_detail` VALUES (399, 74, 3, 220.37, 5, 1575961484, 1);
INSERT INTO `d_detail` VALUES (400, 67, 3, 11.00, 3, 1575961874, 1);
INSERT INTO `d_detail` VALUES (401, 71, 3, 11.00, 3, 1575961890, 1);
INSERT INTO `d_detail` VALUES (402, 68, 3, 10.00, 3, 1575962640, 1);
INSERT INTO `d_detail` VALUES (403, 68, 3, 10.00, 3, 1575963016, 1);
INSERT INTO `d_detail` VALUES (404, 68, 3, 10.00, 3, 1575963108, 1);
INSERT INTO `d_detail` VALUES (405, 71, 3, 11.00, 3, 1575963913, 1);
INSERT INTO `d_detail` VALUES (406, 68, 3, 10.00, 3, 1575964348, 1);
INSERT INTO `d_detail` VALUES (407, 71, 3, 11.00, 3, 1575977301, 1);
INSERT INTO `d_detail` VALUES (408, 71, 3, 11.00, 3, 1575977539, 1);
INSERT INTO `d_detail` VALUES (409, 71, 3, 11.00, 3, 1575977650, 1);
INSERT INTO `d_detail` VALUES (410, 71, 3, 11.00, 3, 1575978962, 1);
INSERT INTO `d_detail` VALUES (411, 71, 3, 11.00, 3, 1575979004, 1);
INSERT INTO `d_detail` VALUES (412, 71, 3, 11.00, 3, 1575979039, 1);
INSERT INTO `d_detail` VALUES (413, 71, 3, 11.00, 3, 1575979212, 1);
INSERT INTO `d_detail` VALUES (414, 71, 3, 11.00, 3, 1575982352, 1);
INSERT INTO `d_detail` VALUES (415, 71, 3, 11.00, 3, 1575982406, 1);
INSERT INTO `d_detail` VALUES (416, 71, 3, 11.00, 3, 1575982646, 1);
INSERT INTO `d_detail` VALUES (417, 71, 3, 11.00, 3, 1575985866, 1);
INSERT INTO `d_detail` VALUES (418, 68, 3, 10.00, 3, 1576027645, 1);
INSERT INTO `d_detail` VALUES (419, 68, 3, 10.00, 3, 1576027752, 1);
INSERT INTO `d_detail` VALUES (420, 97, 3, 11.00, 3, 1576146982, 1);
INSERT INTO `d_detail` VALUES (421, 97, 3, 11.00, 3, 1576148167, 1);
INSERT INTO `d_detail` VALUES (422, 67, 3, 11.00, 3, 1576213893, 1);
INSERT INTO `d_detail` VALUES (423, 97, 3, 220.37, 5, 1576305010, 1);
INSERT INTO `d_detail` VALUES (424, 97, 3, 220.37, 5, 1576306002, 1);
INSERT INTO `d_detail` VALUES (425, 97, 3, 220.37, 5, 1576306011, 1);
INSERT INTO `d_detail` VALUES (426, 97, 3, 220.37, 5, 1576306229, 1);
INSERT INTO `d_detail` VALUES (427, 97, 3, 220.37, 5, 1576306327, 1);
INSERT INTO `d_detail` VALUES (428, 102, 3, 220.37, 5, 1576334206, 1);
INSERT INTO `d_detail` VALUES (429, 102, 3, 220.37, 5, 1576334505, 1);
INSERT INTO `d_detail` VALUES (430, 104, 3, 220.37, 5, 1576375284, 1);
INSERT INTO `d_detail` VALUES (431, 95, 3, 220.37, 5, 1576376260, 1);
INSERT INTO `d_detail` VALUES (432, 104, 3, 2.00, 3, 1576380621, 1);
INSERT INTO `d_detail` VALUES (433, 104, 3, 10.00, 4, 1576382663, 1);
INSERT INTO `d_detail` VALUES (434, 104, 3, 2.00, 3, 1576382768, 1);
INSERT INTO `d_detail` VALUES (435, 104, 3, 3.90, 5, 1576383495, 1);
INSERT INTO `d_detail` VALUES (436, 104, 3, 9.90, 5, 1576383518, 1);
INSERT INTO `d_detail` VALUES (437, 95, 3, 2.00, 3, 1576383582, 1);
INSERT INTO `d_detail` VALUES (438, 104, 3, 2.00, 3, 1576383658, 1);
INSERT INTO `d_detail` VALUES (439, 95, 3, 2.00, 3, 1576384220, 1);
INSERT INTO `d_detail` VALUES (440, 104, 3, 2.00, 3, 1576386334, 1);
INSERT INTO `d_detail` VALUES (441, 101, 3, 3.90, 5, 1576388246, 1);
INSERT INTO `d_detail` VALUES (442, 101, 3, 2.00, 3, 1576388371, 1);
INSERT INTO `d_detail` VALUES (443, 95, 3, 2.00, 3, 1576388582, 1);
INSERT INTO `d_detail` VALUES (444, 70, 3, 3.90, 5, 1576392153, 1);
INSERT INTO `d_detail` VALUES (445, 102, 3, 10.00, 4, 1576396353, 1);
INSERT INTO `d_detail` VALUES (446, 102, 3, 10.00, 4, 1576396514, 1);
INSERT INTO `d_detail` VALUES (447, 102, 0, 2.00, 3, 1576396517, 1);
INSERT INTO `d_detail` VALUES (448, 102, 3, 20.00, 4, 1576397291, 1);
INSERT INTO `d_detail` VALUES (449, 102, 3, 20.00, 4, 1576397498, 1);
INSERT INTO `d_detail` VALUES (450, 102, 3, 20.00, 4, 1576398290, 1);
INSERT INTO `d_detail` VALUES (451, 102, 3, 20.00, 4, 1576398444, 1);
INSERT INTO `d_detail` VALUES (452, 105, 3, 0.01, 5, 1576398891, 1);
INSERT INTO `d_detail` VALUES (453, 105, 3, 10.00, 4, 1576398965, 1);
INSERT INTO `d_detail` VALUES (454, 105, 3, 10.00, 4, 1576399157, 1);
INSERT INTO `d_detail` VALUES (455, 105, 0, 12.00, 3, 1576399242, 1);
INSERT INTO `d_detail` VALUES (456, 105, 3, 20.00, 4, 1576399361, 1);
INSERT INTO `d_detail` VALUES (457, 105, 0, 12.00, 3, 1576399374, 1);
INSERT INTO `d_detail` VALUES (458, 105, 3, 20.00, 4, 1576399677, 1);
INSERT INTO `d_detail` VALUES (459, 102, 3, 20.00, 4, 1576400632, 1);
INSERT INTO `d_detail` VALUES (460, 102, 0, 12.00, 3, 1576400763, 1);
INSERT INTO `d_detail` VALUES (461, 105, 3, 20.00, 4, 1576400765, 1);
INSERT INTO `d_detail` VALUES (462, 105, 0, 12.00, 3, 1576400776, 1);
INSERT INTO `d_detail` VALUES (463, 102, 3, 20.00, 4, 1576401000, 1);
INSERT INTO `d_detail` VALUES (464, 102, 0, 12.00, 3, 1576401011, 1);
INSERT INTO `d_detail` VALUES (465, 104, 3, 20.00, 4, 1576401200, 1);
INSERT INTO `d_detail` VALUES (466, 104, 3, 20.00, 4, 1576401235, 1);
INSERT INTO `d_detail` VALUES (467, 104, 3, 20.00, 4, 1576401277, 1);
INSERT INTO `d_detail` VALUES (468, 104, 0, 12.00, 3, 1576401286, 1);
INSERT INTO `d_detail` VALUES (469, 104, 3, 20.00, 4, 1576401342, 1);
INSERT INTO `d_detail` VALUES (470, 104, 3, 20.00, 4, 1576401365, 1);
INSERT INTO `d_detail` VALUES (471, 104, 3, 20.00, 4, 1576401389, 1);
INSERT INTO `d_detail` VALUES (472, 101, 3, 10.00, 4, 1576401546, 1);
INSERT INTO `d_detail` VALUES (473, 101, 3, 10.00, 4, 1576401567, 1);
INSERT INTO `d_detail` VALUES (474, 104, 3, 20.00, 4, 1576402188, 1);
INSERT INTO `d_detail` VALUES (475, 104, 0, 12.00, 3, 1576402233, 1);
INSERT INTO `d_detail` VALUES (476, 104, 0, 12.00, 3, 1576402783, 1);
INSERT INTO `d_detail` VALUES (477, 104, 0, 12.00, 3, 1576403387, 1);
INSERT INTO `d_detail` VALUES (478, 104, 0, 12.00, 3, 1576403548, 1);
INSERT INTO `d_detail` VALUES (479, 104, 3, 20.00, 4, 1576403672, 1);
INSERT INTO `d_detail` VALUES (480, 104, 0, 12.00, 3, 1576403724, 1);
INSERT INTO `d_detail` VALUES (481, 104, 0, 12.00, 3, 1576403786, 1);
INSERT INTO `d_detail` VALUES (482, 104, 0, 12.00, 3, 1576404004, 1);
INSERT INTO `d_detail` VALUES (483, 104, 0, 12.00, 3, 1576404079, 1);
INSERT INTO `d_detail` VALUES (484, 104, 0, 12.00, 3, 1576404226, 1);
INSERT INTO `d_detail` VALUES (485, 104, 3, 20.00, 4, 1576404360, 1);
INSERT INTO `d_detail` VALUES (486, 104, 0, 12.00, 3, 1576404370, 1);
INSERT INTO `d_detail` VALUES (487, 105, 3, 20.00, 4, 1576404620, 1);
INSERT INTO `d_detail` VALUES (488, 105, 0, 12.00, 3, 1576404629, 1);
INSERT INTO `d_detail` VALUES (489, 95, 3, 10.00, 4, 1576404641, 1);
INSERT INTO `d_detail` VALUES (490, 95, 3, 10.00, 4, 1576404677, 1);
INSERT INTO `d_detail` VALUES (491, 95, 0, 12.00, 3, 1576404685, 1);
INSERT INTO `d_detail` VALUES (492, 95, 3, 20.00, 4, 1576404851, 1);
INSERT INTO `d_detail` VALUES (493, 95, 0, 12.00, 3, 1576404884, 1);
INSERT INTO `d_detail` VALUES (494, 104, 3, 0.01, 5, 1576425819, 1);
INSERT INTO `d_detail` VALUES (495, 104, 3, 20.00, 4, 1576458912, 1);
INSERT INTO `d_detail` VALUES (496, 104, 21, 12.00, 3, 1576458921, 1);
INSERT INTO `d_detail` VALUES (497, 104, 23, 12.00, 3, 1576461341, 1);
INSERT INTO `d_detail` VALUES (498, 100, 3, 0.01, 5, 1576461613, 1);
INSERT INTO `d_detail` VALUES (499, 100, 3, 10.00, 4, 1576461668, 1);
INSERT INTO `d_detail` VALUES (500, 100, 3, 20.00, 4, 1576461824, 1);
INSERT INTO `d_detail` VALUES (501, 100, 3, 10.00, 4, 1576462669, 1);
INSERT INTO `d_detail` VALUES (502, 100, 3, 10.00, 4, 1576464341, 1);
INSERT INTO `d_detail` VALUES (503, 100, 3, 10.00, 4, 1576464443, 1);
INSERT INTO `d_detail` VALUES (504, 104, 3, 20.00, 4, 1576465675, 1);
INSERT INTO `d_detail` VALUES (505, 95, 23, 12.00, 3, 1576466081, 1);
INSERT INTO `d_detail` VALUES (506, 104, 23, 12.00, 3, 1576466106, 1);
INSERT INTO `d_detail` VALUES (507, 104, 21, 12.00, 3, 1576470905, 1);
INSERT INTO `d_detail` VALUES (508, 104, 3, 20.00, 4, 1576471062, 1);
INSERT INTO `d_detail` VALUES (509, 104, 21, 12.00, 3, 1576471072, 1);
INSERT INTO `d_detail` VALUES (510, 104, 3, 20.00, 4, 1576471412, 1);
INSERT INTO `d_detail` VALUES (511, 104, 21, 12.00, 3, 1576471421, 1);
INSERT INTO `d_detail` VALUES (512, 104, 21, 12.00, 3, 1576471991, 1);
INSERT INTO `d_detail` VALUES (513, 104, 3, 20.00, 4, 1576472142, 1);
INSERT INTO `d_detail` VALUES (514, 104, 21, 12.00, 3, 1576472152, 1);
INSERT INTO `d_detail` VALUES (515, 104, 21, 12.00, 3, 1576472346, 1);
INSERT INTO `d_detail` VALUES (516, 104, 3, 20.00, 4, 1576472759, 1);
INSERT INTO `d_detail` VALUES (517, 104, 21, 12.00, 3, 1576472769, 1);
INSERT INTO `d_detail` VALUES (518, 104, 3, 20.00, 4, 1576473034, 1);
INSERT INTO `d_detail` VALUES (519, 104, 21, 12.00, 3, 1576473063, 1);
INSERT INTO `d_detail` VALUES (520, 104, 21, 12.00, 3, 1576477008, 1);
INSERT INTO `d_detail` VALUES (521, 104, 3, 20.00, 4, 1576477098, 1);
INSERT INTO `d_detail` VALUES (522, 104, 21, 12.00, 3, 1576477108, 1);
INSERT INTO `d_detail` VALUES (523, 104, 21, 12.00, 3, 1576477412, 1);
INSERT INTO `d_detail` VALUES (524, 69, 3, 0.01, 5, 1576477432, 1);
INSERT INTO `d_detail` VALUES (525, 69, 3, 20.00, 4, 1576478838, 1);
INSERT INTO `d_detail` VALUES (526, 69, 21, 12.30, 3, 1576478867, 1);
INSERT INTO `d_detail` VALUES (527, 95, 3, 20.00, 4, 1576480029, 1);
INSERT INTO `d_detail` VALUES (528, 95, 23, 12.00, 3, 1576480071, 1);
INSERT INTO `d_detail` VALUES (529, 69, 3, 20.00, 4, 1576481231, 1);
INSERT INTO `d_detail` VALUES (530, 69, 21, 13.90, 3, 1576481250, 1);
INSERT INTO `d_detail` VALUES (531, 69, 21, 12.00, 3, 1576482232, 1);
INSERT INTO `d_detail` VALUES (532, 69, 3, 20.00, 4, 1576483783, 1);
INSERT INTO `d_detail` VALUES (533, 69, 21, 12.00, 3, 1576483794, 1);
INSERT INTO `d_detail` VALUES (534, 69, 3, 20.00, 4, 1576484042, 1);
INSERT INTO `d_detail` VALUES (535, 69, 21, 12.00, 3, 1576484051, 1);
INSERT INTO `d_detail` VALUES (536, 102, 23, 12.00, 3, 1576484941, 1);
INSERT INTO `d_detail` VALUES (537, 95, 23, 12.00, 3, 1576486140, 1);
INSERT INTO `d_detail` VALUES (538, 69, 21, 12.00, 3, 1576486268, 1);
INSERT INTO `d_detail` VALUES (539, 95, 3, 20.00, 4, 1576487223, 1);
INSERT INTO `d_detail` VALUES (540, 95, 23, 12.00, 3, 1576487233, 1);
INSERT INTO `d_detail` VALUES (541, 69, 3, 20.00, 4, 1576487437, 1);
INSERT INTO `d_detail` VALUES (542, 69, 21, 12.00, 3, 1576487446, 1);
INSERT INTO `d_detail` VALUES (543, 83, 3, 0.01, 5, 1576493908, 1);
INSERT INTO `d_detail` VALUES (544, 105, 3, 20.00, 4, 1576495912, 1);
INSERT INTO `d_detail` VALUES (545, 105, 21, 12.00, 3, 1576495927, 1);
INSERT INTO `d_detail` VALUES (546, 105, 21, 12.00, 3, 1576496441, 1);
INSERT INTO `d_detail` VALUES (547, 69, 21, 12.00, 3, 1576502417, 1);
INSERT INTO `d_detail` VALUES (548, 69, 3, 20.00, 4, 1576502458, 1);
INSERT INTO `d_detail` VALUES (549, 69, 21, 18.60, 3, 1576502468, 1);
INSERT INTO `d_detail` VALUES (550, 69, 3, 20.00, 4, 1576504292, 1);
INSERT INTO `d_detail` VALUES (551, 69, 21, 12.00, 3, 1576504302, 1);
INSERT INTO `d_detail` VALUES (552, 69, 3, 20.00, 4, 1576504415, 1);
INSERT INTO `d_detail` VALUES (553, 69, 21, 12.00, 3, 1576505518, 1);
INSERT INTO `d_detail` VALUES (554, 69, 21, 12.10, 3, 1576506803, 1);
INSERT INTO `d_detail` VALUES (555, 69, 3, 20.00, 4, 1576507525, 1);
INSERT INTO `d_detail` VALUES (556, 69, 21, 12.00, 3, 1576507575, 1);
INSERT INTO `d_detail` VALUES (557, 69, 21, 12.00, 3, 1576508176, 1);
INSERT INTO `d_detail` VALUES (558, 104, 3, 20.00, 4, 1576511099, 1);
INSERT INTO `d_detail` VALUES (559, 104, 21, 12.00, 3, 1576511119, 1);
INSERT INTO `d_detail` VALUES (560, 87, 3, 0.01, 5, 1576548133, 1);
INSERT INTO `d_detail` VALUES (561, 102, 21, 12.00, 3, 1576552276, 1);
INSERT INTO `d_detail` VALUES (562, 100, 21, 12.00, 3, 1576554726, 1);
INSERT INTO `d_detail` VALUES (563, 87, 3, 20.00, 4, 1576554803, 1);
INSERT INTO `d_detail` VALUES (564, 87, 21, 12.00, 3, 1576554814, 1);
INSERT INTO `d_detail` VALUES (565, 87, 3, 20.00, 4, 1576555778, 1);
INSERT INTO `d_detail` VALUES (566, 87, 21, 12.00, 3, 1576555788, 1);
INSERT INTO `d_detail` VALUES (567, 69, 3, 20.00, 4, 1576556711, 1);
INSERT INTO `d_detail` VALUES (568, 69, 21, 12.00, 3, 1576556720, 1);
INSERT INTO `d_detail` VALUES (569, 87, 21, 12.00, 3, 1576558708, 1);
INSERT INTO `d_detail` VALUES (570, 70, 3, 0.01, 5, 1576559198, 1);
INSERT INTO `d_detail` VALUES (571, 70, 3, 10.00, 4, 1576559219, 1);
INSERT INTO `d_detail` VALUES (572, 106, 3, 0.01, 5, 1576559636, 1);
INSERT INTO `d_detail` VALUES (573, 105, 3, 20.00, 4, 1576569693, 1);
INSERT INTO `d_detail` VALUES (574, 105, 22, 12.00, 3, 1576569707, 1);
INSERT INTO `d_detail` VALUES (575, 105, 22, 12.00, 3, 1576571358, 1);
INSERT INTO `d_detail` VALUES (576, 105, 3, 20.00, 4, 1576571726, 1);
INSERT INTO `d_detail` VALUES (577, 105, 22, 12.00, 3, 1576571740, 1);
INSERT INTO `d_detail` VALUES (578, 105, 3, 20.00, 4, 1576572368, 1);
INSERT INTO `d_detail` VALUES (579, 105, 22, 12.00, 3, 1576572379, 1);
INSERT INTO `d_detail` VALUES (580, 105, 22, 12.00, 3, 1576572457, 1);
INSERT INTO `d_detail` VALUES (581, 104, 3, 20.00, 4, 1576572867, 1);
INSERT INTO `d_detail` VALUES (582, 87, 3, 20.00, 4, 1576572872, 1);
INSERT INTO `d_detail` VALUES (583, 104, 22, 12.00, 3, 1576572878, 1);
INSERT INTO `d_detail` VALUES (584, 87, 21, 12.00, 3, 1576572882, 1);
INSERT INTO `d_detail` VALUES (585, 104, 22, 12.00, 3, 1576573160, 1);
INSERT INTO `d_detail` VALUES (586, 104, 3, 20.00, 4, 1576573444, 1);
INSERT INTO `d_detail` VALUES (587, 104, 22, 12.00, 3, 1576574215, 1);
INSERT INTO `d_detail` VALUES (588, 87, 21, 12.00, 3, 1576574296, 1);
INSERT INTO `d_detail` VALUES (589, 87, 3, 20.00, 4, 1576574894, 1);
INSERT INTO `d_detail` VALUES (590, 87, 21, 12.00, 3, 1576574905, 1);
INSERT INTO `d_detail` VALUES (591, 87, 3, 20.00, 4, 1576575055, 1);
INSERT INTO `d_detail` VALUES (592, 87, 21, 12.00, 3, 1576575069, 1);
INSERT INTO `d_detail` VALUES (593, 100, 21, 12.00, 3, 1576578037, 1);
INSERT INTO `d_detail` VALUES (594, 95, 3, 20.00, 4, 1576632368, 1);
INSERT INTO `d_detail` VALUES (595, 95, 22, 12.00, 3, 1576632381, 1);
INSERT INTO `d_detail` VALUES (596, 104, 22, 12.00, 3, 1576650642, 1);
INSERT INTO `d_detail` VALUES (597, 105, 3, 20.00, 4, 1576650655, 1);
INSERT INTO `d_detail` VALUES (598, 105, 22, 12.00, 3, 1576650667, 1);
INSERT INTO `d_detail` VALUES (599, 105, 21, 12.00, 3, 1576651012, 1);
INSERT INTO `d_detail` VALUES (600, 95, 22, 12.00, 3, 1576651037, 1);
INSERT INTO `d_detail` VALUES (601, 101, 21, 12.00, 3, 1576651258, 1);
INSERT INTO `d_detail` VALUES (602, 69, 3, 20.00, 4, 1576651597, 1);
INSERT INTO `d_detail` VALUES (603, 101, 21, 2.00, 3, 1576651687, 1);
INSERT INTO `d_detail` VALUES (604, 101, 3, 20.00, 4, 1576651778, 1);
INSERT INTO `d_detail` VALUES (605, 101, 21, 12.00, 3, 1576651788, 1);
INSERT INTO `d_detail` VALUES (606, 101, 21, 12.00, 3, 1576651920, 1);
INSERT INTO `d_detail` VALUES (607, 104, 3, 20.00, 4, 1576651998, 1);
INSERT INTO `d_detail` VALUES (608, 104, 22, 12.00, 3, 1576652009, 1);
INSERT INTO `d_detail` VALUES (609, 101, 3, 20.00, 4, 1576652020, 1);
INSERT INTO `d_detail` VALUES (610, 101, 21, 12.00, 3, 1576652030, 1);
INSERT INTO `d_detail` VALUES (611, 95, 3, 20.00, 4, 1576654101, 1);
INSERT INTO `d_detail` VALUES (612, 95, 22, 12.80, 3, 1576654111, 1);
INSERT INTO `d_detail` VALUES (613, 95, 3, 20.00, 4, 1576655140, 1);
INSERT INTO `d_detail` VALUES (614, 95, 22, 12.00, 3, 1576655152, 1);
INSERT INTO `d_detail` VALUES (615, 95, 22, 12.00, 3, 1576655393, 1);
INSERT INTO `d_detail` VALUES (616, 69, 21, 12.00, 3, 1576656761, 1);
INSERT INTO `d_detail` VALUES (617, 69, 22, 12.60, 3, 1576658566, 1);
INSERT INTO `d_detail` VALUES (618, 69, 3, 20.00, 4, 1576661134, 1);
INSERT INTO `d_detail` VALUES (619, 69, 21, 13.80, 3, 1576661145, 1);
INSERT INTO `d_detail` VALUES (620, 69, 3, 20.00, 4, 1576663233, 1);
INSERT INTO `d_detail` VALUES (621, 69, 21, 13.30, 3, 1576663244, 1);
INSERT INTO `d_detail` VALUES (622, 69, 21, 12.00, 3, 1576664289, 1);
INSERT INTO `d_detail` VALUES (623, 95, 3, 20.00, 4, 1576664509, 1);
INSERT INTO `d_detail` VALUES (624, 95, 22, 12.00, 3, 1576664519, 1);
INSERT INTO `d_detail` VALUES (625, 110, 3, 0.01, 5, 1576711784, 1);
INSERT INTO `d_detail` VALUES (626, 111, 3, 0.01, 5, 1576714605, 1);
INSERT INTO `d_detail` VALUES (627, 108, 3, 0.01, 5, 1576718851, 1);
INSERT INTO `d_detail` VALUES (628, 109, 3, 20.00, 4, 1576721706, 1);
INSERT INTO `d_detail` VALUES (629, 109, 44, 12.00, 3, 1576721719, 1);
INSERT INTO `d_detail` VALUES (630, 110, 3, 100.00, 4, 1576726770, 1);
INSERT INTO `d_detail` VALUES (631, 110, 44, 12.00, 3, 1576726780, 1);
INSERT INTO `d_detail` VALUES (632, 110, 44, 12.00, 3, 1576727622, 1);
INSERT INTO `d_detail` VALUES (633, 110, 44, 2.00, 3, 1576727639, 1);
INSERT INTO `d_detail` VALUES (634, 110, 44, 12.00, 3, 1576727778, 1);
INSERT INTO `d_detail` VALUES (635, 110, 45, 11.10, 3, 1576741054, 1);
INSERT INTO `d_detail` VALUES (636, 110, 45, 11.00, 3, 1576741143, 1);
INSERT INTO `d_detail` VALUES (637, 110, 45, 11.00, 3, 1576742027, 1);
INSERT INTO `d_detail` VALUES (638, 112, 3, 0.01, 5, 1576742214, 1);
INSERT INTO `d_detail` VALUES (639, 112, 3, 100.00, 4, 1576742391, 1);
INSERT INTO `d_detail` VALUES (640, 112, 45, 1.00, 3, 1576742402, 1);
INSERT INTO `d_detail` VALUES (641, 112, 45, 2.80, 3, 1576744692, 1);
INSERT INTO `d_detail` VALUES (642, 112, 45, 11.00, 3, 1576745083, 1);
INSERT INTO `d_detail` VALUES (643, 112, 45, 11.00, 3, 1576745547, 1);

-- ----------------------------
-- Table structure for d_invited
-- ----------------------------
DROP TABLE IF EXISTS `d_invited`;
CREATE TABLE `d_invited`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `invited_id` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '被邀请人的电话',
  `addtime` int(11) NOT NULL DEFAULT 0 COMMENT '被邀请的时间',
  `is_success` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0邀请中 1成功  2失败',
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0有效期  1邀请作废',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '邀请表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for d_join
-- ----------------------------
DROP TABLE IF EXISTS `d_join`;
CREATE TABLE `d_join`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '电话',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '计划加盟城市',
  `user_obj` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户对象',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '申请加盟备注',
  `addtime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '申请时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '加盟表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for d_log
-- ----------------------------
DROP TABLE IF EXISTS `d_log`;
CREATE TABLE `d_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `IMEI` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车子的IMEI编号',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '参数信息',
  `order_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单ID',
  `msg` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '错误信息',
  `time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '错误时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 737 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '车子MQTT 交互的错误信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_log
-- ----------------------------
INSERT INTO `d_log` VALUES (502, '1000000015', '{\"type\":\"proceed\",\"id\":\"1000000015\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576043868);
INSERT INTO `d_log` VALUES (503, '1000000015', '{\"type\":\"proceed\",\"id\":\"1000000015\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576052952);
INSERT INTO `d_log` VALUES (504, '1000000015', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000015\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576055082);
INSERT INTO `d_log` VALUES (505, '1000000015', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000015\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576055083);
INSERT INTO `d_log` VALUES (506, '1000000012', '{\"type\":\"start\",\"id\":\"1000000012\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576153098);
INSERT INTO `d_log` VALUES (507, '1000000012', '{\"type\":\"start\",\"id\":\"1000000012\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576153203);
INSERT INTO `d_log` VALUES (508, '1000000012', '{\"type\":\"start\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576215784);
INSERT INTO `d_log` VALUES (509, '1000000012', '{\"type\":\"start\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576215786);
INSERT INTO `d_log` VALUES (510, '1000000015', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000015\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576290457);
INSERT INTO `d_log` VALUES (511, '1000000015', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000015\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576290523);
INSERT INTO `d_log` VALUES (512, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576307361);
INSERT INTO `d_log` VALUES (513, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576313745);
INSERT INTO `d_log` VALUES (514, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576314002);
INSERT INTO `d_log` VALUES (515, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576314082);
INSERT INTO `d_log` VALUES (516, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576314110);
INSERT INTO `d_log` VALUES (517, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576314197);
INSERT INTO `d_log` VALUES (518, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576314247);
INSERT INTO `d_log` VALUES (519, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576314328);
INSERT INTO `d_log` VALUES (520, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576314382);
INSERT INTO `d_log` VALUES (521, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576314399);
INSERT INTO `d_log` VALUES (522, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576314414);
INSERT INTO `d_log` VALUES (523, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576314445);
INSERT INTO `d_log` VALUES (524, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576314581);
INSERT INTO `d_log` VALUES (525, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576314655);
INSERT INTO `d_log` VALUES (526, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576314655);
INSERT INTO `d_log` VALUES (527, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576314727);
INSERT INTO `d_log` VALUES (528, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576314853);
INSERT INTO `d_log` VALUES (529, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576314897);
INSERT INTO `d_log` VALUES (530, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576314944);
INSERT INTO `d_log` VALUES (531, '1000000003', '{\"type\":\"start\",\"id\":\"1000000003\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576315575);
INSERT INTO `d_log` VALUES (532, '1000000003', '{\"type\":\"start\",\"id\":\"1000000003\",\"pass\":\"gprs\",\"res\":\"0\"}', 703, '车子信息更改失败', 1576316725);
INSERT INTO `d_log` VALUES (533, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576316744);
INSERT INTO `d_log` VALUES (534, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576316768);
INSERT INTO `d_log` VALUES (535, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576316787);
INSERT INTO `d_log` VALUES (536, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576316830);
INSERT INTO `d_log` VALUES (537, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576316883);
INSERT INTO `d_log` VALUES (538, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576317261);
INSERT INTO `d_log` VALUES (539, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576317429);
INSERT INTO `d_log` VALUES (540, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576317574);
INSERT INTO `d_log` VALUES (541, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576317664);
INSERT INTO `d_log` VALUES (542, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576317752);
INSERT INTO `d_log` VALUES (543, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576318200);
INSERT INTO `d_log` VALUES (544, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576321932);
INSERT INTO `d_log` VALUES (545, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576322064);
INSERT INTO `d_log` VALUES (546, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576322109);
INSERT INTO `d_log` VALUES (547, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576322119);
INSERT INTO `d_log` VALUES (548, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576322140);
INSERT INTO `d_log` VALUES (549, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576322143);
INSERT INTO `d_log` VALUES (550, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576322162);
INSERT INTO `d_log` VALUES (551, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576322177);
INSERT INTO `d_log` VALUES (552, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576322203);
INSERT INTO `d_log` VALUES (553, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576322212);
INSERT INTO `d_log` VALUES (554, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576322238);
INSERT INTO `d_log` VALUES (555, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576322250);
INSERT INTO `d_log` VALUES (556, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576322271);
INSERT INTO `d_log` VALUES (557, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576322276);
INSERT INTO `d_log` VALUES (558, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576322288);
INSERT INTO `d_log` VALUES (559, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576322301);
INSERT INTO `d_log` VALUES (560, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576322319);
INSERT INTO `d_log` VALUES (561, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576322360);
INSERT INTO `d_log` VALUES (562, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576322385);
INSERT INTO `d_log` VALUES (563, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576322394);
INSERT INTO `d_log` VALUES (564, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576322483);
INSERT INTO `d_log` VALUES (565, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576327314);
INSERT INTO `d_log` VALUES (566, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576327344);
INSERT INTO `d_log` VALUES (567, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576327363);
INSERT INTO `d_log` VALUES (568, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576327368);
INSERT INTO `d_log` VALUES (569, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576327375);
INSERT INTO `d_log` VALUES (570, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576327632);
INSERT INTO `d_log` VALUES (571, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576327831);
INSERT INTO `d_log` VALUES (572, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576327866);
INSERT INTO `d_log` VALUES (573, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576327901);
INSERT INTO `d_log` VALUES (574, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576327930);
INSERT INTO `d_log` VALUES (575, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576329115);
INSERT INTO `d_log` VALUES (576, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576329141);
INSERT INTO `d_log` VALUES (577, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576329148);
INSERT INTO `d_log` VALUES (578, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576329161);
INSERT INTO `d_log` VALUES (579, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576329194);
INSERT INTO `d_log` VALUES (580, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576329219);
INSERT INTO `d_log` VALUES (581, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576329230);
INSERT INTO `d_log` VALUES (582, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576329244);
INSERT INTO `d_log` VALUES (583, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576329254);
INSERT INTO `d_log` VALUES (584, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576329306);
INSERT INTO `d_log` VALUES (585, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576329364);
INSERT INTO `d_log` VALUES (586, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576329423);
INSERT INTO `d_log` VALUES (587, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576330213);
INSERT INTO `d_log` VALUES (588, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576330422);
INSERT INTO `d_log` VALUES (589, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576330434);
INSERT INTO `d_log` VALUES (590, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576330456);
INSERT INTO `d_log` VALUES (591, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576330473);
INSERT INTO `d_log` VALUES (592, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576330492);
INSERT INTO `d_log` VALUES (593, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576330521);
INSERT INTO `d_log` VALUES (594, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576330526);
INSERT INTO `d_log` VALUES (595, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576330532);
INSERT INTO `d_log` VALUES (596, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576330557);
INSERT INTO `d_log` VALUES (597, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576330565);
INSERT INTO `d_log` VALUES (598, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576331331);
INSERT INTO `d_log` VALUES (599, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576375378);
INSERT INTO `d_log` VALUES (600, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576375414);
INSERT INTO `d_log` VALUES (601, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576375421);
INSERT INTO `d_log` VALUES (602, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576375429);
INSERT INTO `d_log` VALUES (603, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576376318);
INSERT INTO `d_log` VALUES (604, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576376447);
INSERT INTO `d_log` VALUES (605, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576377647);
INSERT INTO `d_log` VALUES (606, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576379687);
INSERT INTO `d_log` VALUES (607, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576396885);
INSERT INTO `d_log` VALUES (608, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576396899);
INSERT INTO `d_log` VALUES (609, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576396904);
INSERT INTO `d_log` VALUES (610, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576396911);
INSERT INTO `d_log` VALUES (611, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576396935);
INSERT INTO `d_log` VALUES (612, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576396992);
INSERT INTO `d_log` VALUES (613, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576397004);
INSERT INTO `d_log` VALUES (614, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576397020);
INSERT INTO `d_log` VALUES (615, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576397029);
INSERT INTO `d_log` VALUES (616, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576397041);
INSERT INTO `d_log` VALUES (617, '1000000003', '{\"type\":\"proceed\",\"id\":\"1000000003\",\"pass\":\"gprs\",\"res\":\"0\"}', 751, '车子信息更改失败', 1576402629);
INSERT INTO `d_log` VALUES (618, '1000000003', '{\"type\":\"proceed\",\"id\":\"1000000003\",\"pass\":\"gprs\",\"res\":\"0\"}', 751, '车子信息更改失败', 1576402631);
INSERT INTO `d_log` VALUES (619, '1000000003', '{\"type\":\"proceed\",\"id\":\"1000000003\",\"pass\":\"gprs\",\"res\":\"0\"}', 751, '车子信息更改失败', 1576402645);
INSERT INTO `d_log` VALUES (620, '1000000003', '{\"type\":\"proceed\",\"id\":\"1000000003\",\"pass\":\"gprs\",\"res\":\"0\"}', 751, '车子信息更改失败', 1576402724);
INSERT INTO `d_log` VALUES (621, '1000000003', '{\"type\":\"proceed\",\"id\":\"1000000003\",\"pass\":\"gprs\",\"res\":\"0\"}', 751, '车子信息更改失败', 1576402725);
INSERT INTO `d_log` VALUES (622, '1000000003', '{\"type\":\"proceed\",\"id\":\"1000000003\",\"pass\":\"gprs\",\"res\":\"0\"}', 751, '车子信息更改失败', 1576402816);
INSERT INTO `d_log` VALUES (623, '1000000012', '{\"type\":\"start\",\"id\":\"1000000012\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576431746);
INSERT INTO `d_log` VALUES (624, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"mileage\":\"1.23\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576431891);
INSERT INTO `d_log` VALUES (625, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"mileage\":\"1.23\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576431891);
INSERT INTO `d_log` VALUES (626, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"mileage\":\"1.23\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576431909);
INSERT INTO `d_log` VALUES (627, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"mileage\":\"1.23\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576431921);
INSERT INTO `d_log` VALUES (628, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"mileage\":\"1.23\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576431993);
INSERT INTO `d_log` VALUES (629, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"mileage\":\"1.23\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576432001);
INSERT INTO `d_log` VALUES (630, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"mileage\":\"1.23\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576432038);
INSERT INTO `d_log` VALUES (631, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576432381);
INSERT INTO `d_log` VALUES (632, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576432386);
INSERT INTO `d_log` VALUES (633, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576432406);
INSERT INTO `d_log` VALUES (634, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576432431);
INSERT INTO `d_log` VALUES (635, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576432494);
INSERT INTO `d_log` VALUES (636, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576432500);
INSERT INTO `d_log` VALUES (637, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576432504);
INSERT INTO `d_log` VALUES (638, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576432512);
INSERT INTO `d_log` VALUES (639, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576432702);
INSERT INTO `d_log` VALUES (640, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576432716);
INSERT INTO `d_log` VALUES (641, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576432794);
INSERT INTO `d_log` VALUES (642, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576432871);
INSERT INTO `d_log` VALUES (643, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576432979);
INSERT INTO `d_log` VALUES (644, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576433285);
INSERT INTO `d_log` VALUES (645, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576433290);
INSERT INTO `d_log` VALUES (646, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"mileage\":\"1.23\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576443979);
INSERT INTO `d_log` VALUES (647, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"mileage\":\"1.23\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576444060);
INSERT INTO `d_log` VALUES (648, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576451146);
INSERT INTO `d_log` VALUES (649, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576451171);
INSERT INTO `d_log` VALUES (650, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576451217);
INSERT INTO `d_log` VALUES (651, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576451293);
INSERT INTO `d_log` VALUES (652, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576451420);
INSERT INTO `d_log` VALUES (653, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576451441);
INSERT INTO `d_log` VALUES (654, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576451482);
INSERT INTO `d_log` VALUES (655, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576451508);
INSERT INTO `d_log` VALUES (656, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576451537);
INSERT INTO `d_log` VALUES (657, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576451728);
INSERT INTO `d_log` VALUES (658, '1000000012', '{\"type\":\"proceed\",\"id\":\"1000000012\",\"pass\":\"gprs\",\"res\":\"0\"}', 768, '车子信息更改失败', 1576481348);
INSERT INTO `d_log` VALUES (659, '1000000012', '{\"type\":\"start\",\"id\":\"1000000012\",\"pass\":\"gprs\",\"res\":\"0\"}', 808, '车子信息更改失败', 1576495582);
INSERT INTO `d_log` VALUES (660, '1000000012', '{\"type\":\"start\",\"id\":\"1000000012\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576495958);
INSERT INTO `d_log` VALUES (661, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"mileage\":\"0,0\",\"res\":\"0\"}', 0, '上锁回调失败', 1576496405);
INSERT INTO `d_log` VALUES (662, '1000000012', '{\"type\":\"start\",\"id\":\"1000000012\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576497354);
INSERT INTO `d_log` VALUES (663, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"mileage\":\"0,0\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576508563);
INSERT INTO `d_log` VALUES (664, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576552145);
INSERT INTO `d_log` VALUES (665, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576552176);
INSERT INTO `d_log` VALUES (666, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576552994);
INSERT INTO `d_log` VALUES (667, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576553014);
INSERT INTO `d_log` VALUES (668, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576553014);
INSERT INTO `d_log` VALUES (669, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576553030);
INSERT INTO `d_log` VALUES (670, '1000000003', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000003\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576553030);
INSERT INTO `d_log` VALUES (671, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 835, '车子信息更改失败', 1576554611);
INSERT INTO `d_log` VALUES (672, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576554611);
INSERT INTO `d_log` VALUES (673, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576554884);
INSERT INTO `d_log` VALUES (674, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576554894);
INSERT INTO `d_log` VALUES (675, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576554898);
INSERT INTO `d_log` VALUES (676, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576554905);
INSERT INTO `d_log` VALUES (677, '1000000014', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000014\",\"mileage\":\"0.0\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576557965);
INSERT INTO `d_log` VALUES (685, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576561162);
INSERT INTO `d_log` VALUES (686, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '开锁错误', 1576561277);
INSERT INTO `d_log` VALUES (687, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576561419);
INSERT INTO `d_log` VALUES (688, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576561432);
INSERT INTO `d_log` VALUES (689, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576561442);
INSERT INTO `d_log` VALUES (690, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576561460);
INSERT INTO `d_log` VALUES (691, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576561465);
INSERT INTO `d_log` VALUES (692, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576561488);
INSERT INTO `d_log` VALUES (695, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 0, '订单信息查询失败', 1576562103);
INSERT INTO `d_log` VALUES (708, '1000000014', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000014\",\"mileage\":\"0.14\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576574995);
INSERT INTO `d_log` VALUES (709, '1000000014', '{\"type\":\"proceed\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 883, '车子信息更改失败', 1576577882);
INSERT INTO `d_log` VALUES (710, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 908, '车子信息更改失败', 1576650769);
INSERT INTO `d_log` VALUES (711, '1000000014', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000014\",\"mileage\":\"0.0\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576651003);
INSERT INTO `d_log` VALUES (712, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"mileage\":\"0.0\",\"res\":\"0\"}', 0, '上锁回调失败', 1576651015);
INSERT INTO `d_log` VALUES (713, '1000000014', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000014\",\"mileage\":\"0.0\",\"res\":\"0\"}', 0, '上锁回调失败', 1576651254);
INSERT INTO `d_log` VALUES (714, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 911, '车子信息更改失败', 1576651293);
INSERT INTO `d_log` VALUES (715, '1000000014', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000014\",\"mileage\":\"0.0\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576651320);
INSERT INTO `d_log` VALUES (716, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 912, '车子信息更改失败', 1576651565);
INSERT INTO `d_log` VALUES (717, '1000000014', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000014\",\"mileage\":\"0.0\",\"res\":\"0\"}', 0, '上锁回调失败', 1576651579);
INSERT INTO `d_log` VALUES (718, '1000000014', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000014\",\"mileage\":\"0.0\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576651674);
INSERT INTO `d_log` VALUES (719, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 914, '车子信息更改失败', 1576651741);
INSERT INTO `d_log` VALUES (720, '1000000014', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000014\",\"mileage\":\"0.0\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576651761);
INSERT INTO `d_log` VALUES (721, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 916, '车子信息更改失败', 1576651843);
INSERT INTO `d_log` VALUES (722, '1000000012', '{\"type\":\"start\",\"id\":\"1000000012\",\"pass\":\"gprs\",\"res\":\"0\"}', 915, '车子信息更改失败', 1576651844);
INSERT INTO `d_log` VALUES (723, '1000000014', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000014\",\"mileage\":\"0.0\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576651860);
INSERT INTO `d_log` VALUES (724, '1000000012', '{\"type\":\"start\",\"id\":\"1000000012\",\"pass\":\"gprs\",\"res\":\"0\"}', 920, '车子信息更改失败', 1576655199);
INSERT INTO `d_log` VALUES (725, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 921, '车子信息更改失败', 1576656395);
INSERT INTO `d_log` VALUES (726, '1000000012', '{\"type\":\"start\",\"id\":\"1000000012\",\"pass\":\"gprs\",\"res\":\"0\"}', 922, '车子信息更改失败', 1576657007);
INSERT INTO `d_log` VALUES (727, '1000000014', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000014\",\"mileage\":\"0.0\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576658796);
INSERT INTO `d_log` VALUES (728, '1000000014', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000014\",\"mileage\":\"0.0\",\"res\":\"0\"}', 0, '上锁回调失败', 1576661115);
INSERT INTO `d_log` VALUES (729, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 925, '车子信息更改失败', 1576661263);
INSERT INTO `d_log` VALUES (730, '1000000014', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000014\",\"mileage\":\"0.0\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576663214);
INSERT INTO `d_log` VALUES (731, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 926, '车子信息更改失败', 1576663314);
INSERT INTO `d_log` VALUES (732, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 933, '车子信息更改失败', 1576718870);
INSERT INTO `d_log` VALUES (733, '1000000014', '{\"type\":\"start\",\"id\":\"1000000014\",\"pass\":\"gprs\",\"res\":\"0\"}', 934, '车子信息更改失败', 1576719965);
INSERT INTO `d_log` VALUES (734, '1000000014', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000014\",\"mileage\":\"0.0\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576721614);
INSERT INTO `d_log` VALUES (735, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"mileage\":\"0.0\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576740970);
INSERT INTO `d_log` VALUES (736, '1000000012', '{\"type\":\"end\",\"pass\":\"gprs\",\"id\":\"1000000012\",\"mileage\":\"0.0\",\"res\":\"0\"}', 0, '车子订单信息查询失败', 1576740992);

-- ----------------------------
-- Table structure for d_malfunction
-- ----------------------------
DROP TABLE IF EXISTS `d_malfunction`;
CREATE TABLE `d_malfunction`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `car_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆编号',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '故障单号',
  `type` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'A' COMMENT '车子类型',
  `car_state_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '故障类型ID',
  `img` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '故障图片',
  `remarks` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `addtime` int(11) UNSIGNED DEFAULT 0 COMMENT '报修时间',
  `state` tinyint(1) NOT NULL DEFAULT 5 COMMENT '处理状态 5=未处理 1=处理中 2=已完成 3=核实完成有效  4 核实无效',
  `store_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '车子所属的代理商ID',
  `IMEI` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车子IMEI识别码',
  `coordinate` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车子的地址',
  `failure_coordinate` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '还车失败为坐标   为空的话是成功',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '具体地址',
  `landmark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '地标信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '故障报修表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_malfunction
-- ----------------------------
INSERT INTO `d_malfunction` VALUES (106, 109, '0', '61', '201912201448194884930119', 'A', '电源系统', '', '1', 1576824499, 5, 44, '1000000014', '{\"lat\":32.96257,\"lng\":114.61912}', '', '中国河南省驻马店市平舆县委(清河大道西)', '平舆县委');

-- ----------------------------
-- Table structure for d_malfunction_list
-- ----------------------------
DROP TABLE IF EXISTS `d_malfunction_list`;
CREATE TABLE `d_malfunction_list`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '故障名称  0 仪表盘  1二维码  2电器故障  3外观故障  4电源系统  5无法开锁  6刹车故障  7转把故障  8其他',
  `add_time` int(11) NOT NULL DEFAULT 0 COMMENT '故障类目写入时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '故障类目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_malfunction_list
-- ----------------------------
INSERT INTO `d_malfunction_list` VALUES (1, '电池没电', 0);
INSERT INTO `d_malfunction_list` VALUES (2, '突发事故', 0);
INSERT INTO `d_malfunction_list` VALUES (3, '车辆损坏', 0);

-- ----------------------------
-- Table structure for d_malfunction_order
-- ----------------------------
DROP TABLE IF EXISTS `d_malfunction_order`;
CREATE TABLE `d_malfunction_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Malfunction_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '提交的訂單ID',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '手机号',
  `car_id` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车辆Id',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '故障类型 对应 malfunction_list表Id',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '坐标',
  `is_presence` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=未被接单 2= 已被接单 进行中   3已经完成  ',
  `rescue_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '接单人ID 未接为0',
  `addtime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加信息的时间',
  `is_delete` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=正常 2=删除',
  `img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '故障图片',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '工单备注',
  `time` int(11) NOT NULL DEFAULT 0 COMMENT '工单完成提交时间',
  `accept_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '接单时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '故障工单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_malfunction_order
-- ----------------------------
INSERT INTO `d_malfunction_order` VALUES (13, 0, 68, '0', '32', '0', '201912041656492728940414', '{\"lat\":30.551441192626953,\"lng\":104.06444549560547}', 3, 21, 1575611416, 1, '20191204/0d306cc1a84aa00b71621a93e1af0979.jpg', '1', 1575614821, 1575614793);
INSERT INTO `d_malfunction_order` VALUES (14, 0, 68, '0', '32', '0', '201912041656492728940414', '{\"lat\":30.551441192626953,\"lng\":104.06444549560547}', 3, 21, 1575611450, 1, '20191204/0d306cc1a84aa00b71621a93e1af0979.jpg', '1', 1575615151, 1575614985);
INSERT INTO `d_malfunction_order` VALUES (15, 0, 68, '0', '32', '0', '201912041656492728940414', '{\"lat\":30.551441192626953,\"lng\":104.06444549560547}', 3, 21, 1575611565, 1, '20191204/0d306cc1a84aa00b71621a93e1af0979.jpg', '1', 1575945778, 1575615088);
INSERT INTO `d_malfunction_order` VALUES (16, 0, 68, '0', '32', '0', '201912041656492728940414', '{\"lat\":30.551441192626953,\"lng\":104.06444549560547}', 3, 21, 1575611799, 1, '20191204/0d306cc1a84aa00b71621a93e1af0979.jpg', '1', 1575945787, 1575615130);
INSERT INTO `d_malfunction_order` VALUES (17, 0, 68, '0', '32', '0', '201912041656312229423035', '{\"lat\":30.5513973236084,\"lng\":104.06439208984375}', 3, 21, 1575613694, 1, '', '1', 1575945793, 1575615139);
INSERT INTO `d_malfunction_order` VALUES (18, 0, 68, '0', '32', '0', '201912041655383530041334', '{\"lat\":30.551382064819336,\"lng\":104.06439971923828}', 3, 21, 1575613751, 1, '', '1', 1575945783, 1575945770);
INSERT INTO `d_malfunction_order` VALUES (19, 0, 97, '0', '43', '二维码', '201912131948556386193607', '{\"lat\":32.96257,\"lng\":114.61912}', 3, 21, 1576237790, 1, '', '1', 1576238628, 1576238196);
INSERT INTO `d_malfunction_order` VALUES (20, 0, 97, '0', '43', '0', '201912132005312721774832', '{\"lat\":32.96257,\"lng\":114.61912}', 3, 22, 1576238965, 1, '', '1', 1576291545, 1576291537);

-- ----------------------------
-- Table structure for d_menu
-- ----------------------------
DROP TABLE IF EXISTS `d_menu`;
CREATE TABLE `d_menu`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `module_id` int(11) NOT NULL DEFAULT 0 COMMENT '模块ID',
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0=显示  1=不显示',
  `sort` int(11) DEFAULT 99 COMMENT '排序',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '菜单的父ID  0的话是一级菜单',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for d_message
-- ----------------------------
DROP TABLE IF EXISTS `d_message`;
CREATE TABLE `d_message`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `titel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '通知内容',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '通知的跳转连接',
  `time` int(11) NOT NULL DEFAULT 0 COMMENT '通知时间',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '被通知的商户ID',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '通知的类型 1=代理商发给用户  2=个人中心收到的  3总后台发给代理商[非必填]',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '被通知的用户ID',
  `is_read` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=未读  1=已读',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公告和消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for d_notice
-- ----------------------------
DROP TABLE IF EXISTS `d_notice`;
CREATE TABLE `d_notice`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题内容',
  `addtime` int(11) NOT NULL DEFAULT 0 COMMENT '生成时间',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1正常  2异常',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1管理端   2 用户端',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '头部轮播信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for d_order
-- ----------------------------
DROP TABLE IF EXISTS `d_order`;
CREATE TABLE `d_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `car_id` int(11) NOT NULL DEFAULT 0 COMMENT '车辆id',
  `car_type` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车子的类型',
  `start_time` int(11) NOT NULL DEFAULT 0 COMMENT '开始骑车时间',
  `end_time` int(11) NOT NULL DEFAULT 0 COMMENT '结束骑车时间',
  `start_location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '骑行开始地点',
  `end_location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '骑行结束地点',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详细开始地址',
  `landmark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开始地标',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '应该支付的金额',
  `pay_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '实际支付总费用',
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '付款城市',
  `is_pay` smallint(6) NOT NULL DEFAULT 1 COMMENT '支付状态：1=未支付，2=已支付',
  `pay_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '支付方式：1=微信支付   0=未支付 2=余额',
  `pay_time` int(11) NOT NULL DEFAULT 0 COMMENT '支付时间',
  `order_type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=充值 2=扣费 3=押金',
  `is_show` smallint(1) NOT NULL DEFAULT 1 COMMENT '是否显示 1--显示 2--不显示',
  `is_delete` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1不删除 2删除',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '代理商的ID',
  `is_riding` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=骑行中  2=骑行完毕',
  `is_temporary_lock` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1= 骑行中  2是临时锁车  3 是骑行完毕待锁  4已锁',
  `is_correct_parking` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1正确放在有效区域 不用调度费  2需要调度费',
  `correct_parking_price` smallint(10) NOT NULL DEFAULT 0 COMMENT '超出停车区域的话 额外支付的金额',
  `locak_location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '临时锁车坐标',
  `is_card` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1没有月卡抵消 2月卡抵消',
  `riding_time` float(10, 2) NOT NULL DEFAULT 0.00 COMMENT '骑行时长 单位分钟',
  `riding_mileage` float(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '骑行里程 单位KM',
  `is_success` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=未结算 2=结算成功  3结算成功 确定车子上锁状态',
  `formal` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=扫码生成的预订单     2=机器开锁后确认订单',
  `is_lock` tinyint(1) UNSIGNED NOT NULL DEFAULT 3 COMMENT '1=订单结算上锁完成 2=订单结算未上锁 3=订单未结算 未上锁',
  `is_suspend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=申请临时锁车 车子未回应  2=车子回应锁车成功  3=车子回应锁车失败  4为申请继续骑行    5继续骑行开锁成功   6继续骑行开锁失败',
  `stop` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=正常 2=超区域暂停使用   ',
  `is_owe` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=正常  2=欠费订单',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_no`(`order_no`) USING BTREE COMMENT '订单号'
) ENGINE = InnoDB AUTO_INCREMENT = 959 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_order
-- ----------------------------
INSERT INTO `d_order` VALUES (935, 109, 61, '电动车', 1576720819, 1576721669, '{\"lat\":32.96257,\"lng\":114.61912}', '{\"lat\":32.96257,\"lng\":114.61912}', '中国河南省驻马店市平舆县委(清河大道西)', '平舆县委', '201912191000159953428325', 12.00, 12.00, '驻马店市', 2, 2, 1576721719, 2, 1, 1, 44, 2, 4, 2, 10, '', 1, 14.13, 0.00, 2, 2, 1, 5, 1, 1);
INSERT INTO `d_order` VALUES (938, 110, 61, '电动车', 1576726433, 1576726747, '{\"lat\":30.777232801649305,\"lng\":103.85806287977431}', '{\"lat\":\"30.77721\",\"lng\":\"103.85808\"}', '中国四川省成都市郫都区德源嘉业花园(红旗大道南段北)', '德源', '201912191133499576024813', 12.00, 12.00, '成都市', 2, 2, 1576726780, 2, 1, 1, 44, 2, 2, 2, 10, '', 1, 5.20, 0.00, 2, 2, 1, 4, 2, 1);
INSERT INTO `d_order` VALUES (939, 110, 61, '电动车', 1576726845, 1576727276, '{\"lat\":30.777161729600696,\"lng\":103.85809543185763}', '{\"lat\":\"30.77748\",\"lng\":\"103.85807\"}', '中国四川省成都市郫都区德源嘉业花园(红旗大道南段北)', '德源', '201912191140426577073424', 12.00, 12.00, '成都市', 2, 2, 1576727622, 2, 1, 1, 44, 2, 2, 2, 10, '', 1, 1.58, 0.00, 2, 2, 1, 4, 2, 1);
INSERT INTO `d_order` VALUES (940, 110, 61, '电动车', 1576727032, 1576727376, '{\"lat\":30.777161729600696,\"lng\":103.85809543185763}', '{\"lat\":\"30.77736\",\"lng\":\"103.85818\"}', '中国四川省成都市郫都区德源嘉业花园(红旗大道南段北)', '德源', '201912191143485189268213', 2.00, 2.00, '成都市', 2, 2, 1576727639, 2, 1, 1, 44, 2, 4, 1, 0, '', 1, 3.87, 0.00, 2, 2, 1, 4, 2, 1);
INSERT INTO `d_order` VALUES (942, 110, 61, '电动车', 1576727735, 1576727772, '{\"lat\":30.777269151475693,\"lng\":103.85789116753472}', '{\"lat\":30.777269151476,\"lng\":103.85789116753}', '中国四川省成都市郫都区德源嘉业花园(红旗大道南段北)', '德源', '201912191155195291637119', 12.00, 12.00, '成都市', 2, 2, 1576727778, 2, 1, 1, 44, 2, 4, 2, 10, '', 1, 0.13, 0.00, 2, 2, 1, 5, 1, 1);
INSERT INTO `d_order` VALUES (948, 110, 65, '电动车', 1576740958, 1576741036, '{\"lat\":30.5515087890625,\"lng\":104.06449924045138}', '{\"lat\":30.551508789062,\"lng\":104.06449924045}', '中国四川省成都市武侯区雄川金融中心(天府二街)', '雄川金融中心', '201912191535542082127723', 11.10, 11.10, '成都市', 2, 2, 1576741054, 2, 1, 1, 45, 2, 4, 2, 10, '', 1, 1.25, 0.00, 2, 2, 1, 5, 1, 1);
INSERT INTO `d_order` VALUES (950, 110, 65, '电动车', 1576741124, 1576741137, '{\"lat\":30.551592068142362,\"lng\":104.06413953993055}', '{\"lat\":30.551592068142,\"lng\":104.06413953993}', '中国四川省成都市武侯区华西证券总部综合办公楼(天府二街)', '华西证券总部-综合办公楼', '201912191538398264307808', 11.00, 11.00, '成都市', 2, 2, 1576741143, 2, 1, 1, 45, 2, 4, 2, 10, '', 1, 0.17, 0.00, 2, 2, 1, 5, 1, 1);
INSERT INTO `d_order` VALUES (951, 110, 65, '电动车', 1576741256, 1576742021, '{\"lat\":30.551507432725696,\"lng\":104.06432183159723}', '{\"lat\":\"30.55197\",\"lng\":\"104.06455\"}', '中国四川省成都市武侯区雄川金融中心(天府二街)', '雄川金融中心', '201912191540506056755422', 11.00, 11.00, '成都市', 2, 2, 1576742027, 2, 1, 1, 45, 2, 4, 2, 10, '', 1, 12.70, 0.00, 2, 2, 1, 5, 2, 1);
INSERT INTO `d_order` VALUES (954, 112, 65, '电动车', 1576742230, 1576742374, '{\"lat\":30.551366806030273,\"lng\":104.06439971923828}', '{\"lat\":\"30.55296\",\"lng\":\"104.06427\"}', '中国四川省成都市武侯区领地环球金融中心(天府二街)', '领地环球金融中心', '201912191557056748451215', 1.00, 1.00, '成都市', 2, 2, 1576742402, 2, 1, 1, 45, 2, 4, 1, 0, '', 1, 2.35, 0.00, 2, 2, 1, 5, 2, 1);
INSERT INTO `d_order` VALUES (955, 112, 65, '电动车', 1576742451, 1576744686, '{\"lat\":30.552833557128906,\"lng\":104.06429290771484}', '{\"lat\":\"30.55292\",\"lng\":\"104.06437\"}', '中国四川省成都市雄川金融中心(吉瑞五路)', '雄川金融中心', '201912191600475984541417', 2.80, 2.80, '成都市', 2, 2, 1576744692, 2, 1, 1, 45, 2, 4, 1, 0, '', 1, 37.18, 0.00, 2, 2, 1, 5, 2, 1);
INSERT INTO `d_order` VALUES (956, 112, 65, '电动车', 1576744720, 1576745072, '{\"lat\":30.552818298339844,\"lng\":104.06429290771484}', '{\"lat\":\"30.55312\",\"lng\":\"104.06436\"}', '中国四川省成都市武侯区雄川金融中心(吉瑞五路)', '雄川金融中心', '201912191638342321794715', 11.00, 11.00, '成都市', 2, 2, 1576745083, 2, 1, 1, 45, 2, 4, 2, 10, '', 1, 5.83, 0.00, 2, 2, 1, 5, 2, 1);
INSERT INTO `d_order` VALUES (957, 112, 65, '电动车', 1576745200, 1576745522, '{\"lat\":30.552759170532227,\"lng\":104.06419372558594}', '{\"lat\":\"30.55278\",\"lng\":\"104.06467\"}', '中国四川省成都市武侯区雄川金融中心(吉瑞五路南)', '雄川金融中心', '201912191646365989256302', 11.00, 11.00, '成都市', 2, 2, 1576745547, 2, 1, 1, 45, 2, 4, 2, 10, '', 1, 5.32, 0.00, 2, 2, 1, 5, 2, 1);
INSERT INTO `d_order` VALUES (958, 112, 65, '电动车', 1576745578, 1576835965, '{\"lat\":30.552846908569336,\"lng\":104.0643081665039}', '{\"lat\":\"30.55173\",\"lng\":\"104.06428\"}', '中国四川省成都市雄川金融中心(吉瑞五路)', '雄川金融中心', '201912191652527515493515', 159.70, 159.70, '成都市', 1, 0, 0, 2, 1, 1, 45, 2, 4, 2, 10, '', 1, 66.45, 0.00, 2, 2, 2, 5, 2, 1);

-- ----------------------------
-- Table structure for d_permission
-- ----------------------------
DROP TABLE IF EXISTS `d_permission`;
CREATE TABLE `d_permission`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `addtime` int(11) NOT NULL DEFAULT 0 COMMENT '生成时间',
  `menu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '当前菜单名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '链接',
  `pid` int(11) DEFAULT 0 COMMENT '权限等级',
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员可操作的权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_permission
-- ----------------------------
INSERT INTO `d_permission` VALUES (1, 0, '后台首页', '/admin/main', 0, 'multitabs');
INSERT INTO `d_permission` VALUES (2, 0, '工作台', '##', 0, NULL);
INSERT INTO `d_permission` VALUES (3, 0, '代理商信息', '##', 0, NULL);
INSERT INTO `d_permission` VALUES (4, 0, '用户管理', '##', 0, NULL);
INSERT INTO `d_permission` VALUES (5, 0, '电动车管理', '##', 0, NULL);
INSERT INTO `d_permission` VALUES (6, 0, '订单管理', '##', 0, NULL);
INSERT INTO `d_permission` VALUES (7, 0, '区域管理', '##', 0, NULL);
INSERT INTO `d_permission` VALUES (8, 0, '资金管理', '##', 0, NULL);
INSERT INTO `d_permission` VALUES (9, 0, '平台推送', '##', 0, NULL);
INSERT INTO `d_permission` VALUES (10, 0, '超级管理员', '##', 0, NULL);
INSERT INTO `d_permission` VALUES (11, 0, '用户角色', '##', 0, NULL);
INSERT INTO `d_permission` VALUES (13, 0, '代办事项', '/finance/car_malfunction_list', 2, NULL);
INSERT INTO `d_permission` VALUES (14, 0, '事件详情', '/finance/event_list', 2, NULL);
INSERT INTO `d_permission` VALUES (16, 0, '用户信息', '/user/user_list', 4, NULL);
INSERT INTO `d_permission` VALUES (17, 0, '代理商', '/finance/workbench_list', 3, NULL);
INSERT INTO `d_permission` VALUES (18, 0, '实名认证', '/user/user_real', 4, NULL);
INSERT INTO `d_permission` VALUES (19, 0, '电动车信息', '/car/car_list', 5, NULL);
INSERT INTO `d_permission` VALUES (20, 0, '故障上报', '/car/report_list', 5, NULL);
INSERT INTO `d_permission` VALUES (22, 0, '车辆区域监控', '/car/malfunction', 5, NULL);
INSERT INTO `d_permission` VALUES (23, 0, '还车失败', '/car/car_failure', 5, NULL);
INSERT INTO `d_permission` VALUES (24, 0, '消费记录', '/order/record_list', 6, NULL);
INSERT INTO `d_permission` VALUES (25, 0, '免押金记录', '/order/real', 6, NULL);
INSERT INTO `d_permission` VALUES (26, 0, '电子围栏', '/returncar/return_info_list', 7, NULL);
INSERT INTO `d_permission` VALUES (27, 0, '充值设置', '/recharge/recharge_list', 8, NULL);
INSERT INTO `d_permission` VALUES (28, 0, '免押金卡设置', '/recharge/card_list', 8, NULL);
INSERT INTO `d_permission` VALUES (29, 0, '充值明细', '/recharge/recharge', 8, NULL);
INSERT INTO `d_permission` VALUES (30, 0, '价格套餐设置', '/recharge/car_price', 8, NULL);
INSERT INTO `d_permission` VALUES (31, 0, '收费明细', '/recharge/detail', 8, NULL);
INSERT INTO `d_permission` VALUES (32, 0, '调度规则', '/recharge/setting', 8, NULL);
INSERT INTO `d_permission` VALUES (33, 0, '罚款明细', '/recharge/setting_list', 8, NULL);
INSERT INTO `d_permission` VALUES (34, 0, '短信', '/announcement/code_send', 9, NULL);
INSERT INTO `d_permission` VALUES (35, 0, '系统公告', '/announcement/announcement_list', 9, NULL);
INSERT INTO `d_permission` VALUES (36, 0, '权限', '/website/athou', 10, NULL);
INSERT INTO `d_permission` VALUES (38, 0, '维修人员', '/user/personnel_list', 11, NULL);
INSERT INTO `d_permission` VALUES (39, 0, '订单列表', '/order/order_list', 6, NULL);
INSERT INTO `d_permission` VALUES (40, 0, '运维管理', '##', 0, NULL);
INSERT INTO `d_permission` VALUES (41, 0, '运维工作统计', '/recharge/service_list', 40, NULL);
INSERT INTO `d_permission` VALUES (42, 0, '站点', '/returncar/returncar_car', 7, NULL);

-- ----------------------------
-- Table structure for d_promotions
-- ----------------------------
DROP TABLE IF EXISTS `d_promotions`;
CREATE TABLE `d_promotions`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `theme` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '活动主题',
  `type` int(1) NOT NULL COMMENT '类型\r\n',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '活动内容',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '活动链接',
  `start_time` int(11) NOT NULL DEFAULT 0 COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT 0 COMMENT '结束时间',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '代理商ID',
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1 有效  2 失效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for d_proxy
-- ----------------------------
DROP TABLE IF EXISTS `d_proxy`;
CREATE TABLE `d_proxy`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '代理商手机号',
  `openid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'openid',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '账户名',
  `poasword` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '代理商所在地区',
  `login_time` int(11) NOT NULL DEFAULT 0 COMMENT '上次登录时间',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登陆的IP地址',
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=正常 1异常不可登陆',
  `addtime` int(11) NOT NULL DEFAULT 0 COMMENT '生成时间',
  `admin_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '生成子账号的管理员ID',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '如果为0就是一级代理商  否则就是上级的代理商ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名字',
  `location1` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '代理商管理的第一个坐标点',
  `location2` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '代理商管理的第二个坐标点',
  `location3` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '代理商管理的第三个坐标点',
  `location4` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '代理商管理的第四个坐标点',
  `is_delete` tinyint(1) UNSIGNED NOT NULL DEFAULT 2 COMMENT '1=删除  2=正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理商表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_proxy
-- ----------------------------
INSERT INTO `d_proxy` VALUES (21, '15198163122', '', '谢东', '14e1b600b1fd579f47433b88e8d85291', '成都市郫都区', 0, '', 0, 1575444536, 7, 0, '谢东', '{\"lat\":\"30.84512342038141\",\"lng\":\"103.8592529296875\"}', '{\"lat\":\"30.80030914748402\",\"lng\":\"103.84002685546875\"}', '{\"lat\":\"30.761374528788064\",\"lng\":\"103.8702392578125\"}', '{\"lat\":\"30.76845472249886\",\"lng\":\"103.95126342773438\"}', 1);
INSERT INTO `d_proxy` VALUES (44, '15198163122', '', '谢东', '14e1b600b1fd579f47433b88e8d85291', '成都市郫都区', 0, '', 0, 1576714856, 7, 0, '谢东', '{\"lat\":\"30.78187695933756\",\"lng\":\"103.85753631591797\"}', '{\"lat\":\"30.77953571705441\",\"lng\":\"103.86088371276855\"}', '{\"lat\":\"30.774488026000096\",\"lng\":\"103.85579824447632\"}', '{\"lat\":\"30.777843350479355\",\"lng\":\"103.85186076164246\"}', 2);
INSERT INTO `d_proxy` VALUES (45, '18280367606', '', '18280367606', '9db06bcff9248837f86d1a6bcf41c9e7', '成都二街', 0, '', 0, 1576720613, 7, 0, '段厚奎', '', '', '', '', 2);
INSERT INTO `d_proxy` VALUES (46, '18613151357', '', '123456', '14e1b600b1fd579f47433b88e8d85291', '1', 0, '', 0, 1577199583, 7, 0, '1', '{\"lat\":\"30.754818309502486\",\"lng\":\"103.7274169921875\"}', '{\"lat\":\"30.52204730013766\",\"lng\":\"103.897705078125\"}', '{\"lat\":\"30.732392734006083\",\"lng\":\"103.92379760742188\"}', '{\"lat\":\"30.65445282440074\",\"lng\":\"103.81942749023438\"}', 2);
INSERT INTO `d_proxy` VALUES (49, '18294428125', '', 'account账户', '14e1b600b1fd579f47433b88e8d85291', 'address城市', 0, '', 0, 1578035486, 7, 0, 'name名字', '{\"lat\":\"30.66980960132695\",\"lng\":\"103.92929077148438\"}', '{\"lat\":\"30.66980960132695\",\"lng\":\"103.92929077148438\"}', '{\"lat\":\"30.66980960132695\",\"lng\":\"103.92929077148438\"}', '{\"lat\":\"30.66980960132695\",\"lng\":\"103.92929077148438\"}', 1);
INSERT INTO `d_proxy` VALUES (50, '1', '', 'meowwei@163.com', '14e1b600b1fd579f47433b88e8d85291', '11111111111111', 0, '', 0, 1578044628, 7, 0, '1111111111111', '{\"lat\":\"30.645001287372306\",\"lng\":\"103.78097534179688\"}', '{\"lat\":\"30.676896521408167\",\"lng\":\"103.84414672851562\"}', '{\"lat\":\"30.62550457485626\",\"lng\":\"103.76724243164062\"}', '{\"lat\":\"30.61250458401165\",\"lng\":\"103.90869140625\"}', 1);
INSERT INTO `d_proxy` VALUES (51, '18294428126', '', '郫县去代理', '7ec44d86102fa8c56d482e5348d82331', '11111111111111', 0, '', 0, 1578045060, 7, 0, '1111111111111', '{\"lat\":\"30.802012976326356\",\"lng\":\"103.88534545898438\"}', '{\"lat\":\"30.738294707383368\",\"lng\":\"103.94302368164062\"}', '{\"lat\":\"30.728851376474022\",\"lng\":\"104.01031494140625\"}', '{\"lat\":\"30.78549747681448\",\"lng\":\"104.01031494140625\"}', 1);

-- ----------------------------
-- Table structure for d_recharge
-- ----------------------------
DROP TABLE IF EXISTS `d_recharge`;
CREATE TABLE `d_recharge`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '充值的用户ID',
  `store_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户属于暂时那个代理商的ID',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '充值的金额',
  `discount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '折扣的金额',
  `gift_money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '充值赠送金额',
  `pay_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '实际充值的金额',
  `pay_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '支付方式 1  微信',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `is_pay` tinyint(1) UNSIGNED NOT NULL DEFAULT 2 COMMENT '是否支付 1=已支付 2=未支付',
  `is_success` tinyint(1) UNSIGNED NOT NULL DEFAULT 2 COMMENT '是否到账 1=到账 2=未到账',
  `time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '充值时间',
  `is_delete` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=删除 2=正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 204 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户充值表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_recharge
-- ----------------------------
INSERT INTO `d_recharge` VALUES (201, 109, 3, 20.00, 1.00, 0.00, 19.00, 1, '201912191014567985066413', 1, 1, 1576721696, 1);
INSERT INTO `d_recharge` VALUES (202, 110, 3, 100.00, 10.00, 0.00, 90.00, 1, '201912191139233966349610', 1, 1, 1576726763, 1);
INSERT INTO `d_recharge` VALUES (203, 112, 3, 100.00, 10.00, 0.00, 90.00, 1, '201912191559458258506408', 1, 1, 1576742385, 1);

-- ----------------------------
-- Table structure for d_recharge_list
-- ----------------------------
DROP TABLE IF EXISTS `d_recharge_list`;
CREATE TABLE `d_recharge_list`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '金额',
  `discount_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '减免金额',
  `gift_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '充值赠送金额',
  `discount` float(10, 2) NOT NULL DEFAULT 10.00 COMMENT '打几折  10= 不打折',
  `addtime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '最近更新时间或者是添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '充值列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_recharge_list
-- ----------------------------
INSERT INTO `d_recharge_list` VALUES (1, 10.00, 0.00, 0.00, 10.00, 127);
INSERT INTO `d_recharge_list` VALUES (2, 20.00, 0.00, 0.00, 9.50, 121);
INSERT INTO `d_recharge_list` VALUES (7, 100.00, 0.00, 0.00, 9.00, 0);

-- ----------------------------
-- Table structure for d_refund
-- ----------------------------
DROP TABLE IF EXISTS `d_refund`;
CREATE TABLE `d_refund`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '代理商ID',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `refund_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '退款单号',
  `refund_pay_time` int(11) NOT NULL COMMENT '退款到账时间',
  `pay_time` int(11) NOT NULL DEFAULT 0 COMMENT '付款时间',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '退款金额',
  `time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '退款审核时间',
  `refund_type` tinyint(1) NOT NULL COMMENT '1审核中 2同意退  3不同意 ',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=押金退款成功  2= 失敗',
  `addtime` int(11) NOT NULL DEFAULT 0 COMMENT '申请时间',
  `is_delete` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=正常 2=删除',
  `content` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '退款失败的原因',
  `refuse_info` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '不同意退款的原因',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '押金退款表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_refund
-- ----------------------------
INSERT INTO `d_refund` VALUES (30, 65, 3, '201912041529548537063716', '201912041602309159448425', 0, 1575444594, 0.01, 0, 1, 1, 1575446550, 1, '', '');
INSERT INTO `d_refund` VALUES (31, 66, 3, '201912041532565508744224', '201912061131265383639028', 0, 1575444776, 0.01, 0, 1, 1, 1575603086, 1, '', '');
INSERT INTO `d_refund` VALUES (32, 73, 3, '201912101035321150141255', '201912101038455449631427', 0, 1575945332, 0.01, 0, 1, 1, 1575945525, 1, '', '');
INSERT INTO `d_refund` VALUES (33, 73, 3, '201912101035321150141255', '201912101038498070551825', 0, 1575945332, 0.01, 0, 1, 1, 1575945529, 1, '', '');

-- ----------------------------
-- Table structure for d_rescue
-- ----------------------------
DROP TABLE IF EXISTS `d_rescue`;
CREATE TABLE `d_rescue`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '代理商ID',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户Id',
  `order_id` int(50) UNSIGNED NOT NULL DEFAULT 0 COMMENT '骑行订单号',
  `number` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '救援单号',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `rescue_id` int(11) NOT NULL DEFAULT 0 COMMENT '0 为还没有人接单  否则就是接单人的ID',
  `type_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '1=电池没电 2=突发事故 3=车辆损坏  4其他  原因显示在下一个字段',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '救援的原因上一个字段为4  原因写入此字段',
  `addtime` int(11) NOT NULL DEFAULT 0 COMMENT '请求的时间',
  `city` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '城市',
  `location` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户请求救援坐标',
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 4 COMMENT '1=处理中  2处理完成 3取消救援  4=待救援',
  `car_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '车子的ID',
  `img` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '照片',
  `expired_time` int(11) NOT NULL DEFAULT 0 COMMENT '过期时间 申请时间+10个小时= 过期时间',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '具体地址',
  `landmark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '地标信息',
  `accept_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '救援人员接单时间',
  `success_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '救援完成时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10017 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '请求救援表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_rescue
-- ----------------------------
INSERT INTO `d_rescue` VALUES (10014, 21, 67, 589, 4294967295, '201912050956236721956316', 0, '其他', '3333', 1575510999, '成都', '{\"lat\":30.57447,\"lng\":103.92377}', 3, 29, '20191205/5225da4d3eaa5211ce48d5d232d18976.png', 1575518199, '中国四川省成都市中共成都市双流区委员会(淳化街北)', '中共成都市双流区委员会', 0, 0);
INSERT INTO `d_rescue` VALUES (10015, 22, 67, 604, 4294967295, '201912061457338409424619', 22, '车辆损坏', '3333131', 1575616108, '成都', '{\"lat\":30.57447,\"lng\":103.92377}', 1, 37, '', 1575623308, '中国四川省成都市中共成都市双流区委员会(淳化街北)', '中共成都市双流区委员会', 1575860660, 0);
INSERT INTO `d_rescue` VALUES (10016, 21, 93, 673, 4294967295, '201912121824437128788316', 21, '电池没电', '没电了', 1576146490, '成都', '{\"lat\":30.526033401489258,\"lng\":104.06729888916016}', 2, 32, '', 1576153690, '中国四川省成都市双流区华阳蓝润置地广场(华府大道一段南)', '华阳', 1576233288, 1576233294);

-- ----------------------------
-- Table structure for d_rescue_personnel
-- ----------------------------
DROP TABLE IF EXISTS `d_rescue_personnel`;
CREATE TABLE `d_rescue_personnel`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '救援人员的ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '救援人员的名字',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '手机号',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '密码',
  `id_card` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '身份证号',
  `is_id_card` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1= 未认证 2=认证',
  `head_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=正常 2=禁止使用',
  `is_delete` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=正常 2=删除',
  `store_id` int(11) NOT NULL COMMENT '代理商id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '救援人员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_rescue_personnel
-- ----------------------------
INSERT INTO `d_rescue_personnel` VALUES (13, '谢东', '15198163122', 'ab841b371f98dcf154f6a83906b54a07', '510402199712025157', 2, 'user/20191219/bf56c4d9e87176e88c162b0708e9faf3.jpg', 1, 1, 44);

-- ----------------------------
-- Table structure for d_rescue_personnel_copy1
-- ----------------------------
DROP TABLE IF EXISTS `d_rescue_personnel_copy1`;
CREATE TABLE `d_rescue_personnel_copy1`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '救援人员的ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '救援人员的名字',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '手机号',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '密码',
  `id_card` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '身份证号',
  `is_id_card` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1= 未认证 2=认证',
  `head_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `state` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=正常 2=禁止使用',
  `is_delete` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=正常 2=删除',
  `store_id` int(11) NOT NULL COMMENT '代理商id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '救援人员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_rescue_personnel_copy1
-- ----------------------------
INSERT INTO `d_rescue_personnel_copy1` VALUES (13, '谢东', '15198163122', 'ab841b371f98dcf154f6a83906b54a07', '510402199712025157', 2, 'user/20191219/bf56c4d9e87176e88c162b0708e9faf3.jpg', 1, 1, 44);

-- ----------------------------
-- Table structure for d_return_car
-- ----------------------------
DROP TABLE IF EXISTS `d_return_car`;
CREATE TABLE `d_return_car`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `order_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单Id',
  `car_type` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '车子的类型',
  `car_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '车子Id',
  `store_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '代理商ID',
  `start_time` int(11) NOT NULL DEFAULT 0 COMMENT '开始骑车时间',
  `end_time` int(11) NOT NULL DEFAULT 0 COMMENT '结束时间',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '金额',
  `is_failure` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=已经归还  2未归还',
  `failure_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '未归还的原因',
  `addtime` int(11) NOT NULL DEFAULT 0 COMMENT '添加信息时间',
  `is_temporary_lock` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=骑行中 2临时锁车中 3骑行完毕待锁 4 已锁',
  `locak_location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '换车失败坐标',
  `is_suspend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=申请临时锁车 车子未回应  2=车子回应锁车成功  3=车子回应锁车失败  4为申请继续骑行    5继续骑行开锁成功   6继续骑行开锁失败',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '还车表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for d_riding
-- ----------------------------
DROP TABLE IF EXISTS `d_riding`;
CREATE TABLE `d_riding`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `u_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `car_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '车辆ID',
  `start_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '开始骑行时间',
  `end_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '结束时间',
  `is_lock` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1 上锁  2未上锁 ',
  `is_pay` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '1支付  2未支付',
  `lat` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '车子放置的经度',
  `let` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '车子放置的纬度',
  `is_delete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1正常  2删除',
  `is_failure` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1还车成功 2还车失败',
  `failure_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '还车失败的信息',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '代理商ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户骑行记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for d_route
-- ----------------------------
DROP TABLE IF EXISTS `d_route`;
CREATE TABLE `d_route`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `location` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '行驶坐标',
  `order_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单ID ',
  `time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5206 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_route
-- ----------------------------
INSERT INTO `d_route` VALUES (4606, '{\"lat\":\"30.77720\",\"lng\":\"103.85819\"}', 937, 1576722608);
INSERT INTO `d_route` VALUES (4607, '{\"lat\":\"30.77720\",\"lng\":\"103.85815\"}', 937, 1576722673);
INSERT INTO `d_route` VALUES (4608, '{\"lat\":\"30.77718\",\"lng\":\"103.85813\"}', 937, 1576722738);
INSERT INTO `d_route` VALUES (4609, '{\"lat\":\"30.77716\",\"lng\":\"103.85815\"}', 937, 1576722804);
INSERT INTO `d_route` VALUES (4610, '{\"lat\":\"30.77718\",\"lng\":\"103.85816\"}', 937, 1576722870);
INSERT INTO `d_route` VALUES (4611, '{\"lat\":\"30.77721\",\"lng\":\"103.85820\"}', 937, 1576722935);
INSERT INTO `d_route` VALUES (4612, '{\"lat\":\"30.77720\",\"lng\":\"103.85815\"}', 937, 1576723001);
INSERT INTO `d_route` VALUES (4613, '{\"lat\":\"30.77712\",\"lng\":\"103.85812\"}', 937, 1576723068);
INSERT INTO `d_route` VALUES (4614, '{\"lat\":\"30.77715\",\"lng\":\"103.85780\"}', 937, 1576723134);
INSERT INTO `d_route` VALUES (4615, '{\"lat\":\"30.77717\",\"lng\":\"103.85792\"}', 937, 1576723200);
INSERT INTO `d_route` VALUES (4616, '{\"lat\":\"30.77717\",\"lng\":\"103.85806\"}', 937, 1576723265);
INSERT INTO `d_route` VALUES (4617, '{\"lat\":\"30.77718\",\"lng\":\"103.85812\"}', 937, 1576723331);
INSERT INTO `d_route` VALUES (4618, '{\"lat\":\"30.77718\",\"lng\":\"103.85820\"}', 937, 1576723396);
INSERT INTO `d_route` VALUES (4619, '{\"lat\":\"30.77718\",\"lng\":\"103.85840\"}', 937, 1576723462);
INSERT INTO `d_route` VALUES (4620, '{\"lat\":\"30.77717\",\"lng\":\"103.85856\"}', 937, 1576723527);
INSERT INTO `d_route` VALUES (4621, '{\"lat\":\"30.77717\",\"lng\":\"103.85850\"}', 937, 1576723593);
INSERT INTO `d_route` VALUES (4622, '{\"lat\":\"30.77718\",\"lng\":\"103.85831\"}', 937, 1576723658);
INSERT INTO `d_route` VALUES (4623, '{\"lat\":\"30.77719\",\"lng\":\"103.85815\"}', 937, 1576723724);
INSERT INTO `d_route` VALUES (4624, '{\"lat\":\"30.77719\",\"lng\":\"103.85812\"}', 937, 1576723790);
INSERT INTO `d_route` VALUES (4625, '{\"lat\":\"30.77719\",\"lng\":\"103.85813\"}', 937, 1576723855);
INSERT INTO `d_route` VALUES (4626, '{\"lat\":\"30.77719\",\"lng\":\"103.85816\"}', 937, 1576723921);
INSERT INTO `d_route` VALUES (4627, '{\"lat\":\"30.77720\",\"lng\":\"103.85820\"}', 937, 1576723986);
INSERT INTO `d_route` VALUES (4628, '{\"lat\":\"30.77720\",\"lng\":\"103.85819\"}', 937, 1576724051);
INSERT INTO `d_route` VALUES (4629, '{\"lat\":\"30.77715\",\"lng\":\"103.85812\"}', 937, 1576724117);
INSERT INTO `d_route` VALUES (4630, '{\"lat\":\"30.77717\",\"lng\":\"103.85827\"}', 937, 1576724182);
INSERT INTO `d_route` VALUES (4631, '{\"lat\":\"30.77720\",\"lng\":\"103.85825\"}', 937, 1576724248);
INSERT INTO `d_route` VALUES (4632, '{\"lat\":\"30.77716\",\"lng\":\"103.85838\"}', 937, 1576724314);
INSERT INTO `d_route` VALUES (4633, '{\"lat\":\"30.77714\",\"lng\":\"103.85844\"}', 937, 1576724379);
INSERT INTO `d_route` VALUES (4634, '{\"lat\":\"30.77711\",\"lng\":\"103.85846\"}', 937, 1576724445);
INSERT INTO `d_route` VALUES (4635, '{\"lat\":\"30.77712\",\"lng\":\"103.85843\"}', 937, 1576724511);
INSERT INTO `d_route` VALUES (4636, '{\"lat\":\"30.77714\",\"lng\":\"103.85833\"}', 937, 1576724576);
INSERT INTO `d_route` VALUES (4637, '{\"lat\":\"30.77714\",\"lng\":\"103.85830\"}', 937, 1576724641);
INSERT INTO `d_route` VALUES (4638, '{\"lat\":\"30.77714\",\"lng\":\"103.85828\"}', 937, 1576724707);
INSERT INTO `d_route` VALUES (4639, '{\"lat\":\"30.77714\",\"lng\":\"103.85806\"}', 937, 1576724772);
INSERT INTO `d_route` VALUES (4640, '{\"lat\":\"30.77717\",\"lng\":\"103.85799\"}', 937, 1576724838);
INSERT INTO `d_route` VALUES (4641, '{\"lat\":\"30.77717\",\"lng\":\"103.85807\"}', 937, 1576724903);
INSERT INTO `d_route` VALUES (4642, '{\"lat\":\"30.77719\",\"lng\":\"103.85808\"}', 937, 1576724968);
INSERT INTO `d_route` VALUES (4643, '{\"lat\":\"30.77718\",\"lng\":\"103.85794\"}', 937, 1576725034);
INSERT INTO `d_route` VALUES (4644, '{\"lat\":\"30.77720\",\"lng\":\"103.85815\"}', 937, 1576725099);
INSERT INTO `d_route` VALUES (4645, '{\"lat\":\"30.77717\",\"lng\":\"103.85805\"}', 937, 1576725165);
INSERT INTO `d_route` VALUES (4646, '{\"lat\":\"30.77719\",\"lng\":\"103.85805\"}', 937, 1576725230);
INSERT INTO `d_route` VALUES (4647, '{\"lat\":\"30.77719\",\"lng\":\"103.85807\"}', 937, 1576725296);
INSERT INTO `d_route` VALUES (4648, '{\"lat\":\"30.77716\",\"lng\":\"103.85811\"}', 937, 1576725362);
INSERT INTO `d_route` VALUES (4649, '{\"lat\":\"30.77717\",\"lng\":\"103.85806\"}', 937, 1576725427);
INSERT INTO `d_route` VALUES (4650, '{\"lat\":\"30.77718\",\"lng\":\"103.85806\"}', 937, 1576725493);
INSERT INTO `d_route` VALUES (4651, '{\"lat\":\"30.77720\",\"lng\":\"103.85804\"}', 937, 1576725561);
INSERT INTO `d_route` VALUES (4652, '{\"lat\":\"30.77720\",\"lng\":\"103.85804\"}', 937, 1576725624);
INSERT INTO `d_route` VALUES (4653, '{\"lat\":\"30.77711\",\"lng\":\"103.85809\"}', 937, 1576725690);
INSERT INTO `d_route` VALUES (4654, '{\"lat\":\"30.77711\",\"lng\":\"103.85808\"}', 937, 1576725755);
INSERT INTO `d_route` VALUES (4655, '{\"lat\":\"30.77711\",\"lng\":\"103.85801\"}', 937, 1576725821);
INSERT INTO `d_route` VALUES (4656, '{\"lat\":\"30.77716\",\"lng\":\"103.85800\"}', 937, 1576725887);
INSERT INTO `d_route` VALUES (4657, '{\"lat\":\"30.77718\",\"lng\":\"103.85803\"}', 937, 1576725952);
INSERT INTO `d_route` VALUES (4658, '{\"lat\":\"30.77718\",\"lng\":\"103.85807\"}', 937, 1576726018);
INSERT INTO `d_route` VALUES (4659, '{\"lat\":\"30.77716\",\"lng\":\"103.85809\"}', 937, 1576726083);
INSERT INTO `d_route` VALUES (4660, '{\"lat\":\"30.77716\",\"lng\":\"103.85816\"}', 937, 1576726149);
INSERT INTO `d_route` VALUES (4661, '{\"lat\":\"30.77717\",\"lng\":\"103.85812\"}', 937, 1576726214);
INSERT INTO `d_route` VALUES (4662, '{\"lat\":\"30.77716\",\"lng\":\"103.85806\"}', 937, 1576726280);
INSERT INTO `d_route` VALUES (4663, '{\"lat\":\"30.77725\",\"lng\":\"103.85810\"}', 937, 1576726346);
INSERT INTO `d_route` VALUES (4664, '{\"lat\":30.777232801649305,\"lng\":103.85806287977431}', 938, 1576726432);
INSERT INTO `d_route` VALUES (4665, '{\"lat\":\"30.77719\",\"lng\":\"103.85806\"}', 938, 1576726473);
INSERT INTO `d_route` VALUES (4666, '{\"lat\":\"30.77719\",\"lng\":\"103.85806\"}', 938, 1576726476);
INSERT INTO `d_route` VALUES (4667, '{\"lat\":\"30.77720\",\"lng\":\"103.85805\"}', 938, 1576726480);
INSERT INTO `d_route` VALUES (4668, '{\"lat\":\"30.77724\",\"lng\":\"103.85806\"}', 938, 1576726484);
INSERT INTO `d_route` VALUES (4669, '{\"lat\":\"30.77729\",\"lng\":\"103.85806\"}', 938, 1576726486);
INSERT INTO `d_route` VALUES (4670, '{\"lat\":\"30.77730\",\"lng\":\"103.85806\"}', 938, 1576726489);
INSERT INTO `d_route` VALUES (4671, '{\"lat\":\"30.77730\",\"lng\":\"103.85806\"}', 938, 1576726493);
INSERT INTO `d_route` VALUES (4672, '{\"lat\":\"30.77734\",\"lng\":\"103.85797\"}', 938, 1576726497);
INSERT INTO `d_route` VALUES (4673, '{\"lat\":\"30.77746\",\"lng\":\"103.85785\"}', 938, 1576726500);
INSERT INTO `d_route` VALUES (4674, '{\"lat\":\"30.77748\",\"lng\":\"103.85784\"}', 938, 1576726504);
INSERT INTO `d_route` VALUES (4675, '{\"lat\":\"30.77748\",\"lng\":\"103.85784\"}', 938, 1576726506);
INSERT INTO `d_route` VALUES (4676, '{\"lat\":\"30.77756\",\"lng\":\"103.85786\"}', 938, 1576726510);
INSERT INTO `d_route` VALUES (4677, '{\"lat\":\"30.77768\",\"lng\":\"103.85798\"}', 938, 1576726513);
INSERT INTO `d_route` VALUES (4678, '{\"lat\":\"30.77785\",\"lng\":\"103.85798\"}', 938, 1576726517);
INSERT INTO `d_route` VALUES (4679, '{\"lat\":\"30.77793\",\"lng\":\"103.85790\"}', 938, 1576726521);
INSERT INTO `d_route` VALUES (4680, '{\"lat\":\"30.77800\",\"lng\":\"103.85765\"}', 938, 1576726524);
INSERT INTO `d_route` VALUES (4681, '{\"lat\":\"30.77806\",\"lng\":\"103.85755\"}', 938, 1576726526);
INSERT INTO `d_route` VALUES (4682, '{\"lat\":\"30.77825\",\"lng\":\"103.85745\"}', 938, 1576726530);
INSERT INTO `d_route` VALUES (4683, '{\"lat\":\"30.77844\",\"lng\":\"103.85748\"}', 938, 1576726534);
INSERT INTO `d_route` VALUES (4684, '{\"lat\":\"30.77864\",\"lng\":\"103.85761\"}', 938, 1576726538);
INSERT INTO `d_route` VALUES (4685, '{\"lat\":\"30.77885\",\"lng\":\"103.85776\"}', 938, 1576726541);
INSERT INTO `d_route` VALUES (4686, '{\"lat\":\"30.77904\",\"lng\":\"103.85791\"}', 938, 1576726545);
INSERT INTO `d_route` VALUES (4687, '{\"lat\":\"30.77912\",\"lng\":\"103.85797\"}', 938, 1576726547);
INSERT INTO `d_route` VALUES (4688, '{\"lat\":\"30.77927\",\"lng\":\"103.85807\"}', 938, 1576726550);
INSERT INTO `d_route` VALUES (4689, '{\"lat\":\"30.77948\",\"lng\":\"103.85821\"}', 938, 1576726554);
INSERT INTO `d_route` VALUES (4690, '{\"lat\":\"30.77963\",\"lng\":\"103.85831\"}', 938, 1576726558);
INSERT INTO `d_route` VALUES (4691, '{\"lat\":\"30.77989\",\"lng\":\"103.85848\"}', 938, 1576726562);
INSERT INTO `d_route` VALUES (4692, '{\"lat\":\"30.78001\",\"lng\":\"103.85857\"}', 938, 1576726564);
INSERT INTO `d_route` VALUES (4693, '{\"lat\":\"30.78024\",\"lng\":\"103.85877\"}', 938, 1576726568);
INSERT INTO `d_route` VALUES (4694, '{\"lat\":\"30.78040\",\"lng\":\"103.85889\"}', 938, 1576726572);
INSERT INTO `d_route` VALUES (4695, '{\"lat\":\"30.78055\",\"lng\":\"103.85903\"}', 938, 1576726575);
INSERT INTO `d_route` VALUES (4696, '{\"lat\":\"30.78059\",\"lng\":\"103.85903\"}', 938, 1576726579);
INSERT INTO `d_route` VALUES (4697, '{\"lat\":\"30.77829\",\"lng\":\"103.85951\"}', 938, 1576726664);
INSERT INTO `d_route` VALUES (4698, '{\"lat\":\"30.77816\",\"lng\":\"103.85939\"}', 938, 1576726666);
INSERT INTO `d_route` VALUES (4699, '{\"lat\":\"30.77804\",\"lng\":\"103.85926\"}', 938, 1576726670);
INSERT INTO `d_route` VALUES (4700, '{\"lat\":\"30.77786\",\"lng\":\"103.85910\"}', 938, 1576726676);
INSERT INTO `d_route` VALUES (4701, '{\"lat\":\"30.77772\",\"lng\":\"103.85898\"}', 938, 1576726677);
INSERT INTO `d_route` VALUES (4702, '{\"lat\":\"30.77756\",\"lng\":\"103.85880\"}', 938, 1576726681);
INSERT INTO `d_route` VALUES (4703, '{\"lat\":\"30.77736\",\"lng\":\"103.85863\"}', 938, 1576726685);
INSERT INTO `d_route` VALUES (4704, '{\"lat\":\"30.77727\",\"lng\":\"103.85854\"}', 938, 1576726686);
INSERT INTO `d_route` VALUES (4705, '{\"lat\":\"30.77716\",\"lng\":\"103.85838\"}', 938, 1576726690);
INSERT INTO `d_route` VALUES (4706, '{\"lat\":\"30.77717\",\"lng\":\"103.85823\"}', 938, 1576726693);
INSERT INTO `d_route` VALUES (4707, '{\"lat\":\"30.77720\",\"lng\":\"103.85811\"}', 938, 1576726697);
INSERT INTO `d_route` VALUES (4708, '{\"lat\":\"30.77721\",\"lng\":\"103.85808\"}', 938, 1576726701);
INSERT INTO `d_route` VALUES (4709, '{\"lat\":32.96257,\"lng\":114.61912}', 935, 1576726732);
INSERT INTO `d_route` VALUES (4710, '{\"lat\":30.777161729600696,\"lng\":103.85809543185763}', 939, 1576726845);
INSERT INTO `d_route` VALUES (4711, '{\"lat\":\"30.77722\",\"lng\":\"103.85801\"}', 939, 1576726854);
INSERT INTO `d_route` VALUES (4712, '{\"lat\":\"30.77726\",\"lng\":\"103.85801\"}', 939, 1576726859);
INSERT INTO `d_route` VALUES (4713, '{\"lat\":\"30.77732\",\"lng\":\"103.85806\"}', 939, 1576726863);
INSERT INTO `d_route` VALUES (4714, '{\"lat\":\"30.77733\",\"lng\":\"103.85806\"}', 939, 1576726867);
INSERT INTO `d_route` VALUES (4715, '{\"lat\":\"30.77736\",\"lng\":\"103.85816\"}', 939, 1576726870);
INSERT INTO `d_route` VALUES (4716, '{\"lat\":\"30.77732\",\"lng\":\"103.85823\"}', 939, 1576726872);
INSERT INTO `d_route` VALUES (4717, '{\"lat\":\"30.77721\",\"lng\":\"103.85833\"}', 939, 1576726876);
INSERT INTO `d_route` VALUES (4718, '{\"lat\":\"30.77721\",\"lng\":\"103.85833\"}', 939, 1576726895);
INSERT INTO `d_route` VALUES (4719, '{\"lat\":\"30.77721\",\"lng\":\"103.85832\"}', 939, 1576726899);
INSERT INTO `d_route` VALUES (4720, '{\"lat\":\"30.77714\",\"lng\":\"103.85836\"}', 939, 1576726903);
INSERT INTO `d_route` VALUES (4721, '{\"lat\":\"30.77710\",\"lng\":\"103.85841\"}', 939, 1576726907);
INSERT INTO `d_route` VALUES (4722, '{\"lat\":\"30.77710\",\"lng\":\"103.85843\"}', 939, 1576726908);
INSERT INTO `d_route` VALUES (4723, '{\"lat\":\"30.77714\",\"lng\":\"103.85841\"}', 939, 1576726912);
INSERT INTO `d_route` VALUES (4724, '{\"lat\":\"30.77724\",\"lng\":\"103.85835\"}', 939, 1576726916);
INSERT INTO `d_route` VALUES (4725, '{\"lat\":\"30.77737\",\"lng\":\"103.85823\"}', 939, 1576726919);
INSERT INTO `d_route` VALUES (4726, '{\"lat\":\"30.77749\",\"lng\":\"103.85810\"}', 939, 1576726923);
INSERT INTO `d_route` VALUES (4727, '{\"lat\":\"30.77751\",\"lng\":\"103.85808\"}', 939, 1576726927);
INSERT INTO `d_route` VALUES (4728, '{\"lat\":\"30.77748\",\"lng\":\"103.85807\"}', 939, 1576726931);
INSERT INTO `d_route` VALUES (4729, '{\"lat\":\"30.77748\",\"lng\":\"103.85809\"}', 939, 1576726935);
INSERT INTO `d_route` VALUES (4730, '{\"lat\":\"30.77746\",\"lng\":\"103.85814\"}', 939, 1576726938);
INSERT INTO `d_route` VALUES (4731, '{\"lat\":30.777161729600696,\"lng\":103.85809543185763}', 940, 1576727032);
INSERT INTO `d_route` VALUES (4732, '{\"lat\":\"30.77750\",\"lng\":\"103.85821\"}', 940, 1576727034);
INSERT INTO `d_route` VALUES (4733, '{\"lat\":\"30.77751\",\"lng\":\"103.85820\"}', 940, 1576727038);
INSERT INTO `d_route` VALUES (4734, '{\"lat\":\"30.77751\",\"lng\":\"103.85820\"}', 940, 1576727048);
INSERT INTO `d_route` VALUES (4735, '{\"lat\":\"30.77747\",\"lng\":\"103.85818\"}', 940, 1576727049);
INSERT INTO `d_route` VALUES (4736, '{\"lat\":\"30.77742\",\"lng\":\"103.85817\"}', 940, 1576727050);
INSERT INTO `d_route` VALUES (4737, '{\"lat\":\"30.77736\",\"lng\":\"103.85818\"}', 940, 1576727061);
INSERT INTO `d_route` VALUES (4738, '{\"lat\":30.777161729600696,\"lng\":103.85809543185763}', 941, 1576727304);
INSERT INTO `d_route` VALUES (4739, '{\"lat\":32.96257,\"lng\":114.61912}', 935, 1576727330);
INSERT INTO `d_route` VALUES (4740, '{\"lat\":30.777269151475693,\"lng\":103.85789116753472}', 942, 1576727735);
INSERT INTO `d_route` VALUES (4741, '{\"lat\":32.94558810763889,\"lng\":114.64637912326388}', 943, 1576729025);
INSERT INTO `d_route` VALUES (4742, '{\"lat\":\"30.77718\",\"lng\":\"103.85793\"}', 943, 1576729034);
INSERT INTO `d_route` VALUES (4743, '{\"lat\":32.94565700954861,\"lng\":114.64633436414931}', 944, 1576729227);
INSERT INTO `d_route` VALUES (4744, '{\"lat\":\"30.77708\",\"lng\":\"103.85791\"}', 944, 1576729232);
INSERT INTO `d_route` VALUES (4745, '{\"lat\":32.94559597439236,\"lng\":114.6463511827257}', 945, 1576729309);
INSERT INTO `d_route` VALUES (4746, '{\"lat\":\"30.77719\",\"lng\":\"103.85805\"}', 945, 1576729363);
INSERT INTO `d_route` VALUES (4747, '{\"lat\":32.94559597439236,\"lng\":114.6463511827257}', 946, 1576729835);
INSERT INTO `d_route` VALUES (4748, '{\"lat\":\"30.77720\",\"lng\":\"103.85792\"}', 946, 1576729889);
INSERT INTO `d_route` VALUES (4749, '{\"lat\":\"30.77725\",\"lng\":\"103.85796\"}', 946, 1576729954);
INSERT INTO `d_route` VALUES (4750, '{\"lat\":\"30.77718\",\"lng\":\"103.85803\"}', 946, 1576730020);
INSERT INTO `d_route` VALUES (4751, '{\"lat\":\"30.77718\",\"lng\":\"103.85796\"}', 946, 1576730152);
INSERT INTO `d_route` VALUES (4752, '{\"lat\":\"30.77716\",\"lng\":\"103.85795\"}', 946, 1576730217);
INSERT INTO `d_route` VALUES (4753, '{\"lat\":\"30.77715\",\"lng\":\"103.85794\"}', 946, 1576730282);
INSERT INTO `d_route` VALUES (4754, '{\"lat\":32.96257,\"lng\":114.61912}', 947, 1576740716);
INSERT INTO `d_route` VALUES (4755, '{\"lat\":30.5515087890625,\"lng\":104.06449924045138}', 948, 1576740958);
INSERT INTO `d_route` VALUES (4756, '{\"lat\":32.96257,\"lng\":114.61912}', 949, 1576741049);
INSERT INTO `d_route` VALUES (4757, '{\"lat\":30.551592068142362,\"lng\":104.06413953993055}', 950, 1576741124);
INSERT INTO `d_route` VALUES (4758, '{\"lat\":30.551507432725696,\"lng\":104.06432183159723}', 951, 1576741256);
INSERT INTO `d_route` VALUES (4759, '{\"lat\":32.94567816840278,\"lng\":114.64639621310764}', 952, 1576741425);
INSERT INTO `d_route` VALUES (4760, '{\"lat\":32.94567816840278,\"lng\":114.64639621310764}', 953, 1576741459);
INSERT INTO `d_route` VALUES (4761, '{\"lat\":\"30.55129\",\"lng\":\"104.06476\"}', 951, 1576741531);
INSERT INTO `d_route` VALUES (4762, '{\"lat\":\"30.55118\",\"lng\":\"104.06492\"}', 951, 1576741597);
INSERT INTO `d_route` VALUES (4763, '{\"lat\":\"30.55116\",\"lng\":\"104.06488\"}', 951, 1576741633);
INSERT INTO `d_route` VALUES (4764, '{\"lat\":\"30.55117\",\"lng\":\"104.06478\"}', 951, 1576741646);
INSERT INTO `d_route` VALUES (4765, '{\"lat\":\"30.55118\",\"lng\":\"104.06474\"}', 951, 1576741650);
INSERT INTO `d_route` VALUES (4766, '{\"lat\":\"30.55121\",\"lng\":\"104.06466\"}', 951, 1576741661);
INSERT INTO `d_route` VALUES (4767, '{\"lat\":\"30.55121\",\"lng\":\"104.06466\"}', 951, 1576741664);
INSERT INTO `d_route` VALUES (4768, '{\"lat\":\"30.55153\",\"lng\":\"104.06454\"}', 951, 1576741676);
INSERT INTO `d_route` VALUES (4769, '{\"lat\":\"30.55169\",\"lng\":\"104.06424\"}', 951, 1576741686);
INSERT INTO `d_route` VALUES (4770, '{\"lat\":\"30.55170\",\"lng\":\"104.06418\"}', 951, 1576741687);
INSERT INTO `d_route` VALUES (4771, '{\"lat\":\"30.55172\",\"lng\":\"104.06413\"}', 951, 1576741690);
INSERT INTO `d_route` VALUES (4772, '{\"lat\":\"30.55173\",\"lng\":\"104.06412\"}', 951, 1576741696);
INSERT INTO `d_route` VALUES (4773, '{\"lat\":\"30.55173\",\"lng\":\"104.06409\"}', 951, 1576741706);
INSERT INTO `d_route` VALUES (4774, '{\"lat\":\"30.55175\",\"lng\":\"104.06409\"}', 951, 1576741712);
INSERT INTO `d_route` VALUES (4775, '{\"lat\":\"30.55175\",\"lng\":\"104.06409\"}', 951, 1576741714);
INSERT INTO `d_route` VALUES (4776, '{\"lat\":\"30.55175\",\"lng\":\"104.06408\"}', 951, 1576741717);
INSERT INTO `d_route` VALUES (4777, '{\"lat\":\"30.55169\",\"lng\":\"104.06405\"}', 951, 1576741720);
INSERT INTO `d_route` VALUES (4778, '{\"lat\":\"30.55164\",\"lng\":\"104.06405\"}', 951, 1576741723);
INSERT INTO `d_route` VALUES (4779, '{\"lat\":\"30.55166\",\"lng\":\"104.06408\"}', 951, 1576741726);
INSERT INTO `d_route` VALUES (4780, '{\"lat\":\"30.55164\",\"lng\":\"104.06407\"}', 951, 1576741732);
INSERT INTO `d_route` VALUES (4781, '{\"lat\":\"30.55166\",\"lng\":\"104.06412\"}', 951, 1576741733);
INSERT INTO `d_route` VALUES (4782, '{\"lat\":\"30.55165\",\"lng\":\"104.06410\"}', 951, 1576741737);
INSERT INTO `d_route` VALUES (4783, '{\"lat\":\"30.55165\",\"lng\":\"104.06407\"}', 951, 1576741739);
INSERT INTO `d_route` VALUES (4784, '{\"lat\":\"30.55170\",\"lng\":\"104.06409\"}', 951, 1576741762);
INSERT INTO `d_route` VALUES (4785, '{\"lat\":\"30.55170\",\"lng\":\"104.06409\"}', 951, 1576741765);
INSERT INTO `d_route` VALUES (4786, '{\"lat\":\"30.55171\",\"lng\":\"104.06408\"}', 951, 1576741771);
INSERT INTO `d_route` VALUES (4787, '{\"lat\":\"30.55170\",\"lng\":\"104.06408\"}', 951, 1576741776);
INSERT INTO `d_route` VALUES (4788, '{\"lat\":\"30.55171\",\"lng\":\"104.06408\"}', 951, 1576741780);
INSERT INTO `d_route` VALUES (4789, '{\"lat\":\"30.55171\",\"lng\":\"104.06408\"}', 951, 1576741783);
INSERT INTO `d_route` VALUES (4790, '{\"lat\":\"30.55171\",\"lng\":\"104.06407\"}', 951, 1576741788);
INSERT INTO `d_route` VALUES (4791, '{\"lat\":\"30.55171\",\"lng\":\"104.06407\"}', 951, 1576741789);
INSERT INTO `d_route` VALUES (4792, '{\"lat\":\"30.55171\",\"lng\":\"104.06407\"}', 951, 1576741793);
INSERT INTO `d_route` VALUES (4793, '{\"lat\":\"30.55224\",\"lng\":\"104.06438\"}', 951, 1576741857);
INSERT INTO `d_route` VALUES (4794, '{\"lat\":\"30.55202\",\"lng\":\"104.06458\"}', 951, 1576741923);
INSERT INTO `d_route` VALUES (4795, '{\"lat\":\"30.55197\",\"lng\":\"104.06456\"}', 951, 1576741977);
INSERT INTO `d_route` VALUES (4796, '{\"lat\":\"30.55197\",\"lng\":\"104.06455\"}', 951, 1576741980);
INSERT INTO `d_route` VALUES (4797, '{\"lat\":30.551366806030273,\"lng\":104.06439971923828}', 954, 1576742230);
INSERT INTO `d_route` VALUES (4798, '{\"lat\":\"30.55189\",\"lng\":\"104.06446\"}', 954, 1576742231);
INSERT INTO `d_route` VALUES (4799, '{\"lat\":\"30.55189\",\"lng\":\"104.06445\"}', 954, 1576742233);
INSERT INTO `d_route` VALUES (4800, '{\"lat\":\"30.55187\",\"lng\":\"104.06445\"}', 954, 1576742243);
INSERT INTO `d_route` VALUES (4801, '{\"lat\":\"30.55186\",\"lng\":\"104.06445\"}', 954, 1576742248);
INSERT INTO `d_route` VALUES (4802, '{\"lat\":\"30.55186\",\"lng\":\"104.06445\"}', 954, 1576742252);
INSERT INTO `d_route` VALUES (4803, '{\"lat\":\"30.55187\",\"lng\":\"104.06445\"}', 954, 1576742255);
INSERT INTO `d_route` VALUES (4804, '{\"lat\":\"30.55186\",\"lng\":\"104.06444\"}', 954, 1576742258);
INSERT INTO `d_route` VALUES (4805, '{\"lat\":\"30.55187\",\"lng\":\"104.06444\"}', 954, 1576742260);
INSERT INTO `d_route` VALUES (4806, '{\"lat\":\"30.55189\",\"lng\":\"104.06442\"}', 954, 1576742266);
INSERT INTO `d_route` VALUES (4807, '{\"lat\":\"30.55190\",\"lng\":\"104.06441\"}', 954, 1576742268);
INSERT INTO `d_route` VALUES (4808, '{\"lat\":\"30.55193\",\"lng\":\"104.06439\"}', 954, 1576742271);
INSERT INTO `d_route` VALUES (4809, '{\"lat\":\"30.55194\",\"lng\":\"104.06438\"}', 954, 1576742277);
INSERT INTO `d_route` VALUES (4810, '{\"lat\":\"30.55194\",\"lng\":\"104.06437\"}', 954, 1576742278);
INSERT INTO `d_route` VALUES (4811, '{\"lat\":\"30.55194\",\"lng\":\"104.06436\"}', 954, 1576742282);
INSERT INTO `d_route` VALUES (4812, '{\"lat\":\"30.55194\",\"lng\":\"104.06434\"}', 954, 1576742286);
INSERT INTO `d_route` VALUES (4813, '{\"lat\":\"30.55196\",\"lng\":\"104.06432\"}', 954, 1576742288);
INSERT INTO `d_route` VALUES (4814, '{\"lat\":\"30.55198\",\"lng\":\"104.06435\"}', 954, 1576742294);
INSERT INTO `d_route` VALUES (4815, '{\"lat\":\"30.55200\",\"lng\":\"104.06436\"}', 954, 1576742295);
INSERT INTO `d_route` VALUES (4816, '{\"lat\":\"30.55201\",\"lng\":\"104.06435\"}', 954, 1576742298);
INSERT INTO `d_route` VALUES (4817, '{\"lat\":\"30.55206\",\"lng\":\"104.06432\"}', 954, 1576742328);
INSERT INTO `d_route` VALUES (4818, '{\"lat\":\"30.55209\",\"lng\":\"104.06432\"}', 954, 1576742329);
INSERT INTO `d_route` VALUES (4819, '{\"lat\":\"30.55215\",\"lng\":\"104.06432\"}', 954, 1576742330);
INSERT INTO `d_route` VALUES (4820, '{\"lat\":\"30.55257\",\"lng\":\"104.06426\"}', 954, 1576742334);
INSERT INTO `d_route` VALUES (4821, '{\"lat\":\"30.55261\",\"lng\":\"104.06425\"}', 954, 1576742339);
INSERT INTO `d_route` VALUES (4822, '{\"lat\":\"30.55267\",\"lng\":\"104.06422\"}', 954, 1576742341);
INSERT INTO `d_route` VALUES (4823, '{\"lat\":\"30.55269\",\"lng\":\"104.06423\"}', 954, 1576742345);
INSERT INTO `d_route` VALUES (4824, '{\"lat\":\"30.55277\",\"lng\":\"104.06425\"}', 954, 1576742349);
INSERT INTO `d_route` VALUES (4825, '{\"lat\":\"30.55283\",\"lng\":\"104.06426\"}', 954, 1576742351);
INSERT INTO `d_route` VALUES (4826, '{\"lat\":\"30.55288\",\"lng\":\"104.06425\"}', 954, 1576742354);
INSERT INTO `d_route` VALUES (4827, '{\"lat\":\"30.55293\",\"lng\":\"104.06428\"}', 954, 1576742358);
INSERT INTO `d_route` VALUES (4828, '{\"lat\":\"30.55296\",\"lng\":\"104.06427\"}', 954, 1576742362);
INSERT INTO `d_route` VALUES (4829, '{\"lat\":30.552833557128906,\"lng\":104.06429290771484}', 955, 1576742451);
INSERT INTO `d_route` VALUES (4830, '{\"lat\":\"30.55315\",\"lng\":\"104.06443\"}', 955, 1576742452);
INSERT INTO `d_route` VALUES (4831, '{\"lat\":\"30.55315\",\"lng\":\"104.06443\"}', 955, 1576742455);
INSERT INTO `d_route` VALUES (4832, '{\"lat\":\"30.55316\",\"lng\":\"104.06443\"}', 955, 1576742461);
INSERT INTO `d_route` VALUES (4833, '{\"lat\":\"30.55315\",\"lng\":\"104.06443\"}', 955, 1576742467);
INSERT INTO `d_route` VALUES (4834, '{\"lat\":\"30.55315\",\"lng\":\"104.06443\"}', 955, 1576742468);
INSERT INTO `d_route` VALUES (4835, '{\"lat\":\"30.55315\",\"lng\":\"104.06444\"}', 955, 1576742471);
INSERT INTO `d_route` VALUES (4836, '{\"lat\":\"30.55314\",\"lng\":\"104.06444\"}', 955, 1576742474);
INSERT INTO `d_route` VALUES (4837, '{\"lat\":\"30.55317\",\"lng\":\"104.06453\"}', 955, 1576742478);
INSERT INTO `d_route` VALUES (4838, '{\"lat\":\"30.55319\",\"lng\":\"104.06456\"}', 955, 1576742481);
INSERT INTO `d_route` VALUES (4839, '{\"lat\":\"30.55323\",\"lng\":\"104.06469\"}', 955, 1576742487);
INSERT INTO `d_route` VALUES (4840, '{\"lat\":\"30.55324\",\"lng\":\"104.06473\"}', 955, 1576742489);
INSERT INTO `d_route` VALUES (4841, '{\"lat\":\"30.55324\",\"lng\":\"104.06479\"}', 955, 1576742492);
INSERT INTO `d_route` VALUES (4842, '{\"lat\":\"30.55325\",\"lng\":\"104.06483\"}', 955, 1576742496);
INSERT INTO `d_route` VALUES (4843, '{\"lat\":\"30.55325\",\"lng\":\"104.06481\"}', 955, 1576742498);
INSERT INTO `d_route` VALUES (4844, '{\"lat\":\"30.55323\",\"lng\":\"104.06483\"}', 955, 1576742504);
INSERT INTO `d_route` VALUES (4845, '{\"lat\":\"30.55322\",\"lng\":\"104.06483\"}', 955, 1576742505);
INSERT INTO `d_route` VALUES (4846, '{\"lat\":\"30.55320\",\"lng\":\"104.06483\"}', 955, 1576742518);
INSERT INTO `d_route` VALUES (4847, '{\"lat\":\"30.55320\",\"lng\":\"104.06487\"}', 955, 1576742519);
INSERT INTO `d_route` VALUES (4848, '{\"lat\":\"30.55321\",\"lng\":\"104.06496\"}', 955, 1576742521);
INSERT INTO `d_route` VALUES (4849, '{\"lat\":\"30.55321\",\"lng\":\"104.06500\"}', 955, 1576742522);
INSERT INTO `d_route` VALUES (4850, '{\"lat\":\"30.55322\",\"lng\":\"104.06506\"}', 955, 1576742524);
INSERT INTO `d_route` VALUES (4851, '{\"lat\":\"30.55321\",\"lng\":\"104.06512\"}', 955, 1576742528);
INSERT INTO `d_route` VALUES (4852, '{\"lat\":\"30.55322\",\"lng\":\"104.06534\"}', 955, 1576742539);
INSERT INTO `d_route` VALUES (4853, '{\"lat\":\"30.55321\",\"lng\":\"104.06535\"}', 955, 1576742542);
INSERT INTO `d_route` VALUES (4854, '{\"lat\":\"30.55322\",\"lng\":\"104.06537\"}', 955, 1576742552);
INSERT INTO `d_route` VALUES (4855, '{\"lat\":\"30.55322\",\"lng\":\"104.06536\"}', 955, 1576742562);
INSERT INTO `d_route` VALUES (4856, '{\"lat\":\"30.55322\",\"lng\":\"104.06537\"}', 955, 1576742563);
INSERT INTO `d_route` VALUES (4857, '{\"lat\":\"30.55325\",\"lng\":\"104.06530\"}', 955, 1576742598);
INSERT INTO `d_route` VALUES (4858, '{\"lat\":\"30.55319\",\"lng\":\"104.06527\"}', 955, 1576742599);
INSERT INTO `d_route` VALUES (4859, '{\"lat\":\"30.55308\",\"lng\":\"104.06526\"}', 955, 1576742602);
INSERT INTO `d_route` VALUES (4860, '{\"lat\":\"30.55302\",\"lng\":\"104.06526\"}', 955, 1576742612);
INSERT INTO `d_route` VALUES (4861, '{\"lat\":\"30.55297\",\"lng\":\"104.06526\"}', 955, 1576742628);
INSERT INTO `d_route` VALUES (4862, '{\"lat\":\"30.55296\",\"lng\":\"104.06525\"}', 955, 1576742647);
INSERT INTO `d_route` VALUES (4863, '{\"lat\":\"30.55295\",\"lng\":\"104.06524\"}', 955, 1576742648);
INSERT INTO `d_route` VALUES (4864, '{\"lat\":\"30.55294\",\"lng\":\"104.06523\"}', 955, 1576742650);
INSERT INTO `d_route` VALUES (4865, '{\"lat\":\"30.55293\",\"lng\":\"104.06516\"}', 955, 1576742665);
INSERT INTO `d_route` VALUES (4866, '{\"lat\":\"30.55297\",\"lng\":\"104.06509\"}', 955, 1576742675);
INSERT INTO `d_route` VALUES (4867, '{\"lat\":\"30.55299\",\"lng\":\"104.06507\"}', 955, 1576742677);
INSERT INTO `d_route` VALUES (4868, '{\"lat\":\"30.55301\",\"lng\":\"104.06504\"}', 955, 1576742680);
INSERT INTO `d_route` VALUES (4869, '{\"lat\":\"30.55304\",\"lng\":\"104.06500\"}', 955, 1576742691);
INSERT INTO `d_route` VALUES (4870, '{\"lat\":\"30.55304\",\"lng\":\"104.06500\"}', 955, 1576742692);
INSERT INTO `d_route` VALUES (4871, '{\"lat\":\"30.55304\",\"lng\":\"104.06499\"}', 955, 1576742708);
INSERT INTO `d_route` VALUES (4872, '{\"lat\":\"30.55305\",\"lng\":\"104.06499\"}', 955, 1576742709);
INSERT INTO `d_route` VALUES (4873, '{\"lat\":\"30.55305\",\"lng\":\"104.06499\"}', 955, 1576742710);
INSERT INTO `d_route` VALUES (4874, '{\"lat\":\"30.55307\",\"lng\":\"104.06488\"}', 955, 1576742712);
INSERT INTO `d_route` VALUES (4875, '{\"lat\":\"30.55307\",\"lng\":\"104.06482\"}', 955, 1576742713);
INSERT INTO `d_route` VALUES (4876, '{\"lat\":\"30.55307\",\"lng\":\"104.06477\"}', 955, 1576742714);
INSERT INTO `d_route` VALUES (4877, '{\"lat\":\"30.55307\",\"lng\":\"104.06466\"}', 955, 1576742716);
INSERT INTO `d_route` VALUES (4878, '{\"lat\":\"30.55333\",\"lng\":\"104.06434\"}', 955, 1576742843);
INSERT INTO `d_route` VALUES (4879, '{\"lat\":\"30.55333\",\"lng\":\"104.06434\"}', 955, 1576742847);
INSERT INTO `d_route` VALUES (4880, '{\"lat\":\"30.55333\",\"lng\":\"104.06433\"}', 955, 1576742849);
INSERT INTO `d_route` VALUES (4881, '{\"lat\":\"30.55330\",\"lng\":\"104.06435\"}', 955, 1576742875);
INSERT INTO `d_route` VALUES (4882, '{\"lat\":\"30.55329\",\"lng\":\"104.06436\"}', 955, 1576742880);
INSERT INTO `d_route` VALUES (4883, '{\"lat\":\"30.55328\",\"lng\":\"104.06435\"}', 955, 1576742882);
INSERT INTO `d_route` VALUES (4884, '{\"lat\":\"30.55324\",\"lng\":\"104.06432\"}', 955, 1576742886);
INSERT INTO `d_route` VALUES (4885, '{\"lat\":\"30.55322\",\"lng\":\"104.06430\"}', 955, 1576742889);
INSERT INTO `d_route` VALUES (4886, '{\"lat\":\"30.55318\",\"lng\":\"104.06422\"}', 955, 1576742893);
INSERT INTO `d_route` VALUES (4887, '{\"lat\":\"30.55318\",\"lng\":\"104.06415\"}', 955, 1576742895);
INSERT INTO `d_route` VALUES (4888, '{\"lat\":\"30.55313\",\"lng\":\"104.06404\"}', 955, 1576742904);
INSERT INTO `d_route` VALUES (4889, '{\"lat\":\"30.55312\",\"lng\":\"104.06395\"}', 955, 1576742906);
INSERT INTO `d_route` VALUES (4890, '{\"lat\":\"30.55314\",\"lng\":\"104.06371\"}', 955, 1576742911);
INSERT INTO `d_route` VALUES (4891, '{\"lat\":\"30.55316\",\"lng\":\"104.06363\"}', 955, 1576742913);
INSERT INTO `d_route` VALUES (4892, '{\"lat\":\"30.55316\",\"lng\":\"104.06353\"}', 955, 1576742916);
INSERT INTO `d_route` VALUES (4893, '{\"lat\":\"30.55316\",\"lng\":\"104.06349\"}', 955, 1576742919);
INSERT INTO `d_route` VALUES (4894, '{\"lat\":\"30.55315\",\"lng\":\"104.06344\"}', 955, 1576742932);
INSERT INTO `d_route` VALUES (4895, '{\"lat\":\"30.55314\",\"lng\":\"104.06342\"}', 955, 1576742936);
INSERT INTO `d_route` VALUES (4896, '{\"lat\":\"30.55312\",\"lng\":\"104.06328\"}', 955, 1576742963);
INSERT INTO `d_route` VALUES (4897, '{\"lat\":\"30.55313\",\"lng\":\"104.06327\"}', 955, 1576742971);
INSERT INTO `d_route` VALUES (4898, '{\"lat\":\"30.55314\",\"lng\":\"104.06330\"}', 955, 1576742977);
INSERT INTO `d_route` VALUES (4899, '{\"lat\":\"30.55314\",\"lng\":\"104.06328\"}', 955, 1576742979);
INSERT INTO `d_route` VALUES (4900, '{\"lat\":\"30.55313\",\"lng\":\"104.06317\"}', 955, 1576742995);
INSERT INTO `d_route` VALUES (4901, '{\"lat\":\"30.55320\",\"lng\":\"104.06314\"}', 955, 1576743000);
INSERT INTO `d_route` VALUES (4902, '{\"lat\":\"30.55328\",\"lng\":\"104.06314\"}', 955, 1576743002);
INSERT INTO `d_route` VALUES (4903, '{\"lat\":\"30.55330\",\"lng\":\"104.06313\"}', 955, 1576743005);
INSERT INTO `d_route` VALUES (4904, '{\"lat\":\"30.55328\",\"lng\":\"104.06311\"}', 955, 1576743011);
INSERT INTO `d_route` VALUES (4905, '{\"lat\":\"30.55327\",\"lng\":\"104.06311\"}', 955, 1576743013);
INSERT INTO `d_route` VALUES (4906, '{\"lat\":\"30.55329\",\"lng\":\"104.06309\"}', 955, 1576743020);
INSERT INTO `d_route` VALUES (4907, '{\"lat\":\"30.55334\",\"lng\":\"104.06309\"}', 955, 1576743022);
INSERT INTO `d_route` VALUES (4908, '{\"lat\":\"30.55345\",\"lng\":\"104.06304\"}', 955, 1576743023);
INSERT INTO `d_route` VALUES (4909, '{\"lat\":\"30.55356\",\"lng\":\"104.06301\"}', 955, 1576743026);
INSERT INTO `d_route` VALUES (4910, '{\"lat\":\"30.55370\",\"lng\":\"104.06295\"}', 955, 1576743031);
INSERT INTO `d_route` VALUES (4911, '{\"lat\":\"30.55375\",\"lng\":\"104.06295\"}', 955, 1576743033);
INSERT INTO `d_route` VALUES (4912, '{\"lat\":\"30.55385\",\"lng\":\"104.06289\"}', 955, 1576743044);
INSERT INTO `d_route` VALUES (4913, '{\"lat\":\"30.55393\",\"lng\":\"104.06282\"}', 955, 1576743045);
INSERT INTO `d_route` VALUES (4914, '{\"lat\":\"30.55401\",\"lng\":\"104.06276\"}', 955, 1576743046);
INSERT INTO `d_route` VALUES (4915, '{\"lat\":\"30.55405\",\"lng\":\"104.06272\"}', 955, 1576743048);
INSERT INTO `d_route` VALUES (4916, '{\"lat\":\"30.55410\",\"lng\":\"104.06280\"}', 955, 1576743050);
INSERT INTO `d_route` VALUES (4917, '{\"lat\":\"30.55424\",\"lng\":\"104.06306\"}', 955, 1576743061);
INSERT INTO `d_route` VALUES (4918, '{\"lat\":\"30.55427\",\"lng\":\"104.06305\"}', 955, 1576743065);
INSERT INTO `d_route` VALUES (4919, '{\"lat\":\"30.55429\",\"lng\":\"104.06305\"}', 955, 1576743067);
INSERT INTO `d_route` VALUES (4920, '{\"lat\":\"30.55441\",\"lng\":\"104.06308\"}', 955, 1576743084);
INSERT INTO `d_route` VALUES (4921, '{\"lat\":\"30.55462\",\"lng\":\"104.06330\"}', 955, 1576743097);
INSERT INTO `d_route` VALUES (4922, '{\"lat\":\"30.55463\",\"lng\":\"104.06331\"}', 955, 1576743098);
INSERT INTO `d_route` VALUES (4923, '{\"lat\":\"30.55472\",\"lng\":\"104.06340\"}', 955, 1576743109);
INSERT INTO `d_route` VALUES (4924, '{\"lat\":\"30.55480\",\"lng\":\"104.06348\"}', 955, 1576743120);
INSERT INTO `d_route` VALUES (4925, '{\"lat\":\"30.55483\",\"lng\":\"104.06352\"}', 955, 1576743122);
INSERT INTO `d_route` VALUES (4926, '{\"lat\":\"30.55482\",\"lng\":\"104.06361\"}', 955, 1576743133);
INSERT INTO `d_route` VALUES (4927, '{\"lat\":\"30.55482\",\"lng\":\"104.06362\"}', 955, 1576743134);
INSERT INTO `d_route` VALUES (4928, '{\"lat\":\"30.55490\",\"lng\":\"104.06366\"}', 955, 1576743135);
INSERT INTO `d_route` VALUES (4929, '{\"lat\":\"30.55486\",\"lng\":\"104.06376\"}', 955, 1576743145);
INSERT INTO `d_route` VALUES (4930, '{\"lat\":\"30.55474\",\"lng\":\"104.06381\"}', 955, 1576743156);
INSERT INTO `d_route` VALUES (4931, '{\"lat\":\"30.55474\",\"lng\":\"104.06381\"}', 955, 1576743158);
INSERT INTO `d_route` VALUES (4932, '{\"lat\":\"30.55477\",\"lng\":\"104.06393\"}', 955, 1576743169);
INSERT INTO `d_route` VALUES (4933, '{\"lat\":\"30.55474\",\"lng\":\"104.06406\"}', 955, 1576743179);
INSERT INTO `d_route` VALUES (4934, '{\"lat\":\"30.55474\",\"lng\":\"104.06407\"}', 955, 1576743180);
INSERT INTO `d_route` VALUES (4935, '{\"lat\":\"30.55472\",\"lng\":\"104.06419\"}', 955, 1576743192);
INSERT INTO `d_route` VALUES (4936, '{\"lat\":\"30.55465\",\"lng\":\"104.06503\"}', 955, 1576743255);
INSERT INTO `d_route` VALUES (4937, '{\"lat\":\"30.55465\",\"lng\":\"104.06502\"}', 955, 1576743268);
INSERT INTO `d_route` VALUES (4938, '{\"lat\":\"30.55464\",\"lng\":\"104.06503\"}', 955, 1576743270);
INSERT INTO `d_route` VALUES (4939, '{\"lat\":\"30.55460\",\"lng\":\"104.06506\"}', 955, 1576743280);
INSERT INTO `d_route` VALUES (4940, '{\"lat\":\"30.55459\",\"lng\":\"104.06506\"}', 955, 1576743282);
INSERT INTO `d_route` VALUES (4941, '{\"lat\":\"30.55456\",\"lng\":\"104.06506\"}', 955, 1576743293);
INSERT INTO `d_route` VALUES (4942, '{\"lat\":\"30.55455\",\"lng\":\"104.06507\"}', 955, 1576743295);
INSERT INTO `d_route` VALUES (4943, '{\"lat\":\"30.55452\",\"lng\":\"104.06512\"}', 955, 1576743306);
INSERT INTO `d_route` VALUES (4944, '{\"lat\":\"30.55453\",\"lng\":\"104.06514\"}', 955, 1576743308);
INSERT INTO `d_route` VALUES (4945, '{\"lat\":\"30.55452\",\"lng\":\"104.06521\"}', 955, 1576743319);
INSERT INTO `d_route` VALUES (4946, '{\"lat\":\"30.55450\",\"lng\":\"104.06523\"}', 955, 1576743332);
INSERT INTO `d_route` VALUES (4947, '{\"lat\":\"30.55449\",\"lng\":\"104.06524\"}', 955, 1576743334);
INSERT INTO `d_route` VALUES (4948, '{\"lat\":\"30.55446\",\"lng\":\"104.06535\"}', 955, 1576743346);
INSERT INTO `d_route` VALUES (4949, '{\"lat\":\"30.55444\",\"lng\":\"104.06538\"}', 955, 1576743355);
INSERT INTO `d_route` VALUES (4950, '{\"lat\":\"30.55443\",\"lng\":\"104.06540\"}', 955, 1576743368);
INSERT INTO `d_route` VALUES (4951, '{\"lat\":\"30.55442\",\"lng\":\"104.06540\"}', 955, 1576743371);
INSERT INTO `d_route` VALUES (4952, '{\"lat\":\"30.55440\",\"lng\":\"104.06542\"}', 955, 1576743381);
INSERT INTO `d_route` VALUES (4953, '{\"lat\":\"30.55437\",\"lng\":\"104.06542\"}', 955, 1576743383);
INSERT INTO `d_route` VALUES (4954, '{\"lat\":\"30.55431\",\"lng\":\"104.06544\"}', 955, 1576743394);
INSERT INTO `d_route` VALUES (4955, '{\"lat\":\"30.55429\",\"lng\":\"104.06543\"}', 955, 1576743396);
INSERT INTO `d_route` VALUES (4956, '{\"lat\":\"30.55414\",\"lng\":\"104.06532\"}', 955, 1576743406);
INSERT INTO `d_route` VALUES (4957, '{\"lat\":\"30.55405\",\"lng\":\"104.06525\"}', 955, 1576743409);
INSERT INTO `d_route` VALUES (4958, '{\"lat\":\"30.55388\",\"lng\":\"104.06521\"}', 955, 1576743419);
INSERT INTO `d_route` VALUES (4959, '{\"lat\":\"30.55387\",\"lng\":\"104.06520\"}', 955, 1576743421);
INSERT INTO `d_route` VALUES (4960, '{\"lat\":\"30.55377\",\"lng\":\"104.06517\"}', 955, 1576743432);
INSERT INTO `d_route` VALUES (4961, '{\"lat\":\"30.55370\",\"lng\":\"104.06509\"}', 955, 1576743444);
INSERT INTO `d_route` VALUES (4962, '{\"lat\":\"30.55369\",\"lng\":\"104.06507\"}', 955, 1576743447);
INSERT INTO `d_route` VALUES (4963, '{\"lat\":\"30.55360\",\"lng\":\"104.06495\"}', 955, 1576743458);
INSERT INTO `d_route` VALUES (4964, '{\"lat\":\"30.55348\",\"lng\":\"104.06488\"}', 955, 1576743469);
INSERT INTO `d_route` VALUES (4965, '{\"lat\":\"30.55346\",\"lng\":\"104.06487\"}', 955, 1576743471);
INSERT INTO `d_route` VALUES (4966, '{\"lat\":\"30.55341\",\"lng\":\"104.06484\"}', 955, 1576743472);
INSERT INTO `d_route` VALUES (4967, '{\"lat\":\"30.55330\",\"lng\":\"104.06477\"}', 955, 1576743475);
INSERT INTO `d_route` VALUES (4968, '{\"lat\":\"30.55321\",\"lng\":\"104.06472\"}', 955, 1576743478);
INSERT INTO `d_route` VALUES (4969, '{\"lat\":\"30.55303\",\"lng\":\"104.06467\"}', 955, 1576743506);
INSERT INTO `d_route` VALUES (4970, '{\"lat\":\"30.55302\",\"lng\":\"104.06466\"}', 955, 1576743511);
INSERT INTO `d_route` VALUES (4971, '{\"lat\":\"30.55301\",\"lng\":\"104.06463\"}', 955, 1576743512);
INSERT INTO `d_route` VALUES (4972, '{\"lat\":\"30.55301\",\"lng\":\"104.06457\"}', 955, 1576743517);
INSERT INTO `d_route` VALUES (4973, '{\"lat\":\"30.55302\",\"lng\":\"104.06453\"}', 955, 1576743519);
INSERT INTO `d_route` VALUES (4974, '{\"lat\":\"30.55304\",\"lng\":\"104.06441\"}', 955, 1576743523);
INSERT INTO `d_route` VALUES (4975, '{\"lat\":\"30.55304\",\"lng\":\"104.06436\"}', 955, 1576743526);
INSERT INTO `d_route` VALUES (4976, '{\"lat\":\"30.55304\",\"lng\":\"104.06423\"}', 955, 1576743530);
INSERT INTO `d_route` VALUES (4977, '{\"lat\":\"30.55304\",\"lng\":\"104.06411\"}', 955, 1576743534);
INSERT INTO `d_route` VALUES (4978, '{\"lat\":\"30.55302\",\"lng\":\"104.06394\"}', 955, 1576743537);
INSERT INTO `d_route` VALUES (4979, '{\"lat\":\"30.55301\",\"lng\":\"104.06382\"}', 955, 1576743540);
INSERT INTO `d_route` VALUES (4980, '{\"lat\":\"30.55298\",\"lng\":\"104.06372\"}', 955, 1576743545);
INSERT INTO `d_route` VALUES (4981, '{\"lat\":\"30.55294\",\"lng\":\"104.06368\"}', 955, 1576743547);
INSERT INTO `d_route` VALUES (4982, '{\"lat\":\"30.55292\",\"lng\":\"104.06368\"}', 955, 1576743551);
INSERT INTO `d_route` VALUES (4983, '{\"lat\":\"30.55286\",\"lng\":\"104.06367\"}', 955, 1576743554);
INSERT INTO `d_route` VALUES (4984, '{\"lat\":\"30.55286\",\"lng\":\"104.06365\"}', 955, 1576743559);
INSERT INTO `d_route` VALUES (4985, '{\"lat\":\"30.55285\",\"lng\":\"104.06363\"}', 955, 1576743563);
INSERT INTO `d_route` VALUES (4986, '{\"lat\":\"30.55284\",\"lng\":\"104.06359\"}', 955, 1576743569);
INSERT INTO `d_route` VALUES (4987, '{\"lat\":\"30.55280\",\"lng\":\"104.06354\"}', 955, 1576743571);
INSERT INTO `d_route` VALUES (4988, '{\"lat\":\"30.55272\",\"lng\":\"104.06363\"}', 955, 1576743572);
INSERT INTO `d_route` VALUES (4989, '{\"lat\":\"30.55273\",\"lng\":\"104.06374\"}', 955, 1576743576);
INSERT INTO `d_route` VALUES (4990, '{\"lat\":\"30.55277\",\"lng\":\"104.06387\"}', 955, 1576743579);
INSERT INTO `d_route` VALUES (4991, '{\"lat\":\"30.55282\",\"lng\":\"104.06403\"}', 955, 1576743583);
INSERT INTO `d_route` VALUES (4992, '{\"lat\":\"30.55285\",\"lng\":\"104.06418\"}', 955, 1576743586);
INSERT INTO `d_route` VALUES (4993, '{\"lat\":\"30.55287\",\"lng\":\"104.06427\"}', 955, 1576743590);
INSERT INTO `d_route` VALUES (4994, '{\"lat\":\"30.55293\",\"lng\":\"104.06447\"}', 955, 1576743593);
INSERT INTO `d_route` VALUES (4995, '{\"lat\":\"30.55298\",\"lng\":\"104.06448\"}', 955, 1576743599);
INSERT INTO `d_route` VALUES (4996, '{\"lat\":\"30.55300\",\"lng\":\"104.06448\"}', 955, 1576743600);
INSERT INTO `d_route` VALUES (4997, '{\"lat\":\"30.55314\",\"lng\":\"104.06419\"}', 955, 1576743669);
INSERT INTO `d_route` VALUES (4998, '{\"lat\":\"30.55325\",\"lng\":\"104.06414\"}', 955, 1576743671);
INSERT INTO `d_route` VALUES (4999, '{\"lat\":\"30.55379\",\"lng\":\"104.06462\"}', 955, 1576743673);
INSERT INTO `d_route` VALUES (5000, '{\"lat\":\"30.55345\",\"lng\":\"104.06456\"}', 955, 1576743681);
INSERT INTO `d_route` VALUES (5001, '{\"lat\":\"30.55334\",\"lng\":\"104.06446\"}', 955, 1576743683);
INSERT INTO `d_route` VALUES (5002, '{\"lat\":\"30.55329\",\"lng\":\"104.06437\"}', 955, 1576743685);
INSERT INTO `d_route` VALUES (5003, '{\"lat\":\"30.55320\",\"lng\":\"104.06427\"}', 955, 1576743686);
INSERT INTO `d_route` VALUES (5004, '{\"lat\":\"30.55321\",\"lng\":\"104.06428\"}', 955, 1576743689);
INSERT INTO `d_route` VALUES (5005, '{\"lat\":\"30.55323\",\"lng\":\"104.06427\"}', 955, 1576743696);
INSERT INTO `d_route` VALUES (5006, '{\"lat\":\"30.55324\",\"lng\":\"104.06429\"}', 955, 1576743758);
INSERT INTO `d_route` VALUES (5007, '{\"lat\":\"30.55326\",\"lng\":\"104.06425\"}', 955, 1576743822);
INSERT INTO `d_route` VALUES (5008, '{\"lat\":\"30.55328\",\"lng\":\"104.06429\"}', 955, 1576743868);
INSERT INTO `d_route` VALUES (5009, '{\"lat\":\"30.55328\",\"lng\":\"104.06430\"}', 955, 1576743871);
INSERT INTO `d_route` VALUES (5010, '{\"lat\":\"30.55328\",\"lng\":\"104.06430\"}', 955, 1576743879);
INSERT INTO `d_route` VALUES (5011, '{\"lat\":\"30.55326\",\"lng\":\"104.06430\"}', 955, 1576743880);
INSERT INTO `d_route` VALUES (5012, '{\"lat\":\"30.55325\",\"lng\":\"104.06445\"}', 955, 1576743881);
INSERT INTO `d_route` VALUES (5013, '{\"lat\":\"30.55331\",\"lng\":\"104.06456\"}', 955, 1576743887);
INSERT INTO `d_route` VALUES (5014, '{\"lat\":\"30.55331\",\"lng\":\"104.06463\"}', 955, 1576743891);
INSERT INTO `d_route` VALUES (5015, '{\"lat\":\"30.55328\",\"lng\":\"104.06467\"}', 955, 1576743894);
INSERT INTO `d_route` VALUES (5016, '{\"lat\":\"30.55327\",\"lng\":\"104.06468\"}', 955, 1576743896);
INSERT INTO `d_route` VALUES (5017, '{\"lat\":\"30.55300\",\"lng\":\"104.06485\"}', 955, 1576743965);
INSERT INTO `d_route` VALUES (5018, '{\"lat\":\"30.55299\",\"lng\":\"104.06485\"}', 955, 1576743966);
INSERT INTO `d_route` VALUES (5019, '{\"lat\":\"30.55298\",\"lng\":\"104.06486\"}', 955, 1576743972);
INSERT INTO `d_route` VALUES (5020, '{\"lat\":\"30.55299\",\"lng\":\"104.06487\"}', 955, 1576743984);
INSERT INTO `d_route` VALUES (5021, '{\"lat\":\"30.55299\",\"lng\":\"104.06490\"}', 955, 1576743985);
INSERT INTO `d_route` VALUES (5022, '{\"lat\":\"30.55300\",\"lng\":\"104.06493\"}', 955, 1576743996);
INSERT INTO `d_route` VALUES (5023, '{\"lat\":\"30.55302\",\"lng\":\"104.06493\"}', 955, 1576743997);
INSERT INTO `d_route` VALUES (5024, '{\"lat\":\"30.55295\",\"lng\":\"104.06497\"}', 955, 1576744046);
INSERT INTO `d_route` VALUES (5025, '{\"lat\":\"30.55289\",\"lng\":\"104.06497\"}', 955, 1576744072);
INSERT INTO `d_route` VALUES (5026, '{\"lat\":\"30.55288\",\"lng\":\"104.06495\"}', 955, 1576744092);
INSERT INTO `d_route` VALUES (5027, '{\"lat\":\"30.55289\",\"lng\":\"104.06482\"}', 955, 1576744095);
INSERT INTO `d_route` VALUES (5028, '{\"lat\":\"30.55290\",\"lng\":\"104.06469\"}', 955, 1576744096);
INSERT INTO `d_route` VALUES (5029, '{\"lat\":\"30.55304\",\"lng\":\"104.06440\"}', 955, 1576744109);
INSERT INTO `d_route` VALUES (5030, '{\"lat\":\"30.55305\",\"lng\":\"104.06439\"}', 955, 1576744117);
INSERT INTO `d_route` VALUES (5031, '{\"lat\":\"30.55307\",\"lng\":\"104.06438\"}', 955, 1576744119);
INSERT INTO `d_route` VALUES (5032, '{\"lat\":\"30.55312\",\"lng\":\"104.06434\"}', 955, 1576744126);
INSERT INTO `d_route` VALUES (5033, '{\"lat\":\"30.55314\",\"lng\":\"104.06433\"}', 955, 1576744130);
INSERT INTO `d_route` VALUES (5034, '{\"lat\":\"30.55317\",\"lng\":\"104.06431\"}', 955, 1576744137);
INSERT INTO `d_route` VALUES (5035, '{\"lat\":\"30.55318\",\"lng\":\"104.06431\"}', 955, 1576744147);
INSERT INTO `d_route` VALUES (5036, '{\"lat\":\"30.55323\",\"lng\":\"104.06430\"}', 955, 1576744173);
INSERT INTO `d_route` VALUES (5037, '{\"lat\":\"30.55324\",\"lng\":\"104.06430\"}', 955, 1576744177);
INSERT INTO `d_route` VALUES (5038, '{\"lat\":\"30.55325\",\"lng\":\"104.06430\"}', 955, 1576744180);
INSERT INTO `d_route` VALUES (5039, '{\"lat\":\"30.55320\",\"lng\":\"104.06436\"}', 955, 1576744183);
INSERT INTO `d_route` VALUES (5040, '{\"lat\":\"30.55318\",\"lng\":\"104.06446\"}', 955, 1576744186);
INSERT INTO `d_route` VALUES (5041, '{\"lat\":\"30.55318\",\"lng\":\"104.06461\"}', 955, 1576744189);
INSERT INTO `d_route` VALUES (5042, '{\"lat\":\"30.55321\",\"lng\":\"104.06464\"}', 955, 1576744196);
INSERT INTO `d_route` VALUES (5043, '{\"lat\":\"30.55322\",\"lng\":\"104.06467\"}', 955, 1576744199);
INSERT INTO `d_route` VALUES (5044, '{\"lat\":\"30.55323\",\"lng\":\"104.06469\"}', 955, 1576744243);
INSERT INTO `d_route` VALUES (5045, '{\"lat\":\"30.55322\",\"lng\":\"104.06471\"}', 955, 1576744245);
INSERT INTO `d_route` VALUES (5046, '{\"lat\":\"30.55321\",\"lng\":\"104.06468\"}', 955, 1576744249);
INSERT INTO `d_route` VALUES (5047, '{\"lat\":\"30.55326\",\"lng\":\"104.06462\"}', 955, 1576744251);
INSERT INTO `d_route` VALUES (5048, '{\"lat\":\"30.55328\",\"lng\":\"104.06453\"}', 955, 1576744256);
INSERT INTO `d_route` VALUES (5049, '{\"lat\":\"30.55324\",\"lng\":\"104.06449\"}', 955, 1576744260);
INSERT INTO `d_route` VALUES (5050, '{\"lat\":\"30.55327\",\"lng\":\"104.06447\"}', 955, 1576744262);
INSERT INTO `d_route` VALUES (5051, '{\"lat\":\"30.55329\",\"lng\":\"104.06437\"}', 955, 1576744288);
INSERT INTO `d_route` VALUES (5052, '{\"lat\":\"30.55328\",\"lng\":\"104.06435\"}', 955, 1576744292);
INSERT INTO `d_route` VALUES (5053, '{\"lat\":\"30.55328\",\"lng\":\"104.06436\"}', 955, 1576744295);
INSERT INTO `d_route` VALUES (5054, '{\"lat\":\"30.55329\",\"lng\":\"104.06447\"}', 955, 1576744298);
INSERT INTO `d_route` VALUES (5055, '{\"lat\":\"30.55335\",\"lng\":\"104.06466\"}', 955, 1576744303);
INSERT INTO `d_route` VALUES (5056, '{\"lat\":\"30.55335\",\"lng\":\"104.06481\"}', 955, 1576744306);
INSERT INTO `d_route` VALUES (5057, '{\"lat\":\"30.55334\",\"lng\":\"104.06485\"}', 955, 1576744309);
INSERT INTO `d_route` VALUES (5058, '{\"lat\":\"30.55321\",\"lng\":\"104.06478\"}', 955, 1576744378);
INSERT INTO `d_route` VALUES (5059, '{\"lat\":\"30.55321\",\"lng\":\"104.06478\"}', 955, 1576744424);
INSERT INTO `d_route` VALUES (5060, '{\"lat\":\"30.55288\",\"lng\":\"104.06438\"}', 955, 1576744595);
INSERT INTO `d_route` VALUES (5061, '{\"lat\":\"30.55292\",\"lng\":\"104.06437\"}', 955, 1576744654);
INSERT INTO `d_route` VALUES (5062, '{\"lat\":30.552818298339844,\"lng\":104.06429290771484}', 956, 1576744720);
INSERT INTO `d_route` VALUES (5063, '{\"lat\":\"30.55291\",\"lng\":\"104.06436\"}', 956, 1576744722);
INSERT INTO `d_route` VALUES (5064, '{\"lat\":\"30.55291\",\"lng\":\"104.06436\"}', 956, 1576744727);
INSERT INTO `d_route` VALUES (5065, '{\"lat\":\"30.55291\",\"lng\":\"104.06436\"}', 956, 1576744729);
INSERT INTO `d_route` VALUES (5066, '{\"lat\":\"30.55291\",\"lng\":\"104.06436\"}', 956, 1576744733);
INSERT INTO `d_route` VALUES (5067, '{\"lat\":\"30.55291\",\"lng\":\"104.06436\"}', 956, 1576744735);
INSERT INTO `d_route` VALUES (5068, '{\"lat\":\"30.55290\",\"lng\":\"104.06436\"}', 956, 1576744744);
INSERT INTO `d_route` VALUES (5069, '{\"lat\":\"30.55305\",\"lng\":\"104.06334\"}', 956, 1576744804);
INSERT INTO `d_route` VALUES (5070, '{\"lat\":\"30.55307\",\"lng\":\"104.06329\"}', 956, 1576744808);
INSERT INTO `d_route` VALUES (5071, '{\"lat\":\"30.55311\",\"lng\":\"104.06321\"}', 956, 1576744812);
INSERT INTO `d_route` VALUES (5072, '{\"lat\":\"30.55317\",\"lng\":\"104.06316\"}', 956, 1576744814);
INSERT INTO `d_route` VALUES (5073, '{\"lat\":\"30.55324\",\"lng\":\"104.06313\"}', 956, 1576744819);
INSERT INTO `d_route` VALUES (5074, '{\"lat\":\"30.55333\",\"lng\":\"104.06310\"}', 956, 1576744824);
INSERT INTO `d_route` VALUES (5075, '{\"lat\":\"30.55340\",\"lng\":\"104.06310\"}', 956, 1576744826);
INSERT INTO `d_route` VALUES (5076, '{\"lat\":\"30.55346\",\"lng\":\"104.06311\"}', 956, 1576744828);
INSERT INTO `d_route` VALUES (5077, '{\"lat\":\"30.55352\",\"lng\":\"104.06310\"}', 956, 1576744832);
INSERT INTO `d_route` VALUES (5078, '{\"lat\":\"30.55355\",\"lng\":\"104.06310\"}', 956, 1576744834);
INSERT INTO `d_route` VALUES (5079, '{\"lat\":\"30.55355\",\"lng\":\"104.06310\"}', 956, 1576744839);
INSERT INTO `d_route` VALUES (5080, '{\"lat\":\"30.55355\",\"lng\":\"104.06311\"}', 956, 1576744841);
INSERT INTO `d_route` VALUES (5081, '{\"lat\":\"30.55353\",\"lng\":\"104.06310\"}', 956, 1576744848);
INSERT INTO `d_route` VALUES (5082, '{\"lat\":\"30.55354\",\"lng\":\"104.06309\"}', 956, 1576744853);
INSERT INTO `d_route` VALUES (5083, '{\"lat\":\"30.55358\",\"lng\":\"104.06310\"}', 956, 1576744855);
INSERT INTO `d_route` VALUES (5084, '{\"lat\":\"30.55360\",\"lng\":\"104.06312\"}', 956, 1576744859);
INSERT INTO `d_route` VALUES (5085, '{\"lat\":\"30.55361\",\"lng\":\"104.06319\"}', 956, 1576744864);
INSERT INTO `d_route` VALUES (5086, '{\"lat\":\"30.55364\",\"lng\":\"104.06321\"}', 956, 1576744865);
INSERT INTO `d_route` VALUES (5087, '{\"lat\":\"30.55363\",\"lng\":\"104.06330\"}', 956, 1576744869);
INSERT INTO `d_route` VALUES (5088, '{\"lat\":\"30.55361\",\"lng\":\"104.06342\"}', 956, 1576744872);
INSERT INTO `d_route` VALUES (5089, '{\"lat\":\"30.55362\",\"lng\":\"104.06349\"}', 956, 1576744876);
INSERT INTO `d_route` VALUES (5090, '{\"lat\":\"30.55363\",\"lng\":\"104.06360\"}', 956, 1576744881);
INSERT INTO `d_route` VALUES (5091, '{\"lat\":\"30.55362\",\"lng\":\"104.06366\"}', 956, 1576744882);
INSERT INTO `d_route` VALUES (5092, '{\"lat\":\"30.55361\",\"lng\":\"104.06377\"}', 956, 1576744886);
INSERT INTO `d_route` VALUES (5093, '{\"lat\":\"30.55358\",\"lng\":\"104.06383\"}', 956, 1576744890);
INSERT INTO `d_route` VALUES (5094, '{\"lat\":\"30.55360\",\"lng\":\"104.06385\"}', 956, 1576744892);
INSERT INTO `d_route` VALUES (5095, '{\"lat\":\"30.55358\",\"lng\":\"104.06391\"}', 956, 1576744897);
INSERT INTO `d_route` VALUES (5096, '{\"lat\":\"30.55359\",\"lng\":\"104.06393\"}', 956, 1576744899);
INSERT INTO `d_route` VALUES (5097, '{\"lat\":\"30.55361\",\"lng\":\"104.06398\"}', 956, 1576744902);
INSERT INTO `d_route` VALUES (5098, '{\"lat\":\"30.55361\",\"lng\":\"104.06401\"}', 956, 1576744906);
INSERT INTO `d_route` VALUES (5099, '{\"lat\":\"30.55365\",\"lng\":\"104.06407\"}', 956, 1576744912);
INSERT INTO `d_route` VALUES (5100, '{\"lat\":\"30.55365\",\"lng\":\"104.06408\"}', 956, 1576744913);
INSERT INTO `d_route` VALUES (5101, '{\"lat\":\"30.55364\",\"lng\":\"104.06410\"}', 956, 1576744916);
INSERT INTO `d_route` VALUES (5102, '{\"lat\":\"30.55362\",\"lng\":\"104.06410\"}', 956, 1576744920);
INSERT INTO `d_route` VALUES (5103, '{\"lat\":\"30.55358\",\"lng\":\"104.06412\"}', 956, 1576744923);
INSERT INTO `d_route` VALUES (5104, '{\"lat\":\"30.55356\",\"lng\":\"104.06413\"}', 956, 1576744927);
INSERT INTO `d_route` VALUES (5105, '{\"lat\":\"30.55353\",\"lng\":\"104.06414\"}', 956, 1576744930);
INSERT INTO `d_route` VALUES (5106, '{\"lat\":\"30.55347\",\"lng\":\"104.06416\"}', 956, 1576744934);
INSERT INTO `d_route` VALUES (5107, '{\"lat\":\"30.55342\",\"lng\":\"104.06419\"}', 956, 1576744939);
INSERT INTO `d_route` VALUES (5108, '{\"lat\":\"30.55337\",\"lng\":\"104.06422\"}', 956, 1576744941);
INSERT INTO `d_route` VALUES (5109, '{\"lat\":\"30.55331\",\"lng\":\"104.06422\"}', 956, 1576744945);
INSERT INTO `d_route` VALUES (5110, '{\"lat\":\"30.55325\",\"lng\":\"104.06419\"}', 956, 1576744947);
INSERT INTO `d_route` VALUES (5111, '{\"lat\":\"30.55319\",\"lng\":\"104.06417\"}', 956, 1576744951);
INSERT INTO `d_route` VALUES (5112, '{\"lat\":\"30.55317\",\"lng\":\"104.06416\"}', 956, 1576744954);
INSERT INTO `d_route` VALUES (5113, '{\"lat\":\"30.55314\",\"lng\":\"104.06435\"}', 956, 1576744985);
INSERT INTO `d_route` VALUES (5114, '{\"lat\":\"30.55315\",\"lng\":\"104.06435\"}', 956, 1576744989);
INSERT INTO `d_route` VALUES (5115, '{\"lat\":\"30.55312\",\"lng\":\"104.06436\"}', 956, 1576744992);
INSERT INTO `d_route` VALUES (5116, '{\"lat\":\"30.55311\",\"lng\":\"104.06436\"}', 956, 1576744997);
INSERT INTO `d_route` VALUES (5117, '{\"lat\":\"30.55313\",\"lng\":\"104.06429\"}', 956, 1576744999);
INSERT INTO `d_route` VALUES (5118, '{\"lat\":\"30.55309\",\"lng\":\"104.06429\"}', 956, 1576745002);
INSERT INTO `d_route` VALUES (5119, '{\"lat\":\"30.55303\",\"lng\":\"104.06433\"}', 956, 1576745010);
INSERT INTO `d_route` VALUES (5120, '{\"lat\":\"30.55301\",\"lng\":\"104.06435\"}', 956, 1576745011);
INSERT INTO `d_route` VALUES (5121, '{\"lat\":\"30.55299\",\"lng\":\"104.06440\"}', 956, 1576745017);
INSERT INTO `d_route` VALUES (5122, '{\"lat\":\"30.55299\",\"lng\":\"104.06441\"}', 956, 1576745019);
INSERT INTO `d_route` VALUES (5123, '{\"lat\":\"30.55292\",\"lng\":\"104.06440\"}', 956, 1576745038);
INSERT INTO `d_route` VALUES (5124, '{\"lat\":\"30.55292\",\"lng\":\"104.06441\"}', 956, 1576745043);
INSERT INTO `d_route` VALUES (5125, '{\"lat\":\"30.55292\",\"lng\":\"104.06440\"}', 956, 1576745045);
INSERT INTO `d_route` VALUES (5126, '{\"lat\":\"30.55293\",\"lng\":\"104.06440\"}', 956, 1576745050);
INSERT INTO `d_route` VALUES (5127, '{\"lat\":30.552759170532227,\"lng\":104.06419372558594}', 957, 1576745200);
INSERT INTO `d_route` VALUES (5128, '{\"lat\":\"30.55285\",\"lng\":\"104.06451\"}', 957, 1576745201);
INSERT INTO `d_route` VALUES (5129, '{\"lat\":\"30.55284\",\"lng\":\"104.06451\"}', 957, 1576745203);
INSERT INTO `d_route` VALUES (5130, '{\"lat\":\"30.55284\",\"lng\":\"104.06451\"}', 957, 1576745209);
INSERT INTO `d_route` VALUES (5131, '{\"lat\":\"30.55283\",\"lng\":\"104.06451\"}', 957, 1576745215);
INSERT INTO `d_route` VALUES (5132, '{\"lat\":\"30.55283\",\"lng\":\"104.06451\"}', 957, 1576745217);
INSERT INTO `d_route` VALUES (5133, '{\"lat\":\"30.55283\",\"lng\":\"104.06452\"}', 957, 1576745219);
INSERT INTO `d_route` VALUES (5134, '{\"lat\":\"30.55276\",\"lng\":\"104.06465\"}', 957, 1576745223);
INSERT INTO `d_route` VALUES (5135, '{\"lat\":\"30.55275\",\"lng\":\"104.06475\"}', 957, 1576745227);
INSERT INTO `d_route` VALUES (5136, '{\"lat\":\"30.55285\",\"lng\":\"104.06490\"}', 957, 1576745229);
INSERT INTO `d_route` VALUES (5137, '{\"lat\":\"30.55286\",\"lng\":\"104.06505\"}', 957, 1576745233);
INSERT INTO `d_route` VALUES (5138, '{\"lat\":\"30.55285\",\"lng\":\"104.06511\"}', 957, 1576745236);
INSERT INTO `d_route` VALUES (5139, '{\"lat\":\"30.55284\",\"lng\":\"104.06519\"}', 957, 1576745239);
INSERT INTO `d_route` VALUES (5140, '{\"lat\":\"30.55287\",\"lng\":\"104.06527\"}', 957, 1576745244);
INSERT INTO `d_route` VALUES (5141, '{\"lat\":\"30.55298\",\"lng\":\"104.06541\"}', 957, 1576745255);
INSERT INTO `d_route` VALUES (5142, '{\"lat\":\"30.55299\",\"lng\":\"104.06544\"}', 957, 1576745258);
INSERT INTO `d_route` VALUES (5143, '{\"lat\":\"30.55277\",\"lng\":\"104.06486\"}', 957, 1576745364);
INSERT INTO `d_route` VALUES (5144, '{\"lat\":\"30.55274\",\"lng\":\"104.06475\"}', 957, 1576745385);
INSERT INTO `d_route` VALUES (5145, '{\"lat\":\"30.55276\",\"lng\":\"104.06470\"}', 957, 1576745389);
INSERT INTO `d_route` VALUES (5146, '{\"lat\":\"30.55277\",\"lng\":\"104.06467\"}', 957, 1576745393);
INSERT INTO `d_route` VALUES (5147, '{\"lat\":\"30.55278\",\"lng\":\"104.06467\"}', 957, 1576745396);
INSERT INTO `d_route` VALUES (5148, '{\"lat\":\"30.55280\",\"lng\":\"104.06459\"}', 957, 1576745424);
INSERT INTO `d_route` VALUES (5149, '{\"lat\":\"30.55280\",\"lng\":\"104.06457\"}', 957, 1576745428);
INSERT INTO `d_route` VALUES (5150, '{\"lat\":\"30.55279\",\"lng\":\"104.06454\"}', 957, 1576745431);
INSERT INTO `d_route` VALUES (5151, '{\"lat\":\"30.55278\",\"lng\":\"104.06452\"}', 957, 1576745435);
INSERT INTO `d_route` VALUES (5152, '{\"lat\":\"30.55287\",\"lng\":\"104.06442\"}', 957, 1576745467);
INSERT INTO `d_route` VALUES (5153, '{\"lat\":\"30.55288\",\"lng\":\"104.06441\"}', 957, 1576745472);
INSERT INTO `d_route` VALUES (5154, '{\"lat\":\"30.55289\",\"lng\":\"104.06441\"}', 957, 1576745474);
INSERT INTO `d_route` VALUES (5155, '{\"lat\":\"30.55289\",\"lng\":\"104.06440\"}', 957, 1576745479);
INSERT INTO `d_route` VALUES (5156, '{\"lat\":\"30.55290\",\"lng\":\"104.06439\"}', 957, 1576745481);
INSERT INTO `d_route` VALUES (5157, '{\"lat\":\"30.55291\",\"lng\":\"104.06437\"}', 957, 1576745495);
INSERT INTO `d_route` VALUES (5158, '{\"lat\":\"30.55291\",\"lng\":\"104.06436\"}', 957, 1576745501);
INSERT INTO `d_route` VALUES (5159, '{\"lat\":\"30.55293\",\"lng\":\"104.06436\"}', 957, 1576745502);
INSERT INTO `d_route` VALUES (5160, '{\"lat\":\"30.55293\",\"lng\":\"104.06438\"}', 957, 1576745505);
INSERT INTO `d_route` VALUES (5161, '{\"lat\":30.552846908569336,\"lng\":104.0643081665039}', 958, 1576745578);
INSERT INTO `d_route` VALUES (5162, '{\"lat\":\"30.55303\",\"lng\":\"104.06438\"}', 958, 1576745586);
INSERT INTO `d_route` VALUES (5163, '{\"lat\":\"30.55304\",\"lng\":\"104.06438\"}', 958, 1576745592);
INSERT INTO `d_route` VALUES (5164, '{\"lat\":\"30.55305\",\"lng\":\"104.06437\"}', 958, 1576745597);
INSERT INTO `d_route` VALUES (5165, '{\"lat\":\"30.55306\",\"lng\":\"104.06436\"}', 958, 1576745598);
INSERT INTO `d_route` VALUES (5166, '{\"lat\":\"30.55307\",\"lng\":\"104.06435\"}', 958, 1576745629);
INSERT INTO `d_route` VALUES (5167, '{\"lat\":\"30.55307\",\"lng\":\"104.06431\"}', 958, 1576745630);
INSERT INTO `d_route` VALUES (5168, '{\"lat\":\"30.55306\",\"lng\":\"104.06428\"}', 958, 1576745631);
INSERT INTO `d_route` VALUES (5169, '{\"lat\":\"30.55280\",\"lng\":\"104.06418\"}', 958, 1576745633);
INSERT INTO `d_route` VALUES (5170, '{\"lat\":\"30.55276\",\"lng\":\"104.06417\"}', 958, 1576745634);
INSERT INTO `d_route` VALUES (5171, '{\"lat\":\"30.55275\",\"lng\":\"104.06417\"}', 958, 1576745636);
INSERT INTO `d_route` VALUES (5172, '{\"lat\":\"30.55272\",\"lng\":\"104.06429\"}', 958, 1576745638);
INSERT INTO `d_route` VALUES (5173, '{\"lat\":\"30.55272\",\"lng\":\"104.06430\"}', 958, 1576745644);
INSERT INTO `d_route` VALUES (5174, '{\"lat\":\"30.55271\",\"lng\":\"104.06430\"}', 958, 1576745646);
INSERT INTO `d_route` VALUES (5175, '{\"lat\":\"30.55264\",\"lng\":\"104.06427\"}', 958, 1576745647);
INSERT INTO `d_route` VALUES (5176, '{\"lat\":\"30.55248\",\"lng\":\"104.06423\"}', 958, 1576745649);
INSERT INTO `d_route` VALUES (5177, '{\"lat\":\"30.55243\",\"lng\":\"104.06419\"}', 958, 1576745651);
INSERT INTO `d_route` VALUES (5178, '{\"lat\":\"30.55234\",\"lng\":\"104.06417\"}', 958, 1576745655);
INSERT INTO `d_route` VALUES (5179, '{\"lat\":\"30.55231\",\"lng\":\"104.06416\"}', 958, 1576745657);
INSERT INTO `d_route` VALUES (5180, '{\"lat\":\"30.55229\",\"lng\":\"104.06417\"}', 958, 1576745664);
INSERT INTO `d_route` VALUES (5181, '{\"lat\":\"30.55228\",\"lng\":\"104.06417\"}', 958, 1576745667);
INSERT INTO `d_route` VALUES (5182, '{\"lat\":\"30.55226\",\"lng\":\"104.06422\"}', 958, 1576745682);
INSERT INTO `d_route` VALUES (5183, '{\"lat\":\"30.55226\",\"lng\":\"104.06423\"}', 958, 1576745688);
INSERT INTO `d_route` VALUES (5184, '{\"lat\":\"30.55223\",\"lng\":\"104.06430\"}', 958, 1576745751);
INSERT INTO `d_route` VALUES (5185, '{\"lat\":\"30.55213\",\"lng\":\"104.06430\"}', 958, 1576745777);
INSERT INTO `d_route` VALUES (5186, '{\"lat\":\"30.55212\",\"lng\":\"104.06431\"}', 958, 1576745782);
INSERT INTO `d_route` VALUES (5187, '{\"lat\":\"30.55211\",\"lng\":\"104.06431\"}', 958, 1576745784);
INSERT INTO `d_route` VALUES (5188, '{\"lat\":\"30.55210\",\"lng\":\"104.06432\"}', 958, 1576745788);
INSERT INTO `d_route` VALUES (5189, '{\"lat\":\"30.55200\",\"lng\":\"104.06440\"}', 958, 1576745852);
INSERT INTO `d_route` VALUES (5190, '{\"lat\":\"30.55182\",\"lng\":\"104.06436\"}', 958, 1576745918);
INSERT INTO `d_route` VALUES (5191, '{\"lat\":\"30.55181\",\"lng\":\"104.06436\"}', 958, 1576745983);
INSERT INTO `d_route` VALUES (5192, '{\"lat\":\"30.55187\",\"lng\":\"104.06436\"}', 958, 1576746039);
INSERT INTO `d_route` VALUES (5193, '{\"lat\":\"30.55188\",\"lng\":\"104.06436\"}', 958, 1576746045);
INSERT INTO `d_route` VALUES (5194, '{\"lat\":\"30.55188\",\"lng\":\"104.06436\"}', 958, 1576746046);
INSERT INTO `d_route` VALUES (5195, '{\"lat\":\"30.55184\",\"lng\":\"104.06436\"}', 958, 1576746051);
INSERT INTO `d_route` VALUES (5196, '{\"lat\":\"30.55177\",\"lng\":\"104.06436\"}', 958, 1576746053);
INSERT INTO `d_route` VALUES (5197, '{\"lat\":\"30.55176\",\"lng\":\"104.06437\"}', 958, 1576746057);
INSERT INTO `d_route` VALUES (5198, '{\"lat\":\"30.55176\",\"lng\":\"104.06436\"}', 958, 1576746060);
INSERT INTO `d_route` VALUES (5199, '{\"lat\":\"30.55177\",\"lng\":\"104.06433\"}', 958, 1576746063);
INSERT INTO `d_route` VALUES (5200, '{\"lat\":\"30.55180\",\"lng\":\"104.06431\"}', 958, 1576746066);
INSERT INTO `d_route` VALUES (5201, '{\"lat\":\"30.55184\",\"lng\":\"104.06430\"}', 958, 1576746072);
INSERT INTO `d_route` VALUES (5202, '{\"lat\":\"30.55186\",\"lng\":\"104.06429\"}', 958, 1576746074);
INSERT INTO `d_route` VALUES (5203, '{\"lat\":\"30.55182\",\"lng\":\"104.06430\"}', 958, 1576746076);
INSERT INTO `d_route` VALUES (5204, '{\"lat\":\"30.55177\",\"lng\":\"104.06428\"}', 958, 1576746080);
INSERT INTO `d_route` VALUES (5205, '{\"lat\":\"30.55173\",\"lng\":\"104.06428\"}', 958, 1576746083);

-- ----------------------------
-- Table structure for d_setting
-- ----------------------------
DROP TABLE IF EXISTS `d_setting`;
CREATE TABLE `d_setting`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '用户余额低于此金额  无法开锁骑车',
  `electricity` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '电量低于多少不让开锁',
  `violation_money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '停在区域外面的收费价格',
  `deposit` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '押金',
  `time_sum` int(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '一个骑行次数抵扣多少分钟 ',
  `superzone` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '超出电子围栏的罚款',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_setting
-- ----------------------------
INSERT INTO `d_setting` VALUES (2, 0.00, 20, 10.00, 500.00, 5, 0.00);

-- ----------------------------
-- Table structure for d_student
-- ----------------------------
DROP TABLE IF EXISTS `d_student`;
CREATE TABLE `d_student`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '关联的用户ID',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT '代理商ID',
  `name` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `city` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '城市',
  `student_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '学号',
  `school` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '学校',
  `statr_time` int(11) NOT NULL DEFAULT 0 COMMENT '入学时间',
  `end_time` int(11) NOT NULL DEFAULT 0 COMMENT '毕业时间',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '学生证照片',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0=审核中 1=通过 2=未通过',
  `content` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '未通过原因',
  `addtime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '提交时间 && 开始审核时间',
  `time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '审核结束时间 ',
  `location` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户申请坐标',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详细开始地址',
  `landmark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开始地标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生认证表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_student
-- ----------------------------
INSERT INTO `d_student` VALUES (21, 11, 2, '', '', '北京市东城区', '0', '213', 0, 0, '20191105/edf6dd7c33d607f4235a14b9c24ea9d3.jpg', 0, '', 1572948883, 0, '', '', '');
INSERT INTO `d_student` VALUES (22, 6, 2, '', '', '河北省秦皇岛市北戴河', '0', '111111111', 0, 0, '20191105/8dc3ba35bf2eed19f766701771aa510e.png', 0, '', 1572949168, 0, '', '', '');
INSERT INTO `d_student` VALUES (23, 15, 2, '', '', '四川省成都市青羊区', '0', '鹏宇大厦', 0, 0, '20191106/7c38aff2f16683bf371ff4ad2d24e076.jpg', 0, '', 1573008927, 0, '', '', '');
INSERT INTO `d_student` VALUES (24, 17, 2, '', '', '天津市和平区', '0', '213', 0, 0, '20191106/15e25a93f56cef08a02b0e1149000d3c.jpg', 0, '', 1573010700, 0, '', '', '');
INSERT INTO `d_student` VALUES (25, 18, 2, '', '', '四川省成都市双流区', '0', '成都信息工程大学', 0, 0, '20191106/e4ff1f6f2b1cf8c9cc43caebd45c5dbd.jpg', 0, '', 1573011591, 0, '', '', '');
INSERT INTO `d_student` VALUES (26, 35, 3, '', '', '北京市东城区', '0', '1', 0, 0, '20191122/23b7a7343989060a43e75bea80d3bc10.jpg', 0, '', 1574390368, 0, '', '', '');

-- ----------------------------
-- Table structure for d_transfer
-- ----------------------------
DROP TABLE IF EXISTS `d_transfer`;
CREATE TABLE `d_transfer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repair_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '维修人员ID',
  `car_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '车子ID',
  `addtime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '调度时间',
  `is_delete` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '1=正常 2=删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for d_user
-- ----------------------------
DROP TABLE IF EXISTS `d_user`;
CREATE TABLE `d_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '免押金卡历史充值余额',
  `store_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Store_id',
  `is_proxy` int(11) NOT NULL DEFAULT 1 COMMENT '1是普通用用户  2=代理商 （后台授权的）',
  `user_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户头像',
  `nickname` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户昵称',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '姓名',
  `id_card` char(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '身份证号 空为未认证  ',
  `sex` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '性别',
  `birthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生日',
  `is_id_card` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否身份认证 0为没有 1审核中  2成功  3失败',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号  空为未认证',
  `pasword` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码',
  `str` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户随机码',
  `is_phone` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否电话认证 0为没有 1审核中  2成功  3失败',
  `is_student` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否学生认证 0为没有 1审核中  2成功  3失败',
  `wechat_union_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信用户union id',
  `wechat_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '微信openid',
  `parent_id` int(11) UNSIGNED DEFAULT 0 COMMENT '父级ID',
  `child_id` int(11) DEFAULT 0 COMMENT '子级ID',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额',
  `owe_money` decimal(10, 2) UNSIGNED DEFAULT 0.00 COMMENT '当前欠款的金额  如果不为空的话应是负数',
  `deposit_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0为未缴押金 1为已缴  3为申请退押金',
  `deposit` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '押金金额',
  `is_success` int(10) DEFAULT NULL COMMENT '1=到账 2=未到账',
  `login_time` int(11) NOT NULL DEFAULT 0 COMMENT '用户最近登录时间',
  `login_ip` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户IP',
  `addtime` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '注册时间',
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=正常 1=异常登录 2=删除',
  `is_service` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=普通用户  1=管理人员',
  `free_ride` tinyint(5) NOT NULL DEFAULT 0 COMMENT '免费骑行的分钟',
  `olddeposit` decimal(10, 2) NOT NULL COMMENT '免押金卡历史充值余额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_user
-- ----------------------------
INSERT INTO `d_user` VALUES (108, 3, 1, 'https://wx.qlogo.cn/mmopen/vi_32/ZCbicSmicdxkiayqUwIPxZN2wV3FRzDS725ZSIGAahibzAMT0q1bwRtZyzj4yeprYzr', '追星逐月', '唐代兵', '510722199111138158', '男', '1991-11-13', 2, '13183874963', '', 'pQUke', 2, 0, '', 'oAFvF5FJNOwh-tqmfGfUDLKUirg8', NULL, 0, 0.00, 0.00, 1, 0.00, NULL, 1577091417, '110.188.94.53', 1576706919, 0, 0, 0, 0.00);
INSERT INTO `d_user` VALUES (109, 3, 1, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKe1tBcibu9LIVLtWibo42FEbh1WVOt92jiaAGKQ7JeVZtZgaU5Z0mfyUX', 'hhh', NULL, NULL, NULL, NULL, 2, '0', '', 'RFZsq', 2, 0, '', 'oAFvF5E6DWJayTI7D_T1AKwUpyxM', NULL, 0, 9.00, 0.00, 0, 0.00, NULL, 1577087889, '223.89.169.159', 1576710433, 0, 0, 0, 0.00);
INSERT INTO `d_user` VALUES (110, 3, 1, 'https://wx.qlogo.cn/mmopen/vi_32/NdVTDafk18licg5aDoagibe2DJrV5SxNBSib0qFuv8nO1McQC2ttllXFZgDclEKWe0b', '李俊-物联网', '李俊', '511002198503153616', '男', '1985-03-15', 2, '18783204777', '', 'Ojkmu', 2, 0, '', 'oAFvF5OLPpv0uBFHa6JUOP-ENM_U', NULL, 0, 28.90, 0.00, 1, 0.00, NULL, 1576742032, '223.104.215.123', 1576711648, 0, 0, 0, 0.00);
INSERT INTO `d_user` VALUES (111, 3, 1, 'https://wx.qlogo.cn/mmopen/vi_32/ibYFlDtlPtHSzusNwzBjaibIDvA6rbicOSoweaqibYXX3DpTbGOqaibTzJibFQX7fBe', '本奇', '李佳奇', '510402199712025157', '男', '1997-12-02', 2, '13666290181', '', 'szNuA', 2, 0, '', 'oAFvF5DTG9oBIuzW6xBdZCeaQ3AU', NULL, 0, 0.00, 0.00, 1, 0.00, NULL, 1576717645, '117.136.63.66', 1576714539, 0, 0, 0, 0.00);
INSERT INTO `d_user` VALUES (112, 3, 1, 'https://wx.qlogo.cn/mmopen/vi_32/1P1twG53oiaNvJQNg5c3eGnXiaAfwZXp1GdAkMsxKpsibdPHwgxanyeAs1iabepkjia', 'Dave', '段厚奎', '420323198711143717', '男', '1987-11-14', 2, '18280367606', '', 'hxVGp', 2, 0, '', 'oAFvF5Gc9akp3vYz9vL6GxGoB4IM', NULL, 0, 74.20, 0.00, 1, 0.00, NULL, 1576835929, '222.209.19.128', 1576719591, 0, 0, 0, 0.00);
INSERT INTO `d_user` VALUES (113, 3, 1, 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJAkoLQngzF4eMqOsMQrw4fLu6AOY1D1HvhkKiaSnyh8O5xoOmo8wh76Wh', '????', NULL, NULL, NULL, NULL, 0, '0', '', 'rICQc', 0, 0, '', 'oAFvF5HkZ7dkad3M7J3jrky6oYlc', NULL, 0, 0.00, 0.00, 0, 0.00, NULL, 1576721908, '222.209.18.156', 1576721908, 0, 0, 0, 0.00);
INSERT INTO `d_user` VALUES (114, 3, 1, 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eo6oZ1wnToR7BzCjEhw7QJ3Iia59Zp9Bq4hYD6siaFMDp4wUFdG2UUeSP6', '放', NULL, NULL, NULL, NULL, 0, '0', '', 'KsyvY', 0, 0, '', 'oAFvF5Fnczk_MlmR0wo3iAPNY-cw', NULL, 0, 0.00, 0.00, 0, 0.00, NULL, 1577016056, '112.54.90.94', 1576738119, 0, 0, 0, 0.00);
INSERT INTO `d_user` VALUES (115, 3, 1, 'https://wx.qlogo.cn/mmopen/vi_32/CfKoJqKJF7SQZdicwou6EBWPCH3ndo6x51m64XqXFOm6fMYMibzClfwulECc7n3jBZX', '温黎', NULL, NULL, NULL, NULL, 0, '0', '', 'mbpFF', 0, 0, '', 'oAFvF5A09qG7SaWn4zozPgq7GLcU', NULL, 0, 0.00, 0.00, 0, 0.00, NULL, 1576741181, '223.104.215.13', 1576741181, 0, 0, 0, 0.00);

-- ----------------------------
-- Table structure for d_user_order
-- ----------------------------
DROP TABLE IF EXISTS `d_user_order`;
CREATE TABLE `d_user_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键\r\n',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `money` decimal(10, 2) DEFAULT NULL COMMENT '免押金',
  `money_status` int(10) DEFAULT NULL COMMENT '0为未缴押金 1为已缴  3为申请退押金',
  `pay_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '支付时间',
  `tian` tinyint(10) DEFAULT NULL COMMENT '免押可用天数',
  `cishu` tinyint(10) DEFAULT NULL COMMENT '开通免押金送的优惠次数',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '免押金订单号',
  `is_pay` int(255) DEFAULT NULL COMMENT '1=支付成功 2=未支付',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_user_order
-- ----------------------------
INSERT INTO `d_user_order` VALUES (12, 87, 14.70, 1, '1576297221', 30, 10, '201912120932375749985704', 1);
INSERT INTO `d_user_order` VALUES (21, 86, 3.90, NULL, '1576118957', 30, 0, '201912121049173140138238', 2);
INSERT INTO `d_user_order` VALUES (22, 81, 3.90, NULL, '1576119491', 30, 0, '201912121058116358320930', 2);
INSERT INTO `d_user_order` VALUES (41, 98, 3.90, NULL, '1575129600', 30, 1, '201912122010124290560545', 2);
INSERT INTO `d_user_order` VALUES (42, 97, 3.90, NULL, '1576217269', 30, 1, '201912131407492863347221', 2);

-- ----------------------------
-- Table structure for d_verification
-- ----------------------------
DROP TABLE IF EXISTS `d_verification`;
CREATE TABLE `d_verification`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '验证码',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '电话',
  `state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '验证码状态1为验证 2为找回密码 3为更换手机  4为认证',
  `coupon_time` int(10) UNSIGNED NOT NULL DEFAULT 20 COMMENT '一张抵用券多少分钟',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `time` int(11) NOT NULL DEFAULT 0 COMMENT '生成时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '验证码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of d_verification
-- ----------------------------
INSERT INTO `d_verification` VALUES (36, '394714', '13244853227', 1, 20, 17, 1573010008);
INSERT INTO `d_verification` VALUES (37, '322318', '13577778777', 1, 20, 6, 1573010433);
INSERT INTO `d_verification` VALUES (38, '267879', '13131165445', 1, 20, 6, 1573010816);
INSERT INTO `d_verification` VALUES (40, '581609', '13444444455', 1, 20, 6, 1573010951);
INSERT INTO `d_verification` VALUES (41, '010266', '13444444444', 1, 20, 6, 1573010977);
INSERT INTO `d_verification` VALUES (42, '706920', '15777777777', 1, 20, 6, 1573011037);
INSERT INTO `d_verification` VALUES (43, '610932', '13333333333', 1, 20, 6, 1573011195);
INSERT INTO `d_verification` VALUES (44, '500276', '18202819652', 1, 20, 18, 1573011496);
INSERT INTO `d_verification` VALUES (45, '405004', '18080811425', 1, 20, 7, 1573011785);
INSERT INTO `d_verification` VALUES (46, '738029', '13666290181', 1, 20, 14, 1573095254);
INSERT INTO `d_verification` VALUES (48, '406023', '18783204777', 1, 20, 12, 1573125886);
INSERT INTO `d_verification` VALUES (49, '820526', '18380239625', 1, 20, 25, 1573177426);
INSERT INTO `d_verification` VALUES (50, '306934', '15251930999', 1, 20, 30, 1573630241);
INSERT INTO `d_verification` VALUES (51, '515500', '18613151357', 1, 20, 1, 1573790509);
INSERT INTO `d_verification` VALUES (52, '022179', '18613151357', 1, 20, 1, 1573800632);
INSERT INTO `d_verification` VALUES (53, '170790', '15609070547', 1, 20, 33, 1574154047);
INSERT INTO `d_verification` VALUES (54, '051952', '13623306135', 1, 20, 8, 1574389661);
INSERT INTO `d_verification` VALUES (55, '428100', '17631122344', 1, 20, 35, 1574390340);
INSERT INTO `d_verification` VALUES (56, '282218', '14726186162', 1, 20, 39, 1574746134);
INSERT INTO `d_verification` VALUES (57, '376828', '15008365798', 1, 20, 55, 1574996048);
INSERT INTO `d_verification` VALUES (58, '570042', '18280367606', 1, 20, 52, 1575273123);
INSERT INTO `d_verification` VALUES (59, '253633', '14720186162', 1, 20, 57, 1575280053);
INSERT INTO `d_verification` VALUES (60, '883731', '14726186162', 1, 20, 57, 1575280069);
INSERT INTO `d_verification` VALUES (61, '998582', '15881012344', 1, 20, 64, 1575370143);
INSERT INTO `d_verification` VALUES (62, '007837', '18783204777', 1, 20, 59, 1575373911);
INSERT INTO `d_verification` VALUES (63, '816883', '18613151357', 1, 20, 65, 1575444569);
INSERT INTO `d_verification` VALUES (64, '193371', '18280367606', 1, 20, 68, 1575447004);
INSERT INTO `d_verification` VALUES (66, '292215', '15198163122', 1, 20, 66, 1576045930);
INSERT INTO `d_verification` VALUES (67, '460773', '18080811425', 1, 20, 70, 1575527880);
INSERT INTO `d_verification` VALUES (68, '231792', '18783204777', 1, 20, 71, 1575602532);
INSERT INTO `d_verification` VALUES (69, '606847', '14726186162', 1, 20, 72, 1575608478);
INSERT INTO `d_verification` VALUES (70, '432556', '18294428126', 1, 20, 73, 1575945310);
INSERT INTO `d_verification` VALUES (71, '571970', '13681994559', 1, 20, 75, 1576030495);
INSERT INTO `d_verification` VALUES (72, '206612', '18280367606', 1, 20, 76, 1576044913);
INSERT INTO `d_verification` VALUES (73, '859797', '18783204777', 1, 20, 77, 1576045041);
INSERT INTO `d_verification` VALUES (74, '865702', '18783204777', 1, 20, 79, 1576045491);
INSERT INTO `d_verification` VALUES (75, '989606', '18294428126', 1, 20, 78, 1576045511);
INSERT INTO `d_verification` VALUES (76, '553931', '13681994559', 1, 20, 80, 1576052584);
INSERT INTO `d_verification` VALUES (77, '260327', '15198163122', 1, 20, 82, 1576050515);
INSERT INTO `d_verification` VALUES (78, '768366', '15008365798', 1, 20, 82, 1576050019);
INSERT INTO `d_verification` VALUES (79, '984780', '13666290181', 1, 20, 82, 1576050256);
INSERT INTO `d_verification` VALUES (80, '716636', '15198163122', 1, 20, 84, 1576051380);
INSERT INTO `d_verification` VALUES (81, '046317', '15008365798', 1, 20, 84, 1576050933);
INSERT INTO `d_verification` VALUES (82, '239150', '18380239625', 1, 20, 74, 1576051410);
INSERT INTO `d_verification` VALUES (83, '303059', '18294428126', 1, 20, 86, 1576053086);
INSERT INTO `d_verification` VALUES (86, '044379', '18783204777', 1, 20, 88, 1576056412);
INSERT INTO `d_verification` VALUES (88, '133525', '18280367606', 1, 20, 81, 1576057443);
INSERT INTO `d_verification` VALUES (89, '689532', '18280367606', 1, 20, 95, 1576132098);
INSERT INTO `d_verification` VALUES (90, '125164', '15881012344', 1, 20, 93, 1576138988);
INSERT INTO `d_verification` VALUES (92, '685193', '18294428126', 1, 20, 96, 1576140123);
INSERT INTO `d_verification` VALUES (93, '288269', '13244853227', 1, 20, 97, 1576140378);
INSERT INTO `d_verification` VALUES (95, '257811', '15008365798', 1, 20, 87, 1576143710);
INSERT INTO `d_verification` VALUES (96, '396039', '18294428126', 1, 20, 98, 1576309120);
INSERT INTO `d_verification` VALUES (97, '128455', '18294428126', 1, 20, 99, 1576309249);
INSERT INTO `d_verification` VALUES (98, '296959', '18294428126', 1, 20, 100, 1576461563);
INSERT INTO `d_verification` VALUES (99, '696809', '15881012344', 1, 20, 101, 1576388189);
INSERT INTO `d_verification` VALUES (100, '869273', '13244853227', 1, 20, 102, 1576333343);
INSERT INTO `d_verification` VALUES (101, '493409', '18080116457', 1, 20, 104, 1576398123);
INSERT INTO `d_verification` VALUES (102, '976353', '13183874963', 1, 20, 105, 1576381915);
INSERT INTO `d_verification` VALUES (103, '541818', '13666290181', 1, 20, 69, 1576477381);
INSERT INTO `d_verification` VALUES (104, '069933', '18382058865', 1, 20, 83, 1576493855);
INSERT INTO `d_verification` VALUES (105, '190288', '15008365798', 1, 20, 106, 1576559584);
INSERT INTO `d_verification` VALUES (106, '839381', '18783204777', 1, 20, 110, 1576711717);
INSERT INTO `d_verification` VALUES (107, '218716', '13666290181', 1, 20, 111, 1576714553);
INSERT INTO `d_verification` VALUES (108, '053005', '13183874963', 1, 20, 108, 1576718794);
INSERT INTO `d_verification` VALUES (109, '782409', '13244853227', 1, 20, 109, 1576718734);
INSERT INTO `d_verification` VALUES (110, '244830', '18280367606', 1, 20, 112, 1576742161);

SET FOREIGN_KEY_CHECKS = 1;
