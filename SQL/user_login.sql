

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user_login
-- ----------------------------
DROP TABLE IF EXISTS `user_login`;
CREATE TABLE `user_login`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码（加密后的密码）',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  CONSTRAINT `user_login_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_login
-- ----------------------------
INSERT INTO `user_login` VALUES (10000, '222@qq.com', '$2a$10$wJ6eYWBk4T8t72a2iZzsgOjn91KmboL55PscGvpx65V4mmB9JHBX6');
INSERT INTO `user_login` VALUES (10001, '111@qq.com', '$2a$10$wJ6eYWBk4T8t72a2iZzsgOjn91KmboL55PscGvpx65V4mmB9JHBX6');
INSERT INTO `user_login` VALUES (10002, '2222@qq.com', '$2a$10$wJ6eYWBk4T8t72a2iZzsgOjn91KmboL55PscGvpx65V4mmB9JHBX6');
INSERT INTO `user_login` VALUES (10003, '333@qq.com', '$2a$10$wJ6eYWBk4T8t72a2iZzsgOjn91KmboL55PscGvpx65V4mmB9JHBX6');
INSERT INTO `user_login` VALUES (10004, '444@qq.com', '$2a$10$wJ6eYWBk4T8t72a2iZzsgOjn91KmboL55PscGvpx65V4mmB9JHBX6');
INSERT INTO `user_login` VALUES (10005, '555@qq.com', '$2a$10$pIfA2XMg4g3AHuE6cj1GPODPs8NPtTkDL30RG/n9Ny8KANBUjFiwy');
INSERT INTO `user_login` VALUES (10006, '666@qq.com', '$2a$10$wJ6eYWBk4T8t72a2iZzsgOjn91KmboL55PscGvpx65V4mmB9JHBX6');
INSERT INTO `user_login` VALUES (10007, '777@qq.com', '$2a$10$7o3Aa1NY1ex2aRk/s8zHdenmlohMULMon7SDy8lIg..PMrxHB2U3.');
INSERT INTO `user_login` VALUES (10008, 'lk666@qq.com', '$2a$10$wJ6eYWBk4T8t72a2iZzsgOjn91KmboL55PscGvpx65V4mmB9JHBX6');
INSERT INTO `user_login` VALUES (10009, '999@qq.com', '$2a$10$wJ6eYWBk4T8t72a2iZzsgOjn91KmboL55PscGvpx65V4mmB9JHBX6');
INSERT INTO `user_login` VALUES (10010, '888@qq.com', '$2a$10$wJ6eYWBk4T8t72a2iZzsgOjn91KmboL55PscGvpx65V4mmB9JHBX6');
INSERT INTO `user_login` VALUES (10011, '2345@qq.com', '$2a$10$wJ6eYWBk4T8t72a2iZzsgOjn91KmboL55PscGvpx65V4mmB9JHBX6');
INSERT INTO `user_login` VALUES (10012, '5432@qq.com', '$2a$10$wJ6eYWBk4T8t72a2iZzsgOjn91KmboL55PscGvpx65V4mmB9JHBX6');
INSERT INTO `user_login` VALUES (10016, '3211962021@qq.com', '$2a$10$v/J0jIdRmKrz6eCJYm7.EeR/ZYlZ3.f6SrTd8RaNZh6onX.LV9.pO');
INSERT INTO `user_login` VALUES (10017, '2608114546@qq.com', '$2a$10$Cw8/U2J8CR2O6Vkej1SROOz/Rpo9.hYM5YxwOlpgkV/vmOe1hT2T.');
INSERT INTO `user_login` VALUES (10018, '1587193545@qq.com', '$2a$10$N0i0PVcVsgv.itxjVRPIse5NDY7fIcA3mfKIEdGslC29k.e/snxnu');
INSERT INTO `user_login` VALUES (10019, '1871573670@qq.com', '$2a$10$jJMV0zXYlz0p0lnh2Ci.CuXoTLXaanDuTiakEk7oo5U0DWoX.tlBW');
INSERT INTO `user_login` VALUES (10020, '953081093@qq.com', '$2a$10$0BUtxvwi1uTrg7A8U3Iy1.4O8QOR7l0.ymad2OBgecMuV1.Z/vSr.');
INSERT INTO `user_login` VALUES (10021, '2228921046@qq.com', '$2a$10$ece8uG0sI8YQYKC.TZVHV.M5lhJdjZUKhjrsw6wcNGIgw1B6i0emy');
INSERT INTO `user_login` VALUES (10022, '2270929247@qq.com', '$2a$10$CN1RuWJZ3An.vfuhZIumh.LIedllqmRlLrGnT4CHsxFgvPI9RCrry');
INSERT INTO `user_login` VALUES (10023, '2531267678@qq.com', '$2a$10$jWtGGGVCbfW6q1SGFdjWi.2zlHoS.1o5nBYDfmud/U3SaijbiZZCC');

SET FOREIGN_KEY_CHECKS = 1;
