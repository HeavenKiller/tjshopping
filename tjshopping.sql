/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.6.24 : Database - tjshopping
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tjshopping` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `tjshopping`;

/*Table structure for table `t_address` */

DROP TABLE IF EXISTS `t_address`;

CREATE TABLE `t_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '地址编号',
  `address_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址内容',
  `address_level` int(1) unsigned DEFAULT NULL COMMENT '地址级别',
  `address_parent_id` int(10) unsigned DEFAULT NULL COMMENT '地址父类编号',
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_address` */

insert  into `t_address`(`address_id`,`address_name`,`address_level`,`address_parent_id`) values (1,'四川',1,0),(2,'北京',1,0),(3,'天津',1,0),(4,'上海',1,0),(5,'重庆',1,0),(6,'河北',1,0),(7,'山西',1,0),(8,'辽宁',1,0),(9,'吉林',1,0),(10,'黑龙江',1,0),(11,'江苏',1,0),(12,'浙江',1,0),(13,'安徽',1,0),(14,'福建',1,0),(15,'江西',1,0),(16,'山东',1,0),(17,'河南',1,0),(18,'湖北',1,0),(19,'湖南',1,0),(20,'广东',1,0),(21,'海南',1,0),(22,'贵州',1,0),(23,'云南',1,0),(24,'陕西',1,0),(25,'甘肃',1,0),(26,'青海',1,0),(27,'台湾',1,0),(28,'内蒙古',1,0),(29,'广西',1,0),(30,'西藏',1,0),(31,'宁夏',1,0),(32,'新疆',1,0),(33,'香港',1,0),(34,'澳门',1,NULL);

/*Table structure for table `t_agree` */

DROP TABLE IF EXISTS `t_agree`;

