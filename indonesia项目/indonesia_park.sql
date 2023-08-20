/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80100
 Source Host           : localhost:3306
 Source Schema         : indonesia_park

 Target Server Type    : MySQL
 Target Server Version : 80100
 File Encoding         : 65001

 Date: 20/08/2023 10:33:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `park_id` bigint NOT NULL COMMENT '产业园id',
  `tag_id` bigint NOT NULL COMMENT '标签id',
  `content_html` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT '文章内容html',
  `sort` int NOT NULL DEFAULT 0 COMMENT '顺序',
  `status` int NULL DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '内容文章' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int NULL DEFAULT NULL COMMENT '类型   1 分类一  2 分类二',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '分类名称',
  `sort` int NOT NULL DEFAULT 0 COMMENT '顺序',
  `status` int NULL DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_category_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '指引分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (23, NULL, '热门标签', 0, NULL, '2023-08-18 09:18:38', '2023-08-18 09:18:42', 1, 1);
INSERT INTO `category` VALUES (24, NULL, '日常生活', 2, NULL, '2023-08-18 09:19:15', '2023-08-18 09:19:18', 1, 1);
INSERT INTO `category` VALUES (25, NULL, '新人须知', 1, NULL, '2023-08-18 09:21:19', '2023-08-18 09:21:22', 1, 1);
INSERT INTO `category` VALUES (26, NULL, '职场概要', 3, NULL, '2023-08-18 10:40:52', '2023-08-18 10:40:54', 1, 1);
INSERT INTO `category` VALUES (27, NULL, '其他', 4, NULL, '2023-08-18 10:44:47', '2023-08-18 10:44:51', 1, 1);

-- ----------------------------
-- Table structure for park
-- ----------------------------
DROP TABLE IF EXISTS `park`;
CREATE TABLE `park`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int NULL DEFAULT NULL COMMENT '类型   1 中国产业园 2 其他',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '产业名称',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '园区图片概览',
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT '描述信息',
  `sort` int NOT NULL DEFAULT 0 COMMENT '顺序',
  `status` int NULL DEFAULT NULL COMMENT '分类状态 0:禁用，1:启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  `info_source` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '信息来源',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_park_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '产业园及分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of park
