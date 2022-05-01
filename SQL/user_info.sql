
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '斜杠小青年' COMMENT '用户昵称',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户电话',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '用户性别，0未知1男2女',
  `user_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '用户类别，普通用户/管理员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `avatar` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647688197948763.png' COMMENT '头像',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10024 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES (10000, '喵喵喵', '13756568656', '0', '0', '2022-03-12 18:19:00', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647699861584478.png');
INSERT INTO `user_info` VALUES (10001, '斜杠小青年', '', '0', '0', '2022-03-20 01:36:06', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647688197948763.png');
INSERT INTO `user_info` VALUES (10002, '斜杠小青年', '', '0', '0', '2022-03-20 01:36:27', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647688197948763.png');
INSERT INTO `user_info` VALUES (10003, '斜杠小青年', '', '0', '0', '2022-03-20 01:36:43', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647688197948763.png');
INSERT INTO `user_info` VALUES (10004, '斜杠小青年', '', '0', '0', '2022-03-20 01:36:57', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647688197948763.png');
INSERT INTO `user_info` VALUES (10005, '大明', '13423456789', '0', '0', '2022-01-26 23:40:33', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647688197948763.png');
INSERT INTO `user_info` VALUES (10006, '斜杠小青年', '', '0', '0', '2022-03-20 01:37:30', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647688197948763.png');
INSERT INTO `user_info` VALUES (10007, '斜杠小青年', '', '0', '0', '2022-03-17 21:52:52', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647688197948763.png');
INSERT INTO `user_info` VALUES (10008, '斜杠小青年', '13434566543', '0', '0', '2022-03-19 18:52:20', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647688197948763.png');
INSERT INTO `user_info` VALUES (10009, '斜杠小青年', '', '0', '0', '2022-03-20 01:42:29', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647688197948763.png');
INSERT INTO `user_info` VALUES (10010, '斜杠小青年', '', '0', '0', '2022-03-20 01:42:36', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647688197948763.png');
INSERT INTO `user_info` VALUES (10011, '斜杠小青年', '', '0', '0', '2022-03-20 01:43:05', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647688197948763.png');
INSERT INTO `user_info` VALUES (10012, '斜杠小青年', '', '0', '0', '2022-03-20 01:43:19', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647688197948763.png');
INSERT INTO `user_info` VALUES (10015, '斜杠小青年', '', '0', '0', '2022-03-20 17:16:16', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647688197948763.png');
INSERT INTO `user_info` VALUES (10016, '喵儿', '', '0', '0', '2022-03-23 23:31:41', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1650451141402220.jpg');
INSERT INTO `user_info` VALUES (10017, '斜杠小青年', '', '0', '0', '2022-03-27 00:09:41', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647688197948763.png');
INSERT INTO `user_info` VALUES (10018, '斜杠超级大青年', '', '0', '0', '2022-04-17 21:00:06', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1650294312409618.png');
INSERT INTO `user_info` VALUES (10019, 'emo鬼', '', '0', '0', '2022-04-19 21:00:39', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1650374175070522.jpg');
INSERT INTO `user_info` VALUES (10020, '汪汪队', '', '0', '0', '2022-04-26 15:55:21', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/165096006206756.png');
INSERT INTO `user_info` VALUES (10021, '斜杠小青年', '', '0', '0', '2022-04-26 18:58:55', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647688197948763.png');
INSERT INTO `user_info` VALUES (10022, '斜杠小青年', '', '0', '0', '2022-04-26 22:12:19', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647688197948763.png');
INSERT INTO `user_info` VALUES (10023, '集成', '', '0', '0', '2022-04-27 14:58:40', 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1651046697519322.jpg');

SET FOREIGN_KEY_CHECKS = 1;
