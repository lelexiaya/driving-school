/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : driving-school

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 22/12/2019 19:39:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_appointment
-- ----------------------------
DROP TABLE IF EXISTS `tb_appointment`;
CREATE TABLE `tb_appointment`  (
  `appointment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '预约ID',
  `appointment_collage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约科目',
  `appointment_class_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约班级(驾照类型)',
  `user_id` int(10) NULL DEFAULT NULL COMMENT '教练ID',
  `appointment_total` int(5) NULL DEFAULT NULL COMMENT '预约总人数',
  `appointment_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态 0未发布 1发布',
  PRIMARY KEY (`appointment_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_appointment
-- ----------------------------
INSERT INTO `tb_appointment` VALUES ('20191222060309241', '科三', 'C1', 1912170002, 2, '2019-12-19', '1');
INSERT INTO `tb_appointment` VALUES ('20191222060851396', '科三', 'C1', 1912170002, 10, '2019-12-21', '1');
INSERT INTO `tb_appointment` VALUES ('20191222071032616', '科四', 'C1', 1912170003, 15, '2019-12-22', '1');
INSERT INTO `tb_appointment` VALUES ('20191222071242688', '科三', 'C1', 1912170002, 2, '2019-12-24', '1');

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role`  (
  `role_id` int(10) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES (1, '管理员', '管理员拥有至高无上的权利，可以管理所用用户信息，为用户分配权限。');
INSERT INTO `tb_role` VALUES (2, '学员', '学生可以查看预约信息和预约练车');
INSERT INTO `tb_role` VALUES (8, '教练', '教师查看预约的学生，为学生提供课程服务');

-- ----------------------------
-- Table structure for tb_role_fun
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_fun`;
CREATE TABLE `tb_role_fun`  (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `fun_id` int(10) NULL DEFAULT NULL,
  `role_id` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `real_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `card_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `collage` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `class_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1912171003 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES (1912170001, '1912170001', 'admin', '丁聪华', '1', '610702199202034723', '无', '无', '无', '吕梁市文水县', '1913783998@qq.com');
INSERT INTO `tb_user` VALUES (1912170002, '1912170002', 'teacher', '夏潇琦', '0', '321202200508056431', '科三', '小型汽车', 'C1', '吕梁市中阳县', '1913783902@qq.com');
INSERT INTO `tb_user` VALUES (1912170003, '1912170003', 'teacher', '孙蝶妃', '0', '43090019871123845X', '科四', '小型汽车', 'C1', '太原市阳曲县', '1913783903@qq.com');
INSERT INTO `tb_user` VALUES (1912170004, '1912170004', 'student', '庞妍', '1', '33018319820623032X', '科三', '小型汽车', 'C1', '太原市万柏林区', '1913783904@qq.com');
INSERT INTO `tb_user` VALUES (1912170005, '1912170005', 'student', '曹娅娴', '1', '650203198307184789', '科四', '小型汽车', 'C1', '大同市阳高县', '1913783905@qq.com');
INSERT INTO `tb_user` VALUES (1912170006, '1912170006', '046247', '程杏倚', '1', '360302197507046247', '科一', '小型自动挡汽车', 'C2', '长治市郊区', '1913783906@qq.com');
INSERT INTO `tb_user` VALUES (1912170007, '1912170007', '239193', '局晓娟', '0', '411627198701239193', '科二', '小型自动挡汽车', 'C2', '忻州市五台县', '1913783907@qq.com');
INSERT INTO `tb_user` VALUES (1912170008, '1912170008', '01299X', '吴美华', '0', '51333119890601299X', '科三', '小型自动挡汽车', 'C2', '晋中市平遥县', '1913783908@qq.com');
INSERT INTO `tb_user` VALUES (1912170009, '1912170009', '112775', '宋尚祥', '0', '620825197204112775', '科四', '小型自动挡汽车', 'C2', '运城市河津市', '1913783909@qq.com');
INSERT INTO `tb_user` VALUES (1912170010, '1912170010', '286199', '李丽丽', '0', '230902197806286199', '科一', '大型客车', 'A1', '临汾市侯马市', '1913783910@qq.com');
INSERT INTO `tb_user` VALUES (1912170011, '1912170011', '195326', '安师傅', '1', '652922200603195326', '科二', '大型客车', 'A1', '忻州市宁武县', '1913783911@qq.com');
INSERT INTO `tb_user` VALUES (1912170012, '1912170012', '089997', '葛姬', '0', '511902197407089997', '科三', '牵引车', 'A2', '吕梁市孝义市', '1913783912@qq.com');
INSERT INTO `tb_user` VALUES (1912170013, '1912170013', '012636', '褚育', '0', '440115198103012636', '科四', '牵引车', 'A2', '吕梁市交城县', '1913783913@qq.com');
INSERT INTO `tb_user` VALUES (1912170014, '1912170014', '138536', '沈太群', '0', '320582195801138536', '科一', '牵引车', 'A2', '太原市万柏林区', '1913783914@qq.com');
INSERT INTO `tb_user` VALUES (1912170015, '1912170015', '046407', '韩招弟', '1', '341822197005046407', '科二', '牵引车', 'A2', '太原市万柏林区', '1913783915@qq.com');
INSERT INTO `tb_user` VALUES (1912170016, '1912170016', '27858X', '王婷婷', '1', '13022920060927858X', '科三', '城市公交车', 'A3', '太原市杏花岭区', '1913783916@qq.com');
INSERT INTO `tb_user` VALUES (1912170017, '1912170017', '233829', '杨艳', '1', '650204197112233829', '科四', '城市公交车', 'A3', '太原市杏花岭区', '1913783917@qq.com');
INSERT INTO `tb_user` VALUES (1912170018, '1912170018', '233735', '曹凌旋', '0', '610103195901233735', '科一', '城市公交车', 'A3', '太原市万柏林区', '1913783918@qq.com');
INSERT INTO `tb_user` VALUES (1912170019, '1912170019', '065999', '严天春', '0', '410425198704065999', '科二', '中型客车', 'B1', '太原市古交市', '1913783919@qq.com');
INSERT INTO `tb_user` VALUES (1912170020, '1912170020', '246309', '殷子彤', '1', '530625200106246309', '科三', '中型客车', 'B1', '大同市矿区', '1913783920@qq.com');
INSERT INTO `tb_user` VALUES (1912170021, '1912170021', '21829X', '魏红', '0', '37072519560421829X', '科四', '中型客车', 'B1', '大同市灵丘县', '1913783921@qq.com');
INSERT INTO `tb_user` VALUES (1912170022, '1912170022', '301482', '韩美娟', '1', '211402199611301482', '科一', '牵引车', 'A2', '阳泉市矿区', '1913783922@qq.com');
INSERT INTO `tb_user` VALUES (1912170023, '1912170023', '248905', '朱洋', '1', '370831197311248905', '科二', '牵引车', 'A2', '长治市城区', '1913783923@qq.com');
INSERT INTO `tb_user` VALUES (1912170024, '1912170024', '302803', '陶倩倩', '1', '320830200801302803', '科三', '大型货车', 'B2', '长治市襄垣县', '1913783924@qq.com');
INSERT INTO `tb_user` VALUES (1912170025, '1912170025', '125719', '沈痴梦', '0', '431000198810125719', '科四', '大型货车', 'B2', '晋城市城区', '1913783925@qq.com');
INSERT INTO `tb_user` VALUES (1912170026, '1912170026', '124281', '钱念梅', '1', '350000198103124281', '科一', '中型客车', 'B1', '晋城市高平市', '1913783926@qq.com');
INSERT INTO `tb_user` VALUES (1912170027, '1912170027', '229787', '褚妍', '1', '360921198208229787', '科二', '大型货车', 'B2', '忻州市五寨县', '1913783927@qq.com');
INSERT INTO `tb_user` VALUES (1912170028, '1912170028', '040622', '赵寒雁', '1', '610122197206040622', '科三', '城市公交车', 'A3', '大同市浑源县', '1913783928@qq.com');
INSERT INTO `tb_user` VALUES (1912170029, '1912170029', '293391', '郑碧香', '0', '632200199311293391', '科四', '城市公交车', 'A3', '朔州市山阴县', '1913783929@qq.com');
INSERT INTO `tb_user` VALUES (1912170030, '1912170030', '279994', '吕芳', '0', '341000197711279994', '科一', '低速载货汽车', 'C3', '大同市城区', '1913783930@qq.com');
INSERT INTO `tb_user` VALUES (1912170031, '1912170031', '288413', '尤谷山', '0', '410202196803288413', '科二', '牵引车', 'A2', '晋中市介休市', '1913783931@qq.com');
INSERT INTO `tb_user` VALUES (1912170032, '1912170032', '246484', '朱敏', '1', '542326197111246484', '科三', '低速载货汽车', 'C3', '晋中市太谷县', '1913783932@qq.com');
INSERT INTO `tb_user` VALUES (1912170033, '1912170033', '292546', '吴静娴', '1', '360700195006292546', '科四', '大型货车', 'B2', '吕梁市文水县', '1913783933@qq.com');
INSERT INTO `tb_user` VALUES (1912170034, '1912170034', '199129', '孙传敏', '1', '222424200608199129', '科一', '低速载货汽车', 'C3', '运城市芮城县', '1913783934@qq.com');
INSERT INTO `tb_user` VALUES (1912170035, '1912170035', '075404', '陈翠翠', '1', '513227200708075404', '科二', '城市公交车', 'A3', '运城市盐湖区', '1913783935@qq.com');
INSERT INTO `tb_user` VALUES (1912170036, '1912170036', '209155', '王章洪', '0', '610427196610209155', '科三', '牵引车', 'A2', '运城市河津市', '1913783936@qq.com');
INSERT INTO `tb_user` VALUES (1912170037, '1912170037', '107668', '杨文静', '1', '420607197706107668', '科四', '中型客车', 'B1', '运城市盐湖区', '1913783937@qq.com');
INSERT INTO `tb_user` VALUES (1912170038, '1912170038', '285568', '张子涵', '1', '371000197502285568', '科一', '中型客车', 'B1', '运城市临猗县', '1913783938@qq.com');
INSERT INTO `tb_user` VALUES (1912170039, '1912170039', '11527X', '吕娇娇', '0', '43081119820811527X', '科二', '城市公交车', 'A3', '运城市新绛县', '1913783939@qq.com');
INSERT INTO `tb_user` VALUES (1912170040, '1912170040', '262820', '蒋舒', '1', '451021199905262820', '科三', '三轮汽车', 'C4', '运城市新绛县', '1913783940@qq.com');
INSERT INTO `tb_user` VALUES (1912170041, '1912170041', '130353', '卫清怡', '0', '130500198204130353', '科四', '三轮汽车', 'C4', '运城市平陆县', '1913783941@qq.com');
INSERT INTO `tb_user` VALUES (1912170042, '1912170042', '114189', '吕静娴', '1', '522200198311114189', '科一', '中型客车', 'B1', '忻州市忻府区', '1913783942@qq.com');
INSERT INTO `tb_user` VALUES (1912170043, '1912170043', '072794', '卫蓉', '0', '220400195708072794', '科二', '三轮汽车', 'C4', '忻州市原平市', '1913783943@qq.com');
INSERT INTO `tb_user` VALUES (1912170044, '1912170044', '245296', '倪欣悦', '0', '211221197711245296', '科三', '大型货车', 'B2', '临汾市尧都区', '1913783944@qq.com');
INSERT INTO `tb_user` VALUES (1912170045, '1912170045', '164194', '许丽丽', '0', '450502200106164194', '科四', '牵引车', 'A2', '临汾市霍州市', '1913783945@qq.com');
INSERT INTO `tb_user` VALUES (1912170046, '1912170046', '067457', '张宛海', '0', '230103199806067457', '科一', '牵引车', 'A2', '临汾市霍州市', '1913783946@qq.com');
INSERT INTO `tb_user` VALUES (1912170047, '1912170047', '262609', '张妙海', '1', '350302195012262609', '科二', '三轮汽车', 'C4', '临汾市襄汾县', '1913783947@qq.com');
INSERT INTO `tb_user` VALUES (1912170048, '1912170048', '028486', '金雁', '1', '320323199606028486', '科三', '三轮汽车', 'C4', '临汾市汾西县', '1913783948@qq.com');
INSERT INTO `tb_user` VALUES (1912170049, '1912170049', '272971', '王亚梅', '0', '140181197811272971', '科四', '三轮汽车', 'C4', '吕梁市离石区', '1913783949@qq.com');
INSERT INTO `tb_user` VALUES (1912170050, '1912170050', '083466', '戚迎春', '1', '340823200505083466', '科一', '大型货车', 'B2', '晋中市平遥县', '1913783950@qq.com');
INSERT INTO `tb_user` VALUES (1912170051, '1912170051', '19156X', '崔凌珍', '1', '43052119880619156X', '科二', '小型汽车', 'C1', '吕梁市交城县', '1913783951@qq.com');
INSERT INTO `tb_user` VALUES (1912170052, '1912170052', '179706', '沈菲', '1', '411381199512179706', '科二', '三轮汽车', 'C4', '太原市晋源区', '1913784452@qq.com');
INSERT INTO `tb_user` VALUES (1912170053, '1912170053', '17885X', '朱翠红', '0', '52011119750617885X', '科三', '大型货车', 'B2', '吕梁市汾阳市', '1913784453@qq.com');
INSERT INTO `tb_user` VALUES (1912170054, '1912170054', '060558', '钱世兰', '0', '210200199908060558', '科四', '小型汽车', 'C1', '大同市城区', '1913784454@qq.com');
INSERT INTO `tb_user` VALUES (1912170055, '1912170055', '137074', '施肇琪', '0', '150207196109137074', '科一', '城市公交车', 'A3', '大同市浑源县', '1913784455@qq.com');
INSERT INTO `tb_user` VALUES (1912170056, '1912170056', '136406', '尤咏', '1', '220381197309136406', '科二', '小型汽车', 'C1', '晋城市城区', '1913784456@qq.com');
INSERT INTO `tb_user` VALUES (1912170057, '1912170057', '06251X', '沈花长', '0', '23012819740806251X', '科三', '大型货车', 'B2', '晋中市榆次区', '1913784457@qq.com');
INSERT INTO `tb_user` VALUES (1912170058, '1912170058', '079822', '孔文秀', '1', '330127196909079822', '科四', '小型汽车', 'C1', '运城市盐湖区', '1913784458@qq.com');
INSERT INTO `tb_user` VALUES (1912170059, '1912170059', '228105', '贺丽红', '1', '350425199912228105', '科一', '小型汽车', 'C1', '运城市夏县', '1913784459@qq.com');
INSERT INTO `tb_user` VALUES (1912170060, '1912170060', '185164', '周柔', '1', '350100198709185164', '科二', '小型汽车', 'C1', '忻州市忻府区', '1913784460@qq.com');
INSERT INTO `tb_user` VALUES (1912170061, '1912170061', '069131', '蒋茜', '1', '142400199205221903', '科五', '小型汽车', 'C1', '山西省晋中地区', '1913784461@qq.com');
INSERT INTO `tb_user` VALUES (1912170062, '1912170062', '221903', '严纨', '0', '142400201201069131', '科四', '小型汽车', 'C1', '山西省晋中地区', '1913784462@qq.com');
INSERT INTO `tb_user` VALUES (1912170063, '1912170063', '135428', '戚梅梅', '1', '142400199309135428', '科一', '城市公交车', 'A3', '山西省晋中地区', '1913784463@qq.com');
INSERT INTO `tb_user` VALUES (1912170064, '1912170064', '20254X', '葛秀娟', '1', '14240019911020254X', '科二', '小型汽车', 'C1', '山西省晋中地区', '1913784464@qq.com');
INSERT INTO `tb_user` VALUES (1912170065, '1912170065', '089599', '吴悦明', '0', '142400201704089599', '科三', '小型汽车', 'C1', '山西省晋中地区', '1913784465@qq.com');
INSERT INTO `tb_user` VALUES (1912170066, '1912170066', '04544X', '周瑶', '1', '14240019850404544X', '科四', '小型汽车', 'C1', '山西省晋中地区', '1913784466@qq.com');
INSERT INTO `tb_user` VALUES (1912170067, '1912170067', '052615', '秦万敏', '0', '142400200707052615', '科一', '小型汽车', 'C1', '山西省晋中地区', '1913784467@qq.com');
INSERT INTO `tb_user` VALUES (1912170068, '1912170068', '218420', '严世兰', '1', '142429201609218420', '科二', '小型汽车', 'C1', '山西省太谷县', '1913784468@qq.com');
INSERT INTO `tb_user` VALUES (1912170069, '1912170069', '124806', '曹娇娇', '1', '142429200709124806', '科三', '小型汽车', 'C1', '山西省太谷县', '1913784469@qq.com');
INSERT INTO `tb_user` VALUES (1912170070, '1912170070', '014069', '金子彤', '1', '142429199707014069', '科四', '小型汽车', 'C1', '山西省太谷县', '1913784470@qq.com');
INSERT INTO `tb_user` VALUES (1912170071, '1912170071', '139301', '朱龙婷', '1', '142429198505139301', '科一', '小型汽车', 'C1', '山西省太谷县', '1913784471@qq.com');
INSERT INTO `tb_user` VALUES (1912170072, '1912170072', '025299', '金晓云', '0', '142429197610025299', '科二', '小型汽车', 'C1', '山西省太谷县', '1913784472@qq.com');
INSERT INTO `tb_user` VALUES (1912170073, '1912170073', '079741', '秦凌珍', '1', '140202199104079741', '科三', '小型汽车', 'C1', '山西省大同市城区', '1913784473@qq.com');
INSERT INTO `tb_user` VALUES (1912170074, '1912170074', '223796', '卫睿婕', '0', '140202198104223796', '科四', '小型汽车', 'C1', '山西省大同市城区', '1913784474@qq.com');
INSERT INTO `tb_user` VALUES (1912170075, '1912170075', '128657', '韩凌旋', '0', '140202200909128657', '科一', '小型汽车', 'C1', '山西省大同市城区', '1913784475@qq.com');
INSERT INTO `tb_user` VALUES (1912170076, '1912170076', '21838X', '蒋薇', '1', '14020220030121838X', '科二', '小型汽车', 'C1', '山西省大同市城区', '1913784476@qq.com');
INSERT INTO `tb_user` VALUES (1912170077, '1912170077', '134586', '李翡翠', '1', '140202197402134586', '科三', '小型汽车', 'C1', '山西省大同市城区', '1913784477@qq.com');
INSERT INTO `tb_user` VALUES (1912170078, '1912170078', '224139', '李虹', '0', '140202199303224139', '科四', '小型汽车', 'C1', '山西省大同市城区', '1913784478@qq.com');
INSERT INTO `tb_user` VALUES (1912170079, '1912170079', '030484', '蒋红', '1', '140202199801030484', '科一', '小型汽车', 'C1', '山西省大同市城区', '1913784479@qq.com');
INSERT INTO `tb_user` VALUES (1912170080, '1912170080', '059986', '王迎曼', '1', '140223196607059986', '科二', '小型汽车', 'C1', '山西省大同市广灵县', '1913784480@qq.com');
INSERT INTO `tb_user` VALUES (1912170081, '1912170081', '140194', '许秋荣', '0', '140223200602140194', '科三', '小型汽车', 'C1', '山西省大同市广灵县', '1913784481@qq.com');
INSERT INTO `tb_user` VALUES (1912170082, '1912170082', '049130', '朱夏青', '0', '140223200101049130', '科四', '小型汽车', 'C1', '山西省大同市广灵县', '1913784482@qq.com');
INSERT INTO `tb_user` VALUES (1912170083, '1912170083', '22588X', '魏红萍', '1', '14022320011122588X', '科一', '小型汽车', 'C1', '山西省大同市广灵县', '1913784483@qq.com');
INSERT INTO `tb_user` VALUES (1912170084, '1912170084', '19982X', '王紫萱', '1', '14022320160319982X', '科二', '小型汽车', 'C1', '山西省大同市广灵县', '1913784484@qq.com');
INSERT INTO `tb_user` VALUES (1912170085, '1912170085', '113856', '魏秋', '0', '140223196710113856', '科三', '小型汽车', 'C1', '山西省大同市广灵县', '1913784485@qq.com');
INSERT INTO `tb_user` VALUES (1912170086, '1912170086', '036347', '谢莎', '1', '140223199408036347', '科四', '小型汽车', 'C1', '山西省大同市广灵县', '1913784486@qq.com');
INSERT INTO `tb_user` VALUES (1912170087, '1912170087', '276061', '何欣琪', '1', '141181196407276061', '科一', '小型汽车', 'C1', '吕梁市孝义市', '1913784487@qq.com');
INSERT INTO `tb_user` VALUES (1912170088, '1912170088', '241845', '姜洪丽', '1', '141181197711241845', '科二', '小型汽车', 'C1', '吕梁市孝义市', '1913784487@qq.com');
INSERT INTO `tb_user` VALUES (1912170089, '1912170089', '196675', '曹显', '0', '141181198801196675', '科三', '小型汽车', 'C1', '吕梁市孝义市', '1913784487@qq.com');
INSERT INTO `tb_user` VALUES (1912170090, '1912170090', '020784', '杨倩倩', '1', '141181196910020784', '科四', '小型汽车', 'C1', '吕梁市孝义市', '1913784487@qq.com');
INSERT INTO `tb_user` VALUES (1912170091, '1912170091', '149049', '秦乐萱', '1', '141181199305149049', '科一', '小型汽车', 'C1', '吕梁市孝义市', '1913784487@qq.com');
INSERT INTO `tb_user` VALUES (1912170092, '1912170092', '217717', '雷夜白', '0', '141181197507217717', '科二', '小型汽车', 'C1', '吕梁市孝义市', '1913784487@qq.com');
INSERT INTO `tb_user` VALUES (1912170093, '1912170093', 'student', '张芸', '1', '141181198305173642', '科三', '小型汽车', 'C1', '吕梁市孝义市', '1913784487@qq.com');
INSERT INTO `tb_user` VALUES (1912170094, '1912170094', '072101', '周馨语', '1', '141181199811072101', '科四', '小型汽车', 'C1', '吕梁市孝义市', '1913784487@qq.com');
INSERT INTO `tb_user` VALUES (1912170095, '1912170095', '179608', '华静', '1', '141181199608179608', '科一', '小型汽车', 'C1', '吕梁市孝义市', '1913784487@qq.com');
INSERT INTO `tb_user` VALUES (1912170096, '1912170096', '013347', '杨婷婷', '1', '141181198907013347', '科二', '小型汽车', 'C1', '吕梁市孝义市', '1913784487@qq.com');
INSERT INTO `tb_user` VALUES (1912170097, '1912170097', 'student', '赵倩', '1', '141181198907013347', '科三', '小型汽车', 'C1', '吕梁市孝义市', '1913784487@qq.com');
INSERT INTO `tb_user` VALUES (1912170098, '1912170098', '013347', '严瑶', '1', '141181198907013347', '科四', '小型汽车', 'C1', '吕梁市孝义市', '1913784487@qq.com');
INSERT INTO `tb_user` VALUES (1912170099, '1912170099', '013347', '戚金花', '1', '141181198907013347', '科一', '小型汽车', 'C1', '吕梁市孝义市', '1913784487@qq.com');
INSERT INTO `tb_user` VALUES (1912170100, '1912170100', '013347', '华倩', '1', '141181198907013347', '科二', '小型汽车', 'C1', '吕梁市孝义市', '1913784487@qq.com');
INSERT INTO `tb_user` VALUES (1912170101, '1912170101', '013347', '陶薇', '1', '141181198907013347', '科三', '小型汽车', 'C1', '吕梁市孝义市', '1913784487@qq.com');
INSERT INTO `tb_user` VALUES (1912170102, '1912170102', '23845X', '江小白', '1', '43090019871123845X', '科四', '小型汽车', 'C1', '山西省太原市', '1913783902@qq.com');
INSERT INTO `tb_user` VALUES (1912170103, '1912171001', '23845X', '李白', '1', '43090019871123845X', '科二', '小型汽车', 'C1', '山西省太原市', '1913783902@qq.com');
INSERT INTO `tb_user` VALUES (1912171002, '1912171002', '141787', '李小明', '1', '320826195310141787', '科二', '小型汽车', 'C1', '山西省太原市', '1913783902@qq.com');

-- ----------------------------
-- Table structure for tb_user_appointment
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_appointment`;
CREATE TABLE `tb_user_appointment`  (
  `UUID` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int(10) NULL DEFAULT NULL COMMENT '用户ID',
  `appointment_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预约ID',
  PRIMARY KEY (`UUID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_appointment
-- ----------------------------
INSERT INTO `tb_user_appointment` VALUES ('a6da0da469e94c1289f596ce663ea783', 1912170004, '20191222060309241');
INSERT INTO `tb_user_appointment` VALUES ('ee0dfb3762fa40e2a3fc1937c8b567f5', 1912170093, '20191222060309241');

-- ----------------------------
-- Table structure for tb_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role`  (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `user_id` int(15) NULL DEFAULT NULL,
  `role_id` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 434 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_role
-- ----------------------------
INSERT INTO `tb_user_role` VALUES (413, 1912170001, '1');
INSERT INTO `tb_user_role` VALUES (414, 1912180061, '1');
INSERT INTO `tb_user_role` VALUES (417, 1912180061, '2');
INSERT INTO `tb_user_role` VALUES (418, 1912170003, '8');
INSERT INTO `tb_user_role` VALUES (419, 1912170004, '2');
INSERT INTO `tb_user_role` VALUES (420, 1912170005, '2');
INSERT INTO `tb_user_role` VALUES (422, 1912170008, '2');
INSERT INTO `tb_user_role` VALUES (423, 1912170009, '2');
INSERT INTO `tb_user_role` VALUES (424, 1912170010, '2');
INSERT INTO `tb_user_role` VALUES (425, 1912170002, '8');
INSERT INTO `tb_user_role` VALUES (426, 1912170006, '8');
INSERT INTO `tb_user_role` VALUES (427, 1912170007, '8');
INSERT INTO `tb_user_role` VALUES (428, 1912170102, '2');
INSERT INTO `tb_user_role` VALUES (429, 1912170101, '2');
INSERT INTO `tb_user_role` VALUES (430, 1912170093, '2');
INSERT INTO `tb_user_role` VALUES (431, 1912170097, '2');
INSERT INTO `tb_user_role` VALUES (432, 1912170103, '2');
INSERT INTO `tb_user_role` VALUES (433, 1912171002, '2');

SET FOREIGN_KEY_CHECKS = 1;