-- ----------------------------
INSERT INTO `park` VALUES (1, 1, '青山印尼WedaBay工业园', 'https://mmbiz.qpic.cn/mmbiz_png/9icmBVER9c9p5giac2LWaTXyMjsHapEc03EaLTKYQv4iaawiczIoChO2JGpRZk8iblvTLFOicevjbD8v917odpf6tU9g/640?wx_fmt=png&tp=wxpic&wxfrom=5&wx_lazy=1&wx_co=1', '   印尼WedaBay工业园区（IWIP）,位于印度尼西亚北马鲁古省中哈马黑拉县哈马黑拉岛中纬达区，项目占地总面积约2500公顷。印尼纬达贝镍业公司拥有世界级的镍矿资源（矿权面积45000HA），镍矿品位高；园区依山傍海，拥有长达10公里的超级海岸线资源，沿岸驳船便利；园区机场于2019年7月14日投入使用。项目建成后，园区将成为世界上第一个从红土镍矿到镍中间品，再到新能源电池材料的镍资源综合利用的绿色可持续发展产业园区。', 0, 1, '2023-08-17 09:15:34', '2023-08-17 09:15:37', 1, 1, NULL);
INSERT INTO `park` VALUES (24, 1, '青山印尼Morowali工业园区', 'https://mmbiz.qpic.cn/mmbiz_jpg/9icmBVER9c9qrUQpY5OoETAVFX8och9APtrw1UzH5yCgVEtwvBOOHYF07ibAsAbFqX1vRPkhYOhVHn3kmXRiaXKSA/640?wx_fmt=jpeg&tp=wxpic&wxfrom=5&wx_lazy=1&wx_co=1', '  印尼综合产业园区-青山园区位于印尼中苏拉威西省的Morowali县，园区土地面积逾3200公顷，现已成为拥有全球最长、最全产业链的不锈钢生产基地，年产250万吨镍铁，300万吨不锈钢。园区拥有海、陆、空立体入园通道以及码头、发电厂等完善的生产、生活配套基础设施。其中发电厂装机容量总和2910MW，码头年吞吐量已达到8080万吨，园区自建机场占地面积110公顷，伴随着多条航线开通，极大地便利了员工、访客往返园区。印尼青山园区是国际产能合作标杆项目，也是中国“一带一路”倡议对接印尼“全球海洋支点”战略合作示范项目。 ', 0, 1, '2023-08-17 09:18:28', '2023-08-17 09:18:31', 1, 1, NULL);
INSERT INTO `park` VALUES (25, 1, '振石印尼华宝工业园', 'https://p6.itc.cn/q_70/images03/20230523/699da48615e5468086f65af737e4aca2.jpeg', '      秉承“投资在外、资源在外、回报在内、发展在内”的国际化投资理念，响应国家“一带一路”倡议，自2010年起，振石集团便涉足印尼矿产资源的收购及开发，深耕印尼十多年间，集团已在印尼建成多个大型项目，积累了丰富的海外投资和项目建设运营经验，有力推进了集团国际化进程。\r\n      华宝工业园区为振石控股集团在印尼苏拉威西省莫罗瓦利县投资建立的高标准大型工业园区。园区土地面积初期约2200公顷，将配套建设多个万吨级码头、大型仓库、星级酒店、员工宿舍及食堂，以及完善的消防安保系统、通讯系统和生活娱乐设施等，为入园企业提供完备的基础设施服务。园区为当地带来经济效益的同时，还致力于培养更多印方人才，为当地的城市化建设作出贡献，打造现代化城市、工业综合体。\r\n      贝石印尼投资有限公司为振石控股集团全资子公司，在华宝工业园区投资建立RKEF镍铁冶炼生产线以及配套燃煤发电厂。\r\n      项目建成后，将有助于集团全面提升镍产业上游资源的供应保障能力和不锈钢板块整体竞争力，为集团抓住新能源快速发展给镍上下游产业带来的重大机遇，进一步完善集团“矿资源+镍铁+不锈钢”的全产业链布局，助推集团国际化战略实现跨越式发展。', 0, 1, '2023-08-17 09:33:06', '2023-08-17 09:33:08', 1, 1, NULL);
INSERT INTO `park` VALUES (26, 1, '力勤印尼OBI产业园', 'https://mmbiz.qpic.cn/mmbiz_png/xEm3sABmKcVdlSxcyqClJCkSLmGgQKdUdRy7EvmwZGiaNPTucLHvwpNtZyViczdPlP2gpqJibvTnsz4TwvhVXwG6A/640?wx_fmt=png&tp=wxpic&wxfrom=5&wx_lazy=1&wx_co=1', '     浙江力勤投资有限公司坐落于美丽的东海之滨----浙江宁波高新区。公司在镍产业领域持续布局，形成了较为完整的产品服务体系，在镍产品的生产及贸易领域都取得了全球领先地位，是中国在海外最大的镍矿湿法冶炼产能拥有者，也是中国最大的镍矿贸易商。秉承“力致卓越、勤无止境”理念，积极响应国家“一带一路”发展战略，力勤与印尼合作伙伴在印度尼西亚OBI岛共同投资建设OBI产业园。园区电力源网荷储一体、风光水火一体。配套建设15台煤电机组，合计容量4850MW:2X30MW+1X60MW+5X150MW+7X380MW。另外配套建设1000MW光伏发电、抽水蓄能和风力发电。\r\n     公司坚持以人为本，倡导快乐工作、幸福生活的氛围，致力于创建优秀人才成长和发展机制，培养和集聚海内外优秀人才，在力勤事业平台上共创辉煌。热忱欢迎海内外人才共聚力勤、共谋发展！', 0, 1, '2023-08-17 09:39:40', '2023-08-17 09:39:43', 1, 1, NULL);
INSERT INTO `park` VALUES (27, 1, '印尼Morowali万向镍业镍铁园区', 'https://mmbiz.qpic.cn/mmbiz_png/AnZc0H7LQFaxzfoyPjHnUFglU8lYFB3OB5NJbn9yUH3NRnZhobnJVheUm9B0JQMMkBzKPkjzwZq6XZ8sHKc37A/640?wx_fmt=png&tp=wxpic&wxfrom=5&wx_lazy=1&wx_co=1', '印尼万向镍业为一家在印尼注册的合法有效的大型企业,法人代表黎志明,公司营业范围主要包括工业、贸易、运输、电业、采矿等。协新不锈(上海)电力科技有限公司是印尼万向镍业集团驻上海代表处。\r\n\r\n印尼万向镍业有限公司镍铁工业园区项目位于印尼中苏拉威西Morowali县巴哈道比镇和东本古镇结合处,地势平坦开阔,临近省道,四周村庄居民集中,有利于农副产品的供给园区，背靠丰富红镍矿资源核心区域,面朝大海,物流四通八达。项目分三期建设：工程规模包括RKEF冶炼厂、高炉冶炼厂、工业园区公辅设施（含燃煤电厂和码头）、办公生活区四大部分。2020年10月12日上午，万向一期2×65MW燃煤电站项目，第一根柱顺利起吊，并成功就位。', 0, 1, '2023-08-17 09:44:59', '2023-08-17 09:45:01', 1, 1, NULL);
INSERT INTO `park` VALUES (28, 1, '印尼德龙工业园', 'https://mmbiz.qpic.cn/sz_mmbiz_jpg/kqOBv4Xw0T3Vp5K07BPRyprWgj0diaCHCcWpG0J7diaWSFw3icQZJTEMGIszNH7o3MdwzOKhmK8wdibnRuK86ibeuqQ/640?wx_fmt=jpeg&wxfrom=5&wx_lazy=1&wx_co=1', 'VDNIP工业园坐落于美丽的印度尼西亚东南苏拉威西,是国家一带一路重点工程项目。', 0, 1, '2023-08-17 09:51:49', '2023-08-17 09:51:52', 1, 1, NULL);
INSERT INTO `park` VALUES (29, 1, '南山铝业印尼项目', 'https://mmbiz.qpic.cn/mmbiz_jpg/rCMQhy2yQ8V5WpIlkjnP1wulQZpDeGkVO27CSWf1uYialwtEojIJuuhYAVCuY4td2Y4vFj1bTfXFwV8e1bfNmeA/640?wx_fmt=jpeg&tp=wxpic&wxfrom=5&wx_lazy=1&wx_co=1', '    南山铝业印尼项目位于印度尼西亚宾坦岛东南部，宾坦岛人口约40万，面积1866平方公里，与新加坡隔海相望，搭乘轮船仅需1小时航程。宾坦岛全年平均温度26℃，气候宜人，没有台风、海啸、地震等自然灾害。岛上环境优美，海水清澈蔚蓝，生态资源丰富，浓绿斑斓的热带植物、银色的绵绵沙滩，还有各种国际级度假酒店，娱乐生活丰富多彩，毗邻碧蓝美丽的南中国海。\r\n    项目占地面积约4578.6公顷，将分期建设、投 产，规划建设年产200万吨氧化铝厂、配套年吞吐量2000万吨专用码头、火力发电厂、煤制气、水库等设施，目前以该项目为主的2333.6公顷土地范围，被批准为印度尼西亚第十二个经济特区。', 0, 1, '2023-08-17 09:57:07', '2023-08-17 09:57:10', 1, 1, NULL);

