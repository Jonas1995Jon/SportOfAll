/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : sport

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 07/07/2018 20:20:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `beginTime` date NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `endTime` date NULL DEFAULT NULL,
  `summary` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `synopsis` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `price` float(10, 2) NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `uid` int(11) NOT NULL,
  `signUp` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES (1, '2018-07-01', '悉尼马拉松源起于2000年悉尼奥运会，承办了当年奥运会的新南威尔士州政府希望延续悉尼市的国际运动形象，因此于2001年开始举办悉尼跑步节暨悉尼马拉松，2018年将是第18届。悉尼马拉松与六大满贯马拉松赛事一样，是国际田联认证的金牌路跑赛事，每年吸引全世界超过3万名跑者前来参赛。赛道平坦美丽，被誉为最美城市马拉松赛道。从举世闻名的自然和历史景观中跑过，在澳大利亚的标志性建筑悉尼歌剧院冲线，是终身难忘的一次跑步体验。悉尼马拉松设有全程和半程马拉松，还有10公里跑和3.5公里跑，适合所有年龄段、热爱运动的人。', '2018-09-01', '悉尼马拉松与六大满贯马拉松赛事一样，是国际田联认证的金牌路跑赛事，每年吸引全世界超过3万名跑者前来参赛', '悉尼马拉松源起于2000年悉尼奥运会，承办了当年奥运会的新南威尔士州政府希望延续悉尼市的国际运动形象，因此于2001年开始举办悉尼跑步节暨悉尼马拉松，2018年将是第18届。悉尼马拉松与六大满贯马拉松赛事一样，是国际田联认证的金牌路跑赛事，每年吸引全世界超过3万名跑者前来参赛。赛道平坦美丽，被誉为最美城市马拉松赛道。从举世闻名的自然和历史景观中跑过，在澳大利亚的标志性建筑悉尼歌剧院冲线，是终身难忘的一次跑步体验。悉尼马拉松设有全程和半程马拉松，还有10公里跑和3.5公里跑，适合所有年龄段、热爱运动的人。', '2018 悉尼马拉松', 'images\\Sydney.jpg', 100.00, '重庆市渝中区×××路108号', 1, 0, 0);
