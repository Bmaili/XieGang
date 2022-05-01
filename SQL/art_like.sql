
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for art_like
-- ----------------------------
DROP TABLE IF EXISTS `art_like`;
CREATE TABLE `art_like`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `art_id` bigint(20) NOT NULL COMMENT '文章ID',
  PRIMARY KEY (`user_id`, `art_id`) USING BTREE,
  INDEX `art_id`(`art_id`) USING BTREE,
  CONSTRAINT `art_like_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `art_like_ibfk_2` FOREIGN KEY (`art_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of art_like
-- ----------------------------
INSERT INTO `art_like` VALUES (10000, 1000);
INSERT INTO `art_like` VALUES (10015, 1000);
INSERT INTO `art_like` VALUES (10000, 1001);
INSERT INTO `art_like` VALUES (10000, 1002);
INSERT INTO `art_like` VALUES (10001, 1002);
INSERT INTO `art_like` VALUES (10016, 1004);
INSERT INTO `art_like` VALUES (10016, 1005);
INSERT INTO `art_like` VALUES (10020, 1007);
INSERT INTO `art_like` VALUES (10005, 1020);
INSERT INTO `art_like` VALUES (10018, 1020);
INSERT INTO `art_like` VALUES (10020, 1020);
INSERT INTO `art_like` VALUES (10018, 1021);
INSERT INTO `art_like` VALUES (10020, 1021);

SET FOREIGN_KEY_CHECKS = 1;