-- ----------------------------
-- Table structure for tag_category
-- ----------------------------
DROP TABLE IF EXISTS `tag_category`;
CREATE TABLE `tag_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tag_id` bigint NULL DEFAULT NULL COMMENT '标签id',
  `category_id` bigint NULL DEFAULT NULL COMMENT '分类id',
  `mark` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '备注（冗余字段）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '标签和分类关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag_category
-- ----------------------------

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '标签名称',
  `category_id` bigint NOT NULL COMMENT '标签分类id',
  `park_ids` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '1' COMMENT '有这个标签的park',
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '图片',
  `icon` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '标签icon',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '描述信息',
  `sort` int NOT NULL DEFAULT 0 COMMENT '顺序',
  `status` int NULL DEFAULT 1 COMMENT '0:禁用，1:启用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `create_user` bigint NULL DEFAULT NULL COMMENT '创建人',
  `update_user` bigint NULL DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_tags_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 99 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES (70, '简介', 25, '1,2', NULL, 'carbon:building-insights-3', NULL, 0, 1, '2023-08-18 09:23:31', '2023-08-18 09:23:33', 1, 1);
INSERT INTO `tags` VALUES (71, '面试', 25, '1', NULL, 'carbon:collaborate', NULL, 0, 1, '2023-08-18 09:24:54', '2023-08-18 09:24:57', 1, 1);
INSERT INTO `tags` VALUES (72, '体检', 25, '1', NULL, 'carbon:reminder-medical', NULL, 0, 1, '2023-08-18 09:25:39', '2023-08-18 09:25:42', 1, 1);
INSERT INTO `tags` VALUES (73, '签证', 25, '1', NULL, 'carbon:edit', NULL, 0, 1, '2023-08-18 09:26:22', '2023-08-18 09:26:24', 1, 1);
INSERT INTO `tags` VALUES (74, '航班', 25, '1', NULL, 'carbon:airport-01', NULL, 0, 1, '2023-08-18 09:27:01', '2023-08-18 09:27:04', 1, 1);
INSERT INTO `tags` VALUES (75, '携带清单', 25, '1', NULL, 'carbon:license-draft', NULL, 0, 1, '2023-08-18 09:27:53', '2023-08-18 09:27:55', 1, 1);
INSERT INTO `tags` VALUES (76, '出发前准备', 25, '1', NULL, 'carbon:shopping-bag', NULL, 0, 1, '2023-08-18 09:28:44', '2023-08-18 09:28:45', 1, 1);
INSERT INTO `tags` VALUES (77, '出境', 25, '1', NULL, 'carbon:earth-southeast-asia-filled', NULL, 0, 1, '2023-08-18 09:29:12', '2023-08-18 09:29:14', 1, 1);
INSERT INTO `tags` VALUES (78, '住宿', 24, '1', NULL, 'carbon:building-insights-2', NULL, 0, 1, '2023-08-18 10:06:36', '2023-08-18 10:06:39', 1, 1);
INSERT INTO `tags` VALUES (79, '出行', 24, '1', NULL, 'carbon:bus', NULL, 0, 1, '2023-08-18 10:07:04', '2023-08-18 10:07:06', 1, 1);
INSERT INTO `tags` VALUES (80, '网络', 24, '1', NULL, 'carbon:wifi-controller', NULL, 0, 1, '2023-08-18 10:07:43', '2023-08-18 10:07:45', 1, 1);
INSERT INTO `tags` VALUES (82, '饭堂', 24, '1', NULL, 'carbon:flood', NULL, 0, 1, '2023-08-18 10:22:53', '2023-08-18 10:22:55', 1, 1);
INSERT INTO `tags` VALUES (83, '胡吃海喝', 24, '1', NULL, 'carbon:cyclist', NULL, 0, 1, '2023-08-18 10:23:36', '2023-08-18 10:23:39', 1, 1);
INSERT INTO `tags` VALUES (84, '穿衣打扮', 24, '1', NULL, 'carbon:face-cool', NULL, 0, 1, '2023-08-18 10:23:59', '2023-08-18 10:24:01', 1, 1);
INSERT INTO `tags` VALUES (85, '周边', 24, '1', NULL, 'carbon:tropical-warning', NULL, 0, 1, '2023-08-18 10:24:52', '2023-08-18 10:24:54', 1, 1);
INSERT INTO `tags` VALUES (86, '游玩', 24, '1', NULL, 'carbon:crop-growth', NULL, 0, 1, '2023-08-18 10:30:20', '2023-08-18 10:30:22', 1, 1);
INSERT INTO `tags` VALUES (87, '解锁', 25, '1', NULL, 'carbon:unlocked', NULL, 0, 1, '2023-08-18 10:37:34', '2023-08-18 10:37:38', 1, 1);
INSERT INTO `tags` VALUES (88, '部门', 26, '1', NULL, 'carbon:group-access', NULL, 0, 1, '2023-08-18 10:41:49', '2023-08-18 10:41:51', 1, 1);
INSERT INTO `tags` VALUES (89, '国人占比', 26, '1', NULL, 'carbon:chart-pie', NULL, 0, 1, '2023-08-18 10:42:59', '2023-08-18 10:43:02', 1, 1);
INSERT INTO `tags` VALUES (90, '报道流程', 26, '1', NULL, 'carbon:ibm-process-mining', NULL, 0, 1, '2023-08-18 10:44:00', '2023-08-18 10:44:02', 1, 1);
INSERT INTO `tags` VALUES (91, '安全', 26, '1', NULL, 'carbon:ibm-security', NULL, 0, 1, '2023-08-18 10:45:52', '2023-08-18 10:45:54', 1, 1);
INSERT INTO `tags` VALUES (92, '禁止事项', 26, '1', NULL, 'carbon:information-disabled', NULL, 0, 1, '2023-08-18 10:46:55', '2023-08-18 10:46:57', 1, 1);
INSERT INTO `tags` VALUES (93, '回国', 27, '1', NULL, 'carbon:departure', NULL, 0, 1, '2023-08-18 10:48:45', '2023-08-18 10:48:47', 1, 1);
INSERT INTO `tags` VALUES (94, '调岗', 26, '1', NULL, 'carbon:collaborate', NULL, 0, 1, '2023-08-18 10:50:00', '2023-08-18 10:50:02', 1, 1);
INSERT INTO `tags` VALUES (95, '离职', 27, '1', NULL, 'carbon:airline-digital-gate', NULL, 0, 1, '2023-08-18 10:51:54', '2023-08-18 10:51:57', 1, 1);
INSERT INTO `tags` VALUES (96, '薪资', 27, '1', NULL, 'carbon:piggy-bank', NULL, 0, 1, '2023-08-18 10:52:49', '2023-08-18 10:52:51', 1, 1);
INSERT INTO `tags` VALUES (97, '竞业', 27, '1', NULL, 'carbon:ibm-watson-discovery', NULL, 0, 1, '2023-08-18 10:54:51', '2023-08-18 10:54:54', 1, 1);
INSERT INTO `tags` VALUES (98, '园区风采', 27, '1', NULL, 'carbon:soccer', NULL, 0, 1, '2023-08-18 10:55:22', '2023-08-18 10:55:24', 1, 1);
INSERT INTO `tags` VALUES (99, '快递', 24, '1', NULL, 'carbon:delivery-truck', NULL, 0, 0, '2023-08-19 11:35:45', '2023-08-19 11:35:47', 1, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `openid` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '微信用户唯一标识',
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '手机号',
  `sex` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '性别',
  `id_number` varchar(18) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '头像',
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '用户信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
