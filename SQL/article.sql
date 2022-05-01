

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `digest` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文章摘要',
  `author_id` bigint(50) NOT NULL COMMENT '文章作者ID',
  `reading` bigint(20) NOT NULL DEFAULT 0 COMMENT '阅读量',
  `comments` bigint(20) NOT NULL DEFAULT 0 COMMENT '评论量',
  `likes` bigint(20) NOT NULL DEFAULT 0 COMMENT '点赞量',
  `picture` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文章内图片链接',
  `type_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '文章类型ID',
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创造时间',
  PRIMARY KEY (`id`, `author_id`, `type_id`) USING BTREE,
  INDEX `author_id`(`author_id`) USING BTREE,
  INDEX `type_id`(`type_id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `article_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `art_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1024 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1000, '大家好，今天也是为大家分享的一天!!!\r\n【前言】\r\n\r\n饱受大学几年编程生活，\r\n对于一个女生来说，刚开始学还是有点抽象，\r\n连输出个Hello World 都要背代码', 10000, 5729, 52, 335, 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079498498455.jpeg||https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079527215202.jpg', 3, '2022-03-23 21:16:11');
INSERT INTO `article` VALUES (1001, '没有新学期了[doge笑哭]\r\n毕业两个半月，公务员上岸两个月，出差半个月中[托腮]\r\n刚毕业就工作真的很不适应。。。', 10002, 4354, 116, 44, 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079498498455.jpeg||https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079527215202.jpg', 2, '2022-03-23 20:49:08');
INSERT INTO `article` VALUES (1002, '1.彻底沦为通信工程的一员了，开学大二狗\r\n\r\n2.大二课是真的多，数电，模电，复变等几大天书凑一块了，还有各种实验，能顺利度过这一学期不挂科应该就很不容易了[doge笑哭', 10001, 3445, 33, 45, 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079498498455.jpeg||https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079527215202.jpg', 2, '2022-04-04 13:36:45');
INSERT INTO `article` VALUES (1003, '想起以前看到同学吃麦当劳很羡慕，多次恳求才让妈妈带着去了一次。点了个菜单上的套餐，78，好像有一桶鸡翅啥的。又点了一些别的，加起来应该100多吧。我妈看着我和弟弟吃。鸡翅肉很少。', 10003, 435, 33, 44, 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079498498455.jpeg||https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079527215202.jpg', 1, '2022-03-20 14:45:52');
INSERT INTO `article` VALUES (1004, '找一份工作不难，但找一份自己满意，适合自己的工作就不是一件容易的事。\r\n\r\n作为一名即将毕业的大学生，学校在五月份举办了一个大型招聘会\r\n\r\n面试通过，成功得到实习机会*1', 10010, 6575, 37, 325, 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079498498455.jpeg||https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079527215202.jpg', 1, '2022-03-24 19:32:57');
INSERT INTO `article` VALUES (1005, '七月份毕业，第一份马上转正，今天老家（小县城）村支书和街道办武装部给我打电话，说有一个带编入伍政策，进部队当兵两年结束之后给我16w，然后在当地小县城根据我的专业和意愿给我分配一个事业单位', 10004, 4544, 35, 45, 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079498498455.jpeg||https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079527215202.jpg', 1, '2022-04-30 00:02:06');
INSERT INTO `article` VALUES (1006, '28位科技区UP的2021年度拉跨产品大盘点：\r\n\r\n1.爱否科技: iPad mini6\r\n2.LKs: MacBook 16寸（难买）和 Embr Wave手环\r\n3.无聊的开箱: 手机杯\r\n4.李楠: AM HATSU键盘', 10005, 9675, 33, 44, 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079498498455.jpeg||https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079527215202.jpg', 1, '2022-03-20 14:46:11');
INSERT INTO `article` VALUES (1007, '兄弟们，最近不知道怎么回事，状态差的一批，什么也不想干就想躺尸，完全不像一个考研人。烦躁得很，根本学不进去，每天就想', 10006, 3433, 12, 13, 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079498498455.jpeg||https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079527215202.jpg', 2, '2022-04-26 16:02:32');
INSERT INTO `article` VALUES (1008, '日语生大一的神奇生活\r\n1.功课每门80以上\r\n2.过日语n2\r\n3.坚持跑步（之前跑步总断断续续）\r\n4.英语重开，尽快过英语4级', 10007, 3433, 234, 111, 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079498498455.jpeg||https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079527215202.jpg', 2, '2022-03-20 14:53:46');
INSERT INTO `article` VALUES (1009, '校招进私企啦，同期有100多个大学生在一起培训，现在的氛围跟学校很像，有时感觉就像是还在上学一样，不过终究还是回不去了。', 10008, 2323, 222, 22, 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079498498455.jpeg||https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079527215202.jpg', 2, '2022-03-21 20:12:02');
INSERT INTO `article` VALUES (1010, '二了，某双非的财管专业。em课程超级多，重新分的班级宿舍。要重新开始了。\r\n1.把自己的专业课搞好，上课不能在打游戏了[受虐滑稽][受虐滑稽]（水课除外）。\r\n2.把大一丢下的英语重新拾起来。[受虐滑稽][受虐滑稽]大一英语课全程划水过来的。', 10009, 1122, 13, 12, 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079498498455.jpeg||https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079527215202.jpg', 2, '2022-04-18 23:59:56');
INSERT INTO `article` VALUES (1011, '测试测试：六十多岁老辈子仨玩老实点半开始了联发科那地方路人粉代理费不会伤心连续给你的利率给我行吗，vlsd\r\ndlvksdle', 10011, 666, 66, 66, 'https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079498498455.jpeg||https://bmalimarkdown.oss-cn-beijing.aliyuncs.com/xiegang/1647079527215202.jpg', 0, '2022-03-21 20:12:16');
INSERT INTO `article` VALUES (1012, '发表文章测试内容', 10018, 0, 0, 0, 'string', 0, '2022-04-18 14:23:32');
INSERT INTO `article` VALUES (1013, '我是贲国庆，我在做文章发表测试', 10018, 0, 0, 0, 'null', 0, '2022-04-18 21:42:06');
INSERT INTO `article` VALUES (1014, '', 10018, 0, 0, 0, 'null', 0, '2022-04-18 21:45:54');
INSERT INTO `article` VALUES (1015, '', 10018, 0, 0, 0, 'null', 0, '2022-04-18 21:46:27');
INSERT INTO `article` VALUES (1016, '啊', 10018, 0, 0, 0, 'null', 0, '2022-04-18 21:48:46');
INSERT INTO `article` VALUES (1017, '啊', 10018, 0, 1, 0, 'null', 0, '2022-04-19 00:11:19');
INSERT INTO `article` VALUES (1018, '啊', 10018, 0, 3, 0, 'null', 0, '2022-04-18 22:00:18');
INSERT INTO `article` VALUES (1019, '啊啊啊啊', 10018, 0, 0, 0, 'null', 2, '2022-04-19 12:09:48');
INSERT INTO `article` VALUES (1020, '呜呜呜呜\n', 10019, 0, 3, 3, 'null', 3, '2022-04-26 21:36:19');
INSERT INTO `article` VALUES (1021, '巴啦啦啦啦啦啦啦，今天已经返现将近两月啦', 10016, 0, 2, 2, 'null', 4, '2022-04-26 21:35:15');
INSERT INTO `article` VALUES (1022, '我是小妖怪', 10023, 0, 1, 0, 'null', 1, '2022-04-27 16:29:54');
INSERT INTO `article` VALUES (1023, '集成', 10023, 0, 0, 0, 'null', 0, '2022-04-27 16:55:10');

SET FOREIGN_KEY_CHECKS = 1;
