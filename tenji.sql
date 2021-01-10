SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `employee_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '社员ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '名前',
  `frigana` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'フリガナ',
  `entering_date` date NOT NULL COMMENT '入社年月日',
  PRIMARY KEY (`employee_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('uh5340', '李雲輝', 'り　ウンキ', '2015-10-20');

SET FOREIGN_KEY_CHECKS = 1;




SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for employee_certification
-- ----------------------------
DROP TABLE IF EXISTS `employee_certification`;
CREATE TABLE `employee_certification`  (
  `certification_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `certification_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `get_date` date NOT NULL,
  `encourage_date` date NOT NULL,
  PRIMARY KEY (`certification_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee_certification
-- ----------------------------
INSERT INTO `employee_certification` VALUES (1, 'uh5340', '日本語能力試験2級', '2008-10-01', '0000-00-00');
INSERT INTO `employee_certification` VALUES (6, 'uh5340', 'test1', '2020-12-08', '2021-01-14');
INSERT INTO `employee_certification` VALUES (7, 'uh5340', 'test2', '2020-12-30', '2021-01-06');

SET FOREIGN_KEY_CHECKS = 1;



SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `login_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pay_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_number` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_photo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `verification_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (8, 'admin', 'a34462b26a0d9dd8288c278411f75ca2', NULL, 'liyunhui', NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;