/*
 Navicat Premium Data Transfer

 Source Server         : MySQL_LOCAL
 Source Server Type    : MySQL
 Source Server Version : 100428
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 100428
 File Encoding         : 65001

 Date: 26/11/2023 13:18:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for buys
-- ----------------------------
DROP TABLE IF EXISTS `buys`;
CREATE TABLE `buys`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `date` date NOT NULL,
  `final_price` decimal(5, 2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_users_buys_01`(`user`) USING BTREE,
  CONSTRAINT `fk_users_buys_01` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of buys
-- ----------------------------
INSERT INTO `buys` VALUES (1, 3, '2023-11-25', 30.29);

-- ----------------------------
-- Table structure for buys_products
-- ----------------------------
DROP TABLE IF EXISTS `buys_products`;
CREATE TABLE `buys_products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buy` int(255) NOT NULL,
  `product` int(255) NOT NULL,
  `price` decimal(5, 2) NOT NULL,
  `quantity` int(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_products_buysproducts_01`(`product`) USING BTREE,
  INDEX `fk_buys_buysproducts_01`(`buy`) USING BTREE,
  CONSTRAINT `fk_buys_buysproducts_01` FOREIGN KEY (`buy`) REFERENCES `buys` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_products_buysproducts_01` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of buys_products
-- ----------------------------
INSERT INTO `buys_products` VALUES (1, 1, 1, 10.00, 2);
INSERT INTO `buys_products` VALUES (2, 1, 2, 10.29, 1);

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, 'Ferretería');
INSERT INTO `categories` VALUES (2, 'Electrodomésticos');
INSERT INTO `categories` VALUES (3, 'Hogar');
INSERT INTO `categories` VALUES (4, 'Bebidas');
INSERT INTO `categories` VALUES (5, 'Óptica');
INSERT INTO `categories` VALUES (6, 'Alimentos');
INSERT INTO `categories` VALUES (7, 'Carnes');
INSERT INTO `categories` VALUES (8, 'Higiene personal');
INSERT INTO `categories` VALUES (9, 'Ropa');
INSERT INTO `categories` VALUES (10, 'Calzado');
INSERT INTO `categories` VALUES (11, 'Transporte');

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_products_productcategory_01`(`product`) USING BTREE,
  INDEX `fk_categories_productcategory_01`(`category`) USING BTREE,
  CONSTRAINT `fk_categories_productcategory_01` FOREIGN KEY (`category`) REFERENCES `categories` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_products_productcategory_01` FOREIGN KEY (`product`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (1, 1, 6);
INSERT INTO `product_category` VALUES (2, 2, 4);
INSERT INTO `product_category` VALUES (3, 2, 6);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `quantity_available` int(11) NOT NULL,
  `price` decimal(5, 2) NOT NULL,
  `discount_rate` smallint(3) NOT NULL,
  `active` bit(1) NOT NULL,
  `purchase_limit_per_user` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'Leche entera en polvo SanCor (1 kg / 2.2 lb)', 'Leche entera en polvo SanCor (1 kg / 2.2 lb), no tiene gluten. Elaborada con leche pura de vaca y el proceso de secado es por el método de atomización. Composición típica: Lactosa (33%), materia grasa (28%), proteínas (24%), minerales 6% y humedad 3%.', 100, 10.00, 0, b'1', 10, 1);
INSERT INTO `products` VALUES (2, 'Refresco tukola Ciego Montero (6 x 1500 ml)', 'Ingredientes: Agua carbonatada, azúcar, aromas, ácido fosfórico, caramelo, benzonato sódico, cafeína, edulcorante 950.', 52, 10.83, 5, b'1', 1, 1);

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'user');
INSERT INTO `roles` VALUES (2, 'provider');
INSERT INTO `roles` VALUES (3, 'admin');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` decimal(50, 0) NOT NULL,
  `registration_date` date NOT NULL,
  `active` bit(1) NOT NULL,
  `role` int(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_roles_users_01`(`role`) USING BTREE,
  CONSTRAINT `fk_roles_users_01` FOREIGN KEY (`role`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Alex Ernesto Salazar Parra', 'alexernestosp@gmail.com', 123, '2023-11-25', b'1', 2);
INSERT INTO `users` VALUES (2, 'Ramiro Mej\'ias Rodr\'iguez', 'ramiro.mejias@gmail.com', 123, '2023-11-25', b'1', 3);
INSERT INTO `users` VALUES (3, 'Anegl Rilder Salazar Calderín', 'angel.salazar@gmail.com', 123, '2023-11-25', b'1', 1);

SET FOREIGN_KEY_CHECKS = 1;
