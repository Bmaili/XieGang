

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `user_id` bigint(20) NOT NULL COMMENT '评论用户ID',
  `article_id` bigint(20) NOT NULL COMMENT '文章ID',
  `reply_user_id` bigint(20) NOT NULL COMMENT '回复用户的ID',
  `pid` bigint(20) NOT NULL COMMENT '父评论ID',
  `context` varchar(4095) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `comment_ibfk_1`(`article_id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `comment_ibfk_2`(`user_id`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1097 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1000, 10005, 1000, 0, 0, ' 有没有那种……就是像罗翔说刑法一样的编程课……张三当主角的那种[受虐滑稽]没有的的话我肯定只能学到helloworld', '2022-03-18 10:34:41');
INSERT INTO `comment` VALUES (1001, 10001, 1000, 10005, 1000, 'head first系列书籍', '2022-03-18 12:29:13');
INSERT INTO `comment` VALUES (1002, 10002, 1000, 10005, 1000, '建议找一个异性双修，就容易学会面向对象编程了[阴险]', '2022-03-18 12:32:55');
INSERT INTO `comment` VALUES (1003, 10003, 1000, 10002, 1000, '学会了面向对象，没学会编程[受虐滑稽]', '2022-03-18 12:34:56');
INSERT INTO `comment` VALUES (1004, 10004, 1000, 10001, 1000, 'Head first 中文版本翻译的好像不是很好。', '2022-03-18 12:36:05');
INSERT INTO `comment` VALUES (1005, 10006, 1000, 0, 0, '在学js，很难受，要放弃了[受虐滑稽][受虐滑稽][受虐滑稽]', '2022-03-18 12:36:07');
INSERT INTO `comment` VALUES (1006, 10007, 1000, 10006, 1005, '没得事[doge呵斥][doge呵斥][doge呵斥]', '2022-03-18 17:24:15');
INSERT INTO `comment` VALUES (1007, 10008, 1000, 10006, 1005, '好的不学，学奸商[受虐滑稽][受虐滑稽]', '2022-03-18 17:24:35');
INSERT INTO `comment` VALUES (1008, 10006, 1000, 10008, 1005, '[受虐滑稽][受虐滑稽][受虐滑稽]', '2022-03-18 17:26:22');
INSERT INTO `comment` VALUES (1009, 10005, 1000, 0, 1005, '来学c++，很快乐[受虐滑稽]', '2022-03-18 17:26:45');
INSERT INTO `comment` VALUES (1010, 10006, 1000, 10005, 1005, '啊这…[受虐滑稽]', '2022-03-18 17:26:46');
INSERT INTO `comment` VALUES (1015, 10009, 1000, 0, 0, '刚开始学编程，就看到楼主这篇文章\r\n多谢分享', '2022-03-18 17:34:41');
INSERT INTO `comment` VALUES (1017, 10010, 1000, 0, 0, '竟然没有hitgub[受虐滑稽]', '2022-03-18 23:51:05');
INSERT INTO `comment` VALUES (1018, 10011, 1000, 0, 0, '收藏=学会了，[偷看]', '2022-03-18 23:51:21');
INSERT INTO `comment` VALUES (1019, 10000, 1000, 0, 0, '收藏，退出[doge]', '2022-03-18 23:51:30');
INSERT INTO `comment` VALUES (1020, 10000, 1000, 0, 0, '顺便赞一个哈哈', '2022-03-18 23:51:42');
INSERT INTO `comment` VALUES (1021, 10000, 1001, 0, 0, '公务员好啊，一眼望到头的生活，五险一金直接拉满', '2022-03-20 13:59:18');
INSERT INTO `comment` VALUES (1022, 10001, 1001, 0, 0, '我在你隔壁[捂脸]今天才发现啊', '2022-03-20 14:00:19');
INSERT INTO `comment` VALUES (1023, 10006, 1001, 0, 0, '一眼望到头的生活真的有趣嘛[黑线]', '2022-03-20 14:00:42');
INSERT INTO `comment` VALUES (1024, 10007, 1001, 0, 0, '是我想要的生活！一次上岸！吸吸好运', '2022-03-20 14:03:52');
INSERT INTO `comment` VALUES (1025, 10004, 1001, 0, 0, '请问这个考公务员需要准备什么资料', '2022-03-20 14:16:12');
INSERT INTO `comment` VALUES (1026, 10002, 1001, 10004, 1025, 'emm最好报个班', '2022-03-20 14:16:55');
INSERT INTO `comment` VALUES (1027, 10008, 1001, 10002, 1025, '面试要报班吗？感觉太费钱了', '2022-03-20 14:17:46');
INSERT INTO `comment` VALUES (1028, 10002, 1001, 10008, 1025, '我报的十天班一万吧，个人感觉也值，要不啥都不会', '2022-03-20 14:18:18');
INSERT INTO `comment` VALUES (1029, 10003, 1001, 0, 0, '老哥能传授一下考公的经验吗[笑哭]', '2022-03-20 14:18:54');
INSERT INTO `comment` VALUES (1030, 10012, 1002, 0, 0, '这不咱安大[受虐滑稽]', '2022-03-20 14:23:10');
INSERT INTO `comment` VALUES (1031, 10011, 1002, 0, 0, '不同专业同样的课', '2022-03-20 14:23:33');
INSERT INTO `comment` VALUES (1032, 10001, 1002, 0, 0, '太难了[受虐滑稽]', '2022-03-20 14:24:28');
INSERT INTO `comment` VALUES (1033, 10004, 1002, 0, 0, '你们大物实验为啥不去笃北啊[doge笑哭]\r\n示波器的实验报告抄的手疼', '2022-03-20 14:24:51');
INSERT INTO `comment` VALUES (1034, 10001, 1002, 10004, 1033, '虽然课表这样写，但应该还是笃北，大物实验上也是这样[受虐滑稽]', '2022-03-20 14:25:33');
INSERT INTO `comment` VALUES (1035, 10005, 1002, 0, 0, '实验报告写到手软', '2022-03-20 14:26:21');
INSERT INTO `comment` VALUES (1036, 10006, 1003, 0, 0, '看到你这，突然想起来我小时候也有和你相似的经历。现在吃一顿麦当劳简直稀松平常，真的忍不住感慨啊。', '2022-03-20 14:31:30');
INSERT INTO `comment` VALUES (1037, 10007, 1003, 0, 0, '小时候因为家里穷，没能时不时的吃一次，那时候很羡慕里面吃汉堡的人，后来家人带我去吃的时候，我总想问父母怎么不吃？得到的回答总是他们不喜欢吃，随着年龄的增长，我才明白，如果他们吃了得话，我能吃的就少了…', '2022-03-20 14:32:15');
INSERT INTO `comment` VALUES (1038, 10008, 1003, 0, 0, '我不喝可乐就不喷射。', '2022-03-20 14:32:35');
INSERT INTO `comment` VALUES (1039, 10009, 1003, 0, 0, '这么多年物价狂涨，理个发都五块钱变成三十了，但是KFC和麦当劳，汉堡9.5变20，其实也就涨了一倍而已[doge呵斥]麦当劳1+1 yyds', '2022-03-20 14:33:01');
INSERT INTO `comment` VALUES (1040, 10010, 1003, 0, 0, '现在麦当劳早餐挺划算的，开个早餐卡最便宜点的5块钱还有豆浆，比外面早餐店实惠多了', '2022-03-20 14:33:27');
INSERT INTO `comment` VALUES (1041, 10011, 1003, 0, 0, '很小的时候以前去麦当劳吃菠萝派，8块钱一个，还在14块钱一个，后来我妈说这些东西不健康，一直到高中就没吃过，后面吃，都是自己去吃的[流泪]。', '2022-03-20 14:33:46');
INSERT INTO `comment` VALUES (1042, 10011, 1004, 0, 0, '现在学徒和以前不一样了，我带徒弟也是给他买肥宅快乐水[皱眉]不是不愿教，就怕他不学[笑哭]多学点，我的工作相对就轻松一些[受虐滑稽]', '2022-03-20 14:38:52');
INSERT INTO `comment` VALUES (1043, 10000, 1004, 0, 0, '这个工作环境确实很好[牛啤] 记录了生活和工作 写实[牛啤]', '2022-03-20 14:39:14');
INSERT INTO `comment` VALUES (1044, 10001, 1004, 0, 0, '后悔学建筑了，土木类和电气类真的是一大坑，不建议学[喝酒]能跑路还是赶紧跑路', '2022-03-20 14:39:38');
INSERT INTO `comment` VALUES (1045, 10002, 1004, 0, 0, '中铁表示很淦', '2022-03-20 14:40:00');
INSERT INTO `comment` VALUES (1046, 10003, 1004, 0, 0, '问下楼主，这个发电厂拍出来的烟是普通水蒸气还是有点污染的气？每次看到这么大一根都挺震撼的', '2022-03-20 14:40:18');
INSERT INTO `comment` VALUES (1076, 10015, 1001, 0, 0, '', '2022-03-23 20:46:29');
INSERT INTO `comment` VALUES (1077, 10015, 1001, 0, 0, '', '2022-03-23 20:47:09');
INSERT INTO `comment` VALUES (1078, 10015, 1001, 0, 0, '直接评论的测试1', '2022-03-23 20:47:50');
INSERT INTO `comment` VALUES (1079, 10015, 1001, 10004, 1025, '二级回复测试', '2022-03-23 20:48:30');
INSERT INTO `comment` VALUES (1080, 10015, 1001, 10004, 1025, '一级回复测试', '2022-03-23 20:48:46');
INSERT INTO `comment` VALUES (1081, 10015, 1001, 10006, 1023, '一级回复测试', '2022-03-23 20:49:08');
INSERT INTO `comment` VALUES (1082, 10015, 1000, 0, 0, '测试', '2022-03-23 21:16:11');
INSERT INTO `comment` VALUES (1083, 10016, 1004, 0, 0, 'wonderful!!!!!!!!!!!!!!!hhhhhhhh我们宇宙第一棒！！！！！！！！！！！！！！！！！！！！！', '2022-03-23 23:32:47');
INSERT INTO `comment` VALUES (1084, 10018, 1018, 0, 0, '真棒！', '2022-04-18 21:59:27');
INSERT INTO `comment` VALUES (1085, 10018, 1018, 0, 0, '你也很棒', '2022-04-18 21:59:48');
INSERT INTO `comment` VALUES (1086, 10018, 1018, 0, 0, '都很棒', '2022-04-18 22:00:18');
INSERT INTO `comment` VALUES (1087, 10018, 1010, 0, 0, '我是第一个哈哈哈哈', '2022-04-18 23:59:56');
INSERT INTO `comment` VALUES (1088, 10018, 1017, 0, 0, '啊啊啊', '2022-04-19 00:11:19');
INSERT INTO `comment` VALUES (1089, 10005, 1020, 0, 0, '2', '2022-04-20 11:49:01');
INSERT INTO `comment` VALUES (1090, 10005, 1020, 0, 0, '测试', '2022-04-20 11:49:22');
INSERT INTO `comment` VALUES (1091, 10005, 1020, 0, 0, '试试', '2022-04-20 11:49:38');
INSERT INTO `comment` VALUES (1092, 10020, 1021, 0, 0, '！', '2022-04-26 15:58:36');
INSERT INTO `comment` VALUES (1093, 10018, 1021, 0, 0, '文章太有用了！点赞！', '2022-04-26 20:10:35');
INSERT INTO `comment` VALUES (1094, 10023, 1022, 0, 0, '今天来巡山', '2022-04-27 16:29:54');
INSERT INTO `comment` VALUES (1095, 10016, 1005, 0, 0, '你咋这么多赞呢！真是滴！', '2022-04-30 00:01:19');
INSERT INTO `comment` VALUES (1096, 10016, 1005, 0, 0, '算了吧，你写的还是不错滴！', '2022-04-30 00:02:06');

SET FOREIGN_KEY_CHECKS = 1;
