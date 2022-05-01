
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_all_course
-- ----------------------------
DROP TABLE IF EXISTS `tb_all_course`;
CREATE TABLE `tb_all_course`  (
  `course_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '课程视频ID',
  `course_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名字',
  `price` double(10, 2) NOT NULL COMMENT '价格',
  `time_length` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时长',
  `course_grade` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程推荐等级',
  `course_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程类型',
  `bought_number` int(8) NOT NULL COMMENT '已购买人数',
  `like_number` int(8) NOT NULL COMMENT '点赞数',
  `teacher_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师名字',
  `teacher_label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师标签',
  `cover_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  PRIMARY KEY (`course_id`) USING BTREE,
  INDEX `course_name`(`course_name`) USING BTREE,
  INDEX `course_type`(`course_type`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10009 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_all_course
-- ----------------------------
INSERT INTO `tb_all_course` VALUES (10006, 'python入门', 100.00, '2h/天*10天', '小白入门级', '技能', 2310, 2200, '宋江', '斜杠人生认证职场导师', NULL);
INSERT INTO `tb_all_course` VALUES (10007, 'java入门', 87.50, '56h', '小白入门级', '技能', 3241, 3000, '林冲', '小米前副经理', NULL);
INSERT INTO `tb_all_course` VALUES (10008, '电商运营岗位能力要求', 45.34, '1h/节*10节', '小白入门级', '面试', 1123, 1000, '鲁智深', '艺涛电商学院老师', NULL);

SET FOREIGN_KEY_CHECKS = 1;
