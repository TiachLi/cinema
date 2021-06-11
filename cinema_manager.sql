/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : cinema_manager

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 11/06/2021 10:38:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for acl_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_permission`;
CREATE TABLE `acl_permission`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '编号',
  `pid` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '所属上级',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint NOT NULL DEFAULT 0 COMMENT '类型(1:菜单,2:按钮)',
  `permission_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限值',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问路径',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_pid`(`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_permission
-- ----------------------------
INSERT INTO `acl_permission` VALUES ('1195268474480156673', '1', '权限管理', 1, NULL, '/acl', 'Layout', NULL);
INSERT INTO `acl_permission` VALUES ('1195268616021139457', '1195268474480156673', '用户管理', 1, NULL, 'user/list', '/acl/user/list', NULL);
INSERT INTO `acl_permission` VALUES ('1195268788138598401', '1195268474480156673', '角色管理', 1, NULL, 'role/list', '/acl/role/list', NULL);
INSERT INTO `acl_permission` VALUES ('1195268893830864898', '1195268474480156673', '菜单管理', 1, NULL, 'menu/list', '/acl/menu/list', NULL);
INSERT INTO `acl_permission` VALUES ('1195269143060602882', '1195268616021139457', '查看', 2, 'user.list', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1195269295926206466', '1195268616021139457', '添加', 2, 'user.add', 'user/add', '/acl/user/form', NULL);
INSERT INTO `acl_permission` VALUES ('1195269473479483394', '1195268616021139457', '修改', 2, 'user.update', 'user/update/:id', '/acl/user/form', NULL);
INSERT INTO `acl_permission` VALUES ('1195269547269873666', '1195268616021139457', '删除', 2, 'user.remove', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1195269821262782465', '1195268788138598401', '修改', 2, 'role.update', 'role/update/:id', '/acl/role/form', NULL);
INSERT INTO `acl_permission` VALUES ('1195269903542444034', '1195268788138598401', '查看', 2, 'role.list', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1195270037005197313', '1195268788138598401', '添加', 2, 'role.add', 'role/add', '/acl/role/form', NULL);
INSERT INTO `acl_permission` VALUES ('1195270442602782721', '1195268788138598401', '删除', 2, 'role.remove', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1195270621548568578', '1195268788138598401', '角色权限', 2, 'role.acl', 'role/distribution/:id', '/acl/role/roleForm', NULL);
INSERT INTO `acl_permission` VALUES ('1195270744097742849', '1195268893830864898', '查看', 2, 'permission.list', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1195270810560684034', '1195268893830864898', '添加', 2, 'permission.add', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1195270862100291586', '1195268893830864898', '修改', 2, 'permission.update', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1195270887933009922', '1195268893830864898', '删除', 2, 'permission.remove', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1195351862889254913', '1', '影片管理', 1, NULL, '/cinema/movie', 'Layout', NULL);
INSERT INTO `acl_permission` VALUES ('1195351968841568257', '1195351862889254913', '添加影片', 1, NULL, 'add', '/cinema/movie/info', NULL);
INSERT INTO `acl_permission` VALUES ('1195352054917074946', '1195351862889254913', '影片列表', 1, NULL, 'list', '/cinema/movie/list', NULL);
INSERT INTO `acl_permission` VALUES ('1195352127734386690', '1195352054917074946', '查看', 2, 'movie.list', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1195352215768633346', '1195351968841568257', '添加', 2, 'movie.add', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1195354076890370050', '1', '影厅管理', 1, NULL, '/cinema/hall', 'Layout', NULL);
INSERT INTO `acl_permission` VALUES ('1195354153482555393', '1195354076890370050', '影厅列表', 1, NULL, 'list', '/cinema/hall/list', NULL);
INSERT INTO `acl_permission` VALUES ('1195354315093282817', '1195354153482555393', '查看', 2, 'hall.list', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1196301740985311234', '1195268616021139457', '分配角色', 2, 'user.assgin', 'user/role/:id', '/acl/user/roleForm', NULL);
INSERT INTO `acl_permission` VALUES ('1392009957752614913', '1195354076890370050', '添加影厅', 1, NULL, 'add', '/cinema/hall/info', NULL);
INSERT INTO `acl_permission` VALUES ('1392010519629967362', '1195354153482555393', '添加', 2, 'hall.add', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1392014520358449153', '1392009957752614913', '添加', 2, 'hall.add', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1392014595025448961', '1392009957752614913', '修改', 2, 'hall.update', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1392014692039700481', '1195354153482555393', '修改', 2, 'hall.update', '/cinema/hall/update/:id', '/cinema/hall/info', NULL);
INSERT INTO `acl_permission` VALUES ('1392015600496586753', '1195351968841568257', '修改', 2, 'movie.update', '/cinema/movie/update/:id', '/cinema/movie/info', NULL);
INSERT INTO `acl_permission` VALUES ('1392015710827753474', '1195352054917074946', '添加', 2, 'movie.add', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1392016158800392194', '1195354153482555393', '修改座位信息', 2, 'seat.update', '/cinema/seat/update', '/cinema/seat/info', NULL);
INSERT INTO `acl_permission` VALUES ('1392016224520941570', '1195354153482555393', '删除', 2, 'hall.remove', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1392042841762873345', '1', '场次管理', 1, NULL, '/cinema/playList', 'Layout', NULL);
INSERT INTO `acl_permission` VALUES ('1392042948684070913', '1392042841762873345', '场次列表', 1, NULL, 'info', '/cinema/playList/list', NULL);
INSERT INTO `acl_permission` VALUES ('1392043016652767234', '1392042948684070913', '添加', 2, 'playList.add', '/cinema/playList/add', '/cinema/playList/range', NULL);
INSERT INTO `acl_permission` VALUES ('1392043380126957569', '1392042841762873345', '添加场次', 1, NULL, '/range', '/cinema/playList/range', NULL);
INSERT INTO `acl_permission` VALUES ('1392043448930320385', '1392043380126957569', '添加', 2, 'playList.add', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1392043497244508161', '1392043380126957569', '修改', 2, 'playList.update', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1392043567205498881', '1392043380126957569', '删除', 2, 'playList.remove', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1392044049349132289', '1', '购票管理', 1, NULL, '/cinema/ticket', 'Layout', NULL);
INSERT INTO `acl_permission` VALUES ('1392044600052858881', '1392044049349132289', '选票', 1, NULL, '/cinema/ticket', '/cinema/playList/list', NULL);
INSERT INTO `acl_permission` VALUES ('1402172230078808065', '1392009957752614913', '添加座位总数', 2, 'seat.update', '/cinema/seat/update', '/cinema/seat/info', NULL);
INSERT INTO `acl_permission` VALUES ('1402172789406023682', '1392009957752614913', '设置不可用', 2, 'seat.seatDisable', '/cinema/seat/disable', '/cinema/seat/disable', NULL);
INSERT INTO `acl_permission` VALUES ('1402173194454155265', '1392009957752614913', '确认座位', 2, 'seat.final', '/cinema/seat/final', '/cinema/seat/final', NULL);
INSERT INTO `acl_permission` VALUES ('1402177377982988290', '1392009957752614913', '设置座位总数', 2, 'seat.addTotal', '/cinema/seat/add', '/cinema/seat/info', NULL);
INSERT INTO `acl_permission` VALUES ('1402519754478387201', '1392042948684070913', '修改', 2, 'playList.update', '/cinema/playList/update/:id', '/cinema/playList/range', NULL);
INSERT INTO `acl_permission` VALUES ('1402555432859795458', '1392044049349132289', '退票/支付', 1, NULL, 'back', '/cinema/ticket/back', NULL);
INSERT INTO `acl_permission` VALUES ('1402556017445109762', '1392044600052858881', '选票', 2, 'ticket.show', '/cinema/ticket/show/:id', '/cinema/ticket/show', NULL);
INSERT INTO `acl_permission` VALUES ('1402556532857962497', '1392044600052858881', '支付', 2, 'ticket.pay', '/cinema/ticket/pay', '/cinema/ticket/pay', NULL);
INSERT INTO `acl_permission` VALUES ('1402564736350355458', '1402555432859795458', '退票', 2, 'ticket.remove', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1402880757934219266', '1', '会员管理', 1, NULL, '/cinema/vip', 'Layout', NULL);
INSERT INTO `acl_permission` VALUES ('1402880920866152450', '1402880757934219266', '添加会员', 1, NULL, 'info', '/cinema/vip/info', NULL);
INSERT INTO `acl_permission` VALUES ('1402881071047401474', '1402880757934219266', '会员列表', 1, NULL, 'list', '/cinema/vip/list', NULL);
INSERT INTO `acl_permission` VALUES ('1402881260906766338', '1402880920866152450', '添加会员', 2, 'vip.add', '/cinema/vip/add', '/cinema/vip/info', NULL);
INSERT INTO `acl_permission` VALUES ('1402881329634631681', '1402880920866152450', '修改会员', 2, 'vip.update', '/cinema/vip/update/:id', '/cinema/vip/info', NULL);
INSERT INTO `acl_permission` VALUES ('1402882413564420097', '1', '数据统计', 1, NULL, '/cinema/sta', 'Layout', NULL);
INSERT INTO `acl_permission` VALUES ('1402883100507529217', '1402882413564420097', '票房统计', 1, NULL, 'sales', '/cinema/sta/sales', NULL);
INSERT INTO `acl_permission` VALUES ('1402883269273739265', '1402883100507529217', '查询票房', 2, 'ticket.search', '', '', NULL);
INSERT INTO `acl_permission` VALUES ('1402884341841158146', '1402882413564420097', '营业额统计', 1, NULL, 'turnover', '/cinema/sta/turnover', NULL);
INSERT INTO `acl_permission` VALUES ('1402884471243825154', '1402884341841158146', '查询营业额', 2, 'ticket.searc', '', '', NULL);

-- ----------------------------
-- Table structure for acl_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_role`;
CREATE TABLE `acl_role`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色id',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_role
-- ----------------------------
INSERT INTO `acl_role` VALUES ('1', '普通管理员');
INSERT INTO `acl_role` VALUES ('1193757683205607426', '课程管理员');
INSERT INTO `acl_role` VALUES ('1196300996034977794', 'test');

-- ----------------------------
-- Table structure for acl_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `acl_role_permission`;
CREATE TABLE `acl_role_permission`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `role_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `permission_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_permission_id`(`permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_role_permission
-- ----------------------------
INSERT INTO `acl_role_permission` VALUES ('1196301979792203778', '1', '1195268474480156673');
INSERT INTO `acl_role_permission` VALUES ('1196301979821563906', '1', '1195268616021139457');
INSERT INTO `acl_role_permission` VALUES ('1196301979842535426', '1', '1195269143060602882');
INSERT INTO `acl_role_permission` VALUES ('1196301979855118338', '1', '1195269295926206466');
INSERT INTO `acl_role_permission` VALUES ('1196301979880284161', '1', '1195269473479483394');
INSERT INTO `acl_role_permission` VALUES ('1196301979913838593', '1', '1195269547269873666');
INSERT INTO `acl_role_permission` VALUES ('1196301979926421506', '1', '1196301740985311234');
INSERT INTO `acl_role_permission` VALUES ('1196301979951587330', '1', '1195268788138598401');
INSERT INTO `acl_role_permission` VALUES ('1196301980014501889', '1', '1195269821262782465');
INSERT INTO `acl_role_permission` VALUES ('1196301980035473410', '1', '1195269903542444034');
INSERT INTO `acl_role_permission` VALUES ('1196301980052250626', '1', '1195270037005197313');
INSERT INTO `acl_role_permission` VALUES ('1196301980077416450', '1', '1195270442602782721');
INSERT INTO `acl_role_permission` VALUES ('1196301980094193665', '1', '1195270621548568578');
INSERT INTO `acl_role_permission` VALUES ('1196301980119359489', '1', '1195268893830864898');
INSERT INTO `acl_role_permission` VALUES ('1196301980136136706', '1', '1195270744097742849');
INSERT INTO `acl_role_permission` VALUES ('1196301980249382913', '1', '1195270810560684034');
INSERT INTO `acl_role_permission` VALUES ('1196301980270354434', '1', '1195270862100291586');
INSERT INTO `acl_role_permission` VALUES ('1196301980287131649', '1', '1195270887933009922');
INSERT INTO `acl_role_permission` VALUES ('1196301980303908866', '1', '1195349439240048642');
INSERT INTO `acl_role_permission` VALUES ('1196301980320686082', '1', '1195349699995734017');
INSERT INTO `acl_role_permission` VALUES ('1196301980345851905', '1', '1195349979797753857');
INSERT INTO `acl_role_permission` VALUES ('1196301980362629121', '1', '1195350117270261762');
INSERT INTO `acl_role_permission` VALUES ('1196301980383600641', '1', '1195350188359520258');
INSERT INTO `acl_role_permission` VALUES ('1196301980408766465', '1', '1195349810561781761');
INSERT INTO `acl_role_permission` VALUES ('1196301980421349378', '1', '1195349876252971010');
INSERT INTO `acl_role_permission` VALUES ('1196301980438126593', '1', '1195350299365969922');
INSERT INTO `acl_role_permission` VALUES ('1196301980450709506', '1', '1195350397751758850');
INSERT INTO `acl_role_permission` VALUES ('1196301980501041153', '1', '1195350612172967938');
INSERT INTO `acl_role_permission` VALUES ('1196301980517818370', '1', '1195350500512206850');
INSERT INTO `acl_role_permission` VALUES ('1196301980538789889', '1', '1195350687590748161');
INSERT INTO `acl_role_permission` VALUES ('1196301980622675970', '1', '1195350831744782337');
INSERT INTO `acl_role_permission` VALUES ('1196301980639453186', '1', '1195350919074385921');
INSERT INTO `acl_role_permission` VALUES ('1196301980660424705', '1', '1195351159672246274');
INSERT INTO `acl_role_permission` VALUES ('1196301980677201922', '1', '1195351326706208770');
INSERT INTO `acl_role_permission` VALUES ('1196301980698173441', '1', '1195351566221938690');
INSERT INTO `acl_role_permission` VALUES ('1196301980714950658', '1', '1195351020463296513');
INSERT INTO `acl_role_permission` VALUES ('1196301980723339266', '1', '1195351862889254913');
INSERT INTO `acl_role_permission` VALUES ('1196301980744310786', '1', '1195351968841568257');
INSERT INTO `acl_role_permission` VALUES ('1196301980761088001', '1', '1195352215768633346');
INSERT INTO `acl_role_permission` VALUES ('1196301980777865217', '1', '1195352054917074946');
INSERT INTO `acl_role_permission` VALUES ('1196301980794642434', '1', '1195352127734386690');
INSERT INTO `acl_role_permission` VALUES ('1196301980811419650', '1', '1195352547621965825');
INSERT INTO `acl_role_permission` VALUES ('1196301980828196865', '1', '1195353513549205505');
INSERT INTO `acl_role_permission` VALUES ('1196301980844974082', '1', '1195352856645701633');
INSERT INTO `acl_role_permission` VALUES ('1196301980861751298', '1', '1195352909401657346');
INSERT INTO `acl_role_permission` VALUES ('1196301980886917122', '1', '1195353051395624961');
INSERT INTO `acl_role_permission` VALUES ('1196301980928860162', '1', '1195353672110673921');
INSERT INTO `acl_role_permission` VALUES ('1196301980954025986', '1', '1195354076890370050');
INSERT INTO `acl_role_permission` VALUES ('1196301980970803201', '1', '1195354153482555393');
INSERT INTO `acl_role_permission` VALUES ('1196301980987580418', '1', '1195354315093282817');
INSERT INTO `acl_role_permission` VALUES ('1196305293070077953', '1', '1');
INSERT INTO `acl_role_permission` VALUES ('1196305293099438081', '1', '1195268474480156673');
INSERT INTO `acl_role_permission` VALUES ('1196305293120409602', '1', '1195268616021139457');
INSERT INTO `acl_role_permission` VALUES ('1196305293153964034', '1', '1195269143060602882');
INSERT INTO `acl_role_permission` VALUES ('1196305293183324162', '1', '1195269295926206466');
INSERT INTO `acl_role_permission` VALUES ('1196305293212684290', '1', '1195269473479483394');
INSERT INTO `acl_role_permission` VALUES ('1196305293237850114', '1', '1195269547269873666');
INSERT INTO `acl_role_permission` VALUES ('1196305293271404545', '1', '1196301740985311234');
INSERT INTO `acl_role_permission` VALUES ('1196305293485314049', '1', '1195268788138598401');
INSERT INTO `acl_role_permission` VALUES ('1196305293506285569', '1', '1195269821262782465');
INSERT INTO `acl_role_permission` VALUES ('1196305293527257089', '1', '1195269903542444034');
INSERT INTO `acl_role_permission` VALUES ('1196305293552422914', '1', '1195270037005197313');
INSERT INTO `acl_role_permission` VALUES ('1196305293565005825', '1', '1195270442602782721');
INSERT INTO `acl_role_permission` VALUES ('1196305293594365954', '1', '1195270621548568578');
INSERT INTO `acl_role_permission` VALUES ('1196305293611143169', '1', '1195268893830864898');
INSERT INTO `acl_role_permission` VALUES ('1196305293627920385', '1', '1195270744097742849');
INSERT INTO `acl_role_permission` VALUES ('1196305293657280513', '1', '1195349439240048642');
INSERT INTO `acl_role_permission` VALUES ('1196305293674057729', '1', '1195349699995734017');
INSERT INTO `acl_role_permission` VALUES ('1196305293690834946', '1', '1195349979797753857');
INSERT INTO `acl_role_permission` VALUES ('1196305293716000770', '1', '1195350117270261762');
INSERT INTO `acl_role_permission` VALUES ('1196305293736972290', '1', '1195350188359520258');
INSERT INTO `acl_role_permission` VALUES ('1196305293749555202', '1', '1195349810561781761');
INSERT INTO `acl_role_permission` VALUES ('1196305293766332417', '1', '1195349876252971010');
INSERT INTO `acl_role_permission` VALUES ('1196305293795692546', '1', '1195350299365969922');
INSERT INTO `acl_role_permission` VALUES ('1196305293812469762', '1', '1195350397751758850');
INSERT INTO `acl_role_permission` VALUES ('1196305293837635586', '1', '1195350612172967938');
INSERT INTO `acl_role_permission` VALUES ('1196305293858607106', '1', '1195350500512206850');
INSERT INTO `acl_role_permission` VALUES ('1196305293875384322', '1', '1195350687590748161');
INSERT INTO `acl_role_permission` VALUES ('1196305293892161538', '1', '1195350831744782337');
INSERT INTO `acl_role_permission` VALUES ('1196305293950881794', '1', '1195350919074385921');
INSERT INTO `acl_role_permission` VALUES ('1196305293976047617', '1', '1195351159672246274');
INSERT INTO `acl_role_permission` VALUES ('1196305294127042561', '1', '1195351326706208770');
INSERT INTO `acl_role_permission` VALUES ('1196305294156402690', '1', '1195351566221938690');
INSERT INTO `acl_role_permission` VALUES ('1196305294177374209', '1', '1195351862889254913');
INSERT INTO `acl_role_permission` VALUES ('1196305294194151425', '1', '1195351968841568257');
INSERT INTO `acl_role_permission` VALUES ('1196305294223511554', '1', '1195352215768633346');
INSERT INTO `acl_role_permission` VALUES ('1196305294240288770', '1', '1195352054917074946');
INSERT INTO `acl_role_permission` VALUES ('1196305294248677377', '1', '1195352127734386690');
INSERT INTO `acl_role_permission` VALUES ('1196305294248677378', '1', '1195352547621965825');
INSERT INTO `acl_role_permission` VALUES ('1196305294319980546', '1', '1195353513549205505');
INSERT INTO `acl_role_permission` VALUES ('1196305294319980547', '1', '1195352856645701633');
INSERT INTO `acl_role_permission` VALUES ('1196305294319980548', '1', '1195352909401657346');
INSERT INTO `acl_role_permission` VALUES ('1196305294378700802', '1', '1195353051395624961');
INSERT INTO `acl_role_permission` VALUES ('1196305294378700803', '1', '1195353672110673921');
INSERT INTO `acl_role_permission` VALUES ('1196305294458392577', '1', '1195354076890370050');
INSERT INTO `acl_role_permission` VALUES ('1196305294483558402', '1', '1195354153482555393');
INSERT INTO `acl_role_permission` VALUES ('1196305294500335618', '1', '1195354315093282817');
INSERT INTO `acl_role_permission` VALUES ('1196305566656139266', '1', '1');
INSERT INTO `acl_role_permission` VALUES ('1196305566689693698', '1', '1195268474480156673');
INSERT INTO `acl_role_permission` VALUES ('1196305566706470913', '1', '1195268616021139457');
INSERT INTO `acl_role_permission` VALUES ('1196305566740025346', '1', '1195269143060602882');
INSERT INTO `acl_role_permission` VALUES ('1196305566756802561', '1', '1195269295926206466');
INSERT INTO `acl_role_permission` VALUES ('1196305566781968385', '1', '1195269473479483394');
INSERT INTO `acl_role_permission` VALUES ('1196305566811328514', '1', '1195269547269873666');
INSERT INTO `acl_role_permission` VALUES ('1196305566828105730', '1', '1196301740985311234');
INSERT INTO `acl_role_permission` VALUES ('1196305566853271554', '1', '1195268788138598401');
INSERT INTO `acl_role_permission` VALUES ('1196305566878437378', '1', '1195269821262782465');
INSERT INTO `acl_role_permission` VALUES ('1196305566895214593', '1', '1195269903542444034');
INSERT INTO `acl_role_permission` VALUES ('1196305566916186113', '1', '1195270037005197313');
INSERT INTO `acl_role_permission` VALUES ('1196305566949740546', '1', '1195270442602782721');
INSERT INTO `acl_role_permission` VALUES ('1196305566966517761', '1', '1195270621548568578');
INSERT INTO `acl_role_permission` VALUES ('1196305566991683585', '1', '1195268893830864898');
INSERT INTO `acl_role_permission` VALUES ('1196305567012655106', '1', '1195270744097742849');
INSERT INTO `acl_role_permission` VALUES ('1196305567029432322', '1', '1195270810560684034');
INSERT INTO `acl_role_permission` VALUES ('1196305567042015233', '1', '1195270862100291586');
INSERT INTO `acl_role_permission` VALUES ('1196305567100735490', '1', '1195270887933009922');
INSERT INTO `acl_role_permission` VALUES ('1196305567117512705', '1', '1195349439240048642');
INSERT INTO `acl_role_permission` VALUES ('1196305567142678530', '1', '1195349699995734017');
INSERT INTO `acl_role_permission` VALUES ('1196305567155261442', '1', '1195349979797753857');
INSERT INTO `acl_role_permission` VALUES ('1196305567172038658', '1', '1195350117270261762');
INSERT INTO `acl_role_permission` VALUES ('1196305567188815873', '1', '1195350188359520258');
INSERT INTO `acl_role_permission` VALUES ('1196305567218176001', '1', '1195349810561781761');
INSERT INTO `acl_role_permission` VALUES ('1196305567234953217', '1', '1195349876252971010');
INSERT INTO `acl_role_permission` VALUES ('1196305567251730434', '1', '1195350299365969922');
INSERT INTO `acl_role_permission` VALUES ('1196305567272701954', '1', '1195350397751758850');
INSERT INTO `acl_role_permission` VALUES ('1196305567289479170', '1', '1195350612172967938');
INSERT INTO `acl_role_permission` VALUES ('1196305567310450690', '1', '1195350500512206850');
INSERT INTO `acl_role_permission` VALUES ('1196305567327227905', '1', '1195350687590748161');
INSERT INTO `acl_role_permission` VALUES ('1196305567448862722', '1', '1195350831744782337');
INSERT INTO `acl_role_permission` VALUES ('1196305567478222850', '1', '1195350919074385921');
INSERT INTO `acl_role_permission` VALUES ('1196305567495000065', '1', '1195351159672246274');
INSERT INTO `acl_role_permission` VALUES ('1196305567520165889', '1', '1195351326706208770');
INSERT INTO `acl_role_permission` VALUES ('1196305567541137409', '1', '1195351566221938690');
INSERT INTO `acl_role_permission` VALUES ('1196305567570497538', '1', '1195351862889254913');
INSERT INTO `acl_role_permission` VALUES ('1196305567587274754', '1', '1195351968841568257');
INSERT INTO `acl_role_permission` VALUES ('1196305567604051970', '1', '1195352215768633346');
INSERT INTO `acl_role_permission` VALUES ('1196305567633412098', '1', '1195352054917074946');
INSERT INTO `acl_role_permission` VALUES ('1196305567683743745', '1', '1195352127734386690');
INSERT INTO `acl_role_permission` VALUES ('1196305567721492481', '1', '1195352547621965825');
INSERT INTO `acl_role_permission` VALUES ('1196305567742464002', '1', '1195353513549205505');
INSERT INTO `acl_role_permission` VALUES ('1196305567771824129', '1', '1195352856645701633');
INSERT INTO `acl_role_permission` VALUES ('1196305567792795650', '1', '1195352909401657346');
INSERT INTO `acl_role_permission` VALUES ('1196305567809572866', '1', '1195353051395624961');
INSERT INTO `acl_role_permission` VALUES ('1196305567843127298', '1', '1195353672110673921');
INSERT INTO `acl_role_permission` VALUES ('1196305567868293122', '1', '1195354076890370050');
INSERT INTO `acl_role_permission` VALUES ('1196305567885070338', '1', '1195354153482555393');
INSERT INTO `acl_role_permission` VALUES ('1196305567910236162', '1', '1195354315093282817');
INSERT INTO `acl_role_permission` VALUES ('1196312702601695234', '1', '1');
INSERT INTO `acl_role_permission` VALUES ('1196312702652026881', '1', '1195268474480156673');
INSERT INTO `acl_role_permission` VALUES ('1196312702668804098', '1', '1195268616021139457');
INSERT INTO `acl_role_permission` VALUES ('1196312702698164226', '1', '1195269143060602882');
INSERT INTO `acl_role_permission` VALUES ('1196312702723330049', '1', '1195269295926206466');
INSERT INTO `acl_role_permission` VALUES ('1196312702744301569', '1', '1195269473479483394');
INSERT INTO `acl_role_permission` VALUES ('1196312702765273089', '1', '1195269547269873666');
INSERT INTO `acl_role_permission` VALUES ('1196312702790438913', '1', '1196301740985311234');
INSERT INTO `acl_role_permission` VALUES ('1196312702945628161', '1', '1195268788138598401');
INSERT INTO `acl_role_permission` VALUES ('1196312702970793985', '1', '1195269821262782465');
INSERT INTO `acl_role_permission` VALUES ('1196312703000154114', '1', '1195269903542444034');
INSERT INTO `acl_role_permission` VALUES ('1196312703025319938', '1', '1195270037005197313');
INSERT INTO `acl_role_permission` VALUES ('1196312703046291458', '1', '1195270442602782721');
INSERT INTO `acl_role_permission` VALUES ('1196312703063068673', '1', '1195270621548568578');
INSERT INTO `acl_role_permission` VALUES ('1196312703084040193', '1', '1195268893830864898');
INSERT INTO `acl_role_permission` VALUES ('1196312703113400321', '1', '1195270744097742849');
INSERT INTO `acl_role_permission` VALUES ('1196312703134371842', '1', '1195270810560684034');
INSERT INTO `acl_role_permission` VALUES ('1196312703159537665', '1', '1195270862100291586');
INSERT INTO `acl_role_permission` VALUES ('1196312703184703490', '1', '1195270887933009922');
INSERT INTO `acl_role_permission` VALUES ('1196312703209869313', '1', '1195349439240048642');
INSERT INTO `acl_role_permission` VALUES ('1196312703230840834', '1', '1195349699995734017');
INSERT INTO `acl_role_permission` VALUES ('1196312703251812354', '1', '1195349979797753857');
INSERT INTO `acl_role_permission` VALUES ('1196312703272783873', '1', '1195350117270261762');
INSERT INTO `acl_role_permission` VALUES ('1196312703293755394', '1', '1195350188359520258');
INSERT INTO `acl_role_permission` VALUES ('1196312703327309826', '1', '1195349810561781761');
INSERT INTO `acl_role_permission` VALUES ('1196312703348281345', '1', '1195349876252971010');
INSERT INTO `acl_role_permission` VALUES ('1196312703365058561', '1', '1195350299365969922');
INSERT INTO `acl_role_permission` VALUES ('1196312703386030082', '1', '1195350397751758850');
INSERT INTO `acl_role_permission` VALUES ('1196312703440556034', '1', '1195350612172967938');
INSERT INTO `acl_role_permission` VALUES ('1196312703486693378', '1', '1195350500512206850');
INSERT INTO `acl_role_permission` VALUES ('1196312703511859202', '1', '1195350687590748161');
INSERT INTO `acl_role_permission` VALUES ('1196312703654465537', '1', '1195350831744782337');
INSERT INTO `acl_role_permission` VALUES ('1196312703683825665', '1', '1195350919074385921');
INSERT INTO `acl_role_permission` VALUES ('1196312703700602882', '1', '1195351159672246274');
INSERT INTO `acl_role_permission` VALUES ('1196312703717380098', '1', '1195351326706208770');
INSERT INTO `acl_role_permission` VALUES ('1196312703738351618', '1', '1195351566221938690');
INSERT INTO `acl_role_permission` VALUES ('1196312703759323137', '1', '1195351020463296513');
INSERT INTO `acl_role_permission` VALUES ('1196312703776100353', '1', '1195351862889254913');
INSERT INTO `acl_role_permission` VALUES ('1196312703792877570', '1', '1195351968841568257');
INSERT INTO `acl_role_permission` VALUES ('1196312703830626305', '1', '1195352215768633346');
INSERT INTO `acl_role_permission` VALUES ('1196312703843209217', '1', '1195352054917074946');
INSERT INTO `acl_role_permission` VALUES ('1196312703868375041', '1', '1195352127734386690');
INSERT INTO `acl_role_permission` VALUES ('1196312703889346561', '1', '1195352547621965825');
INSERT INTO `acl_role_permission` VALUES ('1196312703901929473', '1', '1195353513549205505');
INSERT INTO `acl_role_permission` VALUES ('1196312703918706689', '1', '1195352856645701633');
INSERT INTO `acl_role_permission` VALUES ('1196312703952261121', '1', '1195352909401657346');
INSERT INTO `acl_role_permission` VALUES ('1196312703973232642', '1', '1195353051395624961');
INSERT INTO `acl_role_permission` VALUES ('1196312703990009857', '1', '1195353672110673921');
INSERT INTO `acl_role_permission` VALUES ('1196312704048730114', '1', '1195354076890370050');
INSERT INTO `acl_role_permission` VALUES ('1196312704069701633', '1', '1195354153482555393');
INSERT INTO `acl_role_permission` VALUES ('1196312704094867457', '1', '1195354315093282817');
INSERT INTO `acl_role_permission` VALUES ('1402885175874314242', '1196300996034977794', '1195351862889254913');
INSERT INTO `acl_role_permission` VALUES ('1402885175874314243', '1196300996034977794', '1195352127734386690');
INSERT INTO `acl_role_permission` VALUES ('1402885175874314244', '1196300996034977794', '1195352054917074946');
INSERT INTO `acl_role_permission` VALUES ('1402885175874314245', '1196300996034977794', '1');

-- ----------------------------
-- Table structure for acl_user
-- ----------------------------
DROP TABLE IF EXISTS `acl_user`;
CREATE TABLE `acl_user`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会员id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '微信openid',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_user
-- ----------------------------
INSERT INTO `acl_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin');
INSERT INTO `acl_user` VALUES ('2', 'test', '25f9e794323b453885f5181f1b624d0b', 'test');
INSERT INTO `acl_user` VALUES ('3', 'test123456', 'e10adc3949ba59abbe56e057f20f883e', '123456');

-- ----------------------------
-- Table structure for acl_user_role
-- ----------------------------
DROP TABLE IF EXISTS `acl_user_role`;
CREATE TABLE `acl_user_role`  (
  `id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主键id',
  `role_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '角色id',
  `user_id` char(19) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE,
  INDEX `idx_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of acl_user_role
-- ----------------------------
INSERT INTO `acl_user_role` VALUES ('1', '1', '1');
INSERT INTO `acl_user_role` VALUES ('1402885649012776962', '1196300996034977794', '2');

-- ----------------------------
-- Table structure for hall
-- ----------------------------
DROP TABLE IF EXISTS `hall`;
CREATE TABLE `hall`  (
  `hall_id` int NOT NULL AUTO_INCREMENT,
  `hall_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `hall_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seat_count` int NULL DEFAULT NULL,
  PRIMARY KEY (`hall_id`, `hall_name`) USING BTREE,
  INDEX `hall_name`(`hall_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hall
-- ----------------------------
INSERT INTO `hall` VALUES (1, '测试一号厅', '普通厅', 16);
INSERT INTO `hall` VALUES (3, '测试二号厅', '测试修改', 1);
INSERT INTO `hall` VALUES (4, '测试三号厅', '测试', 0);

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie`  (
  `movie_id` int NOT NULL AUTO_INCREMENT COMMENT '影片id',
  `movie_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `movie_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movie_introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movie_cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`movie_id`, `movie_name`) USING BTREE,
  INDEX `movie_name`(`movie_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES (1, '测试影片一号', '测试', '测试修改', 'https://guli-1121.oss-cn-beijing.aliyuncs.com/2020/11/01/665c76434d094b5a8037eac9635884ec0.jpg');
INSERT INTO `movie` VALUES (2, '测试影片二号', '测试', '测试', 'https://guli-1121.oss-cn-beijing.aliyuncs.com/2020/11/01/665c76434d094b5a8037eac9635884ec0.jpg');
INSERT INTO `movie` VALUES (4, '测试影片三号', '测试', '测试', 'https://guli-1121.oss-cn-beijing.aliyuncs.com/2020/11/01/665c76434d094b5a8037eac9635884ec0.jpg');

-- ----------------------------
-- Table structure for play_list
-- ----------------------------
DROP TABLE IF EXISTS `play_list`;
CREATE TABLE `play_list`  (
  `playList_id` int NOT NULL AUTO_INCREMENT,
  `playList_time` datetime NULL DEFAULT NULL,
  `hall_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `movie_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ticket_price` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`playList_id`) USING BTREE,
  INDEX `pl.hallName`(`hall_name`) USING BTREE,
  INDEX `pl.movieName`(`movie_name`) USING BTREE,
  CONSTRAINT `pl.hallName` FOREIGN KEY (`hall_name`) REFERENCES `hall` (`hall_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pl.movieName` FOREIGN KEY (`movie_name`) REFERENCES `movie` (`movie_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of play_list
-- ----------------------------
INSERT INTO `play_list` VALUES (1, '2021-05-04 00:00:00', '测试一号厅', '测试影片一号', '20');
INSERT INTO `play_list` VALUES (2, '2021-06-08 00:00:00', '测试三号厅', '测试影片一号', '10');
INSERT INTO `play_list` VALUES (3, '2021-06-10 00:00:00', '测试三号厅', '测试影片三号', '34');
INSERT INTO `play_list` VALUES (5, '2021-06-26 00:00:00', '测试一号厅', '测试影片一号', '23');

-- ----------------------------
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat`  (
  `seat_id` int NOT NULL AUTO_INCREMENT,
  `hall_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `seat_line` int NULL DEFAULT NULL,
  `seat_cow` int NULL DEFAULT NULL,
  `is_usable` int NULL DEFAULT NULL,
  PRIMARY KEY (`seat_id`) USING BTREE,
  INDEX `s.hallName`(`hall_name`) USING BTREE,
  CONSTRAINT `s.hallName` FOREIGN KEY (`hall_name`) REFERENCES `hall` (`hall_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 236 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seat
-- ----------------------------
INSERT INTO `seat` VALUES (181, '测试二号厅', 1, 1, 1);
INSERT INTO `seat` VALUES (182, '测试二号厅', 1, 2, 1);
INSERT INTO `seat` VALUES (183, '测试二号厅', 1, 3, 0);
INSERT INTO `seat` VALUES (184, '测试二号厅', 1, 4, 1);
INSERT INTO `seat` VALUES (185, '测试二号厅', 1, 5, 1);
INSERT INTO `seat` VALUES (186, '测试二号厅', 2, 1, 1);
INSERT INTO `seat` VALUES (187, '测试二号厅', 2, 2, 1);
INSERT INTO `seat` VALUES (188, '测试二号厅', 2, 3, 0);
INSERT INTO `seat` VALUES (189, '测试二号厅', 2, 4, 1);
INSERT INTO `seat` VALUES (190, '测试二号厅', 2, 5, 1);
INSERT INTO `seat` VALUES (191, '测试二号厅', 3, 1, 1);
INSERT INTO `seat` VALUES (192, '测试二号厅', 3, 2, 1);
INSERT INTO `seat` VALUES (193, '测试二号厅', 3, 3, 0);
INSERT INTO `seat` VALUES (194, '测试二号厅', 3, 4, 0);
INSERT INTO `seat` VALUES (195, '测试二号厅', 3, 5, 1);
INSERT INTO `seat` VALUES (196, '测试二号厅', 8, 9, 1);
INSERT INTO `seat` VALUES (197, '测试三号厅', 1, 1, 1);
INSERT INTO `seat` VALUES (198, '测试三号厅', 1, 2, 1);
INSERT INTO `seat` VALUES (199, '测试三号厅', 1, 3, 1);
INSERT INTO `seat` VALUES (200, '测试三号厅', 1, 4, 1);
INSERT INTO `seat` VALUES (201, '测试三号厅', 1, 5, 1);
INSERT INTO `seat` VALUES (202, '测试三号厅', 2, 1, 1);
INSERT INTO `seat` VALUES (203, '测试三号厅', 2, 2, 1);
INSERT INTO `seat` VALUES (204, '测试三号厅', 2, 3, 1);
INSERT INTO `seat` VALUES (205, '测试三号厅', 2, 4, 1);
INSERT INTO `seat` VALUES (206, '测试三号厅', 2, 5, 1);
INSERT INTO `seat` VALUES (207, '测试三号厅', 3, 1, 1);
INSERT INTO `seat` VALUES (208, '测试三号厅', 3, 2, 0);
INSERT INTO `seat` VALUES (209, '测试三号厅', 3, 3, 1);
INSERT INTO `seat` VALUES (210, '测试三号厅', 3, 4, 1);
INSERT INTO `seat` VALUES (211, '测试三号厅', 3, 5, 1);
INSERT INTO `seat` VALUES (212, '测试三号厅', 4, 1, 1);
INSERT INTO `seat` VALUES (213, '测试三号厅', 4, 2, 0);
INSERT INTO `seat` VALUES (214, '测试三号厅', 4, 3, 1);
INSERT INTO `seat` VALUES (215, '测试三号厅', 4, 4, 1);
INSERT INTO `seat` VALUES (216, '测试三号厅', 4, 5, 1);
INSERT INTO `seat` VALUES (217, '测试一号厅', 1, 1, 1);
INSERT INTO `seat` VALUES (218, '测试一号厅', 1, 2, 1);
INSERT INTO `seat` VALUES (219, '测试一号厅', 1, 3, 1);
INSERT INTO `seat` VALUES (220, '测试一号厅', 1, 4, 1);
INSERT INTO `seat` VALUES (221, '测试一号厅', 1, 5, 1);
INSERT INTO `seat` VALUES (222, '测试一号厅', 2, 1, 1);
INSERT INTO `seat` VALUES (223, '测试一号厅', 2, 2, 1);
INSERT INTO `seat` VALUES (224, '测试一号厅', 2, 3, 1);
INSERT INTO `seat` VALUES (225, '测试一号厅', 2, 4, 1);
INSERT INTO `seat` VALUES (226, '测试一号厅', 2, 5, 1);
INSERT INTO `seat` VALUES (227, '测试一号厅', 3, 1, 0);
INSERT INTO `seat` VALUES (228, '测试一号厅', 3, 2, 0);
INSERT INTO `seat` VALUES (229, '测试一号厅', 3, 3, 1);
INSERT INTO `seat` VALUES (230, '测试一号厅', 3, 4, 1);
INSERT INTO `seat` VALUES (231, '测试一号厅', 3, 5, 1);
INSERT INTO `seat` VALUES (232, '测试一号厅', 4, 1, 0);
INSERT INTO `seat` VALUES (233, '测试一号厅', 4, 2, 0);
INSERT INTO `seat` VALUES (234, '测试一号厅', 4, 3, 1);
INSERT INTO `seat` VALUES (235, '测试一号厅', 4, 4, 1);
INSERT INTO `seat` VALUES (236, '测试一号厅', 4, 5, 1);

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `seat_id` int NULL DEFAULT 0,
  `customer_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `playList_id` int NULL DEFAULT 0,
  `final_price` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_paid` int NULL DEFAULT NULL COMMENT '是否支付',
  `sell_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ticket_id`) USING BTREE,
  INDEX `plid`(`playList_id`) USING BTREE,
  INDEX `seatid`(`seat_id`) USING BTREE,
  INDEX `userid`(`user_id`) USING BTREE,
  CONSTRAINT `plid` FOREIGN KEY (`playList_id`) REFERENCES `play_list` (`playList_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `seatid` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket
-- ----------------------------
INSERT INTO `ticket` VALUES (8, '1', 224, '12', 5, '23.0', 1, '2021-06-09 17:52:57');
INSERT INTO `ticket` VALUES (10, '1', 231, '12', 5, '23.0', 1, '2021-06-09 17:54:32');
INSERT INTO `ticket` VALUES (11, '1', 236, '12', 5, '23.0', 0, '2021-06-24 17:54:32');

-- ----------------------------
-- Table structure for vip
-- ----------------------------
DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip`  (
  `vip_id` int NOT NULL AUTO_INCREMENT,
  `vip_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vip_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `vip_discount` float NULL DEFAULT NULL,
  PRIMARY KEY (`vip_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vip
-- ----------------------------
INSERT INTO `vip` VALUES (1, '测试1', '123', 7);
INSERT INTO `vip` VALUES (2, '测试2', '1234', 8);

-- ----------------------------
-- Procedure structure for selectFinalTicketInfo
-- ----------------------------
DROP PROCEDURE IF EXISTS `selectFinalTicketInfo`;
delimiter ;;
CREATE PROCEDURE `selectFinalTicketInfo`(in playListId VARCHAR(255),in customerPhone VARCHAR(255))
BEGIN
	SELECT t.ticket_id, pl.movie_name,pl.hall_name,s.seat_line,s.seat_cow,date_format(pl.playList_time,'%m/%d %H:%I') AS play_time,t.customer_phone,pl.ticket_price,t.final_price,t.is_paid
	FROM ticket AS t INNER JOIN seat AS s ON t.seat_id=s.seat_id JOIN play_list AS pl on pl.playList_id=t.playList_id WHERE t.customer_phone= customerPhone and t.playList_id=playListId ; 

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for selectMovieTotalTicketPrice
-- ----------------------------
DROP PROCEDURE IF EXISTS `selectMovieTotalTicketPrice`;
delimiter ;;
CREATE PROCEDURE `selectMovieTotalTicketPrice`(in movieName VARCHAR(255))
BEGIN
	SELECT SUM(pl.ticket_price) FROM play_list  AS pl,ticket AS t
	WHERE  pl.movie_name=movieName AND t.playList_id=pl.playList_id AND t.is_paid=1;
	END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for selectSeat
-- ----------------------------
DROP PROCEDURE IF EXISTS `selectSeat`;
delimiter ;;
CREATE PROCEDURE `selectSeat`(in playListId VARCHAR(200) ,in hallName VARCHAR(200))
BEGIN
  select *,1 as is_selected from seat where seat.hall_name=hallName AND seat.seat_id IN (select ticket.seat_id from ticket WHERE playList_id = playListId)
	UNION select *,0 as is_selected from seat where  seat.hall_name=hallName AND seat.seat_id NOT IN (select ticket.seat_id from ticket WHERE playList_id = playListId );
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for selectToCurrentWithCustomer
-- ----------------------------
DROP PROCEDURE IF EXISTS `selectToCurrentWithCustomer`;
delimiter ;;
CREATE PROCEDURE `selectToCurrentWithCustomer`(in customerPhone VARCHAR(255),in currentTime VARCHAR(255))
BEGIN
	SELECT t.ticket_id, pl.movie_name,pl.hall_name,s.seat_line,s.seat_cow,date_format(pl.playList_time,'%m/%d %H:%I') AS play_time,t.customer_phone,pl.ticket_price,t.final_price,t.is_paid
	FROM ticket AS t INNER JOIN seat AS s ON t.seat_id=s.seat_id JOIN play_list AS pl on pl.playList_id=t.playList_id WHERE t.customer_phone= customerPhone and pl.playList_time>currentTime; 

END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for selectTotalFinalPrice
-- ----------------------------
DROP PROCEDURE IF EXISTS `selectTotalFinalPrice`;
delimiter ;;
CREATE PROCEDURE `selectTotalFinalPrice`(in beginTime VARCHAR(255),in endTime VARCHAR(255))
BEGIN
	SELECT SUM(t.final_price) FROM 	 ticket AS t
	WHERE  t.sell_time BETWEEN  beginTime AND endTime AND t.is_paid=1 ;	
	END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table seat
-- ----------------------------
DROP TRIGGER IF EXISTS `insertHallSeats`;
delimiter ;;
CREATE TRIGGER `insertHallSeats` AFTER INSERT ON `seat` FOR EACH ROW BEGIN 
UPDATE hall set seat_count=seat_count+1 WHERE hall_name=new.hall_name; 	END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table seat
-- ----------------------------
DROP TRIGGER IF EXISTS `deleteHallSeats`;
delimiter ;;
CREATE TRIGGER `deleteHallSeats` AFTER DELETE ON `seat` FOR EACH ROW BEGIN
IF(select count(*) FROM seat WHERE hall_name=old.hall_name)=0 THEN
UPDATE hall set seat_count ='0' WHERE hall_name=old.hall_name;
END IF;END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
