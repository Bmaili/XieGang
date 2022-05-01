

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for art_info
-- ----------------------------
DROP TABLE IF EXISTS `art_info`;
CREATE TABLE `art_info`  (
  `article_id` bigint(20) NOT NULL COMMENT '文章ID',
  `context` varchar(8191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文章具体内容',
  PRIMARY KEY (`article_id`) USING BTREE,
  CONSTRAINT `art_info_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of art_info
-- ----------------------------
INSERT INTO `art_info` VALUES (1000, '大家好，今天也是为大家分享的一天!!!\r\n\r\n【前言】\r\n\r\n饱受大学几年编程生活，\r\n对于一个女生来说，刚开始学还是有点抽象，\r\n连输出个Hello World 都要背代码[doge笑哭][doge笑哭]\r\n\r\n毕竟才大一，不能刚入门到放弃啊！\r\n于是乎，就找了很多资源来学习。\r\n\r\n由于很多软件都卸载啦，这里给大家分享一些我觉得有用的网站给大家， 希望对大家有点帮助！[受虐滑稽][受虐滑稽]\r\n\r\n其实大多数网站也有相应的软件，这里就不单独介绍软件啦！\r\n\r\n【正式开始】\r\n\r\n一、视频学习篇\r\n\r\n中国大学MOOC https://www.icourse163.org/ \r\n中国大学MOOC包含了很多高校的精品课程，免费学习来自名校名师的精品课程，认真学习，完成测验，考试可申请证书。\r\n我几乎每学期都会在上面找一些课程来看，学校老师讲的太快了。\r\n\r\n慕课网 https://www.imooc.com/ \r\n慕课网是国内IT技能学习平台。堪称程序员梦工厂，各类程序类课程都有。\r\n\r\n哔哩哔哩动画 https://www.bilibili.com/ \r\nB站是国内知名的视频弹幕网站，它的学习资源也是很丰富的，各类课程、考证备考都有！\r\n这个我也是每学期都会找教材配套视频来看，需要自己找适合自己的课程来看。\r\n\r\n腾讯课堂 https://ke.qq.com/ \r\n腾讯课堂是腾讯推出的专业职业培训在线教育平台，职业培训、公务员考试、考证考级、中小学教育都是有的。\r\n这个是参加华为认证的时候，参加了2门课程，都讲的挺好的。\r\n\r\n大学资源网 http://www.dxzy163.com/ \r\n说是大学资源网，其实从小学到大学，考研、讲座、外语资格考试都是有的，可以在这里面淘一淘喜欢的课程。\r\n\r\n网易云课堂 https://study.163.com/curricula/cs.htm \r\n网易云计算机专业，里面的课程大多也都由知名院校开课，都有上课大纲，测验，考试那些，完成了可申请证书。\r\n二、教程学习篇\r\n\r\n菜鸟教程 https://www.runoob.com/ \r\n菜鸟教程是我学HTML开始接触的，它还有数据库、移动端、开发工具、网站建设的教程。\r\n\r\n都比较详细，敲代码的时候，想不起用法或者标签了可以当成电子教材查询，\r\n\r\n此外，它的界面我也很喜欢，非常简洁，它还有在线编辑器，可以在线编程并运行查看结果。\r\n\r\n');
INSERT INTO `art_info` VALUES (1001, '没有新学期了[doge笑哭]\r\n毕业两个半月，公务员上岸两个月，出差半个月中[托腮]\r\n刚毕业就工作真的很不适应。。。劝君惜取读书时，同学和朋友出社会真没多少\r\n目前地级市政府跟班学习，信息工作，每天下班在酒店玩玩游戏，一个人孤孤单单的也挺没意思的[傲慢]不过离家近，周末还是可以绿皮动车回家[笑哭]\r\n学生时代一去不复返，诸君且行且珍惜[抱拳]');
INSERT INTO `art_info` VALUES (1002, '1.彻底沦为通信工程的一员了，开学大二狗\r\n\r\n2.大二课是真的多，数电，模电，复变等几大天书凑一块了，还有各种实验，能顺利度过这一学期不挂科应该就很不容易了[doge笑哭]\r\n\r\n3.过六级，因为学校的原因，大一下才报考了四级，虽然是英语渣渣，但四级竟然到了540，高中和我同水平的同学六级基本是擦线过，希望也能过吧[cos滑稽]\r\n\r\n4.多去合肥的几个地方，大一真就是学也没学好，玩也没玩好，虽然喜欢宅在学校学习，还是该多出去走走[受虐滑稽]');
INSERT INTO `art_info` VALUES (1003, ' 想起以前看到同学吃麦当劳很羡慕，多次恳求才让妈妈带着去了一次。点了个菜单上的套餐，78，好像有一桶鸡翅啥的。又点了一些别的，加起来应该100多吧。我妈看着我和弟弟吃。鸡翅肉很少。后面就没去过了。一般放暑假有时候搞活动，就会去华莱士买些炸鸡排汉堡之类的当下午茶。现在都说喷射套餐，其实那时是我们童年的美味了。\r\n现在有时也会去麦当劳，来补偿童年时的亏欠。当然只能选周一搞优惠的时候，或者12.9的套餐。现在想想，那时候点个桶还真的挺奢侈的');
INSERT INTO `art_info` VALUES (1004, '找一份工作不难，但找一份自己满意，适合自己的工作就不是一件容易的事。\r\n\r\n作为一名即将毕业的大学生，学校在五月份举办了一个大型招聘会\r\n\r\n面试通过，成功得到实习机会*1\r\n\r\n期间其实通过了好几家公司的面试，但是最后想了想，选择了一个离家距离适中，工资还算不错的公司——青岛特殊钢铁有限公司（毕竟土生土长的青岛人嘛[喝酒]）\r\n\r\n之后从学校放暑假回家，一直到八月份才收到实习的通知\r\n买好车票，冲！[酷]\r\n\r\n出发前还特意百度了一下宿舍，好家伙，我内心是拒绝的（简直是又老又破），都已经准备好自己出去租房子了。But，到了地方真的是让我眼前一亮！[笑眼]\r\n\r\n这完全就跟网图不一样嘛，那可能是老厂区的宿舍吧。\r\n宿舍不大，四人间（麻雀虽小，五脏俱全）\r\n\r\n再就是宿舍这边的食堂，不愧是国企的食堂，真香[喝茶]，干饭王表示很喜欢\r\n看看宿舍周围的环境\r\n\r\n之后就是公司组织入职前的体检（医生的字依旧那么飘逸[哼唧]）\r\n\r\n正式进入公司之后，我被分配到了公司旗下的发电厂工作，在发电厂的维修部，听领导们说之前从未有过发电厂招聘实习生，我算是第一届实习生（这算是幸运嘛[滑稽]），这样我就跟着老前辈们一起学习技术（大学我是电气自动化专业，也算专业与工作对口了）。\r\n前辈们人都很好，对我很照顾，还请我喝饮料，常理来说应该是我请前辈们喝才对[皱眉]\r\n\r\n发了工作服\r\n\r\n因为我没有电工作业证嘛，这两天就在办公室看安全手册之类的\r\n\r\n带大家转转工厂，占地太大了，只拍了一小部分不全面\r\n\r\n现在我的任务就是学习安全操作手册，相当于公然摸鱼[cos滑稽]。当然已经报考高、低压电工证了，等拿了证就很前辈们一起去现场维修学习。\r\n\r\n可能有很多像我一样即将毕业实习择业的大学生，也可能有刚上大学的大一新生，还有甚至毕业一两年的没有找到合适工作的同学们，这都没有关系，要记住，在哪里都要丰富自己（不论精神还是肉体），学海无涯，像我们维修部班长说的，你们还年轻没什么丢人的，不会的就多学多问。在工作结束之余，我也在积极准备明年的专升本考试了（毕竟只有一次机会），真的只有工作了才会明白上学的好。我知道自学很难（别人都是报班辅导），但是不搏一搏，我自己心里过不去这道坎，就当是弥补高中时不好好学习的遗憾吧。\r\n\r\n最后借用比尔盖茨先生的一句话：社会充满不公平现象，你不要想去改造它，只能先适应它。\r\n为了梦想，加油吧各位！[微笑]');
INSERT INTO `art_info` VALUES (1005, '七月份毕业，第一份马上转正，今天老家（小县城）村支书和街道办武装部给我打电话，说有一个带编入伍政策，进部队当兵两年结束之后给我16w，然后在当地小县城根据我的专业和意愿给我分配一个事业单位（大概率是县融媒体中心，电视台这类宣传部门），期间还有当兵期间家属医疗免费巴拉巴拉待遇，说我条件不错建议我考虑一下。我考虑了30秒后拒绝了。\r\n一个是自己本来就从小县城出来，不想再回小县城，自己一心想要实现“阶级的跨越”，到地级市甚至到省会城市安家，让我的家人和下一代享受更好的条件，我知道虽然这很难但我想去努力。\r\n另一个是我清楚的知道自己想要什么，而县城公务员那五六千的工资水平根本满足不了我，自己的欲望比较高，那就得自己去努力实现。何况自己转正后一年也能收入15w左右，能攒下10w。\r\n我回电拒绝了。\r\n我不敢保证我以后会不会为我这个决定而后悔，但起码我现在是不后悔的。我还年轻，我不想去过那种20来岁就能一眼望到头的生活，稳定的另一面是枯燥和平庸。我想挣钱（取之有道），我喜欢自己努力满足自己的快感，我想要给家人和下一代更好的条件，以至于在面对一些突发情况时不会那么窘迫，会有更多的选择。\r\n努力吧少年～\r\np话完毕，睡觉');
INSERT INTO `art_info` VALUES (1006, '28位科技区UP的2021年度拉跨产品大盘点：\r\n\r\n1.爱否科技: iPad mini6\r\n2.LKs: MacBook 16寸（难买）和 Embr Wave手环\r\n3.无聊的开箱: 手机杯\r\n4.李楠: AM HATSU键盘\r\n5.UX油爱科思: Magsafe外接电池\r\n6.科技美学: iPhone 12 pro\r\n7.陈抱一: 九号独轮车\r\n8.迪仔: Airtag\r\n9.林捂捂: 魅族 闪级充电宝\r\n10.装机猿: 空气显卡 以及 一切高于原价的电子产品\r\n11.趣评测: 拓牛智能垃圾桶\r\n12.影视飓风: 大疆action2\r\n13.极客村长: 索尼ZV1相机\r\n14.LIKEMUSIC: Mac Pro主机\r\n15.我是HYK: AM (怒喵) 机械键盘\r\n16.90后科技说: MagSafe外接电池 Airtag\r\n17.大狸子切切里: 小厂显示器\r\n18.极客湾: 小米11\r\n19.科技小辛: MacBook iPhone\r\n20.终极小腾: 索尼A7S3相机\r\n21.花生说: 三星 Z flip3 和 华为P50 pocket\r\n22.李大锤: 榨汁机 小熊电炖锅 泡脚桶\r\n23.小白开箱: 魔法阵无线充电座\r\n24.羊驼的睡衣: 索尼Xperia 1 III\r\n25.Blood旌旗: 3DIO人头麦克风\r\n26.六分超超: MagSafe外接电池\r\n27.特效小哥studio: 三星 Z flip3\r\n28.小白测评: 苹果magsafe卡包\r\n');
INSERT INTO `art_info` VALUES (1007, '兄弟们，最近不知道怎么回事，状态差的一批，什么也不想干就想躺尸，完全不像一个考研人。烦躁得很，根本学不进去，每天就想吃吃睡睡，也提不起劲儿去学习，硬着头皮坐一上午也学不进去什么东西，我该咋办[流泪]\r\n总结一下我这一周就是吃喝玩乐[流泪]');
INSERT INTO `art_info` VALUES (1008, '日语生大一的神奇生活\r\n1.功课每门80以上\r\n2.过日语n2\r\n3.坚持跑步（之前跑步总断断续续）\r\n4.英语重开，尽快过英语4级\r\n');
INSERT INTO `art_info` VALUES (1009, '校招进私企啦，同期有100多个大学生在一起培训，现在的氛围跟学校很像，有时感觉就像是还在上学一样，不过终究还是回不去了。希望还在学校的伙伴们珍惜和同学在一起的日子。');
INSERT INTO `art_info` VALUES (1010, '大二了，某双非的财管专业。em课程超级多，重新分的班级宿舍。要重新开始了。\r\n1.把自己的专业课搞好，上课不能在打游戏了[受虐滑稽][受虐滑稽]（水课除外）。\r\n2.把大一丢下的英语重新拾起来。[受虐滑稽][受虐滑稽]大一英语课全程划水过来的。\r\n3.和我家小可爱处好关系[qqdoge]马上就一周年了。em和她一起好好努力，陪着她考研。\r\n4.新的舍友，处理好关系，旧舍友，也不能忘记。班级多多融入。\r\n加油');
INSERT INTO `art_info` VALUES (1011, '测试测试：六十多岁老辈子仨玩老实点半开始了联发科那地方路人粉代理费不会伤心连续给你的利率给我行吗，vlsd\r\ndlvksdle');
INSERT INTO `art_info` VALUES (1012, '发表文章测试内容');
INSERT INTO `art_info` VALUES (1013, '我是贲国庆，我在做文章发表测试');
INSERT INTO `art_info` VALUES (1014, '');
INSERT INTO `art_info` VALUES (1015, '');
INSERT INTO `art_info` VALUES (1016, '啊');
INSERT INTO `art_info` VALUES (1017, '啊');
INSERT INTO `art_info` VALUES (1018, '啊');
INSERT INTO `art_info` VALUES (1019, '啊啊啊啊');
INSERT INTO `art_info` VALUES (1020, '呜呜呜呜\n');
INSERT INTO `art_info` VALUES (1021, '巴啦啦啦啦啦啦啦，今天已经返现将近两月啦');
INSERT INTO `art_info` VALUES (1022, '我是小妖怪');
INSERT INTO `art_info` VALUES (1023, '集成');

SET FOREIGN_KEY_CHECKS = 1;