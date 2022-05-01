
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_all_job
-- ----------------------------
DROP TABLE IF EXISTS `tb_all_job`;
CREATE TABLE `tb_all_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_address` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `company_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `edu_background` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `work_experence` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reward` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cover_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10005 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_all_job
-- ----------------------------
INSERT INTO `tb_all_job` VALUES (10001, '算法工程师', '互联网', '广东 深圳', 10020, '百度技术公司', '大专及以上', '无', '8k-14k*16薪', '本科/python/算法', '');
INSERT INTO `tb_all_job` VALUES (10002, 'Android开发', '移动互联网', '全国', 10021, '小米技术公司', '本科', '1-2年', '6k-10k', '安卓/开发/本科', NULL);
INSERT INTO `tb_all_job` VALUES (10003, '园艺师', '艺术/设计/视觉', '辽宁 沈阳', 10022, '拉布拉多公司', '不限', '2年以上', '300-400元/h', '园艺/设计', NULL);
INSERT INTO `tb_all_job` VALUES (10004, 'java开发', '互联网', '全国', 10021, '小米技术公司', '本科', '2年以上', '10k-15k', '后端/微服务/分布式', NULL);

SET FOREIGN_KEY_CHECKS = 1;
