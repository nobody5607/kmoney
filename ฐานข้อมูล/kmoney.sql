/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MariaDB
 Source Server Version : 100411
 Source Host           : localhost:3306
 Source Schema         : kmoney

 Target Server Type    : MariaDB
 Target Server Version : 100411
 File Encoding         : 65001

 Date: 06/03/2020 11:23:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for affective_score
-- ----------------------------
DROP TABLE IF EXISTS `affective_score`;
CREATE TABLE `affective_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'รายการ',
  `percent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Percent %',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of affective_score
-- ----------------------------
BEGIN;
INSERT INTO `affective_score` VALUES (1, ':(   0%', '0');
INSERT INTO `affective_score` VALUES (2, ';[  50%', '50');
INSERT INTO `affective_score` VALUES (3, ':)  100%', '100');
INSERT INTO `affective_score` VALUES (4, ':P  150%', '150');
INSERT INTO `affective_score` VALUES (5, ':D  200%', '200');
COMMIT;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`) USING BTREE,
  KEY `auth_assignment_user_id_idx` (`user_id`) USING BTREE,
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
BEGIN;
INSERT INTO `auth_assignment` VALUES ('admin', '1', 1535696400);
INSERT INTO `auth_assignment` VALUES ('admin', '4', 1565678902);
INSERT INTO `auth_assignment` VALUES ('ApprovedBill', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('billmanager', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('billmanager', '13', 1566568986);
INSERT INTO `auth_assignment` VALUES ('billmanager', '14', 1566570968);
INSERT INTO `auth_assignment` VALUES ('billmanager', '4', 1565678913);
INSERT INTO `auth_assignment` VALUES ('billmanager', '5', 1565678992);
INSERT INTO `auth_assignment` VALUES ('chargers', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('chargers', '4', 1565678913);
INSERT INTO `auth_assignment` VALUES ('delete_bill_image', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('delete_bill_image', '4', 1565678913);
INSERT INTO `auth_assignment` VALUES ('edit_about', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('edit_about', '4', 1565678913);
INSERT INTO `auth_assignment` VALUES ('edit_contact', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('edit_contact', '4', 1565678913);
INSERT INTO `auth_assignment` VALUES ('edit_home', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('edit_home', '4', 1565678913);
INSERT INTO `auth_assignment` VALUES ('manage_customer', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('manage_information', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('manage_information', '4', 1565678913);
INSERT INTO `auth_assignment` VALUES ('manage_user_percent', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('packager', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('packager', '4', 1565678913);
INSERT INTO `auth_assignment` VALUES ('packager', '6', 1565685182);
INSERT INTO `auth_assignment` VALUES ('preview_bill', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('preview_bill_charg', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('preview_bill_shipping', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('preview_product', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('preview_user_percent', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('previewBill', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('report', '1', 1573117605);
INSERT INTO `auth_assignment` VALUES ('report', '4', 1573117594);
INSERT INTO `auth_assignment` VALUES ('sale', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('sale', '14', 1566570685);
INSERT INTO `auth_assignment` VALUES ('sale', '7', 1566570400);
INSERT INTO `auth_assignment` VALUES ('sell_shipping', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('sell_shipping', '4', 1565678913);
INSERT INTO `auth_assignment` VALUES ('sell_shipping', '5', 1565678992);
INSERT INTO `auth_assignment` VALUES ('shipping', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('shipping', '4', 1565678913);
INSERT INTO `auth_assignment` VALUES ('shipping', '5', 1565678992);
INSERT INTO `auth_assignment` VALUES ('user', '1', 1578907311);
INSERT INTO `auth_assignment` VALUES ('user', '10', 1566556677);
INSERT INTO `auth_assignment` VALUES ('user', '11', 1566556730);
INSERT INTO `auth_assignment` VALUES ('user', '12', 1566556783);
INSERT INTO `auth_assignment` VALUES ('user', '13', 1566556886);
INSERT INTO `auth_assignment` VALUES ('user', '14', 1566570662);
INSERT INTO `auth_assignment` VALUES ('user', '15', 1569586537);
INSERT INTO `auth_assignment` VALUES ('user', '2', 1562226673);
INSERT INTO `auth_assignment` VALUES ('user', '3', 1562228852);
INSERT INTO `auth_assignment` VALUES ('user', '4', 1565678613);
INSERT INTO `auth_assignment` VALUES ('user', '5', 1565678768);
INSERT INTO `auth_assignment` VALUES ('user', '6', 1565679792);
INSERT INTO `auth_assignment` VALUES ('user', '7', 1566556470);
INSERT INTO `auth_assignment` VALUES ('user', '8', 1566556550);
INSERT INTO `auth_assignment` VALUES ('user', '9', 1566556612);
COMMIT;

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE,
  KEY `rule_name` (`rule_name`) USING BTREE,
  KEY `idx-auth_item-type` (`type`) USING BTREE,
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
BEGIN;
INSERT INTO `auth_item` VALUES ('/admin/*', 2, NULL, NULL, NULL, 1535696373, 1535696373);
INSERT INTO `auth_item` VALUES ('/affective-score/*', 2, NULL, NULL, NULL, 1568122532, 1568122532);
INSERT INTO `auth_item` VALUES ('/api2/*', 2, NULL, NULL, NULL, 1578773457, 1578773457);
INSERT INTO `auth_item` VALUES ('/bill-chargers/*', 2, NULL, NULL, NULL, 1564329147, 1564329147);
INSERT INTO `auth_item` VALUES ('/bill-chargers/create', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-chargers/delete', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-chargers/deletes', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-chargers/index', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-chargers/manage', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-chargers/update', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-chargers/view', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-items/*', 2, NULL, NULL, NULL, 1564329144, 1564329144);
INSERT INTO `auth_item` VALUES ('/bill-items/create', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-items/delete', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-items/delete-files', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-items/deletes', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-items/index', 2, NULL, NULL, NULL, 1565680342, 1565680342);
INSERT INTO `auth_item` VALUES ('/bill-items/preview-image', 2, NULL, NULL, NULL, 1564329816, 1564329816);
INSERT INTO `auth_item` VALUES ('/bill-items/update', 2, NULL, NULL, NULL, 1565680399, 1565680399);
INSERT INTO `auth_item` VALUES ('/bill-items/update-shipping', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-items/upload-files', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-items/view', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-packagers/*', 2, NULL, NULL, NULL, 1564329144, 1564329144);
INSERT INTO `auth_item` VALUES ('/bill-packagers/create', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-packagers/delete', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-packagers/deletes', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-packagers/index', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-packagers/manage', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-packagers/update', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-packagers/view', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-rc/*', 2, NULL, NULL, NULL, 1579601713, 1579601713);
INSERT INTO `auth_item` VALUES ('/bill-shippings/*', 2, NULL, NULL, NULL, 1564329144, 1564329144);
INSERT INTO `auth_item` VALUES ('/bill-shippings/create', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-shippings/delete', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-shippings/deletes', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-shippings/index', 2, NULL, NULL, NULL, 1565681757, 1565681757);
INSERT INTO `auth_item` VALUES ('/bill-shippings/manage', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-shippings/update', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-shippings/view', 2, NULL, NULL, NULL, 1565683012, 1565683012);
INSERT INTO `auth_item` VALUES ('/bill-shop/*', 2, NULL, NULL, NULL, 1564329144, 1564329144);
INSERT INTO `auth_item` VALUES ('/bill-shop/create', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-shop/delete', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-shop/deletes', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-shop/index', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-shop/update', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-shop/view', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-status-charge/*', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-status-charge/create', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-status-charge/delete', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-status-charge/deletes', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-status-charge/index', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-status-charge/update', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-status-charge/view', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-status-shipping/*', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-status-shipping/create', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-status-shipping/delete', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-status-shipping/deletes', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-status-shipping/index', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-status-shipping/update', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-status-shipping/view', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-status/*', 2, NULL, NULL, NULL, 1564329144, 1564329144);
INSERT INTO `auth_item` VALUES ('/bill-status/create', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-status/delete', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-status/deletes', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-status/index', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-status/update', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-status/view', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-type/*', 2, NULL, NULL, NULL, 1564329144, 1564329144);
INSERT INTO `auth_item` VALUES ('/bill-type/create', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-type/delete', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-type/deletes', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-type/index', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-type/update', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/bill-type/view', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/core/*', 2, NULL, NULL, NULL, 1535699352, 1535699352);
INSERT INTO `auth_item` VALUES ('/customer-shipping/*', 2, NULL, NULL, NULL, 1580814316, 1580814316);
INSERT INTO `auth_item` VALUES ('/customer/*', 2, NULL, NULL, NULL, 1567740820, 1567740820);
INSERT INTO `auth_item` VALUES ('/debug/*', 2, NULL, NULL, NULL, 1562222244, 1562222244);
INSERT INTO `auth_item` VALUES ('/gii/*', 2, NULL, NULL, NULL, 1535706951, 1535706951);
INSERT INTO `auth_item` VALUES ('/gridview/*', 2, NULL, NULL, NULL, 1578947786, 1578947786);
INSERT INTO `auth_item` VALUES ('/groups/*', 2, NULL, NULL, NULL, 1568134828, 1568134828);
INSERT INTO `auth_item` VALUES ('/groups/index', 2, NULL, NULL, NULL, 1568134817, 1568134817);
INSERT INTO `auth_item` VALUES ('/informations/*', 2, NULL, NULL, NULL, 1562299552, 1562299552);
INSERT INTO `auth_item` VALUES ('/options/*', 2, NULL, NULL, NULL, 1562243863, 1562243863);
INSERT INTO `auth_item` VALUES ('/product-list/*', 2, NULL, NULL, NULL, 1564330134, 1564330134);
INSERT INTO `auth_item` VALUES ('/product-list/add-driver', 2, NULL, NULL, NULL, 1565682829, 1565682829);
INSERT INTO `auth_item` VALUES ('/product-list/cal-percent', 2, NULL, NULL, NULL, 1565682829, 1565682829);
INSERT INTO `auth_item` VALUES ('/product-list/delete', 2, NULL, NULL, NULL, 1565682829, 1565682829);
INSERT INTO `auth_item` VALUES ('/product-list/index', 2, NULL, NULL, NULL, 1565681266, 1565681266);
INSERT INTO `auth_item` VALUES ('/product-list/init-preview-user-shipping', 2, NULL, NULL, NULL, 1565682747, 1565682747);
INSERT INTO `auth_item` VALUES ('/remarks/*', 2, NULL, NULL, NULL, 1578838027, 1578838027);
INSERT INTO `auth_item` VALUES ('/report/*', 2, NULL, NULL, NULL, 1569587404, 1569587404);
INSERT INTO `auth_item` VALUES ('/select2/bill-shop', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/select2/bill-type', 2, NULL, NULL, NULL, 1565683013, 1565683013);
INSERT INTO `auth_item` VALUES ('/sell-shipping/*', 2, NULL, NULL, NULL, 1564330822, 1564330822);
INSERT INTO `auth_item` VALUES ('/site/*', 2, NULL, NULL, NULL, 1562245386, 1562245386);
INSERT INTO `auth_item` VALUES ('/site/test', 2, NULL, NULL, NULL, 1566480624, 1566480624);
INSERT INTO `auth_item` VALUES ('/skin/*', 2, NULL, NULL, NULL, 1563731318, 1563731318);
INSERT INTO `auth_item` VALUES ('/storages/*', 2, NULL, NULL, NULL, 1569585765, 1569585765);
INSERT INTO `auth_item` VALUES ('/text-editor/*', 2, NULL, NULL, NULL, 1563780854, 1563780854);
INSERT INTO `auth_item` VALUES ('/treasurys/*', 2, NULL, NULL, NULL, 1569585810, 1569585810);
INSERT INTO `auth_item` VALUES ('/user-percent/*', 2, NULL, NULL, NULL, 1564330165, 1564330165);
INSERT INTO `auth_item` VALUES ('/user-percent/create', 2, NULL, NULL, NULL, 1565684008, 1565684008);
INSERT INTO `auth_item` VALUES ('/user-percent/delete', 2, NULL, NULL, NULL, 1565684009, 1565684009);
INSERT INTO `auth_item` VALUES ('/user-percent/deletes', 2, NULL, NULL, NULL, 1565684009, 1565684009);
INSERT INTO `auth_item` VALUES ('/user-percent/index', 2, NULL, NULL, NULL, 1565684008, 1565684008);
INSERT INTO `auth_item` VALUES ('/user-percent/update', 2, NULL, NULL, NULL, 1565684009, 1565684009);
INSERT INTO `auth_item` VALUES ('/user-percent/view', 2, NULL, NULL, NULL, 1565684008, 1565684008);
INSERT INTO `auth_item` VALUES ('/user/*', 2, NULL, NULL, NULL, 1535697098, 1535697098);
INSERT INTO `auth_item` VALUES ('/user/registration/register', 2, NULL, NULL, NULL, 1562221007, 1562221007);
INSERT INTO `auth_item` VALUES ('/user/security/logout', 2, NULL, NULL, NULL, 1562227469, 1562227469);
INSERT INTO `auth_item` VALUES ('/user/settings/account', 2, NULL, NULL, NULL, 1562226761, 1562226761);
INSERT INTO `auth_item` VALUES ('/user/settings/profile', 2, NULL, NULL, NULL, 1562226734, 1562226734);
INSERT INTO `auth_item` VALUES ('admin', 1, 'Admin', NULL, NULL, 1535696302, 1535696302);
INSERT INTO `auth_item` VALUES ('ApprovedBill', 1, 'ยืนยัน Bill', NULL, NULL, 1568129161, 1568129161);
INSERT INTO `auth_item` VALUES ('billmanager', 1, 'billmanager', NULL, NULL, 1564328691, 1564328691);
INSERT INTO `auth_item` VALUES ('chargers', 1, 'chargers', NULL, NULL, 1564328713, 1564328713);
INSERT INTO `auth_item` VALUES ('delete_bill_image', 1, 'Delete Bill Image', NULL, NULL, 1565624577, 1565624577);
INSERT INTO `auth_item` VALUES ('edit_about', 1, 'แก้ไขหน้าเกี่ยวกับเรา', NULL, NULL, 1563780984, 1563781037);
INSERT INTO `auth_item` VALUES ('edit_contact', 1, 'แก้ไขหน้าติดต่อเรา', NULL, NULL, 1563781003, 1563781049);
INSERT INTO `auth_item` VALUES ('edit_home', 1, 'แก้ไขหน้าหลัก', NULL, NULL, 1563780961, 1563781059);
INSERT INTO `auth_item` VALUES ('manage_customer', 1, 'จัดการพนักงานขับรถ', NULL, NULL, 1567740846, 1567740846);
INSERT INTO `auth_item` VALUES ('manage_information', 1, 'จัดการข่าวประชาสัมพันธ์', NULL, NULL, 1563781024, 1563781024);
INSERT INTO `auth_item` VALUES ('manage_user_percent', 1, 'จัดการเพิ่มคนขับได้', NULL, NULL, 1565683949, 1565683949);
INSERT INTO `auth_item` VALUES ('packager', 1, 'packager', NULL, NULL, 1564328699, 1564328699);
INSERT INTO `auth_item` VALUES ('preview_bill', 1, 'ดูบิล', NULL, NULL, 1565680327, 1565680327);
INSERT INTO `auth_item` VALUES ('preview_bill_charg', 1, 'แสดงรายการเรียกเก็บเงิน', NULL, NULL, 1565683592, 1565683592);
INSERT INTO `auth_item` VALUES ('preview_bill_shipping', 1, 'แสดงรายการขนส่งบิล', NULL, NULL, 1565681793, 1565681793);
INSERT INTO `auth_item` VALUES ('preview_product', 1, 'แสดงรายการสินค้า', NULL, NULL, 1565681262, 1565681262);
INSERT INTO `auth_item` VALUES ('preview_user_percent', 1, 'แสดงรายชื่อคนขับรถและลูกน้อง', NULL, NULL, 1565684370, 1565684370);
INSERT INTO `auth_item` VALUES ('previewBill', 1, 'ดูบิล', NULL, NULL, 1568091489, 1568091489);
INSERT INTO `auth_item` VALUES ('report', 1, 'ดูรายงาน', NULL, NULL, 1573117568, 1573117568);
INSERT INTO `auth_item` VALUES ('sale', 1, 'พนักงานขาย คีย์บิลได้ แต่ยืนยังไม่ได้ทั้งหมด', NULL, NULL, 1566570389, 1566570462);
INSERT INTO `auth_item` VALUES ('sell_shipping', 1, 'sell-shipping', NULL, NULL, 1564330813, 1564330813);
INSERT INTO `auth_item` VALUES ('shipping', 1, 'shipping', NULL, NULL, 1564328707, 1564328707);
INSERT INTO `auth_item` VALUES ('user', 1, 'User', NULL, NULL, 1535696315, 1535696315);
COMMIT;

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`) USING BTREE,
  KEY `child` (`child`) USING BTREE,
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
BEGIN;
INSERT INTO `auth_item_child` VALUES ('admin', '/admin/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/affective-score/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/bill-items/preview-image');
INSERT INTO `auth_item_child` VALUES ('admin', '/bill-rc/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/core/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/customer-shipping/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/debug/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/gii/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/gridview/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/groups/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/options/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/product-list/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/report/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/site/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/site/test');
INSERT INTO `auth_item_child` VALUES ('admin', '/skin/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/storages/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/text-editor/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/treasurys/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/user-percent/*');
INSERT INTO `auth_item_child` VALUES ('admin', '/user/*');
INSERT INTO `auth_item_child` VALUES ('admin', 'billmanager');
INSERT INTO `auth_item_child` VALUES ('admin', 'chargers');
INSERT INTO `auth_item_child` VALUES ('admin', 'delete_bill_image');
INSERT INTO `auth_item_child` VALUES ('admin', 'edit_about');
INSERT INTO `auth_item_child` VALUES ('admin', 'edit_contact');
INSERT INTO `auth_item_child` VALUES ('admin', 'edit_home');
INSERT INTO `auth_item_child` VALUES ('admin', 'manage_customer');
INSERT INTO `auth_item_child` VALUES ('admin', 'manage_information');
INSERT INTO `auth_item_child` VALUES ('admin', 'manage_user_percent');
INSERT INTO `auth_item_child` VALUES ('admin', 'packager');
INSERT INTO `auth_item_child` VALUES ('admin', 'preview_bill');
INSERT INTO `auth_item_child` VALUES ('admin', 'preview_bill_charg');
INSERT INTO `auth_item_child` VALUES ('admin', 'preview_bill_shipping');
INSERT INTO `auth_item_child` VALUES ('admin', 'preview_product');
INSERT INTO `auth_item_child` VALUES ('admin', 'preview_user_percent');
INSERT INTO `auth_item_child` VALUES ('admin', 'previewBill');
INSERT INTO `auth_item_child` VALUES ('admin', 'sell_shipping');
INSERT INTO `auth_item_child` VALUES ('admin', 'shipping');
INSERT INTO `auth_item_child` VALUES ('admin', 'user');
INSERT INTO `auth_item_child` VALUES ('billmanager', '/bill-items/*');
INSERT INTO `auth_item_child` VALUES ('billmanager', '/bill-items/preview-image');
INSERT INTO `auth_item_child` VALUES ('billmanager', '/bill-type/*');
INSERT INTO `auth_item_child` VALUES ('chargers', '/bill-chargers/*');
INSERT INTO `auth_item_child` VALUES ('manage_customer', '/customer/*');
INSERT INTO `auth_item_child` VALUES ('manage_user_percent', '/user-percent/*');
INSERT INTO `auth_item_child` VALUES ('packager', '/bill-packagers/*');
INSERT INTO `auth_item_child` VALUES ('preview_bill', '/bill-items/index');
INSERT INTO `auth_item_child` VALUES ('preview_bill', '/bill-items/preview-image');
INSERT INTO `auth_item_child` VALUES ('preview_bill', '/bill-items/update');
INSERT INTO `auth_item_child` VALUES ('preview_bill_charg', '/bill-chargers/index');
INSERT INTO `auth_item_child` VALUES ('preview_bill_charg', '/bill-chargers/manage');
INSERT INTO `auth_item_child` VALUES ('preview_bill_shipping', '/bill-shippings/index');
INSERT INTO `auth_item_child` VALUES ('preview_bill_shipping', '/bill-shippings/manage');
INSERT INTO `auth_item_child` VALUES ('preview_product', '/product-list/*');
INSERT INTO `auth_item_child` VALUES ('preview_product', '/product-list/add-driver');
INSERT INTO `auth_item_child` VALUES ('preview_product', '/product-list/cal-percent');
INSERT INTO `auth_item_child` VALUES ('preview_product', '/product-list/delete');
INSERT INTO `auth_item_child` VALUES ('preview_product', '/product-list/index');
INSERT INTO `auth_item_child` VALUES ('preview_product', '/product-list/init-preview-user-shipping');
INSERT INTO `auth_item_child` VALUES ('preview_user_percent', '/user-percent/index');
INSERT INTO `auth_item_child` VALUES ('preview_user_percent', '/user-percent/view');
INSERT INTO `auth_item_child` VALUES ('previewBill', '/bill-items/index');
INSERT INTO `auth_item_child` VALUES ('previewBill', '/bill-items/preview-image');
INSERT INTO `auth_item_child` VALUES ('previewBill', '/bill-items/view');
INSERT INTO `auth_item_child` VALUES ('sale', 'billmanager');
INSERT INTO `auth_item_child` VALUES ('sale', 'preview_bill');
INSERT INTO `auth_item_child` VALUES ('sale', 'preview_bill_charg');
INSERT INTO `auth_item_child` VALUES ('sale', 'preview_bill_shipping');
INSERT INTO `auth_item_child` VALUES ('sale', 'preview_product');
INSERT INTO `auth_item_child` VALUES ('sale', 'preview_user_percent');
INSERT INTO `auth_item_child` VALUES ('sale', 'user');
INSERT INTO `auth_item_child` VALUES ('sell_shipping', '/sell-shipping/*');
INSERT INTO `auth_item_child` VALUES ('shipping', '/bill-shippings/*');
INSERT INTO `auth_item_child` VALUES ('user', '/api2/*');
INSERT INTO `auth_item_child` VALUES ('user', '/bill-packagers/manage');
INSERT INTO `auth_item_child` VALUES ('user', '/informations/*');
INSERT INTO `auth_item_child` VALUES ('user', '/remarks/*');
INSERT INTO `auth_item_child` VALUES ('user', '/site/*');
INSERT INTO `auth_item_child` VALUES ('user', '/user/security/logout');
INSERT INTO `auth_item_child` VALUES ('user', '/user/settings/account');
INSERT INTO `auth_item_child` VALUES ('user', '/user/settings/profile');
INSERT INTO `auth_item_child` VALUES ('user', 'preview_bill');
INSERT INTO `auth_item_child` VALUES ('user', 'preview_bill_charg');
INSERT INTO `auth_item_child` VALUES ('user', 'preview_bill_shipping');
INSERT INTO `auth_item_child` VALUES ('user', 'preview_product');
INSERT INTO `auth_item_child` VALUES ('user', 'preview_user_percent');
COMMIT;

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for core_options
-- ----------------------------
DROP TABLE IF EXISTS `core_options`;
CREATE TABLE `core_options` (
  `option_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `option_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option_value` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`option_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of core_options
-- ----------------------------
BEGIN;
INSERT INTO `core_options` VALUES ('backend_url', 'Backend Url', 'backend.dconhub.com');
INSERT INTO `core_options` VALUES ('brand_file_type', 'File Upload Brand', '[\"jpg\",\"jpeg\",\"png\",\"gif\"]');
INSERT INTO `core_options` VALUES ('brand_types', 'DropDown Brand', '{ \"1\": \"หมวดหมู่หลัก\", \"2\": \"หมวดหมู่ย่อย\"}');
INSERT INTO `core_options` VALUES ('category_types', 'DropDown Brand', '{ \"1\": \"หมวดสินค้าหลัก\", \"2\": \"หมวดสินค้าย่อย\"}');
INSERT INTO `core_options` VALUES ('cn_brand', 'แบรนด์บริษัท', 'บจก. ดํารงค์พานิช คอนสตรัคชั่น');
INSERT INTO `core_options` VALUES ('cn_brand_address', 'ที่อยู่บริษัท', '92 หมู่ที่ 21 ต.หัวขวาง อ.โกสุมพิสัย จ.มหาสารคาม');
INSERT INTO `core_options` VALUES ('cn_brand_address2', 'เบอร์โทรศัพท์', '043761599');
INSERT INTO `core_options` VALUES ('cn_condition', 'เงื่อนไขการสั่งซื้อ', 'ราคาวัสดุ เป็นราคารับหน้าโรงงาน ยังไม่รวมค่าขนส่ง\r\nกรณีเงื่อนไขส่งฟรี เมื่อดำเนินการกรอกที่อยู่จัดส่งแล้ว ทางเจ้าหน้าที่จะติดต่อกลับไปเพื่อแก้ไขราคาค่าขนส่งให้\r\nค่าขนส่งที่ระบบคำนวณอัตโนมัติให้หลังการใส่ที่อยู่ เป็นเพียงการประมาณการเท่านั้น ทางบริษัทขอสงวนสิทธิ์เปลี่ยนแปลงโดยไม่แจ้งให้ทราบล่วงหน้า');
INSERT INTO `core_options` VALUES ('doc_logo', 'Logo ในเอกสาร', 'https://bn1305files.storage.live.com/y4mvIe7_8afjHcCPf92XY_ODuQyQIaWa7gwItZHjNssnJZmDHTZPkjOnevua_1-qNw9FscoPXhNaWZAv4_xvHmTHIIxa4WugMKDIKzbL33loI7prfRlW9lfh-snk7On8wAnprjG1DE35fZh84TrQ33FwCd4indq55Viz49R-xh5wnAQxxJ7nDcydDEPuKqJfFByJBlbtyX-6L22bnUdwcdb6A/IMG_0199.JPG?psid=1&width=2016&height=1309');
INSERT INTO `core_options` VALUES ('how_to_pay', 'วิธีการสั่งซื้อ', '<h1>ตัวอย่างวิธีการสั่งซื้อ</h1><h2><img alt=\"\" src=\"https://storage.dconhub.com/images/5c49d10bd366c.png\" class=\"fr-fic fr-dii\" data-id=\"5c49d10bd366c.png\"><img alt=\"\" src=\"https://storage.dconhub.com/images/5c49d10e0cb8e.png\" class=\"fr-fic fr-dii\" data-id=\"5c49d10e0cb8e.png\"><img alt=\"\" src=\"https://storage.dconhub.com/images/5c49d10cb7b4e.png\" class=\"fr-fic fr-dii\" data-id=\"5c49d10cb7b4e.png\"><img alt=\"\" src=\"https://storage.dconhub.com/images/5c49d10b01855.png\" class=\"fr-fic fr-dii\" data-id=\"5c49d10b01855.png\"></h2><h2>วิธีการสั่งซื้อสินค้า</h2><p>ขั้นตอนการทำรายการสั่งซื้อ<br>ติดต่อสอบถามเพิ่มเติม กรุณาติดต่อ customer service center โทร&nbsp;<strong>02-308-4666</strong> หรือ&nbsp;<a href=\"mailto:ccare@cmart.co.th\" title=\"\">ccare@cmart.co.th</a></p><h3>1. เลือกสินค้าของคุณ</h3><p>คุณสามารถเลือกสินค้าที่คุณต้องการสั่งซื้อโดยการคลิกที่ปุ่ม&nbsp;<strong>&ldquo;หยิบใส่ตะกร้า&rdquo;</strong> หรือ หากคุณต้องการเลือกสินค้าเก็บไว้และชำระเงินภายหลัง ให้คลิกที่ปุ่ม &ldquo;เพิ่มรายการที่ชอบ&rdquo; ซึ่ง ณ ที่นี้ คุณต้องทำการเข้าสู่ระบบก่อน เพื่อที่ระบบจะได้บันทึกสินค้าไว้ใน &ldquo;สินค้าที่สนใจ&rdquo;</p><h3>2. ตรวจสอบหรือแก้ไขรายการสินค้า</h3><p>คุณสามารถทำการตรวจสอบหรือแก้ไขรายการสินค้าที่คุณต้องการสั่งซื้อได้ในหน้า&nbsp;<strong>&ldquo;ตะกร้าของฉัน&quot;</strong> หลังจากนั้นคลิกที่ปุ่ม &ldquo;สั่งซื้อสินค้า&rdquo; เพื่อดำเนินการ การสั่งซื้อสินค้า</p><h3>3. เลือกทำรายการสั่งซื้อสินค้า</h3><p>คุณสามารถเลือกได้ดังนี้<br><br><strong>ทำรายการโดยไม่เป็นสมาชิก:</strong> กรอกข้อมูลการเรียกเก็บเงิน และข้อมูลการจัดส่งสินค้าของคุณ โดยไม่ได้เป็นสมาชิกของ&nbsp;<a href=\"https://www.cmart.co.th/\" title=\"\"><strong>cmart.co.th</strong></a><br><br><strong>ลูกค้าใหม่:</strong> สำหรับการสั่งซื้อครั้งแรก เพียงกรอกข้อมูลการเรียกชำระเงิน และข้อมูลการจัดส่งสินค้าของคุณ โดยเป็นสมาชิกกับ&nbsp;<a href=\"https://www.cmart.co.th/\" title=\"\"><strong>cmart.co.th</strong></a> เพื่อให้ง่ายต่อการสั่งซื้อครั้งต่อไป และสะดวกต่อการติดตามการสั่งซื้อ นอกจากนี้ คุณยังสามารถสั่งซื้อสินค้าโดยเข้าสู่ระบบผ่านทางบัญชี Facebook ของคุณได้ง่ายๆ ทั้งนี้จะได้รับจดหมายข่าวสารและโปรโมชั่นที่ดีที่สุดที่เรามอบให้<br><br><strong>ลูกค้าเก่า:</strong> สำหรับลูกค้าที่เป็นสมาชิกกับ CMART ทำรายการสั่งซื้อผ่านระบบได้ง่ายๆ เพียงแค่เข้าสู่ระบบ โดยกรอกอีเมลและรหัสผ่าน และทำรายการสั่งซื้อโดยไม่ต้องกรอกข้อมูลอื่นๆเพิ่มเติม<br><br></p><h3>4. เลือกวิธีการจัดส่งสินค้า</h3><p>CMART มีตัวเลือกในการจัดส่ง 2 แบบ คือ ส่งแบบด่วน (<strong>Express</strong>) และ ส่งแบบธรรมดา (<strong>Standard</strong>) สำหรับแต่ละวิธีการจัดส่ง จะมีการคำนวณระยะทาง และน้ำหนักของสินค้า จากการยืนยันการสั่งซื้อของคุณ (คุณสามารถอ่านรายละเอียดเพิ่มเติมได้ที่หน้า&nbsp;<a href=\"https://www.cmart.co.th/shipping-policy\">&ldquo;วิธีการจัดส่งสินค้า&rdquo;</a>)</p><h3>5. เลือกวิธีการชำระเงิน</h3><p>คุณสามารถเลือกวิธีการชำระเงินได้หลากหลายวิธี เช่น เก็บเงินปลายทาง บัตรเครดิต/บัตรเดบิต ผ่านทางเคาน์เตอร์เซอร์วิส หรือผ่านทางระบบออนไลน์ ซึ่งมีบริษัท 2C2P เป็น<br>ผู้ดูแลระบบรักษาความปลอดภัย (คุณสามารถอ่านรายละเอียดเพิ่มเติมได้ที่หน้า&nbsp;<a href=\"https://www.cmart.co.th/payment-method\">&ldquo;ช่องทางการชำระเงิน&rdquo;</a>)<br>หากคุณมีรหัสคูปองส่วนลด คุณสามารถนำรหัสส่วนลดระบุในช่อง&nbsp;<strong>&ldquo;ใส่รหัสส่วนลด ถ้ามี&rdquo;</strong> และคลิก&nbsp;<strong>&ldquo;ใช้ส่วนลด&rdquo;<br></strong>และเมื่อคุณพร้อมทำการชำระเงินและสั่งซื้อสินค้า ให้คลิกที่ปุ่ม&nbsp;<strong>&ldquo;ซื้อสินค้า&rdquo;</strong></p><p>&nbsp;</p><h3>6. ยืนยันคำสั่งซื้อสินค้าทางอีเมล</h3><p>เมื่อคุณได้ทำรายการสั่งซื้อสินค้าเรียบร้อยแล้ว<br>คุณจะได้รับอีเมลเพื่อยืนยันคำสั่งซื้อสินค้าของคุณ วิธีการชำระเงินแบบ เรียกเก็บเงินปลายทาง ชำระเงินที่จุดรับสินค้า (Cash on Pick up Point)<br>กรุณาคลิกที่ &ldquo;ลิงค์ยืนยันคำสั่งซื้อ&rdquo; ตามลิงค์ที่แนบมาในอีเมลดังกล่าว<br>ภายใน 24 ชม. หากคุณไม่ดำเนินการ ภายในเวลาที่กำหนด<br>คำสั่งซื้อของคุณ จะถูกยกเลิกโดยอัตโนมัติ&nbsp;</p>');
INSERT INTO `core_options` VALUES ('logo', 'Logo', 'https://storage.dconhub.com/images/dconhub.png');
INSERT INTO `core_options` VALUES ('logo_text', 'Logo Text', 'https://storage.dconhub.com/images/logo_bg.JPG');
INSERT INTO `core_options` VALUES ('order_text_start', ' รหัสตัวหนังสือของใบเสนอราคา', 'QT');
INSERT INTO `core_options` VALUES ('order_txt', 'Order Text', 'BS');
INSERT INTO `core_options` VALUES ('page_about', 'About', '<p>เกี่ยวกับเรา นกน้อยทำรังแต่พอตัว</p><table style=\"width: 100%;\"><tbody><tr><td style=\"width: 50.0000%;\"><div style=\"text-align: center;\"><img src=\"https://storage.dconhub.com/images/5c2f5300dfbbe.jpg\" style=\"width: 300px;\" class=\"fr-fic fr-dib\" data-id=\"5c2f5300dfbbe.jpg\"></div></td><td style=\"width: 50.0000%;\"><span class=\"fr-video fr-fvc fr-dvb fr-draggable\" contenteditable=\"false\" draggable=\"true\"><iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/-vqdW4IMTnE\" frameborder=\"0\" allowfullscreen=\"\" class=\"fr-draggable\"></iframe></span></td></tr></tbody></table><p>เราขาย <a href=\"http://www.shera.com/\" rel=\"noopener noreferrer\" target=\"_blank\">เฌอร่า</a> และ</p><p><br></p><p><span class=\"fr-emoticon fr-deletable fr-emoticon-img\" style=\"background: url(https://cdnjs.cloudflare.com/ajax/libs/emojione/2.0.1/assets/svg/1f623.svg);\">&nbsp;</span>&nbsp;</p><p><img src=\"https://storage.dconhub.com/images/5c2f54745480c.gif\" style=\"width: 300px;\" class=\"fr-fic fr-fil fr-rounded fr-dii\" data-id=\"5c2f54745480c.gif\">refd</p><p>sdsadsadsadsadsadsadsad</p><p>sadsadsadsadsadsadsadsadsa</p><p>sadsadsadsadsasdsadsadasdasd</p><p>refd</p><p>sdsadsadsadsadsadsadsad</p><p>sadsadsadsadsadsadsadsadsa</p><p>sadsadsadsadsasdsadsadasdasd</p><p>refd</p><p>sdsadsadsadsadsadsadsad</p><p>sadsadsadsadsadsadsadsadsa</p><p>sadsadsadsadsasdsadsadasdasd</p><p>refd</p><p>sdsadsadsadsadsadsadsad</p><p>sadsadsadsadsadsadsadsadsa</p><p>sadsadsadsadsasdsadsadasdasd</p><p><span class=\"fr-video fr-fvc fr-dvb fr-draggable\" contenteditable=\"false\" draggable=\"true\"><iframe width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/-vqdW4IMTnE?wmode=opaque\" frameborder=\"0\" allowfullscreen=\"\" class=\"fr-draggable\"></iframe></span>&nbsp;</p>');
INSERT INTO `core_options` VALUES ('page_contact', 'Contact', '<p>ติดต่อเรา เราคือใครเอ๋ย ให้ทาย</p><h3><span class=\"fr-video fr-fvc fr-dvb fr-draggable\" contenteditable=\"false\" draggable=\"true\">\r\n');
COMMIT;

-- ----------------------------
-- Table structure for file_storage_item
-- ----------------------------
DROP TABLE IF EXISTS `file_storage_item`;
CREATE TABLE `file_storage_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `base_url` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_ip` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of file_storage_item
-- ----------------------------
BEGIN;
INSERT INTO `file_storage_item` VALUES (106, 'fileStorage', 'http://shop.local/source', '1/HfSgZ0jHjBR0T5af6q5XkXKWyeyEuz7O.png', 'image/png', 3556, 'HfSgZ0jHjBR0T5af6q5XkXKWyeyEuz7O', '::1', 1535699641);
INSERT INTO `file_storage_item` VALUES (107, 'fileStorage', 'http://storage.shop.local/source', '1/OuRcwvxrOLzLzvWR5QBNn6No1vd-2yf5.png', 'image/png', 4679, 'OuRcwvxrOLzLzvWR5QBNn6No1vd-2yf5', '::1', 1535700807);
INSERT INTO `file_storage_item` VALUES (110, 'fileStorage', 'http://storage.exomethai.local/source', '1/FxbtooSVWmIcxSAvrkcYtZACnNSDvlk1.jpg', 'image/jpeg', 210392, 'FxbtooSVWmIcxSAvrkcYtZACnNSDvlk1', '::1', 1562218782);
INSERT INTO `file_storage_item` VALUES (112, 'fileStorage', 'http://storage.exomethai.local/source', '1/8lHe0DJg_oKoIiMUdS06fwasOkLe2lGx.jpg', 'image/jpeg', 223823, '8lHe0DJg_oKoIiMUdS06fwasOkLe2lGx', '::1', 1562230810);
INSERT INTO `file_storage_item` VALUES (113, 'fileStorage', 'http://storage.exomethai.local/source', '1/uCfEs_a84t96Ot6OqYGKGGhHo-ZQAixe.jpg', 'image/jpeg', 176544, 'uCfEs_a84t96Ot6OqYGKGGhHo-ZQAixe', '::1', 1563730622);
INSERT INTO `file_storage_item` VALUES (116, 'fileStorage', 'http://storage.exom.local/source', '1/H3dJrb4HKUeW0QiLrQovDNVg5mRaaUxs.jpg', 'image/jpeg', 63433, 'H3dJrb4HKUeW0QiLrQovDNVg5mRaaUxs', '::1', 1563779072);
INSERT INTO `file_storage_item` VALUES (117, 'fileStorage', 'http://storage.chanpan.local/source', '1/Uc6lM4KiyieX8JGp47yVSxAfHJREKiUV.jpg', 'image/jpeg', 45379, 'Uc6lM4KiyieX8JGp47yVSxAfHJREKiUV', '::1', 1563779324);
INSERT INTO `file_storage_item` VALUES (118, 'fileStorage', 'http://storage.billing.local/source', '1/OZ09pNqZeh-iQsz3xrbldt1Yv41iv9XW.jpg', 'image/jpeg', 45379, 'OZ09pNqZeh-iQsz3xrbldt1Yv41iv9XW', '::1', 1566396185);
INSERT INTO `file_storage_item` VALUES (119, 'fileStorage', 'https://billstorage.dconhub.com/source', '1/PaeMTvTPUc1EYYME_yt9OqHyRlgvyueA.png', 'image/png', 21002, 'PaeMTvTPUc1EYYME_yt9OqHyRlgvyueA', '14.207.201.179', 1566570083);
INSERT INTO `file_storage_item` VALUES (120, 'fileStorage', 'https://billstorage.dconhub.com/source', '1/sphbPk-EW60bOFz4I9EFDt0J7piCRrdJ.jpg', 'image/jpeg', 119183, 'sphbPk-EW60bOFz4I9EFDt0J7piCRrdJ', '223.206.243.251', 1569055365);
INSERT INTO `file_storage_item` VALUES (122, 'fileStorage', 'https://billstorage.dconhub.com/source', '1/nhKryJaDTJVI08h3IqsYVJjLKfqvZZA6.jpg', 'image/jpeg', 178065, 'nhKryJaDTJVI08h3IqsYVJjLKfqvZZA6', '14.207.200.213', 1569587914);
INSERT INTO `file_storage_item` VALUES (123, 'fileStorage', 'https://billstorage.dconhub.com/source', '1/RyuX9YuEi6riuitVRaw1WzOi-WQdhJtV.jpg', 'image/jpeg', 158503, 'RyuX9YuEi6riuitVRaw1WzOi-WQdhJtV', '14.207.200.213', 1569588112);
INSERT INTO `file_storage_item` VALUES (124, 'fileStorage', 'https://billstorage.dconhub.com/source', '1/U2efIBuMJSBdUnxuXO0haLJJ61mTLazf.jpg', 'image/jpeg', 153409, 'U2efIBuMJSBdUnxuXO0haLJJ61mTLazf', '14.207.200.213', 1569588122);
INSERT INTO `file_storage_item` VALUES (125, 'fileStorage', 'https://billstorage.dconhub.com/source', '1/_x9cfASeb4q-WgC9d8R_-9MErBCHfMgL.jpg', 'image/jpeg', 205277, '_x9cfASeb4q-WgC9d8R_-9MErBCHfMgL', '14.207.200.213', 1569588134);
INSERT INTO `file_storage_item` VALUES (126, 'fileStorage', 'https://billstorage.dconhub.com/source', '1/RmAOHkTiBrvRSSDesUvakI6HAtWaT632.jpg', 'image/jpeg', 258312, 'RmAOHkTiBrvRSSDesUvakI6HAtWaT632', '14.207.200.213', 1569588147);
INSERT INTO `file_storage_item` VALUES (127, 'fileStorage', 'https://billstorage.dconhub.com/source', '1/ER8EOc62PE3rLWuKRVnISqUljXCV9NtM.jpg', 'image/jpeg', 275252, 'ER8EOc62PE3rLWuKRVnISqUljXCV9NtM', '14.207.200.213', 1569588160);
INSERT INTO `file_storage_item` VALUES (128, 'fileStorage', 'https://billstorage.dconhub.com/source', '1/reNxoP7vxy9OWzxcmRtTa0lGHImAUjSp.jpg', 'image/jpeg', 205986, 'reNxoP7vxy9OWzxcmRtTa0lGHImAUjSp', '14.207.200.213', 1569588171);
INSERT INTO `file_storage_item` VALUES (129, 'fileStorage', 'https://billstorage.dconhub.com/source', '1/ABjlmekUPI3hfttq0Cp4a5lLAaa-PedZ.jpg', 'image/jpeg', 216375, 'ABjlmekUPI3hfttq0Cp4a5lLAaa-PedZ', '14.207.200.213', 1569588184);
INSERT INTO `file_storage_item` VALUES (130, 'fileStorage', 'https://billstorage.dconhub.com/source', '1/XkWpS9-IcNKS4DM_EBjdmjGPD6L4dmX7.jpg', 'image/jpeg', 576127, 'XkWpS9-IcNKS4DM_EBjdmjGPD6L4dmX7', '223.206.231.199', 1579416879);
COMMIT;

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` bigint(20) DEFAULT NULL COMMENT 'รหัสบิล',
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ชื่อไฟล์',
  `filepath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ที่อยู่ไฟล์',
  `create_at` bigint(20) DEFAULT NULL COMMENT 'สร้างโดย',
  `create_date` datetime DEFAULT NULL COMMENT 'สร้างเมื่อ',
  `update_at` bigint(20) DEFAULT NULL COMMENT 'แก้ไขโดย',
  `update_date` datetime DEFAULT NULL COMMENT 'แก้ไขเมื่อ',
  `rstat` int(1) DEFAULT NULL COMMENT 'สถานะ',
  `billtype` int(255) DEFAULT NULL COMMENT 'ประเภทบิล',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=724 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of files
-- ----------------------------
BEGIN;
INSERT INTO `files` VALUES (30, 3, '1562064045006001700.jpg', 'C:\\wamp64\\www\\bill/storage/web/uploads/', 1, '2019-07-02 17:40:45', NULL, NULL, 1, 9);
INSERT INTO `files` VALUES (31, 3, '1562064090065764800.jpg', 'C:\\wamp64\\www\\bill/storage/web/uploads/', 1, '2019-07-02 17:41:30', NULL, NULL, 1, 9);
INSERT INTO `files` VALUES (32, 1562325569075325000, '1562325589012626200.jpg', 'C:\\wamp64\\www\\bill/storage/web/uploads/', 1, '2019-07-05 18:19:49', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (33, 1562325569075325000, '1562325599091847200.jpg', 'C:\\wamp64\\www\\bill/storage/web/uploads/', 1, '2019-07-05 18:19:59', NULL, NULL, 1, 8);
INSERT INTO `files` VALUES (34, 1562325708099295800, '1562326179010657300.jpg', 'C:\\wamp64\\www\\bill/storage/web/uploads/', 1, '2019-07-05 18:29:39', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (35, 1562326264048651000, '1562326285087874100.jpg', 'C:\\wamp64\\www\\bill/storage/web/uploads/', 1, '2019-07-05 18:31:25', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (36, 1562326327073355000, '1562326350023825800.jpg', 'C:\\wamp64\\www\\bill/storage/web/uploads/', 1, '2019-07-05 18:32:30', NULL, NULL, 1, 5);
INSERT INTO `files` VALUES (37, 1562326631089417700, '1562326656027411800.jpg', 'C:\\wamp64\\www\\bill/storage/web/uploads/', 1, '2019-07-05 18:37:36', NULL, NULL, 1, 5);
INSERT INTO `files` VALUES (38, 1562326928048361300, '1562326948015404100.jpg', 'C:\\wamp64\\www\\bill/storage/web/uploads/', 1, '2019-07-05 18:42:28', NULL, NULL, 3, 10);
INSERT INTO `files` VALUES (39, 1562326928048361300, '1562327001028665700.jpg', 'C:\\wamp64\\www\\bill/storage/web/uploads/', 1, '2019-07-05 18:43:21', NULL, NULL, 3, 9);
INSERT INTO `files` VALUES (40, 1562833781078806000, '1562833800045204600.jpg', 'C:\\wamp64\\www\\bill_core/storage/web/uploads/', 1, '2019-07-11 15:30:00', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (41, 1562326928048361300, '1564330426082766500.jpg', 'C:\\wamp64\\www\\project\\chanpan_master/storage/web/uploads/', 1, '2019-07-28 23:13:46', NULL, NULL, 3, 9);
INSERT INTO `files` VALUES (42, 1562326928048361300, '1564330438085171700.jpg', 'C:\\wamp64\\www\\project\\chanpan_master/storage/web/uploads/', 1, '2019-07-28 23:13:58', NULL, NULL, 3, 9);
INSERT INTO `files` VALUES (43, 1565679570082067900, '1565679599064393700.jpg', 'C:\\wamp64\\www\\project\\billing/storage/web/uploads/', 4, '2019-08-13 13:59:59', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (44, 1565685367053545500, '1565685398014395200.jpg', 'C:\\wamp64\\www\\project\\billing/storage/web/uploads/', 4, '2019-08-13 15:36:38', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (45, 1565685367053545500, '1565685410008719000.jpg', 'C:\\wamp64\\www\\project\\billing/storage/web/uploads/', 4, '2019-08-13 15:36:50', NULL, NULL, 1, 8);
INSERT INTO `files` VALUES (46, 1565685725072338700, '1565685754008500000.jpg', 'C:\\wamp64\\www\\project\\billing/storage/web/uploads/', 4, '2019-08-13 15:42:34', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (47, 1565685725072338700, '1565685805017158800.jpg', 'C:\\wamp64\\www\\project\\billing/storage/web/uploads/', 4, '2019-08-13 15:43:25', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (48, 1565685819082194800, '1565685873073515300.jpg', 'C:\\wamp64\\www\\project\\billing/storage/web/uploads/', 4, '2019-08-13 15:44:33', NULL, NULL, 1, 9);
INSERT INTO `files` VALUES (49, 1565685819082194800, '1565685880001845700.jpg', 'C:\\wamp64\\www\\project\\billing/storage/web/uploads/', 4, '2019-08-13 15:44:40', NULL, NULL, 1, 6);
INSERT INTO `files` VALUES (50, 1565687215082914900, '1565687680063656900.jpg', 'C:\\wamp64\\www\\project\\billing/storage/web/uploads/', 1, '2019-08-13 16:14:40', NULL, NULL, 3, 10);
INSERT INTO `files` VALUES (51, 1566409678015573700, '1566409710082270500.jpg', 'C:\\wamp64\\www\\project\\billing/storage/web/uploads/', 1, '2019-08-22 00:48:30', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (52, 1565687215082914900, '1566410418053733300.jpg', 'C:\\wamp64\\www\\project\\billing/storage/web/uploads/', 1, '2019-08-22 01:00:18', NULL, NULL, 1, 5);
INSERT INTO `files` VALUES (53, 1565687215082914900, '1566410431010223000.jpg', 'C:\\wamp64\\www\\project\\billing/storage/web/uploads/', 1, '2019-08-22 01:00:31', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (54, 1565687215082914900, '1566410444053385300.jpg', 'C:\\wamp64\\www\\project\\billing/storage/web/uploads/', 1, '2019-08-22 01:00:44', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (55, 1566566907053553000, '1566567433076942600.jpg', '/var/www/billing/storage/web/uploads/', 4, '2019-08-23 20:37:13', NULL, NULL, 3, 10);
INSERT INTO `files` VALUES (56, 1566566907053553000, '1566567467090960600.jpg', '/var/www/billing/storage/web/uploads/', 4, '2019-08-23 20:37:47', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (57, 1566566907053553000, '1566567643094311300.jpg', '/var/www/billing/storage/web/uploads/', 4, '2019-08-23 20:40:43', NULL, NULL, 3, 6);
INSERT INTO `files` VALUES (58, 1566566907053553000, '1566567689015564600.jpg', '/var/www/billing/storage/web/uploads/', 4, '2019-08-23 20:41:29', NULL, NULL, 3, 6);
INSERT INTO `files` VALUES (59, 1566566907053553000, '1566567722035043300.jpeg', '/var/www/billing/storage/web/uploads/', 4, '2019-08-23 20:42:02', NULL, NULL, 1, 6);
INSERT INTO `files` VALUES (60, 1566621138079752100, '1566621552025140200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-24 11:39:12', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (61, 1566804798075469900, '1566804879067459100.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-26 14:34:39', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (62, 1566807908032211700, '1566808305010796300.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-26 15:31:45', NULL, NULL, 1, 6);
INSERT INTO `files` VALUES (63, 1566809473046626500, '1566809565089534500.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-26 15:52:45', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (64, 1566809614029264300, '1566809690070824100.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-26 15:54:50', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (65, 1566809889039902900, '1566810045071137900.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-26 16:00:45', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (66, 1566810106044018700, '1566810271034808400.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-26 16:04:31', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (67, 1566810413069530400, '1566810526051132400.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-26 16:08:46', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (68, 1566810559001024600, '1566810633042853500.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-26 16:10:33', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (69, 1566894599015256500, '1566894660007203400.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-27 15:31:00', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (70, 1566894678033921100, '1566894762060411900.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-27 15:32:42', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (71, 1566894804017482700, '1566894865041144600.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-27 15:34:25', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (72, 1566894906068099800, '1566894970007373900.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-27 15:36:10', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (73, 1566895294080239500, '1566895366091858100.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-27 15:42:46', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (74, 1566986629046367600, '1566986719024222200.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-28 17:05:19', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (75, 1566986727069472200, '1566986771007165100.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-28 17:06:11', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (76, 1566986790024270700, '1566986843048891500.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-28 17:07:23', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (77, 1566986727069472200, '1566986945036708100.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-28 17:09:05', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (78, 1566987024033970200, '1566987178091958900.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-28 17:12:58', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (79, 1567063013087541100, '1567063147035211300.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-29 14:19:07', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (80, 1567063013087541100, '1567063184015759900.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-29 14:19:44', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (81, 1567063397092790400, '1567063461086581900.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-29 14:24:21', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (82, 1567063483087687500, '1567063590040376700.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-29 14:26:30', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (83, 1567063724086367000, '1567069515035527900.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-29 16:05:15', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (84, 1567063619070458000, '1567069533074952700.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-29 16:05:33', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (85, 1566619840024039700, '1567140571075922000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 11:49:31', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (86, 1566620746025355100, '1567141101067056700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 11:58:21', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (87, 1566620746025355100, '1567141525090135200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 12:05:25', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (88, 1567155934008078900, '1567156010058405200.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:06:50', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (89, 1567156226068938700, '1567156272073740000.jpeg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:11:12', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (90, 1567157364090688700, '1567157440075027800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:30:40', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (91, 1567157527058391000, '1567157579096534400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:32:59', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (92, 1567157592099147200, '1567157636086221700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:33:56', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (93, 1567157646082750900, '1567157697019256000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:34:57', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (94, 1567157706020679000, '1567157744093081900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:35:44', NULL, NULL, 1, NULL);
INSERT INTO `files` VALUES (95, 1567157706020679000, '1567157753059798800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:35:53', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (96, 1567157706020679000, '1567157768098636700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:36:08', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (97, 1567157778055954700, '1567157823005511800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:37:03', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (98, 1567157834046825000, '1567157876082198100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:37:56', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (99, 1567157893038970000, '1567157938087276400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:38:58', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (100, 1567158020051721600, '1567158073056527700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:41:13', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (101, 1567158083098468000, '1567158132079004500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:42:12', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (102, 1567158148033288200, '1567158193051545000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:43:13', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (103, 1567158203078328900, '1567158246063646500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:44:06', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (104, 1567158319012777100, '1567158383004043200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:46:23', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (105, 1567158393064750100, '1567158444097011000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:47:24', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (106, 1567158455085087300, '1567158514019350000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:48:34', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (107, 1567158522074997200, '1567158649006386900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:50:49', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (108, 1567158680046000300, '1567158749001985400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:52:29', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (109, 1567158680046000300, '1567158749083230300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:52:29', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (110, 1567158794064539900, '1567158848043609400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:54:08', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (111, 1567158858033486900, '1567158913055564700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:55:13', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (112, 1567158858033486900, '1567158950072545000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:55:50', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (113, 1567158964013119100, '1567159011049485400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:56:51', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (114, 1567159020058613200, '1567159064090506700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 16:57:44', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (115, 1567159164069746600, '1567159215021576500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 17:00:15', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (116, 1567159224061116300, '1567159282067885300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 17:01:22', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (117, 1567159385035206800, '1567159437050585200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 17:03:57', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (118, 1567159448025551900, '1567159519039472700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-30 17:05:19', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (119, 1567231683043876500, '1567231761012584000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 13:09:21', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (120, 1567231772016028300, '1567231825038582700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 13:10:25', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (121, 1567231835035888300, '1567231901039715600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 13:11:41', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (122, 1567231922004998900, '1567232027027042800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 13:13:47', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (123, 1567232406018544300, '1567232458009846200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 13:20:58', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (124, 1567232466048453000, '1567232508041801800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 13:21:48', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (125, 1567232517075356200, '1567232624049245100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 13:23:44', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (126, 1567232710006768600, '1567232756054620100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 13:25:56', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (127, 1567232768080926600, '1567232816023961000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 13:26:56', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (128, 1567233396021429400, '1567233456038779900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 13:37:36', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (129, 1567233468046568700, '1567233518094665400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 13:38:38', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (130, 1567234140074337200, '1567234199096072500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 13:49:59', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (131, 1567234208090130100, '1567234270053718200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 13:51:10', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (132, 1567234996010637600, '1567235110034947300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:05:10', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (133, 1567235283081084800, '1567235593060790600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:13:13', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (134, 1567235604005437900, '1567235706047833600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:15:06', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (135, 1567235718058353700, '1567235904001658700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:18:24', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (136, 1567235912099402300, '1567235965003063100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:19:25', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (137, 1567235974061752700, '1567236036062083900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:20:36', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (138, 1567236045083702700, '1567236097001963100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:21:37', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (139, 1567236108094403500, '1567236168032921300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:22:48', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (140, 1567236437037015900, '1567236556070127600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:29:16', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (141, 1567236571084276100, '1567236625053772500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:30:25', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (142, 1567236755040397500, '1567236826099763900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:33:46', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (143, 1567236839037813600, '1567236890016236300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:34:50', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (144, 1567236900079371500, '1567236948023003100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:35:48', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (145, 1567237119052967300, '1567237179019242100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:39:39', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (146, 1567237246052140600, '1567237289091579500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:41:29', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (147, 1567237300037072800, '1567237362099439800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:42:42', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (148, 1567237374071773800, '1567237430081172900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:43:50', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (149, 1567237717059956900, '1567237820005941700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:50:20', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (150, 1567237842095323200, '1567237896015325200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:51:36', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (151, 1567237908008100300, '1567237980081744600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:53:00', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (152, 1567237997052908100, '1567238069071304600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:54:29', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (153, 1567238084003616800, '1567238139079728000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:55:39', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (154, 1567238150046643100, '1567238198091940400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:56:38', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (155, 1567238208084016200, '1567238258051227900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:57:38', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (156, 1567238296017505400, '1567238341043764200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 14:59:01', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (157, 1567238352055430500, '1567238407054177600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:00:07', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (158, 1567238419000255800, '1567238482074183600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:01:22', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (159, 1567238492097475800, '1567238544018135100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:02:24', NULL, NULL, 1, NULL);
INSERT INTO `files` VALUES (160, 1567238492097475800, '1567238552071647200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:02:32', NULL, NULL, 1, NULL);
INSERT INTO `files` VALUES (161, 1567238492097475800, '1567238566059009700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:02:46', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (162, 1567238583037772600, '1567238626042508800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:03:46', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (163, 1567238887087508900, '1567238973048458400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:09:33', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (164, 1567238999042756200, '1567239046058024700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:10:46', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (165, 1567239057089763800, '1567239111065383100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:11:51', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (166, 1567239119080520100, '1567239164017979600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:12:44', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (167, 1567239172034233700, '1567239216017253300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:13:36', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (168, 1567239225050620200, '1567239267010131500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:14:27', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (169, 1567239274048716400, '1567239312025784000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:15:12', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (170, 1567239322080355500, '1567239379010489200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:16:19', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (171, 1567239556000849700, '1567239593074946700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:19:53', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (172, 1566621138079752100, '1567240059030897500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:27:39', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (173, 1566640021084539500, '1567240178050781100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:29:38', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (174, 1566640076074094800, '1567240212058466000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:30:12', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (175, 1566640157018916300, '1567240272022008700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:31:12', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (176, 1566640257069887700, '1567240295044643800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:31:35', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (177, 1566641679088077700, '1567240407051015500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:33:27', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (178, 1566641763032719600, '1567240436013447100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:33:56', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (179, 1566641818065427400, '1567240468023237100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:34:28', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (180, 1566805311086129100, '1567240578006729000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:36:18', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (181, 1566877336033975500, '1567240719001716800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:38:39', NULL, NULL, 1, NULL);
INSERT INTO `files` VALUES (182, 1566877336033975500, '1567240769010179000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:39:29', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (183, 1566877336033975500, '1567240817061321000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:40:17', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (184, 1566877336033975500, '1567240932057343000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:42:12', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (185, 1566877336033975500, '1567240933088036900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:42:13', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (186, 1566877714053664300, '1567240987049606000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:43:07', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (187, 1566877336033975500, '1567241021066310400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:43:41', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (188, 1566877336033975500, '1567241055059134100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:44:15', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (189, 1566877786028425900, '1567241097013747100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:44:57', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (190, 1566877336033975500, '1567241241020220300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:47:21', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (191, 1566877336033975500, '1567241265036931400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:47:45', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (192, 1566877336033975500, '1567241376029961600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:49:36', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (193, 1566877853085398000, '1567241498090140200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:51:38', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (194, 1566877921054471100, '1567241533078004700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:52:13', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (195, 1566877999098881600, '1567241556028342500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:52:36', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (196, 1566878081010810800, '1567241578048759000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:52:58', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (197, 1566878141080464600, '1567241606055973000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:53:26', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (198, 1566879147050947700, '1567241653043715400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:54:13', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (199, 1566879193037115000, '1567241736046735100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:55:36', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (200, 1566879238088300400, '1567241759066027200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-08-31 15:55:59', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (201, 1566619840024039700, '1568123213060123900.jpg', '/var/www/billing/storage/web/uploads/', 1, '2019-09-10 20:46:53', NULL, NULL, 3, 10);
INSERT INTO `files` VALUES (202, 1566900902075233200, '1568124368043359000.jpeg', '/var/www/billing/storage/web/uploads/', 4, '2019-09-10 21:06:08', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (203, 1566877522053383200, '1568124713046877100.jpg', '/var/www/billing/storage/web/uploads/', 4, '2019-09-10 21:11:53', NULL, NULL, 3, 10);
INSERT INTO `files` VALUES (204, 1566877522053383200, '1568124731058278800.jpg', '/var/www/billing/storage/web/uploads/', 4, '2019-09-10 21:12:11', NULL, NULL, 1, 10);
INSERT INTO `files` VALUES (205, 1572488245018305800, '1572488393058339500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 09:19:53', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (206, 1572488436045222200, '1572488496073456400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 09:21:36', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (207, 1572488700050255700, '1572488777028270100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 09:26:17', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (208, 1572488812064818800, '1572488857094174800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 09:27:37', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (209, 1572488918028216100, '1572488968032091700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 09:29:28', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (210, 1572489013044906700, '1572489043083660700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 09:30:43', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (211, 1572489066095263100, '1572489111089325200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 09:31:51', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (212, 1572489180088069900, '1572489219024862400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 09:33:39', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (213, 1572489244035943700, '1572491670052714200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 10:14:30', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (214, 1572491732073038800, '1572491800068174300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 10:16:40', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (215, 1572491833078673900, '1572491907000081600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 10:18:27', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (216, 1572491947078458000, '1572492006061044700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 10:20:06', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (217, 1572492042048957700, '1572492080044967700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 10:21:20', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (218, 1572492111088293800, '1572492147038661500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 10:22:27', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (219, 1572492178060448500, '1572492221046386700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 10:23:41', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (220, 1572494323056990800, '1572494368024801200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 10:59:28', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (221, 1572494418048677900, '1572494485028023000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 11:01:25', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (222, 1572494599043800100, '1572494663091436500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 11:04:23', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (223, 1572494720043699300, '1572494766014079200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 11:06:06', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (224, 1572494822072951800, '1572494864034202200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 11:07:44', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (225, 1572494889044072100, '1572494934057677300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 11:08:54', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (226, 1572495026052247400, '1572495075086375000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 11:11:15', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (227, 1572495113027690100, '1572495153020448600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 11:12:33', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (228, 1572495244045194400, '1572495305047211300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 11:15:05', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (229, 1572495386082511300, '1572495432030970800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 11:17:12', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (230, 1572504266023017000, '1572504312079298900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 13:45:12', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (231, 1572504354020498400, '1572504390037540800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 13:46:30', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (232, 1572504403010969900, '1572504439049924000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 13:47:19', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (233, 1572504552032704800, '1572504601035477700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 13:50:01', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (234, 1572504552032704800, '1572504601045815700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 13:50:01', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (235, 1572504626008986200, '1572504658040147200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-10-31 13:50:58', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (236, 1572681406004407300, '1572681462036042000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 14:57:42', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (237, 1572681490048520400, '1572681546003443900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 14:59:06', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (238, 1572681575083961600, '1572681624035992300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 15:00:24', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (239, 1572681649075238700, '1572681691039070600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 15:01:31', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (240, 1572681721055643700, '1572681763086985100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 15:02:43', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (241, 1572681791071042000, '1572681838090621000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 15:03:58', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (242, 1572681936092598700, '1572681982088642700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 15:06:22', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (243, 1572683294007474100, '1572683486015010200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 15:31:26', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (244, 1572683510062001300, '1572683560022331800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 15:32:40', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (245, 1572683595030532000, '1572683635099067100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 15:33:55', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (246, 1572683750048039400, '1572683793055231900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 15:36:33', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (247, 1572683835058768000, '1572683881005477200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 15:38:01', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (248, 1572683927091711000, '1572683974051253900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 15:39:34', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (249, 1572684050065616400, '1572684094082387500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 15:41:34', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (250, 1572684159088765000, '1572684235054943300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 15:43:55', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (251, 1572684287030733300, '1572684352053769500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 15:45:52', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (252, 1572684406098093000, '1572684483022754200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 15:48:03', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (253, 1572684519027062800, '1572684578054869400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 15:49:38', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (254, 1572684619097191400, '1572684673050603900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 15:51:13', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (255, 1572684707073779700, '1572684754057499500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 15:52:34', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (256, 1572684801077310800, '1572684866023413300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 15:54:26', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (257, 1572685419029243300, '1572685478019720000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 16:04:38', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (258, 1572685523088382100, '1572685602090549600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 16:06:42', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (259, 1572685523088382100, '1572685603001296100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 16:06:43', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (260, 1572685746042718300, '1572687357092373300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 16:35:57', NULL, NULL, 1, NULL);
INSERT INTO `files` VALUES (261, 1572685746042718300, '1572687366045819200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 16:36:06', NULL, NULL, 1, NULL);
INSERT INTO `files` VALUES (262, 1572685746042718300, '1572687383056931200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 16:36:23', NULL, NULL, 1, NULL);
INSERT INTO `files` VALUES (263, 1572685746042718300, '1572687398093725400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 16:36:38', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (264, 1572685746042718300, '1572687436009247400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 16:37:16', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (265, 1572685746042718300, '1572687506036881600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-02 16:38:26', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (266, 1572834905093147600, '1572834970036170300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-04 09:36:10', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (267, 1572685746042718300, '1572835024075259500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-04 09:37:04', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (268, 1572685746042718300, '1572835037039206700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-04 09:37:17', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (269, 1572841185053958500, '1572841249082390000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-04 11:20:49', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (270, 1572841480044284100, '1572841561054839100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-04 11:26:01', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (271, 1572841585015310600, '1572841627086721100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-04 11:27:07', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (272, 1572841662002783000, '1572841707095607500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-04 11:28:27', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (273, 1572841732044928600, '1572841779030943000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-04 11:29:39', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (274, 1572841805011102000, '1572841850055217800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-04 11:30:50', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (275, 1571986796061661100, '1572844192050147000.jpg', '/var/www/billing/storage/web/uploads/', 1, '2019-11-04 12:09:52', NULL, NULL, 1, NULL);
INSERT INTO `files` VALUES (276, 1566803798045236600, '1572844474037110700.jpg', '/var/www/billing/storage/web/uploads/', 1, '2019-11-04 12:14:34', NULL, NULL, 3, NULL);
INSERT INTO `files` VALUES (277, 1566803798045236600, '1572847835041016200.png', '/var/www/billing/storage/web/uploads/', 14, '2019-11-04 13:10:35', NULL, NULL, 3, 14);
INSERT INTO `files` VALUES (278, 1568138635041727100, '1573284958080931800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 14:35:58', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (279, 1567158203078328900, '1573285067018096800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 14:37:47', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (280, 1566620746025355100, '1573285124077360900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 14:38:44', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (281, 1567158393064750100, '1573285326020733000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 14:42:06', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (282, 1567158455085087300, '1573285368024809700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 14:42:48', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (283, 1567158794064539900, '1573285414049614700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 14:43:34', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (284, 1567158858033486900, '1573285454094955800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 14:44:14', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (285, 1567159020058613200, '1573285509059623900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 14:45:09', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (286, 1567159385035206800, '1573285564050396100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 14:46:04', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (287, 1567159448025551900, '1573285684063904700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 14:48:04', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (288, 1567231772016028300, '1573285740078914600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 14:49:00', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (289, 1567231835035888300, '1573285783021205800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 14:49:43', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (290, 1567157364090688700, '1573286849050222800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:07:29', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (291, 1567157527058391000, '1573286891083043500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:08:11', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (292, 1567157592099147200, '1573286931078111600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:08:51', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (293, 1567157646082750900, '1573286979078895700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:09:39', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (294, 1567157778055954700, '1573287015002978200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:10:15', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (295, 1567157834046825000, '1573287055077299900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:10:55', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (296, 1567157893038970000, '1573287089066537800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:11:29', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (297, 1567158020051721600, '1573287123043818500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:12:03', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (298, 1567158083098468000, '1573287150061519700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:12:30', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (299, 1567158148033288200, '1573287178042440800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:12:58', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (300, 1567158319012777100, '1573287228007563900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:13:48', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (301, 1567158522074997200, '1573287262081870100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:14:22', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (302, 1567158680046000300, '1573287292058371300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:14:52', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (303, 1573287371069048100, '1573287634052768800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:20:34', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (304, 1567159164069746600, '1573287693017368200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:21:33', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (305, 1567159224061116300, '1573287775046321000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:22:55', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (306, 1567231683043876500, '1573287830029055400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:23:50', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (307, 1567231922004998900, '1573287920047147200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:25:20', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (308, 1567232406018544300, '1573287962074221400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:26:02', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (309, 1567232466048453000, '1573287990027993100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:26:30', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (310, 1567232710006768600, '1573288033065725900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:27:13', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (311, 1567232768080926600, '1573288074060557700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:27:54', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (312, 1567233396021429400, '1573288105072975300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:28:25', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (313, 1567233468046568700, '1573288136098530600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:28:56', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (314, 1567234140074337200, '1573288173019728200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:29:33', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (315, 1567234208090130100, '1573288203030632600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:30:03', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (316, 1567234996010637600, '1573288233034955300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:30:33', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (317, 1567235283081084800, '1573288300074542700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:31:40', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (318, 1567235604005437900, '1573289242004492400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:47:22', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (319, 1567235718058353700, '1573289320045962400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:48:40', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (320, 1567235912099402300, '1573289644094459900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:54:04', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (321, 1567235974061752700, '1573289680064780800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:54:40', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (322, 1567236045083702700, '1573289714006206200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:55:14', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (323, 1567236108094403500, '1573289751012731900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:55:51', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (324, 1567236437037015900, '1573289822013799900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:57:02', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (325, 1567236571084276100, '1573289922070483500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:58:42', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (326, 1567236755040397500, '1573289959071866900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 15:59:19', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (327, 1567236839037813600, '1573290011023687900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 16:00:11', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (328, 1567236900079371500, '1573290075007040100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 16:01:15', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (329, 1567237119052967300, '1573290140071911300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 16:02:20', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (330, 1567237246052140600, '1573290282031535600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-09 16:04:42', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (331, 1567237300037072800, '1573445172058992600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:06:12', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (332, 1567237374071773800, '1573445283038058900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:08:03', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (333, 1567237717059956900, '1573445346006412200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:09:06', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (334, 1567237842095323200, '1573445403031982100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:10:03', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (335, 1567237908008100300, '1573445455043045400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:10:55', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (336, 1567237997052908100, '1573445518035936800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:11:58', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (337, 1567238084003616800, '1573445565094361400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:12:45', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (338, 1567238150046643100, '1573445606041350300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:13:26', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (339, 1567238208084016200, '1573445650030496500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:14:10', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (340, 1567238296017505400, '1573446682076604000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:31:22', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (341, 1567238352055430500, '1573446718091525900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:31:58', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (342, 1567238419000255800, '1573446806065643500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:33:26', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (343, 1567238583037772600, '1573446897030702800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:34:57', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (344, 1567238887087508900, '1573447140021393400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:39:00', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (345, 1567238999042756200, '1573447184001719800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:39:44', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (346, 1567239057089763800, '1573447226072614400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:40:26', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (347, 1567239119080520100, '1573447270016102500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:41:10', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (348, 1567239172034233700, '1573447324062450400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:42:04', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (349, 1567239225050620200, '1573447360021820600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:42:40', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (350, 1567239274048716400, '1573447393088409600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:43:13', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (351, 1567239322080355500, '1573447426013616700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:43:46', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (352, 1567239556000849700, '1573447458047875800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 11:44:18', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (353, 1573452145067759900, '1573452211020497300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 13:03:31', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (354, 1573452284021132100, '1573452338002113700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 13:05:38', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (355, 1573452368020845200, '1573452407017802200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 13:06:47', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (356, 1573452429022673300, '1573452473010990800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 13:07:53', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (357, 1573452512034035800, '1573452579059739100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 13:09:39', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (358, 1573452606015291900, '1573452646011546100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 13:10:46', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (359, 1573452812031763100, '1573452881002218500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 13:14:41', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (360, 1573452915029097300, '1573452966023788700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 13:16:06', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (361, 1573452988005415600, '1573453021078367700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 13:17:01', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (362, 1573457106001253400, '1573457157048065300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 14:25:57', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (363, 1573462466072798100, '1573462626026221200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 15:57:06', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (364, 1573462777015402500, '1573462848069692500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 16:00:48', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (365, 1573463752014209700, '1573463851013725400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 16:17:31', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (366, 1573463987019637200, '1573464047069498900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 16:20:47', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (367, 1573464183069861100, '1573464275000872000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 16:24:35', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (368, 1573464428038729200, '1573464512049147900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 16:28:32', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (369, 1573464911074628100, '1573464983042738100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 16:36:23', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (370, 1573465028070531500, '1573465107049131600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 16:38:27', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (371, 1573465181022995200, '1573465299068518400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 16:41:39', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (372, 1573465652076940100, '1573465719076530800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 16:48:39', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (373, 1573465741000226000, '1573465791011528700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 16:49:51', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (374, 1573465815006028800, '1573465867023279300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 16:51:07', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (375, 1573465896036306000, '1573465936084829700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 16:52:16', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (376, 1573466462043274000, '1573466534077275500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 17:02:14', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (377, 1573466576073628300, '1573466698052219000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 17:04:58', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (378, 1573466731098483900, '1573466821015693800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 17:07:01', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (379, 1573466961012981400, '1573467076053660200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-11 17:11:16', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (380, 1573532113012662900, '1573532260088968200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:17:40', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (381, 1573532293094690100, '1573532342012199000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:19:02', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (382, 1573532368085102900, '1573532418046592900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:20:18', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (383, 1573532444006922400, '1573532508064852900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:21:48', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (384, 1573532552076195300, '1573532615055169900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:23:35', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (385, 1573532647025371200, '1573532730014054400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:25:30', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (386, 1573532752070778800, '1573532802062554300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:26:42', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (387, 1573532823038864300, '1573532866016542800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:27:46', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (388, 1573532887028400200, '1573532949071758500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:29:09', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (389, 1573532972077738000, '1573533020095650600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:30:20', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (390, 1573533044094109600, '1573533089006674400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:31:29', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (391, 1573533108016882700, '1573533158062870800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:32:38', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (392, 1573533515029938700, '1573533567071804400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:39:27', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (393, 1573533605006529100, '1573533657072417300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:40:57', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (394, 1573533684040338300, '1573533728095433700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:42:08', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (395, 1573533779037414500, '1573533824064976200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:43:44', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (396, 1573533847049958900, '1573533879092642300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:44:39', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (397, 1573533931016272100, '1573533981074808500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:46:21', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (398, 1573534059083049100, '1573534118028101000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:48:38', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (399, 1573534144064093000, '1573534210095260800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:50:10', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (400, 1566623756009605100, '1573534284034354700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 11:51:24', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (401, 1573546564071886900, '1573546612083141000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 15:16:52', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (402, 1573546644076656500, '1573546692029916200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 15:18:12', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (403, 1573546724045462500, '1573546757038207100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 15:19:17', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (404, 1573546788084921000, '1573546850078886700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 15:20:50', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (405, 1573546878019290200, '1573546927066963400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 15:22:07', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (406, 1573547416023433100, '1573547488023352300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 15:31:28', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (407, 1573548496010842800, '1573548541032784400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 15:49:01', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (408, 1573548590072263100, '1573548650074218200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 15:50:50', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (409, 1573549606008765500, '1573549653087861500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 16:07:33', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (410, 1573549679050257400, '1573549719040137400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 16:08:39', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (411, 1573549743092958100, '1573549783077810200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 16:09:43', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (412, 1573549805037364900, '1573549852027273600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-12 16:10:52', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (413, 1574483891024783700, '1574484001007510900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 11:40:01', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (414, 1574484061028590000, '1574484102025210800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 11:41:42', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (415, 1574484124092367000, '1574484167061083200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 11:42:47', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (416, 1574484227050936300, '1574484282047383100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 11:44:42', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (417, 1574484416023666300, '1574484475097872100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 11:47:55', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (418, 1574484493065973300, '1574484532045151100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 11:48:52', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (419, 1574484559017767900, '1574484608014225900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 11:50:08', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (420, 1574484642077689700, '1574484686087919400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 11:51:26', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (421, 1574485078050599100, '1574485121048365400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 11:58:41', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (422, 1574485147070005000, '1574485187036357100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 11:59:47', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (423, 1574485210087045200, '1574485245023527800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 12:00:45', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (424, 1574485291013649200, '1574485336093185700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 12:02:16', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (425, 1574485362033463200, '1574485405091662600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 12:03:25', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (426, 1574485430065046500, '1574485473019250800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 12:04:33', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (427, 1574485526053608600, '1574485568063053400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 12:06:08', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (428, 1574489363048416100, '1574489407049477600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 13:10:07', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (429, 1574489434060222600, '1574489474051058900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 13:11:14', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (430, 1574489495061229800, '1574489534060289700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 13:12:14', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (431, 1574489557075792600, '1574489601028062100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 13:13:21', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (432, 1574500816046787000, '1574500873083125800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 16:21:13', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (433, 1574501050097497200, '1574501102017178900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 16:25:02', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (434, 1574501579076524100, '1574501654066693100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 16:34:14', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (435, 1574501707051260400, '1574501756021195500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 16:35:56', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (436, 1574501787080893000, '1574501836025334100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 16:37:16', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (437, 1574501787080893000, '1574501836035501100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 16:37:16', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (438, 1574501867094048100, '1574501911041607500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 16:38:31', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (439, 1574501940075915700, '1574501981050185700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-23 16:39:41', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (440, 1574663569016678700, '1574663604027142000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 13:33:24', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (441, 1574663641043519700, '1574663678089238900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 13:34:38', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (442, 1574663715054578600, '1574663754071200700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 13:35:54', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (443, 1574663779042559500, '1574663818078435600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 13:36:58', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (444, 1574663839040946900, '1574663874095771900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 13:37:54', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (445, 1574663929042391700, '1574663968096884000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 13:39:28', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (446, 1574664003037854800, '1574664065035363900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 13:41:05', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (447, 1574664288015316700, '1574664330037192000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 13:45:30', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (448, 1574664365072552300, '1574664401099996800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 13:46:41', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (449, 1574668539064504100, '1574668597084864600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 14:56:37', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (450, 1574668717024738400, '1574668786089690900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 14:59:46', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (451, 1574668817057999100, '1574668858042030100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:00:58', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (452, 1574668884057850300, '1574668926053153400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:02:06', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (453, 1574669006031212900, '1574669047028516800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:04:07', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (454, 1574669094080259200, '1574669129087406100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:05:29', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (455, 1574669153066006700, '1574669189092494000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:06:29', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (456, 1574669211060670500, '1574669244077023900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:07:24', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (457, 1574669266048883100, '1574669300057059600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:08:20', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (458, 1574669340039879200, '1574669381003172000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:09:41', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (459, 1574669402018802500, '1574669437099755000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:10:37', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (460, 1574669456078681800, '1574669489074730000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:11:29', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (461, 1574669532042769400, '1574669573015945300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:12:53', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (462, 1574669601074132400, '1574669686014857900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:14:46', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (463, 1574669709092771300, '1574669749013174100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:15:49', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (464, 1574669818018607700, '1574669861049027900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:17:41', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (465, 1574669884099351500, '1574669922004418200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:18:42', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (466, 1574669941053282300, '1574669980035060300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:19:40', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (467, 1574669999031675300, '1574670041067778000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:20:41', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (468, 1574670060032613900, '1574670097050901700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:21:37', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (469, 1574670117045334900, '1574670157064392100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:22:37', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (470, 1566640021084539500, '1574670343093026000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:25:43', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (471, 1566640076074094800, '1574670396062350600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:26:36', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (472, 1566640157018916300, '1574670453094713300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:27:33', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (473, 1566640257069887700, '1574670494068656000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:28:14', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (474, 1566641679088077700, '1574670641050877400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:30:41', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (475, 1566641763032719600, '1574670698037250700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:31:38', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (476, 1566641818065427400, '1574670739046259700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:32:19', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (477, 1574670770077788300, '1574670816082103000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:33:36', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (478, 1566805311086129100, '1574670865085314200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:34:25', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (479, 1566877336033975500, '1574670919038067800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:35:19', NULL, NULL, 1, NULL);
INSERT INTO `files` VALUES (480, 1574671104044871900, '1574671144092852200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:39:04', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (481, 1574671170048263600, '1574671204077549700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:40:04', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (482, 1566900694081960500, '1574671285050768800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:41:25', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (483, 1566879300071938100, '1574671321005216400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:42:01', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (484, 1566900639055645200, '1574671366010328600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:42:46', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (485, 1566636065070180300, '1574671407098063900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:43:27', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (486, 1566900760091395100, '1574671438021621800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:43:58', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (487, 1566900810063464700, '1574671530051274300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:45:30', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (488, 1566638223004644500, '1574671578023707600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:46:18', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (489, 1574671614023000300, '1574671650002981400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:47:30', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (490, 1574671673098500300, '1574671705081910400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:48:25', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (491, 1566900902075233200, '1574671757033953100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:49:17', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (492, 1566900956035126800, '1574671839047414100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:50:39', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (493, 1566901082010001100, '1574671974039327500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:52:54', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (494, 1566901124047885600, '1574672231018295400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:57:11', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (495, 1566901177038211800, '1574672374017408800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 15:59:34', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (496, 1566901227091956800, '1574672418034429800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 16:00:18', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (497, 1566901269066456800, '1574672446019205100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 16:00:46', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (498, 1574672459042715100, '1574672514065359100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 16:01:54', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (499, 1574672556061074800, '1574672593005718900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 16:03:13', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (500, 1566956598075343800, '1574672640085236100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 16:04:00', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (501, 1566956660085974300, '1574672668074899100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 16:04:28', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (502, 1566956709056916900, '1574672695094663300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 16:04:55', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (503, 1566956750067862500, '1574672725090683400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 16:05:25', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (504, 1566956824006569000, '1574672761013542000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 16:06:01', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (505, 1566956865085260700, '1574672788008177300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 16:06:28', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (506, 1566956912074656900, '1574672834095397500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 16:07:14', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (507, 1566957097065735300, '1574672958069064600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 16:09:18', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (508, 1566957171088620000, '1574672997072626900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 16:09:57', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (509, 1566958298047584600, '1574673031001511500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 16:10:31', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (510, 1574675403057484600, '1574675448099292700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-25 16:50:48', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (511, 1574750858054042200, '1574751014070636600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-26 13:50:14', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (512, 1566960067096119200, '1574751206023165300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-26 13:53:26', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (513, 1566960133065502600, '1574751339059910800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-26 13:55:39', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (514, 1566960874038180000, '1574751406052013600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-26 13:56:46', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (515, 1566960932037262300, '1574751508035512600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-26 13:58:28', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (516, 1566960987057290800, '1574751573059359600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-26 13:59:33', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (517, 1566961056025634000, '1574751614032220700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-26 14:00:14', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (518, 1566961457011046800, '1574751641061371500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-26 14:00:41', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (519, 1566961527041522000, '1574751710086441900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-26 14:01:50', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (520, 1566961604022351700, '1574751746057148700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-26 14:02:26', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (521, 1566964011092539900, '1574752350047169900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-26 14:12:30', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (522, 1575088733061516800, '1575088824043435900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 11:40:24', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (523, 1566964080023354500, '1575093518085162300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 12:58:38', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (524, 1575093758009325000, '1575093826054989700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 13:03:46', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (525, 1575093858097067700, '1575093912010751500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 13:05:12', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (526, 1575094537037119600, '1575094573028819200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 13:16:13', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (527, 1567135458088360800, '1575094645041348000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 13:17:25', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (528, 1567135458088360800, '1575094648061170600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 13:17:28', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (529, 1567135496059564600, '1575094769014841300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 13:19:29', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (530, 1567135534041320100, '1575094959061480000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 13:22:39', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (531, 1567135572099386800, '1575095072098567900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 13:24:32', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (532, 1567135572099386800, '1575095075076976200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 13:24:35', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (533, 1567135622078645800, '1575095122048995500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 13:25:22', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (534, 1567135672044487200, '1575095172077356400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 13:26:12', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (535, 1567135716080193200, '1575096703046383700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 13:51:43', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (536, 1575096767067964100, '1575096809074684000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 13:53:29', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (537, 1567136116088285500, '1575096904079572100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 13:55:04', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (538, 1567136184030802000, '1575096957092863400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 13:55:57', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (539, 1567136230066997600, '1575097037095491800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 13:57:17', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (540, 1567136280027509200, '1575097106096401600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 13:58:26', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (541, 1567136335069431100, '1575097235068795800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 14:00:35', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (542, 1567136432078448100, '1575097281093734800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 14:01:21', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (543, 1567136377094852900, '1575097321019466200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 14:02:01', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (544, 1567136647001235900, '1575097446022382600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 14:04:06', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (545, 1575097463086976000, '1575097507028332500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 14:05:07', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (546, 1567136777024085000, '1575097555037351000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 14:05:55', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (547, 1567137011013228800, '1575097717046452800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 14:08:37', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (548, 1567137075092437800, '1575097754057998500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 14:09:14', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (549, 1567137122085866500, '1575097793082608600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 14:09:53', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (550, 1567137192096512000, '1575097828021098000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 14:10:28', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (551, 1575097844063495100, '1575097885064351100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 14:11:25', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (552, 1575097982041303600, '1575098043094379300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 14:14:03', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (553, 1567137268011422900, '1575099089041394400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 14:31:29', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (554, 1567137677080376100, '1575099187043949200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-11-30 14:33:07', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (555, 1567137765063228500, '1575966955002744200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:35:55', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (556, 1567137809038211500, '1575966987027112200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:36:27', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (557, 1567140831027233600, '1575967092010400200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:38:12', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (558, 1567141082047083300, '1575967141070002700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:39:01', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (559, 1567141125001073800, '1575967198093782800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:39:58', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (560, 1567141164072197500, '1575967228065882400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:40:28', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (561, 1567141324087179200, '1575967255023133800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:40:55', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (562, 1567141367088054900, '1575967281053924500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:41:21', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (563, 1567141600015342600, '1575967521067064900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:45:21', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (564, 1567142044072825100, '1575967759011387000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:49:19', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (565, 1567142107014701700, '1575967824054091600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:50:24', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (566, 1575967862036441200, '1575967927098593600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:52:07', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (567, 1567142134034043300, '1575967986000478600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:53:06', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (568, 1567142188071779100, '1575968032054472700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:53:52', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (569, 1567142232021761000, '1575968065077680600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:54:25', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (570, 1567142289012540400, '1575968092029457400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:54:52', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (571, 1567142316040676200, '1575968124056908500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:55:24', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (572, 1567142380075185400, '1575968284002462900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:58:04', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (573, 1567142380075185400, '1575968293055969200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:58:13', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (574, 1567142380075185400, '1575968294016886100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:58:14', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (575, 1567142427080678100, '1575968323068162600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 15:58:43', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (576, 1567142536051949000, '1575968468021255200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 16:01:08', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (577, 1567142595010256900, '1575968568080769700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 16:02:48', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (578, 1567142622041477400, '1575968636065863400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 16:03:56', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (579, 1567142693008664900, '1575969139017079800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 16:12:19', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (580, 1567142727024524400, '1575969186073599700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 16:13:06', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (581, 1567142767028430600, '1575969246085551500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 16:14:06', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (582, 1575969357047906500, '1575969404091556300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 16:16:44', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (583, 1567142837098861800, '1575969443009151900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-10 16:17:23', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (584, 1576143958053434300, '1576144550027032100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-12 16:55:50', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (585, 1576312507067594700, '1576312551016575900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-14 15:35:51', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (586, 1576312619074305600, '1576312693060471000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-14 15:38:13', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (587, 1576312730094705100, '1576312765091540900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-14 15:39:25', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (588, 1576312796002719900, '1576312834040176600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-14 15:40:34', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (589, 1576312882057103000, '1576312932044800300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-14 15:42:12', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (590, 1576312955085357300, '1576312997049806800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-14 15:43:17', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (591, 1576313067046000400, '1576313132040733000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-14 15:45:32', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (592, 1576313172021520200, '1576313260008109600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-14 15:47:40', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (593, 1576315698057612100, '1576315752017411700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-14 16:29:12', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (594, 1576315781029138200, '1576315821037686200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-14 16:30:21', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (595, 1576315844002024000, '1576315881013655500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-14 16:31:21', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (596, 1576315905065605600, '1576315941049133300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-14 16:32:21', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (597, 1576315958025440900, '1576315992079857200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-14 16:33:12', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (598, 1576316977082311200, '1576317010056016300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-14 16:50:10', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (599, 1576317047078972700, '1576317091031867400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-14 16:51:31', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (600, 1576490004096908000, '1576490047076388100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-16 16:54:07', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (601, 1576490085081822200, '1576490126092181100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-16 16:55:26', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (602, 1576490146052002000, '1576490192066609000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-16 16:56:32', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (603, 1576490207052147600, '1576490242016814800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-16 16:57:22', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (604, 1576490274017909400, '1576490308080459800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-16 16:58:28', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (605, 1576490338098066200, '1576490384052590800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-16 16:59:44', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (606, 1576490420013908500, '1576490463026945300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-16 17:01:03', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (607, 1576490516077699000, '1576490573089372400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-16 17:02:53', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (608, 1576490579099857900, '1576490646034994500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-16 17:04:06', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (609, 1576641269009304200, '1576641320037778200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 10:55:20', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (610, 1576641357022990000, '1576641404020289300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 10:56:44', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (611, 1576641417099072600, '1576641494010328100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 10:58:14', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (612, 1576641597010735300, '1576641659041299000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 11:00:59', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (613, 1576641686094293500, '1576641738039959300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 11:02:18', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (614, 1576641751050022200, '1576641799077495000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 11:03:19', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (615, 1576641815055227800, '1576641856001420700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 11:04:16', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (616, 1576641876055926600, '1576641923070382400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 11:05:23', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (617, 1576641944083311100, '1576642506068979400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 11:15:06', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (618, 1576642941036401100, '1576643024056087500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 11:23:44', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (619, 1576643040021926700, '1576643084015513800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 11:24:44', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (620, 1576643094016274500, '1576643136023831500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 11:25:36', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (621, 1576643144083533500, '1576643186005545500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 11:26:26', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (622, 1576643225042644400, '1576643278064204800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 11:27:58', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (623, 1576643310046512600, '1576643353048588500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 11:29:13', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (624, 1576644207035513900, '1576644291094784200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 11:44:51', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (625, 1576644314051543300, '1576644393027336400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 11:46:33', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (626, 1576644716013112400, '1576644780005632500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 11:53:00', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (627, 1576648790024631400, '1576652943000084400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 14:09:02', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (628, 1576653521001969300, '1576653773014750700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 14:22:53', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (629, 1576653871052051100, '1576653921025991700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 14:25:21', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (630, 1576653933060390600, '1576653975076375900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 14:26:15', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (631, 1576654129033864400, '1576654202000937000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 14:30:02', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (632, 1576654566071465500, '1576654615059628300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 14:36:55', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (633, 1576657449077285300, '1576657493091164600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 15:24:53', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (634, 1576657512015617200, '1576657574035853300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 15:26:14', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (635, 1576661233096173300, '1576661322033854200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 16:28:42', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (636, 1576661410048052800, '1576661458089385100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 16:30:58', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (637, 1576661747012084600, '1576661795074285900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 16:36:35', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (638, 1576661820047228600, '1576661870000363000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 16:37:50', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (639, 1576661892048288300, '1576661942003640800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 16:39:02', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (640, 1576661956017103300, '1576661991011259700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 16:39:51', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (641, 1576662012024188100, '1576662064028377800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 16:41:04', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (642, 1576662076014803300, '1576662121025154400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 16:42:01', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (643, 1576662158092689500, '1576662203009971900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 16:43:23', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (644, 1576662305013602100, '1576662427036162800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 16:47:07', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (645, 1576662495010964700, '1576662539027199900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 16:48:59', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (646, 1576662550024854300, '1576662594029963900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 16:49:54', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (647, 1576662607074701300, '1576662653047426700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-18 16:50:53', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (648, 1576740748060437700, '1576740875064467500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-19 14:34:35', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (649, 1576740909065540900, '1576740963003767200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-19 14:36:03', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (650, 1576740993042334900, '1576741044010618900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-19 14:37:24', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (651, 1576742077031211900, '1576742264054423600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-19 14:57:44', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (652, 1576742907027969100, '1576742968040773300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-19 15:09:28', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (653, 1576742989002732300, '1576743304047120200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-19 15:15:04', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (654, 1576744714013926800, '1576744813026847600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-19 15:40:13', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (655, 1576744846052190100, '1576744895016678700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-19 15:41:35', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (656, 1576744912029996000, '1576745009039535600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-19 15:43:29', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (657, 1576745088033955500, '1576745149030647200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-19 15:45:49', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (658, 1576745163073360300, '1576745227006685600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-19 15:47:07', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (659, 1576745240012595300, '1576745280006428100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-19 15:48:00', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (660, 1576745367094234300, '1576745407016055000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-19 15:50:07', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (661, 1576745418070204900, '1576745472018678600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-19 15:51:12', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (662, 1576746071008821200, '1576746151034350500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-19 16:02:31', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (663, 1576817029092189300, '1576817110051017400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 11:45:10', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (664, 1576817232093252900, '1576817452081192900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 11:50:52', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (665, 1576821846026003100, '1576822926055605100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 13:22:06', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (666, 1576822968063315100, '1576823019029475000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 13:23:39', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (667, 1576823041084660500, '1576823101071414400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 13:25:01', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (668, 1576823111096840900, '1576823157046602900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 13:25:57', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (669, 1576823181012970700, '1576823282016520500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 13:28:02', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (670, 1576823388005923800, '1576823532050333200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 13:32:12', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (671, 1576823740021555000, '1576823810013967600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 13:36:50', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (672, 1576823830028035300, '1576823868003920200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 13:37:48', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (673, 1576824194065137500, '1576824263079686500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 13:44:23', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (674, 1576824305080234400, '1576824371023317400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 13:46:11', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (675, 1576824387034108000, '1576824470027609400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 13:47:50', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (676, 1576824485047584700, '1576824554067435800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 13:49:14', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (677, 1576824568050191400, '1576824616060313500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 13:50:16', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (678, 1576824650003948300, '1576824752047122300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 13:52:32', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (679, 1576825178006800400, '1576825236071611400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 14:00:36', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (680, 1576825255053327500, '1576825311098775200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 14:01:51', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (681, 1576825334096829300, '1576825400012188600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 14:03:20', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (682, 1576825414038654200, '1576825455086165700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 14:04:15', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (683, 1576825511061528700, '1576825559072053400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 14:05:59', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (684, 1576825595017018500, '1576825645092051000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 14:07:25', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (685, 1576825682077965200, '1576825732079307100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 14:08:52', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (686, 1576825747044633000, '1576825807094284100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 14:10:07', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (687, 1576825890070929100, '1576825942036074400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 14:12:22', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (688, 1576826835099270600, '1576826897006227300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 14:28:17', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (689, 1576828401093735100, '1576828491049541500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 14:54:51', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (690, 1576828574019655000, '1576828637023094600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 14:57:17', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (691, 1576828659029707500, '1576828695005877700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 14:58:15', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (692, 1576828735021198000, '1576828784085178300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 14:59:44', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (693, 1576828798092920200, '1576828848022006500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 15:00:48', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (694, 1576828861031620800, '1576828932028154300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 15:02:12', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (695, 1576828946046479900, '1576829026083951000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 15:03:46', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (696, 1576829039025300000, '1576829083081783200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 15:04:43', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (697, 1576829150041015000, '1576829248086362600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 15:07:28', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (698, 1576829262096496400, '1576829315022204900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 15:08:35', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (699, 1576829906080467000, '1576830051060932100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 15:20:51', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (700, 1576830080053075000, '1576830139006769400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-20 15:22:19', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (701, 1576919146089695900, '1576919222050642600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:07:02', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (702, 1576919257028072100, '1576919315063065200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:08:35', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (703, 1576919413086518200, '1576919461030348200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:11:01', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (704, 1576919480072440300, '1576919524038069600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:12:04', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (705, 1576919609018917500, '1576919663054592200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:14:23', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (706, 1576919680081368800, '1576919722073539800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:15:22', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (707, 1576919532032446700, '1576919798073689800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:16:38', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (708, 1576919812041663000, '1576919859099738500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:17:39', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (709, 1576919868036369400, '1576919925037782300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:18:45', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (710, 1576919962037798700, '1576920015025521600.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:20:15', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (711, 1576920028023576300, '1576920074093468700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:21:14', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (712, 1576920752010078000, '1576920804043428400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:33:24', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (713, 1576920811061759100, '1576920856004723400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:34:16', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (714, 1576920865052673400, '1576920908054478400.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:35:08', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (715, 1576920916068810000, '1576920952056656000.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:35:52', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (716, 1576920959008772300, '1576921192078327700.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:39:52', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (717, 1576921206025269200, '1576921262035377200.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:41:02', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (718, 1576921270019698900, '1576921337032657800.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:42:17', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (719, 1576921346089968800, '1576921391054876300.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:43:11', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (720, 1576921405040037600, '1576921467082472500.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:44:27', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (721, 1576921588052393300, '1576921634071639900.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:47:14', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (722, 1576921643017921200, '1576921687075249100.jpg', '/var/www/billing/storage/web/uploads/', 14, '2019-12-21 16:48:07', NULL, NULL, 1, 4);
INSERT INTO `files` VALUES (723, 1567245475033902800, '1579165803023662900.jpg', '/var/www/billing/storage/web/uploads/', 1, '2020-01-16 16:10:03', NULL, NULL, 1, 4);
COMMIT;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 's',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ชื่อ กล่องที่',
  `value` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ค่าเริ่มต้น',
  `to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'เลขมากสุด',
  `selecteds` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ถึงเลขไหน',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of groups
-- ----------------------------
BEGIN;
INSERT INTO `groups` VALUES (2, 'กล่องที่ 26', '12501', '13000', '12501');
INSERT INTO `groups` VALUES (3, 'กล่องที่ 27', '13001', '13500', '13001');
INSERT INTO `groups` VALUES (4, 'กล่องที่ 28', '13501', '14000', '13501');
INSERT INTO `groups` VALUES (5, 'กล่องที่29', '14001', '14500', NULL);
INSERT INTO `groups` VALUES (6, 'กล่องที่30', '14501', '15000', '14501');
INSERT INTO `groups` VALUES (7, 'กล่องที่31', '15001', '15500', '15001');
INSERT INTO `groups` VALUES (8, 'กล่องที่32', '15501', '16000', '15501');
INSERT INTO `groups` VALUES (9, 'กล่องที่33', '16001', '16500', '16001');
INSERT INTO `groups` VALUES (10, 'กล่องที่34', '16501', '17000', '16501');
INSERT INTO `groups` VALUES (11, 'กล่องที่35', '17001', '17500', '17001');
INSERT INTO `groups` VALUES (12, 'กล่องที่36', '17501', '18000', '17501');
INSERT INTO `groups` VALUES (13, 'กล่องที่37', '18001', '18500', '18001');
INSERT INTO `groups` VALUES (14, 'กล่องที่38', '18501', '19000', '18501');
INSERT INTO `groups` VALUES (15, 'กล่องที่39', '19001', '19500', '19001');
INSERT INTO `groups` VALUES (16, 'กล่องที่40', '19501', '20000', '19501');
COMMIT;

-- ----------------------------
-- Table structure for informations
-- ----------------------------
DROP TABLE IF EXISTS `informations`;
CREATE TABLE `informations` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ไตเติ้ล',
  `detail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'รายละเอียด',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'รูปขนาดย่อย',
  `rstat` int(1) DEFAULT NULL COMMENT 'สถานะ',
  `create_by` bigint(20) DEFAULT NULL COMMENT 'สร้างโดย',
  `create_date` datetime DEFAULT NULL COMMENT 'สร้างเมื่อ',
  `update_by` bigint(20) DEFAULT NULL COMMENT 'แก้ไขโดย',
  `update_date` datetime DEFAULT NULL COMMENT 'แก้ไขเมื่อ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of informations
-- ----------------------------
BEGIN;
INSERT INTO `informations` VALUES (1, 'พล.อ.ประยุทธ์ ยืนยัน \"เป็นนายกรัฐมนตรีต่อ\" ไม่ไปไหน แซวอนุทินอารมณ์ดียิ้มทั้งวัน', '<p>ยังยิ้มได้</p>', NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of migration
-- ----------------------------
BEGIN;
INSERT INTO `migration` VALUES ('m000000_000000_base', 1535696053);
INSERT INTO `migration` VALUES ('m140209_132017_init', 1535696058);
INSERT INTO `migration` VALUES ('m140403_174025_create_account_table', 1535696059);
INSERT INTO `migration` VALUES ('m140504_113157_update_tables', 1535696063);
INSERT INTO `migration` VALUES ('m140504_130429_create_token_table', 1535696064);
INSERT INTO `migration` VALUES ('m140830_171933_fix_ip_field', 1535696065);
INSERT INTO `migration` VALUES ('m140830_172703_change_account_table_name', 1535696065);
INSERT INTO `migration` VALUES ('m141222_110026_update_ip_field', 1535696065);
INSERT INTO `migration` VALUES ('m141222_135246_alter_username_length', 1535696066);
INSERT INTO `migration` VALUES ('m150614_103145_update_social_account_table', 1535696068);
INSERT INTO `migration` VALUES ('m150623_212711_fix_username_notnull', 1535696068);
INSERT INTO `migration` VALUES ('m151218_234654_add_timezone_to_profile', 1535696069);
INSERT INTO `migration` VALUES ('m160929_103127_add_last_login_at_to_user_table', 1535696069);
INSERT INTO `migration` VALUES ('m140602_111327_create_menu_table', 1535696117);
INSERT INTO `migration` VALUES ('m160312_050000_create_user', 1535696117);
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init', 1535696133);
INSERT INTO `migration` VALUES ('m170907_052038_rbac_add_index_on_auth_assignment_user_id', 1535696133);
COMMIT;

-- ----------------------------
-- Table structure for moneys
-- ----------------------------
DROP TABLE IF EXISTS `moneys`;
CREATE TABLE `moneys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` decimal(20,2) DEFAULT NULL COMMENT ' จำนวนเงิน',
  `item_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'ประเภทรายการ',
  `approved` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'สถานะรายการ',
  `create_by` bigint(20) DEFAULT NULL COMMENT 'ทำรายการโดย',
  `create_date` datetime DEFAULT NULL COMMENT 'ทำรายการวันที่',
  `update_by` bigint(20) DEFAULT NULL COMMENT 'แก้ไขรายการโดย',
  `update_date` datetime DEFAULT NULL COMMENT 'แก้ไขรายการวันที่',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'หลักฐานการชำระเงิน',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of moneys
-- ----------------------------
BEGIN;
INSERT INTO `moneys` VALUES (1, 500.00, 'ฝากเงิน', 'approved', 1, '2020-02-23 12:18:50', NULL, NULL, NULL);
INSERT INTO `moneys` VALUES (2, 200.00, 'ฝากเงิน', 'approved', 1, '2020-02-23 12:31:41', NULL, NULL, NULL);
INSERT INTO `moneys` VALUES (3, 200.00, 'ฝากเงิน', 'approved', 1, '2020-02-23 12:32:02', NULL, NULL, NULL);
INSERT INTO `moneys` VALUES (4, 150.00, 'ฝากเงิน', 'approved', 1, '2020-02-23 12:32:34', NULL, NULL, NULL);
INSERT INTO `moneys` VALUES (5, 300.00, 'ฝากเงิน', 'approved', 1, '2020-02-23 12:32:48', NULL, NULL, NULL);
INSERT INTO `moneys` VALUES (6, 10000.00, 'ฝากเงิน', 'approved', 1, '2020-02-23 18:13:45', NULL, NULL, NULL);
INSERT INTO `moneys` VALUES (7, 400.00, 'ฝากเงิน', 'approved', 1, '2020-02-23 21:17:02', NULL, NULL, NULL);
INSERT INTO `moneys` VALUES (8, 10.00, 'ฝากเงิน', 'approved', 1, '2020-02-23 21:17:45', NULL, NULL, NULL);
INSERT INTO `moneys` VALUES (10, 10.00, 'ถอนเงิน', 'approved', 1, '2020-02-23 21:59:23', NULL, NULL, NULL);
INSERT INTO `moneys` VALUES (11, 10.00, 'ฝากเงิน', 'approved', 1, '2020-02-23 22:22:47', NULL, NULL, NULL);
INSERT INTO `moneys` VALUES (12, 10.00, 'ฝากเงิน', 'approved', 1, '2020-02-23 22:28:04', NULL, NULL, NULL);
INSERT INTO `moneys` VALUES (13, 20.00, 'ฝากเงิน', 'approved', 1, '2020-02-23 22:28:25', NULL, NULL, NULL);
INSERT INTO `moneys` VALUES (14, 590.00, 'ฝากเงิน', 'approved', 1, '2020-02-23 22:46:05', NULL, '2020-02-24 16:08:34', '2020022416083432.png');
INSERT INTO `moneys` VALUES (15, 20.00, 'ฝากเงิน', 'warning', 1, '2020-02-23 22:57:37', NULL, NULL, NULL);
INSERT INTO `moneys` VALUES (16, 200.00, 'ฝากเงิน', 'warning', 1, '2020-02-24 12:36:24', NULL, '2020-02-24 16:09:07', '202002241609072.jpg');
INSERT INTO `moneys` VALUES (17, 10.00, 'ฝากเงิน', 'warning', 1, '2020-02-24 12:42:54', NULL, '2020-02-24 16:10:02', '2020022416100246.png');
INSERT INTO `moneys` VALUES (18, 100.00, 'ฝากเงิน', 'warning', 1, '2020-02-26 11:55:56', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Label',
  `value` longtext COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of options
-- ----------------------------
BEGIN;
INSERT INTO `options` VALUES (1, 'about', '<p>โอเค ทุกอย่าง? <span style=\"font-family: Impact,Charcoal,sans-serif;\">5555</span></p><p><br></p>');
INSERT INTO `options` VALUES (2, 'contact', '<p>มีปัญหาอะไร ติดต่อ &quot;<strong>เพื่อนโช</strong><strong>ค&quot;</strong></p>');
INSERT INTO `options` VALUES (3, 'initial_name_app', 'DRH');
INSERT INTO `options` VALUES (4, 'name_app', 'Billing Manager\r\n');
INSERT INTO `options` VALUES (5, 'storageUrl', 'http://storage.kmoney.local/');
INSERT INTO `options` VALUES (6, 'home', '<div class=\"row\"><div class=\"col-md-6\"><div class=\"col-md-12\" style=\"background:#fff;border-radius:3px;padding: 35px;\"><h2 class=\"text-center\"><a href=\"https://billingtest.dconhub.com/bill-items\"><span style=\"color: rgb(44, 130, 201);\">{{stbill.allbill}}</span></a></h2><div class=\"text-center\"><a href=\"https://billingtest.dconhub.com/bill-items\">บิลทั้งหมด</a></div></div></div><div class=\"col-md-6\"><div class=\"col-md-12\" style=\"background:#fff;border-radius:3px;padding: 35px;\"><h2 class=\"text-center\"><a href=\"https://billingtest.dconhub.com/bill-items/index?BillItems%5Bbillref%5D=&BillItems%5Bstatus%5D=1\"><span style=\"color: rgb(44, 130, 201);\">{{stbill.normalbill}}</span></a></h2><div class=\"text-center\"><a href=\"https://billingtest.dconhub.com/bill-items/index?BillItems%5Bbillref%5D=&BillItems%5Bstatus%5D=1\">บิลปกติ</a></div></div></div></div><div class=\"row\" style=\"margin-top:20px;\"><div class=\"col-md-6\"><div class=\"col-md-12\" style=\"background:#fff;border-radius:3px;padding: 35px;\"><h2 class=\"text-center\"><a href=\"https://billingtest.dconhub.com/bill-items?rstat=0\"><span style=\"color: rgb(250, 197, 28);\">{{stbill.closebill}}</span></a></h2><div class=\"text-center\"><a href=\"https://billingtest.dconhub.com/bill-items?rstat=0\">ปิดบิล</a></div></div></div><div class=\"col-md-6\"><div class=\"col-md-12\" style=\"background:#fff;border-radius:3px;padding: 35px;\"><h2 class=\"text-center\"><span style=\"color: rgb(243, 121, 52);\">{{billtype.pos}}</span></h2><div class=\"text-center\">บิล POS</div></div></div></div>');
INSERT INTO `options` VALUES (7, 'footer', 'Footer');
INSERT INTO `options` VALUES (9, 'skin', 'skin-blue');
INSERT INTO `options` VALUES (10, 'logoImg', 'https://storage.dconhub.com/images/dconhub.png');
INSERT INTO `options` VALUES (11, 'sql_backup', 'mysqldump billing_test --host=localhost --password=\'Chanpan!((#\' --user=admin --single-transaction >/var/www/html/php/billing_test/storage/web/source/backup/');
INSERT INTO `options` VALUES (12, 'backup_path', '/var/www/html/php/billing_test/storage/web/source/backup');
INSERT INTO `options` VALUES (13, 'url_backup', 'https://billingteststorage.dconhub.com/source/backup/');
COMMIT;

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar_base_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sitecode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cashier` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of profile
-- ----------------------------
BEGIN;
INSERT INTO `profile` VALUES (1, 'nuttaphon chanpans', 'chanpan.nuttaphon1993@gmail.com', 'chanpan.nuttaphon1993@gmail.com', 'd70f6226ff8caba303baede9f0892c0e', '', '', '07/08/1993', NULL, 'nuttaphon', 'chanpan', '0650859480', '1/XkWpS9-IcNKS4DM_EBjdmjGPD6L4dmX7.jpg', 'https://billstorage.dconhub.com/source', NULL, '');
INSERT INTO `profile` VALUES (4, 'JIRAPONG RR', 'jirapong_r@hotmail.com', 'jirapong_r@hotmail.com', '2b722c99c255accddf26e811da7baada', NULL, NULL, '15/08/1973', NULL, 'Jirapong', 'Rungrojnimitchai', '0819759387', '1/ABjlmekUPI3hfttq0Cp4a5lLAaa-PedZ.jpg', 'https://billstorage.dconhub.com/source', NULL, '0001');
INSERT INTO `profile` VALUES (5, 'DAMRONG 001', 'damrong_con@hotmail.com', 'damrong_con@hotmail.com', 'a5fd925423cab56b665a51b0c815e969', NULL, NULL, NULL, NULL, 'DAMRONG', '001', ' ', NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (6, 'Chanpan Nuttaphon', 'chanpan.nuttaphon@gmail.com', 'chanpan.nuttaphon@gmail.com', '926eec8d6926f51c37aedd9b3faa3702', NULL, NULL, '', NULL, 'Chanpan', 'Nuttaphon', '', NULL, NULL, NULL, '1090');
INSERT INTO `profile` VALUES (7, 'วิภาวรรณ วิรญาติ', 'vipawan_wi@hotmail.com', 'vipawan_wi@hotmail.com', '8d63e19aae26acca082e3bcd32e2690f', NULL, NULL, '', NULL, 'วิภาวรรณ', 'วิริญาติ', '0850044429', '1/reNxoP7vxy9OWzxcmRtTa0lGHImAUjSp.jpg', 'https://billstorage.dconhub.com/source', NULL, '02100');
INSERT INTO `profile` VALUES (8, 'บูษญากร โคกสีกุล', 'budsaya_DBH@hotmail.com', 'budsaya_DBH@hotmail.com', '684a0c93f383f535166bff1a5b7cada1', NULL, NULL, '', NULL, 'บูษญากร', 'โคกสีกุล', '0834063889', '1/ER8EOc62PE3rLWuKRVnISqUljXCV9NtM.jpg', 'https://billstorage.dconhub.com/source', NULL, '02200');
INSERT INTO `profile` VALUES (9, 'เนาวรัตน์ สาระโว', 'damrong_com2010@hotmail.com', 'damrong_com2010@hotmail.com', 'd66214754de0833ef4b87ebdfa977970', NULL, NULL, '', NULL, 'เนาวรัตน์', 'สาระโว', '0823115588', '1/RmAOHkTiBrvRSSDesUvakI6HAtWaT632.jpg', 'https://billstorage.dconhub.com/source', NULL, '02300');
INSERT INTO `profile` VALUES (10, 'อาทิตยาพรรณ บุญค้ำ', 'Atitayapan1986@gmail.com', 'Atitayapan1986@gmail.com', '641532835480342343c30c966170486c', NULL, NULL, '', NULL, 'อาทิตยาพรรณ', 'บุญค้ำ', '0815446609', '1/_x9cfASeb4q-WgC9d8R_-9MErBCHfMgL.jpg', 'https://billstorage.dconhub.com/source', NULL, '0261');
INSERT INTO `profile` VALUES (11, 'โกสิน สีหาราช', 'kosinsinarach@gmail.com', 'kosinsinarach@gmail.com', 'dbdd355400bcc02b1f35e50dab12a28b', NULL, NULL, '', NULL, 'โกสิน', 'สีหาราช', '0815446609', '1/U2efIBuMJSBdUnxuXO0haLJJ61mTLazf.jpg', 'https://billstorage.dconhub.com/source', NULL, '0720');
INSERT INTO `profile` VALUES (12, 'สุพิชญา ไชยราช', 'Supichayachairat@gmail.com', 'Supichayachairat@gmail.com', '6dd712ca31a842fac8a7f99d69639d35', NULL, NULL, '', NULL, 'สุพิชญา', 'ไชยราช', '0650063782', '1/RyuX9YuEi6riuitVRaw1WzOi-WQdhJtV.jpg', 'https://billstorage.dconhub.com/source', NULL, '');
INSERT INTO `profile` VALUES (13, 'กุลชิดา อ่านนามสกุลไม่ออก', 'kultida76@hotmail.com', 'kultida76@hotmail.com', '4e7acd667d6c846267506e7c1cdbfdef', NULL, NULL, '', NULL, 'กุลธิดา', 'RR', '0881158118', NULL, NULL, NULL, '0012');
INSERT INTO `profile` VALUES (14, 'Sale Sale1', 'sale1@gmail.com', 'sale1@gmail.com', '499458ad798d6c7cbac720c2d4573462', NULL, NULL, NULL, NULL, 'Sale', 'Sale1', '0815443322', NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (15, 'แจ่มจันทร์ รุ่งโรจน์นิมิตชัย', 'jamjun@gmail.com', 'jamjun@gmail.com', '5e08c5347e16471d24cf372aedb71ed7', NULL, NULL, '', NULL, 'แจ่มจันทร์', 'รุ่งโรจน์นิมิตชัย', '0898419592', '1/nhKryJaDTJVI08h3IqsYVJjLKfqvZZA6.jpg', 'https://billstorage.dconhub.com/source', NULL, '0021');
COMMIT;

-- ----------------------------
-- Table structure for skin
-- ----------------------------
DROP TABLE IF EXISTS `skin`;
CREATE TABLE `skin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of skin
-- ----------------------------
BEGIN;
INSERT INTO `skin` VALUES (1, 'Blue', 'skin-blue', 1);
INSERT INTO `skin` VALUES (2, 'Black', 'skin-black', NULL);
INSERT INTO `skin` VALUES (3, 'Purple', 'skin-purple', NULL);
INSERT INTO `skin` VALUES (4, 'Green', 'skin-green', NULL);
INSERT INTO `skin` VALUES (5, 'Red', 'skin-red', NULL);
INSERT INTO `skin` VALUES (6, 'Yellow', 'skin-yellow', NULL);
INSERT INTO `skin` VALUES (7, 'Blue Light', 'skin-blue-light', NULL);
INSERT INTO `skin` VALUES (8, 'Black Light', 'skin-black-light', NULL);
INSERT INTO `skin` VALUES (9, 'Purple Light', 'skin-purple-light', NULL);
INSERT INTO `skin` VALUES (10, 'Green Light', 'skin-green-light', NULL);
INSERT INTO `skin` VALUES (11, 'Red Light', 'skin-red-light', NULL);
INSERT INTO `skin` VALUES (12, 'Yellow Light', 'skin-yellow-light', NULL);
COMMIT;

-- ----------------------------
-- Table structure for social_account
-- ----------------------------
DROP TABLE IF EXISTS `social_account`;
CREATE TABLE `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_unique` (`provider`,`client_id`) USING BTREE,
  UNIQUE KEY `account_unique_code` (`code`) USING BTREE,
  KEY `fk_user_account` (`user_id`) USING BTREE,
  CONSTRAINT `social_account_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for systemlog
-- ----------------------------
DROP TABLE IF EXISTS `systemlog`;
CREATE TABLE `systemlog` (
  `id` bigint(20) NOT NULL,
  `logname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logtype` int(1) DEFAULT NULL,
  `logdetail` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `rstat` int(1) DEFAULT NULL,
  `create_by` bigint(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `ip` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`) USING BTREE,
  CONSTRAINT `token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT 0,
  `last_login_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_unique_username` (`username`) USING BTREE,
  UNIQUE KEY `user_unique_email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'admin', 'chanpan.nuttaphon1993@gmail.com', '$2y$12$zpII1CblPJazOjMls22h8uoQOqhEEBl.VUJIk8Tf/sRmv4Dd0uoMS', 'KSwmb0yFT6Jf14f82pSAnAedCN44uzAQ', 1535696234, NULL, NULL, '::1', 1535696234, 1576131378, 0, 1582532331);
INSERT INTO `user` VALUES (4, 'JIRAPONG', 'jirapong_r@hotmail.com', '$2y$12$obnECeQ6R8r.lamu.Kdmo.S2OTh1Dh9TvsvfSpGQfpBChgFs3Tz6K', 'KSwmb0yFT6Jf14f82pSAnAedCN44uzAQ', 1565678613, NULL, NULL, '::1', 1565678613, 1565678613, 0, 1581994148);
INSERT INTO `user` VALUES (5, 'DAMRONG', 'damrong_con@hotmail.com', '$2y$12$i9fx7XDFuv18IT34YE.02uC6gKKcTC/1BG.Eg.nF9WTTTdr5MH6P6', 'vpl5APm8IOYBAOKvrfGH5QTEFcYGoynH', 1565678767, NULL, NULL, '::1', 1565678768, 1565678768, 0, NULL);
INSERT INTO `user` VALUES (6, 'chanpan', 'chanpan.nuttaphon@gmail.com', '$2y$12$ymGsWzc/.WbEKiaTbaElwOip9.TzqpJwdRXdBxHQCeZE2/ZlMlQI2', '0ykL2IQoktQgSUpB3V_E038XUblDZP3e', 1565679792, NULL, NULL, '::1', 1565679792, 1565679792, 0, NULL);
INSERT INTO `user` VALUES (7, 'vipawan_wi@hotmail.com', 'vipawan_wi@hotmail.com', '$2y$12$U8YeoN4agc7XWg4gDnO8Teo/l6Brn3F58BJWlje28zurSkg.IIMZi', 'lu8MSwi12RUDBGcAcrIrB6w2lM-Nk__J', 1566556469, NULL, NULL, '::1', 1566556470, 1566556470, 0, NULL);
INSERT INTO `user` VALUES (8, 'budsaya_DBH@hotmail.com', 'budsaya_DBH@hotmail.com', '$2y$12$nf9siWQSS/wYdP8QS1QaGe1YkHEME0kv..omxHsQ032hwWcwhlT76', 'ZeHGqAsSA2x0LyruVeyzV1Ez_3Eb_dZc', 1566556550, NULL, NULL, '::1', 1566556550, 1566556550, 0, NULL);
INSERT INTO `user` VALUES (9, 'damrong_com2010@hotmail.com', 'damrong_com2010@hotmail.com', '$2y$12$8jtlEjvMXZ2LKSBq4i4eX.NbJAwga8Tb2EXzMwawMEyD9jyXHMGo.', 'Ftl3peKfniS1TjICUR8UbHpPDqEjZe_m', 1566556611, NULL, NULL, '::1', 1566556612, 1566556612, 0, NULL);
INSERT INTO `user` VALUES (10, 'Atitayapan1986@gmail.com', 'Atitayapan1986@gmail.com', '$2y$12$9wmhab/5RpE/C..GxXki/OEMtpjZLjr2kRycFdIuKTggMPGlUoLqq', '8OWxyiQkMoHiOiYCNJiSOcwYyyr3Oicf', 1566556677, NULL, NULL, '::1', 1566556677, 1566556677, 0, NULL);
INSERT INTO `user` VALUES (11, 'kosinsinarach@gmail.com', 'kosinsinarach@gmail.com', '$2y$12$SymhRnA.NaEn7RyLk8CaVO9aS9YsjYpWX9D0oFzkIHZhQDNN4uMYC', 'I2uFzdD4GtD0IBerWAM5h9jAdVCgMFto', 1566556729, NULL, NULL, '::1', 1566556730, 1566556730, 0, NULL);
INSERT INTO `user` VALUES (12, 'Supichayachairat@gmail.com', 'Supichayachairat@gmail.com', '$2y$12$DB3TFqejkJLLqbTplVN2kekHZUFzCpn2DcLia.w5TjZ6l/aPZMzHe', 'Gb8HgM-0iFigwiaoXImUc50w2Qh4Vybt', 1566556782, NULL, NULL, '::1', 1566556783, 1566556783, 0, NULL);
INSERT INTO `user` VALUES (13, 'kultida76@hotmail.com', 'kultida76@hotmail.com', '$2y$12$KSUueJVm6e1sNJAwMNAHT.a2JEHcqQOvtiv8hOpKH9eCqJNo8ItfC', 'dNYT8zvbAEWZlxN01pZnE9mQi6GhAUum', 1566556886, NULL, NULL, '::1', 1566556886, 1566556886, 0, NULL);
INSERT INTO `user` VALUES (14, 'sale1', 'sale1@gmail.com', '$2y$12$oq/22wGQskt7PE9ySyftPuGBaWf2ytueHjS6DJha8lhz3qZdra9xa', 'Mv4A0U87vxDNdB8eBwBOtCTGZJrHyYyh', 1566570661, NULL, NULL, '14.207.201.179', 1566570662, 1566570662, 0, 1579166222);
INSERT INTO `user` VALUES (15, 'JAMJUN', 'jamjun@gmail.com', '$2y$12$C5e7pZmz85y7BfetDM/BuuXHoXUoG6pb4a908jTv0nFcPV.uryef.', '366Sc_C_Apza53Wopw1jEf4-FrhmmsYK', 1569586537, NULL, NULL, '14.207.200.213', 1569586537, 1569586537, 0, NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