INSERT INTO `activity` VALUES (2, '2018-11-11', 'BMW精英驾驶始创于1977年，作为首家推出安全驾驶课程的汽车制造厂商，BMW将赛车运动中积累的宝贵经验，系统地运用到常规道路驾驶中，使其丰富全面的课程设置得以激发驾驶者的更多潜能，引导驾驶者与其高性能座驾更默契的配合;使学员在掌握驾驶规范操作的同时，增强其对车辆性能的掌控，真正享受驾驭所带来的愉悦感。', '2018-12-11', 'BMW将赛车运动中积累的宝贵经验，系统地运用到常规道路驾驶中，使其丰富全面的课程设置得以激发驾驶者的更多潜能', 'BMW精英驾驶始创于1977年，作为首家推出安全驾驶课程的汽车制造厂商，BMW将赛车运动中积累的宝贵经验，系统地运用到常规道路驾驶中，使其丰富全面的课程设置得以激发驾驶者的更多潜能，引导驾驶者与其高性能座驾更默契的配合;使学员在掌握驾驶规范操作的同时，增强其对车辆性能的掌控，真正享受驾驭所带来的愉悦感。', '2018 BMW 赛道驾驶课程', 'images\\BMW.jpg', 120.00, '重庆市渝中区×××路108号', 1, 0, 0);
INSERT INTO `activity` VALUES (3, '2018-07-07', '比赛改革现有世界自由搏击行业的常规赛制基础，将杯赛积分循环赛与阶段淘汰赛相结合，这在全球范围内尚属首次。而且为了保证比赛的公平公正，比赛将由各主流赛事组织的裁判联合执裁。按照本次WLF世界功夫王者争霸赛的规则，运动员通过抽签被分为A、B、C、D四个小组后，先进行小组循环赛，每个拳手都将与组内另外三位拳手一一进行对决，每场比赛胜者积3分，负者积1分，最终每个小组积分最 高者获得出线资格，晋级四强，最终决出冠军王者。', '2018-07-07', 'WLF世界功夫王者争霸赛--这场极具全球影响力的\"搏击世界杯\"，召集了来自中、俄、泰、荷、西等世界各大赛事组织里的16名67公斤级世界顶 级高手，强势争夺\"WLF世界功夫王者\"称号。', 'WLF世界功夫王者争霸赛，将持续为期四个月的激烈比拼，在7月至10月期间，每月首周周六晚开战，启动一场声势浩大的\"搏击赛事狂欢季\"。揭幕战将于2018年7月7日回归武林风大本营--河南省会郑州，在河南省体育场体育馆拉开战幕，为武林风老家河南的拳迷呈现一场世界顶 级搏击盛宴！', 'WLF武林风世界功夫王者争霸赛', 'images\\WLF.jpg', 99.00, '重庆市渝中区×××路108号', 1, 0, 0);
INSERT INTO `activity` VALUES (4, '2018-07-02', '\r\n龍FC（龍 Fighting Championship），即全国综合格斗联赛，是中国本土举办的专业性一流的MMA（综合格斗）赛事。龍FC首办于2016年，以“龍”作为标志，基于民族化的格斗精髓，旨在打造一个具有中国标签的世界 级格斗赛事，签约的职业格斗选手通过选拔，具备专业的综合格斗技术能力，按体重划分不同级别，通过全国联赛的形式夺得总冠军。赛事以真实的格斗、高水平的比赛、高热度的赛制迅速扩张，在国内受到超高的关注度，同时与体育、媒体多家平台及政府的多方大力合作，借此，龍FC已形成集民族化、商业化、娱乐化、地区标志于一体的竞技类体育IP，成功跻身中国体育产业占领资本市场，以广泛的关注与支持，成为中国乃至全球的一流MMA赛事之一。', '2018-07-07', '龍FC（龍 Fighting Championship），即全国综合格斗联赛，是中国本土举办的专业性一流的MMA（综合格斗）赛事。', '\r\n龍FC（龍 Fighting Championship），即全国综合格斗联赛，是中国本土举办的专业性一流的MMA（综合格斗）赛事。龍FC首办于2016年，以“龍”作为标志，基于民族化的格斗精髓，旨在打造一个具有中国标签的世界 级格斗赛事，签约的职业格斗选手通过选拔，具备专业的综合格斗技术能力，按体重划分不同级别，通过全国联赛的形式夺得总冠军。赛事以真实的格斗、高水平的比赛、高热度的赛制迅速扩张，在国内受到超高的关注度，同时与体育、媒体多家平台及政府的多方大力合作，借此，龍FC已形成集民族化、商业化、娱乐化、地区标志于一体的竞技类体育IP，成功跻身中国体育产业占领资本市场，以广泛的关注与支持，成为中国乃至全球的一流MMA赛事之一。', '龍FC综合格斗联赛', 'images\\FC.jpg', 150.00, '重庆市渝中区×××路108号', 2, 0, 0);
INSERT INTO `activity` VALUES (5, '2018-07-01', '悉尼马拉松源起于2000年悉尼奥运会，承办了当年奥运会的新南威尔士州政府希望延续悉尼市的国际运动形象，因此于2001年开始举办悉尼跑步节暨悉尼马拉松，2018年将是第18届。悉尼马拉松与六大满贯马拉松赛事一样，是国际田联认证的金牌路跑赛事，每年吸引全世界超过3万名跑者前来参赛。赛道平坦美丽，被誉为最美城市马拉松赛道。从举世闻名的自然和历史景观中跑过，在澳大利亚的标志性建筑悉尼歌剧院冲线，是终身难忘的一次跑步体验。悉尼马拉松设有全程和半程马拉松，还有10公里跑和3.5公里跑，适合所有年龄段、热爱运动的人。', '2018-09-01', '悉尼马拉松与六大满贯马拉松赛事一样，是国际田联认证的金牌路跑赛事，每年吸引全世界超过3万名跑者前来参赛', '悉尼马拉松源起于2000年悉尼奥运会，承办了当年奥运会的新南威尔士州政府希望延续悉尼市的国际运动形象，因此于2001年开始举办悉尼跑步节暨悉尼马拉松，2018年将是第18届。悉尼马拉松与六大满贯马拉松赛事一样，是国际田联认证的金牌路跑赛事，每年吸引全世界超过3万名跑者前来参赛。赛道平坦美丽，被誉为最美城市马拉松赛道。从举世闻名的自然和历史景观中跑过，在澳大利亚的标志性建筑悉尼歌剧院冲线，是终身难忘的一次跑步体验。悉尼马拉松设有全程和半程马拉松，还有10公里跑和3.5公里跑，适合所有年龄段、热爱运动的人。', '2018 悉尼马拉松', 'images\\Sydney.jpg', 100.00, '重庆市渝中区×××路108号', 2, 0, 0);
INSERT INTO `activity` VALUES (6, '2018-11-11', 'BMW精英驾驶始创于1977年，作为首家推出安全驾驶课程的汽车制造厂商，BMW将赛车运动中积累的宝贵经验，系统地运用到常规道路驾驶中，使其丰富全面的课程设置得以激发驾驶者的更多潜能，引导驾驶者与其高性能座驾更默契的配合;使学员在掌握驾驶规范操作的同时，增强其对车辆性能的掌控，真正享受驾驭所带来的愉悦感。', '2018-12-11', 'BMW将赛车运动中积累的宝贵经验，系统地运用到常规道路驾驶中，使其丰富全面的课程设置得以激发驾驶者的更多潜能', 'BMW精英驾驶始创于1977年，作为首家推出安全驾驶课程的汽车制造厂商，BMW将赛车运动中积累的宝贵经验，系统地运用到常规道路驾驶中，使其丰富全面的课程设置得以激发驾驶者的更多潜能，引导驾驶者与其高性能座驾更默契的配合;使学员在掌握驾驶规范操作的同时，增强其对车辆性能的掌控，真正享受驾驭所带来的愉悦感。', '2018 BMW 赛道驾驶课程', 'images\\BMW.jpg', 120.00, '重庆市渝中区×××路108号', 2, 0, 0);
INSERT INTO `activity` VALUES (7, '2018-07-07', '比赛改革现有世界自由搏击行业的常规赛制基础，将杯赛积分循环赛与阶段淘汰赛相结合，这在全球范围内尚属首次。而且为了保证比赛的公平公正，比赛将由各主流赛事组织的裁判联合执裁。按照本次WLF世界功夫王者争霸赛的规则，运动员通过抽签被分为A、B、C、D四个小组后，先进行小组循环赛，每个拳手都将与组内另外三位拳手一一进行对决，每场比赛胜者积3分，负者积1分，最终每个小组积分最 高者获得出线资格，晋级四强，最终决出冠军王者。', '2018-07-07', 'WLF世界功夫王者争霸赛--这场极具全球影响力的\"搏击世界杯\"，召集了来自中、俄、泰、荷、西等世界各大赛事组织里的16名67公斤级世界顶 级高手，强势争夺\"WLF世界功夫王者\"称号。', 'WLF世界功夫王者争霸赛，将持续为期四个月的激烈比拼，在7月至10月期间，每月首周周六晚开战，启动一场声势浩大的\"搏击赛事狂欢季\"。揭幕战将于2018年7月7日回归武林风大本营--河南省会郑州，在河南省体育场体育馆拉开战幕，为武林风老家河南的拳迷呈现一场世界顶 级搏击盛宴！', 'WLF武林风世界功夫王者争霸赛', 'images\\WLF.jpg', 99.00, '重庆市渝中区×××路108号', 1, 0, 0);
INSERT INTO `activity` VALUES (8, '2018-07-02', '\r\n龍FC（龍 Fighting Championship），即全国综合格斗联赛，是中国本土举办的专业性一流的MMA（综合格斗）赛事。龍FC首办于2016年，以“龍”作为标志，基于民族化的格斗精髓，旨在打造一个具有中国标签的世界 级格斗赛事，签约的职业格斗选手通过选拔，具备专业的综合格斗技术能力，按体重划分不同级别，通过全国联赛的形式夺得总冠军。赛事以真实的格斗、高水平的比赛、高热度的赛制迅速扩张，在国内受到超高的关注度，同时与体育、媒体多家平台及政府的多方大力合作，借此，龍FC已形成集民族化、商业化、娱乐化、地区标志于一体的竞技类体育IP，成功跻身中国体育产业占领资本市场，以广泛的关注与支持，成为中国乃至全球的一流MMA赛事之一。', '2018-07-07', '龍FC（龍 Fighting Championship），即全国综合格斗联赛，是中国本土举办的专业性一流的MMA（综合格斗）赛事。', '\r\n龍FC（龍 Fighting Championship），即全国综合格斗联赛，是中国本土举办的专业性一流的MMA（综合格斗）赛事。龍FC首办于2016年，以“龍”作为标志，基于民族化的格斗精髓，旨在打造一个具有中国标签的世界 级格斗赛事，签约的职业格斗选手通过选拔，具备专业的综合格斗技术能力，按体重划分不同级别，通过全国联赛的形式夺得总冠军。赛事以真实的格斗、高水平的比赛、高热度的赛制迅速扩张，在国内受到超高的关注度，同时与体育、媒体多家平台及政府的多方大力合作，借此，龍FC已形成集民族化、商业化、娱乐化、地区标志于一体的竞技类体育IP，成功跻身中国体育产业占领资本市场，以广泛的关注与支持，成为中国乃至全球的一流MMA赛事之一。', '龍FC综合格斗联赛', 'images\\FC.jpg', 150.00, '重庆市渝中区×××路108号', 1, 0, 0);
INSERT INTO `activity` VALUES (14, '2018-07-10', 'Background Color Text Color 奋斗奋斗方式发到辅导费发送到发顺丰胜多负少防守对方Background Color Text Color 奋斗奋斗方式发到辅导费发送到发顺丰胜多负少防守对方Background Color Text Color 奋斗奋斗方式发到辅导费发送到发顺丰胜多负少防守对方', '2018-08-10', '发多少所所所所所所所所所所所所所所付', '法啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '重庆市第108届拳击比赛', 'images\\uploadFile\\1530938600090.jpg', 180.00, '重庆市渝中区×××路108号', 1, 0, 1);

-- ----------------------------
-- Table structure for hotsearch
-- ----------------------------
DROP TABLE IF EXISTS `hotsearch`;
CREATE TABLE `hotsearch`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `sname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotsearch
-- ----------------------------
INSERT INTO `hotsearch` VALUES (1, 10, '篮球');
INSERT INTO `hotsearch` VALUES (2, 20, '瑜伽');
INSERT INTO `hotsearch` VALUES (3, 15, '跑步');
INSERT INTO `hotsearch` VALUES (4, 8, '健身');

-- ----------------------------
-- Table structure for saishimenu
-- ----------------------------
DROP TABLE IF EXISTS `saishimenu`;
CREATE TABLE `saishimenu`  (
  `smid` int(11) NOT NULL AUTO_INCREMENT,
  `projectname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`smid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of saishimenu
-- ----------------------------
INSERT INTO `saishimenu` VALUES (1, '羽毛球', '', NULL);
INSERT INTO `saishimenu` VALUES (2, '马拉松', NULL, NULL);
INSERT INTO `saishimenu` VALUES (3, '乒乓球', NULL, NULL);
INSERT INTO `saishimenu` VALUES (4, '篮球', NULL, NULL);
INSERT INTO `saishimenu` VALUES (5, '足球', NULL, NULL);
INSERT INTO `saishimenu` VALUES (6, '网球', NULL, NULL);
INSERT INTO `saishimenu` VALUES (7, '健身', NULL, NULL);
INSERT INTO `saishimenu` VALUES (8, '自行车', NULL, NULL);
INSERT INTO `saishimenu` VALUES (9, '现代舞', NULL, NULL);
INSERT INTO `saishimenu` VALUES (10, '登山', NULL, NULL);
INSERT INTO `saishimenu` VALUES (11, '跑步', NULL, NULL);
INSERT INTO `saishimenu` VALUES (12, '游泳', NULL, NULL);
INSERT INTO `saishimenu` VALUES (13, '台球', NULL, NULL);

-- ----------------------------
-- Table structure for user_activity
-- ----------------------------
DROP TABLE IF EXISTS `user_activity`;
CREATE TABLE `user_activity`  (
  `uaid` int(11) NOT NULL AUTO_INCREMENT,
  `aid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`uaid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_activity
-- ----------------------------
INSERT INTO `user_activity` VALUES (1, 8, 1, 3);
INSERT INTO `user_activity` VALUES (17, 7, 1, 3);
INSERT INTO `user_activity` VALUES (18, 6, 1, 3);

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `age` int(11) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bodyfat` int(255) NULL DEFAULT NULL,
  `headimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `height` float(255, 0) NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `weight` float(255, 0) NULL DEFAULT NULL,
  `gender` int(11) NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `radio` int(11) NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES (1, 22, 'e10adc3949ba59abbe56e057f20f883e', 0, 'Jonas', '1819745574@qq.com', '小艾同学', 20, 'images\\uploadFile\\1530938048594.jpg', 175, '15736259475', 61, 1, '1995-07-23', 1);
INSERT INTO `userinfo` VALUES (3, 20, 'e10adc3949ba59abbe56e057f20f883e', 0, 'Jack', '1819745574@qq.com', '小杰同学', 18, NULL, 175, '15736259475', 61, 0, '1995-07-23', 0);

SET FOREIGN_KEY_CHECKS = 1;