CREATE TABLE `t_agree` (
  `agree_id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `agree_kind_id` int(2) unsigned DEFAULT NULL COMMENT '1:用户；2:爆料；3:闲值；4:评论',
  `agree_info_id` int(10) unsigned DEFAULT NULL COMMENT '被赞用户、爆料、闲值或评论的编号',
  `agree_time` datetime DEFAULT NULL,
  `is_or_not` int(1) unsigned DEFAULT NULL COMMENT '0:不同意；1:同意',
  PRIMARY KEY (`agree_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_agree` */

insert  into `t_agree`(`agree_id`,`user_id`,`agree_kind_id`,`agree_info_id`,`agree_time`,`is_or_not`) values (1,4,2,2,'2017-06-02 08:46:25',1),(2,6,2,2,'2017-06-02 10:27:02',0),(3,4,2,14,'2017-06-02 14:45:25',0),(4,6,4,12,'2017-06-02 14:48:14',1);

/*Table structure for table `t_baol` */

DROP TABLE IF EXISTS `t_baol`;

CREATE TABLE `t_baol` (
  `baol_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '爆料id',
  `baol_url` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '爆料链接',
  `baol_title` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '爆料标题',
  `baol_price` decimal(12,2) DEFAULT NULL COMMENT '爆料价格',
  `kind_id` int(4) unsigned NOT NULL COMMENT '爆料种类编号',
  `mall_id` int(2) unsigned NOT NULL COMMENT '爆料商城编号',
  `baol_img_one` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '爆料图片1',
  `baol_img_two` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '爆料图片2',
  `baol_img_three` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '爆料图片3',
  `baol_img_four` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '爆料图片4',
  `baol_img_five` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '爆料图片5',
  `baol_time` datetime DEFAULT NULL COMMENT '爆料时间',
  `baol_brand` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '爆料品牌',
  `baol_price_adv` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '爆料价格优势',
  `baol_goods_adv` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '爆料商品优势',
  `baol_other_info` int(2) unsigned DEFAULT NULL COMMENT '其他信息',
  `baol_is_zhi_num` int(10) unsigned DEFAULT '0' COMMENT '爆料值数目',
  `baol_is_notzhi_num` int(10) unsigned DEFAULT '0' COMMENT '爆料不值数目',
  `b_shouc_num` int(10) unsigned DEFAULT '0' COMMENT '爆料被收藏数',
  `b_comm_num` int(10) unsigned DEFAULT '0' COMMENT '爆料被回复数',
  `b_tg_shenhe` int(1) unsigned DEFAULT '0' COMMENT '爆料是否通过审核，0:正在审核；1:通过审核；2：不通过 3：被惩罚',
  `b_btg_reason` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '不通过原因',
  `baol_punished` int(1) unsigned DEFAULT '1' COMMENT '爆料是否被惩罚，1:无；2:被惩罚，不能显示',
  `baol_p_reason` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '爆料被惩罚原因',
  `user_id` int(10) unsigned NOT NULL COMMENT '爆料用户编号',
  PRIMARY KEY (`baol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_baol` */

insert  into `t_baol`(`baol_id`,`baol_url`,`baol_title`,`baol_price`,`kind_id`,`mall_id`,`baol_img_one`,`baol_img_two`,`baol_img_three`,`baol_img_four`,`baol_img_five`,`baol_time`,`baol_brand`,`baol_price_adv`,`baol_goods_adv`,`baol_other_info`,`baol_is_zhi_num`,`baol_is_notzhi_num`,`b_shouc_num`,`b_comm_num`,`b_tg_shenhe`,`b_btg_reason`,`baol_punished`,`baol_p_reason`,`user_id`) values (1,'https://re.jd.com/cps/item/3429555.html?cu=true&utm_source=www.linkstars.com&utm_medium=tuiguang&utm_campaign=t_1000089893_156_0_184__n8FVCafWMY66CdxA62z&utm_term=320e7660b7c0418f9168b39ad99a528d&abt=3','洛克（ROCK）苹果MFi认证数据线充电线 适用于苹果7iphone6s/plus/se/5/iPad 1米白色',19.50,1,1,'/userdoc/4/baol/1/c607f37e5ffb432dbf68cc16a03771e8.jpeg','/userdoc/4/baol/1/489e6f15877d472ea1319f95c36d7a54.jpeg','/userdoc/4/baol/1/8d0b32c1929f47c09dc81676408dad2d.jpeg',NULL,NULL,'2017-06-02 03:52:36','洛克（ROCK）','mfi认证数据线，现在可以满99-50，基本就是半价了','【大牌来袭，千机变用ROCK】【京东自营，211直达】',NULL,0,0,0,0,1,NULL,1,NULL,4),(2,'https://re.jd.com/cps/item/4206046.html?cu=true&utm_source=www.linkstars.com&utm_medium=tuiguang&utm_campaign=t_1000089893_156_0_184__GzF3CQfveaJmIGorJ86&utm_term=5c94b4915595457ab3de0cfa76d28d58&abt=3','HP 惠普 藏羚羊Plus 有线键鼠套装 黑色',49.00,1,1,'/userdoc/4/baol/2/16b23d1ed665453c96d2993b104d48b3.jpeg','/userdoc/4/baol/2/8fdda9f99be5447a85b16c6e732591f1.jpeg','/userdoc/4/baol/2/64e3165f745a4d7388245d73cefe213f.jpeg','/userdoc/4/baol/2/c277ac01b6904658b95948729077f264.jpeg','/userdoc/4/baol/2/ed7ee15998ab48e9b76e3ebb3acf5392.jpeg','2017-06-02 03:56:37','HP 惠普','目前49元的好价又来了，优惠力不错，适合凑单至包邮带回。或者有免邮卷的可以上了。','惠普藏羚羊Plus有线键鼠套装，全尺寸键盘，让您准确快速输入，鼠标防滑易握，具备侧面防滑握柄，键盘鼠标双USB接口，使用简单便捷，内配一个PS/2转接头，为您提供更多的选择性。',NULL,1,1,0,2,1,NULL,1,NULL,4),(3,'https://re.jd.com/cps/item/4567816.html?cu=true&utm_source=www.linkstars.com&utm_medium=tuiguang&utm_campaign=t_1000089893_156_0_184__yEFNCDfbOjjQh2OenAX&utm_term=310378e5184641288557a8d7c4e4b8c3&abt=3','耕升 GTX 1080 Ti Founders Edition 11GD5X 352bit 显卡',5139.00,1,1,'/userdoc/4/baol/3/f902ffbd6163451f88696b0d54746a47.jpeg','/userdoc/4/baol/3/22b5262b1c9a43dc9cef641d1acd9333.jpeg','/userdoc/4/baol/3/2bdf74e2f1df4833aaf2347cbe0ffb31.jpeg',NULL,NULL,'2017-06-02 04:00:47','耕升','满减后5139，新低价！公版信仰！1080ti。可以叠加优惠券做到更低！','再次少量到货！三年质保速抢！GTX1080Ti撼世首发，性能爆发式提升，英伟达核弹再次狂暴来袭！',NULL,0,0,0,0,0,NULL,1,NULL,4),(4,'https://www.amazon.cn/dp/B012PKYVT8?t=hwg_ca_yh_163-23&tag=hwg_ca_yh_163-23','Lexar 雷克沙 Micro SD to Lightning LRWMLBNL 读卡器',150.00,18,3,'/userdoc/4/baol/4/b37cab7ca4b043cb82668f431ac5f3b7.jpeg','/userdoc/4/baol/4/6bbe65fe792a494da466a052db618d48.jpeg','/userdoc/4/baol/4/c3205ddd1cd94b1eb5416720f2a149e8.jpeg',NULL,NULL,'2017-06-02 04:06:18','Lexar 雷克沙','亚马逊海外购现这款Lexar 雷克沙 Micro SD to Lightning LRWMLBNL 读卡器售价99.19元，单独购买需支付约51元直邮运费和税费，到手约150元，也可凑单至200元包直邮购买，同款国内渠道约290元，海外购价格具备优势。\r\n限中亚Prime会员，￥99.19 +￥ 15.96含税直邮 约116 雷克沙迷你SD卡，历史最低价','Lexar 雷克沙 Micro SD to Lightning LRWMLBNL 读卡器可以轻松完成即时传输内容到lightning接口的iPhone/iPad任务，外观设计简约，比较符合iPhone的风格，顶端为lightning端口，底部为Micro SD卡槽，通过Lexar的文件管理App，用户即可利用读卡器进行内容传输。',NULL,0,0,0,0,1,NULL,1,NULL,4),(5,'https://detail.tmall.com/item.htm?id=538706013503&ali_trackid=2:mm_25282911_3455987_13726438:1496347639_310_1982653045&upsid=0ec444e9a881565f81e017bc5739d90c&clk1=0ec444e9a881565f81e017bc5739d90c','Speck iPhone7手机壳',155.00,18,2,'/userdoc/4/baol/5/7f893316a1ca477bbd609a7c448375b3.jpeg',NULL,NULL,NULL,NULL,'2017-06-02 04:11:44','Speck','这次155属于历史低价了，其实不止这款，好多都是好价。','speck的手机壳一直在用，手感不错',NULL,0,0,0,0,0,NULL,1,NULL,4),(6,'https://re.jd.com/cps/item/2326913.html?cu=true&utm_source=www.linkstars.com&utm_medium=tuiguang&utm_campaign=t_1000089893_156_0_184__3oF6CZfAbx9gfZ6p3y7&utm_term=9a827de41f3548fd93ecf0d0b5bcdd4c&abt=3','【京东超市】金稻（KINGDOM）K-33C中草药热喷香薰蒸脸器 离子喷雾机面部清洁美容仪补水仪（粉色',49.00,4,1,'/userdoc/5/baol/6/58093b448e99448581a910de80150d10.jpeg','/userdoc/5/baol/6/494769569c3d4a60802e14f50fe60879.jpeg',NULL,NULL,NULL,'2017-06-02 04:15:04','金稻（KINGDOM）','参加199-100，凑单可达49元哒','这个好像没什么人爆料哇',NULL,0,0,0,0,1,NULL,1,NULL,5),(7,'http://item.mai.m.yiche.com/631/?rfpa_tracker=27_48_2177&cta_p=sy6_cu27_pc48_mt2177_wb143','购车必看： 奇瑞 瑞虎7    最高享2万优惠、500元补贴、200元AR红包',99.00,12,5,'/userdoc/5/baol/7/b9f66817e32e43d8b44f2c205ccbaa8b.png',NULL,NULL,NULL,NULL,'2017-06-02 04:18:58','奇瑞 瑞虎7 ','万元线下优惠（1万元现金优惠+8000元金融个贷补贴+6年12次免费保养或2000元现金优惠），前200名购车回传发票并审核通过的用户可获得易车500元返现补贴；','瑞虎7，是奇瑞品牌的紧凑型SUV，2017款共有两种动力总成分别是1.5T+6速双离合和2.0L+CVT（模拟7档）外观方面或许不是所有人都认为它好看，但它算得上设计最为大胆的中国品牌SUV之一。',NULL,0,0,0,0,2,'内容和实际不符',1,NULL,5),(8,'http://www.6pm.com/p/adidas-cloudfoam-advantage-clean/product/8812453?PID=5411495&AID=10538037&utm_source=SMZDM&splash=none&utm_medium=affiliate','adidas 阿迪达斯 Cloudfoam Advantage Clean 女款休闲运动鞋',380.00,46,1,'/userdoc/5/baol/8/60fef418e6b24ee8b7ec47a07570fb93.jpeg','/userdoc/5/baol/8/e890833d3d724deca19c4838499200e1.jpeg','/userdoc/5/baol/8/687df1cf0a1f447eab48ca20595d2817.jpeg',NULL,NULL,'2017-06-02 04:21:36','adidas 阿迪达斯','6PM目藏蓝色款售价42.99美元，US 5码起尺码齐全，转运到手约380元。6PM可任意凑单两件或满50美元免美国境内运费。国内同款代购价格在800元左右，黑色款售价43.99美元也是好价。','adidas 阿迪达斯 Cloudfoam Advantage Clean 女款休闲运动鞋使用翻毛皮革鞋面，质感出色。鞋帮处的填充让穿着更舒适。两侧采用透气孔的设计，排出了阿迪传统的三道杠样式。Cloudfoam SURROUND 记忆鞋垫能够模仿脚部轮廓，提升穿着的舒适度。Cloudfoam中底缓冲性出色，橡胶大底，防滑耐磨。',NULL,0,0,0,0,1,NULL,1,NULL,5),(9,'https://www.amazon.cn/dp/B01CQ8SEMO?t=ca_fx_191-23&tag=ca_fx_191-23','new balance 515系列 ML515COE 男款休闲运动鞋',280.00,45,3,'/userdoc/5/baol/9/f3e86a827d974c97b68aa83f2b1f57d1.jpeg',NULL,NULL,NULL,NULL,'2017-06-02 04:24:21','new balance','亚马逊再次特价，来到此前推荐低价，感兴趣的可以看看了~','之前在美国亚马逊买过一双，穿的很舒服，夏天也不热，这个价格也不错',NULL,0,0,0,0,1,NULL,1,NULL,5),(10,'https://re.jd.com/cps/item/4045116.html?cu=true&utm_source=www.linkstars.com&utm_medium=tuiguang&utm_campaign=t_1000089893_156_0_184__aWFACau5YvQduG48wJ3&utm_term=8e9f767acb054ec99190c4402a285f20&abt=3','WMF 福腾宝 不锈钢炒锅 28cm',599.00,450,1,'/userdoc/6/baol/10/8ab05b854eb94fbe8b4e1f2f18ef32a5.jpeg','/userdoc/6/baol/10/9fd05ade31b94582b6af3908b74adf7c.jpeg',NULL,NULL,NULL,'2017-06-02 04:39:18','WMF 福腾宝','京东目前售价999元，购买界面可以领取满799-400元优惠券，实付599元包邮，近期单买好价，需要的值友可以入手。','WMF 完美福 单柄中华炒锅直径28cm，锅身是WMF独家的Cromargan材质，在不锈钢中加入18%铬+10%镍，防锈且耐腐蚀。五层锻压通体锅底拥有良好的热传递以及均匀传递能力。锅盖采用旋转式设计，可灵活控制水蒸气。适用于煤气灶、电磁炉等多种炊具。',NULL,0,0,0,0,1,NULL,1,NULL,6),(11,'https://detail.tmall.com/item.htm?id=550971104162','Citylong 禧天龙 塑料垃圾桶套装 3件套',9.90,439,2,'/userdoc/6/baol/11/48251c4901db42829a725e23c855b198.jpeg',NULL,NULL,NULL,NULL,'2017-06-02 04:42:25','Citylong 禧天龙','天猫禧天龙旗舰店目前售价9.9元包邮，近期好价，大中小三个垃圾桶，基本满足扔垃圾需求','Citylong禧天龙是国内领先的塑料家居品牌，全国各大商超都有其产品销售，已经成为广大消费者耳熟能详的品牌。此款塑料垃圾桶套装包含有3个不同大小的垃圾桶，分别为1L+1.8L+7L，小桶可以放在桌面上收集桌面垃圾或者当做笔筒使用，大桶可以放在桌下当生活垃圾桶使用，整齐划一的风格配上色彩鲜艳的颜色可以提供一个很好的视觉效果，2毫米厚桶身坚固耐用，敞口设计更方便扔垃圾，有3种颜色可以选择。',NULL,0,0,0,0,1,NULL,1,NULL,6),(12,'http://item.epet.com/118929-16122-z.html','K9 宠物用 脱腥 挪威三文鱼油 250ml',66.00,444,2,'/userdoc/6/baol/12/a57ceda9f69841bba02332eb997b5ab7.jpeg',NULL,NULL,NULL,NULL,'2017-06-02 04:45:54','K9','E宠商城目前售价66元，单买需运费，建议凑单带回，较天猫店铺85元起售价，有一定优势','K9 Natural是新西兰DeloitteFsat50强企业，一直用最好的原料，做天然、生态的宠物用品，本次推荐的这款三文鱼油，选用优质脱腥挪威三文鱼油，富含有益脂肪酸omega3（DHA/EPA），可以促进心血管健全；添加优质的亚麻籽油，富含有omega3.6，可以改善皮肤健康状况，减轻皮肤问题；搭配优质的希腊橄榄油，可以促进吸收，调节机体免疫力，防止细胞老化；选用优质的葵花籽油，可以促进新陈代谢，加速伤口愈合，维持循环系统健康。规格为250ml，犬猫均可食用，可与日常主食混合食用，建议按照1kg体重：1ml三文鱼油的比例饲喂，每日不要超过10ml。',NULL,0,0,0,0,1,NULL,1,NULL,6),(13,'https://detail.tmall.hk/hk/item.htm?id=540334719390&ali_trackid=2:mm_25282911_3455987_13726438:1496350055_2k2_1477297311&upsid=8161414e21e8f4dde9a7141e2e0da95f&clk1=8161414e21e8f4dde9a7141e2e0da95f&skuId=3240036984129','B&B 保宁 婴儿洗衣液 1300ml 补充装 *4件',94.00,438,2,'/userdoc/6/baol/13/f546fe07afa94668b3eb403b03f9c056.jpeg',NULL,NULL,NULL,NULL,'2017-06-02 04:48:04','保宁','天猫国际官方直营目前预售99元，需要10元定金，可抵用15元，到手实付94元，折合23.5元/件，近期低价，夏天到来宝宝的衣物清洗的更加频繁，可多入手一些。','B&B 保宁是韩国著名的母婴用品品牌，这款保宁B&B洗衣液和其他系列产品一样，坚持不添加任何对幼儿身体有刺激的荧光增白剂、人工色素和防腐剂，温和没有刺激无毒无害。不仅如此，其洗涤产品中还为宝宝特别添加了能保护皮肤的发酵大豆、柳叶、马齿苋、肉桂等萃取成分，保护皮肤的同时还能起到抗菌的作用。再加上使用纯天然提取物作为洗涤成分，PH值是完全中性的7.0，所以即使是敏感的宝宝肌肤也能安心使用。',NULL,0,0,0,0,1,NULL,1,NULL,6),(14,'http://www.ba.de/1014975.html',' Doppelherz 双心 海水泛醇 滴鼻剂 20ml',27.00,63,3,'/userdoc/6/baol/14/2daa2c3727284c5f96679d43a0c01299.jpeg',NULL,NULL,NULL,NULL,'2017-06-02 04:55:37','Doppelherz','Doppelherz 双心海水泛醇滴鼻剂，加湿的100％等渗海盐溶液，保湿和清洁鼻粘膜，疏通鼻塞，湿润鼻腔。 对于急性鼻炎，过敏性鼻炎，慢性鼻炎（鼻窒），鼻窦炎等引起的鼻塞，流鼻涕，鼻痒等症状有效缓解；喷雾设计，使用更方便，更卫生。不含防腐剂，添加剂，色素香精等。如果在空调房办公室、长途飞机旅行途这类干燥环境中，也能很好的滋润鼻腔，没有依赖或成瘾作用，6岁+的儿童也可偶尔使用。','bodyguard apotheke中文官网售价3.65欧元，约27元，全场满68欧免邮；叠加满58欧用码“BA3HT”减3欧；满98欧用码“BA9805”减5欧，活动时间：5月30日-6月2日',NULL,0,1,0,1,1,NULL,1,NULL,6),(15,'https://re.jd.com/cps/item/2813571.html?cu=true&utm_source=www.linkstars.com&utm_medium=tuiguang&utm_campaign=t_1000089893_156_0_184__VPFPCzu8QOEpiLQyxNm&utm_term=e7fa3c5860474340be7bf94974c96c0e&abt=3','众果 100%纯果汁 玫瑰香紫葡萄混合果汁 1L*6盒 ',19.80,487,1,'/userdoc/7/baol/15/e3ac12c62ecf4dec8db1523a8268e806.jpeg','/userdoc/7/baol/15/756058523cfc4cb8b04317193ce0a4f1.jpeg',NULL,NULL,NULL,'2017-06-02 04:59:36','众果','京东报价19.8元，折一盒3.3元，限购10件，小编觉得这个葡萄汁比苹果汁要好喝一些，冰镇后拿出来喝一口沁人心脾，建议用瓷杯，现华北地区无货，其他大部分地区有货，喜欢可入。','此款果汁采用吐鲁番产区玫瑰香紫葡萄制作，玫瑰香浓，甜而不腻，果香四溢',NULL,0,0,0,0,1,NULL,1,NULL,7),(16,'https://www.amazon.cn/dp/B01MY7C62V?t=hwg_ca_yh_93-23&tag=hwg_ca_yh_93-23','TATSUMIYA 水中孵化恐龙蛋 蓝盒+绿盒',49.00,73,3,'/userdoc/7/baol/16/5c558be7efd4462aa280a983b9db75b4.jpeg','/userdoc/7/baol/16/6f4b645c7dbd4e40b91f6bcaf383c09a.jpeg',NULL,NULL,NULL,'2017-06-02 05:01:54','TATSUMIYA','亚马逊菲欧兰官方旗舰店售价59元，使用优惠码“SMZDM017”优惠10元后49元包邮，单个折合24.5元一个，持平之前推荐好价，蓝盒+绿盒一共两款，科教+趣味性兼具，喜欢的值友可以考虑入手。','TATSUMIYA水中孵化恐龙蛋，模拟真实小恐龙从恐龙蛋壳中孵化而出的场景，玩法很简单，放在水中24小时就可以破壳，72小时就可以变大。小恐龙使用的是EVA材质制成，具有良好的柔软性和弹性，表面的光泽性与化学稳定性也非常好，具有抗老化、耐臭氧、无毒的环保特性。\r\n\r\n从恐龙蛋的设计出发点来看，24小时的孵化过程可以让孩子见识动物孵化过程，锻炼孩子等待的耐心，孵化出来以后，让孩子每天给小恐龙换水，观察其成长过程，培养孩子观察力，教会孩子关心小动物，起到培养孩子爱心的作用。后期完成孵化的小动物可以拿出水，静置几天，因脱水而缩小变成动物模型后可供孩子们收集玩耍。需要注意的是，此款玩具适用于1岁半以上的孩童，3岁以下需要在父母陪伴下使用。另外有蓝绿两种颜色可选。',NULL,0,0,0,0,2,'图片不正确',1,NULL,7),(17,'https://re.jd.com/cps/item/4251126.html?cu=true&utm_source=www.linkstars.com&utm_medium=tuiguang&utm_campaign=t_1000089893_156_0_184__JPFdC6u5D5X5TR5rZvB&utm_term=0249eafc281a4a15a5018df290b09c71&abt=3','JELLYCAT 邦尼兔 经典害羞系列 毛绒公仔 中号 多种颜色 *2件',250.60,73,1,'/userdoc/7/baol/17/714e5f1d74eb4226b93ecb6a16f91c49.jpeg','/userdoc/7/baol/17/34a08e92b05d46aca487405319032f55.jpeg','/userdoc/7/baol/17/4944135ad12a44cf93ade873800ba6f7.jpeg',NULL,NULL,'2017-06-02 05:04:19','JELLYCAT 邦尼兔','京东全球购目前179元的白色碎花、郁金粉均可考虑购买，直接购买2件，然后领取满299减150优惠券，加上税费42.6元，到手价250.6元，每只折合约125.3元，好价可入，喜欢的朋友可以考虑购买，碎花款平时也较少参加活动，不如趁此机会入手，洁白的毛发，加上东北大花棉袄鲜红花朵碎花图案，真是时尚的不得了~','Jellycat于1999年在英国伦敦成立，并迅速成为世界最大的豪华软玩具公司，材料柔软，贴近宝宝肌肤，让大人和宝宝都可以放心亲近。过水后也不变形不退色，很多时尚女明星也大爱此品牌，也是阿汤哥心肝宝贝SURI最爱的玩具。',NULL,0,0,0,0,1,NULL,1,NULL,7),(18,'https://detail.tmall.com/item.htm?id=550376907962&ali_trackid=2:mm_25282911_3455987_13726438:1496351110_310_510161913&upsid=3c8413581cafb6c80989c5cbe4ccf37d&clk1=3c8413581cafb6c80989c5cbe4ccf37d&skuId=3543973163411','Hasbro 孩之宝 变形金刚 A6146 怒火钢锁',39.90,528,2,'/userdoc/7/baol/18/960a9ca3916e41a8a96769dea30322ce.jpeg','/userdoc/7/baol/18/d631193fbd024a569aa83c8edc9a301e.jpeg',NULL,NULL,NULL,'2017-06-02 05:06:51','Hasbro ',' 天猫专营店售价69.9元，领取30元券，实付39.9元包邮，其他渠道49元起。','孩之宝变形金刚 怒火钢锁A6146，人形态和恐龙形态任意变换，丰富逼真的细节做工，恐龙头部带声光效果，口部可发射导弹，可兼容部分其他变形金刚部件，包装尺寸37*25*9cm。',NULL,0,0,0,0,1,NULL,1,NULL,7),(19,'http://www.jomashop.com/ulysse-nardin-doorbuster-event.html?utm_medium=cpa&utm_campaign=5411495&utm_source=CJ',' JOMASHOP 精选 ULYSSES NARDIN 雅典 机械腕表 限时促销',2000.00,578,3,'/userdoc/7/baol/19/df5dbfdde2824a65b11d49dae979bd58.jpeg',NULL,NULL,NULL,NULL,'2017-06-02 05:22:11','JOMASHOP','JOMASHOP现有精选ULYSSES NARDIN 雅典 机械腕表专场促销，场内腕表低至3.6折优惠','人气Maxi Marine、Marine Chronometer等系列参与，高端航海风格腕表品牌，风格既有简约深邃，又有繁复张扬，保持复古风格的同时，也加入了现代运动元素，小三针、圆形日期小窗、动力显示、附表盘计时和陀飞轮等特性是ULYSSES NARDIN的标志，航海腕表的另一种诠释。优惠活动持续至北京时间6月7日中午12时。',NULL,0,0,0,3,1,NULL,1,NULL,7),(20,'https://item.jd.hk/2667306.html','飞利浦剃须刀',50.00,1,1,'/userdoc/5/baol/20/34f61b9be3d64544bebd18df0f1985d2.jpeg','/userdoc/5/baol/20/3c0a79fbe52f41d6ab0784fbd61c1a54.jpeg','/userdoc/5/baol/20/21b83d2ecd494fe3b26c93fd0fd618c3.jpeg',NULL,NULL,'2017-06-02 09:26:47','飞利浦','价格便宜','男人可以不帅 一定不能不干净 看脸的时代 无论事业、约会 洁净会给人很有魅力的印象 杂乱的胡茬则会给人邋遢的既视感 飞利浦剃须刀 清爽的一天从面部开始。',NULL,0,0,0,0,1,NULL,1,NULL,5),(21,'https://item.jd.com/1086357.html?jd_pop=3c9b9c5e-5eff-4773-95b3-e9d3e76871b4&abt=3','洛克（ROCK）苹果MFi认证数据线充电线 适用于苹果7iphone6s/plus/se/5/iPad 1米白色',120.00,17,2,'/userdoc/4/baol/21/01c5286294e241e9a411862ba7eb6a63.jpeg','/userdoc/4/baol/21/0f8106b03cae400f9c40a7f7a851fc5b.jpeg',NULL,NULL,NULL,'2017-06-02 14:43:59','巅峰','dfffdscc','dfdf',NULL,0,0,0,0,0,NULL,1,NULL,4);

/*Table structure for table `t_comm` */

DROP TABLE IF EXISTS `t_comm`;

CREATE TABLE `t_comm` (
  `comm_id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `user_id_one` int(10) unsigned NOT NULL COMMENT '发送用户',
  `user_id_other` int(10) unsigned NOT NULL COMMENT '接收用户',
  `comm_time` datetime DEFAULT NULL COMMENT '评论时间',
  `agree_num` int(10) unsigned DEFAULT '0' COMMENT '同意人数',
  `disagree_num` int(10) unsigned DEFAULT '0' COMMENT '不同意人数',
  `art_kind_id` int(2) unsigned DEFAULT NULL COMMENT '评论文章的类型,1:爆料；2:闲值',
  `art_id` int(10) unsigned NOT NULL COMMENT '评论文章的编号',
  `comm_punished` int(1) unsigned DEFAULT '1' COMMENT '评论是否被惩罚，1:可以显示；2:被惩罚，不能显示',
  `comm` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '评论内容',
  `one_nickname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发送用户',
  `other_nickname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '接收用户',
  `user_img` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comm_parent` int(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`comm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_comm` */

insert  into `t_comm`(`comm_id`,`user_id_one`,`user_id_other`,`comm_time`,`agree_num`,`disagree_num`,`art_kind_id`,`art_id`,`comm_punished`,`comm`,`one_nickname`,`other_nickname`,`user_img`,`comm_parent`) values (2,7,7,'2017-06-02 05:24:46',0,0,2,19,1,'买得起以上任一款还差减的钱吗？没诚意','后来','后来','/userdoc/7/userImage//3e8b23dc51b34e50b0b858e971c33b49.png',1),(3,4,7,'2017-06-02 05:25:15',0,0,2,19,1,'看中一款白盘蓝针，求大神解读','慌不慌','后来','/userdoc/4/userImage//46407f6901ce4875b293875f2fd92927.png',1),(4,6,7,'2017-06-02 05:25:37',0,0,2,19,1,'买不起....','hui家','后来','/userdoc/6/userImage//17c11b6575e94491bbf0b5dc7e22e4aa.png',1),(5,6,4,'2017-06-02 05:25:48',0,0,4,3,1,'买不起啊。。。。。','hui家','慌不慌',NULL,3),(6,6,7,'2017-06-02 05:26:01',0,0,4,2,1,'只能看，好伤','hui家','后来',NULL,1),(7,6,4,'2017-06-02 08:47:26',0,0,2,2,1,'这键盘打字的手感好吗？','hui家','慌不慌','/userdoc/6/userImage//17c11b6575e94491bbf0b5dc7e22e4aa.png',0),(8,4,6,'2017-06-02 08:48:14',0,0,4,7,1,'恩，很好的','慌不慌','hui家',NULL,7),(9,6,4,'2017-06-02 10:24:16',0,0,2,2,1,'不是很清楚的','hui家','慌不慌','/userdoc/6/userImage//17c11b6575e94491bbf0b5dc7e22e4aa.png',0),(10,6,4,'2017-06-02 10:24:28',0,0,2,2,1,'你以为呢','hui家','慌不慌','/userdoc/6/userImage//17c11b6575e94491bbf0b5dc7e22e4aa.png',0),(11,4,6,'2017-06-02 13:54:51',0,0,2,14,2,'应该已经涨价了','慌不慌','hui家','/userdoc/4/userImage//46407f6901ce4875b293875f2fd92927.png',0),(12,7,6,'2017-06-02 14:47:14',1,0,2,14,1,'好用','后来','hui家','/userdoc/7/userImage//3e8b23dc51b34e50b0b858e971c33b49.png',0),(13,6,7,'2017-06-02 14:48:11',0,0,4,12,1,'嗯嗯','hui家','后来',NULL,12),(14,7,6,'2017-06-02 14:49:10',0,0,4,13,1,'嗯谢谢','后来','hui家',NULL,12),(15,7,6,'2017-06-02 14:49:59',0,0,4,10,1,'的方法','后来','hui家',NULL,10);

/*Table structure for table `t_jub` */

DROP TABLE IF EXISTS `t_jub`;

CREATE TABLE `t_jub` (
  `jub_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `jub_kind_id` int(2) unsigned DEFAULT NULL COMMENT '1:用户；2:爆料；3:闲值；4:评论',
  `jub_info_id` int(10) unsigned NOT NULL COMMENT '被举报用户、爆料、闲值或评论的编号',
  `jub_reason` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '举报原因',
  `jub_time` datetime DEFAULT NULL COMMENT '举报时间',
  `user_id` int(10) unsigned NOT NULL COMMENT '发表举报的用户的编号',
  `j_tg_shenhe` int(1) unsigned DEFAULT '0' COMMENT '举报是否通过审核，0:正在审核，1:通过审核，2:不通过',
  `j_btg_reason` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '举报不通过原因',
  PRIMARY KEY (`jub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_jub` */

insert  into `t_jub`(`jub_id`,`jub_kind_id`,`jub_info_id`,`jub_reason`,`jub_time`,`user_id`,`j_tg_shenhe`,`j_btg_reason`) values (1,4,2,'内容和现实不符','2017-06-02 10:33:20',6,2,'图片不正确'),(2,2,14,'已涨价','2017-06-02 13:54:31',4,2,'内容和实际不符'),(3,4,11,'说的和内容不符','2017-06-02 13:55:29',6,1,NULL);

/*Table structure for table `t_kind` */

DROP TABLE IF EXISTS `t_kind`;

CREATE TABLE `t_kind` (
  `kind_id` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '种类id',
  `kind_name` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '种类名称',
  `kind_level` int(1) unsigned DEFAULT NULL COMMENT '种类级别',
  `kind_parent_id` int(4) unsigned DEFAULT NULL COMMENT '种类父元素',
  `search_num` int(10) unsigned DEFAULT '0' COMMENT '检索次数',
  PRIMARY KEY (`kind_id`)
) ENGINE=InnoDB AUTO_INCREMENT=609 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_kind` */

insert  into `t_kind`(`kind_id`,`kind_name`,`kind_level`,`kind_parent_id`,`search_num`) values (1,'电脑数码',1,0,12),(2,'家用电器',1,0,1),(3,'运动户外',1,0,6),(4,'个护化妆',1,0,5),(5,'服饰鞋包',1,0,0),(6,'母婴用品',1,0,10),(7,'日用百货',1,0,15),(8,'办公设备',1,0,1),(9,'食品保健',1,0,0),(10,'玩模乐器',1,0,0),(11,'家居家装',1,0,0),(12,'汽车用品',1,0,0),(13,'礼品钟表',1,0,0),(14,'图书音像',1,0,0),(15,'金融旅游',1,0,0),(16,'手机通讯',2,1,0),(17,'摄影摄像',2,1,0),(18,'数码配件',2,1,0),(19,'存储设备',2,1,0),(20,'影音播放',2,1,0),(21,'电脑整机',2,1,0),(22,'电脑外设',2,1,0),(23,'网络设备',2,1,0),(24,'电脑配件',2,1,0),(25,'穿戴设备',2,1,0),(26,'大家电',2,2,0),(27,'生活电器',2,2,0),(28,'厨房电器',2,2,0),(29,'个护健康',2,2,0),(30,'运动服饰',2,3,0),(31,'户外服饰',2,3,0),(32,'户外装备',2,3,0),(33,'体育项目',2,3,0),(34,'运动鞋袜',2,3,0),(35,'运动器材',2,3,0),(36,'户外鞋袜',2,3,0),(37,'面部护理',2,4,0),(38,'美发护发',2,4,0),(39,'身体护理',2,4,0),(40,'彩妆产品',2,4,0),(41,'口腔护理',2,4,0),(42,'眼睛护理',2,4,0),(43,'男装',2,5,0),(44,'女装',2,5,0),(45,'男鞋',2,5,0),(46,'女鞋',2,5,0),(47,'服装配饰',2,5,0),(48,'女包',2,5,0),(49,'男包',2,5,0),(50,'功能箱包',2,5,0),(51,'电脑数码包',2,5,0),(52,'奶粉',2,6,0),(53,'营养辅食',2,6,0),(54,'尿裤湿巾',2,6,0),(55,'喂养用品',2,6,0),(56,'洗护用品',2,6,0),(57,'孕产妇用品',2,6,0),(58,'婴儿家居安全',2,6,0),(59,'婴儿玩具',2,6,0),(60,'家居清洁',2,7,0),(61,'宠物用品',2,7,0),(62,'厨房用具',2,7,0),(63,'生活用品',2,7,0),(64,'成人用品',2,7,0),(65,'办公仪器',2,8,0),(66,'学生用品',2,8,0),(67,'办公用品',2,8,0),(68,'保健品',2,9,0),(69,'酒水饮料',2,9,0),(70,'粮油调味',2,9,0),(71,'休闲食品',2,9,0),(72,'奶类制品',2,9,0),(73,'玩具',2,10,0),(74,'模型',2,10,0),(75,'乐器',2,10,0),(76,'动漫周边',2,10,0),(77,'家装主材',2,11,0),(78,'五金电工',2,11,0),(79,'住宅家具',2,11,0),(80,'灯具灯饰',2,11,0),(81,'家纺布艺',2,11,0),(82,'车载电器',2,12,0),(83,'车用美容清洁',2,12,0),(84,'养护耗材',2,12,0),(85,'安全自驾',2,12,0),(86,'礼品',2,13,0),(87,'钟表',2,13,0),(88,'电子书刊',2,14,0),(89,'音像制品',2,14,0),(90,'软件游戏',2,14,0),(91,'图书杂志',2,14,0),(92,'票务',2,15,0),(93,'保险产品',2,15,0),(94,'充值产品',2,15,0),(95,'旅游',2,15,0),(96,'金融产品',2,15,0),(97,'智能手机',3,16,0),(98,'非智能手机',3,16,0),(99,'对讲机',3,16,0),(100,'手机蓝牙耳机',3,16,0),(101,'单反机身',3,17,0),(102,'微单相机',3,17,0),(103,'数码相机',3,17,0),(104,'家用摄像机',3,17,0),(105,'专业摄像机',3,17,0),(106,'单反镜头',3,17,0),(107,'微单镜头',3,17,0),(108,'脚架',3,17,0),(109,'闪光灯',3,17,0),(110,'相机配件',3,17,0),(111,'充电器',3,18,0),(112,'电池',3,18,0),(113,'电脑支架',3,18,0),(114,'移动电源',3,18,0),(115,'触控笔',3,18,0),(116,'其他数码配件',3,18,0),(117,'存储卡',3,19,0),(118,'移动硬盘',3,19,0),(119,'磁盘阵列',3,19,0),(120,'U盘',3,19,0),(121,'NAS存储',3,19,0),(122,'存储配件',3,19,0),(123,'随身播放器',3,20,0),(124,'耳塞式耳机',3,20,0),(125,'头戴式耳机',3,20,0),(126,'多媒体音箱',3,20,0),(127,'插卡音箱',3,20,0),(128,'基座音箱',3,20,0),(129,'HIFI音箱',3,20,0),(130,'无线音箱',3,20,0),(131,'便携音箱',3,20,0),(132,'电视盒子',3,20,0),(133,'录音笔',3,20,0),(134,'麦克风',3,20,0),(135,'调音台',3,20,0),(136,'耳机放大器',3,20,0),(137,'监听音箱',3,20,0),(138,'监听耳机',3,20,0),(139,'平板电脑',3,21,0),(140,'普通笔记本',3,21,0),(141,'游戏本',3,21,0),(142,'触控笔记本',3,21,0),(143,'超级本',3,21,0),(144,'上网本',3,21,0),(145,'台式机',3,21,0),(146,'服务器',3,21,0),(147,'鼠标',3,22,0),(148,'键盘',3,22,0),(149,'游戏机',3,22,0),(150,'游戏手柄',3,22,0),(151,'游戏摇杆',3,22,0),(152,'游戏眼镜',3,22,0),(153,'无线键盘',3,22,0),(154,'耳麦',3,22,0),(155,'触控板',3,22,0),(156,'数位板',3,22,0),(157,'手写板',3,22,0),(158,'鼠标垫',3,22,0),(159,'其他电脑外设',3,22,0),(160,'路由器',3,23,0),(161,'交换机',3,23,0),(162,'网卡',3,23,0),(163,'主板',3,24,0),(164,'CPU',3,24,0),(165,'显卡',3,24,0),(166,'固态硬盘',3,24,0),(167,'普通硬盘',3,24,0),(168,'内存',3,24,0),(169,'机箱',3,24,0),(170,'电脑电源',3,24,0),(171,'显示器',3,24,0),(172,'刻录机',3,24,0),(173,'散热器',3,24,0),(174,'声卡',3,24,0),(175,'UPS电源',3,24,0),(176,'其他电脑配件',3,24,0),(177,'智能手环',3,25,0),(178,'智能手表',3,25,0),(179,'智能眼镜',3,25,0),(180,'其他智能设备',3,25,0),(181,'电视',3,26,0),(182,'冰箱',3,26,0),(183,'洗衣机',3,26,0),(184,'空调',3,26,0),(185,'烟机炊具',3,26,0),(186,'热水器',3,26,0),(187,'冷柜',3,26,0),(188,'家庭影院',3,26,0),(189,'大家电配件',3,26,0),(190,'空气净化器',3,27,0),(191,'吸尘器',3,27,0),(192,'净水设备',3,27,0),(193,'饮水机',3,27,0),(194,'取暖电器',3,27,0),(195,'电风扇',3,27,0),(196,'加湿器',3,27,0),(197,'除湿器',3,27,0),(198,'熨衣干衣',3,27,0),(199,'电话机',3,27,0),(200,'收音录音',3,27,0),(201,'其他生活电器',3,27,0),(202,'榨汁机',3,28,0),(203,'豆浆机',3,28,0),(204,'电饭煲',3,28,0),(205,'面包机',3,28,0),(206,'咖啡机',3,28,0),(207,'微波炉',3,28,0),(208,'电烤箱',3,28,0),(209,'电压力锅',3,28,0),(210,'电水壶',3,28,0),(211,'消毒柜',3,28,0),(212,'洗碗机',3,28,0),(213,'电磁炉',3,28,0),(214,'电炖锅',3,28,0),(215,'电炸锅',3,28,0),(216,'冰淇淋机',3,28,0),(217,'电动牙刷',3,29,0),(218,'冲牙器',3,29,0),(219,'牙刷消毒器',3,29,0),(220,'电动剃须刀',3,29,0),(221,'鼻毛修剪器',3,29,0),(222,'电动理发器',3,29,0),(223,'电吹风',3,29,0),(224,'洁面仪',3,29,0),(225,'蒸面器',3,29,0),(226,'血压计',3,29,0),(227,'按摩椅',3,29,0),(228,'按摩器',3,29,0),(229,'足浴盆',3,29,0),(230,'血糖测量',3,29,0),(231,'电子秤',3,29,0),(232,'体温计',3,29,0),(233,'助听器',3,29,0),(234,'治疗仪',3,29,0),(235,'洗鼻器',3,29,0),(236,'计步器',3,29,0),(237,'制氧机',3,29,0),(238,'运动背包',3,30,0),(239,'运动羽绒服',3,30,0),(240,'运动棉服',3,30,0),(241,'运动夹克',3,30,0),(242,'运动卫衣',3,30,0),(243,'运动长裤',3,30,0),(244,'运动短裤',3,30,0),(245,'运动T恤',3,30,0),(246,'冲锋衣裤',3,31,0),(247,'羽绒衣裤',3,31,0),(248,'户外棉服',3,31,0),(249,'户外卫衣',3,31,0),(250,'软壳',3,31,0),(251,'压缩衣',3,31,0),(252,'压缩裤',3,31,0),(253,'速干衣裤',3,31,0),(254,'抓绒衣裤',3,31,0),(255,'功能内衣',3,31,0),(256,'户外眼镜',3,31,0),(257,'户外围巾',3,31,0),(258,'户外手套',3,31,0),(259,'户外头巾',3,31,0),(260,'功能衣裤',3,31,0),(261,'滑雪服',3,31,0),(262,'户外背包',3,32,0),(263,'望远镜',3,32,0),(264,'帐篷',3,32,0),(265,'心率表',3,32,0),(266,'户外照明',3,32,0),(267,'户外水具',3,32,0),(268,'手杖',3,32,0),(269,'垂钓用品',3,32,0),(270,'躺椅',3,32,0),(271,'户外工具',3,32,0),(272,'炉具',3,32,0),(273,'登山装备',3,32,0),(274,'野营烧烤',3,32,0),(275,'睡袋',3,32,0),(276,'仪表',3,32,0),(277,'战术笔',3,32,0),(278,'夜视仪',3,32,0),(279,'多功能工具钳',3,32,0),(280,'游泳装备',3,33,0),(281,'健身器械',3,33,0),(282,'轮滑运动',3,33,0),(283,'骑行运动',3,33,0),(284,'羽毛球具',3,33,0),(285,'篮球',3,33,0),(286,'乒乓球',3,33,0),(287,'足球',3,33,0),(288,'网球',3,33,0),(289,'排球',3,33,0),(290,'高尔夫',3,33,0),(291,'武术搏击',3,33,0),(292,'瑜伽运动',3,33,0),(293,'台球',3,33,0),(294,'橄榄球',3,33,0),(295,'棒球',3,33,0),(296,'篮球鞋',3,34,0),(297,'跑步鞋',3,34,0),(298,'训练鞋',3,34,0),(299,'网球鞋',3,34,0),(300,'足球鞋',3,34,0),(301,'休闲运动鞋',3,34,0),(302,'运动帆布鞋',3,34,0),(303,'运动板鞋',3,34,0),(304,'羽毛球鞋',3,34,0),(305,'运动袜',3,34,0),(306,'跑步机',3,35,0),(307,'哑铃',3,35,0),(308,'仰卧板',3,35,0),(309,'健身车',3,35,0),(310,'运动护具',3,35,0),(311,'溯溪鞋',3,36,0),(312,'越野跑鞋',3,36,0),(313,'登山鞋',3,36,0),(314,'徒步鞋',3,36,0),(315,'沙滩鞋',3,36,0),(316,'五趾鞋',3,36,0),(317,'速干袜',3,36,0),(318,'户外拖鞋',3,36,0),(319,'洁面产品',3,37,0),(320,'眼部护理',3,37,0),(321,'护肤精华',3,37,0),(322,'面霜',3,37,0),(323,'乳液',3,37,0),(324,'爽肤水',3,37,0),(325,'面膜面贴',3,37,0),(326,'T区护理',3,37,0),(327,'防晒隔离',3,37,0),(328,'颈部护理',3,37,0),(329,'剃须用品',3,37,0),(330,'洗发水',3,38,0),(331,'护发乳',3,38,0),(332,'发膜',3,38,0),(333,'染发造型',3,38,0),(334,'梳子',3,38,0),(335,'发剪',3,38,0),(336,'发卷',3,38,0),(337,'沐浴产品',3,39,0),(338,'身体乳液',3,39,0),(339,'身体防晒',3,39,0),(340,'脱毛产品',3,39,0),(341,'胸部护理',3,39,0),(342,'手足护理',3,39,0),(343,'精油香薰',3,39,0),(344,'女性护理',3,39,0),(345,'男性护理',3,39,0),(346,'香水',3,40,0),(347,'面部彩妆',3,40,0),(348,'眼部彩妆',3,40,0),(349,'唇部彩妆',3,40,0),(350,'卸妆产品',3,40,0),(351,'美甲产品',3,40,0),(352,'美容产品',3,40,0),(353,'牙膏',3,41,0),(354,'牙刷',3,41,0),(355,'漱口水',3,41,0),(356,'牙齿美白',3,41,0),(357,'假牙护理',3,41,0),(358,'口腔清新剂',3,41,0),(359,'眼镜框架',3,42,0),(360,'护目镜',3,42,0),(361,'防疲劳眼镜',3,42,0),(362,'润眼液',3,42,0),(363,'眼罩',3,42,0),(364,'男上装',3,43,0),(365,'男外套',3,43,0),(366,'男裤',3,43,0),(367,'女上装',3,44,0),(368,'女外套',3,44,0),(369,'女裤',3,44,0),(370,'男士商务鞋',3,45,0),(371,'男士休闲鞋',3,45,0),(372,'男靴',3,45,0),(373,'女士休闲鞋',3,46,0),(374,'女式凉鞋',3,46,0),(375,'女靴',3,46,0),(376,'女士单鞋',3,46,0),(377,'家居内衣',3,47,0),(378,'太阳镜',3,47,0),(379,'皮带',3,47,0),(380,'手套',3,47,0),(381,'帽子',3,47,0),(382,'女士钱包',3,48,0),(383,'女士手提包',3,48,0),(384,'女士斜挎包',3,48,0),(385,'女士双肩包',3,48,0),(386,'女士单肩包',3,48,0),(387,'女士手拿包',3,48,0),(388,'男士钱包',3,49,0),(389,'商务公文包',3,49,0),(390,'男士单肩包',3,49,0),(391,'男士手包',3,49,0),(392,'旅行箱包',3,50,0),(393,'休闲运动包',3,50,0),(394,'双肩电脑包',3,51,0),(395,'单肩电脑包',3,51,0),(396,'单反相机包',3,51,0),(397,'婴儿奶粉',3,52,0),(398,'妈妈奶粉',3,52,0),(399,'特殊配方奶粉',3,52,0),(400,'初乳',3,53,0),(401,'米粉菜粉',3,53,0),(402,'果汁果泥',3,53,0),(403,'肉松饼干',3,53,0),(404,'婴儿辅食',3,53,0),(405,'婴幼营养',3,53,0),(406,'孕期营养',3,53,0),(407,'婴儿尿裤',3,54,0),(408,'婴儿湿巾',3,54,0),(409,'奶瓶',3,55,0),(410,'吸奶器',3,55,0),(411,'暖奶消毒',3,55,0),(412,'牙胶安抚',3,55,0),(413,'儿童餐具',3,55,0),(414,'儿童水具',3,55,0),(415,'宝宝护肤',3,56,0),(416,'孕妇护肤',3,56,0),(417,'洗浴用品',3,56,0),(418,'婴幼儿洗发水',3,56,0),(419,'婴幼儿沐浴露',3,56,0),(420,'婴儿清洁用品',3,56,0),(421,'婴儿护理用品',3,56,0),(422,'背婴带',3,57,0),(423,'产后塑身',3,57,0),(424,'防辐射服',3,57,0),(425,'胎教用品',3,57,0),(426,'童装',3,58,0),(427,'安全座椅',3,58,0),(428,'婴儿推车',3,58,0),(429,'婴儿床',3,58,0),(430,'婴儿家纺',3,58,0),(431,'婴儿餐椅',3,58,0),(432,'婴儿安全用品',3,58,0),(433,'摇铃床铃',3,59,0),(434,'健身架',3,59,0),(435,'早教启智',3,59,0),(436,'拖拉玩具',3,59,0),(437,'纸品湿巾',3,60,0),(438,'衣物清洁',3,60,0),(439,'清洁工具',3,60,0),(440,'居室清洁',3,60,0),(441,'驱虫用品',3,60,0),(442,'宠物主粮',3,61,0),(443,'宠物零食',3,61,0),(444,'宠物营养',3,61,0),(445,'宠物玩具服饰',3,61,0),(446,'宠物出行装备',3,61,0),(447,'宠物医护美容',3,61,0),(448,'宠物家居日用',3,61,0),(449,'餐具',3,62,0),(450,'烹饪锅具',3,62,0),(451,'刀剪砧板',3,62,0),(452,'收纳保鲜',3,62,0),(453,'水具酒具',3,62,0),(454,'收纳用品',3,63,0),(455,'缝纫用品',3,63,0),(456,'安全健康',3,63,0),(457,'雨伞雨具',3,63,0),(458,'浴室用品',3,63,0),(459,'洗晒用品',3,63,0),(460,'净化除味',3,63,0),(461,'安全避孕',3,64,0),(462,'验孕测孕',3,64,0),(463,'情爱玩具',3,64,0),(464,'人体润滑',3,64,0),(465,'投影设备',3,65,0),(466,'打印机',3,65,0),(467,'扫描仪',3,65,0),(468,'传真机',3,65,0),(469,'办公一体机',3,65,0),(470,'办公耗材',3,65,0),(471,'会议设备',3,65,0),(472,'安防监控',3,65,0),(473,'其他办公设备',3,65,0),(474,'电子教育',3,66,0),(475,'教具文具',3,66,0),(476,'美术用品',3,66,0),(477,'日常办公',3,67,0),(478,'书写工具',3,67,0),(479,'钢笔',3,67,0),(480,'纸品',3,67,0),(481,'基础健康',3,68,0),(482,'美体养颜',3,68,0),(483,'滋润调养',3,68,0),(484,'综合营养',3,68,0),(485,'植物营养素',3,68,0),(486,'茶类',3,69,0),(487,'饮料',3,69,0),(488,'咖啡',3,69,0),(489,'酒类',3,69,0),(490,'冲调饮品',3,69,0),(491,'米面杂粮',3,70,0),(492,'食用油',3,70,0),(493,'调味品',3,70,0),(494,'方便食品',3,70,0),(495,'有机食品',3,70,0),(496,'休闲零食',3,71,0),(497,'肉干肉松',3,71,0),(498,'蜜饯果脯',3,71,0),(499,'糖果',3,71,0),(500,'巧克力',3,71,0),(501,'饼干糕点',3,71,0),(502,'牛奶',3,72,0),(503,'成人奶粉',3,72,0),(504,'奶类饮料',3,72,0),(505,'酸奶',3,72,0),(506,'奶酪',3,72,0),(507,'黄油',3,72,0),(508,'其他奶制品',3,72,0),(509,'乐高',3,73,0),(510,'桌游',3,73,0),(511,'遥控玩具',3,73,0),(512,'电动玩具',3,73,0),(513,'健身玩具',3,73,0),(514,'积木拼插',3,73,0),(515,'DIY玩具',3,73,0),(516,'创意减压玩具',3,73,0),(517,'绘画工具',3,73,0),(518,'仿真模型',3,74,0),(519,'拼插模型',3,74,0),(520,'吉他贝斯',3,75,0),(521,'电子琴',3,75,0),(522,'手风琴',3,75,0),(523,'小提琴',3,75,0),(524,'口琴',3,75,0),(525,'架子鼓',3,75,0),(526,'话筒',3,75,0),(527,'电影周边',3,76,0),(528,'卡通周边',3,76,0),(529,'游戏周边',3,76,0),(530,'装修主材',3,77,0),(531,'厨房用品',3,77,0),(532,'卫浴用品',3,77,0),(533,'洁身器',3,77,0),(534,'五金工具',3,78,0),(535,'电气开关',3,78,0),(536,'家用五金',3,78,0),(537,'园艺用品',3,78,0),(538,'书房家具',3,79,0),(539,'客厅家具',3,79,0),(540,'卧室家具',3,79,0),(541,'餐厅家具',3,79,0),(542,'门厅家具',3,79,0),(543,'阳台户外',3,79,0),(544,'家具饰品',3,79,0),(545,'节能灯',3,80,0),(546,'落地灯',3,80,0),(547,'吸顶灯',3,80,0),(548,'吊灯',3,80,0),(549,'布艺毯类',3,81,0),(550,'床上家纺',3,81,0),(551,'导航仪',3,82,0),(552,'行车记录仪',3,82,0),(553,'胎压监测',3,82,0),(554,'车载蓝牙',3,82,0),(555,'车载电源',3,82,0),(556,'充气泵',3,82,0),(557,'车载空气净化器',3,82,0),(558,'其他车载电器',3,82,0),(559,'漆面美容',3,83,0),(560,'车内清洁',3,83,0),(561,'玻璃美容',3,83,0),(562,'洗车配件',3,83,0),(563,'实用装饰',3,83,0),(564,'机油',3,84,0),(565,'添加剂',3,84,0),(566,'刹车油',3,84,0),(567,'变速箱油',3,84,0),(568,'洗车设备',3,84,0),(569,'金属养护',3,84,0),(570,'汽车配件',3,84,0),(571,'安全座椅',3,85,0),(572,'自驾应急',3,85,0),(573,'火机烟具',3,86,0),(574,'礼品刀具',3,86,0),(575,'工艺礼品',3,86,0),(576,'其他礼品',3,86,0),(577,'珠宝首饰',3,86,0),(578,'男表',3,87,0),(579,'女表',3,87,0),(580,'钟',3,87,0),(581,'怀表',3,87,0),(582,'少儿',3,88,0),(583,'杂志',3,88,0),(584,'文学',3,88,0),(585,'文化',3,88,0),(586,'科技',3,88,0),(587,'生活',3,88,0),(588,'流行',3,88,0),(589,'经管',3,88,0),(590,'音乐',3,89,0),(591,'影视',3,89,0),(592,'教育',3,89,0),(593,'游戏软件',3,90,0),(594,'办公软件',3,90,0),(595,'系统软件',3,90,0),(596,'财务软件',3,90,0),(597,'服务软件',3,90,0),(598,'杀毒软件',3,90,0),(599,'经济管理',3,91,0),(600,'文化艺术',3,91,0),(601,'少儿读物',3,91,0),(602,'流行娱乐',3,91,0),(603,'文学诗歌',3,91,0),(604,'生活教育',3,91,0),(605,'科学技术',3,91,0),(606,'期刊杂志',3,91,0),(607,'漫画',3,91,0),(608,'工具书',3,91,0);

/*Table structure for table `t_mall` */

DROP TABLE IF EXISTS `t_mall`;

CREATE TABLE `t_mall` (
  `mall_id` int(2) unsigned NOT NULL AUTO_INCREMENT COMMENT '商城Id',
  `mall_name` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '商城名称',
  PRIMARY KEY (`mall_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_mall` */

insert  into `t_mall`(`mall_id`,`mall_name`) values (1,'京东'),(2,'天猫'),(3,'亚马逊中国'),(4,'苏宁易购'),(5,'聚划算'),(6,'当当'),(7,'中粮我买网'),(8,'1号店');

/*Table structure for table `t_punish` */

DROP TABLE IF EXISTS `t_punish`;

CREATE TABLE `t_punish` (
  `punish_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '惩罚编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `user_p_reason` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户被惩罚原因',
  `p_begin_time` datetime DEFAULT NULL COMMENT '惩罚开始时间',
  `p_end_time` datetime DEFAULT NULL COMMENT '惩罚结束时间',
  PRIMARY KEY (`punish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_punish` */

insert  into `t_punish`(`punish_id`,`user_id`,`user_p_reason`,`p_begin_time`,`p_end_time`) values (1,4,'应该已经涨价了因说的和内容不符而被惩罚','2017-06-02 13:56:02','2017-06-02 14:56:02');

/*Table structure for table `t_shouc` */

DROP TABLE IF EXISTS `t_shouc`;

CREATE TABLE `t_shouc` (
  `shouc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏编号',
  `user_id` int(10) unsigned NOT NULL COMMENT '收藏的用户编号',
  `art_kind_id` int(2) unsigned DEFAULT NULL COMMENT '收藏文章的类型，1:用户；2:爆料；3:闲值；4:评论',
  `art_id` int(10) unsigned NOT NULL COMMENT '收藏文章的编号',
  `shouc_time` datetime DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`shouc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_shouc` */

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `nickname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '昵称',
  `password` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `tel` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `last_sign_time` datetime DEFAULT NULL COMMENT '上次签到时间',
  `last_login_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上次登录IP',
  `user_level` int(1) unsigned DEFAULT '2' COMMENT '用户级别，分为管理员、用户、审核员',
  `user_punished` int(1) unsigned DEFAULT '1' COMMENT '是否被惩罚，1:没被惩罚；0:被惩罚',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_user` */

insert  into `t_user`(`user_id`,`nickname`,`password`,`email`,`tel`,`last_login_time`,`last_sign_time`,`last_login_ip`,`user_level`,`user_punished`) values (1,'admin','123456','admin@tj.com',NULL,NULL,NULL,NULL,0,1),(2,'examine','123456','examine@tj.com',NULL,NULL,NULL,NULL,1,1),(3,'审核员','123456','examine1@tj.com',NULL,NULL,NULL,NULL,1,1),(4,'慌不慌','123','1710550406@qq.com',NULL,'2017-06-02 03:29:39','2017-06-02 14:42:28','127.0.0.1',2,1),(5,'天谕','123456','admin12@qq.com',NULL,'2017-06-02 04:12:00',NULL,'127.0.0.1',2,1),(6,'hui家','12','xiao@qq.com',NULL,'2017-06-02 04:35:08',NULL,'127.0.0.1',2,1),(7,'后来','12345','165723@qq.com',NULL,'2017-06-02 04:56:49',NULL,'127.0.0.1',2,1);

/*Table structure for table `t_user_info` */

DROP TABLE IF EXISTS `t_user_info`;

CREATE TABLE `t_user_info` (
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  `nickname` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '昵称',
  `user_img` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像路径',
  `credit` int(10) unsigned DEFAULT '0' COMMENT '积分',
  `exp` int(10) unsigned DEFAULT '0' COMMENT '经验',
  `level` int(4) unsigned DEFAULT '1' COMMENT '等级',
  `intro` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '个人介绍',
  `baol_num` int(10) unsigned DEFAULT '0' COMMENT '爆料数',
  `xianz_num` int(10) unsigned DEFAULT '0' COMMENT '闲值数',
  `comm_num` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `shouc_num` int(10) unsigned DEFAULT '0' COMMENT '收藏数',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_user_info` */

insert  into `t_user_info`(`user_id`,`nickname`,`user_img`,`credit`,`exp`,`level`,`intro`,`baol_num`,`xianz_num`,`comm_num`,`shouc_num`) values (1,'admin',NULL,0,0,1,NULL,0,0,0,0),(2,'examine',NULL,0,0,1,NULL,0,0,0,0),(3,'审核员',NULL,0,0,1,NULL,0,0,0,0),(4,'慌不慌','/userdoc/4/userImage//46407f6901ce4875b293875f2fd92927.png',90,30,1,NULL,3,0,3,0),(5,'天谕','/images/S2.png',80,40,1,NULL,4,0,0,0),(6,'hui家','/userdoc/6/userImage//17c11b6575e94491bbf0b5dc7e22e4aa.png',110,60,1,NULL,5,1,7,0),(7,'后来','/userdoc/7/userImage//3e8b23dc51b34e50b0b858e971c33b49.png',50,50,1,'努力之中++',4,1,4,0);

/*Table structure for table `t_xianz` */

DROP TABLE IF EXISTS `t_xianz`;

CREATE TABLE `t_xianz` (
  `xianz_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '闲值编号',
  `xianz_url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '闲置链接',
  `xianz_title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '闲值标题',
  `z_price` decimal(12,2) unsigned DEFAULT NULL COMMENT '转让价',
  `r_price` decimal(12,2) unsigned DEFAULT NULL COMMENT '入手价',
  `kind_id` int(4) unsigned NOT NULL COMMENT '商品种类编号',
  `chengse_id` int(4) unsigned DEFAULT NULL COMMENT '成色编号',
  `address_id` int(10) unsigned DEFAULT NULL COMMENT '所在地编号',
  `xianz_time` datetime DEFAULT NULL COMMENT '发布闲值时间',
  `z_reason` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '转让原因',
  `r_way` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '入手渠道',
  `is_or_not_send` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否包邮',
  `is_or_not_cutp` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '是否接受议价',
  `xianz_intro` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '闲值介绍',
  `xianz_img_one` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '闲值图片',
  `xianz_img_two` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xianz_img_three` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xianz_img_four` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xianz_img_five` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rspz_img_one` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '入手凭证图片',
  `rspz_img_two` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rspz_img_three` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rspz_img_four` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rspz_img_five` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `x_shouc_num` int(10) unsigned DEFAULT '0' COMMENT '被收藏数',
  `x_comm_num` int(10) unsigned DEFAULT '0' COMMENT '被评论数',
  `x_tg_shenhe` int(1) unsigned DEFAULT '0' COMMENT '闲值是否通过审核，0:正在审核；1:通过审核；2:不通过审核',
  `x_btg_reason` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '闲值不通过审核的原因',
  `xianz_punished` int(1) unsigned DEFAULT '1' COMMENT '闲值是否被惩罚，1:无；2:被惩罚，不能显示',
  `xianz_p_reason` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '闲值被惩罚原因',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户编号',
  PRIMARY KEY (`xianz_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `t_xianz` */

insert  into `t_xianz`(`xianz_id`,`xianz_url`,`xianz_title`,`z_price`,`r_price`,`kind_id`,`chengse_id`,`address_id`,`xianz_time`,`z_reason`,`r_way`,`is_or_not_send`,`is_or_not_cutp`,`xianz_intro`,`xianz_img_one`,`xianz_img_two`,`xianz_img_three`,`xianz_img_four`,`xianz_img_five`,`rspz_img_one`,`rspz_img_two`,`rspz_img_three`,`rspz_img_four`,`rspz_img_five`,`x_shouc_num`,`x_comm_num`,`x_tg_shenhe`,`x_btg_reason`,`xianz_punished`,`xianz_p_reason`,`user_id`) values (1,'https://2.smzdm.com/p/113476/','绘本《大卫，不可以》全新未拆封',10.00,33.80,601,1,1,'2017-06-02 05:14:07','购于京东，买重了，现低价转让，邮费到付，最好自取！','网上','不包邮','否','绘本《大卫，不可以》全新未拆封','/userdoc/7/xianz/1/xImg/f7679737156341b8bdb28bcf979bf245.jpeg','/userdoc/7/xianz/1/xImg/2dc256469d144f8696e8cad3136122ea.jpeg',NULL,NULL,NULL,'/userdoc/7/xianz/1/rspz/4fdeb4fa014b4364b89b5c649ebdd091.jpeg',NULL,NULL,NULL,NULL,0,0,0,NULL,1,NULL,7),(2,'http://zhuanzhuan.58.com/detail/867027639582294022z.shtml','steady.杂志，送多功能卡包（全新未拆）',100.00,120.00,602,1,276,'2017-06-02 05:18:06','买太多','日本亚马逊','包中通','否','steady.杂志五月号，杂志将近1公斤，运费50+，送美美的多功能卡包，不得不入，一经售出不退换！','/userdoc/7/xianz/2/xImg/6b80ef96cfb2497a9dfe9c33dbcab5c2.jpeg','/userdoc/7/xianz/2/xImg/34a7bf0e031346d1a8df380ba1306576.jpeg',NULL,NULL,NULL,'/userdoc/7/xianz/2/rspz/25c12e9a6495434eb8c5690232c92214.jpeg',NULL,NULL,NULL,NULL,0,0,1,NULL,1,NULL,7),(3,'https://2.smzdm.com/p/113476/','jshdjfh士大夫的疯狂',10.00,12.00,1,2,104,'2017-06-02 11:18:25','sdfl','京东','不包邮','否','是低风险进出口','/userdoc/4/xianz/3/xImg/8c5e3d5c417c4a108f165379cfebcbaa.jpeg','/userdoc/4/xianz/3/xImg/0d642ebdc15c4df8b361e50a4eefeedc.jpeg',NULL,NULL,NULL,'/userdoc/4/xianz/3/rspz/38d7057e6d6f4fb2b4f5bcf5b2b7eaa3.png',NULL,NULL,NULL,NULL,0,0,2,'内容和实际不符',1,NULL,4);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
