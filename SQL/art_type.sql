
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for art_type
-- ----------------------------
DROP TABLE IF EXISTS `art_type`;
CREATE TABLE `art_type`  (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `type_name` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `describe` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类描述',
  `cover` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类封面',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of art_type
-- ----------------------------
INSERT INTO `art_type` VALUES (0, '未分类', '', '');
INSERT INTO `art_type` VALUES (1, '斜杠闲谈', '', '');
INSERT INTO `art_type` VALUES (2, '学期任务清单', '', '');
INSERT INTO `art_type` VALUES (3, '新技能get', '', '');
INSERT INTO `art_type` VALUES (4, '返校日志', '', '');

SET FOREIGN_KEY_CHECKS = 1;
