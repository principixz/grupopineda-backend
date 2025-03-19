/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100138
 Source Host           : localhost:3306
 Source Schema         : restaurante

 Target Server Type    : MySQL
 Target Server Version : 100138
 File Encoding         : 65001

 Date: 12/01/2021 07:25:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for almacenes
-- ----------------------------
DROP TABLE IF EXISTS `almacenes`;
CREATE TABLE `almacenes`  (
  `almacen_id` int(11) NOT NULL AUTO_INCREMENT,
  `almacen_descripcion` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `empresa_id` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `almacen_direccion` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_sede` int(11) NULL DEFAULT NULL,
  `almacen_estado` int(11) NULL DEFAULT 1,
  `almacen_uso` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`almacen_id`) USING BTREE,
  INDEX `id_sede`(`id_sede`) USING BTREE,
  CONSTRAINT `almacenes_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of almacenes
-- ----------------------------
INSERT INTO `almacenes` VALUES (1, 'Almacen Principal', '', 'Selvatiña', 1, 1, 1);

-- ----------------------------
-- Table structure for amortizacioncompra
-- ----------------------------
DROP TABLE IF EXISTS `amortizacioncompra`;
CREATE TABLE `amortizacioncompra`  (
  `amo_cuotacompra` int(11) NOT NULL,
  `amo_movimiento` int(11) NOT NULL,
  `amo_monto` decimal(10, 2) NULL DEFAULT NULL,
  INDEX `amo_movimiento`(`amo_movimiento`) USING BTREE,
  INDEX `amortizacioncompra_ibfk_2`(`amo_cuotacompra`) USING BTREE,
  CONSTRAINT `amortizacioncompra_ibfk_1` FOREIGN KEY (`amo_movimiento`) REFERENCES `movimiento` (`mov_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `amortizacioncompra_ibfk_2` FOREIGN KEY (`amo_cuotacompra`) REFERENCES `cuotacompra` (`cuo_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for amortizacionpago
-- ----------------------------
DROP TABLE IF EXISTS `amortizacionpago`;
CREATE TABLE `amortizacionpago`  (
  `amor_pagoempleado_idamorpa` int(11) NOT NULL AUTO_INCREMENT,
  `amor_pagoempleado_peid` int(11) NULL DEFAULT NULL,
  `amor_pagoempleado_idtipomov` int(11) NULL DEFAULT NULL,
  `amor_pagoempleado_fechapago` date NULL DEFAULT NULL,
  `amor_pagoempleado_fechafalta` date NULL DEFAULT NULL,
  `amor_pagoempleado_faltaregistro` date NULL DEFAULT NULL,
  `amor_pagoempleado_monto` decimal(11, 2) NULL DEFAULT NULL,
  `id_movimiento` int(11) NULL DEFAULT NULL,
  `amor_pagoempleado_estadopago` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  `amor_pagoempleado_estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `amor_pagoempleado_idadelanto` int(11) NULL DEFAULT NULL,
  `amor_pagoempleado_iddescuento` int(11) NULL DEFAULT NULL,
  `amor_pagoempleado_idfalta` int(11) NULL DEFAULT NULL,
  `bonoficaciones` decimal(11, 2) NULL DEFAULT NULL,
  `saludmonto` decimal(11, 2) NULL DEFAULT NULL,
  `afpmonto` decimal(11, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`amor_pagoempleado_idamorpa`) USING BTREE,
  INDEX `fk_empleadoidpago`(`amor_pagoempleado_peid`) USING BTREE,
  INDEX `fk_empleado_tipomov`(`amor_pagoempleado_idtipomov`) USING BTREE,
  INDEX `fk_empleadoidmovimiento`(`id_movimiento`) USING BTREE,
  INDEX `fk_adelanto`(`amor_pagoempleado_idadelanto`) USING BTREE,
  INDEX `fk_descuento`(`amor_pagoempleado_iddescuento`) USING BTREE,
  INDEX `fk_falta`(`amor_pagoempleado_idfalta`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for amortizacionventa
-- ----------------------------
DROP TABLE IF EXISTS `amortizacionventa`;
CREATE TABLE `amortizacionventa`  (
  `amo_ventaid` int(11) NOT NULL AUTO_INCREMENT,
  `amo_cuotaventa` int(11) NOT NULL,
  `amo_movimiento` int(11) NOT NULL,
  `amo_monto` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`amo_ventaid`) USING BTREE,
  INDEX `amortizacionventa_ibfk_1`(`amo_movimiento`) USING BTREE,
  INDEX `amortizacionventa_ibfk_2`(`amo_cuotaventa`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for bancos
-- ----------------------------
DROP TABLE IF EXISTS `bancos`;
CREATE TABLE `bancos`  (
  `banco_idbanco` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  `abreviatura` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`banco_idbanco`) USING BTREE,
  INDEX `banco_idbanco`(`banco_idbanco`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for caja
-- ----------------------------
DROP TABLE IF EXISTS `caja`;
CREATE TABLE `caja`  (
  `id_caja` int(11) NOT NULL AUTO_INCREMENT,
  `caja_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `caja_estado` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id_caja`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of caja
-- ----------------------------
INSERT INTO `caja` VALUES (1, 'Caja Fisica', 1);
INSERT INTO `caja` VALUES (2, 'Caja Virtual', 1);

-- ----------------------------
-- Table structure for categoria_producto
-- ----------------------------
DROP TABLE IF EXISTS `categoria_producto`;
CREATE TABLE `categoria_producto`  (
  `categoria_producto_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_producto_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `categoria_producto_estado` int(11) NULL DEFAULT 1,
  `id_sede` int(11) NULL DEFAULT NULL,
  `categoria_imagen` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`categoria_producto_id`) USING BTREE,
  INDEX `id_sede`(`id_sede`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of categoria_producto
-- ----------------------------
INSERT INTO `categoria_producto` VALUES (1, 'Paletas', 1, 1, 'fadc310b5029e33b50ed10b6c95b9d2456744663_685727875163361_2148815547423260672_n.jpg');
INSERT INTO `categoria_producto` VALUES (2, 'erwerwrwr', 0, 1, 'd28d2bcf9f51226b3f753d259bc8ada043961579-de-fondo-sin-fisuras-plana-con-rebanadas-de-pastel-dibujo-lineal-y-tazas-de-té-postre-tema-fondo-brill.jpg');
INSERT INTO `categoria_producto` VALUES (3, 'helado', 1, 1, 'img_504591.png');
INSERT INTO `categoria_producto` VALUES (4, 'cremolada', 1, 1, 'default.jpg');
INSERT INTO `categoria_producto` VALUES (5, 'cremoladas', 0, 1, 'default.jpg');
INSERT INTO `categoria_producto` VALUES (6, 'cafeteria', 1, 1, 'default.jpg');
INSERT INTO `categoria_producto` VALUES (7, 'sándwich', 1, 1, 'default.jpg');
INSERT INTO `categoria_producto` VALUES (8, 'postres', 1, 1, 'default.jpg');
INSERT INTO `categoria_producto` VALUES (9, 'bebida', 1, 1, 'default.jpg');
INSERT INTO `categoria_producto` VALUES (10, 'producción de helado', 1, 1, 'default.jpg');
INSERT INTO `categoria_producto` VALUES (11, 'bolsas', 1, 1, 'default.jpg');
INSERT INTO `categoria_producto` VALUES (12, 'alitas ', 1, 1, '825d7864d5e263f11a765e525d3f2d18.jpg');
INSERT INTO `categoria_producto` VALUES (13, 'delivery', 1, 1, 'default.jpg');

-- ----------------------------
-- Table structure for clase
-- ----------------------------
DROP TABLE IF EXISTS `clase`;
CREATE TABLE `clase`  (
  `clase_id` int(11) NOT NULL AUTO_INCREMENT,
  `clase_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `clase_estado` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`clase_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of clase
-- ----------------------------
INSERT INTO `clase` VALUES (1, 'AGUA', 1);
INSERT INTO `clase` VALUES (2, 'BARQUILLOS', 1);
INSERT INTO `clase` VALUES (3, 'BARQUIMIEL', 1);

-- ----------------------------
-- Table structure for clientes
-- ----------------------------
DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes`  (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_nombres` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cliente_direccion` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cliente_dni` char(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cliente_ruc` char(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cliente_telefono` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cliente_celular` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cliente_tipodocumento` int(11) NULL DEFAULT NULL,
  `cliente_email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  `empresa_ruc` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cliente_ubicacion` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipo_cliente_id` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`cliente_id`) USING BTREE,
  INDEX `cliente_tipo_cliente`(`tipo_cliente_id`) USING BTREE,
  CONSTRAINT `cliente_tipo_cliente` FOREIGN KEY (`tipo_cliente_id`) REFERENCES `tipo_cliente` (`tipo_cliente_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of clientes
-- ----------------------------
INSERT INTO `clientes` VALUES (1, 'Cliente Varios', '-', '0000001', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 1);
INSERT INTO `clientes` VALUES (38, 'jimmy jeiensto carbajal sanchez', 'psje. humberto pinedo 130 ', '75270586', NULL, NULL, '933122626', NULL, 'jimmycarbajalsanchez@gmial.com', '1', '10403634951', NULL, 1);
INSERT INTO `clientes` VALUES (39, 'prueba', 'psje. humberto pinedo', '10752705866', NULL, NULL, '933122626', NULL, 'jj@gmail.com', '1', '10403634951', NULL, 1);
INSERT INTO `clientes` VALUES (40, 'martin jose', 'jr. barrutia 129', '75270588', NULL, NULL, '933122626', NULL, 'psje.', '1', '10403634951', NULL, 1);
INSERT INTO `clientes` VALUES (41, 'jimmy ', 'psje. humberto pinedo', '75270588', NULL, NULL, '933122626', NULL, 'jim@gmail.com', '1', '10403634951', NULL, 1);
INSERT INTO `clientes` VALUES (43, 'wiliam carbajal', 'callle lima 156', '12345678', NULL, NULL, '9614363', NULL, '', '1', '10403634951', NULL, 1);
INSERT INTO `clientes` VALUES (44, 'jimmy carbajal', 'jr. maynas 100', '75270587', NULL, NULL, '933122625', NULL, '', '1', '10403634951', NULL, 1);

-- ----------------------------
-- Table structure for compras
-- ----------------------------
DROP TABLE IF EXISTS `compras`;
CREATE TABLE `compras`  (
  `compra_id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_id` int(11) NULL DEFAULT NULL,
  `almacen_id` int(11) NULL DEFAULT NULL,
  `moneda_id` int(11) NULL DEFAULT NULL,
  `compra_fechaingresoalmacen` datetime(0) NULL DEFAULT NULL,
  `tipodoc_id` int(11) NULL DEFAULT NULL,
  `compra_fechacomprobante` datetime(0) NULL DEFAULT NULL,
  `compra_numcomprobante` varchar(18) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `compra_numguiaproveedor` varchar(18) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `compra_numcfacttransporte` varchar(18) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `compra_numguiatransporte` varchar(18) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `compra_importe` decimal(18, 2) NULL DEFAULT 0.00,
  `compra_igv` decimal(18, 2) NULL DEFAULT 0.00,
  `compra_total` decimal(18, 2) NULL DEFAULT 0.00,
  `estado` int(1) NULL DEFAULT 1,
  `id_tipo_pago` int(11) NULL DEFAULT NULL,
  `id_empleado` int(11) NULL DEFAULT NULL,
  `compra_credito_estado` int(11) NULL DEFAULT NULL,
  `compra_credito_cuotas` int(11) NULL DEFAULT NULL,
  `compra_monto_transporte` decimal(11, 2) NULL DEFAULT NULL,
  `compra_fecha_transporte` date NULL DEFAULT NULL,
  `compra_movimiento_transporte` int(11) NULL DEFAULT NULL,
  `compra_serie_comprobante` varchar(155) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `compra_correlativo_comprobante` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `compra_monto_cambio` decimal(10, 4) NULL DEFAULT NULL,
  `compra_idmovimiento` int(11) NULL DEFAULT NULL,
  `id_sede` int(11) NULL DEFAULT NULL,
  `compra_seri_nota_credito` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `compra_correlativo_nota_credito` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `compra_forma_pago` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`compra_id`) USING BTREE,
  INDEX `fk_proveedores_compras`(`proveedor_id`) USING BTREE,
  INDEX `fk_almacen_compras`(`almacen_id`) USING BTREE,
  INDEX `fk_monedas_compras`(`moneda_id`) USING BTREE,
  INDEX `fk_tipo_documento_compras`(`tipodoc_id`) USING BTREE,
  INDEX `id_tipo_pago`(`id_tipo_pago`) USING BTREE,
  INDEX `compra_forma_pago`(`compra_forma_pago`) USING BTREE,
  INDEX `id_empleado`(`id_empleado`) USING BTREE,
  INDEX `id_sede`(`id_sede`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of compras
-- ----------------------------
INSERT INTO `compras` VALUES (1, 15, 1, 1, '2021-01-11 11:48:52', 1, '2021-01-11 00:00:00', 'F100-1', '', '', '', 100.00, 0.00, 100.00, 1, 1, 13, 0, 0, 0.00, '0000-00-00', 0, 'F100', '1', 1.0000, 3209, 1, NULL, NULL, 1);

-- ----------------------------
-- Table structure for concepto
-- ----------------------------
DROP TABLE IF EXISTS `concepto`;
CREATE TABLE `concepto`  (
  `con_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_movimiento` int(11) NOT NULL,
  `con_descripcion` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `con_estado` int(11) NULL DEFAULT 1,
  `id_sede` int(11) NULL DEFAULT NULL,
  `con_estado_visible` int(11) NULL DEFAULT 1,
  `con_cuenta_contable` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`con_id`) USING BTREE,
  INDEX `id_tipo_movimiento`(`id_tipo_movimiento`) USING BTREE,
  INDEX `asdas`(`id_sede`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of concepto
-- ----------------------------
INSERT INTO `concepto` VALUES (1, 1, 'Ingreso de Ventas', 1, NULL, 0, '');
INSERT INTO `concepto` VALUES (2, 2, 'Egreso Compras', 1, NULL, 0, '');
INSERT INTO `concepto` VALUES (3, 2, 'Pago a Personal', 1, 1, 1, NULL);
INSERT INTO `concepto` VALUES (4, 1, 'Cobro de Servicio', 1, 1, 1, NULL);
INSERT INTO `concepto` VALUES (5, 2, 'luz', 1, 1, 1, NULL);
INSERT INTO `concepto` VALUES (6, 1, 'cobro de bufet1', 1, 1, 1, NULL);
INSERT INTO `concepto` VALUES (7, 1, 'cobro de bufet', 0, 1, 1, NULL);
INSERT INTO `concepto` VALUES (8, 2, 'agua', 1, 1, 1, NULL);
INSERT INTO `concepto` VALUES (9, 2, 'pago personal de la tienda', 1, 1, 1, NULL);
INSERT INTO `concepto` VALUES (10, 1, 'sobro de dinero que no se pudo depositar', 1, 1, 1, NULL);
INSERT INTO `concepto` VALUES (11, 2, 'pastilla', 1, 1, 1, NULL);
INSERT INTO `concepto` VALUES (12, 1, 'sobro de egreso ', 1, 1, 1, NULL);
INSERT INTO `concepto` VALUES (13, 1, '1 bola', 1, 1, 1, NULL);

-- ----------------------------
-- Table structure for contrato_personal
-- ----------------------------
DROP TABLE IF EXISTS `contrato_personal`;
CREATE TABLE `contrato_personal`  (
  `contrato_id` int(11) NOT NULL AUTO_INCREMENT,
  `contrato_fecha_inicio` date NULL DEFAULT NULL,
  `contrato_fecha_fin` date NULL DEFAULT NULL,
  `empleado_id` int(11) NULL DEFAULT NULL,
  `motivo_contrato_id` int(11) NULL DEFAULT NULL,
  `contrato_estado` int(11) NULL DEFAULT 1,
  `contrato_fecha_notificacion` date NULL DEFAULT NULL,
  `contrato_dias_notificacion` int(11) NULL DEFAULT NULL,
  `contrato_fecha_baja` date NULL DEFAULT NULL,
  PRIMARY KEY (`contrato_id`) USING BTREE,
  INDEX `empleado_id`(`empleado_id`) USING BTREE,
  INDEX `motivo_contrato_id`(`motivo_contrato_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cuentas_venta_temporal
-- ----------------------------
DROP TABLE IF EXISTS `cuentas_venta_temporal`;
CREATE TABLE `cuentas_venta_temporal`  (
  `cuentas_idtemporal` int(11) NOT NULL AUTO_INCREMENT,
  `cuentas_idventas` int(11) NULL DEFAULT NULL,
  `venta_monto` decimal(11, 2) NULL DEFAULT NULL,
  `venta_estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  `venta_idsede` int(11) NULL DEFAULT NULL,
  `venta_fechapedido` int(25) NULL DEFAULT NULL,
  `nombre_cuenta` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cuenta_estadopago` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`cuentas_idtemporal`) USING BTREE,
  INDEX `fk_ventas_cuenta`(`cuentas_idventas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cuentas_venta_temporal
-- ----------------------------
INSERT INTO `cuentas_venta_temporal` VALUES (1, 3077, 9.00, '1', 1, 1610078355, 'A', 1);
INSERT INTO `cuentas_venta_temporal` VALUES (2, 3077, 6.00, '1', 1, 1610078359, 'B', 1);
INSERT INTO `cuentas_venta_temporal` VALUES (3, 3085, 6.00, '1', 1, 1610081090, 'A', 2);
INSERT INTO `cuentas_venta_temporal` VALUES (4, 3085, 3.00, '1', 1, 1610081103, 'B', 2);
INSERT INTO `cuentas_venta_temporal` VALUES (5, 3088, 8.00, '1', 1, 1610082170, 'A', 2);
INSERT INTO `cuentas_venta_temporal` VALUES (6, 3088, 8.00, '1', 1, 1610082175, 'B', 2);
INSERT INTO `cuentas_venta_temporal` VALUES (7, 3094, 4.00, '1', 1, 1610210771, 'A', 1);
INSERT INTO `cuentas_venta_temporal` VALUES (8, 3094, 6.00, '1', 1, 1610210774, 'B', 1);
INSERT INTO `cuentas_venta_temporal` VALUES (9, 3094, 3.00, '1', 1, 1610233990, 'C', 1);

-- ----------------------------
-- Table structure for cuotacompra
-- ----------------------------
DROP TABLE IF EXISTS `cuotacompra`;
CREATE TABLE `cuotacompra`  (
  `cuo_id` int(11) NOT NULL AUTO_INCREMENT,
  `cuo_compra` int(11) NOT NULL,
  `cuo_nrocuota` int(11) NULL DEFAULT NULL,
  `cuo_fechavence` date NULL DEFAULT NULL,
  `cuo_fechacancelado` date NULL DEFAULT NULL,
  `cuo_montocuota` decimal(10, 2) NULL DEFAULT NULL,
  `cuo_montopagado` decimal(10, 2) NULL DEFAULT NULL,
  `cuo_estado` int(11) NULL DEFAULT 1,
  `tipo_moneda` int(11) NULL DEFAULT NULL,
  `cambio_dolar` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`cuo_id`) USING BTREE,
  INDEX `cuo_prestamo`(`cuo_compra`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cuotacompra_producto
-- ----------------------------
DROP TABLE IF EXISTS `cuotacompra_producto`;
CREATE TABLE `cuotacompra_producto`  (
  `cuo_id` int(11) NOT NULL AUTO_INCREMENT,
  `cuo_compra` int(11) NOT NULL,
  `cuo_nrocuota` int(11) NULL DEFAULT NULL,
  `cuo_fechavence` date NULL DEFAULT NULL,
  `cuo_fechacancelado` date NULL DEFAULT NULL,
  `cuo_montocuota` decimal(10, 2) NULL DEFAULT NULL,
  `cuo_montopagado` decimal(10, 2) NULL DEFAULT NULL,
  `cuo_estado` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`cuo_id`) USING BTREE,
  INDEX `cuo_prestamo`(`cuo_compra`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cuotaventa
-- ----------------------------
DROP TABLE IF EXISTS `cuotaventa`;
CREATE TABLE `cuotaventa`  (
  `cuo_ventaid` int(11) NOT NULL AUTO_INCREMENT,
  `cuo_venta` int(11) NULL DEFAULT NULL,
  `cuo_ventanrocuota` int(11) NULL DEFAULT NULL,
  `cuo_ventafechavence` date NULL DEFAULT NULL,
  `cuo_ventafechacancelado` date NULL DEFAULT NULL,
  `cuo_ventamontocuota` decimal(10, 2) NULL DEFAULT NULL,
  `cuo_ventamontopagado` decimal(10, 2) NULL DEFAULT NULL,
  `cuo_ventaestado` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`cuo_ventaid`) USING BTREE,
  INDEX `cuotaventa_ibfk_1`(`cuo_venta`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for departamento
-- ----------------------------
DROP TABLE IF EXISTS `departamento`;
CREATE TABLE `departamento`  (
  `id_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `observacion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `estado` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id_departamento`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for desactivar_producto
-- ----------------------------
DROP TABLE IF EXISTS `desactivar_producto`;
CREATE TABLE `desactivar_producto`  (
  `desactivar_producto_id` int(11) NOT NULL,
  `desactivar_producto_fecha` date NULL DEFAULT NULL,
  `desactivar_producto_estado` int(11) NULL DEFAULT 1,
  `producto_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`desactivar_producto_id`) USING BTREE,
  INDEX `producto_id`(`producto_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detalle_compras
-- ----------------------------
DROP TABLE IF EXISTS `detalle_compras`;
CREATE TABLE `detalle_compras`  (
  `id_detalle_compra` int(11) NOT NULL AUTO_INCREMENT,
  `compra_id` int(11) NOT NULL,
  `producto_id` int(11) NULL DEFAULT NULL,
  `detalle_compra_cantidad` decimal(18, 3) NULL DEFAULT NULL,
  `detalle_compra_preciounitatio` decimal(18, 4) NULL DEFAULT NULL,
  `detalle_compra_precio` decimal(18, 4) NULL DEFAULT NULL,
  `detalle_compra_subtotal` decimal(18, 2) NULL DEFAULT NULL,
  `detalle_compra_igv` decimal(18, 4) NULL DEFAULT NULL,
  `detalle_compra_valor_descuento` decimal(10, 2) NULL DEFAULT NULL,
  `detalle_compra_detalle_unidad_medida` int(11) NULL DEFAULT NULL,
  `tipo_igv_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_detalle_compra`) USING BTREE,
  INDEX `fk_compras_detalles_compras`(`compra_id`) USING BTREE,
  INDEX `fk_productos_detalles_compras`(`producto_id`) USING BTREE,
  INDEX `detalle_compra_detalle_unidad_medida`(`detalle_compra_detalle_unidad_medida`) USING BTREE,
  INDEX `dasdasd`(`tipo_igv_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detalle_compras
-- ----------------------------
INSERT INTO `detalle_compras` VALUES (1, 1, 57, 10.000, 10.0000, 100.0000, 100.00, 0.0000, 0.00, 3, 8);

-- ----------------------------
-- Table structure for detalle_cuentas_temporal
-- ----------------------------
DROP TABLE IF EXISTS `detalle_cuentas_temporal`;
CREATE TABLE `detalle_cuentas_temporal`  (
  `detalle_iddetalletemporal` int(11) NOT NULL AUTO_INCREMENT,
  `cuentas_idtemporal` int(11) NULL DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cantidad` int(11) NULL DEFAULT NULL,
  `precio` decimal(8, 2) NULL DEFAULT NULL,
  `cod_producto_venta` int(255) NULL DEFAULT NULL,
  `id_venta` int(11) NULL DEFAULT NULL,
  `observaciones` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `estado_pedido` int(1) NULL DEFAULT 1,
  `fecha_preparar` datetime(0) NULL DEFAULT NULL,
  `detalle_estado_preparado` int(1) NULL DEFAULT 1,
  `id_tipoentrega` int(11) NULL DEFAULT NULL,
  `observacion_eliminado` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `estado_cuenta` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  `importe` float(11, 2) NULL DEFAULT NULL,
  `id_detalle_producto` int(11) NULL DEFAULT 0,
  `estado_descuento` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`detalle_iddetalletemporal`) USING BTREE,
  INDEX `fk_cuentas-productos`(`cod_producto_venta`) USING BTREE,
  INDEX `detalle_cuentas_temporal_ibfk_2`(`cuentas_idtemporal`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detalle_cuentas_temporal
-- ----------------------------
INSERT INTO `detalle_cuentas_temporal` VALUES (1, 1, 'paleta de oreo', 1, 3.00, 5, 3077, NULL, 1, '2021-01-07 00:00:00', 1, NULL, NULL, '1', NULL, 0, 6107);
INSERT INTO `detalle_cuentas_temporal` VALUES (2, 1, 'paleta de maní ', 2, 3.00, 4, 3077, NULL, 1, '2021-01-07 00:00:00', 1, NULL, NULL, '1', NULL, 0, 6108);
INSERT INTO `detalle_cuentas_temporal` VALUES (3, 2, 'paleta de aguaje', 2, 3.00, 1, 3077, NULL, 1, '2021-01-07 00:00:00', 1, NULL, NULL, '1', NULL, 0, 6109);
INSERT INTO `detalle_cuentas_temporal` VALUES (4, 3, 'paleta de aguaje', 1, 3.00, 1, 3085, NULL, 1, '2021-01-07 00:00:00', 1, NULL, NULL, '1', NULL, 0, 6121);
INSERT INTO `detalle_cuentas_temporal` VALUES (5, 3, 'paleta de café', 1, 3.00, 3, 3085, NULL, 1, '2021-01-07 00:00:00', 1, NULL, NULL, '1', NULL, 0, 6122);
INSERT INTO `detalle_cuentas_temporal` VALUES (6, 4, 'paleta de chocolate', 1, 3.00, 2, 3085, NULL, 2, '2021-01-07 00:00:00', 1, NULL, NULL, '1', NULL, 0, 6123);
INSERT INTO `detalle_cuentas_temporal` VALUES (7, 5, '2 bolas de helado', 2, 4.00, 15, 3088, NULL, 1, '2021-01-08 00:00:00', 1, NULL, NULL, '1', NULL, 0, 6127);
INSERT INTO `detalle_cuentas_temporal` VALUES (8, 6, '2 bolas de helado', 2, 4.00, 15, 3088, NULL, 1, '2021-01-08 00:00:00', 1, NULL, NULL, '1', NULL, 0, 6127);
INSERT INTO `detalle_cuentas_temporal` VALUES (9, 7, 'cremolada de aguaje', 1, 4.00, 9, 3094, NULL, 1, '2021-01-09 00:00:00', 1, NULL, NULL, '1', NULL, 0, 6136);
INSERT INTO `detalle_cuentas_temporal` VALUES (10, 8, 'paleta de café', 2, 3.00, 3, 3094, NULL, 1, '2021-01-09 00:00:00', 1, NULL, NULL, '1', NULL, 0, 6137);
INSERT INTO `detalle_cuentas_temporal` VALUES (11, 9, 'paleta de maní ', 1, 3.00, 4, 3094, NULL, 1, '2021-01-09 00:00:00', 1, NULL, NULL, '1', NULL, 0, 6139);

-- ----------------------------
-- Table structure for detalle_doc_sede
-- ----------------------------
DROP TABLE IF EXISTS `detalle_doc_sede`;
CREATE TABLE `detalle_doc_sede`  (
  `detalle_id_sede` int(11) NULL DEFAULT NULL,
  `detalle_id_documento` int(11) NULL DEFAULT NULL,
  INDEX `fk_doc_det`(`detalle_id_documento`) USING BTREE,
  INDEX `fk_sed_det`(`detalle_id_sede`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detalle_doc_sede
-- ----------------------------
INSERT INTO `detalle_doc_sede` VALUES (1, 1);
INSERT INTO `detalle_doc_sede` VALUES (1, 2);

-- ----------------------------
-- Table structure for detalle_empleados_sector_mesa
-- ----------------------------
DROP TABLE IF EXISTS `detalle_empleados_sector_mesa`;
CREATE TABLE `detalle_empleados_sector_mesa`  (
  `empleado_id` int(11) NOT NULL,
  `sector_mesa_id` int(11) NOT NULL,
  INDEX `sector_mesa_id`(`sector_mesa_id`) USING BTREE,
  INDEX `detalle_empleados_sector_mesa_ibfk_1`(`empleado_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detalle_mesa_sector_mesa
-- ----------------------------
DROP TABLE IF EXISTS `detalle_mesa_sector_mesa`;
CREATE TABLE `detalle_mesa_sector_mesa`  (
  `sector_mesa_id` int(11) NOT NULL,
  `mesa_id` int(11) NOT NULL,
  INDEX `dasdasdasddasdasda`(`mesa_id`) USING BTREE,
  INDEX `detalle_mesa_sector_mesa_ibfk_1`(`sector_mesa_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for detalle_producto_almacen
-- ----------------------------
DROP TABLE IF EXISTS `detalle_producto_almacen`;
CREATE TABLE `detalle_producto_almacen`  (
  `detalle_producto` int(11) NULL DEFAULT NULL,
  `detalle_almacen` int(11) NULL DEFAULT NULL,
  `detalle_stock` decimal(45, 4) NULL DEFAULT 0.0000,
  `detalle_producto_almacen_id` int(11) NOT NULL AUTO_INCREMENT,
  `detalle_stock_temporal` decimal(45, 4) NULL DEFAULT 0.0000,
  PRIMARY KEY (`detalle_producto_almacen_id`) USING BTREE,
  INDEX `fk_producto_1`(`detalle_producto`) USING BTREE,
  INDEX `fk_almacen_1`(`detalle_almacen`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detalle_producto_almacen
-- ----------------------------
INSERT INTO `detalle_producto_almacen` VALUES (53, 1, 0.0000, 1, 0.0000);
INSERT INTO `detalle_producto_almacen` VALUES (57, 1, 5.0000, 2, 0.0000);
INSERT INTO `detalle_producto_almacen` VALUES (60, 1, 0.0000, 3, 0.0000);
INSERT INTO `detalle_producto_almacen` VALUES (64, 1, 0.0000, 4, 0.0000);
INSERT INTO `detalle_producto_almacen` VALUES (66, 1, 0.0000, 5, 0.0000);

-- ----------------------------
-- Table structure for detalle_unidad_producto
-- ----------------------------
DROP TABLE IF EXISTS `detalle_unidad_producto`;
CREATE TABLE `detalle_unidad_producto`  (
  `detalle_unidad_producto_id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NULL DEFAULT NULL,
  `id_unidad_medida` int(11) NULL DEFAULT NULL,
  `detalle_unidad_producto_factor` decimal(10, 2) NULL DEFAULT NULL,
  `detalle_unidad_producto_estado` int(11) NULL DEFAULT 1,
  `detalle_unidad_producto_fijo` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`detalle_unidad_producto_id`) USING BTREE,
  INDEX `id_unidad_medida`(`id_unidad_medida`) USING BTREE,
  INDEX `producto_id`(`producto_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detalle_unidad_producto
-- ----------------------------
INSERT INTO `detalle_unidad_producto` VALUES (1, 53, 46, 1.00, 1, 1);
INSERT INTO `detalle_unidad_producto` VALUES (2, 53, 64, 15.00, 1, 0);
INSERT INTO `detalle_unidad_producto` VALUES (3, 57, 26, 1.00, 1, 1);
INSERT INTO `detalle_unidad_producto` VALUES (4, 57, 9, 100.00, 0, 0);
INSERT INTO `detalle_unidad_producto` VALUES (5, 57, 1, 24.00, 0, 0);
INSERT INTO `detalle_unidad_producto` VALUES (6, 57, 9, 24.00, 0, 0);
INSERT INTO `detalle_unidad_producto` VALUES (7, 60, 21, 1.00, 1, 1);
INSERT INTO `detalle_unidad_producto` VALUES (8, 60, 9, 1000.00, 1, 0);
INSERT INTO `detalle_unidad_producto` VALUES (9, 60, 9, 2000.00, 1, 0);
INSERT INTO `detalle_unidad_producto` VALUES (10, 64, 1, 1.00, 1, 1);
INSERT INTO `detalle_unidad_producto` VALUES (11, 64, 7, 100.00, 1, 0);
INSERT INTO `detalle_unidad_producto` VALUES (12, 64, 9, 10.00, 1, 0);
INSERT INTO `detalle_unidad_producto` VALUES (13, 64, 17, 12.00, 1, 0);
INSERT INTO `detalle_unidad_producto` VALUES (14, 57, 1, 2.50, 0, 0);
INSERT INTO `detalle_unidad_producto` VALUES (15, 66, 1, 1.00, 1, 1);
INSERT INTO `detalle_unidad_producto` VALUES (16, 66, 46, 2.00, 1, 0);
INSERT INTO `detalle_unidad_producto` VALUES (17, 66, 17, 12.00, 1, 0);
INSERT INTO `detalle_unidad_producto` VALUES (18, 57, 9, 24.00, 1, 0);

-- ----------------------------
-- Table structure for detalle_venta
-- ----------------------------
DROP TABLE IF EXISTS `detalle_venta`;
CREATE TABLE `detalle_venta`  (
  `id_detalle_venta` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cantidad` int(11) NULL DEFAULT NULL,
  `precio` decimal(8, 2) NULL DEFAULT NULL,
  `cod_producto_venta` int(255) NULL DEFAULT NULL,
  `id_venta` int(11) NULL DEFAULT NULL,
  `observaciones` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `estado_pedido` int(1) NULL DEFAULT 1,
  `fecha_preparar` datetime(0) NULL DEFAULT NULL,
  `detalle_estado_preparado` int(1) NULL DEFAULT 1,
  `id_tipoentrega` int(11) NULL DEFAULT NULL,
  `observacion_eliminado` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `detalle_usuario_eliminado` int(11) NULL DEFAULT NULL,
  `detalle_venta_fecha_eliminar` datetime(0) NULL DEFAULT NULL,
  `detalle_venta_imprimir` int(11) NULL DEFAULT 1,
  `detalle_venta_estadocanje` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `estado_descuento` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'SD',
  `valor_descuento` decimal(10, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`id_detalle_venta`) USING BTREE,
  INDEX `fk_venta_detalle`(`id_venta`) USING BTREE,
  INDEX `fk_ventas_producto`(`cod_producto_venta`) USING BTREE,
  INDEX `fk_venta_tipoentrega_detalle`(`id_tipoentrega`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6250 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of detalle_venta
-- ----------------------------
INSERT INTO `detalle_venta` VALUES (6155, '', 2, 2.00, 55, 3102, NULL, 1, '2021-01-09 19:09:17', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6156, '', 2, 3.00, 1, 3102, NULL, 1, '2021-01-09 19:09:17', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6157, '', 2, 0.50, 65, 3103, NULL, 1, '2021-01-09 20:26:15', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6158, '', 3, 3.00, 3, 3103, NULL, 1, '2021-01-09 20:26:15', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6159, '', 1, 3.00, 8, 3104, NULL, 1, '2021-01-09 20:50:49', 2, 1, NULL, NULL, NULL, 0, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6160, '', 1, 3.00, 1, 3104, NULL, 1, '2021-01-09 20:50:49', 2, 1, NULL, NULL, NULL, 0, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6161, '', 2, 2.00, 13, 3105, NULL, 1, '2021-01-09 20:26:14', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6162, '', 1, 4.00, 10, 3105, NULL, 1, '2021-01-09 20:26:14', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6163, '', 1, 3.00, 2, 3105, NULL, 1, '2021-01-09 20:26:14', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6164, '', 1, 3.00, 8, 3104, NULL, 1, '2021-01-09 20:50:49', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6165, '', 1, 3.00, 2, 3104, NULL, 1, '2021-01-09 20:50:49', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6166, '', 1, 3.00, 1, 3106, NULL, 1, '2021-01-09 20:50:51', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6167, '', 1, 3.00, 2, 3107, NULL, 1, '2021-01-09 20:50:53', 2, 1, NULL, NULL, NULL, 0, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6168, '', 1, 0.50, 65, 3108, NULL, 1, '2021-01-09 20:51:06', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6169, '', 2, 4.00, 12, 3108, NULL, 1, '2021-01-09 20:51:06', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6170, '', 3, 4.00, 9, 3108, NULL, 1, '2021-01-09 20:51:06', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6171, '', 2, 4.00, 9, 3109, NULL, 1, '2021-01-09 20:51:23', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6172, '', 1, 3.00, 39, 3110, NULL, 1, '2021-01-09 20:51:08', 2, 1, NULL, NULL, NULL, 0, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6173, '', 1, 2.00, 13, 3110, NULL, 1, '2021-01-09 20:51:08', 2, 1, NULL, NULL, NULL, 0, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6174, '', 2, 3.00, 3, 3110, NULL, 1, '2021-01-09 20:51:08', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6175, '', 2, 3.00, 2, 3107, NULL, 1, '2021-01-09 20:50:53', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6176, '', 1, 3.00, 2, 3111, NULL, 1, '2021-01-10 23:17:33', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6177, '', 1, 3.00, 1, 3111, NULL, 1, '2021-01-10 23:17:33', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6178, '', 2, 3.00, 4, 3112, NULL, 1, '2021-01-10 23:17:34', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6179, '', 2, 3.00, 8, 3112, NULL, 1, '2021-01-10 23:17:34', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6180, '', 2, 3.00, 2, 3112, NULL, 1, '2021-01-10 23:17:34', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6181, '', 1, 3.00, 8, 3113, NULL, 1, '2021-01-10 23:18:49', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6182, '', 1, 3.00, 5, 3113, NULL, 1, '2021-01-10 23:18:49', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6183, '', 1, 3.00, 4, 3113, NULL, 1, '2021-01-10 23:18:49', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6184, '', 1, 3.00, 3, 3113, NULL, 1, '2021-01-10 23:18:49', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6185, '', 1, 3.00, 2, 3113, NULL, 1, '2021-01-10 23:18:49', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6186, '', 2, 3.00, 8, 3114, NULL, 1, '2021-01-10 23:22:55', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6187, '', 1, 3.00, 5, 3114, NULL, 1, '2021-01-10 23:22:55', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6188, '', 2, 3.00, 4, 3114, NULL, 1, '2021-01-10 23:22:55', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6189, '', 2, 3.00, 1, 3114, NULL, 1, '2021-01-10 23:22:55', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6190, '', 1, 3.00, 2, 3115, NULL, 1, '2021-01-11 00:26:11', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6191, '', 2, 3.00, 4, 3116, NULL, 1, '2021-01-11 00:30:06', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6192, '', 2, 3.00, 3, 3116, NULL, 1, '2021-01-11 00:30:06', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6193, '', 2, 3.00, 8, 3117, NULL, 1, '2021-01-11 00:33:48', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6194, '', 2, 3.00, 5, 3117, NULL, 1, '2021-01-11 00:33:48', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6195, '', 2, 3.00, 4, 3117, NULL, 1, '2021-01-11 00:33:48', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6196, '', 4, 3.00, 3, 3118, NULL, 1, '2021-01-11 00:37:27', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6197, '', 1, 3.00, 1, 3119, NULL, 1, '2021-01-11 00:38:15', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6198, '', 1, 3.00, 3, 3119, NULL, 1, '2021-01-11 00:38:15', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6199, '', 3, 3.00, 4, 3120, NULL, 1, '2021-01-11 08:06:43', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6200, '', 3, 3.00, 3, 3120, NULL, 1, '2021-01-11 08:06:43', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6201, '', 2, 3.00, 4, 3121, NULL, 1, '2021-01-11 08:19:09', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6202, '', 1, 3.00, 3, 3122, NULL, 1, '2021-01-11 09:38:53', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6203, '', 1, 3.00, 4, 3123, NULL, 1, '2021-01-11 09:38:48', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6204, '', 2, 3.00, 4, 3124, NULL, 1, '2021-01-11 10:39:19', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6205, '', 2, 3.00, 3, 3124, NULL, 1, '2021-01-11 10:39:19', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6206, '', 2, 3.00, 5, 3125, NULL, 1, '2021-01-11 09:38:51', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6207, '', 2, 3.00, 4, 3125, NULL, 1, '2021-01-11 09:38:51', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6208, '', 1, 3.00, 4, 3126, NULL, 1, '2021-01-11 09:38:51', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6209, '', 1, 3.00, 3, 3126, NULL, 1, '2021-01-11 09:38:51', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6210, '', 1, 3.00, 2, 3127, NULL, 1, '2021-01-11 09:38:52', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6211, '', 1, 3.00, 1, 3127, NULL, 1, '2021-01-11 09:38:52', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6212, '', 1, 3.00, 1, 3128, NULL, 1, '2021-01-11 10:39:20', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6213, '', 1, 3.00, 3, 3128, NULL, 1, '2021-01-11 10:39:20', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6214, '', 1, 3.00, 4, 3124, NULL, 1, '2021-01-11 10:39:19', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6215, '', 1, 3.00, 3, 3129, NULL, 1, '2021-01-11 10:39:20', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6216, '', 1, 2.00, 13, 3130, NULL, 1, '2021-01-11 10:39:21', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6217, '', 1, 4.00, 12, 3130, NULL, 1, '2021-01-11 10:39:21', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6218, '', 1, 3.00, 1, 3130, NULL, 1, '2021-01-11 10:39:21', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6219, '', 2, 3.00, 3, 3131, NULL, 1, '2021-01-11 10:39:23', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6220, '', 1, 2.00, 67, 3132, NULL, 1, '2021-01-11 10:39:21', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6221, '', 1, 3.00, 4, 3132, NULL, 1, '2021-01-11 10:39:21', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6222, '', 1, 3.00, 1, 3132, NULL, 1, '2021-01-11 10:39:21', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6223, '', 1, 2.00, 13, 3133, NULL, 1, '2021-01-11 10:48:04', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6224, '', 2, 3.00, 4, 3133, NULL, 1, '2021-01-11 10:48:04', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6225, '', 1, 3.00, 3, 3133, NULL, 1, '2021-01-11 10:48:04', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6226, '', 2, 4.00, 10, 3134, NULL, 1, '2021-01-11 10:49:35', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6227, '', 2, 3.00, 5, 3134, NULL, 1, '2021-01-11 10:49:35', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6228, '', 2, 3.00, 4, 3134, NULL, 1, '2021-01-11 10:49:35', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6229, '', 2, 3.00, 5, 3135, NULL, 1, '2021-01-11 11:16:40', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6230, '', 1, 3.00, 4, 3135, NULL, 1, '2021-01-11 11:16:40', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6231, '', 2, 3.00, 3, 3135, NULL, 1, '2021-01-11 11:16:40', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6232, 'papa', 2, 3.00, 1, 3136, NULL, 1, '2021-01-11 11:18:25', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6233, '', 1, 3.00, 1, 3137, NULL, 1, '2021-01-11 11:20:26', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6234, '', 2, 3.00, 2, 3138, NULL, 1, '2021-01-11 11:21:23', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6235, '', 1, 3.00, 8, 3139, NULL, 1, '2021-01-11 12:07:19', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6236, '', 2, 3.00, 1, 3139, NULL, 1, '2021-01-11 12:07:19', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6237, '', 2, 3.00, 1, 3140, NULL, 0, '2021-01-11 00:00:00', 1, 1, 'devolucion de pedido', 13, '2021-01-11 11:34:40', 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6238, '', 2, 3.00, 4, 3141, NULL, 1, '2021-01-11 12:07:20', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6239, '', 2, 3.00, 3, 3141, NULL, 1, '2021-01-11 12:07:20', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6240, '', 1, 3.00, 3, 3142, NULL, 1, '2021-01-11 12:07:20', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6241, '', 1, 3.00, 3, 3143, NULL, 1, '2021-01-11 12:07:22', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6242, '', 1, 3.00, 1, 3144, NULL, 1, '2021-01-11 21:36:30', 2, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6243, '', 1, 3.00, 3, 3145, NULL, 1, '2021-01-11 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6244, '', 2, 4.00, 9, 3146, NULL, 1, '2021-01-11 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6245, '', 2, 3.00, 5, 3146, NULL, 1, '2021-01-11 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6246, '', 1, 3.00, 4, 3146, NULL, 1, '2021-01-11 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6247, '', 1, 3.00, 3, 3146, NULL, 1, '2021-01-11 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6248, '', 1, 3.00, 4, 3147, NULL, 1, '2021-01-11 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);
INSERT INTO `detalle_venta` VALUES (6249, '', 1, 3.00, 3, 3147, NULL, 1, '2021-01-11 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', 0.00);

-- ----------------------------
-- Table structure for direccion
-- ----------------------------
DROP TABLE IF EXISTS `direccion`;
CREATE TABLE `direccion`  (
  `direccion_id` int(15) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(15) NULL DEFAULT NULL,
  `direccion_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `direccion_estado` int(255) NULL DEFAULT 1,
  PRIMARY KEY (`direccion_id`) USING BTREE,
  INDEX `prdasdasdas`(`cliente_id`) USING BTREE,
  CONSTRAINT `prdasdasdas` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of direccion
-- ----------------------------
INSERT INTO `direccion` VALUES (1, 1, '- ', 1);
INSERT INTO `direccion` VALUES (2, 38, 'psje.humberto pinedo 130', 1);
INSERT INTO `direccion` VALUES (3, 38, 'prueba', 1);
INSERT INTO `direccion` VALUES (4, 38, 'jjingenieros', 1);
INSERT INTO `direccion` VALUES (5, 39, 'psje. humberto pinedo', 1);
INSERT INTO `direccion` VALUES (7, 39, 'psje. humberto 130', 1);
INSERT INTO `direccion` VALUES (8, 39, 'psje. humberto 120', 1);
INSERT INTO `direccion` VALUES (9, 39, 'prueba ', 1);
INSERT INTO `direccion` VALUES (10, 38, 'jr. maynas 100', 1);
INSERT INTO `direccion` VALUES (11, 40, 'jr. barrutia 129', 1);
INSERT INTO `direccion` VALUES (12, 40, 'psje. humberto pinedo 120- tarapoto', 1);
INSERT INTO `direccion` VALUES (13, 38, 'prueba', 1);
INSERT INTO `direccion` VALUES (14, 41, 'psje. humberto pinedo', 1);
INSERT INTO `direccion` VALUES (15, 38, 'psje. humberto pinedo 130', 1);
INSERT INTO `direccion` VALUES (17, 43, 'callle lima 156', 1);
INSERT INTO `direccion` VALUES (18, 40, 'jr. lima', 1);
INSERT INTO `direccion` VALUES (19, 40, 'jr. maynas 100', 1);
INSERT INTO `direccion` VALUES (20, 44, 'jr. maynas 100', 1);
INSERT INTO `direccion` VALUES (21, 41, 'prueba', 1);
INSERT INTO `direccion` VALUES (22, 44, 'psje. humberto pinedo 130', 1);

-- ----------------------------
-- Table structure for distrito
-- ----------------------------
DROP TABLE IF EXISTS `distrito`;
CREATE TABLE `distrito`  (
  `id_distrito` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `observacion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_provincia` int(11) NULL DEFAULT NULL,
  `estado` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id_distrito`) USING BTREE,
  INDEX `kjsdkfj`(`id_provincia`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for documento
-- ----------------------------
DROP TABLE IF EXISTS `documento`;
CREATE TABLE `documento`  (
  `id_documento` int(1) NOT NULL AUTO_INCREMENT,
  `doc_serie` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  `doc_correlativo` int(11) NULL DEFAULT NULL,
  `id_empresa` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_tipodocumento` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_documento`) USING BTREE,
  INDEX `fk_tipodoc`(`id_tipodocumento`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of documento
-- ----------------------------
INSERT INTO `documento` VALUES (1, 'B001', '1', 31, '10403634951', 2);
INSERT INTO `documento` VALUES (2, 'F001', '1', 1, '10403634951', 1);

-- ----------------------------
-- Table structure for empleado_adelanto
-- ----------------------------
DROP TABLE IF EXISTS `empleado_adelanto`;
CREATE TABLE `empleado_adelanto`  (
  `empleado_adelanto_id` int(11) NOT NULL AUTO_INCREMENT,
  `empleado_adelanto_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `empleado_adelanto_sueldo` decimal(10, 2) NULL DEFAULT NULL,
  `empleado_adelanto_fecha` date NULL DEFAULT NULL,
  `empleado_adelanto_estado` int(11) NULL DEFAULT 1,
  `empleado_id` int(11) NULL DEFAULT NULL,
  `id_movimiento` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`empleado_adelanto_id`) USING BTREE,
  INDEX `dasdae2qwas`(`empleado_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for empleado_asistencia
-- ----------------------------
DROP TABLE IF EXISTS `empleado_asistencia`;
CREATE TABLE `empleado_asistencia`  (
  `empleado_asistencia_id` int(11) NOT NULL AUTO_INCREMENT,
  `empleado_asistencia_fecha_hora` datetime(0) NULL DEFAULT NULL,
  `empleado_asistencia_estado` int(11) NULL DEFAULT 1,
  `empleado_id` int(11) NULL DEFAULT NULL,
  `empleado_asistencia_fecha` date NULL DEFAULT NULL,
  `empleado_asistencia_hora` time(0) NULL DEFAULT NULL,
  `empleado_asistencia_horario` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`empleado_asistencia_id`) USING BTREE,
  INDEX `dasdasdasdas`(`empleado_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for empleado_descuento
-- ----------------------------
DROP TABLE IF EXISTS `empleado_descuento`;
CREATE TABLE `empleado_descuento`  (
  `empleado_descuento_id` int(11) NOT NULL AUTO_INCREMENT,
  `empleado_descuento_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `motivo_descuento_id` int(11) NULL DEFAULT 1,
  `empleado_descuento_monto` decimal(10, 2) NULL DEFAULT NULL,
  `empleado_descuento_fecha` date NULL DEFAULT NULL,
  `empleado_descuento_estado` int(11) NULL DEFAULT 1,
  `empleado_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`empleado_descuento_id`) USING BTREE,
  INDEX `dasdasd`(`empleado_id`) USING BTREE,
  INDEX `fasdasdasd`(`motivo_descuento_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for empleados
-- ----------------------------
DROP TABLE IF EXISTS `empleados`;
CREATE TABLE `empleados`  (
  `empleado_id` int(11) NOT NULL AUTO_INCREMENT,
  `empleado_nombres` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `empleado_apellidos` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `empleado_dni` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `empleado_direccion` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `empleado_email` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `empleado_telefono` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `perfil_id` int(11) NULL DEFAULT NULL,
  `empleado_usuario` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `empleado_clave` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `estado` int(1) NULL DEFAULT 1,
  `empleado_nombre_completo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `empleado_foto_perfil` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `empleado_fecha_nacimiento` date NULL DEFAULT NULL,
  `empleado_fecha_ingreso` date NULL DEFAULT NULL,
  `empleado_fecha_salida` date NULL DEFAULT NULL,
  `empleado_sueldoplanilla` decimal(10, 2) NULL DEFAULT NULL,
  `empleado_sueldoreal` decimal(10, 2) NULL DEFAULT NULL,
  `empleado_fondo_pension` decimal(10, 2) NULL DEFAULT NULL,
  `id_fondo_pension` int(11) NULL DEFAULT NULL,
  `empleado_cci` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `empleado_numbanco` varchar(14) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `empleado_idbanco` int(11) NULL DEFAULT NULL,
  `empleado_sexo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'm',
  `empleado_idsalud` int(11) NULL DEFAULT NULL,
  `empleado_horario_entrada_man` time(0) NULL DEFAULT NULL,
  `empleado_horario_salida_man` time(0) NULL DEFAULT NULL,
  `empleado_horario_entrada_tar` time(0) NULL DEFAULT NULL,
  `empleado_horario_salida_tar` time(0) NULL DEFAULT NULL,
  `empleado_inicio_contrato` date NULL DEFAULT NULL,
  `empleado_fecha_inicio` date NULL DEFAULT NULL,
  `empleado_estado_planilla` int(1) NULL DEFAULT 0,
  `empresa_sede` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`empleado_id`) USING BTREE,
  INDEX `fk_perfil_empleado`(`perfil_id`) USING BTREE,
  INDEX `id_fondo_pension`(`id_fondo_pension`) USING BTREE,
  INDEX `empleados_ibfk_bancos`(`empleado_idbanco`) USING BTREE,
  INDEX `empleados_ibfk_salud`(`empleado_idsalud`) USING BTREE,
  INDEX `empleados_ibfk_3`(`empresa_sede`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of empleados
-- ----------------------------
INSERT INTO `empleados` VALUES (1, 'admin', 'Salas Romero', '75016083', 'Calle Teniente Cesar López 116', 'elvis.salas.romero@gmail.com', '965010490', 12, 'admin', '123', 1, 'admin Salas Romero', 'default.jpg', '1996-04-03', '2019-05-11', NULL, 2000.00, 2000.00, NULL, NULL, NULL, NULL, NULL, 'm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1);
INSERT INTO `empleados` VALUES (3, 'Pedro Miguel', 'Pajuelo Limas', '73948733', 'calle sargento lores 611', 'pedropajuelo48@gmail.com', '154558523', 5, 'pedrocaja', 'caja2019', 1, 'Pedro Miguel Pajuelo Limas', 'defaut.jpg', '1999-09-21', NULL, NULL, 700.00, 700.00, NULL, NULL, NULL, NULL, NULL, 'm', NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-12', 0, 1);
INSERT INTO `empleados` VALUES (4, 'Anicia', 'ramirez ortiz', '76320821', 'calle puerto 123', 'anicia@gmail.com', '528538699', 5, 'aniciacaja', 'anicia2019', 1, 'Anicia ramirez ortiz', 'defaut.jpg', '2000-11-19', NULL, NULL, 700.00, 700.00, NULL, NULL, NULL, NULL, NULL, 'm', NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-13', 0, 1);
INSERT INTO `empleados` VALUES (5, 'Yoni', 'oblitas chujutalli', '05628956', 'calle alfonso ugarte 1204', 'yoni@gmail.com', '012858528', 6, 'yonicocina', 'yoni2019', 1, 'Yoni oblitas chujutalli', 'defaut.jpg', '1988-10-07', NULL, NULL, 700.00, 700.00, NULL, NULL, NULL, NULL, NULL, 'm', NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-13', 0, 1);
INSERT INTO `empleados` VALUES (6, 'Genry Raul', 'Ojanama Caritimari', '47071300', 'asentamiento humano santa maria', 'genry@gmail.com', '122344543', 6, 'genryproduccion', 'genry2019', 1, 'Genry Raul Ojanama Caritimari', 'defaut.jpg', '1991-01-28', NULL, NULL, 700.00, 700.00, NULL, NULL, NULL, NULL, NULL, 'm', NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-13', 0, 1);
INSERT INTO `empleados` VALUES (13, 'CAJERO', 'JHGJHG', '71228595', '----', '-', '955195554', 5, 'CAJERO', '12345678', 1, 'CAJERO JHGJHG', 'defaut.jpg', '2021-01-05', NULL, NULL, 7.00, 7.00, NULL, NULL, NULL, NULL, NULL, 'm', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-07', 0, 1);
INSERT INTO `empleados` VALUES (14, 'mozo', 'mozo', '75270586', 'psjel. humberto', 'admin@gmail.com', '933122626', 2, 'mozo', '12345678', 1, 'mozo mozo', 'defaut.jpg', '2021-01-09', NULL, NULL, 930.00, 930.00, NULL, NULL, NULL, NULL, NULL, 'm', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-09', 0, 1);

-- ----------------------------
-- Table structure for empresa
-- ----------------------------
DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa`  (
  `empresa_ruc` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `empresa_razon_social` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `empresa_direccion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `empresa_telefono` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `empresa_correo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `empresa_estado` int(11) NULL DEFAULT 1,
  `empresa_icono` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `empresa_abreviatura` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `empresa_nombre_comercial` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `empresa_usuario_sol` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `empresa_clave_sol` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `empreasa_firma_digital` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `empresa_estado_activo` int(11) NULL DEFAULT 1,
  `empresa_token_facturacion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `empresa_fondo` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `empresa_color` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`empresa_ruc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of empresa
-- ----------------------------
INSERT INTO `empresa` VALUES ('10403634951', 'Adela Zárate Mendoza', 'Jirón Alegría Arias de Morey 235, Tarapoto', '955256736', 'evargas.jec2011@gmail.com', 1, 'https://selvafood.com/fotos_restaurante/10403634951.jpg', '', 'Sanguchon Wasi', NULL, NULL, NULL, 1, '8lqV6Y8G0eSwG5G0hgthgB8CD1g4N2W5xdVYUoWodrqreh82z9', 'https://selvafood.com/fotos_restaurante/10403634951_fondo.jpg', '#2a0cc0');

-- ----------------------------
-- Table structure for fondo_pension
-- ----------------------------
DROP TABLE IF EXISTS `fondo_pension`;
CREATE TABLE `fondo_pension`  (
  `id_fondo_pension` int(11) NOT NULL AUTO_INCREMENT,
  `fondo_pension_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fondo_pension_porcentaje` decimal(10, 2) NULL DEFAULT NULL,
  `fondo_pension_estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  `fondo_pension_idtiporetencion` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_fondo_pension`) USING BTREE,
  INDEX `fk_tiporetencion_fodo`(`fondo_pension_idtiporetencion`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for fondo_salud
-- ----------------------------
DROP TABLE IF EXISTS `fondo_salud`;
CREATE TABLE `fondo_salud`  (
  `fondosalud_idsalud` int(11) NOT NULL,
  `fondosalud_descripcion` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fondosalud_estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `fondosalud_porcentaje` float(11, 2) NULL DEFAULT NULL,
  `fondosalud_monto` float(11, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`fondosalud_idsalud`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for formapago
-- ----------------------------
DROP TABLE IF EXISTS `formapago`;
CREATE TABLE `formapago`  (
  `for_id` int(11) NOT NULL AUTO_INCREMENT,
  `for_descripcion` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `for_estado` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`for_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of formapago
-- ----------------------------
INSERT INTO `formapago` VALUES (1, 'Efectivo', 1);
INSERT INTO `formapago` VALUES (2, 'POS VISA', 1);
INSERT INTO `formapago` VALUES (3, 'VISA', 1);
INSERT INTO `formapago` VALUES (4, 'CHECKE', 1);

-- ----------------------------
-- Table structure for kardex_producto
-- ----------------------------
DROP TABLE IF EXISTS `kardex_producto`;
CREATE TABLE `kardex_producto`  (
  `kardex_id` int(11) NOT NULL AUTO_INCREMENT,
  `detalle_producto_almacen_id` int(11) NULL DEFAULT NULL,
  `kardex_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kardex_fecha` datetime(0) NULL DEFAULT NULL,
  `kardex_tipo` int(11) NULL DEFAULT NULL,
  `kardex_serie_comprobante` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kardex_correlativo_comprobante` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kardex_serie_correlativo_comprobante` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kardex_estado` int(11) NULL DEFAULT NULL,
  `kardex_cantidad_unitaria` decimal(16, 4) NULL DEFAULT NULL,
  `kardex_precio_unitaria` decimal(16, 4) NULL DEFAULT NULL,
  `kardex_subtotal_unitaria` decimal(16, 4) NULL DEFAULT NULL,
  `kardex_cantidad_total` decimal(16, 4) NULL DEFAULT NULL,
  `kardex_precio_total` decimal(16, 4) NULL DEFAULT NULL,
  `kardex_subtotal_total` decimal(16, 4) NULL DEFAULT NULL,
  `kardex_tipo_comprobante` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`kardex_id`) USING BTREE,
  INDEX `detalle_insumo_almacen_id`(`detalle_producto_almacen_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kardex_producto
-- ----------------------------
INSERT INTO `kardex_producto` VALUES (1, 2, 'Inventario Inicial', '2021-01-11 11:48:52', 1, 'F100', '1', 'F100-1', NULL, 10.0000, 10.0000, 100.0000, 10.0000, 10.0000, 100.0000, 1);
INSERT INTO `kardex_producto` VALUES (2, 2, 'VENTA DE PRODUCTO', '2021-01-11 11:51:36', 2, '', '', '-', NULL, 5.0000, 10.0000, 50.0000, 5.0000, 10.0000, 50.0000, 0);

-- ----------------------------
-- Table structure for lugar_mesa
-- ----------------------------
DROP TABLE IF EXISTS `lugar_mesa`;
CREATE TABLE `lugar_mesa`  (
  `lugarmesa_id` int(11) NOT NULL AUTO_INCREMENT,
  `lugarmesa_descripcion` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lugarmesa_estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  `color` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_sede` int(11) NULL DEFAULT NULL,
  `cu_tabla` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`lugarmesa_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of lugar_mesa
-- ----------------------------
INSERT INTO `lugar_mesa` VALUES (1, 'heladeria mesas', '1', NULL, 1, NULL);
INSERT INTO `lugar_mesa` VALUES (2, 'barra', '1', NULL, 1, NULL);
INSERT INTO `lugar_mesa` VALUES (3, 'Salón ', '1', NULL, 1, NULL);

-- ----------------------------
-- Table structure for marca
-- ----------------------------
DROP TABLE IF EXISTS `marca`;
CREATE TABLE `marca`  (
  `marca_id` int(11) NOT NULL AUTO_INCREMENT,
  `marca_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `marca_estado` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`marca_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of marca
-- ----------------------------
INSERT INTO `marca` VALUES (1, 'SAN LUIS', 1);
INSERT INTO `marca` VALUES (2, 'BAQUILLO', 1);

-- ----------------------------
-- Table structure for mesa
-- ----------------------------
DROP TABLE IF EXISTS `mesa`;
CREATE TABLE `mesa`  (
  `mesa_id` int(11) NOT NULL AUTO_INCREMENT,
  `mesa_numero` int(11) NULL DEFAULT NULL,
  `mesa_estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '0=Inhabilitado;1=Habilitado',
  `mesa_id_lugar` int(11) NULL DEFAULT NULL,
  `mesa_disponible` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0' COMMENT '0=Ocupado;1=Disponible;2=Reservado',
  `mesa_empleado` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`mesa_id`) USING BTREE,
  INDEX `fk_lugar_mesa`(`mesa_id_lugar`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of mesa
-- ----------------------------
INSERT INTO `mesa` VALUES (1, 9999, '1', 1, '0', 13);
INSERT INTO `mesa` VALUES (2, 1, '1', 3, '1', 14);
INSERT INTO `mesa` VALUES (3, 2, '1', 1, '0', 13);
INSERT INTO `mesa` VALUES (4, 3, '1', 1, '0', 13);
INSERT INTO `mesa` VALUES (5, 4, '1', 1, '0', 14);
INSERT INTO `mesa` VALUES (6, 5, '1', 1, '0', 14);
INSERT INTO `mesa` VALUES (7, 6, '1', 1, '0', 14);
INSERT INTO `mesa` VALUES (8, 7, '1', 1, '0', 3);
INSERT INTO `mesa` VALUES (9, 8, '1', 1, '0', 3);
INSERT INTO `mesa` VALUES (10, 9, '1', 1, '0', 3);
INSERT INTO `mesa` VALUES (11, 10, '0', 2, '0', 3);
INSERT INTO `mesa` VALUES (12, 11, '1', 2, '0', 3);
INSERT INTO `mesa` VALUES (13, 12, '1', 2, '0', 3);
INSERT INTO `mesa` VALUES (14, 13, '1', 2, '0', 14);
INSERT INTO `mesa` VALUES (15, 14, '1', 2, '0', 14);

-- ----------------------------
-- Table structure for modulos
-- ----------------------------
DROP TABLE IF EXISTS `modulos`;
CREATE TABLE `modulos`  (
  `modulo_id` int(11) NOT NULL AUTO_INCREMENT,
  `modulo_nombre` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `modulo_icono` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `modulo_url` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `modulo_padre` int(11) NULL DEFAULT NULL,
  `estado` int(1) NULL DEFAULT 1,
  `modulo_orden` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`modulo_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of modulos
-- ----------------------------
INSERT INTO `modulos` VALUES (1, 'MODULO PADRE', '#', '#', 1, 1, 1);
INSERT INTO `modulos` VALUES (2, 'Seguridad', 'fa fa-key', '.', 1, 1, 6);
INSERT INTO `modulos` VALUES (3, 'Permisos', ' ', 'Permisos', 2, 1, NULL);
INSERT INTO `modulos` VALUES (4, 'Perfiles', ' ', 'Perfiles', 2, 1, 4);
INSERT INTO `modulos` VALUES (5, 'Modulos', ' ', 'Modulo', 2, 1, 6);
INSERT INTO `modulos` VALUES (6, 'Empresa', '.', 'empresa', 2, 0, NULL);
INSERT INTO `modulos` VALUES (7, 'Almacen', 'fa fa-inbox', '#', 1, 1, NULL);
INSERT INTO `modulos` VALUES (8, 'R. de Almacen', ' ', 'almacen', 7, 1, NULL);
INSERT INTO `modulos` VALUES (9, 'Mantenimiento', 'fa fa-cog', '#', 1, 1, NULL);
INSERT INTO `modulos` VALUES (10, 'Categoria Producto', ' ', 'C_producto', 9, 1, NULL);
INSERT INTO `modulos` VALUES (11, 'Marca Producto', ' ', 'Marca_producto', 9, 1, NULL);
INSERT INTO `modulos` VALUES (12, 'Tipo Documento', ' ', 'Tipo_documento', 9, 1, NULL);
INSERT INTO `modulos` VALUES (13, 'Tipo Moneda', ' ', 'Tipo_moneda', 9, 1, NULL);
INSERT INTO `modulos` VALUES (14, 'Unidad Medida', ' ', 'Unidad_medida', 9, 1, NULL);
INSERT INTO `modulos` VALUES (15, 'Compras', 'fa fa-cart-arrow-down ', '#', 1, 1, NULL);
INSERT INTO `modulos` VALUES (16, 'Registrar Producto', ' ', 'R_producto', 15, 1, NULL);
INSERT INTO `modulos` VALUES (17, 'Ubicación Mesa', NULL, 'Ubicacionmesa', 9, 1, NULL);
INSERT INTO `modulos` VALUES (18, 'Proveedor', '.', 'Proveedor', 15, 1, NULL);
INSERT INTO `modulos` VALUES (19, 'Registro compra', '.', 'Compra', 15, 1, NULL);
INSERT INTO `modulos` VALUES (20, 'Mesas', ' ', 'Mesas', 9, 1, NULL);
INSERT INTO `modulos` VALUES (21, 'Ventas', 'fa fa-shopping-bag', '.', 1, 1, NULL);
INSERT INTO `modulos` VALUES (22, 'Venta Mesa', ' ', 'Venta_mesa', 21, 1, NULL);
INSERT INTO `modulos` VALUES (23, 'Caja', 'fa fa-cc', '.', 1, 1, NULL);
INSERT INTO `modulos` VALUES (24, 'Sesión Caja', ' ', 'Sesion_caja', 23, 1, NULL);
INSERT INTO `modulos` VALUES (25, 'Registro Comprobantes', ' ', 'Registro_comprobante', 9, 1, NULL);
INSERT INTO `modulos` VALUES (26, 'Asignar Comprobantes', ' ', 'Asignar_comprobantes', 9, 0, NULL);
INSERT INTO `modulos` VALUES (27, 'Pedido', ' ', 'Pedido', 23, 1, NULL);
INSERT INTO `modulos` VALUES (28, 'Empleados', 'fa fa-user-circle', '#', 1, 1, NULL);
INSERT INTO `modulos` VALUES (29, 'Empleados', ' ', 'Usuario', 28, 1, NULL);
INSERT INTO `modulos` VALUES (30, 'Concepto', ' ', 'Concepto', 23, 1, NULL);
INSERT INTO `modulos` VALUES (31, 'Gestión de Movimientos', ' ', 'movimiento', 23, 1, NULL);
INSERT INTO `modulos` VALUES (32, 'Cobro de Venta al Credito', ' ', 'Venta_credito', 21, 1, NULL);
INSERT INTO `modulos` VALUES (33, 'Reportes', 'fa fa-file-pdf', '#', 1, 1, NULL);
INSERT INTO `modulos` VALUES (34, 'Rep. Grafico Ventas', ' ', 'Reporte_venta', 33, 1, NULL);
INSERT INTO `modulos` VALUES (35, 'Gráfico de VentaxEmpleados', ' ', 'Venta_empleado', 33, 1, NULL);
INSERT INTO `modulos` VALUES (36, 'Platos Vendidos', ' ', 'R_plato_vendido', 33, 1, NULL);
INSERT INTO `modulos` VALUES (37, 'Productos Cancelados', ' ', 'R_roducto_cancelado', 33, 1, NULL);
INSERT INTO `modulos` VALUES (38, 'Clientes', ' ', 'Clientes', 21, 1, NULL);
INSERT INTO `modulos` VALUES (39, 'Registrar Plato', '.', 'Registrar_plato', 21, 1, NULL);
INSERT INTO `modulos` VALUES (40, 'Cocina', 'fa fa-fire', '#', 1, 1, NULL);
INSERT INTO `modulos` VALUES (41, 'Cocina', '.', 'Cocina', 40, 1, NULL);
INSERT INTO `modulos` VALUES (42, 'Produccion', '.', 'Produccion', 40, 1, NULL);
INSERT INTO `modulos` VALUES (43, 'Historia de Sesión Caja', ' ', 'HSesion_caja', 23, 1, NULL);
INSERT INTO `modulos` VALUES (44, 'Mostrador', '.', 'Mostrador', 21, 1, NULL);

-- ----------------------------
-- Table structure for monedas
-- ----------------------------
DROP TABLE IF EXISTS `monedas`;
CREATE TABLE `monedas`  (
  `moneda_id` int(11) NOT NULL AUTO_INCREMENT,
  `moneda_descripcion` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `moneda_simbolo` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `moneda_estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  `moneda_descripcion_contabilidad` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `moneda_simbolo_contabilidad` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`moneda_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of monedas
-- ----------------------------
INSERT INTO `monedas` VALUES (1, 'Nuevo Sol.', 'S/', '1', NULL, NULL);
INSERT INTO `monedas` VALUES (2, 'Dolares', '$', '1', NULL, NULL);

-- ----------------------------
-- Table structure for motivo_contrato
-- ----------------------------
DROP TABLE IF EXISTS `motivo_contrato`;
CREATE TABLE `motivo_contrato`  (
  `motivo_contrato_id` int(11) NOT NULL AUTO_INCREMENT,
  `motivo_contrato_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`motivo_contrato_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for motivo_descuento
-- ----------------------------
DROP TABLE IF EXISTS `motivo_descuento`;
CREATE TABLE `motivo_descuento`  (
  `motivo_descuento_id` int(11) NOT NULL AUTO_INCREMENT,
  `motivo_descuento_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `motivo_descuento_estado` int(11) NULL DEFAULT 1,
  `id_sede` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`motivo_descuento_id`) USING BTREE,
  INDEX `sdada`(`id_sede`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for movimiento
-- ----------------------------
DROP TABLE IF EXISTS `movimiento`;
CREATE TABLE `movimiento`  (
  `mov_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sesion_caja` int(11) NOT NULL,
  `mov_formapago` int(11) NOT NULL,
  `mov_concepto` int(11) NOT NULL,
  `mov_fecha` date NULL DEFAULT NULL,
  `mov_monto` decimal(10, 2) NULL DEFAULT NULL,
  `mov_estado` int(11) NULL DEFAULT 1,
  `mov_descripcion` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mov_hora` time(0) NULL DEFAULT NULL,
  `id_tipo_comprobante` int(11) NULL DEFAULT NULL,
  `tipo_comprobante_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mov_fecha_tiempo` datetime(0) NULL DEFAULT NULL,
  `mov_igv` int(11) NULL DEFAULT NULL,
  `mov_documento` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mov_razonsocial` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mov_monto_cambio` decimal(10, 2) NULL DEFAULT NULL,
  `moneda_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`mov_id`) USING BTREE,
  INDEX `fsdfsf`(`mov_concepto`) USING BTREE,
  INDEX `ewqeqwe`(`mov_formapago`) USING BTREE,
  INDEX `dasdasd`(`id_sesion_caja`) USING BTREE,
  INDEX `id_tipo_comprobante`(`id_tipo_comprobante`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3215 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of movimiento
-- ----------------------------
INSERT INTO `movimiento` VALUES (1, 1, 1, 1, '2019-05-12', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:25:31', 0, '', '2019-05-12 17:25:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2, 1, 1, 1, '2019-05-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:36:33', 0, '', '2019-05-12 17:36:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3, 1, 1, 1, '2019-05-12', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:37:59', 0, '', '2019-05-12 17:37:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (4, 1, 1, 1, '2019-05-12', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:47:54', 0, '', '2019-05-12 17:47:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (5, 1, 1, 1, '2019-05-12', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:51:23', 0, '', '2019-05-12 17:51:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (6, 1, 1, 1, '2019-05-12', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:51:58', 0, '', '2019-05-12 17:51:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (7, 1, 1, 1, '2019-05-12', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:52:44', 0, '', '2019-05-12 17:52:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (8, 1, 1, 1, '2019-05-12', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:59:46', 0, '', '2019-05-12 17:59:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (9, 1, 1, 1, '2019-05-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:03:43', 0, '', '2019-05-12 18:03:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (10, 1, 1, 1, '2019-05-12', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:04:08', 0, '', '2019-05-12 18:04:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (11, 1, 1, 1, '2019-05-12', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:06:48', 0, '', '2019-05-12 18:06:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (12, 1, 1, 1, '2019-05-12', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:07:50', 0, '', '2019-05-12 18:07:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (13, 1, 1, 1, '2019-05-12', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:12:40', 0, '', '2019-05-12 18:12:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (14, 1, 1, 1, '2019-05-12', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:14:34', 0, '', '2019-05-12 18:14:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (15, 1, 1, 1, '2019-05-12', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:15:49', 0, '', '2019-05-12 18:15:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (16, 1, 1, 1, '2019-05-12', 32.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:22:36', 0, '', '2019-05-12 18:22:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (17, 1, 1, 1, '2019-05-12', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:28:49', 0, '', '2019-05-12 18:28:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (18, 1, 1, 1, '2019-05-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:33:47', 0, '', '2019-05-12 18:33:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (19, 1, 1, 1, '2019-05-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:35:11', 0, '', '2019-05-12 18:35:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (20, 1, 1, 1, '2019-05-12', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:39:56', 0, '', '2019-05-12 18:39:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (21, 1, 1, 1, '2019-05-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:54:42', 0, '', '2019-05-12 18:54:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (22, 1, 1, 1, '2019-05-12', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:57:22', 0, '', '2019-05-12 18:57:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (23, 1, 1, 1, '2019-05-12', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:00:18', 0, '', '2019-05-12 19:00:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (24, 1, 1, 1, '2019-05-12', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:14:13', 0, '', '2019-05-12 19:14:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (25, 1, 1, 1, '2019-05-12', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:30:16', 0, '', '2019-05-12 19:30:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (26, 1, 1, 1, '2019-05-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:47:21', 0, '', '2019-05-12 19:47:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (27, 1, 1, 1, '2019-05-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:55:04', 0, '', '2019-05-12 19:55:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (28, 1, 1, 1, '2019-05-12', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:08:13', 0, '', '2019-05-12 20:08:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (29, 1, 1, 1, '2019-05-12', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:12:08', 0, '', '2019-05-12 20:12:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (30, 1, 1, 1, '2019-05-12', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:14:50', 0, '', '2019-05-12 20:14:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (31, 1, 1, 1, '2019-05-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:15:23', 0, '', '2019-05-12 20:15:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (32, 1, 1, 1, '2019-05-12', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:15:52', 0, '', '2019-05-12 20:15:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (33, 1, 1, 1, '2019-05-12', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:16:17', 0, '', '2019-05-12 20:16:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (34, 1, 1, 1, '2019-05-12', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:16:54', 0, '', '2019-05-12 20:16:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (35, 1, 1, 1, '2019-05-12', 21.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:17:57', 0, '', '2019-05-12 20:17:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (36, 1, 1, 1, '2019-05-12', 24.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:18:55', 0, '', '2019-05-12 20:18:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (37, 1, 1, 1, '2019-05-12', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:20:26', 0, '', '2019-05-12 20:20:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (38, 1, 1, 1, '2019-05-12', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:20:47', 0, '', '2019-05-12 20:20:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (39, 1, 1, 1, '2019-05-12', 24.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:22:10', 0, '', '2019-05-12 20:22:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (40, 1, 1, 1, '2019-05-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:22:43', 0, '', '2019-05-12 20:22:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (41, 1, 1, 1, '2019-05-12', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:24:11', 0, '', '2019-05-12 20:24:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (42, 1, 1, 1, '2019-05-12', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:25:31', 0, '', '2019-05-12 20:25:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (43, 1, 1, 1, '2019-05-12', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:26:47', 0, '', '2019-05-12 20:26:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (44, 1, 1, 1, '2019-05-12', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:27:12', 0, '', '2019-05-12 20:27:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (45, 1, 1, 1, '2019-05-12', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:28:11', 0, '', '2019-05-12 20:28:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (46, 1, 1, 1, '2019-05-12', 21.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:29:21', 0, '', '2019-05-12 20:29:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (47, 1, 1, 1, '2019-05-12', 21.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:29:47', 0, '', '2019-05-12 20:29:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (48, 1, 1, 4, '2019-05-12', 7.00, 1, 'pago de pasaje y bolsas', '20:32:25', 0, '001-1', '2019-05-12 20:32:25', NULL, NULL, NULL, 3.32, 1);
INSERT INTO `movimiento` VALUES (49, 3, 1, 1, '2019-05-14', 0.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '09:48:08', 0, '', '2019-05-14 09:48:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (50, 3, 1, 4, '2019-05-14', 1.00, 1, 'esponja sapolio (lavavajillas)', '09:57:43', 0, '001-1', '2019-05-14 09:57:43', NULL, NULL, NULL, 3.33, 1);
INSERT INTO `movimiento` VALUES (51, 3, 1, 3, '2019-05-14', 2.00, 1, 'esponja', '10:03:28', 0, '', '2019-05-14 10:03:28', NULL, NULL, NULL, 3.33, 1);
INSERT INTO `movimiento` VALUES (52, 3, 1, 1, '2019-05-14', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:05:52', 0, '', '2019-05-14 10:05:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (53, 3, 1, 1, '2019-05-14', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:07:58', 0, '', '2019-05-14 10:07:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (54, 3, 1, 3, '2019-05-14', 4.00, 1, 'Agua tratada', '10:13:22', 0, '001-1', '2019-05-14 10:13:22', NULL, NULL, NULL, 3.33, 1);
INSERT INTO `movimiento` VALUES (55, 3, 1, 1, '2019-05-14', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:08:44', 0, '', '2019-05-14 11:08:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (56, 3, 1, 1, '2019-05-14', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:52:31', 0, '', '2019-05-14 11:52:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (57, 3, 1, 1, '2019-05-14', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:20:41', 0, '', '2019-05-14 12:20:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (58, 3, 1, 1, '2019-05-14', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:14:18', 0, '', '2019-05-14 16:14:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (59, 3, 1, 1, '2019-05-14', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:17:06', 0, '', '2019-05-14 16:17:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (60, 3, 1, 1, '2019-05-14', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:21:03', 0, '', '2019-05-14 16:21:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (61, 3, 1, 1, '2019-05-14', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:24:06', 0, '', '2019-05-14 16:24:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (62, 3, 1, 1, '2019-05-14', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:41:28', 0, '', '2019-05-14 16:41:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (63, 3, 1, 1, '2019-05-14', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:00:10', 0, '', '2019-05-14 17:00:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (64, 3, 1, 1, '2019-05-14', 0.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:09:18', 0, '', '2019-05-14 17:09:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (65, 3, 1, 1, '2019-05-14', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:11:16', 0, '', '2019-05-14 17:11:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (66, 3, 1, 1, '2019-05-14', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:12:30', 0, '', '2019-05-14 17:12:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (67, 3, 1, 1, '2019-05-14', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:20:21', 0, '', '2019-05-14 17:20:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (68, 3, 1, 1, '2019-05-14', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:24:28', 0, '', '2019-05-14 17:24:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (69, 3, 1, 1, '2019-05-14', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:26:46', 0, '', '2019-05-14 17:26:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (70, 3, 1, 1, '2019-05-14', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:47:16', 0, '', '2019-05-14 17:47:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (71, 3, 1, 1, '2019-05-14', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:49:41', 0, '', '2019-05-14 17:49:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (72, 3, 1, 1, '2019-05-14', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:57:08', 0, '', '2019-05-14 17:57:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (73, 3, 1, 1, '2019-05-14', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:15:56', 0, '', '2019-05-14 18:15:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (74, 3, 1, 1, '2019-05-14', 0.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:36:21', 0, '', '2019-05-14 18:36:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (75, 3, 1, 1, '2019-05-14', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:41:29', 0, '', '2019-05-14 18:41:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (76, 3, 1, 1, '2019-05-14', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:18:04', 0, '', '2019-05-14 19:18:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (77, 3, 1, 1, '2019-05-14', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:21:11', 0, '', '2019-05-14 19:21:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (78, 3, 1, 1, '2019-05-14', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:32:11', 0, '', '2019-05-14 19:32:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (79, 3, 1, 1, '2019-05-14', 0.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:48:48', 0, '', '2019-05-14 19:48:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (80, 3, 1, 1, '2019-05-14', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:55:28', 0, '', '2019-05-14 19:55:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (81, 3, 1, 1, '2019-05-14', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:55:52', 0, '', '2019-05-14 20:55:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (82, 3, 1, 1, '2019-05-14', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:56:28', 0, '', '2019-05-14 20:56:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (83, 3, 1, 1, '2019-05-14', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:06:12', 0, '', '2019-05-14 21:06:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (84, 3, 1, 1, '2019-05-14', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '00:30:07', 0, '', '2019-05-15 00:30:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (85, 3, 1, 1, '2019-05-14', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '00:31:34', 0, '', '2019-05-15 00:31:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (86, 5, 1, 1, '2019-05-15', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '09:40:33', 0, '', '2019-05-15 09:40:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (87, 5, 1, 3, '2019-05-15', 30.00, 1, 'bandeja de ungurahui', '11:09:20', 0, '001-1', '2019-05-15 11:09:20', NULL, NULL, NULL, 3.32, 1);
INSERT INTO `movimiento` VALUES (88, 5, 1, 1, '2019-05-15', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:41:28', 0, '', '2019-05-15 11:41:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (89, 5, 1, 1, '2019-05-15', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:43:17', 0, '', '2019-05-15 11:43:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (90, 5, 1, 1, '2019-05-15', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:06:53', 0, '', '2019-05-15 12:06:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (91, 5, 1, 1, '2019-05-15', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:27:18', 0, '', '2019-05-15 12:27:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (92, 5, 1, 1, '2019-05-15', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:32:17', 0, '', '2019-05-15 12:32:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (93, 5, 1, 1, '2019-05-15', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:55:51', 0, '', '2019-05-15 12:55:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (94, 5, 1, 3, '2019-05-15', 4.00, 1, 'pasaje de motokar para traer hielo', '13:08:08', 0, '001-1', '2019-05-15 13:08:08', NULL, NULL, NULL, 3.32, 1);
INSERT INTO `movimiento` VALUES (95, 5, 1, 1, '2019-05-15', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:14:45', 0, '', '2019-05-15 15:14:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (96, 5, 1, 3, '2019-05-15', 8.00, 1, 'hielo ', '15:26:34', 0, '001-1', '2019-05-15 15:26:34', NULL, NULL, NULL, 3.32, 1);
INSERT INTO `movimiento` VALUES (97, 5, 1, 1, '2019-05-15', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:31:43', 0, '', '2019-05-15 15:31:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (98, 5, 1, 1, '2019-05-15', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:32:28', 0, '', '2019-05-15 15:32:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (99, 5, 1, 1, '2019-05-15', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:34:36', 0, '', '2019-05-15 15:34:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (100, 5, 1, 1, '2019-05-15', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:56:40', 0, '', '2019-05-15 15:56:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (101, 5, 1, 1, '2019-05-15', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:14:18', 0, '', '2019-05-15 16:14:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (102, 5, 1, 1, '2019-05-15', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:30:40', 0, '', '2019-05-15 16:30:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (103, 5, 1, 1, '2019-05-15', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:37:56', 0, '', '2019-05-15 16:37:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (104, 5, 1, 1, '2019-05-15', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:40:05', 0, '', '2019-05-15 16:40:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (105, 5, 1, 1, '2019-05-15', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:43:48', 0, '', '2019-05-15 16:43:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (106, 5, 1, 1, '2019-05-15', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:46:09', 0, '', '2019-05-15 16:46:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (107, 5, 1, 1, '2019-05-15', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:56:13', 0, '', '2019-05-15 16:56:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (108, 5, 1, 1, '2019-05-15', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:14:27', 0, '', '2019-05-15 17:14:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (109, 5, 1, 1, '2019-05-15', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:25:48', 0, '', '2019-05-15 17:25:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (110, 5, 1, 1, '2019-05-15', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:43:10', 0, '', '2019-05-15 17:43:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (111, 5, 1, 1, '2019-05-15', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:46:36', 0, '', '2019-05-15 17:46:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (112, 5, 1, 1, '2019-05-15', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:48:06', 0, '', '2019-05-15 17:48:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (113, 5, 1, 1, '2019-05-15', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:59:46', 0, '', '2019-05-15 17:59:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (114, 5, 1, 1, '2019-05-15', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:00:10', 0, '', '2019-05-15 18:00:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (115, 5, 1, 1, '2019-05-15', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:06:41', 0, '', '2019-05-15 18:06:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (116, 5, 1, 1, '2019-05-15', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:16:58', 0, '', '2019-05-15 18:16:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (117, 5, 1, 1, '2019-05-15', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:21:55', 0, '', '2019-05-15 18:21:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (118, 5, 1, 1, '2019-05-15', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:43:33', 0, '', '2019-05-15 18:43:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (119, 5, 1, 1, '2019-05-15', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:53:29', 0, '', '2019-05-15 18:53:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (120, 5, 1, 3, '2019-05-15', 2.00, 1, 'gasolina de pedro', '19:05:13', 0, '001-1', '2019-05-15 19:05:13', NULL, NULL, NULL, 3.32, 1);
INSERT INTO `movimiento` VALUES (121, 5, 1, 1, '2019-05-15', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:11:55', 0, '', '2019-05-15 19:11:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (122, 5, 1, 1, '2019-05-15', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:16:01', 0, '', '2019-05-15 19:16:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (123, 5, 1, 1, '2019-05-15', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:30:14', 0, '', '2019-05-15 19:30:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (124, 5, 1, 1, '2019-05-15', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:32:36', 0, '', '2019-05-15 19:32:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (125, 5, 1, 1, '2019-05-15', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:47:02', 0, '', '2019-05-15 19:47:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (126, 5, 1, 1, '2019-05-15', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:08:08', 0, '', '2019-05-15 20:08:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (127, 5, 1, 1, '2019-05-15', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:19:02', 0, '', '2019-05-15 20:19:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (128, 5, 1, 1, '2019-05-15', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:36:49', 0, '', '2019-05-15 20:36:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (129, 5, 1, 1, '2019-05-15', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:06:29', 0, '', '2019-05-15 21:06:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (130, 5, 1, 1, '2019-05-15', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:09:50', 0, '', '2019-05-15 21:09:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (131, 7, 1, 3, '2019-05-16', 8.00, 1, 'Produccion', '10:03:59', 0, '001-1', '2019-05-16 10:03:59', NULL, NULL, NULL, 3.32, 1);
INSERT INTO `movimiento` VALUES (132, 7, 1, 3, '2019-05-16', 4.00, 1, 'pasaje de motokar para traer hielo', '10:05:55', 0, '001-1', '2019-05-16 10:05:55', NULL, NULL, NULL, 3.32, 1);
INSERT INTO `movimiento` VALUES (133, 7, 1, 1, '2019-05-16', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:03:50', 0, '', '2019-05-16 11:03:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (134, 7, 1, 1, '2019-05-16', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:42:47', 0, '', '2019-05-16 12:42:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (135, 7, 1, 1, '2019-05-16', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:57:29', 0, '', '2019-05-16 12:57:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (136, 7, 1, 1, '2019-05-16', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:23:13', 0, '', '2019-05-16 15:23:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (137, 7, 1, 1, '2019-05-16', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:57:24', 0, '', '2019-05-16 15:57:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (138, 7, 1, 1, '2019-05-16', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:15:48', 0, '', '2019-05-16 16:15:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (139, 7, 1, 1, '2019-05-16', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:18:22', 0, '', '2019-05-16 16:18:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (140, 7, 1, 1, '2019-05-16', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:22:29', 0, '', '2019-05-16 16:22:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (141, 7, 1, 1, '2019-05-16', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:31:51', 0, '', '2019-05-16 16:31:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (142, 7, 1, 1, '2019-05-16', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:48:22', 0, '', '2019-05-16 16:48:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (143, 7, 1, 1, '2019-05-16', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:51:32', 0, '', '2019-05-16 16:51:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (144, 7, 1, 1, '2019-05-16', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:58:50', 0, '', '2019-05-16 16:58:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (145, 7, 1, 1, '2019-05-16', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:06:16', 0, '', '2019-05-16 17:06:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (146, 7, 1, 1, '2019-05-16', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:09:32', 0, '', '2019-05-16 17:09:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (147, 7, 1, 1, '2019-05-16', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:11:46', 0, '', '2019-05-16 17:11:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (148, 7, 1, 1, '2019-05-16', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:12:51', 0, '', '2019-05-16 17:12:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (149, 7, 1, 1, '2019-05-16', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:13:20', 0, '', '2019-05-16 17:13:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (150, 7, 1, 1, '2019-05-16', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:21:26', 0, '', '2019-05-16 17:21:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (151, 7, 1, 1, '2019-05-16', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:26:32', 0, '', '2019-05-16 17:26:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (152, 7, 1, 1, '2019-05-16', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:33:37', 0, '', '2019-05-16 17:33:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (153, 7, 1, 1, '2019-05-16', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:48:05', 0, '', '2019-05-16 17:48:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (154, 7, 1, 1, '2019-05-16', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:48:54', 0, '', '2019-05-16 17:48:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (155, 7, 1, 1, '2019-05-16', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:11:08', 0, '', '2019-05-16 18:11:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (156, 7, 1, 1, '2019-05-16', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:13:20', 0, '', '2019-05-16 18:13:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (157, 7, 1, 1, '2019-05-16', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:19:50', 0, '', '2019-05-16 18:19:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (158, 7, 1, 1, '2019-05-16', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:22:42', 0, '', '2019-05-16 18:22:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (159, 7, 1, 1, '2019-05-16', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:39:47', 0, '', '2019-05-16 18:39:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (160, 7, 1, 1, '2019-05-16', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:40:43', 0, '', '2019-05-16 18:40:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (161, 7, 1, 1, '2019-05-16', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:46:32', 0, '', '2019-05-16 18:46:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (162, 7, 1, 1, '2019-05-16', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:48:02', 0, '', '2019-05-16 18:48:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (163, 7, 1, 1, '2019-05-16', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:50:14', 0, '', '2019-05-16 18:50:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (164, 7, 1, 1, '2019-05-16', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:52:49', 0, '', '2019-05-16 18:52:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (165, 7, 1, 1, '2019-05-16', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:07:51', 0, '', '2019-05-16 19:07:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (166, 7, 1, 1, '2019-05-16', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:09:53', 0, '', '2019-05-16 19:09:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (167, 7, 1, 1, '2019-05-16', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:10:42', 0, '', '2019-05-16 19:10:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (168, 7, 1, 1, '2019-05-16', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:11:23', 0, '', '2019-05-16 19:11:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (169, 7, 1, 1, '2019-05-16', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:11:46', 0, '', '2019-05-16 19:11:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (170, 7, 1, 1, '2019-05-16', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:17:46', 0, '', '2019-05-16 19:17:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (171, 7, 1, 1, '2019-05-16', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:22:36', 0, '', '2019-05-16 19:22:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (172, 7, 1, 1, '2019-05-16', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:25:59', 0, '', '2019-05-16 19:25:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (173, 7, 1, 3, '2019-05-16', 5.00, 1, 'servilleta milagros', '19:59:07', 0, '001-1', '2019-05-16 19:59:07', NULL, NULL, NULL, 3.32, 1);
INSERT INTO `movimiento` VALUES (174, 7, 1, 1, '2019-05-16', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:11:41', 0, '', '2019-05-16 20:11:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (175, 7, 1, 1, '2019-05-16', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:39:43', 0, '', '2019-05-16 20:39:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (176, 7, 1, 1, '2019-05-16', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:44:25', 0, '', '2019-05-16 20:44:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (177, 7, 1, 1, '2019-05-16', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:59:19', 0, '', '2019-05-16 20:59:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (178, 7, 1, 3, '2019-05-16', 50.00, 1, 'keke', '21:03:43', 0, '001-1', '2019-05-16 21:03:43', NULL, NULL, NULL, 3.32, 1);
INSERT INTO `movimiento` VALUES (179, 9, 1, 1, '2019-05-17', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '09:24:01', 0, '', '2019-05-17 09:24:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (180, 9, 1, 1, '2019-05-17', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:58:38', 0, '', '2019-05-17 10:58:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (181, 9, 1, 1, '2019-05-17', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:13:45', 0, '', '2019-05-17 11:13:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (182, 9, 1, 3, '2019-05-17', 1.50, 1, 'Produccion', '11:24:49', 0, '001-1', '2019-05-17 11:24:49', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (183, 9, 1, 1, '2019-05-17', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:33:19', 0, '', '2019-05-17 11:33:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (184, 9, 1, 1, '2019-05-17', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:37:18', 0, '', '2019-05-17 11:37:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (185, 9, 1, 1, '2019-05-17', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:47:30', 0, '', '2019-05-17 11:47:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (186, 9, 1, 1, '2019-05-17', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:50:14', 0, '', '2019-05-17 11:50:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (187, 9, 1, 1, '2019-05-17', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:51:21', 0, '', '2019-05-17 11:51:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (188, 9, 1, 1, '2019-05-17', 50.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:32:20', 0, '', '2019-05-17 12:32:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (189, 9, 1, 1, '2019-05-17', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:36:51', 0, '', '2019-05-17 12:36:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (190, 9, 1, 1, '2019-05-17', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:00:38', 0, '', '2019-05-17 13:00:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (191, 9, 1, 1, '2019-05-17', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:53:38', 0, '', '2019-05-17 15:53:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (192, 9, 1, 1, '2019-05-17', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:26:30', 0, '', '2019-05-17 16:26:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (193, 9, 1, 1, '2019-05-17', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:37:26', 0, '', '2019-05-17 16:37:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (194, 9, 1, 1, '2019-05-17', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:45:41', 0, '', '2019-05-17 16:45:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (195, 9, 1, 1, '2019-05-17', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:49:18', 0, '', '2019-05-17 16:49:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (196, 9, 1, 1, '2019-05-17', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:01:30', 0, '', '2019-05-17 17:01:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (197, 9, 1, 1, '2019-05-17', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:03:01', 0, '', '2019-05-17 17:03:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (198, 9, 1, 1, '2019-05-17', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:05:17', 0, '', '2019-05-17 17:05:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (199, 9, 1, 1, '2019-05-17', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:24:50', 0, '', '2019-05-17 17:24:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (200, 9, 1, 1, '2019-05-17', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:37:59', 0, '', '2019-05-17 17:37:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (201, 9, 1, 1, '2019-05-17', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:42:59', 0, '', '2019-05-17 17:42:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (202, 9, 1, 1, '2019-05-17', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:43:32', 0, '', '2019-05-17 17:43:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (203, 9, 1, 1, '2019-05-17', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:56:24', 0, '', '2019-05-17 17:56:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (204, 9, 1, 1, '2019-05-17', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:03:03', 0, '', '2019-05-17 18:03:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (205, 9, 1, 1, '2019-05-17', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:14:07', 0, '', '2019-05-17 18:14:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (206, 9, 1, 1, '2019-05-17', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:15:02', 0, '', '2019-05-17 18:15:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (207, 9, 1, 1, '2019-05-17', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:16:15', 0, '', '2019-05-17 18:16:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (208, 9, 1, 1, '2019-05-17', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:16:56', 0, '', '2019-05-17 18:16:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (209, 9, 1, 1, '2019-05-17', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:18:54', 0, '', '2019-05-17 18:18:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (210, 9, 1, 1, '2019-05-17', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:49:04', 0, '', '2019-05-17 18:49:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (211, 9, 1, 1, '2019-05-17', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:54:52', 0, '', '2019-05-17 18:54:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (212, 9, 1, 1, '2019-05-17', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:58:37', 0, '', '2019-05-17 18:58:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (213, 9, 1, 1, '2019-05-17', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:15:55', 0, '', '2019-05-17 19:15:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (214, 9, 1, 1, '2019-05-17', 25.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:19:08', 0, '', '2019-05-17 19:19:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (215, 9, 1, 1, '2019-05-17', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:21:15', 0, '', '2019-05-17 19:21:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (216, 9, 1, 1, '2019-05-17', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:37:25', 0, '', '2019-05-17 19:37:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (217, 9, 1, 1, '2019-05-17', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:39:11', 0, '', '2019-05-17 19:39:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (218, 9, 1, 1, '2019-05-17', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:47:41', 0, '', '2019-05-17 19:47:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (219, 9, 1, 1, '2019-05-17', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:48:12', 0, '', '2019-05-17 19:48:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (220, 9, 1, 1, '2019-05-17', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:53:06', 0, '', '2019-05-17 19:53:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (221, 9, 1, 1, '2019-05-17', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:03:34', 0, '', '2019-05-17 20:03:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (222, 9, 1, 1, '2019-05-17', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:18:04', 0, '', '2019-05-17 20:18:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (223, 9, 1, 1, '2019-05-17', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:20:45', 0, '', '2019-05-17 20:20:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (224, 9, 1, 1, '2019-05-17', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:21:53', 0, '', '2019-05-17 20:21:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (225, 9, 1, 1, '2019-05-17', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:24:28', 0, '', '2019-05-17 20:24:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (226, 9, 1, 1, '2019-05-17', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:25:00', 0, '', '2019-05-17 20:25:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (227, 9, 1, 1, '2019-05-17', 24.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:28:41', 0, '', '2019-05-17 20:28:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (228, 9, 1, 1, '2019-05-17', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:34:28', 0, '', '2019-05-17 20:34:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (229, 9, 1, 1, '2019-05-17', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:46:52', 0, '', '2019-05-17 20:46:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (230, 9, 1, 1, '2019-05-17', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:50:06', 0, '', '2019-05-17 20:50:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (231, 9, 1, 1, '2019-05-17', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:08:54', 0, '', '2019-05-17 21:08:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (232, 9, 1, 1, '2019-05-17', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:13:42', 0, '', '2019-05-17 21:13:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (233, 9, 1, 1, '2019-05-17', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:28:21', 0, '', '2019-05-17 21:28:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (234, 9, 1, 1, '2019-05-17', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:32:53', 0, '', '2019-05-17 21:32:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (235, 11, 1, 3, '2019-05-18', 8.00, 1, 'Produccion', '09:56:25', 0, '001-1', '2019-05-18 09:56:25', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (236, 11, 1, 3, '2019-05-18', 4.00, 1, 'pasaje de motokar para traer hielo', '09:56:45', 0, '001-1', '2019-05-18 09:56:45', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (237, 11, 1, 3, '2019-05-18', 100.00, 1, 'adelanto de sueldo', '10:02:02', 0, '001-1', '2019-05-18 10:02:02', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (238, 11, 1, 3, '2019-05-18', 4.00, 1, 'Produccion', '10:02:45', 0, '001-1', '2019-05-18 10:02:45', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (239, 11, 1, 3, '2019-05-18', 13.00, 1, 'tabla de cortar y jarra', '10:03:24', 0, '001-1', '2019-05-18 10:03:24', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (240, 11, 1, 3, '2019-05-18', 17.00, 1, 'barra de queso / pan molde', '10:04:03', 0, '001-1', '2019-05-18 10:04:03', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (241, 11, 1, 1, '2019-05-18', 0.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:13:38', 0, '', '2019-05-18 10:13:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (242, 11, 1, 1, '2019-05-18', 0.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:42:35', 0, '', '2019-05-18 10:42:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (243, 11, 1, 1, '2019-05-18', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:54:27', 0, '', '2019-05-18 10:54:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (244, 11, 1, 1, '2019-05-18', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:16:31', 0, '', '2019-05-18 11:16:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (245, 11, 1, 1, '2019-05-18', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:17:35', 0, '', '2019-05-18 11:17:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (246, 11, 1, 1, '2019-05-18', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:18:04', 0, '', '2019-05-18 11:18:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (247, 11, 1, 1, '2019-05-18', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:42:19', 0, '', '2019-05-18 11:42:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (248, 11, 1, 1, '2019-05-18', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:48:09', 0, '', '2019-05-18 11:48:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (249, 11, 1, 3, '2019-05-18', 10.00, 1, 'leche', '11:50:27', 0, '001-1', '2019-05-18 11:50:27', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (250, 11, 1, 3, '2019-05-18', 2.00, 1, 'sal de mesa', '12:27:10', 0, '001-1', '2019-05-18 12:27:10', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (251, 11, 1, 1, '2019-05-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:30:15', 0, '', '2019-05-18 12:30:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (252, 11, 1, 1, '2019-05-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:31:10', 0, '', '2019-05-18 12:31:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (253, 11, 1, 1, '2019-05-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:55:00', 0, '', '2019-05-18 12:55:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (254, 11, 1, 1, '2019-05-18', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:03:32', 0, '', '2019-05-18 13:03:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (255, 11, 1, 1, '2019-05-18', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:38:01', 0, '', '2019-05-18 15:38:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (256, 11, 1, 1, '2019-05-18', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:49:07', 0, '', '2019-05-18 15:49:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (257, 11, 1, 1, '2019-05-18', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:07:12', 0, '', '2019-05-18 16:07:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (258, 11, 1, 1, '2019-05-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:07:48', 0, '', '2019-05-18 16:07:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (259, 11, 1, 1, '2019-05-18', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:18:33', 0, '', '2019-05-18 16:18:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (260, 11, 1, 1, '2019-05-18', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:26:28', 0, '', '2019-05-18 16:26:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (261, 11, 1, 1, '2019-05-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:48:53', 0, '', '2019-05-18 16:48:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (262, 11, 1, 1, '2019-05-18', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:50:35', 0, '', '2019-05-18 16:50:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (263, 11, 1, 1, '2019-05-18', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:55:46', 0, '', '2019-05-18 16:55:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (264, 11, 1, 1, '2019-05-18', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:01:21', 0, '', '2019-05-18 17:01:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (265, 11, 1, 1, '2019-05-18', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:05:17', 0, '', '2019-05-18 17:05:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (266, 11, 1, 1, '2019-05-18', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:09:33', 0, '', '2019-05-18 17:09:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (267, 11, 1, 1, '2019-05-18', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:15:32', 0, '', '2019-05-18 17:15:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (268, 11, 1, 1, '2019-05-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:16:42', 0, '', '2019-05-18 17:16:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (269, 11, 1, 1, '2019-05-18', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:18:09', 0, '', '2019-05-18 17:18:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (270, 11, 1, 1, '2019-05-18', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:18:30', 0, '', '2019-05-18 17:18:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (271, 11, 1, 1, '2019-05-18', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:27:32', 0, '', '2019-05-18 17:27:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (272, 11, 1, 1, '2019-05-18', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:28:44', 0, '', '2019-05-18 17:28:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (273, 11, 1, 1, '2019-05-18', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:29:38', 0, '', '2019-05-18 17:29:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (274, 11, 1, 1, '2019-05-18', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:00:03', 0, '', '2019-05-18 18:00:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (275, 11, 1, 1, '2019-05-18', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:08:53', 0, '', '2019-05-18 18:08:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (276, 11, 1, 1, '2019-05-18', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:10:24', 0, '', '2019-05-18 18:10:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (277, 11, 1, 1, '2019-05-18', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:11:09', 0, '', '2019-05-18 18:11:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (278, 11, 1, 1, '2019-05-18', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:13:06', 0, '', '2019-05-18 18:13:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (279, 11, 1, 1, '2019-05-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:19:56', 0, '', '2019-05-18 18:19:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (280, 11, 1, 1, '2019-05-18', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:21:04', 0, '', '2019-05-18 18:21:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (281, 11, 1, 1, '2019-05-18', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:23:21', 0, '', '2019-05-18 18:23:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (282, 11, 1, 1, '2019-05-18', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:25:52', 0, '', '2019-05-18 18:25:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (283, 11, 1, 1, '2019-05-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:27:00', 0, '', '2019-05-18 18:27:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (284, 11, 1, 1, '2019-05-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:27:31', 0, '', '2019-05-18 18:27:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (285, 11, 1, 1, '2019-05-18', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:27:54', 0, '', '2019-05-18 18:27:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (286, 11, 1, 1, '2019-05-18', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:29:20', 0, '', '2019-05-18 18:29:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (287, 11, 1, 1, '2019-05-18', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:34:35', 0, '', '2019-05-18 18:34:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (288, 11, 1, 1, '2019-05-18', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:36:35', 0, '', '2019-05-18 18:36:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (289, 11, 1, 1, '2019-05-18', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:38:34', 0, '', '2019-05-18 18:38:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (290, 11, 1, 1, '2019-05-18', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:38:57', 0, '', '2019-05-18 18:38:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (291, 11, 1, 1, '2019-05-18', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:44:50', 0, '', '2019-05-18 18:44:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (292, 11, 1, 1, '2019-05-18', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:46:24', 0, '', '2019-05-18 18:46:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (293, 11, 1, 1, '2019-05-18', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:48:22', 0, '', '2019-05-18 18:48:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (294, 11, 1, 1, '2019-05-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:57:32', 0, '', '2019-05-18 18:57:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (295, 11, 1, 1, '2019-05-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:58:21', 0, '', '2019-05-18 18:58:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (296, 11, 1, 1, '2019-05-18', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:05:49', 0, '', '2019-05-18 19:05:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (297, 11, 1, 1, '2019-05-18', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:09:01', 0, '', '2019-05-18 19:09:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (298, 11, 1, 1, '2019-05-18', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:10:36', 0, '', '2019-05-18 19:10:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (299, 11, 1, 1, '2019-05-18', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:11:03', 0, '', '2019-05-18 19:11:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (300, 11, 1, 1, '2019-05-18', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:11:45', 0, '', '2019-05-18 19:11:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (301, 11, 1, 1, '2019-05-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:22:53', 0, '', '2019-05-18 19:22:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (302, 11, 1, 1, '2019-05-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:23:42', 0, '', '2019-05-18 19:23:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (303, 11, 1, 1, '2019-05-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:29:22', 0, '', '2019-05-18 19:29:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (304, 11, 1, 1, '2019-05-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:51:11', 0, '', '2019-05-18 19:51:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (305, 11, 1, 1, '2019-05-18', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:59:21', 0, '', '2019-05-18 19:59:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (306, 11, 1, 1, '2019-05-18', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:21:47', 0, '', '2019-05-18 20:21:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (307, 11, 1, 1, '2019-05-18', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:28:49', 0, '', '2019-05-18 20:28:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (308, 11, 1, 1, '2019-05-18', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:38:33', 0, '', '2019-05-18 20:38:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (309, 11, 1, 1, '2019-05-18', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:43:05', 0, '', '2019-05-18 20:43:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (310, 11, 1, 1, '2019-05-18', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:48:22', 0, '', '2019-05-18 20:48:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (311, 11, 1, 1, '2019-05-18', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:50:33', 0, '', '2019-05-18 20:50:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (312, 11, 1, 1, '2019-05-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:55:54', 0, '', '2019-05-18 20:55:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (313, 11, 1, 1, '2019-05-18', 0.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:57:18', 0, '', '2019-05-18 20:57:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (314, 11, 1, 1, '2019-05-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:00:48', 0, '', '2019-05-18 21:00:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (315, 11, 1, 1, '2019-05-18', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:01:41', 0, '', '2019-05-18 21:01:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (316, 11, 1, 1, '2019-05-18', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:05:46', 0, '', '2019-05-18 21:05:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (317, 11, 1, 1, '2019-05-18', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:06:07', 0, '', '2019-05-18 21:06:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (318, 15, 1, 1, '2019-05-19', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:50:21', 0, '', '2019-05-19 11:50:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (319, 15, 1, 1, '2019-05-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:51:54', 0, '', '2019-05-19 11:51:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (320, 15, 1, 1, '2019-05-19', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:17:50', 0, '', '2019-05-19 12:17:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (321, 15, 1, 1, '2019-05-19', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:18:46', 0, '', '2019-05-19 12:18:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (322, 15, 1, 1, '2019-05-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:19:17', 0, '', '2019-05-19 12:19:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (323, 15, 1, 1, '2019-05-19', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:31:23', 0, '', '2019-05-19 12:31:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (324, 15, 1, 3, '2019-05-19', 16.00, 1, 'Falla de sistema que cobro de mas al boletear', '12:39:01', 0, '001-1', '2019-05-19 12:39:01', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (325, 15, 1, 1, '2019-05-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:50:17', 0, '', '2019-05-19 12:50:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (326, 15, 1, 1, '2019-05-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:01:35', 0, '', '2019-05-19 13:01:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (327, 15, 1, 1, '2019-05-19', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:28:55', 0, '', '2019-05-19 15:28:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (328, 15, 1, 1, '2019-05-19', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:29:17', 0, '', '2019-05-19 15:29:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (329, 15, 1, 1, '2019-05-19', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:33:59', 0, '', '2019-05-19 15:33:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (330, 15, 1, 1, '2019-05-19', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:58:43', 0, '', '2019-05-19 15:58:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (331, 15, 1, 3, '2019-05-19', 10.00, 1, 'servilleta milagros', '16:00:31', 0, '001-1', '2019-05-19 16:00:31', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (332, 15, 1, 1, '2019-05-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:04:26', 0, '', '2019-05-19 16:04:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (333, 15, 1, 1, '2019-05-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:11:30', 0, '', '2019-05-19 16:11:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (334, 15, 1, 1, '2019-05-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:17:00', 0, '', '2019-05-19 16:17:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (335, 15, 1, 1, '2019-05-19', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:40:06', 0, '', '2019-05-19 16:40:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (336, 15, 1, 1, '2019-05-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:40:37', 0, '', '2019-05-19 16:40:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (337, 15, 1, 1, '2019-05-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:45:57', 0, '', '2019-05-19 16:45:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (338, 15, 1, 1, '2019-05-19', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:48:04', 0, '', '2019-05-19 16:48:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (339, 15, 1, 1, '2019-05-19', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:51:06', 0, '', '2019-05-19 16:51:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (340, 15, 1, 1, '2019-05-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:55:31', 0, '', '2019-05-19 16:55:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (341, 15, 1, 1, '2019-05-19', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:55:54', 0, '', '2019-05-19 16:55:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (342, 15, 1, 1, '2019-05-19', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:03:08', 0, '', '2019-05-19 17:03:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (343, 15, 1, 1, '2019-05-19', 0.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:09:15', 0, '', '2019-05-19 17:09:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (344, 15, 1, 1, '2019-05-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:10:18', 0, '', '2019-05-19 17:10:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (345, 15, 1, 1, '2019-05-19', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:14:35', 0, '', '2019-05-19 17:14:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (346, 15, 1, 1, '2019-05-19', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:16:40', 0, '', '2019-05-19 17:16:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (347, 15, 1, 1, '2019-05-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:27:08', 0, '', '2019-05-19 17:27:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (348, 15, 1, 1, '2019-05-19', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:27:45', 0, '', '2019-05-19 17:27:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (349, 15, 1, 1, '2019-05-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:29:49', 0, '', '2019-05-19 17:29:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (350, 15, 1, 1, '2019-05-19', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:39:42', 0, '', '2019-05-19 17:39:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (351, 15, 1, 1, '2019-05-19', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:46:33', 0, '', '2019-05-19 17:46:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (352, 15, 1, 1, '2019-05-19', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:54:11', 0, '', '2019-05-19 17:54:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (353, 15, 1, 1, '2019-05-19', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:54:39', 0, '', '2019-05-19 17:54:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (354, 15, 1, 1, '2019-05-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:59:38', 0, '', '2019-05-19 17:59:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (355, 15, 1, 1, '2019-05-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:01:33', 0, '', '2019-05-19 18:01:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (356, 15, 1, 1, '2019-05-19', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:05:14', 0, '', '2019-05-19 18:05:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (357, 15, 1, 1, '2019-05-19', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:08:39', 0, '', '2019-05-19 18:08:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (358, 15, 1, 1, '2019-05-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:09:58', 0, '', '2019-05-19 18:09:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (359, 15, 1, 1, '2019-05-19', 31.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:14:12', 0, '', '2019-05-19 18:14:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (360, 15, 1, 1, '2019-05-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:15:23', 0, '', '2019-05-19 18:15:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (361, 15, 1, 1, '2019-05-19', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:16:22', 0, '', '2019-05-19 18:16:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (362, 15, 1, 1, '2019-05-19', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:18:38', 0, '', '2019-05-19 18:18:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (363, 15, 1, 1, '2019-05-19', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:23:32', 0, '', '2019-05-19 18:23:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (364, 15, 1, 1, '2019-05-19', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:26:02', 0, '', '2019-05-19 18:26:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (365, 15, 1, 1, '2019-05-19', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:27:34', 0, '', '2019-05-19 18:27:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (366, 15, 1, 1, '2019-05-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:30:45', 0, '', '2019-05-19 18:30:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (367, 15, 1, 1, '2019-05-19', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:43:45', 0, '', '2019-05-19 18:43:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (368, 15, 1, 1, '2019-05-19', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:45:55', 0, '', '2019-05-19 18:45:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (369, 15, 1, 1, '2019-05-19', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:46:29', 0, '', '2019-05-19 18:46:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (370, 15, 1, 1, '2019-05-19', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:46:58', 0, '', '2019-05-19 18:46:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (371, 15, 1, 1, '2019-05-19', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:56:58', 0, '', '2019-05-19 18:56:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (372, 15, 1, 1, '2019-05-19', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:57:26', 0, '', '2019-05-19 18:57:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (373, 15, 1, 1, '2019-05-19', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:02:47', 0, '', '2019-05-19 19:02:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (374, 15, 1, 1, '2019-05-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:10:26', 0, '', '2019-05-19 19:10:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (375, 15, 1, 1, '2019-05-19', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:11:51', 0, '', '2019-05-19 19:11:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (376, 15, 1, 1, '2019-05-19', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:19:34', 0, '', '2019-05-19 19:19:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (377, 15, 1, 1, '2019-05-19', 0.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:25:54', 0, '', '2019-05-19 19:25:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (378, 15, 1, 1, '2019-05-19', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:30:10', 0, '', '2019-05-19 19:30:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (379, 15, 1, 1, '2019-05-19', 27.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:30:55', 0, '', '2019-05-19 19:30:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (380, 15, 1, 1, '2019-05-19', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:31:32', 0, '', '2019-05-19 19:31:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (381, 15, 1, 1, '2019-05-19', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:32:20', 0, '', '2019-05-19 19:32:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (382, 15, 1, 1, '2019-05-19', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:32:39', 0, '', '2019-05-19 19:32:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (383, 15, 1, 1, '2019-05-19', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:41:12', 0, '', '2019-05-19 19:41:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (384, 15, 1, 1, '2019-05-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:48:09', 0, '', '2019-05-19 19:48:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (385, 15, 1, 1, '2019-05-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:11:27', 0, '', '2019-05-19 20:11:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (386, 15, 1, 1, '2019-05-19', 0.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:11:56', 0, '', '2019-05-19 20:11:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (387, 15, 1, 1, '2019-05-19', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:50:42', 0, '', '2019-05-19 20:50:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (388, 15, 1, 1, '2019-05-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:57:57', 0, '', '2019-05-19 20:57:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (389, 15, 1, 1, '2019-05-19', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:00:13', 0, '', '2019-05-19 21:00:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (390, 15, 1, 1, '2019-05-19', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:00:44', 0, '', '2019-05-19 21:00:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (391, 15, 1, 1, '2019-05-19', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:01:40', 0, '', '2019-05-19 21:01:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (392, 15, 1, 1, '2019-05-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:02:18', 0, '', '2019-05-19 21:02:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (393, 15, 1, 1, '2019-05-19', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:03:35', 0, '', '2019-05-19 21:03:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (394, 15, 1, 3, '2019-05-19', 2.00, 1, 'pasaje de motokar de Anicia', '21:13:15', 0, '001-1', '2019-05-19 21:13:15', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (395, 15, 1, 3, '2019-05-19', 72.00, 1, 'Produccion', '21:17:23', 0, '001-1', '2019-05-19 21:17:23', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (396, 15, 1, 3, '2019-05-19', 8.00, 1, 'Produccion', '21:18:12', 0, '001-1', '2019-05-19 21:18:12', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (397, 15, 1, 3, '2019-05-19', 17.00, 1, 'Produccion', '21:19:08', 0, '001-1', '2019-05-19 21:19:08', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (398, 15, 1, 3, '2019-05-19', 16.00, 1, 'Produccion', '21:19:39', 0, '001-1', '2019-05-19 21:19:39', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (399, 15, 1, 3, '2019-05-19', 25.00, 1, 'pago de henry , por trabajar dia lunes', '21:28:51', 0, '001-1', '2019-05-19 21:28:51', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (400, 15, 1, 3, '2019-05-19', 25.00, 1, 'por trabajar dia domingo a rommy garcia', '21:29:30', 0, '001-1', '2019-05-19 21:29:30', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (401, 15, 1, 1, '2019-05-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:36:27', 0, '', '2019-05-19 21:36:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (402, 15, 1, 1, '2019-05-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:43:04', 0, '', '2019-05-19 21:43:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (403, 15, 1, 1, '2019-05-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:43:50', 0, '', '2019-05-19 21:43:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (404, 15, 1, 1, '2019-05-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:56:25', 0, '', '2019-05-19 21:56:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (405, 15, 1, 1, '2019-05-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:00:44', 0, '', '2019-05-19 22:00:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (406, 15, 1, 1, '2019-05-19', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:01:00', 0, '', '2019-05-19 22:01:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (407, 15, 1, 1, '2019-05-19', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:25:18', 0, '', '2019-05-19 22:25:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (408, 15, 1, 3, '2019-05-19', 10.00, 1, 'tiempo extra', '22:32:12', 0, '001-1', '2019-05-19 22:32:12', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (409, 15, 1, 3, '2019-05-19', 10.00, 1, 'tiempo extra', '22:32:48', 0, '001-1', '2019-05-19 22:32:48', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (410, 17, 1, 9, '2019-05-21', 50.00, 1, 'Produccion', '09:33:28', 0, '001-1', '2019-05-21 09:33:28', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (411, 17, 1, 9, '2019-05-21', 8.00, 1, 'Produccion', '09:33:54', 0, '001-1', '2019-05-21 09:33:54', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (412, 17, 1, 3, '2019-05-21', 88.00, 1, 'Produccion', '09:35:10', 0, '001-1', '2019-05-21 09:35:10', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (413, 17, 1, 9, '2019-05-21', 71.00, 1, 'Produccion', '09:36:53', 0, '001-1', '2019-05-21 09:36:53', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (414, 17, 1, 9, '2019-05-21', 71.00, 1, 'Produccion (leche gloria)', '09:38:12', 0, '001-1', '2019-05-21 09:38:12', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (415, 17, 1, 9, '2019-05-21', 12.00, 1, 'pasaje de motokar para traer las cosas que se comprò', '09:39:06', 0, '001-1', '2019-05-21 09:39:06', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (416, 17, 1, 9, '2019-05-21', 143.00, 1, 'Produccion', '09:44:00', 0, '001-1', '2019-05-21 09:44:00', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (417, 19, 1, 9, '2019-05-21', 3.00, 1, 'papel higienico', '10:44:18', 0, '001-1', '2019-05-21 10:44:18', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (418, 19, 1, 1, '2019-05-21', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:05:11', 0, '', '2019-05-21 11:05:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (419, 19, 1, 10, '2019-05-21', 90.00, 1, 'no se pudo depositar', '11:16:32', 0, '', '2019-05-21 11:16:32', NULL, NULL, NULL, 0.00, 1);
INSERT INTO `movimiento` VALUES (420, 19, 1, 9, '2019-05-21', 58.00, 1, '2 kekes', '11:17:18', 0, '001-1', '2019-05-21 11:17:18', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (421, 19, 1, 1, '2019-05-21', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:38:02', 0, '', '2019-05-21 11:38:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (422, 19, 1, 1, '2019-05-21', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:39:42', 0, '', '2019-05-21 11:39:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (423, 19, 1, 1, '2019-05-21', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:58:25', 0, '', '2019-05-21 11:58:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (424, 19, 1, 1, '2019-05-21', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:00:27', 0, '', '2019-05-21 12:00:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (425, 19, 1, 1, '2019-05-21', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:05:45', 0, '', '2019-05-21 12:05:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (426, 19, 1, 1, '2019-05-21', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:19:25', 0, '', '2019-05-21 12:19:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (427, 19, 1, 1, '2019-05-21', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:29:43', 0, '', '2019-05-21 12:29:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (428, 19, 1, 1, '2019-05-21', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:43:28', 0, '', '2019-05-21 12:43:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (429, 19, 1, 1, '2019-05-21', 0.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:39:22', 0, '', '2019-05-21 15:39:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (430, 19, 1, 1, '2019-05-21', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:40:03', 0, '', '2019-05-21 15:40:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (431, 19, 1, 1, '2019-05-21', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:55:01', 0, '', '2019-05-21 15:55:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (432, 19, 1, 1, '2019-05-21', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:01:16', 0, '', '2019-05-21 16:01:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (433, 19, 1, 1, '2019-05-21', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:03:06', 0, '', '2019-05-21 16:03:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (434, 19, 1, 1, '2019-05-21', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:09:59', 0, '', '2019-05-21 16:09:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (435, 19, 1, 1, '2019-05-21', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:37:58', 0, '', '2019-05-21 16:37:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (436, 19, 1, 1, '2019-05-21', 27.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:12:35', 0, '', '2019-05-21 17:12:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (437, 19, 1, 1, '2019-05-21', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:18:34', 0, '', '2019-05-21 17:18:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (438, 19, 1, 1, '2019-05-21', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:19:10', 0, '', '2019-05-21 17:19:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (439, 19, 1, 1, '2019-05-21', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:33:40', 0, '', '2019-05-21 17:33:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (440, 19, 1, 1, '2019-05-21', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:38:07', 0, '', '2019-05-21 17:38:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (441, 19, 1, 1, '2019-05-21', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:41:23', 0, '', '2019-05-21 17:41:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (442, 19, 1, 1, '2019-05-21', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:44:11', 0, '', '2019-05-21 17:44:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (443, 19, 1, 1, '2019-05-21', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:47:54', 0, '', '2019-05-21 17:47:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (444, 19, 1, 1, '2019-05-21', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:49:09', 0, '', '2019-05-21 17:49:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (445, 19, 1, 1, '2019-05-21', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:03:40', 0, '', '2019-05-21 18:03:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (446, 19, 1, 1, '2019-05-21', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:09:46', 0, '', '2019-05-21 18:09:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (447, 19, 1, 1, '2019-05-21', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:27:05', 0, '', '2019-05-21 18:27:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (448, 19, 1, 1, '2019-05-21', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:53:33', 0, '', '2019-05-21 19:53:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (449, 19, 1, 3, '2019-05-21', 25.00, 1, 'Produccion', '20:30:06', 0, '001-1', '2019-05-21 20:30:06', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (450, 19, 1, 1, '2019-05-21', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:32:51', 0, '', '2019-05-21 20:32:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (451, 19, 1, 1, '2019-05-21', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:49:21', 0, '', '2019-05-21 20:49:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (452, 19, 1, 1, '2019-05-21', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:58:38', 0, '', '2019-05-21 20:58:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (453, 21, 1, 9, '2019-05-22', 70.00, 1, 'Produccion', '09:13:54', 0, '001-1', '2019-05-22 09:13:54', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (454, 21, 1, 1, '2019-05-22', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:41:20', 0, '', '2019-05-22 10:41:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (455, 21, 1, 1, '2019-05-22', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:41:37', 0, '', '2019-05-22 10:41:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (456, 21, 1, 1, '2019-05-22', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:59:01', 0, '', '2019-05-22 10:59:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (457, 21, 1, 1, '2019-05-22', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:07:17', 0, '', '2019-05-22 11:07:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (458, 21, 1, 1, '2019-05-22', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:03:35', 0, '', '2019-05-22 12:03:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (459, 21, 1, 1, '2019-05-22', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:19:50', 0, '', '2019-05-22 12:19:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (460, 21, 1, 9, '2019-05-22', 4.00, 1, 'agua', '12:23:34', 0, '001-1', '2019-05-22 12:23:34', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (461, 21, 1, 1, '2019-05-22', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:36:11', 0, '', '2019-05-22 12:36:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (462, 21, 1, 1, '2019-05-22', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:11:38', 0, '', '2019-05-22 13:11:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (463, 21, 1, 1, '2019-05-22', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:21:13', 0, '', '2019-05-22 15:21:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (464, 21, 1, 1, '2019-05-22', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:27:43', 0, '', '2019-05-22 15:27:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (465, 21, 1, 1, '2019-05-22', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:33:18', 0, '', '2019-05-22 15:33:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (466, 21, 1, 1, '2019-05-22', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:58:15', 0, '', '2019-05-22 15:58:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (467, 21, 1, 1, '2019-05-22', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:38:10', 0, '', '2019-05-22 16:38:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (468, 21, 1, 1, '2019-05-22', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:45:21', 0, '', '2019-05-22 16:45:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (469, 21, 1, 1, '2019-05-22', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:49:34', 0, '', '2019-05-22 16:49:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (470, 21, 1, 1, '2019-05-22', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:00:38', 0, '', '2019-05-22 17:00:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (471, 21, 1, 1, '2019-05-22', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:06:28', 0, '', '2019-05-22 17:06:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (472, 21, 1, 1, '2019-05-22', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:14:46', 0, '', '2019-05-22 17:14:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (473, 21, 1, 1, '2019-05-22', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:20:57', 0, '', '2019-05-22 17:20:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (474, 21, 1, 1, '2019-05-22', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:24:05', 0, '', '2019-05-22 17:24:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (475, 21, 1, 1, '2019-05-22', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:32:51', 0, '', '2019-05-22 17:32:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (476, 21, 1, 1, '2019-05-22', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:41:40', 0, '', '2019-05-22 17:41:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (477, 21, 1, 1, '2019-05-22', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:56:37', 0, '', '2019-05-22 17:56:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (478, 21, 1, 1, '2019-05-22', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:06:59', 0, '', '2019-05-22 18:06:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (479, 21, 1, 1, '2019-05-22', 21.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:08:16', 0, '', '2019-05-22 18:08:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (480, 21, 1, 1, '2019-05-22', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:16:48', 0, '', '2019-05-22 18:16:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (481, 21, 1, 1, '2019-05-22', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:20:38', 0, '', '2019-05-22 18:20:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (482, 21, 1, 1, '2019-05-22', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:25:05', 0, '', '2019-05-22 18:25:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (483, 21, 1, 1, '2019-05-22', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:36:15', 0, '', '2019-05-22 18:36:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (484, 21, 1, 1, '2019-05-22', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:42:34', 0, '', '2019-05-22 18:42:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (485, 21, 1, 1, '2019-05-22', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:45:25', 0, '', '2019-05-22 18:45:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (486, 21, 1, 3, '2019-05-22', 2.00, 1, 'gasolina de pedro', '18:55:30', 0, '001-1', '2019-05-22 18:55:30', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (487, 21, 1, 3, '2019-05-22', 4.00, 1, 'Produccion', '19:12:54', 0, '001-1', '2019-05-22 19:12:54', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (488, 21, 1, 1, '2019-05-22', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:20:28', 0, '', '2019-05-22 19:20:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (489, 21, 1, 1, '2019-05-22', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:26:46', 0, '', '2019-05-22 19:26:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (490, 21, 1, 1, '2019-05-22', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:42:32', 0, '', '2019-05-22 19:42:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (491, 21, 1, 1, '2019-05-22', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:58:28', 0, '', '2019-05-22 19:58:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (492, 21, 1, 1, '2019-05-22', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:12:25', 0, '', '2019-05-22 20:12:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (493, 21, 1, 1, '2019-05-22', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:41:13', 0, '', '2019-05-22 20:41:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (494, 21, 1, 1, '2019-05-22', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:55:39', 0, '', '2019-05-22 20:55:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (495, 23, 1, 9, '2019-05-23', 100.00, 1, 'Produccion', '09:23:30', 0, '001-1', '2019-05-23 09:23:30', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (496, 23, 1, 1, '2019-05-23', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:37:32', 0, '', '2019-05-23 10:37:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (497, 23, 1, 1, '2019-05-23', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:57:24', 0, '', '2019-05-23 10:57:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (498, 23, 1, 1, '2019-05-23', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:03:50', 0, '', '2019-05-23 11:03:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (499, 23, 1, 1, '2019-05-23', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:53:03', 0, '', '2019-05-23 11:53:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (500, 23, 1, 1, '2019-05-23', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:54:13', 0, '', '2019-05-23 11:54:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (501, 23, 1, 1, '2019-05-23', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:00:46', 0, '', '2019-05-23 12:00:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (502, 23, 1, 1, '2019-05-23', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:02:06', 0, '', '2019-05-23 12:02:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (503, 23, 1, 1, '2019-05-23', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:05:09', 0, '', '2019-05-23 12:05:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (504, 23, 1, 1, '2019-05-23', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:09:32', 0, '', '2019-05-23 12:09:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (505, 23, 1, 1, '2019-05-23', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:37:08', 0, '', '2019-05-23 12:37:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (506, 23, 1, 1, '2019-05-23', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:33:51', 0, '', '2019-05-23 15:33:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (507, 23, 1, 11, '2019-05-23', 2.50, 1, 'pastilla para personal', '15:52:32', 0, '001-1', '2019-05-23 15:52:32', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (508, 23, 1, 1, '2019-05-23', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:52:59', 0, '', '2019-05-23 15:52:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (509, 23, 1, 1, '2019-05-23', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:57:23', 0, '', '2019-05-23 15:57:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (510, 23, 1, 1, '2019-05-23', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:22:04', 0, '', '2019-05-23 16:22:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (511, 23, 1, 1, '2019-05-23', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:42:04', 0, '', '2019-05-23 16:42:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (512, 23, 1, 1, '2019-05-23', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:26:32', 0, '', '2019-05-23 17:26:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (513, 23, 1, 1, '2019-05-23', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:26:59', 0, '', '2019-05-23 17:26:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (514, 23, 1, 1, '2019-05-23', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:33:35', 0, '', '2019-05-23 17:33:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (515, 23, 1, 1, '2019-05-23', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:51:17', 0, '', '2019-05-23 17:51:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (516, 23, 1, 1, '2019-05-23', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:53:10', 0, '', '2019-05-23 17:53:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (517, 23, 1, 1, '2019-05-23', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:00:41', 0, '', '2019-05-23 18:00:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (518, 23, 1, 1, '2019-05-23', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:29:25', 0, '', '2019-05-23 18:29:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (519, 23, 1, 1, '2019-05-23', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:35:19', 0, '', '2019-05-23 18:35:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (520, 23, 1, 1, '2019-05-23', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:41:13', 0, '', '2019-05-23 18:41:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (521, 23, 1, 1, '2019-05-23', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:45:02', 0, '', '2019-05-23 18:45:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (522, 23, 1, 1, '2019-05-23', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:33:14', 0, '', '2019-05-23 19:33:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (523, 23, 1, 1, '2019-05-23', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:38:45', 0, '', '2019-05-23 19:38:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (524, 23, 1, 1, '2019-05-23', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:03:39', 0, '', '2019-05-23 20:03:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (525, 23, 1, 1, '2019-05-23', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:36:12', 0, '', '2019-05-23 20:36:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (526, 23, 1, 1, '2019-05-23', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:54:10', 0, '', '2019-05-23 20:54:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (527, 23, 1, 1, '2019-05-23', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:56:53', 0, '', '2019-05-23 20:56:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (528, 23, 1, 1, '2019-05-23', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:05:02', 0, '', '2019-05-23 21:05:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (529, 23, 1, 1, '2019-05-23', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:29:55', 0, '', '2019-05-23 21:29:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (530, 23, 1, 1, '2019-05-23', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:35:07', 0, '', '2019-05-23 21:35:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (531, 23, 1, 1, '2019-05-23', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:39:28', 0, '', '2019-05-23 21:39:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (532, 25, 1, 9, '2019-05-24', 50.00, 1, 'Produccion', '10:33:14', 0, '001-1', '2019-05-24 10:33:14', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (533, 25, 1, 1, '2019-05-24', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:41:29', 0, '', '2019-05-24 10:41:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (534, 25, 1, 9, '2019-05-24', 12.00, 1, 'barra de hielo y pasaje de motokar', '10:47:21', 0, '001-1', '2019-05-24 10:47:21', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (535, 25, 1, 1, '2019-05-24', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:55:49', 0, '', '2019-05-24 10:55:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (536, 25, 1, 1, '2019-05-24', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:46:32', 0, '', '2019-05-24 11:46:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (537, 25, 1, 1, '2019-05-24', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:00:00', 0, '', '2019-05-24 12:00:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (538, 25, 1, 1, '2019-05-24', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:06:35', 0, '', '2019-05-24 12:06:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (539, 25, 1, 1, '2019-05-24', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:55:08', 0, '', '2019-05-24 12:55:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (540, 25, 1, 1, '2019-05-24', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:41:43', 0, '', '2019-05-24 15:41:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (541, 25, 1, 1, '2019-05-24', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:51:45', 0, '', '2019-05-24 15:51:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (542, 25, 1, 1, '2019-05-24', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:27:56', 0, '', '2019-05-24 16:27:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (543, 25, 1, 1, '2019-05-24', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:29:57', 0, '', '2019-05-24 16:29:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (544, 25, 1, 1, '2019-05-24', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:44:17', 0, '', '2019-05-24 16:44:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (545, 25, 1, 1, '2019-05-24', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:44:50', 0, '', '2019-05-24 16:44:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (546, 25, 1, 1, '2019-05-24', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:50:31', 0, '', '2019-05-24 16:50:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (547, 25, 1, 1, '2019-05-24', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:55:33', 0, '', '2019-05-24 16:55:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (548, 25, 1, 1, '2019-05-24', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:05:43', 0, '', '2019-05-24 17:05:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (549, 25, 1, 1, '2019-05-24', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:11:33', 0, '', '2019-05-24 17:11:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (550, 25, 1, 1, '2019-05-24', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:13:29', 0, '', '2019-05-24 17:13:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (551, 25, 1, 1, '2019-05-24', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:19:39', 0, '', '2019-05-24 17:19:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (552, 25, 1, 1, '2019-05-24', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:28:27', 0, '', '2019-05-24 17:28:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (553, 25, 1, 1, '2019-05-24', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:30:33', 0, '', '2019-05-24 17:30:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (554, 25, 1, 1, '2019-05-24', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:35:59', 0, '', '2019-05-24 17:35:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (555, 25, 1, 1, '2019-05-24', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:40:02', 0, '', '2019-05-24 17:40:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (556, 25, 1, 1, '2019-05-24', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:49:00', 0, '', '2019-05-24 17:49:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (557, 25, 1, 1, '2019-05-24', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:52:00', 0, '', '2019-05-24 17:52:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (558, 25, 1, 1, '2019-05-24', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:00:26', 0, '', '2019-05-24 18:00:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (559, 25, 1, 1, '2019-05-24', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:01:32', 0, '', '2019-05-24 18:01:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (560, 25, 1, 1, '2019-05-24', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:21:59', 0, '', '2019-05-24 18:21:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (561, 25, 1, 1, '2019-05-24', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:36:26', 0, '', '2019-05-24 18:36:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (562, 25, 1, 1, '2019-05-24', 26.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:42:01', 0, '', '2019-05-24 18:42:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (563, 25, 1, 1, '2019-05-24', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:53:47', 0, '', '2019-05-24 18:53:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (564, 25, 1, 1, '2019-05-24', 23.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:09:48', 0, '', '2019-05-24 19:09:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (565, 25, 1, 9, '2019-05-24', 1.50, 1, 'sapolio pote (lavavajillas)', '19:11:01', 0, '001-1', '2019-05-24 19:11:01', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (566, 25, 1, 1, '2019-05-24', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:59:08', 0, '', '2019-05-24 19:59:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (567, 25, 1, 1, '2019-05-24', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:19:39', 0, '', '2019-05-24 20:19:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (568, 25, 1, 1, '2019-05-24', 0.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:20:11', 0, '', '2019-05-24 20:20:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (569, 25, 1, 1, '2019-05-24', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:21:54', 0, '', '2019-05-24 20:21:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (570, 25, 1, 1, '2019-05-24', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:35:35', 0, '', '2019-05-24 20:35:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (571, 25, 1, 1, '2019-05-24', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:53:46', 0, '', '2019-05-24 20:53:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (572, 25, 1, 1, '2019-05-24', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:09:14', 0, '', '2019-05-24 21:09:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (573, 25, 1, 1, '2019-05-24', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:09:42', 0, '', '2019-05-24 21:09:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (574, 25, 1, 1, '2019-05-24', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:12:33', 0, '', '2019-05-24 21:12:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (575, 25, 1, 1, '2019-05-24', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:20:44', 0, '', '2019-05-24 21:20:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (576, 25, 1, 1, '2019-05-24', 41.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:26:11', 0, '', '2019-05-24 21:26:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (577, 25, 1, 1, '2019-05-24', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:29:00', 0, '', '2019-05-24 21:29:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (578, 25, 1, 1, '2019-05-24', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:34:18', 0, '', '2019-05-24 21:34:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (579, 25, 1, 1, '2019-05-24', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:43:07', 0, '', '2019-05-24 21:43:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (580, 25, 1, 1, '2019-05-24', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:45:18', 0, '', '2019-05-24 21:45:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (581, 25, 1, 1, '2019-05-24', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:54:15', 0, '', '2019-05-24 21:54:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (582, 25, 1, 1, '2019-05-24', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:55:41', 0, '', '2019-05-24 21:55:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (583, 27, 1, 9, '2019-05-25', 30.00, 1, 'Produccion', '11:56:23', 0, '001-1', '2019-05-25 11:56:23', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (584, 27, 1, 9, '2019-05-25', 4.00, 1, 'agua', '11:57:10', 0, '001-4', '2019-05-25 11:57:10', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (585, 27, 1, 9, '2019-05-25', 8.00, 1, 'hielo ', '12:55:36', 0, '001-1', '2019-05-25 12:55:36', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (586, 27, 1, 9, '2019-05-25', 4.00, 1, 'pasaje de motokar para traer hielo', '12:56:02', 0, '001-1', '2019-05-25 12:56:02', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (587, 27, 1, 9, '2019-05-25', 72.00, 1, 'Produccion  (caja de leche)', '12:56:58', 0, '001-1', '2019-05-25 12:56:58', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (588, 27, 1, 12, '2019-05-25', 20.00, 1, 'sobro de dinero que no se gastò en egreso', '12:58:27', 0, '001-1', '2019-05-25 12:58:27', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (589, 27, 1, 1, '2019-05-25', 30.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:09:52', 0, '', '2019-05-25 13:09:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (590, 27, 1, 1, '2019-05-25', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:14:05', 0, '', '2019-05-25 13:14:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (591, 27, 1, 1, '2019-05-25', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:08:58', 0, '', '2019-05-25 15:08:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (592, 27, 1, 9, '2019-05-25', 25.00, 1, 'keke chocolate', '16:14:34', 0, '001-1', '2019-05-25 16:14:34', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (593, 27, 1, 1, '2019-05-25', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:48:44', 0, '', '2019-05-25 16:48:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (594, 27, 1, 1, '2019-05-25', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:57:27', 0, '', '2019-05-25 16:57:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (595, 27, 1, 1, '2019-05-25', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:58:08', 0, '', '2019-05-25 16:58:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (596, 27, 1, 1, '2019-05-25', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:14:32', 0, '', '2019-05-25 17:14:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (597, 27, 1, 1, '2019-05-25', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:16:35', 0, '', '2019-05-25 17:16:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (598, 27, 1, 1, '2019-05-25', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:18:49', 0, '', '2019-05-25 17:18:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (599, 27, 1, 1, '2019-05-25', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:20:10', 0, '', '2019-05-25 17:20:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (600, 27, 1, 1, '2019-05-25', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:23:45', 0, '', '2019-05-25 17:23:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (601, 27, 1, 1, '2019-05-25', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:35:11', 0, '', '2019-05-25 17:35:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (602, 27, 1, 1, '2019-05-25', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:10:59', 0, '', '2019-05-25 18:10:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (603, 27, 1, 1, '2019-05-25', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:36:26', 0, '', '2019-05-25 18:36:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (604, 27, 1, 1, '2019-05-25', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:36:49', 0, '', '2019-05-25 18:36:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (605, 27, 1, 1, '2019-05-25', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:37:22', 0, '', '2019-05-25 18:37:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (606, 27, 1, 1, '2019-05-25', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:53:23', 0, '', '2019-05-25 18:53:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (607, 27, 1, 1, '2019-05-25', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:44:56', 0, '', '2019-05-25 19:44:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (608, 27, 1, 1, '2019-05-25', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:51:47', 0, '', '2019-05-25 19:51:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (609, 27, 1, 1, '2019-05-25', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:14:51', 0, '', '2019-05-25 22:14:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (610, 27, 1, 1, '2019-05-25', 28.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:20:29', 0, '', '2019-05-25 22:20:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (611, 27, 1, 1, '2019-05-25', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:21:17', 0, '', '2019-05-25 22:21:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (612, 27, 1, 1, '2019-05-25', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:24:32', 0, '', '2019-05-25 22:24:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (613, 27, 1, 1, '2019-05-25', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:28:12', 0, '', '2019-05-25 22:28:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (614, 27, 1, 1, '2019-05-25', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:34:57', 0, '', '2019-05-25 22:34:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (615, 27, 1, 1, '2019-05-25', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:39:52', 0, '', '2019-05-25 22:39:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (616, 27, 1, 3, '2019-05-25', 30.00, 1, 'extra a pedro ,anicia , henry', '22:56:46', 0, '-', '2019-05-25 22:56:46', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (617, 29, 1, 1, '2019-05-26', 24.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:18:21', 0, '', '2019-05-26 15:18:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (618, 29, 1, 1, '2019-05-26', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:32:09', 0, '', '2019-05-26 15:32:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (619, 29, 1, 1, '2019-05-26', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:04:37', 0, '', '2019-05-26 17:04:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (620, 29, 1, 1, '2019-05-26', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:05:03', 0, '', '2019-05-26 17:05:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (621, 29, 1, 1, '2019-05-26', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:22:08', 0, '', '2019-05-26 17:22:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (622, 29, 1, 1, '2019-05-26', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:24:56', 0, '', '2019-05-26 18:24:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (623, 29, 1, 1, '2019-05-26', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:27:30', 0, '', '2019-05-26 18:27:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (624, 29, 1, 1, '2019-05-26', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:36:50', 0, '', '2019-05-26 18:36:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (625, 29, 1, 1, '2019-05-26', 81.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:38:33', 0, '', '2019-05-26 18:38:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (626, 29, 1, 9, '2019-05-26', 10.00, 1, 'recarga de celular de empresa', '18:41:24', 0, '001-1', '2019-05-26 18:41:24', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (627, 29, 1, 1, '2019-05-26', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:46:12', 0, '', '2019-05-26 18:46:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (628, 29, 1, 1, '2019-05-26', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:48:44', 0, '', '2019-05-26 18:48:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (629, 29, 1, 1, '2019-05-26', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:59:03', 0, '', '2019-05-26 18:59:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (630, 29, 1, 1, '2019-05-26', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:21:50', 0, '', '2019-05-26 19:21:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (631, 29, 1, 1, '2019-05-26', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:31:58', 0, '', '2019-05-26 19:31:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (632, 29, 1, 1, '2019-05-26', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:40:15', 0, '', '2019-05-26 19:40:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (633, 29, 1, 1, '2019-05-26', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:47:16', 0, '', '2019-05-26 19:47:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (634, 29, 1, 1, '2019-05-26', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:49:44', 0, '', '2019-05-26 20:49:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (635, 29, 1, 1, '2019-05-26', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:01:55', 0, '', '2019-05-26 21:01:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (636, 29, 1, 9, '2019-05-26', 2.00, 1, 'pasaje de motokar de Anicia', '21:10:11', 0, '001-1', '2019-05-26 21:10:11', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (637, 29, 1, 1, '2019-05-26', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:13:20', 0, '', '2019-05-26 22:13:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (638, 31, 1, 1, '2019-05-28', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:03:27', 0, '', '2019-05-28 11:03:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (639, 33, 1, 1, '2019-05-28', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:51:25', 0, '', '2019-05-28 11:51:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (640, 33, 1, 1, '2019-05-28', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:53:28', 0, '', '2019-05-28 11:53:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (641, 33, 1, 1, '2019-05-28', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:35:44', 0, '', '2019-05-28 12:35:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (642, 33, 1, 1, '2019-05-28', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:58:29', 0, '', '2019-05-28 12:58:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (643, 33, 1, 1, '2019-05-28', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:37:27', 0, '', '2019-05-28 15:37:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (644, 33, 1, 9, '2019-05-28', 16.40, 1, 'servilletas y cucharas', '16:17:11', 0, '001-1', '2019-05-28 16:17:11', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (645, 33, 1, 1, '2019-05-28', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:39:54', 0, '', '2019-05-28 16:39:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (646, 33, 1, 1, '2019-05-28', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:54:48', 0, '', '2019-05-28 16:54:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (647, 33, 1, 1, '2019-05-28', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:56:23', 0, '', '2019-05-28 16:56:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (648, 33, 1, 1, '2019-05-28', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:09:51', 0, '', '2019-05-28 17:09:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (649, 33, 1, 1, '2019-05-28', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:11:29', 0, '', '2019-05-28 17:11:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (650, 33, 1, 1, '2019-05-28', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:29:17', 0, '', '2019-05-28 17:29:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (651, 33, 1, 1, '2019-05-28', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:38:27', 0, '', '2019-05-28 17:38:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (652, 33, 1, 1, '2019-05-28', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:46:17', 0, '', '2019-05-28 17:46:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (653, 33, 1, 1, '2019-05-28', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:00:57', 0, '', '2019-05-28 18:00:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (654, 33, 1, 1, '2019-05-28', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:10:38', 0, '', '2019-05-28 18:10:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (655, 33, 1, 1, '2019-05-28', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:14:20', 0, '', '2019-05-28 18:14:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (656, 33, 1, 1, '2019-05-28', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:18:47', 0, '', '2019-05-28 18:18:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (657, 33, 1, 1, '2019-05-28', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:19:52', 0, '', '2019-05-28 18:19:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (658, 33, 1, 1, '2019-05-28', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:29:18', 0, '', '2019-05-28 18:29:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (659, 33, 1, 1, '2019-05-28', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:29:32', 0, '', '2019-05-28 18:29:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (660, 33, 1, 1, '2019-05-28', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:04:41', 0, '', '2019-05-28 19:04:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (661, 33, 1, 1, '2019-05-28', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:18:41', 0, '', '2019-05-28 19:18:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (662, 33, 1, 1, '2019-05-28', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:35:14', 0, '', '2019-05-28 20:35:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (663, 33, 1, 1, '2019-05-28', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:52:23', 0, '', '2019-05-28 20:52:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (664, 33, 1, 1, '2019-05-28', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:05:49', 0, '', '2019-05-28 21:05:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (665, 35, 1, 1, '2019-05-29', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:49:14', 0, '', '2019-05-29 12:49:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (666, 35, 1, 1, '2019-05-29', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:40:18', 0, '', '2019-05-29 15:40:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (667, 35, 1, 1, '2019-05-29', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:09:08', 0, '', '2019-05-29 16:09:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (668, 35, 1, 1, '2019-05-29', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:13:49', 0, '', '2019-05-29 16:13:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (669, 35, 1, 1, '2019-05-29', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:18:20', 0, '', '2019-05-29 16:18:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (670, 35, 1, 1, '2019-05-29', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:08:37', 0, '', '2019-05-29 17:08:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (671, 35, 1, 1, '2019-05-29', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:09:12', 0, '', '2019-05-29 17:09:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (672, 35, 1, 1, '2019-05-29', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:16:23', 0, '', '2019-05-29 17:16:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (673, 35, 1, 1, '2019-05-29', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:18:28', 0, '', '2019-05-29 17:18:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (674, 35, 1, 1, '2019-05-29', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:36:12', 0, '', '2019-05-29 17:36:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (675, 35, 1, 1, '2019-05-29', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:46:13', 0, '', '2019-05-29 17:46:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (676, 35, 1, 1, '2019-05-29', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:59:53', 0, '', '2019-05-29 17:59:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (677, 35, 1, 1, '2019-05-29', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:24:47', 0, '', '2019-05-29 18:24:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (678, 35, 1, 1, '2019-05-29', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:17:52', 0, '', '2019-05-29 19:17:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (679, 35, 1, 1, '2019-05-29', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:43:40', 0, '', '2019-05-29 19:43:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (680, 35, 1, 1, '2019-05-29', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:05:35', 0, '', '2019-05-29 20:05:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (681, 35, 1, 1, '2019-05-29', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:51:05', 0, '', '2019-05-29 20:51:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (682, 37, 1, 1, '2019-05-30', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:40:29', 0, '', '2019-05-30 11:40:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (683, 37, 1, 1, '2019-05-30', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:12:26', 0, '', '2019-05-30 12:12:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (684, 37, 1, 1, '2019-05-30', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:21:24', 0, '', '2019-05-30 12:21:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (685, 37, 1, 1, '2019-05-30', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:25:55', 0, '', '2019-05-30 12:25:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (686, 37, 1, 1, '2019-05-30', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:43:50', 0, '', '2019-05-30 12:43:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (687, 37, 1, 1, '2019-05-30', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:02:06', 0, '', '2019-05-30 13:02:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (688, 37, 1, 1, '2019-05-30', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:33:23', 0, '', '2019-05-30 15:33:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (689, 37, 1, 1, '2019-05-30', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:20:54', 0, '', '2019-05-30 16:20:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (690, 37, 1, 1, '2019-05-30', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:08:09', 0, '', '2019-05-30 17:08:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (691, 37, 1, 1, '2019-05-30', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:26:47', 0, '', '2019-05-30 17:26:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (692, 37, 1, 1, '2019-05-30', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:29:09', 0, '', '2019-05-30 17:29:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (693, 37, 1, 1, '2019-05-30', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:46:42', 0, '', '2019-05-30 17:46:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (694, 37, 1, 1, '2019-05-30', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:47:22', 0, '', '2019-05-30 17:47:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (695, 37, 1, 1, '2019-05-30', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:58:25', 0, '', '2019-05-30 17:58:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (696, 37, 1, 1, '2019-05-30', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:11:35', 0, '', '2019-05-30 18:11:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (697, 37, 1, 1, '2019-05-30', 30.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:31:44', 0, '', '2019-05-30 18:31:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (698, 37, 1, 1, '2019-05-30', 0.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:53:19', 0, '', '2019-05-30 18:53:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (699, 37, 1, 1, '2019-05-30', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:53:29', 0, '', '2019-05-30 18:53:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (700, 37, 1, 1, '2019-05-30', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:13:33', 0, '', '2019-05-30 20:13:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (701, 37, 1, 1, '2019-05-30', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:02:26', 0, '', '2019-05-30 21:02:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (702, 37, 1, 1, '2019-05-30', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:13:58', 0, '', '2019-05-30 21:13:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (703, 39, 1, 1, '2019-05-31', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:34:28', 0, '', '2019-05-31 11:34:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (704, 39, 1, 1, '2019-05-31', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:57:30', 0, '', '2019-05-31 12:57:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (705, 39, 1, 1, '2019-05-31', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:02:31', 0, '', '2019-05-31 13:02:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (706, 39, 1, 1, '2019-05-31', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:36:26', 0, '', '2019-05-31 15:36:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (707, 39, 1, 1, '2019-05-31', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:51:57', 0, '', '2019-05-31 15:51:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (708, 39, 1, 1, '2019-05-31', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:56:36', 0, '', '2019-05-31 15:56:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (709, 39, 1, 1, '2019-05-31', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:58:23', 0, '', '2019-05-31 15:58:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (710, 39, 1, 1, '2019-05-31', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:20:43', 0, '', '2019-05-31 16:20:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (711, 39, 1, 1, '2019-05-31', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:21:26', 0, '', '2019-05-31 16:21:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (712, 39, 1, 1, '2019-05-31', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:23:00', 0, '', '2019-05-31 16:23:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (713, 39, 1, 1, '2019-05-31', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:31:36', 0, '', '2019-05-31 16:31:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (714, 39, 1, 1, '2019-05-31', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:39:55', 0, '', '2019-05-31 16:39:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (715, 39, 1, 1, '2019-05-31', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:42:20', 0, '', '2019-05-31 16:42:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (716, 39, 1, 1, '2019-05-31', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:47:17', 0, '', '2019-05-31 16:47:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (717, 39, 1, 1, '2019-05-31', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:49:11', 0, '', '2019-05-31 16:49:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (718, 39, 1, 1, '2019-05-31', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:21:40', 0, '', '2019-05-31 17:21:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (719, 39, 1, 1, '2019-05-31', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:28:05', 0, '', '2019-05-31 17:28:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (720, 39, 1, 1, '2019-05-31', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:39:43', 0, '', '2019-05-31 17:39:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (721, 39, 1, 1, '2019-05-31', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:43:38', 0, '', '2019-05-31 17:43:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (722, 39, 1, 1, '2019-05-31', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:29:45', 0, '', '2019-05-31 18:29:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (723, 39, 1, 1, '2019-05-31', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:48:06', 0, '', '2019-05-31 18:48:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (724, 39, 1, 1, '2019-05-31', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:33:16', 0, '', '2019-05-31 19:33:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (725, 39, 1, 1, '2019-05-31', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:34:24', 0, '', '2019-05-31 19:34:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (726, 39, 1, 9, '2019-05-31', 3.00, 1, 'Produccion', '19:39:11', 0, '001-1', '2019-05-31 19:39:11', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (727, 39, 1, 1, '2019-05-31', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:04:24', 0, '', '2019-05-31 20:04:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (728, 39, 1, 1, '2019-05-31', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:10:43', 0, '', '2019-05-31 20:10:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (729, 39, 1, 1, '2019-05-31', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:17:59', 0, '', '2019-05-31 20:17:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (730, 39, 1, 1, '2019-05-31', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:19:55', 0, '', '2019-05-31 20:19:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (731, 39, 1, 1, '2019-05-31', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:32:11', 0, '', '2019-05-31 20:32:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (732, 39, 1, 1, '2019-05-31', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:35:21', 0, '', '2019-05-31 20:35:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (733, 39, 1, 1, '2019-05-31', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:39:34', 0, '', '2019-05-31 20:39:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (734, 39, 1, 1, '2019-05-31', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:41:43', 0, '', '2019-05-31 20:41:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (735, 39, 1, 1, '2019-05-31', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:08:28', 0, '', '2019-05-31 21:08:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (736, 39, 1, 1, '2019-05-31', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:18:22', 0, '', '2019-05-31 21:18:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (737, 39, 1, 9, '2019-05-31', 5.00, 1, 'gasolina de pedro', '21:19:21', 0, '001-1', '2019-05-31 21:19:21', NULL, NULL, NULL, 3.31, 1);
INSERT INTO `movimiento` VALUES (738, 41, 1, 1, '2019-06-01', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:51:59', 0, '', '2019-06-01 11:51:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (739, 41, 1, 1, '2019-06-01', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:15:01', 0, '', '2019-06-01 12:15:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (740, 41, 1, 1, '2019-06-01', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:02:09', 0, '', '2019-06-01 16:02:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (741, 41, 1, 1, '2019-06-01', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:11:42', 0, '', '2019-06-01 16:11:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (742, 41, 1, 1, '2019-06-01', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:23:24', 0, '', '2019-06-01 16:23:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (743, 41, 1, 1, '2019-06-01', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:41:51', 0, '', '2019-06-01 16:41:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (744, 41, 1, 1, '2019-06-01', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:59:27', 0, '', '2019-06-01 16:59:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (745, 41, 1, 1, '2019-06-01', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:10:46', 0, '', '2019-06-01 17:10:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (746, 41, 1, 1, '2019-06-01', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:14:35', 0, '', '2019-06-01 17:14:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (747, 41, 1, 1, '2019-06-01', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:22:16', 0, '', '2019-06-01 17:22:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (748, 41, 1, 1, '2019-06-01', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:27:42', 0, '', '2019-06-01 17:27:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (749, 41, 1, 1, '2019-06-01', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:32:33', 0, '', '2019-06-01 17:32:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (750, 41, 1, 1, '2019-06-01', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:10:38', 0, '', '2019-06-01 18:10:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (751, 41, 1, 1, '2019-06-01', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:14:30', 0, '', '2019-06-01 18:14:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (752, 41, 1, 1, '2019-06-01', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:17:59', 0, '', '2019-06-01 18:17:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (753, 41, 1, 1, '2019-06-01', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:31:30', 0, '', '2019-06-01 18:31:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (754, 41, 1, 1, '2019-06-01', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:35:28', 0, '', '2019-06-01 18:35:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (755, 41, 1, 1, '2019-06-01', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:07:21', 0, '', '2019-06-01 19:07:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (756, 41, 1, 1, '2019-06-01', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:10:43', 0, '', '2019-06-01 19:10:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (757, 41, 1, 1, '2019-06-01', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:19:22', 0, '', '2019-06-01 19:19:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (758, 41, 1, 1, '2019-06-01', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:38:00', 0, '', '2019-06-01 19:38:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (759, 41, 1, 1, '2019-06-01', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:34:55', 0, '', '2019-06-01 20:34:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (760, 41, 1, 1, '2019-06-01', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:37:12', 0, '', '2019-06-01 20:37:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (761, 41, 1, 1, '2019-06-01', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:21:27', 0, '', '2019-06-01 21:21:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (762, 41, 1, 1, '2019-06-01', 43.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:29:56', 0, '', '2019-06-01 21:29:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (763, 45, 1, 1, '2019-06-02', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:38:44', 0, '', '2019-06-02 12:38:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (764, 45, 1, 1, '2019-06-02', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:40:04', 0, '', '2019-06-02 12:40:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (765, 45, 1, 1, '2019-06-02', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:45:31', 0, '', '2019-06-02 12:45:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (766, 45, 1, 1, '2019-06-02', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:04:44', 0, '', '2019-06-02 13:04:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (767, 45, 1, 1, '2019-06-02', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:11:28', 0, '', '2019-06-02 13:11:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (768, 45, 1, 1, '2019-06-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:15:11', 0, '', '2019-06-02 13:15:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (769, 45, 1, 1, '2019-06-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:09:27', 0, '', '2019-06-02 15:09:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (770, 45, 1, 1, '2019-06-02', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:45:05', 0, '', '2019-06-02 15:45:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (771, 45, 1, 1, '2019-06-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:54:30', 0, '', '2019-06-02 15:54:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (772, 45, 1, 1, '2019-06-02', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:55:30', 0, '', '2019-06-02 15:55:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (773, 45, 1, 1, '2019-06-02', 56.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:56:37', 0, '', '2019-06-02 15:56:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (774, 45, 1, 1, '2019-06-02', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:15:02', 0, '', '2019-06-02 16:15:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (775, 45, 1, 1, '2019-06-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:54:47', 0, '', '2019-06-02 16:54:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (776, 45, 1, 1, '2019-06-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:11:34', 0, '', '2019-06-02 17:11:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (777, 45, 1, 1, '2019-06-02', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:17:48', 0, '', '2019-06-02 17:17:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (778, 45, 1, 1, '2019-06-02', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:22:38', 0, '', '2019-06-02 17:22:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (779, 45, 1, 1, '2019-06-02', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:36:48', 0, '', '2019-06-02 17:36:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (780, 45, 1, 1, '2019-06-02', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:48:42', 0, '', '2019-06-02 17:48:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (781, 45, 1, 1, '2019-06-02', 21.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:49:22', 0, '', '2019-06-02 17:49:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (782, 45, 1, 1, '2019-06-02', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:59:22', 0, '', '2019-06-02 17:59:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (783, 45, 1, 1, '2019-06-02', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:04:12', 0, '', '2019-06-02 18:04:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (784, 45, 1, 1, '2019-06-02', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:07:38', 0, '', '2019-06-02 18:07:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (785, 45, 1, 1, '2019-06-02', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:29:37', 0, '', '2019-06-02 18:29:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (786, 45, 1, 1, '2019-06-02', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:30:37', 0, '', '2019-06-02 18:30:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (787, 45, 1, 1, '2019-06-02', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:37:05', 0, '', '2019-06-02 18:37:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (788, 45, 1, 1, '2019-06-02', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:38:42', 0, '', '2019-06-02 18:38:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (789, 45, 1, 1, '2019-06-02', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:48:03', 0, '', '2019-06-02 18:48:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (790, 45, 1, 1, '2019-06-02', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:10:19', 0, '', '2019-06-02 19:10:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (791, 45, 1, 1, '2019-06-02', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:15:33', 0, '', '2019-06-02 19:15:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (792, 45, 1, 1, '2019-06-02', 27.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:23:14', 0, '', '2019-06-02 19:23:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (793, 45, 1, 1, '2019-06-02', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:46:45', 0, '', '2019-06-02 19:46:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (794, 45, 1, 1, '2019-06-02', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:56:52', 0, '', '2019-06-02 19:56:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (795, 45, 1, 1, '2019-06-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:11:50', 0, '', '2019-06-02 20:11:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (796, 45, 1, 1, '2019-06-02', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:32:48', 0, '', '2019-06-02 20:32:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (797, 45, 1, 1, '2019-06-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:41:30', 0, '', '2019-06-02 20:41:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (798, 45, 1, 1, '2019-06-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:57:59', 0, '', '2019-06-02 20:57:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (799, 45, 1, 1, '2019-06-02', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:02:42', 0, '', '2019-06-02 21:02:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (800, 45, 1, 1, '2019-06-02', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:03:10', 0, '', '2019-06-02 21:03:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (801, 45, 1, 1, '2019-06-02', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:07:05', 0, '', '2019-06-02 21:07:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (802, 45, 1, 1, '2019-06-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:16:40', 0, '', '2019-06-02 21:16:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (803, 45, 1, 1, '2019-06-02', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:19:21', 0, '', '2019-06-02 21:19:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (804, 45, 1, 1, '2019-06-02', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:29:57', 0, '', '2019-06-02 21:29:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (805, 45, 1, 9, '2019-06-02', 10.00, 1, 'extra', '21:39:39', 0, '001-1', '2019-06-02 21:39:39', NULL, NULL, NULL, 0.00, 1);
INSERT INTO `movimiento` VALUES (806, 47, 1, 1, '2019-06-04', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:18:43', 0, '', '2019-06-04 15:18:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (807, 47, 1, 1, '2019-06-04', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:30:22', 0, '', '2019-06-04 15:30:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (808, 47, 1, 1, '2019-06-04', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:34:06', 0, '', '2019-06-04 16:34:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (809, 47, 1, 1, '2019-06-04', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:40:11', 0, '', '2019-06-04 16:40:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (810, 47, 1, 1, '2019-06-04', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:25:14', 0, '', '2019-06-04 17:25:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (811, 47, 1, 1, '2019-06-04', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:25:14', 0, '', '2019-06-04 17:25:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (812, 47, 1, 1, '2019-06-04', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:54:02', 0, '', '2019-06-04 17:54:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (813, 47, 1, 1, '2019-06-04', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:06:25', 0, '', '2019-06-04 18:06:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (814, 47, 1, 1, '2019-06-04', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:53:54', 0, '', '2019-06-04 19:53:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (815, 49, 1, 1, '2019-06-05', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:17:59', 0, '', '2019-06-05 11:17:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (816, 49, 1, 1, '2019-06-05', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:23:15', 0, '', '2019-06-05 11:23:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (817, 49, 1, 1, '2019-06-05', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:42:54', 0, '', '2019-06-05 11:42:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (818, 49, 1, 1, '2019-06-05', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:45:12', 0, '', '2019-06-05 11:45:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (819, 49, 1, 1, '2019-06-05', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:47:36', 0, '', '2019-06-05 11:47:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (820, 49, 1, 1, '2019-06-05', 33.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:04:17', 0, '', '2019-06-05 13:04:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (821, 49, 1, 1, '2019-06-05', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:34:53', 0, '', '2019-06-05 15:34:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (822, 49, 1, 1, '2019-06-05', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:45:05', 0, '', '2019-06-05 15:45:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (823, 49, 1, 1, '2019-06-05', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:27:49', 0, '', '2019-06-05 16:27:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (824, 49, 1, 1, '2019-06-05', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:50:15', 0, '', '2019-06-05 16:50:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (825, 49, 1, 1, '2019-06-05', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:31:03', 0, '', '2019-06-05 17:31:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (826, 49, 1, 1, '2019-06-05', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:42:20', 0, '', '2019-06-05 17:42:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (827, 49, 1, 1, '2019-06-05', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:42:56', 0, '', '2019-06-05 17:42:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (828, 49, 1, 1, '2019-06-05', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:43:18', 0, '', '2019-06-05 17:43:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (829, 49, 1, 1, '2019-06-05', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:43:36', 0, '', '2019-06-05 17:43:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (830, 49, 1, 1, '2019-06-05', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:51:18', 0, '', '2019-06-05 17:51:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (831, 49, 1, 1, '2019-06-05', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:17:38', 0, '', '2019-06-05 18:17:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (832, 49, 1, 1, '2019-06-05', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:43:30', 0, '', '2019-06-05 18:43:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (833, 49, 1, 1, '2019-06-05', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:57:52', 0, '', '2019-06-05 18:57:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (834, 49, 1, 1, '2019-06-05', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:12:01', 0, '', '2019-06-05 20:12:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (835, 49, 1, 1, '2019-06-05', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:48:47', 0, '', '2019-06-05 20:48:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (836, 49, 1, 9, '2019-06-05', 5.00, 1, 'recarga celular', '20:57:06', 0, '001-1', '2019-06-05 20:57:06', NULL, NULL, NULL, 3.35, 1);
INSERT INTO `movimiento` VALUES (837, 51, 1, 1, '2019-06-06', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:49:34', 0, '', '2019-06-06 11:49:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (838, 51, 1, 1, '2019-06-06', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:08:57', 0, '', '2019-06-06 12:08:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (839, 51, 1, 1, '2019-06-06', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:32:48', 0, '', '2019-06-06 15:32:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (840, 51, 1, 1, '2019-06-06', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:48:10', 0, '', '2019-06-06 15:48:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (841, 51, 1, 1, '2019-06-06', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:47:47', 0, '', '2019-06-06 16:47:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (842, 51, 1, 1, '2019-06-06', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:49:30', 0, '', '2019-06-06 16:49:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (843, 51, 1, 1, '2019-06-06', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:22:13', 0, '', '2019-06-06 17:22:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (844, 51, 1, 1, '2019-06-06', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:33:03', 0, '', '2019-06-06 17:33:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (845, 51, 1, 1, '2019-06-06', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:13:11', 0, '', '2019-06-06 18:13:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (846, 51, 1, 1, '2019-06-06', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:15:58', 0, '', '2019-06-06 18:15:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (847, 51, 1, 1, '2019-06-06', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:55:53', 0, '', '2019-06-06 18:55:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (848, 51, 1, 1, '2019-06-06', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:32:44', 0, '', '2019-06-06 19:32:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (849, 51, 1, 1, '2019-06-06', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:33:29', 0, '', '2019-06-06 19:33:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (850, 51, 1, 1, '2019-06-06', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:56:33', 0, '', '2019-06-06 19:56:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (851, 51, 1, 1, '2019-06-06', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:11:28', 0, '', '2019-06-06 20:11:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (852, 51, 1, 1, '2019-06-06', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:00:26', 0, '', '2019-06-06 21:00:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (853, 51, 1, 1, '2019-06-06', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:09:07', 0, '', '2019-06-06 21:09:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (854, 53, 1, 1, '2019-06-07', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '09:39:45', 0, '', '2019-06-07 09:39:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (855, 53, 1, 1, '2019-06-07', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:42:01', 0, '', '2019-06-07 11:42:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (856, 53, 1, 1, '2019-06-07', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:16:39', 0, '', '2019-06-07 12:16:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (857, 53, 1, 1, '2019-06-07', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:54:02', 0, '', '2019-06-07 12:54:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (858, 53, 1, 1, '2019-06-07', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:17:31', 0, '', '2019-06-07 15:17:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (859, 53, 1, 1, '2019-06-07', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:26:24', 0, '', '2019-06-07 15:26:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (860, 53, 1, 1, '2019-06-07', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:33:09', 0, '', '2019-06-07 15:33:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (861, 53, 1, 1, '2019-06-07', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:19:13', 0, '', '2019-06-07 16:19:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (862, 53, 1, 1, '2019-06-07', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:19:58', 0, '', '2019-06-07 16:19:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (863, 53, 1, 1, '2019-06-07', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:38:20', 0, '', '2019-06-07 16:38:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (864, 53, 1, 1, '2019-06-07', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:34:31', 0, '', '2019-06-07 17:34:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (865, 53, 1, 1, '2019-06-07', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:39:53', 0, '', '2019-06-07 17:39:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (866, 53, 1, 1, '2019-06-07', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:57:19', 0, '', '2019-06-07 17:57:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (867, 53, 1, 1, '2019-06-07', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:10:08', 0, '', '2019-06-07 18:10:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (868, 53, 1, 1, '2019-06-07', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:12:12', 0, '', '2019-06-07 18:12:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (869, 53, 1, 1, '2019-06-07', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:51:13', 0, '', '2019-06-07 18:51:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (870, 53, 1, 1, '2019-06-07', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:49:11', 0, '', '2019-06-07 19:49:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (871, 53, 1, 1, '2019-06-07', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:35:48', 0, '', '2019-06-07 20:35:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (872, 53, 1, 1, '2019-06-07', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:50:57', 0, '', '2019-06-07 20:50:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (873, 53, 1, 1, '2019-06-07', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:57:08', 0, '', '2019-06-07 20:57:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (874, 53, 1, 1, '2019-06-07', 23.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:58:01', 0, '', '2019-06-07 20:58:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (875, 53, 1, 1, '2019-06-07', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:05:45', 0, '', '2019-06-07 21:05:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (876, 53, 1, 1, '2019-06-07', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:07:25', 0, '', '2019-06-07 21:07:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (877, 53, 1, 1, '2019-06-07', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:15:43', 0, '', '2019-06-07 21:15:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (878, 53, 1, 1, '2019-06-07', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:16:27', 0, '', '2019-06-07 21:16:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (879, 53, 1, 1, '2019-06-07', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:21:26', 0, '', '2019-06-07 21:21:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (880, 53, 1, 1, '2019-06-07', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:51:52', 0, '', '2019-06-07 21:51:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (881, 53, 1, 1, '2019-06-07', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:01:37', 0, '', '2019-06-07 22:01:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (882, 53, 1, 1, '2019-06-07', 51.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:13:46', 0, '', '2019-06-07 22:13:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (883, 53, 1, 1, '2019-06-07', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:18:01', 0, '', '2019-06-07 22:18:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (884, 53, 1, 1, '2019-06-07', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:28:20', 0, '', '2019-06-07 22:28:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (885, 53, 1, 1, '2019-06-07', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:35:14', 0, '', '2019-06-07 22:35:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (886, 53, 1, 1, '2019-06-07', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:36:12', 0, '', '2019-06-07 22:36:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (887, 53, 1, 1, '2019-06-07', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:48:36', 0, '', '2019-06-07 22:48:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (888, 53, 1, 9, '2019-06-07', 10.00, 1, 'recarga celular', '22:50:04', 0, '001-1', '2019-06-07 22:50:04', NULL, NULL, NULL, 3.34, 1);
INSERT INTO `movimiento` VALUES (889, 55, 1, 1, '2019-06-08', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:21:47', 0, '', '2019-06-08 12:21:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (890, 55, 1, 1, '2019-06-08', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:44:54', 0, '', '2019-06-08 12:44:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (891, 55, 1, 1, '2019-06-08', 1.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:17:41', 0, '', '2019-06-08 17:17:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (892, 55, 1, 1, '2019-06-08', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:24:57', 0, '', '2019-06-08 17:24:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (893, 55, 1, 9, '2019-06-08', 4.00, 1, 'agua', '17:49:08', 0, '001-1', '2019-06-08 17:49:08', NULL, NULL, NULL, 3.34, 1);
INSERT INTO `movimiento` VALUES (894, 55, 1, 1, '2019-06-08', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:01:46', 0, '', '2019-06-08 18:01:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (895, 55, 1, 1, '2019-06-08', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:19:35', 0, '', '2019-06-08 18:19:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (896, 55, 1, 1, '2019-06-08', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:22:20', 0, '', '2019-06-08 18:22:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (897, 55, 1, 1, '2019-06-08', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:47:06', 0, '', '2019-06-08 19:47:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (898, 55, 1, 1, '2019-06-08', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:02:40', 0, '', '2019-06-08 20:02:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (899, 55, 1, 1, '2019-06-08', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:50:32', 0, '', '2019-06-08 20:50:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (900, 57, 1, 1, '2019-06-09', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:54:31', 0, '', '2019-06-09 10:54:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (901, 57, 1, 1, '2019-06-09', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:48:23', 0, '', '2019-06-09 11:48:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (902, 57, 1, 1, '2019-06-09', 24.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:12:50', 0, '', '2019-06-09 12:12:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (903, 57, 1, 1, '2019-06-09', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:15:40', 0, '', '2019-06-09 12:15:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (904, 57, 1, 1, '2019-06-09', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:13:07', 0, '', '2019-06-09 16:13:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (905, 57, 1, 1, '2019-06-09', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:40:49', 0, '', '2019-06-09 16:40:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (906, 57, 1, 1, '2019-06-09', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:00:53', 0, '', '2019-06-09 17:00:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (907, 57, 1, 1, '2019-06-09', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:13:58', 0, '', '2019-06-09 17:13:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (908, 57, 1, 1, '2019-06-09', 26.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:26:29', 0, '', '2019-06-09 17:26:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (909, 57, 1, 1, '2019-06-09', 25.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:28:40', 0, '', '2019-06-09 17:28:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (910, 57, 1, 1, '2019-06-09', 21.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:47:05', 0, '', '2019-06-09 17:47:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (911, 57, 1, 1, '2019-06-09', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:04:08', 0, '', '2019-06-09 18:04:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (912, 57, 1, 1, '2019-06-09', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:27:56', 0, '', '2019-06-09 18:27:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (913, 57, 1, 1, '2019-06-09', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:47:25', 0, '', '2019-06-09 18:47:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (914, 57, 1, 1, '2019-06-09', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:53:11', 0, '', '2019-06-09 18:53:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (915, 57, 1, 1, '2019-06-09', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:34:45', 0, '', '2019-06-09 19:34:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (916, 57, 1, 1, '2019-06-09', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:37:04', 0, '', '2019-06-09 20:37:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (917, 57, 1, 1, '2019-06-09', 89.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:37:51', 0, '', '2019-06-09 20:37:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (918, 57, 1, 1, '2019-06-09', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:14:05', 0, '', '2019-06-09 21:14:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (919, 57, 1, 1, '2019-06-09', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:30:58', 0, '', '2019-06-09 21:30:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (920, 57, 1, 1, '2019-06-09', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:46:25', 0, '', '2019-06-09 21:46:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (921, 59, 1, 1, '2019-06-10', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:16:22', 0, '', '2019-06-10 15:16:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (922, 59, 1, 1, '2019-06-10', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:26:55', 0, '', '2019-06-10 15:26:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (923, 59, 1, 1, '2019-06-10', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:59:10', 0, '', '2019-06-10 16:59:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (924, 59, 1, 1, '2019-06-10', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:07:49', 0, '', '2019-06-10 17:07:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (925, 59, 1, 1, '2019-06-10', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:30:23', 0, '', '2019-06-10 17:30:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (926, 59, 1, 1, '2019-06-10', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:31:51', 0, '', '2019-06-10 17:31:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (927, 59, 1, 1, '2019-06-10', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:59:43', 0, '', '2019-06-10 17:59:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (928, 59, 1, 1, '2019-06-10', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:46:15', 0, '', '2019-06-10 18:46:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (929, 59, 1, 1, '2019-06-10', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:15:47', 0, '', '2019-06-10 19:15:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (930, 59, 1, 1, '2019-06-10', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:23:43', 0, '', '2019-06-10 19:23:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (931, 59, 1, 1, '2019-06-10', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:50:16', 0, '', '2019-06-10 19:50:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (932, 61, 1, 1, '2019-06-11', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:25:14', 0, '', '2019-06-11 10:25:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (933, 61, 1, 1, '2019-06-11', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:09:58', 0, '', '2019-06-11 11:09:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (934, 61, 1, 1, '2019-06-11', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:19:57', 0, '', '2019-06-11 16:19:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (935, 61, 1, 1, '2019-06-11', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:29:18', 0, '', '2019-06-11 16:29:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (936, 61, 1, 1, '2019-06-11', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:30:43', 0, '', '2019-06-11 16:30:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (937, 61, 1, 1, '2019-06-11', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:31:08', 0, '', '2019-06-11 16:31:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (938, 61, 1, 1, '2019-06-11', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:32:23', 0, '', '2019-06-11 16:32:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (939, 61, 1, 1, '2019-06-11', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:46:10', 0, '', '2019-06-11 16:46:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (940, 61, 1, 1, '2019-06-11', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:51:58', 0, '', '2019-06-11 16:51:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (941, 61, 1, 1, '2019-06-11', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:59:30', 0, '', '2019-06-11 17:59:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (942, 61, 1, 1, '2019-06-11', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:07:10', 0, '', '2019-06-11 18:07:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (943, 61, 1, 1, '2019-06-11', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:46:18', 0, '', '2019-06-11 18:46:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (944, 61, 1, 1, '2019-06-11', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:58:21', 0, '', '2019-06-11 18:58:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (945, 63, 1, 1, '2019-06-12', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:17:26', 0, '', '2019-06-12 11:17:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (946, 63, 1, 1, '2019-06-12', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:56:39', 0, '', '2019-06-12 12:56:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (947, 63, 1, 1, '2019-06-12', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:12:10', 0, '', '2019-06-12 15:12:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (948, 63, 1, 1, '2019-06-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:25:00', 0, '', '2019-06-12 15:25:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (949, 63, 1, 1, '2019-06-12', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:47:54', 0, '', '2019-06-12 15:47:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (950, 63, 1, 1, '2019-06-12', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:30:08', 0, '', '2019-06-12 16:30:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (951, 63, 1, 1, '2019-06-12', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:44:22', 0, '', '2019-06-12 16:44:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (952, 63, 1, 1, '2019-06-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:54:33', 0, '', '2019-06-12 16:54:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (953, 63, 1, 1, '2019-06-12', 32.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:42:22', 0, '', '2019-06-12 17:42:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (954, 63, 1, 1, '2019-06-12', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:54:34', 0, '', '2019-06-12 17:54:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (955, 63, 1, 1, '2019-06-12', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:03:08', 0, '', '2019-06-12 18:03:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (956, 63, 1, 1, '2019-06-12', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:11:35', 0, '', '2019-06-12 18:11:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (957, 63, 1, 1, '2019-06-12', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:47:35', 0, '', '2019-06-12 18:47:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (958, 63, 1, 1, '2019-06-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:51:35', 0, '', '2019-06-12 18:51:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (959, 63, 1, 1, '2019-06-12', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:20:47', 0, '', '2019-06-12 19:20:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (960, 63, 1, 1, '2019-06-12', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:33:19', 0, '', '2019-06-12 19:33:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (961, 63, 1, 1, '2019-06-12', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:39:22', 0, '', '2019-06-12 19:39:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (962, 63, 1, 1, '2019-06-12', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:05:50', 0, '', '2019-06-12 20:05:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (963, 63, 1, 1, '2019-06-12', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:51:29', 0, '', '2019-06-12 20:51:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (964, 63, 1, 1, '2019-06-12', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:51:57', 0, '', '2019-06-12 20:51:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (965, 63, 1, 1, '2019-06-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:54:24', 0, '', '2019-06-12 20:54:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (966, 63, 1, 1, '2019-06-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:09:02', 0, '', '2019-06-12 21:09:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (967, 65, 1, 1, '2019-06-13', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:42:33', 0, '', '2019-06-13 11:42:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (968, 65, 1, 1, '2019-06-13', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:46:06', 0, '', '2019-06-13 11:46:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (969, 65, 1, 1, '2019-06-13', 237.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:25:52', 0, '', '2019-06-14 11:25:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (970, 67, 1, 1, '2019-06-14', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:41:34', 0, '', '2019-06-14 11:41:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (971, 67, 1, 1, '2019-06-14', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:42:09', 0, '', '2019-06-14 11:42:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (972, 67, 1, 1, '2019-06-14', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:50:05', 0, '', '2019-06-14 11:50:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (973, 67, 1, 1, '2019-06-14', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:00:35', 0, '', '2019-06-14 12:00:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (974, 67, 1, 1, '2019-06-14', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:10:53', 0, '', '2019-06-14 12:10:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (975, 67, 1, 1, '2019-06-14', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:30:40', 0, '', '2019-06-14 12:30:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (976, 67, 1, 1, '2019-06-14', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:24:45', 0, '', '2019-06-14 16:24:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (977, 67, 1, 1, '2019-06-14', 70.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:30:29', 0, '', '2019-06-14 21:30:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (978, 67, 1, 1, '2019-06-14', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:34:44', 0, '', '2019-06-14 21:34:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (979, 67, 1, 1, '2019-06-14', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:39:22', 0, '', '2019-06-14 21:39:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (980, 67, 1, 1, '2019-06-14', 44.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:45:52', 0, '', '2019-06-14 21:45:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (981, 67, 1, 1, '2019-06-14', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:56:05', 0, '', '2019-06-14 21:56:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (982, 67, 1, 1, '2019-06-14', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:58:47', 0, '', '2019-06-14 21:58:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (983, 67, 1, 1, '2019-06-14', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:04:04', 0, '', '2019-06-14 22:04:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (984, 67, 1, 1, '2019-06-14', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:06:29', 0, '', '2019-06-14 22:06:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (985, 69, 1, 9, '2019-06-15', 50.00, 1, 'Producción', '15:51:31', 0, '001', '2019-06-15 15:51:31', NULL, NULL, NULL, 3.33, 1);
INSERT INTO `movimiento` VALUES (986, 69, 1, 1, '2019-06-15', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:21:05', 0, '', '2019-06-15 17:21:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (987, 69, 1, 1, '2019-06-15', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:21:50', 0, '', '2019-06-15 17:21:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (988, 69, 1, 1, '2019-06-15', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:22:33', 0, '', '2019-06-15 17:22:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (989, 69, 1, 1, '2019-06-15', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:23:03', 0, '', '2019-06-15 17:23:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (990, 69, 1, 1, '2019-06-15', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:23:55', 0, '', '2019-06-15 17:23:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (991, 69, 1, 1, '2019-06-15', 26.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:25:07', 0, '', '2019-06-15 17:25:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (992, 69, 1, 1, '2019-06-15', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:25:42', 0, '', '2019-06-15 17:25:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (993, 69, 1, 1, '2019-06-15', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:27:04', 0, '', '2019-06-15 17:27:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (994, 69, 1, 1, '2019-06-15', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:30:08', 0, '', '2019-06-15 17:30:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (995, 69, 1, 1, '2019-06-15', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:30:35', 0, '', '2019-06-15 17:30:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (996, 69, 1, 1, '2019-06-15', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:34:01', 0, '', '2019-06-15 17:34:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (997, 69, 1, 1, '2019-06-15', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:35:03', 0, '', '2019-06-15 17:35:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (998, 69, 1, 1, '2019-06-15', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:52:41', 0, '', '2019-06-15 17:52:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (999, 69, 1, 1, '2019-06-15', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:59:13', 0, '', '2019-06-15 17:59:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1000, 69, 1, 1, '2019-06-15', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:02:05', 0, '', '2019-06-15 18:02:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1001, 69, 1, 1, '2019-06-15', 25.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:06:40', 0, '', '2019-06-15 18:06:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1002, 69, 1, 1, '2019-06-15', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:19:29', 0, '', '2019-06-15 18:19:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1003, 69, 1, 1, '2019-06-15', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:26:42', 0, '', '2019-06-15 18:26:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1004, 69, 1, 1, '2019-06-15', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:48:49', 0, '', '2019-06-15 18:48:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1005, 69, 1, 1, '2019-06-15', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:49:19', 0, '', '2019-06-15 18:49:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1006, 69, 1, 1, '2019-06-15', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:57:57', 0, '', '2019-06-15 18:57:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1007, 69, 1, 1, '2019-06-15', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:36:56', 0, '', '2019-06-15 19:36:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1008, 69, 1, 1, '2019-06-15', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:58:21', 0, '', '2019-06-15 20:58:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1009, 69, 1, 1, '2019-06-15', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:13:19', 0, '', '2019-06-15 21:13:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1010, 71, 1, 1, '2019-06-18', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:03:52', 0, '', '2019-06-18 12:03:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1011, 71, 1, 1, '2019-06-18', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:17:36', 0, '', '2019-06-18 12:17:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1012, 71, 1, 1, '2019-06-18', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:52:44', 0, '', '2019-06-18 12:52:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1013, 71, 1, 1, '2019-06-18', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:11:18', 0, '', '2019-06-18 16:11:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1014, 71, 1, 1, '2019-06-18', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:33:58', 0, '', '2019-06-18 17:33:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1015, 71, 1, 1, '2019-06-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:43:53', 0, '', '2019-06-18 17:43:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1016, 71, 1, 1, '2019-06-18', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:49:05', 0, '', '2019-06-18 18:49:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1017, 71, 1, 1, '2019-06-18', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:49:56', 0, '', '2019-06-18 18:49:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1018, 71, 1, 1, '2019-06-18', 29.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:53:47', 0, '', '2019-06-18 18:53:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1019, 71, 1, 1, '2019-06-18', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:04:05', 0, '', '2019-06-18 20:04:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1020, 71, 1, 1, '2019-06-18', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:19:12', 0, '', '2019-06-18 20:19:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1021, 71, 1, 1, '2019-06-18', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:23:07', 0, '', '2019-06-18 20:23:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1022, 71, 1, 1, '2019-06-18', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:20:13', 0, '', '2019-06-18 21:20:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1023, 71, 1, 1, '2019-06-18', 28.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:25:06', 0, '', '2019-06-18 21:25:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1024, 73, 1, 1, '2019-06-19', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:14:08', 0, '', '2019-06-19 10:14:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1025, 73, 1, 1, '2019-06-19', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:41:18', 0, '', '2019-06-19 12:41:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1026, 73, 1, 1, '2019-06-19', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:17:54', 0, '', '2019-06-19 15:17:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1027, 73, 1, 1, '2019-06-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:06:24', 0, '', '2019-06-19 16:06:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1028, 73, 1, 1, '2019-06-19', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:07:31', 0, '', '2019-06-19 16:07:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1029, 73, 1, 1, '2019-06-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:42:11', 0, '', '2019-06-19 16:42:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1030, 73, 1, 1, '2019-06-19', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:59:47', 0, '', '2019-06-19 16:59:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1031, 73, 1, 1, '2019-06-19', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:22:56', 0, '', '2019-06-19 17:22:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1032, 73, 1, 1, '2019-06-19', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:28:14', 0, '', '2019-06-19 17:28:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1033, 73, 1, 1, '2019-06-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:33:34', 0, '', '2019-06-19 17:33:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1034, 73, 1, 1, '2019-06-19', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:11:08', 0, '', '2019-06-19 18:11:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1035, 73, 1, 1, '2019-06-19', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:12:16', 0, '', '2019-06-19 18:12:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1036, 73, 1, 1, '2019-06-19', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:23:44', 0, '', '2019-06-19 18:23:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1037, 73, 1, 1, '2019-06-19', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:24:46', 0, '', '2019-06-19 18:24:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1038, 73, 1, 13, '2019-06-19', 1.00, 1, '1 bola', '18:27:56', 0, '001-1', '2019-06-19 18:27:56', NULL, NULL, NULL, 3.35, 1);
INSERT INTO `movimiento` VALUES (1039, 73, 1, 1, '2019-06-19', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:36:58', 0, '', '2019-06-19 18:36:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1040, 73, 1, 1, '2019-06-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:38:33', 0, '', '2019-06-19 18:38:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1041, 73, 1, 1, '2019-06-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:50:06', 0, '', '2019-06-19 18:50:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1042, 73, 1, 1, '2019-06-19', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:19:43', 0, '', '2019-06-19 19:19:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1043, 73, 1, 1, '2019-06-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:41:00', 0, '', '2019-06-19 19:41:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1044, 73, 1, 1, '2019-06-19', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:30:24', 0, '', '2019-06-19 20:30:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1045, 73, 1, 1, '2019-06-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:38:45', 0, '', '2019-06-19 20:38:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1046, 73, 1, 1, '2019-06-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:40:27', 0, '', '2019-06-19 20:40:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1047, 75, 1, 1, '2019-06-20', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:59:55', 0, '', '2019-06-20 10:59:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1048, 75, 1, 1, '2019-06-20', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:06:49', 0, '', '2019-06-20 12:06:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1049, 75, 1, 1, '2019-06-20', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:51:08', 0, '', '2019-06-20 12:51:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1050, 75, 1, 1, '2019-06-20', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:03:14', 0, '', '2019-06-20 16:03:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1051, 75, 1, 1, '2019-06-20', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:16:18', 0, '', '2019-06-20 16:16:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1052, 75, 1, 1, '2019-06-20', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:30:16', 0, '', '2019-06-20 16:30:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1053, 75, 1, 13, '2019-06-20', 2.50, 1, '', '16:38:31', 0, '001-1', '2019-06-20 16:38:31', NULL, NULL, NULL, 3.35, 1);
INSERT INTO `movimiento` VALUES (1054, 75, 1, 1, '2019-06-20', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:40:52', 0, '', '2019-06-20 16:40:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1055, 75, 1, 1, '2019-06-20', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:05:31', 0, '', '2019-06-20 17:05:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1056, 75, 1, 1, '2019-06-20', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:06:47', 0, '', '2019-06-20 17:06:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1057, 75, 1, 1, '2019-06-20', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:16:07', 0, '', '2019-06-20 17:16:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1058, 75, 1, 1, '2019-06-20', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:38:39', 0, '', '2019-06-20 17:38:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1059, 75, 1, 1, '2019-06-20', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:44:42', 0, '', '2019-06-20 17:44:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1060, 75, 1, 1, '2019-06-20', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:11:21', 0, '', '2019-06-20 18:11:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1061, 75, 1, 1, '2019-06-20', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:12:59', 0, '', '2019-06-20 18:12:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1062, 75, 1, 1, '2019-06-20', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:01:31', 0, '', '2019-06-20 19:01:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1063, 75, 1, 1, '2019-06-20', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:08:33', 0, '', '2019-06-20 19:08:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1064, 75, 1, 1, '2019-06-20', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:14:54', 0, '', '2019-06-20 20:14:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1065, 75, 1, 1, '2019-06-20', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:51:29', 0, '', '2019-06-20 20:51:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1066, 75, 1, 1, '2019-06-20', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:00:08', 0, '', '2019-06-20 21:00:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1067, 75, 1, 1, '2019-06-20', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:01:24', 0, '', '2019-06-20 21:01:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1068, 77, 1, 1, '2019-06-21', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:32:00', 0, '', '2019-06-21 10:32:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1069, 77, 1, 1, '2019-06-21', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:07:54', 0, '', '2019-06-21 11:07:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1070, 77, 1, 1, '2019-06-21', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:25:33', 0, '', '2019-06-21 15:25:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1071, 77, 1, 1, '2019-06-21', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:50:01', 0, '', '2019-06-21 15:50:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1072, 77, 1, 1, '2019-06-21', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:04:43', 0, '', '2019-06-21 16:04:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1073, 77, 1, 1, '2019-06-21', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:43:54', 0, '', '2019-06-21 16:43:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1074, 77, 1, 1, '2019-06-21', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:52:07', 0, '', '2019-06-21 16:52:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1075, 77, 1, 1, '2019-06-21', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:10:17', 0, '', '2019-06-21 17:10:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1076, 77, 1, 1, '2019-06-21', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:38:46', 0, '', '2019-06-21 17:38:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1077, 77, 1, 1, '2019-06-21', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:45:53', 0, '', '2019-06-21 17:45:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1078, 77, 1, 1, '2019-06-21', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:53:06', 0, '', '2019-06-21 17:53:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1079, 77, 1, 1, '2019-06-21', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:24:33', 0, '', '2019-06-21 18:24:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1080, 77, 1, 1, '2019-06-21', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:53:58', 0, '', '2019-06-21 18:53:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1081, 77, 1, 1, '2019-06-21', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:34:18', 0, '', '2019-06-21 20:34:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1082, 77, 1, 1, '2019-06-21', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:48:12', 0, '', '2019-06-21 20:48:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1083, 77, 1, 1, '2019-06-21', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:49:07', 0, '', '2019-06-21 20:49:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1084, 79, 1, 1, '2019-06-22', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:43:06', 0, '', '2019-06-22 11:43:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1085, 79, 1, 1, '2019-06-22', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:42:40', 0, '', '2019-06-22 15:42:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1086, 79, 1, 1, '2019-06-22', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:46:51', 0, '', '2019-06-22 15:46:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1087, 79, 1, 1, '2019-06-22', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:00:18', 0, '', '2019-06-22 17:00:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1088, 79, 1, 1, '2019-06-22', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:33:23', 0, '', '2019-06-22 17:33:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1089, 79, 1, 1, '2019-06-22', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:34:09', 0, '', '2019-06-22 17:34:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1090, 79, 1, 1, '2019-06-22', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:35:51', 0, '', '2019-06-22 17:35:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1091, 79, 1, 1, '2019-06-22', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:38:45', 0, '', '2019-06-22 17:38:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1092, 79, 1, 1, '2019-06-22', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:06:14', 0, '', '2019-06-22 18:06:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1093, 79, 1, 1, '2019-06-22', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:59:38', 0, '', '2019-06-22 19:59:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1094, 79, 1, 9, '2019-06-22', 3.00, 1, 'registrè mal (Pedro) una paleta de màs', '20:02:19', 0, '001-1', '2019-06-22 20:02:19', NULL, NULL, NULL, 3.35, 1);
INSERT INTO `movimiento` VALUES (1095, 79, 1, 1, '2019-06-22', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:13:42', 0, '', '2019-06-22 20:13:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1096, 81, 1, 1, '2019-06-23', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:54:43', 0, '', '2019-06-23 10:54:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1097, 81, 1, 1, '2019-06-23', 30.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:28:20', 0, '', '2019-06-23 11:28:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1098, 81, 1, 1, '2019-06-23', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:09:50', 0, '', '2019-06-23 12:09:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1099, 81, 1, 1, '2019-06-23', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:22:44', 0, '', '2019-06-23 15:22:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1100, 81, 1, 1, '2019-06-23', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:36:21', 0, '', '2019-06-23 16:36:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1101, 81, 1, 1, '2019-06-23', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:56:40', 0, '', '2019-06-23 16:56:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1102, 81, 1, 1, '2019-06-23', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:11:42', 0, '', '2019-06-23 17:11:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1103, 81, 1, 1, '2019-06-23', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:12:09', 0, '', '2019-06-23 17:12:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1104, 81, 1, 1, '2019-06-23', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:27:16', 0, '', '2019-06-23 17:27:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1105, 81, 1, 1, '2019-06-23', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:33:57', 0, '', '2019-06-23 17:33:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1106, 81, 1, 1, '2019-06-23', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:41:10', 0, '', '2019-06-23 17:41:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1107, 81, 1, 1, '2019-06-23', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:43:55', 0, '', '2019-06-23 17:43:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1108, 81, 1, 1, '2019-06-23', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:01:46', 0, '', '2019-06-23 18:01:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1109, 81, 1, 1, '2019-06-23', 51.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:30:54', 0, '', '2019-06-23 18:30:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1110, 81, 1, 1, '2019-06-23', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:45:13', 0, '', '2019-06-23 18:45:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1111, 81, 1, 1, '2019-06-23', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:45:59', 0, '', '2019-06-23 18:45:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1112, 81, 1, 1, '2019-06-23', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:48:07', 0, '', '2019-06-23 18:48:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1113, 81, 1, 1, '2019-06-23', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:50:52', 0, '', '2019-06-23 18:50:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1114, 81, 1, 1, '2019-06-23', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:51:27', 0, '', '2019-06-23 18:51:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1115, 81, 1, 1, '2019-06-23', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:09:50', 0, '', '2019-06-23 19:09:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1116, 81, 1, 1, '2019-06-23', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:13:08', 0, '', '2019-06-23 19:13:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1117, 81, 1, 1, '2019-06-23', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:57:27', 0, '', '2019-06-23 19:57:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1118, 81, 1, 1, '2019-06-23', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:57:48', 0, '', '2019-06-23 19:57:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1119, 81, 1, 1, '2019-06-23', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:26:35', 0, '', '2019-06-23 20:26:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1120, 81, 1, 1, '2019-06-23', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:44:23', 0, '', '2019-06-23 20:44:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1121, 81, 1, 1, '2019-06-23', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:44:43', 0, '', '2019-06-23 20:44:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1122, 81, 1, 1, '2019-06-23', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:14:51', 0, '', '2019-06-23 21:14:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1123, 81, 1, 1, '2019-06-23', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:47:00', 0, '', '2019-06-23 21:47:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1124, 83, 1, 1, '2019-06-25', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:55:08', 0, '', '2019-06-25 11:55:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1125, 83, 1, 1, '2019-06-25', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:56:42', 0, '', '2019-06-25 11:56:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1126, 83, 1, 1, '2019-06-25', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:31:15', 0, '', '2019-06-25 15:31:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1127, 83, 1, 1, '2019-06-25', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:03:20', 0, '', '2019-06-25 16:03:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1128, 83, 1, 1, '2019-06-25', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:13:43', 0, '', '2019-06-25 16:13:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1129, 83, 1, 1, '2019-06-25', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:49:05', 0, '', '2019-06-25 16:49:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1130, 83, 1, 1, '2019-06-25', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:26:42', 0, '', '2019-06-25 17:26:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1131, 83, 1, 1, '2019-06-25', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:31:27', 0, '', '2019-06-25 17:31:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1132, 83, 1, 1, '2019-06-25', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:35:31', 0, '', '2019-06-25 17:35:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1133, 83, 1, 1, '2019-06-25', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:53:52', 0, '', '2019-06-25 17:53:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1134, 83, 1, 1, '2019-06-25', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:57:05', 0, '', '2019-06-25 17:57:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1135, 83, 1, 1, '2019-06-25', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:26:35', 0, '', '2019-06-25 18:26:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1136, 83, 1, 1, '2019-06-25', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:26:57', 0, '', '2019-06-25 18:26:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1137, 83, 1, 1, '2019-06-25', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:03:37', 0, '', '2019-06-25 19:03:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1138, 83, 1, 1, '2019-06-25', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:39:03', 0, '', '2019-06-25 19:39:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1139, 83, 1, 1, '2019-06-25', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:11:10', 0, '', '2019-06-25 20:11:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1140, 83, 1, 1, '2019-06-25', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:12:23', 0, '', '2019-06-25 20:12:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1141, 83, 1, 1, '2019-06-25', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:49:08', 0, '', '2019-06-25 20:49:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1142, 83, 1, 1, '2019-06-25', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:56:21', 0, '', '2019-06-25 20:56:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1143, 85, 1, 1, '2019-06-26', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:36:05', 0, '', '2019-06-26 11:36:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1144, 85, 1, 1, '2019-06-26', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:45:42', 0, '', '2019-06-26 11:45:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1145, 85, 1, 1, '2019-06-26', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:16:09', 0, '', '2019-06-26 15:16:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1146, 85, 1, 1, '2019-06-26', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:17:13', 0, '', '2019-06-26 15:17:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1147, 85, 1, 1, '2019-06-26', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:29:48', 0, '', '2019-06-26 15:29:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1148, 85, 1, 1, '2019-06-26', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:57:58', 0, '', '2019-06-26 15:57:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1149, 85, 1, 1, '2019-06-26', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:27:51', 0, '', '2019-06-26 16:27:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1150, 85, 1, 1, '2019-06-26', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:29:03', 0, '', '2019-06-26 16:29:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1151, 85, 1, 1, '2019-06-26', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:19:56', 0, '', '2019-06-26 17:19:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1152, 85, 1, 1, '2019-06-26', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:57:44', 0, '', '2019-06-26 17:57:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1153, 85, 1, 1, '2019-06-26', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:59:22', 0, '', '2019-06-26 17:59:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1154, 85, 1, 1, '2019-06-26', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:00:10', 0, '', '2019-06-26 18:00:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1155, 85, 1, 1, '2019-06-26', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:18:23', 0, '', '2019-06-26 18:18:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1156, 85, 1, 1, '2019-06-26', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:21:50', 0, '', '2019-06-26 18:21:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1157, 85, 1, 1, '2019-06-26', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:40:20', 0, '', '2019-06-26 18:40:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1158, 85, 1, 1, '2019-06-26', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:00:42', 0, '', '2019-06-26 19:00:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1159, 85, 1, 1, '2019-06-26', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:06:22', 0, '', '2019-06-26 19:06:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1160, 85, 1, 1, '2019-06-26', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:47:37', 0, '', '2019-06-26 20:47:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1161, 85, 1, 1, '2019-06-26', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:03:55', 0, '', '2019-06-26 21:03:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1162, 87, 1, 1, '2019-06-27', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:42:24', 0, '', '2019-06-27 11:42:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1163, 87, 1, 1, '2019-06-27', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:04:27', 0, '', '2019-06-27 16:04:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1164, 87, 1, 1, '2019-06-27', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:05:41', 0, '', '2019-06-27 16:05:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1165, 87, 1, 1, '2019-06-27', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:13:04', 0, '', '2019-06-27 16:13:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1166, 87, 1, 1, '2019-06-27', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:53:45', 0, '', '2019-06-27 16:53:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1167, 87, 1, 1, '2019-06-27', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:54:33', 0, '', '2019-06-27 16:54:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1168, 87, 1, 1, '2019-06-27', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:52:07', 0, '', '2019-06-27 17:52:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1169, 87, 1, 1, '2019-06-27', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:27:50', 0, '', '2019-06-27 19:27:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1170, 87, 1, 1, '2019-06-27', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:44:59', 0, '', '2019-06-27 20:44:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1171, 87, 1, 1, '2019-06-27', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:47:34', 0, '', '2019-06-27 20:47:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1172, 89, 1, 1, '2019-06-28', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:58:37', 0, '', '2019-06-28 10:58:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1173, 89, 1, 1, '2019-06-28', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:24:21', 0, '', '2019-06-28 11:24:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1174, 89, 1, 1, '2019-06-28', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:23:10', 0, '', '2019-06-28 12:23:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1175, 89, 1, 1, '2019-06-28', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:23:45', 0, '', '2019-06-28 12:23:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1176, 89, 1, 1, '2019-06-28', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:33:26', 0, '', '2019-06-28 12:33:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1177, 89, 1, 1, '2019-06-28', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:26:51', 0, '', '2019-06-28 15:26:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1178, 89, 1, 1, '2019-06-28', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:01:20', 0, '', '2019-06-28 16:01:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1179, 89, 1, 1, '2019-06-28', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:51:48', 0, '', '2019-06-28 16:51:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1180, 89, 1, 1, '2019-06-28', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:24:20', 0, '', '2019-06-28 17:24:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1181, 89, 1, 1, '2019-06-28', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:27:09', 0, '', '2019-06-28 17:27:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1182, 89, 1, 1, '2019-06-28', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:27:36', 0, '', '2019-06-28 17:27:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1183, 89, 1, 1, '2019-06-28', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:31:00', 0, '', '2019-06-28 17:31:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1184, 89, 1, 1, '2019-06-28', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:57:29', 0, '', '2019-06-28 17:57:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1185, 89, 1, 1, '2019-06-28', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:59:28', 0, '', '2019-06-28 17:59:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1186, 89, 1, 1, '2019-06-28', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:14:47', 0, '', '2019-06-28 19:14:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1187, 89, 1, 1, '2019-06-28', 0.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:17:42', 0, '', '2019-06-28 19:17:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1188, 89, 1, 1, '2019-06-28', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:28:08', 0, '', '2019-06-28 19:28:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1189, 89, 1, 1, '2019-06-28', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:08:08', 0, '', '2019-06-28 20:08:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1190, 89, 1, 1, '2019-06-28', 0.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:17:39', 0, '', '2019-06-28 20:17:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1191, 89, 1, 1, '2019-06-28', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:17:57', 0, '', '2019-06-28 20:17:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1192, 89, 1, 1, '2019-06-28', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:34:45', 0, '', '2019-06-28 20:34:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1193, 89, 1, 1, '2019-06-28', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:06:00', 0, '', '2019-06-28 22:06:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1194, 91, 1, 1, '2019-06-29', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:10:11', 0, '', '2019-06-29 12:10:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1195, 91, 1, 1, '2019-06-29', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:10:42', 0, '', '2019-06-29 12:10:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1196, 91, 1, 1, '2019-06-29', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:26:58', 0, '', '2019-06-29 12:26:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1197, 91, 1, 1, '2019-06-29', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:27:12', 0, '', '2019-06-29 12:27:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1198, 91, 1, 1, '2019-06-29', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:38:20', 0, '', '2019-06-29 15:38:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1199, 91, 1, 1, '2019-06-29', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:55:15', 0, '', '2019-06-29 16:55:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1200, 91, 1, 1, '2019-06-29', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:04:47', 0, '', '2019-06-29 17:04:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1201, 91, 1, 1, '2019-06-29', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:20:26', 0, '', '2019-06-29 17:20:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1202, 91, 1, 1, '2019-06-29', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:20:40', 0, '', '2019-06-29 17:20:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1203, 91, 1, 1, '2019-06-29', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:33:09', 0, '', '2019-06-29 17:33:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1204, 91, 1, 1, '2019-06-29', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:52:49', 0, '', '2019-06-29 17:52:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1205, 91, 1, 1, '2019-06-29', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:15:37', 0, '', '2019-06-29 18:15:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1206, 91, 1, 1, '2019-06-29', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:16:49', 0, '', '2019-06-29 18:16:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1207, 91, 1, 1, '2019-06-29', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:30:43', 0, '', '2019-06-29 18:30:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1208, 91, 1, 1, '2019-06-29', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:34:02', 0, '', '2019-06-29 18:34:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1209, 91, 1, 1, '2019-06-29', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:09:57', 0, '', '2019-06-29 19:09:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1210, 91, 1, 1, '2019-06-29', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:20:49', 0, '', '2019-06-29 19:20:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1211, 91, 1, 1, '2019-06-29', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:22:06', 0, '', '2019-06-29 19:22:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1212, 91, 1, 1, '2019-06-29', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:06:02', 0, '', '2019-06-29 20:06:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1213, 91, 1, 1, '2019-06-29', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:11:58', 0, '', '2019-06-29 20:11:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1214, 91, 1, 1, '2019-06-29', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:45:56', 0, '', '2019-06-29 20:45:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1215, 91, 1, 1, '2019-06-29', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:46:36', 0, '', '2019-06-29 20:46:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1216, 91, 1, 1, '2019-06-29', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:14:05', 0, '', '2019-06-29 21:14:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1217, 91, 1, 1, '2019-06-29', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:16:38', 0, '', '2019-06-29 21:16:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1218, 91, 1, 1, '2019-06-29', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:38:25', 0, '', '2019-06-29 21:38:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1219, 91, 1, 1, '2019-06-29', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:53:19', 0, '', '2019-06-29 21:53:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1220, 93, 1, 1, '2019-06-30', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:53:49', 0, '', '2019-06-30 10:53:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1221, 93, 1, 1, '2019-06-30', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:16:39', 0, '', '2019-06-30 11:16:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1222, 93, 1, 1, '2019-06-30', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:29:32', 0, '', '2019-06-30 11:29:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1223, 93, 1, 1, '2019-06-30', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:50:56', 0, '', '2019-06-30 11:50:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1224, 93, 1, 1, '2019-06-30', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:13:36', 0, '', '2019-06-30 12:13:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1225, 93, 1, 1, '2019-06-30', 33.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:10:26', 0, '', '2019-06-30 15:10:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1226, 93, 1, 1, '2019-06-30', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:30:24', 0, '', '2019-06-30 15:30:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1227, 93, 1, 1, '2019-06-30', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:32:56', 0, '', '2019-06-30 16:32:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1228, 93, 1, 1, '2019-06-30', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:34:03', 0, '', '2019-06-30 16:34:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1229, 93, 1, 1, '2019-06-30', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:41:16', 0, '', '2019-06-30 16:41:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1230, 93, 1, 1, '2019-06-30', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:52:04', 0, '', '2019-06-30 16:52:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1231, 93, 1, 1, '2019-06-30', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:55:03', 0, '', '2019-06-30 16:55:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1232, 93, 1, 1, '2019-06-30', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:57:23', 0, '', '2019-06-30 16:57:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1233, 93, 1, 1, '2019-06-30', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:06:00', 0, '', '2019-06-30 17:06:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1234, 93, 1, 1, '2019-06-30', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:08:25', 0, '', '2019-06-30 17:08:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1235, 93, 1, 1, '2019-06-30', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:08:43', 0, '', '2019-06-30 17:08:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1236, 93, 1, 1, '2019-06-30', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:21:14', 0, '', '2019-06-30 17:21:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1237, 93, 1, 1, '2019-06-30', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:31:23', 0, '', '2019-06-30 17:31:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1238, 93, 1, 1, '2019-06-30', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:40:55', 0, '', '2019-06-30 17:40:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1239, 93, 1, 1, '2019-06-30', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:12:51', 0, '', '2019-06-30 18:12:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1240, 93, 1, 1, '2019-06-30', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:06:23', 0, '', '2019-06-30 19:06:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1241, 93, 1, 1, '2019-06-30', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:06:56', 0, '', '2019-06-30 19:06:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1242, 93, 1, 1, '2019-06-30', 27.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:08:40', 0, '', '2019-06-30 19:08:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1243, 93, 1, 1, '2019-06-30', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:09:11', 0, '', '2019-06-30 19:09:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1244, 93, 1, 1, '2019-06-30', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:10:21', 0, '', '2019-06-30 19:10:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1245, 93, 1, 1, '2019-06-30', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:13:20', 0, '', '2019-06-30 19:13:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1246, 93, 1, 1, '2019-06-30', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:13:43', 0, '', '2019-06-30 19:13:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1247, 93, 1, 1, '2019-06-30', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:53:12', 0, '', '2019-06-30 19:53:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1248, 93, 1, 1, '2019-06-30', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:58:13', 0, '', '2019-06-30 19:58:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1249, 93, 1, 1, '2019-06-30', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:12:29', 0, '', '2019-06-30 21:12:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1250, 93, 1, 1, '2019-06-30', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:12:58', 0, '', '2019-06-30 21:12:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1251, 93, 1, 1, '2019-06-30', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:21:18', 0, '', '2019-06-30 21:21:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1252, 93, 1, 1, '2019-06-30', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:45:22', 0, '', '2019-06-30 21:45:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1253, 93, 1, 1, '2019-06-30', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:00:12', 0, '', '2019-06-30 22:00:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1254, 93, 1, 1, '2019-06-30', 26.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:00:24', 0, '', '2019-06-30 22:00:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1255, 93, 1, 1, '2019-06-30', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:02:47', 0, '', '2019-06-30 22:02:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1256, 93, 1, 1, '2019-06-30', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:07:07', 0, '', '2019-06-30 22:07:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1257, 93, 1, 1, '2019-06-30', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:08:19', 0, '', '2019-06-30 22:08:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1258, 93, 1, 1, '2019-06-30', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:14:06', 0, '', '2019-06-30 22:14:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1259, 95, 1, 1, '2019-07-02', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:28:45', 0, '', '2019-07-02 15:28:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1260, 95, 1, 1, '2019-07-02', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:32:42', 0, '', '2019-07-02 15:32:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1261, 95, 1, 1, '2019-07-02', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:35:52', 0, '', '2019-07-02 15:35:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1262, 95, 1, 1, '2019-07-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:38:39', 0, '', '2019-07-02 15:38:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1263, 95, 1, 1, '2019-07-02', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:43:14', 0, '', '2019-07-02 15:43:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1264, 95, 1, 1, '2019-07-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:56:00', 0, '', '2019-07-02 15:56:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1265, 95, 1, 1, '2019-07-02', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:44:59', 0, '', '2019-07-02 16:44:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1266, 95, 1, 1, '2019-07-02', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:32:29', 0, '', '2019-07-02 17:32:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1267, 95, 1, 1, '2019-07-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:55:33', 0, '', '2019-07-02 17:55:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1268, 95, 1, 1, '2019-07-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:08:35', 0, '', '2019-07-02 18:08:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1269, 95, 1, 1, '2019-07-02', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:19:30', 0, '', '2019-07-02 18:19:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1270, 95, 1, 1, '2019-07-02', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:34:43', 0, '', '2019-07-02 18:34:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1271, 95, 1, 1, '2019-07-02', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:38:01', 0, '', '2019-07-02 18:38:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1272, 95, 1, 1, '2019-07-02', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:58:34', 0, '', '2019-07-02 18:58:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1273, 95, 1, 1, '2019-07-02', 0.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:00:18', 0, '', '2019-07-02 19:00:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1274, 95, 1, 1, '2019-07-02', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:00:29', 0, '', '2019-07-02 19:00:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1275, 95, 1, 1, '2019-07-02', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:51:23', 0, '', '2019-07-02 19:51:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1276, 95, 1, 1, '2019-07-02', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:05:33', 0, '', '2019-07-02 20:05:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1277, 95, 1, 1, '2019-07-02', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:07:25', 0, '', '2019-07-02 20:07:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1278, 95, 1, 1, '2019-07-02', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:46:43', 0, '', '2019-07-02 20:46:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1279, 95, 1, 1, '2019-07-02', 38.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:56:49', 0, '', '2019-07-02 20:56:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1280, 97, 1, 1, '2019-07-03', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:47:43', 0, '', '2019-07-03 10:47:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1281, 97, 1, 1, '2019-07-03', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:26:55', 0, '', '2019-07-03 11:26:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1282, 97, 1, 1, '2019-07-03', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:52:33', 0, '', '2019-07-03 11:52:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1283, 97, 1, 1, '2019-07-03', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:04:34', 0, '', '2019-07-03 16:04:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1284, 97, 1, 1, '2019-07-03', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:48:58', 0, '', '2019-07-03 17:48:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1285, 97, 1, 1, '2019-07-03', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:49:08', 0, '', '2019-07-03 17:49:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1286, 97, 1, 1, '2019-07-03', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:33:09', 0, '', '2019-07-03 18:33:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1287, 97, 1, 1, '2019-07-03', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:47:54', 0, '', '2019-07-03 18:47:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1288, 97, 1, 1, '2019-07-03', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:02:16', 0, '', '2019-07-03 19:02:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1289, 97, 1, 1, '2019-07-03', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:52:21', 0, '', '2019-07-03 20:52:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1290, 99, 1, 1, '2019-07-04', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:22:59', 0, '', '2019-07-04 15:22:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1291, 99, 1, 1, '2019-07-04', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:32:22', 0, '', '2019-07-04 15:32:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1292, 99, 1, 1, '2019-07-04', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:22:02', 0, '', '2019-07-04 16:22:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1293, 99, 1, 1, '2019-07-04', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:33:26', 0, '', '2019-07-04 17:33:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1294, 99, 1, 1, '2019-07-04', 24.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:01:23', 0, '', '2019-07-04 19:01:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1295, 99, 1, 1, '2019-07-04', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:01:42', 0, '', '2019-07-04 19:01:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1296, 99, 1, 1, '2019-07-04', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:02:18', 0, '', '2019-07-04 19:02:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1297, 99, 1, 1, '2019-07-04', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:41:07', 0, '', '2019-07-04 20:41:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1298, 99, 1, 1, '2019-07-04', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:44:48', 0, '', '2019-07-04 20:44:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1299, 99, 1, 1, '2019-07-04', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:45:10', 0, '', '2019-07-04 20:45:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1300, 99, 1, 1, '2019-07-04', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:03:59', 0, '', '2019-07-04 21:03:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1301, 103, 1, 1, '2019-07-05', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:36:16', 0, '', '2019-07-05 10:36:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1302, 103, 1, 1, '2019-07-05', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:05:02', 0, '', '2019-07-05 11:05:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1303, 103, 1, 1, '2019-07-05', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:13:01', 0, '', '2019-07-05 11:13:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1304, 103, 1, 1, '2019-07-05', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:13:22', 0, '', '2019-07-05 11:13:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1305, 103, 1, 1, '2019-07-05', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:47:53', 0, '', '2019-07-05 11:47:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1306, 103, 1, 1, '2019-07-05', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:55:38', 0, '', '2019-07-05 11:55:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1307, 103, 1, 1, '2019-07-05', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:02:02', 0, '', '2019-07-05 16:02:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1308, 103, 1, 1, '2019-07-05', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:17:08', 0, '', '2019-07-05 16:17:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1309, 103, 1, 1, '2019-07-05', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:41:34', 0, '', '2019-07-05 16:41:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1310, 103, 1, 1, '2019-07-05', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:45:51', 0, '', '2019-07-05 16:45:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1311, 103, 1, 1, '2019-07-05', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:03:34', 0, '', '2019-07-05 17:03:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1312, 103, 1, 1, '2019-07-05', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:07:19', 0, '', '2019-07-05 17:07:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1313, 103, 1, 1, '2019-07-05', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:03:45', 0, '', '2019-07-05 18:03:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1314, 103, 1, 1, '2019-07-05', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:04:05', 0, '', '2019-07-05 18:04:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1315, 103, 1, 1, '2019-07-05', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:10:39', 0, '', '2019-07-05 18:10:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1316, 103, 1, 1, '2019-07-05', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:16:10', 0, '', '2019-07-05 18:16:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1317, 103, 1, 1, '2019-07-05', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:17:42', 0, '', '2019-07-05 18:17:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1318, 103, 1, 1, '2019-07-05', 27.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:15:33', 0, '', '2019-07-05 20:15:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1319, 105, 1, 1, '2019-07-06', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:03:55', 0, '', '2019-07-06 15:03:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1320, 105, 1, 1, '2019-07-06', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:40:47', 0, '', '2019-07-06 15:40:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1321, 105, 1, 1, '2019-07-06', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:43:44', 0, '', '2019-07-06 16:43:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1322, 107, 1, 1, '2019-07-07', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '14:24:43', 0, '', '2019-07-07 14:24:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1323, 107, 1, 1, '2019-07-07', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:08:56', 0, '', '2019-07-07 18:08:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1324, 107, 1, 1, '2019-07-07', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:31:42', 0, '', '2019-07-07 19:31:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1325, 107, 1, 1, '2019-07-07', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:39:26', 0, '', '2019-07-07 19:39:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1326, 107, 1, 1, '2019-07-07', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:53:50', 0, '', '2019-07-07 20:53:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1327, 107, 1, 1, '2019-07-07', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:54:52', 0, '', '2019-07-07 20:54:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1328, 111, 1, 1, '2019-07-09', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:00:46', 0, '', '2019-07-09 11:00:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1329, 111, 1, 1, '2019-07-09', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:14:36', 0, '', '2019-07-09 11:14:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1330, 111, 1, 1, '2019-07-09', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:42:44', 0, '', '2019-07-09 11:42:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1331, 111, 1, 1, '2019-07-09', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:34:32', 0, '', '2019-07-09 12:34:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1332, 111, 1, 1, '2019-07-09', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:15:18', 0, '', '2019-07-09 15:15:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1333, 111, 1, 1, '2019-07-09', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:43:54', 0, '', '2019-07-09 15:43:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1334, 111, 1, 1, '2019-07-09', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:02:25', 0, '', '2019-07-09 17:02:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1335, 111, 1, 1, '2019-07-09', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:44:23', 0, '', '2019-07-09 17:44:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1336, 111, 1, 1, '2019-07-09', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:51:15', 0, '', '2019-07-09 17:51:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1337, 111, 1, 1, '2019-07-09', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:59:06', 0, '', '2019-07-09 17:59:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1338, 111, 1, 1, '2019-07-09', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:06:12', 0, '', '2019-07-09 18:06:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1339, 111, 1, 1, '2019-07-09', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:22:31', 0, '', '2019-07-09 18:22:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1340, 111, 1, 1, '2019-07-09', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:43:09', 0, '', '2019-07-09 18:43:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1341, 111, 1, 1, '2019-07-09', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:01:27', 0, '', '2019-07-09 20:01:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1342, 113, 1, 1, '2019-07-10', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:32:46', 0, '', '2019-07-10 10:32:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1343, 113, 1, 1, '2019-07-10', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:10:05', 0, '', '2019-07-10 12:10:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1344, 113, 1, 1, '2019-07-10', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:56:18', 0, '', '2019-07-10 15:56:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1345, 113, 1, 1, '2019-07-10', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:57:19', 0, '', '2019-07-10 15:57:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1346, 113, 1, 1, '2019-07-10', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:30:14', 0, '', '2019-07-10 17:30:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1347, 113, 1, 1, '2019-07-10', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:31:57', 0, '', '2019-07-10 18:31:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1348, 113, 1, 1, '2019-07-10', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:47:08', 0, '', '2019-07-10 18:47:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1349, 113, 1, 1, '2019-07-10', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:59:44', 0, '', '2019-07-10 18:59:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1350, 113, 1, 1, '2019-07-10', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:00:14', 0, '', '2019-07-10 20:00:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1351, 113, 1, 1, '2019-07-10', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:00:33', 0, '', '2019-07-10 20:00:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1352, 113, 1, 1, '2019-07-10', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:02:58', 0, '', '2019-07-10 20:02:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1353, 113, 1, 1, '2019-07-10', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:33:56', 0, '', '2019-07-10 20:33:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1354, 115, 1, 1, '2019-07-11', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:23:20', 0, '', '2019-07-11 11:23:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1355, 115, 1, 1, '2019-07-11', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:29:36', 0, '', '2019-07-11 11:29:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1356, 115, 1, 1, '2019-07-11', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:13:03', 0, '', '2019-07-11 16:13:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1357, 115, 1, 1, '2019-07-11', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:13:19', 0, '', '2019-07-11 16:13:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1358, 115, 1, 1, '2019-07-11', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:00:00', 0, '', '2019-07-11 17:00:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1359, 115, 1, 1, '2019-07-11', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:00:21', 0, '', '2019-07-11 17:00:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1360, 115, 1, 1, '2019-07-11', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:46:22', 0, '', '2019-07-11 17:46:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1361, 115, 1, 1, '2019-07-11', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:00:58', 0, '', '2019-07-11 18:00:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1362, 115, 1, 1, '2019-07-11', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:07:18', 0, '', '2019-07-11 18:07:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1363, 115, 1, 1, '2019-07-11', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:08:03', 0, '', '2019-07-11 18:08:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1364, 115, 1, 1, '2019-07-11', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:36:46', 0, '', '2019-07-11 18:36:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1365, 115, 1, 1, '2019-07-11', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:41:27', 0, '', '2019-07-11 18:41:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1366, 115, 1, 1, '2019-07-11', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:54:25', 0, '', '2019-07-11 18:54:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1367, 115, 1, 1, '2019-07-11', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:55:56', 0, '', '2019-07-11 18:55:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1368, 115, 1, 1, '2019-07-11', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:57:28', 0, '', '2019-07-11 18:57:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1369, 115, 1, 1, '2019-07-11', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:22:49', 0, '', '2019-07-11 19:22:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1370, 115, 1, 1, '2019-07-11', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:26:13', 0, '', '2019-07-11 19:26:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1371, 115, 1, 1, '2019-07-11', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:22:08', 0, '', '2019-07-11 20:22:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1372, 115, 1, 1, '2019-07-11', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:29:53', 0, '', '2019-07-11 20:29:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1373, 117, 1, 1, '2019-07-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:10:46', 0, '', '2019-07-12 15:10:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1374, 117, 1, 1, '2019-07-12', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:54:04', 0, '', '2019-07-12 15:54:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1375, 117, 1, 1, '2019-07-12', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:45:17', 0, '', '2019-07-12 16:45:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1376, 117, 1, 1, '2019-07-12', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:10:44', 0, '', '2019-07-12 17:10:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1377, 117, 1, 1, '2019-07-12', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:20:59', 0, '', '2019-07-12 17:20:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1378, 117, 1, 1, '2019-07-12', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:28:57', 0, '', '2019-07-12 18:28:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1379, 117, 1, 1, '2019-07-12', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:36:25', 0, '', '2019-07-12 18:36:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1380, 117, 1, 1, '2019-07-12', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:54:01', 0, '', '2019-07-12 18:54:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1381, 117, 1, 1, '2019-07-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:01:01', 0, '', '2019-07-12 19:01:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1382, 117, 1, 1, '2019-07-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:21:53', 0, '', '2019-07-12 19:21:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1383, 117, 1, 1, '2019-07-12', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:00:08', 0, '', '2019-07-12 20:00:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1384, 117, 1, 1, '2019-07-12', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:12:23', 0, '', '2019-07-12 21:12:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1385, 117, 1, 1, '2019-07-12', 34.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:20:21', 0, '', '2019-07-12 21:20:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1386, 117, 1, 1, '2019-07-12', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:22:25', 0, '', '2019-07-12 21:22:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1387, 117, 1, 1, '2019-07-12', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:32:38', 0, '', '2019-07-12 21:32:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1388, 117, 1, 1, '2019-07-12', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:32:49', 0, '', '2019-07-12 21:32:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1389, 117, 1, 1, '2019-07-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:36:08', 0, '', '2019-07-12 21:36:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1390, 117, 1, 1, '2019-07-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:52:18', 0, '', '2019-07-12 21:52:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1391, 117, 1, 1, '2019-07-12', 21.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:16:18', 0, '', '2019-07-12 22:16:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1392, 117, 1, 1, '2019-07-12', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:33:36', 0, '', '2019-07-12 22:33:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1393, 117, 1, 1, '2019-07-12', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:36:55', 0, '', '2019-07-12 22:36:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1394, 117, 1, 1, '2019-07-12', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:38:21', 0, '', '2019-07-12 22:38:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1395, 119, 1, 1, '2019-07-13', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:33:17', 0, '', '2019-07-13 11:33:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1396, 119, 1, 1, '2019-07-13', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:45:44', 0, '', '2019-07-13 15:45:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1397, 119, 1, 1, '2019-07-13', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:57:50', 0, '', '2019-07-13 15:57:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1398, 119, 1, 1, '2019-07-13', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:35:50', 0, '', '2019-07-13 16:35:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1399, 119, 1, 1, '2019-07-13', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:40:26', 0, '', '2019-07-13 16:40:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1400, 119, 1, 1, '2019-07-13', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:03:50', 0, '', '2019-07-13 17:03:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1401, 119, 1, 1, '2019-07-13', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:07:19', 0, '', '2019-07-13 17:07:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1402, 119, 1, 1, '2019-07-13', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:36:24', 0, '', '2019-07-13 17:36:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1403, 119, 1, 1, '2019-07-13', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:36:40', 0, '', '2019-07-13 17:36:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1404, 119, 1, 1, '2019-07-13', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:35:30', 0, '', '2019-07-13 18:35:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1405, 119, 1, 1, '2019-07-13', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:27:08', 0, '', '2019-07-13 19:27:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1406, 121, 1, 1, '2019-07-14', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:08:01', 0, '', '2019-07-14 11:08:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1407, 121, 1, 1, '2019-07-14', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:08:16', 0, '', '2019-07-14 11:08:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1408, 121, 1, 1, '2019-07-14', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:04:39', 0, '', '2019-07-14 12:04:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1409, 121, 1, 1, '2019-07-14', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:36:25', 0, '', '2019-07-14 12:36:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1410, 121, 1, 1, '2019-07-14', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:56:16', 0, '', '2019-07-14 15:56:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1411, 121, 1, 1, '2019-07-14', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:00:21', 0, '', '2019-07-14 16:00:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1412, 121, 1, 1, '2019-07-14', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:06:30', 0, '', '2019-07-14 16:06:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1413, 121, 1, 1, '2019-07-14', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:13:18', 0, '', '2019-07-14 16:13:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1414, 121, 1, 1, '2019-07-14', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:34:09', 0, '', '2019-07-14 16:34:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1415, 121, 1, 1, '2019-07-14', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:41:26', 0, '', '2019-07-14 16:41:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1416, 121, 1, 1, '2019-07-14', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:58:00', 0, '', '2019-07-14 16:58:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1417, 121, 1, 1, '2019-07-14', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:58:22', 0, '', '2019-07-14 16:58:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1418, 121, 1, 1, '2019-07-14', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:27:51', 0, '', '2019-07-14 17:27:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1419, 121, 1, 1, '2019-07-14', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:41:21', 0, '', '2019-07-14 17:41:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1420, 121, 1, 1, '2019-07-14', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:45:18', 0, '', '2019-07-14 17:45:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1421, 121, 1, 1, '2019-07-14', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:01:32', 0, '', '2019-07-14 18:01:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1422, 121, 1, 1, '2019-07-14', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:20:04', 0, '', '2019-07-14 18:20:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1423, 121, 1, 1, '2019-07-14', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:55:16', 0, '', '2019-07-14 18:55:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1424, 121, 1, 1, '2019-07-14', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:58:15', 0, '', '2019-07-14 18:58:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1425, 121, 1, 1, '2019-07-14', 30.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:32:18', 0, '', '2019-07-14 19:32:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1426, 121, 1, 1, '2019-07-14', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:12:23', 0, '', '2019-07-14 20:12:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1427, 121, 1, 1, '2019-07-14', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:19:30', 0, '', '2019-07-14 20:19:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1428, 121, 1, 1, '2019-07-14', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:28:11', 0, '', '2019-07-14 20:28:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1429, 121, 1, 1, '2019-07-14', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:17:36', 0, '', '2019-07-14 21:17:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1430, 121, 1, 1, '2019-07-14', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:22:50', 0, '', '2019-07-14 21:22:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1431, 121, 1, 1, '2019-07-14', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:53:42', 0, '', '2019-07-14 21:53:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1432, 123, 1, 1, '2019-07-15', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:37:06', 0, '', '2019-07-15 15:37:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1433, 123, 1, 1, '2019-07-15', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:40:14', 0, '', '2019-07-15 15:40:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1434, 123, 1, 1, '2019-07-15', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:18:12', 0, '', '2019-07-15 16:18:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1435, 123, 1, 1, '2019-07-15', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:25:35', 0, '', '2019-07-15 17:25:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1436, 123, 1, 1, '2019-07-15', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:32:58', 0, '', '2019-07-15 18:32:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1437, 123, 1, 1, '2019-07-15', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:34:08', 0, '', '2019-07-15 18:34:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1438, 123, 1, 1, '2019-07-15', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:50:12', 0, '', '2019-07-15 18:50:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1439, 123, 1, 1, '2019-07-15', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:51:59', 0, '', '2019-07-15 18:51:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1440, 123, 1, 1, '2019-07-15', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:24:58', 0, '', '2019-07-15 19:24:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1441, 123, 1, 1, '2019-07-15', 21.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:30:42', 0, '', '2019-07-15 19:30:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1442, 123, 1, 1, '2019-07-15', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:10:17', 0, '', '2019-07-15 20:10:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1443, 123, 1, 1, '2019-07-15', 26.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:08:54', 0, '', '2019-07-15 21:08:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1444, 123, 1, 1, '2019-07-15', 64.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:18:53', 0, '', '2019-07-15 21:18:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1445, 125, 1, 1, '2019-07-16', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:52:36', 0, '', '2019-07-16 11:52:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1446, 125, 1, 1, '2019-07-16', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:16:32', 0, '', '2019-07-16 15:16:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1447, 125, 1, 1, '2019-07-16', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:23:15', 0, '', '2019-07-16 15:23:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1448, 125, 1, 1, '2019-07-16', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:39:26', 0, '', '2019-07-16 15:39:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1449, 125, 1, 1, '2019-07-16', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:43:11', 0, '', '2019-07-16 15:43:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1450, 125, 1, 1, '2019-07-16', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:50:17', 0, '', '2019-07-16 15:50:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1451, 125, 1, 1, '2019-07-16', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:59:10', 0, '', '2019-07-16 15:59:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1452, 125, 1, 1, '2019-07-16', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:10:27', 0, '', '2019-07-16 16:10:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1453, 125, 1, 1, '2019-07-16', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:32:25', 0, '', '2019-07-16 16:32:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1454, 125, 1, 1, '2019-07-16', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:19:15', 0, '', '2019-07-16 17:19:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1455, 125, 1, 1, '2019-07-16', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:00:45', 0, '', '2019-07-16 18:00:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1456, 125, 1, 1, '2019-07-16', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:21:30', 0, '', '2019-07-16 18:21:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1457, 125, 1, 1, '2019-07-16', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:22:25', 0, '', '2019-07-16 18:22:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1458, 125, 1, 1, '2019-07-16', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:22:40', 0, '', '2019-07-16 18:22:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1459, 125, 1, 1, '2019-07-16', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:29:19', 0, '', '2019-07-16 18:29:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1460, 125, 1, 1, '2019-07-16', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:23:32', 0, '', '2019-07-16 20:23:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1461, 127, 1, 1, '2019-07-17', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:27:52', 0, '', '2019-07-17 16:27:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1462, 127, 1, 1, '2019-07-17', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:41:31', 0, '', '2019-07-17 16:41:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1463, 127, 1, 1, '2019-07-17', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:50:41', 0, '', '2019-07-17 16:50:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1464, 127, 1, 1, '2019-07-17', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:58:27', 0, '', '2019-07-17 16:58:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1465, 127, 1, 1, '2019-07-17', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:33:17', 0, '', '2019-07-17 17:33:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1466, 127, 1, 1, '2019-07-17', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:40:51', 0, '', '2019-07-17 17:40:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1467, 127, 1, 1, '2019-07-17', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:07:11', 0, '', '2019-07-17 18:07:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1468, 127, 1, 1, '2019-07-17', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:41:23', 0, '', '2019-07-17 18:41:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1469, 129, 1, 1, '2019-07-18', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:24:53', 0, '', '2019-07-18 10:24:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1470, 129, 1, 1, '2019-07-18', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:36:54', 0, '', '2019-07-18 15:36:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1471, 129, 1, 1, '2019-07-18', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:07:19', 0, '', '2019-07-18 16:07:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1472, 129, 1, 1, '2019-07-18', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:44:41', 0, '', '2019-07-18 16:44:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1473, 129, 1, 1, '2019-07-18', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:46:14', 0, '', '2019-07-18 17:46:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1474, 129, 1, 1, '2019-07-18', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:33:03', 0, '', '2019-07-18 19:33:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1475, 129, 1, 1, '2019-07-18', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:48:18', 0, '', '2019-07-18 20:48:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1476, 131, 1, 1, '2019-07-19', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:09:22', 0, '', '2019-07-19 11:09:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1477, 131, 1, 1, '2019-07-19', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:12:43', 0, '', '2019-07-19 11:12:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1478, 131, 1, 1, '2019-07-19', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '14:49:36', 0, '', '2019-07-19 14:49:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1479, 131, 1, 1, '2019-07-19', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:57:38', 0, '', '2019-07-19 15:57:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1480, 131, 1, 1, '2019-07-19', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:10:47', 0, '', '2019-07-19 16:10:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1481, 131, 1, 1, '2019-07-19', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:13:54', 0, '', '2019-07-19 16:13:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1482, 131, 1, 1, '2019-07-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:15:02', 0, '', '2019-07-19 16:15:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1483, 131, 1, 1, '2019-07-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:30:12', 0, '', '2019-07-19 16:30:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1484, 131, 1, 1, '2019-07-19', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:33:09', 0, '', '2019-07-19 16:33:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1485, 131, 1, 1, '2019-07-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:53:30', 0, '', '2019-07-19 16:53:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1486, 131, 1, 1, '2019-07-19', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:56:11', 0, '', '2019-07-19 16:56:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1487, 131, 1, 1, '2019-07-19', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:27:39', 0, '', '2019-07-19 17:27:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1488, 131, 1, 1, '2019-07-19', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:30:58', 0, '', '2019-07-19 17:30:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1489, 131, 1, 1, '2019-07-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:35:06', 0, '', '2019-07-19 17:35:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1490, 131, 1, 1, '2019-07-19', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:41:06', 0, '', '2019-07-19 17:41:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1491, 131, 1, 1, '2019-07-19', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:44:11', 0, '', '2019-07-19 17:44:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1492, 131, 1, 1, '2019-07-19', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:57:40', 0, '', '2019-07-19 17:57:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1493, 131, 1, 1, '2019-07-19', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:00:03', 0, '', '2019-07-19 18:00:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1494, 131, 1, 1, '2019-07-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:26:37', 0, '', '2019-07-19 18:26:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1495, 131, 1, 1, '2019-07-19', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:33:43', 0, '', '2019-07-19 18:33:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1496, 131, 1, 1, '2019-07-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:43:57', 0, '', '2019-07-19 18:43:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1497, 131, 1, 1, '2019-07-19', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:44:17', 0, '', '2019-07-19 18:44:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1498, 131, 1, 1, '2019-07-19', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:49:31', 0, '', '2019-07-19 18:49:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1499, 131, 1, 1, '2019-07-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:51:06', 0, '', '2019-07-19 18:51:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1500, 131, 1, 1, '2019-07-19', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:10:10', 0, '', '2019-07-19 19:10:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1501, 131, 1, 1, '2019-07-19', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:25:19', 0, '', '2019-07-19 19:25:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1502, 131, 1, 1, '2019-07-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:52:03', 0, '', '2019-07-19 19:52:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1503, 131, 1, 1, '2019-07-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:52:30', 0, '', '2019-07-19 19:52:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1504, 131, 1, 1, '2019-07-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:25:11', 0, '', '2019-07-19 20:25:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1505, 131, 1, 1, '2019-07-19', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:52:51', 0, '', '2019-07-19 20:52:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1506, 131, 1, 1, '2019-07-19', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:37:07', 0, '', '2019-07-19 21:37:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1507, 133, 1, 1, '2019-07-20', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:07:42', 0, '', '2019-07-20 11:07:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1508, 133, 1, 1, '2019-07-20', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:03:11', 0, '', '2019-07-20 12:03:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1509, 133, 1, 1, '2019-07-20', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:12:14', 0, '', '2019-07-20 12:12:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1510, 133, 1, 1, '2019-07-20', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:34:41', 0, '', '2019-07-20 12:34:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1511, 133, 1, 1, '2019-07-20', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:59:03', 0, '', '2019-07-20 12:59:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1512, 133, 1, 1, '2019-07-20', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:17:43', 0, '', '2019-07-20 13:17:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1513, 133, 1, 1, '2019-07-20', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:21:31', 0, '', '2019-07-20 15:21:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1514, 133, 1, 1, '2019-07-20', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:07:13', 0, '', '2019-07-20 16:07:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1515, 133, 1, 1, '2019-07-20', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:12:51', 0, '', '2019-07-20 17:12:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1516, 133, 1, 1, '2019-07-20', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:18:48', 0, '', '2019-07-20 18:18:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1517, 133, 1, 1, '2019-07-20', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:36:22', 0, '', '2019-07-20 18:36:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1518, 133, 1, 1, '2019-07-20', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:08:13', 0, '', '2019-07-20 19:08:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1519, 133, 1, 1, '2019-07-20', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:30:46', 0, '', '2019-07-20 20:30:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1520, 133, 1, 1, '2019-07-20', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:48:46', 0, '', '2019-07-20 20:48:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1521, 133, 1, 1, '2019-07-20', 28.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:32:00', 0, '', '2019-07-20 21:32:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1522, 133, 1, 1, '2019-07-20', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:45:57', 0, '', '2019-07-20 21:45:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1523, 133, 1, 1, '2019-07-20', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:48:04', 0, '', '2019-07-20 21:48:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1524, 135, 1, 1, '2019-07-21', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:56:10', 0, '', '2019-07-21 10:56:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1525, 135, 1, 1, '2019-07-21', 1.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:01:31', 0, '', '2019-07-21 11:01:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1526, 135, 1, 1, '2019-07-21', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:50:40', 0, '', '2019-07-21 12:50:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1527, 135, 1, 1, '2019-07-21', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:52:54', 0, '', '2019-07-21 12:52:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1528, 135, 1, 1, '2019-07-21', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:18:14', 0, '', '2019-07-21 15:18:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1529, 135, 1, 1, '2019-07-21', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:31:58', 0, '', '2019-07-21 15:31:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1530, 135, 1, 1, '2019-07-21', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:09:50', 0, '', '2019-07-21 16:09:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1531, 135, 1, 1, '2019-07-21', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:11:00', 0, '', '2019-07-21 16:11:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1532, 137, 1, 1, '2019-07-28', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:58:59', 0, '', '2019-07-28 10:58:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1533, 137, 1, 1, '2019-07-28', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:47:49', 0, '', '2019-07-28 11:47:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1534, 137, 1, 1, '2019-07-28', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:48:44', 0, '', '2019-07-28 11:48:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1535, 137, 1, 1, '2019-07-28', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:26:16', 0, '', '2019-07-28 16:26:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1536, 137, 1, 1, '2019-07-28', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:26:32', 0, '', '2019-07-28 16:26:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1537, 137, 1, 1, '2019-07-28', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:45:18', 0, '', '2019-07-28 16:45:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1538, 137, 1, 1, '2019-07-28', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:01:45', 0, '', '2019-07-28 17:01:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1539, 137, 1, 1, '2019-07-28', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:46:00', 0, '', '2019-07-28 17:46:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1540, 137, 1, 1, '2019-07-28', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:47:42', 0, '', '2019-07-28 17:47:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1541, 137, 1, 1, '2019-07-28', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:48:27', 0, '', '2019-07-28 17:48:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1542, 137, 1, 1, '2019-07-28', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:59:35', 0, '', '2019-07-28 17:59:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1543, 137, 1, 1, '2019-07-28', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:02:48', 0, '', '2019-07-28 18:02:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1544, 137, 1, 1, '2019-07-28', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:03:06', 0, '', '2019-07-28 18:03:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1545, 137, 1, 1, '2019-07-28', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:10:18', 0, '', '2019-07-28 18:10:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1546, 137, 1, 1, '2019-07-28', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:14:13', 0, '', '2019-07-28 18:14:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1547, 137, 1, 1, '2019-07-28', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:16:05', 0, '', '2019-07-28 18:16:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1548, 137, 1, 1, '2019-07-28', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:16:44', 0, '', '2019-07-28 18:16:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1549, 137, 1, 1, '2019-07-28', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:33:38', 0, '', '2019-07-28 18:33:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1550, 137, 1, 1, '2019-07-28', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:37:27', 0, '', '2019-07-28 18:37:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1551, 137, 1, 1, '2019-07-28', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:39:31', 0, '', '2019-07-28 18:39:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1552, 137, 1, 1, '2019-07-28', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:05:40', 0, '', '2019-07-28 19:05:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1553, 137, 1, 1, '2019-07-28', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:06:22', 0, '', '2019-07-28 19:06:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1554, 137, 1, 1, '2019-07-28', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:17:19', 0, '', '2019-07-28 19:17:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1555, 137, 1, 1, '2019-07-28', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:23:59', 0, '', '2019-07-28 19:23:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1556, 137, 1, 1, '2019-07-28', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:24:24', 0, '', '2019-07-28 19:24:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1557, 137, 1, 1, '2019-07-28', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:28:35', 0, '', '2019-07-28 19:28:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1558, 137, 1, 1, '2019-07-28', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:42:09', 0, '', '2019-07-28 19:42:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1559, 137, 1, 1, '2019-07-28', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:43:31', 0, '', '2019-07-28 19:43:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1560, 137, 1, 1, '2019-07-28', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:47:53', 0, '', '2019-07-28 19:47:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1561, 137, 1, 1, '2019-07-28', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:12:34', 0, '', '2019-07-28 20:12:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1562, 137, 1, 1, '2019-07-28', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:37:47', 0, '', '2019-07-28 20:37:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1563, 137, 1, 1, '2019-07-28', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:48:09', 0, '', '2019-07-28 20:48:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1564, 137, 1, 1, '2019-07-28', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:49:50', 0, '', '2019-07-28 20:49:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1565, 137, 1, 1, '2019-07-28', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:55:52', 0, '', '2019-07-28 20:55:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1566, 137, 1, 1, '2019-07-28', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:20:54', 0, '', '2019-07-28 21:20:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1567, 139, 1, 1, '2019-07-29', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:33:03', 0, '', '2019-07-29 10:33:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1568, 139, 1, 1, '2019-07-29', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:04:21', 0, '', '2019-07-29 11:04:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1569, 139, 1, 1, '2019-07-29', 23.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:58:21', 0, '', '2019-07-29 11:58:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1570, 139, 1, 1, '2019-07-29', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:48:50', 0, '', '2019-07-29 15:48:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1571, 139, 1, 1, '2019-07-29', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:09:53', 0, '', '2019-07-29 16:09:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1572, 139, 1, 1, '2019-07-29', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:30:46', 0, '', '2019-07-29 16:30:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1573, 139, 1, 1, '2019-07-29', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:31:41', 0, '', '2019-07-29 16:31:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1574, 139, 1, 1, '2019-07-29', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:47:29', 0, '', '2019-07-29 16:47:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1575, 139, 1, 1, '2019-07-29', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:10:12', 0, '', '2019-07-29 17:10:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1576, 139, 1, 1, '2019-07-29', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:11:44', 0, '', '2019-07-29 17:11:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1577, 139, 1, 1, '2019-07-29', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:13:39', 0, '', '2019-07-29 17:13:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1578, 139, 1, 1, '2019-07-29', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:21:07', 0, '', '2019-07-29 17:21:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1579, 139, 1, 1, '2019-07-29', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:36:06', 0, '', '2019-07-29 17:36:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1580, 139, 1, 1, '2019-07-29', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:55:46', 0, '', '2019-07-29 17:55:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1581, 139, 1, 1, '2019-07-29', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:58:20', 0, '', '2019-07-29 17:58:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1582, 139, 1, 1, '2019-07-29', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:01:22', 0, '', '2019-07-29 18:01:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1583, 139, 1, 1, '2019-07-29', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:05:06', 0, '', '2019-07-29 18:05:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1584, 139, 1, 1, '2019-07-29', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:05:51', 0, '', '2019-07-29 18:05:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1585, 139, 1, 1, '2019-07-29', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:13:28', 0, '', '2019-07-29 18:13:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1586, 139, 1, 1, '2019-07-29', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:14:21', 0, '', '2019-07-29 18:14:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1587, 139, 1, 1, '2019-07-29', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:32:32', 0, '', '2019-07-29 18:32:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1588, 139, 1, 1, '2019-07-29', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:24:04', 0, '', '2019-07-29 19:24:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1589, 139, 1, 1, '2019-07-29', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:49:14', 0, '', '2019-07-29 19:49:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1590, 139, 1, 1, '2019-07-29', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:52:15', 0, '', '2019-07-29 19:52:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1591, 139, 1, 1, '2019-07-29', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:17:26', 0, '', '2019-07-29 20:17:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1592, 139, 1, 1, '2019-07-29', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:24:35', 0, '', '2019-07-29 20:24:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1593, 139, 1, 1, '2019-07-29', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:10:18', 0, '', '2019-07-29 21:10:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1594, 139, 1, 1, '2019-07-29', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:16:42', 0, '', '2019-07-29 21:16:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1595, 139, 1, 1, '2019-07-29', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:37:39', 0, '', '2019-07-29 21:37:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1596, 139, 1, 1, '2019-07-29', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:41:06', 0, '', '2019-07-29 21:41:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1597, 139, 1, 1, '2019-07-29', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:48:14', 0, '', '2019-07-29 21:48:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1598, 139, 1, 1, '2019-07-29', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:05:12', 0, '', '2019-07-29 22:05:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1599, 139, 1, 1, '2019-07-29', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:06:19', 0, '', '2019-07-29 22:06:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1600, 141, 1, 1, '2019-07-30', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:24:24', 0, '', '2019-07-30 10:24:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1601, 141, 1, 1, '2019-07-30', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:43:22', 0, '', '2019-07-30 10:43:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1602, 141, 1, 1, '2019-07-30', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:51:16', 0, '', '2019-07-30 10:51:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1603, 141, 1, 1, '2019-07-30', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:04:06', 0, '', '2019-07-30 11:04:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1604, 141, 1, 1, '2019-07-30', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:47:57', 0, '', '2019-07-30 12:47:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1605, 141, 1, 1, '2019-07-30', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:10:22', 0, '', '2019-07-30 16:10:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1606, 141, 1, 1, '2019-07-30', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:11:20', 0, '', '2019-07-30 16:11:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1607, 141, 1, 1, '2019-07-30', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:16:22', 0, '', '2019-07-30 16:16:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1608, 141, 1, 1, '2019-07-30', 31.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:18:14', 0, '', '2019-07-30 16:18:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1609, 141, 1, 1, '2019-07-30', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:03:10', 0, '', '2019-07-30 17:03:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1610, 141, 1, 1, '2019-07-30', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:07:04', 0, '', '2019-07-30 17:07:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1611, 141, 1, 1, '2019-07-30', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:11:33', 0, '', '2019-07-30 17:11:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1612, 141, 1, 1, '2019-07-30', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:12:42', 0, '', '2019-07-30 17:12:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1613, 141, 1, 1, '2019-07-30', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:17:08', 0, '', '2019-07-30 17:17:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1614, 141, 1, 1, '2019-07-30', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:21:32', 0, '', '2019-07-30 17:21:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1615, 141, 1, 1, '2019-07-30', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:07:33', 2, '001-1', '2019-07-30 18:07:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1616, 141, 1, 1, '2019-07-30', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:14:24', 2, '001-2', '2019-07-30 18:14:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1617, 141, 1, 1, '2019-07-30', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:14:39', 2, '001-3', '2019-07-30 18:14:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1618, 141, 1, 1, '2019-07-30', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:30:29', 0, '', '2019-07-30 18:30:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1619, 141, 1, 1, '2019-07-30', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:42:33', 0, '', '2019-07-30 18:42:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1620, 141, 1, 1, '2019-07-30', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:29:12', 0, '', '2019-07-30 19:29:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1621, 141, 1, 1, '2019-07-30', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:16:48', 0, '', '2019-07-30 20:16:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1622, 141, 1, 1, '2019-07-30', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:29:47', 0, '', '2019-07-30 20:29:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1623, 141, 1, 1, '2019-07-30', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:52:08', 0, '', '2019-07-30 20:52:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1624, 143, 1, 1, '2019-07-31', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:32:26', 0, '', '2019-07-31 10:32:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1625, 143, 1, 1, '2019-07-31', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:35:22', 0, '', '2019-07-31 10:35:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1626, 143, 1, 1, '2019-07-31', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:43:16', 0, '', '2019-07-31 15:43:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1627, 143, 1, 1, '2019-07-31', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:45:03', 0, '', '2019-07-31 15:45:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1628, 143, 1, 1, '2019-07-31', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:45:24', 0, '', '2019-07-31 15:45:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1629, 143, 1, 1, '2019-07-31', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:02:24', 0, '', '2019-07-31 16:02:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1630, 143, 1, 1, '2019-07-31', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:02:48', 0, '', '2019-07-31 16:02:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1631, 143, 1, 1, '2019-07-31', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:08:33', 0, '', '2019-07-31 16:08:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1632, 143, 1, 1, '2019-07-31', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:27:07', 0, '', '2019-07-31 16:27:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1633, 143, 1, 1, '2019-07-31', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:27:42', 0, '', '2019-07-31 16:27:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1634, 143, 1, 1, '2019-07-31', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:59:26', 0, '', '2019-07-31 16:59:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1635, 143, 1, 1, '2019-07-31', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:59:53', 0, '', '2019-07-31 16:59:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1636, 143, 1, 1, '2019-07-31', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:30:17', 0, '', '2019-07-31 17:30:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1637, 143, 1, 1, '2019-07-31', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:47:40', 0, '', '2019-07-31 17:47:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1638, 143, 1, 1, '2019-07-31', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:48:03', 0, '', '2019-07-31 17:48:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1639, 143, 1, 1, '2019-07-31', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:58:22', 0, '', '2019-07-31 17:58:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1640, 143, 1, 1, '2019-07-31', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:59:06', 0, '', '2019-07-31 17:59:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1641, 143, 1, 1, '2019-07-31', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:35:23', 0, '', '2019-07-31 18:35:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1642, 143, 1, 1, '2019-07-31', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:35:41', 0, '', '2019-07-31 18:35:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1643, 143, 1, 1, '2019-07-31', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:52:26', 0, '', '2019-07-31 18:52:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1644, 143, 1, 1, '2019-07-31', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:52:38', 0, '', '2019-07-31 18:52:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1645, 143, 1, 1, '2019-07-31', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:53:05', 0, '', '2019-07-31 18:53:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1646, 143, 1, 1, '2019-07-31', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:53:26', 0, '', '2019-07-31 18:53:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1647, 143, 1, 1, '2019-07-31', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:35:11', 0, '', '2019-07-31 20:35:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1648, 145, 1, 1, '2019-08-01', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:34:55', 2, '001-4', '2019-08-01 11:34:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1649, 145, 1, 1, '2019-08-01', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:05:21', 0, '', '2019-08-01 12:05:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1650, 145, 1, 1, '2019-08-01', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:05:41', 0, '', '2019-08-01 12:05:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1651, 145, 1, 1, '2019-08-01', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:06:12', 0, '', '2019-08-01 12:06:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1652, 145, 1, 1, '2019-08-01', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:08:41', 0, '', '2019-08-01 12:08:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1653, 145, 1, 1, '2019-08-01', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:29:11', 0, '', '2019-08-01 15:29:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1654, 145, 1, 1, '2019-08-01', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:29:34', 0, '', '2019-08-01 15:29:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1655, 145, 1, 1, '2019-08-01', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:34:55', 0, '', '2019-08-01 16:34:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1656, 145, 1, 1, '2019-08-01', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:36:58', 0, '', '2019-08-01 16:36:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1657, 145, 1, 1, '2019-08-01', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:08:10', 0, '', '2019-08-01 17:08:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1658, 145, 1, 1, '2019-08-01', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:34:37', 0, '', '2019-08-01 17:34:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1659, 145, 1, 1, '2019-08-01', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:46:30', 0, '', '2019-08-01 17:46:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1660, 145, 1, 1, '2019-08-01', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:47:19', 0, '', '2019-08-01 17:47:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1661, 145, 1, 1, '2019-08-01', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:53:07', 0, '', '2019-08-01 17:53:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1662, 145, 1, 1, '2019-08-01', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:54:28', 0, '', '2019-08-01 17:54:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1663, 145, 1, 1, '2019-08-01', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:00:20', 0, '', '2019-08-01 18:00:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1664, 145, 1, 1, '2019-08-01', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:24:38', 0, '', '2019-08-01 18:24:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1665, 145, 1, 1, '2019-08-01', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:30:53', 0, '', '2019-08-01 18:30:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1666, 145, 1, 1, '2019-08-01', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:00:42', 0, '', '2019-08-01 19:00:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1667, 145, 1, 1, '2019-08-01', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:02:42', 0, '', '2019-08-01 19:02:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1668, 145, 1, 1, '2019-08-01', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:28:13', 0, '', '2019-08-01 19:28:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1669, 145, 1, 1, '2019-08-01', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:40:48', 0, '', '2019-08-01 20:40:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1670, 145, 1, 1, '2019-08-01', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:43:00', 0, '', '2019-08-01 20:43:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1671, 145, 1, 1, '2019-08-01', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:14:41', 0, '', '2019-08-01 21:14:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1672, 145, 1, 1, '2019-08-01', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:28:02', 0, '', '2019-08-01 21:28:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1673, 145, 1, 1, '2019-08-01', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:30:40', 0, '', '2019-08-01 21:30:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1674, 145, 1, 1, '2019-08-01', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:32:37', 0, '', '2019-08-01 21:32:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1675, 147, 1, 1, '2019-08-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:31:02', 0, '', '2019-08-02 11:31:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1676, 147, 1, 1, '2019-08-02', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:21:38', 0, '', '2019-08-02 12:21:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1677, 147, 1, 1, '2019-08-02', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:22:05', 0, '', '2019-08-02 12:22:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1678, 147, 1, 1, '2019-08-02', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:42:55', 0, '', '2019-08-02 15:42:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1679, 147, 1, 1, '2019-08-02', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:43:32', 0, '', '2019-08-02 15:43:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1680, 147, 1, 1, '2019-08-02', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:44:17', 0, '', '2019-08-02 15:44:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1681, 147, 1, 1, '2019-08-02', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:44:48', 0, '', '2019-08-02 15:44:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1682, 147, 1, 1, '2019-08-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:21:56', 0, '', '2019-08-02 16:21:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1683, 147, 1, 1, '2019-08-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:55:19', 0, '', '2019-08-02 16:55:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1684, 147, 1, 1, '2019-08-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:01:34', 0, '', '2019-08-02 17:01:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1685, 147, 1, 1, '2019-08-02', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:07:39', 0, '', '2019-08-02 17:07:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1686, 147, 1, 1, '2019-08-02', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:14:12', 0, '', '2019-08-02 17:14:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1687, 147, 1, 1, '2019-08-02', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:30:48', 0, '', '2019-08-02 17:30:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1688, 147, 1, 1, '2019-08-02', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:29:51', 0, '', '2019-08-02 18:29:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1689, 147, 1, 1, '2019-08-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:50:05', 0, '', '2019-08-02 18:50:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1690, 147, 1, 1, '2019-08-02', 27.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:54:31', 0, '', '2019-08-02 18:54:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1691, 147, 1, 1, '2019-08-02', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:01:11', 0, '', '2019-08-02 19:01:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1692, 147, 1, 1, '2019-08-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:26:29', 0, '', '2019-08-02 20:26:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1693, 147, 1, 1, '2019-08-02', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:29:56', 0, '', '2019-08-02 20:29:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1694, 147, 1, 1, '2019-08-02', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:08:46', 0, '', '2019-08-02 21:08:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1695, 147, 1, 1, '2019-08-02', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:09:20', 0, '', '2019-08-02 21:09:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1696, 147, 1, 1, '2019-08-02', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:21:48', 0, '', '2019-08-02 21:21:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1697, 147, 1, 1, '2019-08-02', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:27:38', 0, '', '2019-08-02 21:27:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1698, 147, 1, 1, '2019-08-02', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:26:10', 0, '', '2019-08-02 22:26:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1699, 147, 1, 1, '2019-08-02', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '23:04:34', 0, '', '2019-08-02 23:04:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1700, 147, 1, 1, '2019-08-02', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '23:05:21', 0, '', '2019-08-02 23:05:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1701, 149, 1, 1, '2019-08-03', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:17:08', 0, '', '2019-08-03 11:17:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1702, 149, 1, 1, '2019-08-03', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:12:20', 0, '', '2019-08-03 12:12:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1703, 149, 1, 1, '2019-08-03', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:26:15', 0, '', '2019-08-03 12:26:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1704, 149, 1, 1, '2019-08-03', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:28:22', 0, '', '2019-08-03 12:28:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1705, 149, 1, 1, '2019-08-03', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:29:32', 0, '', '2019-08-03 12:29:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1706, 149, 1, 1, '2019-08-03', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:52:36', 0, '', '2019-08-03 16:52:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1707, 149, 1, 1, '2019-08-03', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:57:52', 0, '', '2019-08-03 16:57:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1708, 149, 1, 1, '2019-08-03', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:19:11', 0, '', '2019-08-03 17:19:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1709, 149, 1, 1, '2019-08-03', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:22:51', 0, '', '2019-08-03 17:22:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1710, 149, 1, 1, '2019-08-03', 21.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:29:25', 0, '', '2019-08-03 17:29:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1711, 149, 1, 1, '2019-08-03', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:09:55', 0, '', '2019-08-03 18:09:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1712, 149, 1, 1, '2019-08-03', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:35:56', 0, '', '2019-08-03 18:35:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1713, 149, 1, 1, '2019-08-03', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:23:18', 0, '', '2019-08-03 19:23:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1714, 149, 1, 1, '2019-08-03', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:27:25', 0, '', '2019-08-03 19:27:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1715, 149, 1, 1, '2019-08-03', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:05:32', 0, '', '2019-08-03 20:05:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1716, 149, 1, 1, '2019-08-03', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:43:38', 0, '', '2019-08-03 20:43:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1717, 149, 1, 1, '2019-08-03', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:29:25', 0, '', '2019-08-03 21:29:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1718, 151, 1, 1, '2019-08-06', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:39:10', 0, '', '2019-08-06 15:39:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1719, 153, 1, 1, '2019-08-07', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:07:10', 0, '', '2019-08-07 18:07:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1720, 153, 1, 1, '2019-08-07', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:11:39', 0, '', '2019-08-07 18:11:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1721, 153, 1, 1, '2019-08-07', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:17:55', 0, '', '2019-08-07 18:17:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1722, 155, 1, 1, '2019-08-16', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:15:26', 2, '001-5', '2019-08-16 11:15:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1723, 157, 1, 1, '2019-08-16', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:21:52', 2, '001-6', '2019-08-16 11:21:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1724, 157, 1, 1, '2019-08-16', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:22:40', 2, '001-7', '2019-08-16 11:22:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1725, 157, 1, 1, '2019-08-16', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:50:49', 2, '001-8', '2019-08-16 11:50:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1726, 157, 1, 1, '2019-08-16', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:42:31', 2, '001-9', '2019-08-16 12:42:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1727, 157, 1, 1, '2019-08-16', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:12:50', 2, '001-10', '2019-08-16 13:12:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1728, 157, 1, 1, '2019-08-16', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:31:14', 2, '001-11', '2019-08-16 16:31:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1729, 157, 1, 1, '2019-08-16', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:47:09', 0, '', '2019-08-16 16:47:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1730, 157, 1, 3, '2019-08-16', 6.00, 1, 'jerson esta bien pendejo V: ', '16:59:11', 0, '', '2019-08-16 16:59:11', NULL, NULL, NULL, 3.39, 1);
INSERT INTO `movimiento` VALUES (1731, 157, 1, 1, '2019-08-16', 32.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:08:33', 0, '', '2019-08-16 17:08:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1732, 157, 1, 1, '2019-08-16', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:14:42', 0, '', '2019-08-16 17:14:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1733, 157, 1, 1, '2019-08-16', 1.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:17:36', 0, '', '2019-08-16 17:17:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1734, 157, 1, 1, '2019-08-16', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:37:25', 0, '', '2019-08-16 17:37:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1735, 157, 1, 1, '2019-08-16', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:42:55', 0, '', '2019-08-16 17:42:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1736, 157, 1, 1, '2019-08-16', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:38:30', 0, '', '2019-08-16 18:38:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1737, 157, 1, 1, '2019-08-16', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:01:32', 0, '', '2019-08-16 19:01:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1738, 157, 1, 1, '2019-08-16', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:17:43', 0, '', '2019-08-16 19:17:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1739, 157, 1, 1, '2019-08-16', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:25:01', 0, '', '2019-08-16 19:25:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1740, 157, 1, 1, '2019-08-16', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:42:23', 0, '', '2019-08-16 19:42:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1741, 157, 1, 1, '2019-08-16', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:15:05', 0, '', '2019-08-16 20:15:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1742, 157, 1, 1, '2019-08-16', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:17:56', 0, '', '2019-08-16 20:17:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1743, 157, 1, 1, '2019-08-16', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:55:22', 0, '', '2019-08-16 20:55:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1744, 157, 1, 1, '2019-08-16', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:10:45', 0, '', '2019-08-16 21:10:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1745, 157, 1, 1, '2019-08-16', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:31:04', 2, '001-12', '2019-08-16 21:31:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1746, 157, 1, 1, '2019-08-16', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:32:28', 2, '001-13', '2019-08-16 21:32:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1747, 157, 1, 1, '2019-08-16', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:33:17', 2, '001-14', '2019-08-16 21:33:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1748, 157, 1, 1, '2019-08-16', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:38:32', 2, '001-15', '2019-08-16 21:38:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1749, 157, 1, 1, '2019-08-16', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:39:13', 2, '001-16', '2019-08-16 21:39:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1750, 157, 1, 1, '2019-08-16', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:48:59', 2, '001-17', '2019-08-16 21:48:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1751, 157, 1, 1, '2019-08-16', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:50:17', 2, '001-18', '2019-08-16 21:50:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1752, 159, 1, 1, '2019-08-17', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:37:53', 0, '', '2019-08-17 11:37:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1753, 159, 1, 1, '2019-08-17', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:54:41', 0, '', '2019-08-17 11:54:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1754, 159, 1, 1, '2019-08-17', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:19:58', 0, '', '2019-08-17 12:19:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1755, 159, 1, 1, '2019-08-17', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:25:32', 2, '001-19', '2019-08-17 12:25:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1756, 159, 1, 1, '2019-08-17', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:34:05', 2, '001-20', '2019-08-17 12:34:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1757, 159, 1, 1, '2019-08-17', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:59:07', 2, '001-21', '2019-08-17 12:59:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1758, 159, 1, 1, '2019-08-17', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:16:56', 2, '001-22', '2019-08-17 16:16:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1759, 159, 1, 1, '2019-08-17', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:42:55', 2, '001-23', '2019-08-17 16:42:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1760, 159, 1, 1, '2019-08-17', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:49:59', 2, '001-24', '2019-08-17 16:49:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1761, 159, 1, 1, '2019-08-17', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:55:26', 2, '001-25', '2019-08-17 16:55:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1762, 159, 1, 1, '2019-08-17', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:05:41', 2, '001-26', '2019-08-17 17:05:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1763, 159, 1, 1, '2019-08-17', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:15:46', 0, '', '2019-08-17 17:15:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1764, 159, 1, 1, '2019-08-17', 27.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:31:18', 2, '001-27', '2019-08-17 17:31:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1765, 159, 1, 1, '2019-08-17', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:55:38', 2, '001-28', '2019-08-17 17:55:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1766, 159, 1, 1, '2019-08-17', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:56:15', 2, '001-29', '2019-08-17 18:56:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1767, 159, 1, 1, '2019-08-17', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:00:22', 2, '001-30', '2019-08-17 20:00:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1768, 159, 1, 1, '2019-08-17', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:00:56', 2, '001-31', '2019-08-17 20:00:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1769, 159, 1, 1, '2019-08-17', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:43:10', 2, '001-32', '2019-08-17 20:43:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1770, 159, 1, 1, '2019-08-17', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:29:44', 2, '001-33', '2019-08-17 21:29:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1771, 159, 1, 1, '2019-08-17', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:39:39', 2, '001-34', '2019-08-17 21:39:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1772, 161, 1, 1, '2019-08-18', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:56:10', 2, '001-35', '2019-08-18 10:56:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1773, 161, 1, 1, '2019-08-18', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:52:08', 2, '001-36', '2019-08-18 11:52:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1774, 161, 1, 1, '2019-08-18', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:52:48', 2, '001-37', '2019-08-18 11:52:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1775, 161, 1, 1, '2019-08-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:05:12', 2, '001-38', '2019-08-18 12:05:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1776, 161, 1, 1, '2019-08-18', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:10:11', 2, '001-39', '2019-08-18 12:10:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1777, 161, 1, 1, '2019-08-18', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:12:36', 2, '001-40', '2019-08-18 12:12:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1778, 161, 1, 1, '2019-08-18', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:15:32', 2, '001-41', '2019-08-18 12:15:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1779, 161, 1, 1, '2019-08-18', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:19:24', 2, '001-42', '2019-08-18 12:19:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1780, 161, 1, 1, '2019-08-18', 60.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:32:19', 2, '001-43', '2019-08-18 15:32:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1781, 161, 1, 1, '2019-08-18', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:55:22', 2, '001-44', '2019-08-18 15:55:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1782, 161, 1, 1, '2019-08-18', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:56:21', 2, '001-45', '2019-08-18 15:56:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1783, 161, 1, 1, '2019-08-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:40:59', 2, '001-46', '2019-08-18 16:40:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1784, 161, 1, 1, '2019-08-18', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:57:36', 2, '001-47', '2019-08-18 16:57:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1785, 161, 1, 1, '2019-08-18', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:11:02', 2, '001-48', '2019-08-18 17:11:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1786, 161, 1, 1, '2019-08-18', 30.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:29:02', 2, '001-49', '2019-08-18 17:29:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1787, 161, 1, 1, '2019-08-18', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:29:31', 2, '001-50', '2019-08-18 17:29:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1788, 161, 1, 1, '2019-08-18', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:48:34', 2, '001-51', '2019-08-18 17:48:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1789, 161, 1, 1, '2019-08-18', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:17:25', 2, '001-52', '2019-08-18 18:17:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1790, 161, 1, 1, '2019-08-18', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:02:45', 2, '001-53', '2019-08-18 19:02:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1791, 161, 1, 1, '2019-08-18', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:06:00', 2, '001-54', '2019-08-18 19:06:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1792, 161, 1, 1, '2019-08-18', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:13:27', 2, '001-55', '2019-08-18 19:13:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1793, 161, 1, 1, '2019-08-18', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:15:49', 2, '001-56', '2019-08-18 19:15:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1794, 161, 1, 1, '2019-08-18', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:17:45', 2, '001-57', '2019-08-18 19:17:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1795, 161, 1, 1, '2019-08-18', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:35:37', 2, '001-58', '2019-08-18 19:35:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1796, 161, 1, 1, '2019-08-18', 1.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:52:08', 2, '001-59', '2019-08-18 19:52:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1797, 161, 1, 1, '2019-08-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:00:47', 2, '001-60', '2019-08-18 20:00:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1798, 161, 1, 1, '2019-08-18', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:10:34', 2, '001-61', '2019-08-18 20:10:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1799, 161, 1, 1, '2019-08-18', 31.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:26:02', 2, '001-62', '2019-08-18 20:26:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1800, 161, 1, 1, '2019-08-18', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:40:14', 2, '001-63', '2019-08-18 20:40:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1801, 161, 1, 1, '2019-08-18', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:58:00', 2, '001-64', '2019-08-18 20:58:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1802, 161, 1, 1, '2019-08-18', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:09:41', 2, '001-65', '2019-08-18 21:09:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1803, 161, 1, 1, '2019-08-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:43:07', 2, '001-66', '2019-08-18 21:43:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1804, 161, 1, 1, '2019-08-18', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:52:39', 2, '001-67', '2019-08-18 21:52:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1805, 163, 1, 1, '2019-08-19', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:49:56', 2, '001-68', '2019-08-19 11:49:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1806, 163, 1, 1, '2019-08-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:51:00', 2, '001-69', '2019-08-19 11:51:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1807, 163, 1, 1, '2019-08-19', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:59:41', 0, '', '2019-08-19 11:59:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1808, 165, 1, 1, '2019-08-21', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:52:34', 0, '', '2019-08-21 10:52:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1809, 165, 1, 1, '2019-08-21', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:42:23', 0, '', '2019-08-21 11:42:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1810, 165, 1, 1, '2019-08-22', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:38:55', 0, '', '2019-08-22 11:38:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1811, 165, 1, 1, '2019-08-22', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:03:32', 0, '', '2019-08-22 12:03:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1812, 165, 1, 1, '2019-08-22', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:56:03', 0, '', '2019-08-22 12:56:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1813, 167, 1, 1, '2019-08-24', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:06:17', 0, '', '2019-08-24 10:06:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1814, 167, 1, 1, '2019-08-24', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:25:50', 0, '', '2019-08-24 10:25:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1815, 167, 1, 1, '2019-08-24', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:01:11', 2, '001-70', '2019-08-24 11:01:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1816, 167, 1, 1, '2019-08-24', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:12:14', 0, '', '2019-08-24 13:12:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1817, 167, 1, 1, '2019-08-24', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:21:58', 0, '', '2019-08-24 15:21:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1818, 167, 1, 1, '2019-08-24', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:57:33', 0, '', '2019-08-24 15:57:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1819, 167, 1, 1, '2019-08-24', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:11:30', 2, '001-71', '2019-08-24 16:11:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1820, 167, 1, 1, '2019-08-24', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:39:48', 0, '', '2019-08-24 16:39:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1821, 167, 1, 1, '2019-08-24', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:22:00', 0, '', '2019-08-24 17:22:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1822, 167, 1, 1, '2019-08-24', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:01:15', 0, '', '2019-08-24 18:01:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1823, 167, 1, 1, '2019-08-24', 8.50, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:21:35', 2, '001-72', '2019-08-24 20:21:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1824, 167, 1, 1, '2019-08-24', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:49:42', 0, '', '2019-08-24 20:49:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1825, 167, 1, 1, '2019-08-24', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:08:18', 0, '', '2019-08-24 21:08:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1826, 169, 1, 1, '2019-08-25', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:38:34', 0, '', '2019-08-25 10:38:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1827, 169, 1, 1, '2019-08-25', 23.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:29:35', 0, '', '2019-08-25 11:29:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1828, 169, 1, 1, '2019-08-25', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:32:59', 0, '', '2019-08-25 11:32:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1829, 169, 1, 1, '2019-08-25', 21.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:49:02', 0, '', '2019-08-25 12:49:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1830, 169, 1, 1, '2019-08-25', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:50:09', 0, '', '2019-08-25 12:50:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1831, 169, 1, 1, '2019-08-25', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:50:31', 0, '', '2019-08-25 12:50:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1832, 169, 1, 1, '2019-08-25', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:22:59', 0, '', '2019-08-25 15:22:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1833, 169, 1, 1, '2019-08-25', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:11:53', 0, '', '2019-08-25 16:11:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1834, 169, 1, 1, '2019-08-25', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:43:36', 0, '', '2019-08-25 16:43:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1835, 169, 1, 1, '2019-08-25', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:51:42', 0, '', '2019-08-25 16:51:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1836, 169, 1, 1, '2019-08-25', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:09:25', 0, '', '2019-08-25 17:09:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1837, 169, 1, 1, '2019-08-25', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:09:57', 0, '', '2019-08-25 17:09:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1838, 169, 1, 1, '2019-08-25', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:13:12', 0, '', '2019-08-25 17:13:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1839, 169, 1, 1, '2019-08-25', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:21:18', 0, '', '2019-08-25 17:21:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1840, 169, 1, 1, '2019-08-25', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:28:21', 0, '', '2019-08-25 17:28:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1841, 169, 1, 1, '2019-08-25', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:02:50', 0, '', '2019-08-25 18:02:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1842, 169, 1, 1, '2019-08-25', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:19:09', 0, '', '2019-08-25 18:19:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1843, 169, 1, 1, '2019-08-25', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:32:05', 0, '', '2019-08-25 18:32:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1844, 169, 1, 1, '2019-08-25', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:47:27', 0, '', '2019-08-25 18:47:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1845, 169, 1, 1, '2019-08-25', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:48:41', 0, '', '2019-08-25 18:48:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1846, 169, 1, 1, '2019-08-25', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:06:43', 0, '', '2019-08-25 19:06:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1847, 169, 1, 1, '2019-08-25', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:07:40', 0, '', '2019-08-25 20:07:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1848, 169, 1, 1, '2019-08-25', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:27:25', 0, '', '2019-08-25 20:27:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1849, 169, 1, 1, '2019-08-25', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:42:46', 0, '', '2019-08-25 20:42:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1850, 169, 1, 1, '2019-08-25', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:53:14', 0, '', '2019-08-25 20:53:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1851, 169, 1, 1, '2019-08-25', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:06:45', 0, '', '2019-08-25 21:06:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1852, 169, 1, 1, '2019-08-25', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:07:22', 0, '', '2019-08-25 21:07:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1853, 171, 1, 1, '2019-08-26', 36.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:00:46', 0, '', '2019-08-26 12:00:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1854, 171, 1, 1, '2019-08-26', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:39:19', 0, '', '2019-08-26 12:39:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1855, 171, 1, 1, '2019-08-26', 21.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:54:03', 0, '', '2019-08-26 12:54:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1856, 171, 1, 1, '2019-08-26', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:27:09', 0, '', '2019-08-26 17:27:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1857, 171, 1, 1, '2019-08-26', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:56:00', 0, '', '2019-08-26 18:56:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1858, 173, 1, 1, '2019-08-27', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:09:03', 0, '', '2019-08-27 11:09:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1859, 173, 1, 1, '2019-08-27', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:53:42', 0, '', '2019-08-27 11:53:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1860, 173, 1, 1, '2019-08-27', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:14:12', 0, '', '2019-08-27 12:14:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1861, 173, 1, 1, '2019-08-27', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:18:46', 0, '', '2019-08-27 16:18:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1862, 173, 1, 1, '2019-08-27', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:25:22', 0, '', '2019-08-27 16:25:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1863, 173, 1, 1, '2019-08-27', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:27:18', 0, '', '2019-08-27 16:27:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1864, 173, 1, 1, '2019-08-27', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:17:38', 0, '', '2019-08-27 17:17:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1865, 173, 1, 1, '2019-08-27', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:56:50', 0, '', '2019-08-27 17:56:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1866, 173, 1, 1, '2019-08-27', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:25:44', 0, '', '2019-08-27 18:25:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1867, 173, 1, 1, '2019-08-27', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:49:48', 0, '', '2019-08-27 20:49:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1868, 173, 1, 1, '2019-08-27', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:14:00', 0, '', '2019-08-27 21:14:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1869, 175, 1, 1, '2019-08-28', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:42:14', 0, '', '2019-08-28 15:42:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1870, 175, 1, 1, '2019-08-28', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:22:24', 0, '', '2019-08-28 16:22:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1871, 175, 1, 1, '2019-08-28', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:29:56', 0, '', '2019-08-28 16:29:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1872, 175, 1, 1, '2019-08-28', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:01:07', 0, '', '2019-08-28 17:01:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1873, 175, 1, 1, '2019-08-28', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:02:26', 0, '', '2019-08-28 17:02:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1874, 175, 1, 1, '2019-08-28', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:20:58', 0, '', '2019-08-28 17:20:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1875, 175, 1, 1, '2019-08-28', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:34:28', 0, '', '2019-08-28 17:34:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1876, 175, 1, 1, '2019-08-28', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:05:24', 0, '', '2019-08-28 19:05:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1877, 177, 1, 1, '2019-08-29', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:07:19', 0, '', '2019-08-29 11:07:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1878, 177, 1, 1, '2019-08-29', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:50:58', 0, '', '2019-08-29 11:50:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1879, 177, 1, 1, '2019-08-29', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:04:45', 0, '', '2019-08-29 12:04:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1880, 177, 1, 1, '2019-08-29', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:15:54', 0, '', '2019-08-29 15:15:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1881, 177, 1, 1, '2019-08-29', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:11:58', 0, '', '2019-08-29 16:11:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1882, 177, 1, 1, '2019-08-29', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:51:52', 0, '', '2019-08-29 16:51:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1883, 177, 1, 1, '2019-08-29', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:08:02', 0, '', '2019-08-29 17:08:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1884, 177, 1, 1, '2019-08-29', 30.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:17:18', 0, '', '2019-08-29 17:17:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1885, 177, 1, 1, '2019-08-29', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:05:28', 0, '', '2019-08-29 18:05:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1886, 177, 1, 1, '2019-08-29', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:19:45', 0, '', '2019-08-29 18:19:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1887, 177, 1, 1, '2019-08-29', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:21:08', 0, '', '2019-08-29 18:21:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1888, 179, 1, 1, '2019-08-30', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:18:23', 0, '', '2019-08-30 10:18:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1889, 179, 1, 1, '2019-08-30', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:03:46', 0, '', '2019-08-30 11:03:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1890, 179, 1, 1, '2019-08-30', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:11:28', 0, '', '2019-08-30 11:11:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1891, 179, 1, 1, '2019-08-30', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:48:06', 0, '', '2019-08-30 11:48:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1892, 179, 1, 1, '2019-08-30', 21.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:53:23', 0, '', '2019-08-30 11:53:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1893, 179, 1, 1, '2019-08-30', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:00:09', 0, '', '2019-08-30 12:00:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1894, 179, 1, 1, '2019-08-30', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:25:14', 0, '', '2019-08-30 12:25:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1895, 179, 1, 1, '2019-08-30', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:25:27', 0, '', '2019-08-30 12:25:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1896, 179, 1, 1, '2019-08-30', 21.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:42:11', 0, '', '2019-08-30 16:42:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1897, 179, 1, 1, '2019-08-30', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:01:06', 0, '', '2019-08-30 17:01:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1898, 179, 1, 1, '2019-08-30', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:57:08', 0, '', '2019-08-30 17:57:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1899, 179, 1, 1, '2019-08-30', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:28:38', 0, '', '2019-08-30 18:28:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1900, 179, 1, 1, '2019-08-30', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:33:39', 0, '', '2019-08-30 18:33:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1901, 179, 1, 1, '2019-08-30', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:37:01', 0, '', '2019-08-30 18:37:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1902, 179, 1, 1, '2019-08-30', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:30:28', 0, '', '2019-08-30 20:30:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1903, 179, 1, 1, '2019-08-30', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:45:13', 0, '', '2019-08-30 20:45:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1904, 179, 1, 1, '2019-08-30', 30.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:18:39', 0, '', '2019-08-30 21:18:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1905, 179, 1, 1, '2019-08-30', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:39:12', 0, '', '2019-08-30 21:39:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1906, 179, 1, 1, '2019-08-30', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:41:26', 0, '', '2019-08-30 21:41:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1907, 181, 1, 1, '2019-08-31', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:10:51', 0, '', '2019-08-31 11:10:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1908, 181, 1, 1, '2019-08-31', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:11:32', 0, '', '2019-08-31 12:11:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1909, 181, 1, 1, '2019-08-31', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:53:46', 0, '', '2019-08-31 12:53:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1910, 181, 1, 1, '2019-08-31', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:02:17', 0, '', '2019-08-31 13:02:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1911, 181, 1, 1, '2019-08-31', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:49:21', 0, '', '2019-08-31 15:49:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1912, 181, 1, 1, '2019-08-31', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:03:34', 0, '', '2019-08-31 16:03:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1913, 181, 1, 1, '2019-08-31', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:20:13', 0, '', '2019-08-31 16:20:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1914, 181, 1, 1, '2019-08-31', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:24:04', 0, '', '2019-08-31 16:24:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1915, 181, 1, 1, '2019-08-31', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:48:32', 0, '', '2019-08-31 17:48:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1916, 181, 1, 1, '2019-08-31', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:56:46', 0, '', '2019-08-31 17:56:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1917, 181, 1, 1, '2019-08-31', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:19:03', 0, '', '2019-08-31 18:19:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1918, 181, 1, 1, '2019-08-31', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:43:54', 0, '', '2019-08-31 18:43:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1919, 181, 1, 1, '2019-08-31', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:44:55', 0, '', '2019-08-31 18:44:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1920, 181, 1, 1, '2019-08-31', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:38:08', 0, '', '2019-08-31 19:38:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1921, 181, 1, 1, '2019-08-31', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:45:09', 0, '', '2019-08-31 19:45:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1922, 181, 1, 1, '2019-08-31', 38.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:02:52', 0, '', '2019-08-31 20:02:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1923, 181, 1, 1, '2019-08-31', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:21:23', 0, '', '2019-08-31 20:21:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1924, 181, 1, 1, '2019-08-31', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:22:21', 0, '', '2019-08-31 20:22:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1925, 181, 1, 1, '2019-08-31', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:41:57', 0, '', '2019-08-31 20:41:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1926, 181, 1, 1, '2019-08-31', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:00:14', 0, '', '2019-08-31 21:00:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1927, 181, 1, 1, '2019-08-31', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:48:47', 0, '', '2019-08-31 21:48:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1928, 183, 1, 1, '2019-09-01', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:41:34', 0, '', '2019-09-01 11:41:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1929, 183, 1, 1, '2019-09-01', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:44:01', 0, '', '2019-09-01 11:44:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1930, 183, 1, 1, '2019-09-01', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:36:58', 0, '', '2019-09-01 16:36:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1931, 185, 1, 1, '2019-09-02', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:11:28', 0, '', '2019-09-02 15:11:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1932, 185, 1, 1, '2019-09-02', 33.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:33:11', 0, '', '2019-09-02 16:33:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1933, 185, 1, 1, '2019-09-02', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:40:23', 0, '', '2019-09-02 16:40:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1934, 185, 1, 1, '2019-09-02', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:55:49', 0, '', '2019-09-02 16:55:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1935, 185, 1, 1, '2019-09-02', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:57:01', 0, '', '2019-09-02 16:57:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1936, 185, 1, 1, '2019-09-02', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:01:36', 0, '', '2019-09-02 17:01:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1937, 185, 1, 1, '2019-09-02', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:47:56', 0, '', '2019-09-02 18:47:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1938, 185, 1, 1, '2019-09-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:10:44', 0, '', '2019-09-02 19:10:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1939, 187, 1, 1, '2019-09-03', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:00:52', 0, '', '2019-09-03 10:00:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1940, 187, 1, 1, '2019-09-03', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:44:01', 0, '', '2019-09-03 16:44:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1941, 187, 1, 1, '2019-09-03', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:51:47', 0, '', '2019-09-03 18:51:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1942, 187, 1, 1, '2019-09-03', 24.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:54:35', 0, '', '2019-09-03 18:54:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1943, 187, 1, 1, '2019-09-03', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:41:50', 0, '', '2019-09-03 19:41:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1944, 187, 1, 1, '2019-09-03', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:03:20', 0, '', '2019-09-03 20:03:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1945, 187, 1, 1, '2019-09-03', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:52:02', 0, '', '2019-09-03 20:52:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1946, 187, 1, 1, '2019-09-03', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:58:28', 0, '', '2019-09-03 20:58:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1947, 187, 1, 1, '2019-09-03', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:07:14', 0, '', '2019-09-03 21:07:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1948, 187, 1, 1, '2019-09-03', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:37:39', 0, '', '2019-09-03 21:37:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1949, 187, 1, 1, '2019-09-03', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:55:33', 0, '', '2019-09-03 21:55:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1950, 187, 1, 1, '2019-09-03', 23.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:59:52', 0, '', '2019-09-03 21:59:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1951, 191, 1, 1, '2019-09-04', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:20:52', 0, '', '2019-09-04 17:20:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1952, 191, 1, 1, '2019-09-04', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:29:09', 0, '', '2019-09-04 17:29:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1953, 191, 1, 1, '2019-09-04', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:26:04', 0, '', '2019-09-04 18:26:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1954, 191, 1, 1, '2019-09-04', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:59:06', 0, '', '2019-09-04 18:59:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1955, 191, 1, 1, '2019-09-04', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:34:56', 0, '', '2019-09-04 20:34:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1956, 191, 1, 1, '2019-09-04', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:37:24', 0, '', '2019-09-04 20:37:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1957, 193, 1, 1, '2019-09-05', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:32:44', 0, '', '2019-09-05 10:32:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1958, 193, 1, 1, '2019-09-05', 40.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:20:36', 2, '001-73', '2019-09-05 16:20:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1959, 195, 1, 1, '2019-09-05', 40.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:27:04', 2, '001-74', '2019-09-05 16:27:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1960, 195, 1, 1, '2019-09-05', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:41:45', 0, '', '2019-09-05 17:41:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1961, 195, 1, 1, '2019-09-05', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:43:45', 0, '', '2019-09-05 17:43:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1962, 195, 1, 1, '2019-09-05', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:10:44', 0, '', '2019-09-05 18:10:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1963, 195, 1, 1, '2019-09-05', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:53:10', 0, '', '2019-09-05 18:53:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1964, 197, 1, 1, '2019-09-06', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:19:45', 0, '', '2019-09-06 12:19:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1965, 197, 1, 1, '2019-09-06', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:42:29', 0, '', '2019-09-06 16:42:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1966, 197, 1, 1, '2019-09-06', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:13:50', 0, '', '2019-09-06 17:13:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1967, 197, 1, 1, '2019-09-06', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:36:56', 0, '', '2019-09-06 19:36:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1968, 197, 1, 1, '2019-09-06', 7.50, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:02:43', 0, '', '2019-09-06 21:02:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1969, 197, 1, 1, '2019-09-06', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:24:51', 0, '', '2019-09-06 21:24:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1970, 201, 1, 1, '2019-09-09', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:31:19', 0, '', '2019-09-09 17:31:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1971, 201, 1, 1, '2019-09-09', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:33:35', 0, '', '2019-09-09 17:33:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1972, 201, 1, 1, '2019-09-09', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:13:29', 0, '', '2019-09-09 18:13:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1973, 203, 1, 1, '2019-09-10', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:00:42', 0, '', '2019-09-10 13:00:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1974, 203, 1, 1, '2019-09-10', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:12:02', 0, '', '2019-09-10 13:12:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1975, 203, 1, 1, '2019-09-10', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:13:15', 0, '', '2019-09-10 13:13:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1976, 203, 1, 1, '2019-09-10', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:04:30', 0, '', '2019-09-10 16:04:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1977, 203, 1, 1, '2019-09-10', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:05:25', 0, '', '2019-09-10 16:05:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1978, 203, 1, 1, '2019-09-10', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:11:37', 0, '', '2019-09-10 19:11:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1979, 203, 1, 1, '2019-09-10', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:17:48', 0, '', '2019-09-10 19:17:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1980, 205, 1, 1, '2019-09-11', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:14:21', 0, '', '2019-09-11 11:14:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1981, 207, 1, 1, '2019-09-11', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:22:34', 0, '', '2019-09-11 11:22:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1982, 207, 1, 1, '2019-09-11', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:25:56', 0, '', '2019-09-11 11:25:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1983, 207, 1, 1, '2019-09-11', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:40:13', 0, '', '2019-09-11 11:40:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1984, 207, 1, 1, '2019-09-11', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:01:25', 0, '', '2019-09-11 16:01:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1985, 207, 1, 1, '2019-09-11', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:03:46', 0, '', '2019-09-11 16:03:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1986, 207, 1, 1, '2019-09-11', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:14:41', 0, '', '2019-09-11 16:14:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1987, 207, 1, 1, '2019-09-11', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:15:38', 0, '', '2019-09-11 16:15:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1988, 207, 1, 1, '2019-09-11', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:22:17', 0, '', '2019-09-11 17:22:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1989, 207, 1, 1, '2019-09-11', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:48:14', 0, '', '2019-09-11 17:48:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1990, 207, 1, 1, '2019-09-11', 24.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:18:29', 0, '', '2019-09-11 19:18:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1991, 209, 1, 1, '2019-09-12', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:46:47', 0, '', '2019-09-12 16:46:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1992, 209, 1, 1, '2019-09-12', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:52:51', 0, '', '2019-09-12 16:52:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1993, 209, 1, 1, '2019-09-12', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:14:37', 0, '', '2019-09-12 18:14:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1994, 209, 1, 1, '2019-09-12', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:19:04', 0, '', '2019-09-12 18:19:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1995, 209, 1, 1, '2019-09-12', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:01:32', 0, '', '2019-09-12 20:01:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1996, 209, 1, 1, '2019-09-12', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:13:06', 0, '', '2019-09-12 21:13:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1997, 209, 1, 1, '2019-09-12', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:13:28', 0, '', '2019-09-12 21:13:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1998, 209, 1, 1, '2019-09-12', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:14:52', 0, '', '2019-09-12 21:14:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (1999, 211, 1, 1, '2019-09-13', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:58:46', 0, '', '2019-09-13 17:58:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2000, 211, 1, 1, '2019-09-13', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:10:31', 0, '', '2019-09-13 19:10:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2001, 211, 1, 1, '2019-09-13', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:57:39', 0, '', '2019-09-13 20:57:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2002, 213, 1, 1, '2019-09-14', 14.50, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:45:50', 0, '', '2019-09-14 11:45:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2003, 213, 1, 1, '2019-09-14', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:45:57', 0, '', '2019-09-14 16:45:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2004, 213, 1, 1, '2019-09-14', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:02:38', 0, '', '2019-09-14 17:02:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2005, 213, 1, 1, '2019-09-14', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:23:08', 0, '', '2019-09-14 17:23:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2006, 213, 1, 1, '2019-09-14', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:03:30', 0, '', '2019-09-14 18:03:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2007, 213, 1, 1, '2019-09-14', 6.50, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:45:16', 0, '', '2019-09-14 20:45:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2008, 213, 1, 1, '2019-09-14', 66.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:13:51', 2, '001-75', '2019-09-14 21:13:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2009, 213, 1, 1, '2019-09-14', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:59:02', 0, '', '2019-09-14 21:59:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2010, 213, 1, 1, '2019-09-14', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:22:14', 0, '', '2019-09-14 22:22:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2011, 213, 1, 1, '2019-09-14', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:27:10', 0, '', '2019-09-14 22:27:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2012, 215, 1, 1, '2019-09-15', 15.50, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:50:04', 0, '', '2019-09-15 11:50:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2013, 215, 1, 1, '2019-09-15', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:29:18', 0, '', '2019-09-15 12:29:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2014, 215, 1, 1, '2019-09-15', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:39:04', 0, '', '2019-09-15 12:39:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2015, 215, 1, 1, '2019-09-15', 5.50, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:44:54', 0, '', '2019-09-15 15:44:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2016, 215, 1, 1, '2019-09-15', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:07:37', 0, '', '2019-09-15 17:07:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2017, 215, 1, 1, '2019-09-15', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:18:41', 0, '', '2019-09-15 17:18:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2018, 215, 1, 1, '2019-09-15', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:19:33', 0, '', '2019-09-15 17:19:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2019, 215, 1, 1, '2019-09-15', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:47:13', 0, '', '2019-09-15 17:47:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2020, 215, 1, 1, '2019-09-15', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:09:48', 0, '', '2019-09-15 18:09:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2021, 215, 1, 1, '2019-09-15', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:07:28', 0, '', '2019-09-15 19:07:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2022, 215, 1, 1, '2019-09-15', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:27:44', 0, '', '2019-09-15 20:27:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2023, 215, 1, 1, '2019-09-15', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:05:00', 0, '', '2019-09-15 22:05:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2024, 217, 1, 1, '2019-09-16', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:50:02', 0, '', '2019-09-16 17:50:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2025, 217, 1, 1, '2019-09-16', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:14:15', 0, '', '2019-09-16 18:14:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2026, 217, 1, 1, '2019-09-16', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:15:49', 0, '', '2019-09-16 18:15:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2027, 217, 1, 1, '2019-09-16', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:21:14', 0, '', '2019-09-16 18:21:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2028, 217, 1, 1, '2019-09-16', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:39:55', 0, '', '2019-09-16 19:39:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2029, 217, 1, 1, '2019-09-16', 32.50, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:13:20', 0, '', '2019-09-16 21:13:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2030, 219, 1, 1, '2019-09-17', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:07:25', 0, '', '2019-09-17 15:07:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2031, 219, 1, 1, '2019-09-17', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:57:10', 0, '', '2019-09-17 16:57:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2032, 219, 1, 1, '2019-09-17', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:23:33', 0, '', '2019-09-17 18:23:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2033, 219, 1, 1, '2019-09-17', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:09:16', 0, '', '2019-09-17 19:09:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2034, 219, 1, 1, '2019-09-17', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:25:27', 0, '', '2019-09-17 20:25:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2035, 221, 1, 1, '2019-09-18', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:35:42', 0, '', '2019-09-18 15:35:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2036, 221, 1, 1, '2019-09-18', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:36:22', 0, '', '2019-09-18 15:36:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2037, 221, 1, 1, '2019-09-18', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:41:16', 0, '', '2019-09-18 17:41:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2038, 221, 1, 1, '2019-09-18', 36.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:59:31', 0, '', '2019-09-18 18:59:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2039, 221, 1, 1, '2019-09-18', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:30:54', 0, '', '2019-09-18 20:30:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2040, 221, 1, 1, '2019-09-18', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:32:52', 0, '', '2019-09-18 20:32:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2041, 221, 1, 1, '2019-09-18', 32.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:49:57', 0, '', '2019-09-18 20:49:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2042, 221, 1, 1, '2019-09-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:59:34', 0, '', '2019-09-18 20:59:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2043, 221, 1, 1, '2019-09-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '08:23:26', 0, '', '2019-09-19 08:23:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2044, 223, 1, 1, '2019-09-19', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:16:21', 0, '', '2019-09-19 10:16:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2045, 223, 1, 1, '2019-09-19', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:33:01', 0, '', '2019-09-19 10:33:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2046, 223, 1, 1, '2019-09-19', 21.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:17:00', 0, '', '2019-09-19 15:17:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2047, 223, 1, 1, '2019-09-19', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:20:22', 0, '', '2019-09-19 16:20:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2048, 223, 1, 1, '2019-09-19', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:39:48', 0, '', '2019-09-19 18:39:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2049, 223, 1, 1, '2019-09-19', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:49:25', 0, '', '2019-09-19 18:49:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2050, 223, 1, 1, '2019-09-20', 30.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '08:18:35', 0, '', '2019-09-20 08:18:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2051, 225, 1, 1, '2019-09-20', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:37:21', 0, '', '2019-09-20 12:37:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2052, 225, 1, 1, '2019-09-20', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:38:57', 0, '', '2019-09-20 12:38:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2053, 225, 1, 1, '2019-09-20', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:55:57', 0, '', '2019-09-20 17:55:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2054, 227, 1, 1, '2019-09-21', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:18:37', 0, '', '2019-09-21 17:18:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2055, 231, 1, 1, '2019-09-24', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:18:42', 0, '', '2019-09-24 16:18:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2056, 231, 1, 1, '2019-09-24', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:20:18', 0, '', '2019-09-24 16:20:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2057, 233, 1, 1, '2019-09-25', 61.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:52:17', 0, '', '2019-09-25 17:52:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2058, 235, 1, 1, '2019-09-26', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:58:18', 0, '', '2019-09-26 10:58:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2059, 235, 1, 1, '2019-09-26', 28.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:29:00', 0, '', '2019-09-26 16:29:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2060, 235, 1, 1, '2019-09-26', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:47:50', 0, '', '2019-09-26 18:47:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2061, 235, 1, 1, '2019-09-26', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:54:01', 0, '', '2019-09-26 20:54:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2062, 237, 1, 1, '2019-09-29', 68.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:52:54', 0, '', '2019-09-29 20:52:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2063, 237, 1, 1, '2019-09-29', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:53:59', 0, '', '2019-09-29 20:53:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2064, 237, 1, 1, '2019-09-29', 30.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:57:43', 0, '', '2019-09-29 20:57:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2065, 237, 1, 1, '2019-09-29', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:59:48', 0, '', '2019-09-29 20:59:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2066, 237, 1, 1, '2019-09-29', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:01:52', 0, '', '2019-09-29 21:01:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2067, 237, 1, 1, '2019-09-29', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:02:39', 0, '', '2019-09-29 21:02:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2068, 239, 1, 1, '2019-09-30', 28.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:55:30', 0, '', '2019-09-30 16:55:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2069, 241, 1, 1, '2019-10-01', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:29:58', 0, '', '2019-10-01 19:29:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2070, 243, 1, 1, '2019-10-02', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:25:05', 0, '', '2019-10-02 16:25:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2071, 243, 1, 1, '2019-10-02', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:26:38', 0, '', '2019-10-02 16:26:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2072, 243, 1, 1, '2019-10-02', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:46:51', 0, '', '2019-10-02 16:46:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2073, 243, 1, 1, '2019-10-02', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:05:35', 0, '', '2019-10-02 19:05:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2074, 243, 1, 1, '2019-10-02', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:21:49', 0, '', '2019-10-02 20:21:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2075, 243, 1, 1, '2019-10-02', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:50:49', 0, '', '2019-10-02 20:50:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2076, 245, 1, 1, '2019-10-03', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:33:41', 0, '', '2019-10-03 11:33:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2077, 245, 1, 1, '2019-10-03', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:45:04', 0, '', '2019-10-03 17:45:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2078, 245, 1, 1, '2019-10-03', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:08:27', 0, '', '2019-10-03 19:08:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2079, 245, 1, 1, '2019-10-03', 63.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:48:05', 0, '', '2019-10-03 19:48:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2080, 245, 1, 1, '2019-10-03', 24.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:15:31', 0, '', '2019-10-03 20:15:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2081, 247, 1, 1, '2019-10-04', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:44:49', 0, '', '2019-10-04 17:44:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2082, 247, 1, 1, '2019-10-04', 47.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:20:40', 0, '', '2019-10-04 21:20:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2083, 247, 1, 1, '2019-10-04', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:21:50', 0, '', '2019-10-04 21:21:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2084, 249, 1, 1, '2019-10-05', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:26:52', 0, '', '2019-10-05 10:26:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2085, 249, 1, 1, '2019-10-05', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:18:29', 0, '', '2019-10-05 17:18:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2086, 249, 1, 1, '2019-10-05', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:00:56', 0, '', '2019-10-05 18:00:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2087, 249, 1, 1, '2019-10-05', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:09:08', 0, '', '2019-10-05 18:09:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2088, 249, 1, 1, '2019-10-05', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:09:42', 0, '', '2019-10-05 20:09:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2089, 251, 1, 1, '2019-10-05', 67.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:44:03', 0, '', '2019-10-05 20:44:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2090, 251, 1, 1, '2019-10-05', 25.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:47:34', 0, '', '2019-10-05 21:47:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2091, 253, 1, 1, '2019-10-06', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:42:13', 0, '', '2019-10-06 10:42:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2092, 253, 1, 1, '2019-10-06', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:44:38', 0, '', '2019-10-06 13:44:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2093, 253, 1, 1, '2019-10-06', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:41:35', 0, '', '2019-10-06 15:41:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2094, 253, 1, 1, '2019-10-06', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:18:55', 0, '', '2019-10-06 17:18:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2095, 253, 1, 1, '2019-10-06', 32.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:45:21', 0, '', '2019-10-06 17:45:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2096, 253, 1, 1, '2019-10-06', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:07:53', 0, '', '2019-10-06 18:07:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2097, 253, 1, 1, '2019-10-06', 43.50, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:14:56', 0, '', '2019-10-06 18:14:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2098, 253, 1, 1, '2019-10-06', 43.50, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:54:37', 0, '', '2019-10-06 18:54:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2099, 253, 1, 1, '2019-10-06', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:30:18', 0, '', '2019-10-06 21:30:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2100, 253, 1, 1, '2019-10-06', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:45:53', 0, '', '2019-10-06 21:45:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2101, 253, 1, 1, '2019-10-06', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:18:57', 0, '', '2019-10-06 22:18:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2102, 253, 1, 1, '2019-10-06', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:25:53', 0, '', '2019-10-06 22:25:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2103, 255, 1, 1, '2019-10-08', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:19:08', 0, '', '2019-10-08 12:19:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2104, 257, 1, 1, '2019-10-10', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:38:12', 0, '', '2019-10-10 11:38:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2105, 257, 1, 1, '2019-10-10', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:39:18', 0, '', '2019-10-10 11:39:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2106, 257, 1, 1, '2019-10-10', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:24:09', 0, '', '2019-10-10 15:24:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2107, 257, 1, 1, '2019-10-10', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:05:25', 0, '', '2019-10-10 18:05:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2108, 263, 1, 1, '2019-10-13', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:18:05', 0, '', '2019-10-13 16:18:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2109, 263, 1, 1, '2019-10-13', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:47:46', 0, '', '2019-10-13 17:47:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2110, 263, 1, 1, '2019-10-13', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:54:01', 0, '', '2019-10-13 17:54:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2111, 263, 1, 1, '2019-10-13', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:29:41', 0, '', '2019-10-13 18:29:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2112, 263, 1, 1, '2019-10-13', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:13:39', 0, '', '2019-10-13 19:13:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2113, 263, 1, 1, '2019-10-13', 56.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:15:17', 0, '', '2019-10-13 19:15:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2114, 263, 1, 1, '2019-10-13', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:19:04', 0, '', '2019-10-13 19:19:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2115, 265, 1, 1, '2019-10-14', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:09:25', 0, '', '2019-10-14 18:09:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2116, 265, 1, 1, '2019-10-14', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:11:11', 0, '', '2019-10-14 18:11:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2117, 265, 1, 1, '2019-10-14', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:12:52', 0, '', '2019-10-14 18:12:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2118, 265, 1, 1, '2019-10-14', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:14:19', 0, '', '2019-10-14 18:14:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2119, 265, 1, 1, '2019-10-14', 26.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:09:06', 0, '', '2019-10-14 19:09:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2120, 265, 1, 1, '2019-10-14', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:09:26', 0, '', '2019-10-14 19:09:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2121, 267, 1, 1, '2019-10-15', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:32:57', 0, '', '2019-10-15 15:32:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2122, 267, 1, 1, '2019-10-15', 30.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:11:04', 0, '', '2019-10-15 18:11:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2123, 269, 1, 1, '2019-10-16', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:54:06', 0, '', '2019-10-16 15:54:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2124, 269, 1, 1, '2019-10-16', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:55:01', 0, '', '2019-10-16 15:55:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2125, 269, 1, 1, '2019-10-16', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:13:41', 0, '', '2019-10-16 16:13:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2126, 269, 1, 1, '2019-10-16', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:34:52', 0, '', '2019-10-16 18:34:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2127, 269, 1, 1, '2019-10-16', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:36:24', 0, '', '2019-10-16 18:36:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2128, 269, 1, 1, '2019-10-16', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:50:49', 0, '', '2019-10-16 19:50:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2129, 271, 1, 1, '2019-10-17', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:23:49', 0, '', '2019-10-17 12:23:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2130, 271, 1, 1, '2019-10-17', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:25:06', 0, '', '2019-10-17 12:25:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2131, 271, 1, 1, '2019-10-17', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:25:52', 0, '', '2019-10-17 12:25:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2132, 271, 1, 1, '2019-10-17', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:27:07', 0, '', '2019-10-17 12:27:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2133, 271, 1, 1, '2019-10-17', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:45:38', 0, '', '2019-10-17 15:45:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2134, 273, 1, 1, '2019-10-18', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:51:58', 0, '', '2019-10-18 10:51:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2135, 273, 1, 1, '2019-10-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:23:55', 0, '', '2019-10-18 18:23:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2136, 273, 1, 1, '2019-10-18', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:24:49', 0, '', '2019-10-18 18:24:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2137, 273, 1, 1, '2019-10-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:26:20', 0, '', '2019-10-18 18:26:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2138, 273, 1, 1, '2019-10-18', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:46:50', 0, '', '2019-10-18 18:46:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2139, 273, 1, 1, '2019-10-18', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:53:51', 0, '', '2019-10-18 18:53:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2140, 273, 1, 1, '2019-10-18', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:47:10', 0, '', '2019-10-18 19:47:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2141, 275, 1, 1, '2019-10-19', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:57:13', 0, '', '2019-10-19 11:57:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2142, 275, 1, 1, '2019-10-19', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:45:56', 0, '', '2019-10-19 17:45:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2143, 275, 1, 1, '2019-10-19', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:49:13', 0, '', '2019-10-19 17:49:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2144, 279, 1, 1, '2019-10-20', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:41:48', 0, '', '2019-10-20 16:41:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2145, 279, 1, 1, '2019-10-20', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:08:00', 0, '', '2019-10-20 18:08:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2146, 279, 1, 1, '2019-10-20', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:22:40', 0, '', '2019-10-20 18:22:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2147, 281, 1, 1, '2019-10-21', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:21:08', 0, '', '2019-10-21 12:21:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2148, 281, 1, 1, '2019-10-21', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:58:49', 0, '', '2019-10-21 15:58:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2149, 281, 1, 1, '2019-10-21', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:25:22', 0, '', '2019-10-21 17:25:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2150, 281, 1, 1, '2019-10-21', 26.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:28:34', 0, '', '2019-10-21 18:28:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2151, 283, 1, 1, '2019-10-22', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:21:03', 0, '', '2019-10-22 20:21:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2152, 285, 1, 1, '2019-10-23', 31.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:26:10', 0, '', '2019-10-23 10:26:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2153, 287, 1, 1, '2019-10-24', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:33:12', 0, '', '2019-10-24 16:33:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2154, 287, 1, 1, '2019-10-24', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:53:25', 0, '', '2019-10-24 17:53:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2155, 287, 1, 1, '2019-10-24', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:21:30', 0, '', '2019-10-24 20:21:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2156, 289, 1, 1, '2019-10-25', 25.50, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:08:05', 0, '', '2019-10-25 12:08:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2157, 291, 1, 1, '2019-10-26', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:28:11', 0, '', '2019-10-26 12:28:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2158, 291, 1, 1, '2019-10-26', 39.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:37:36', 0, '', '2019-10-26 12:37:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2159, 293, 1, 1, '2019-10-27', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:23:28', 0, '', '2019-10-27 11:23:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2160, 293, 1, 1, '2019-10-27', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:01:58', 0, '', '2019-10-27 16:01:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2161, 293, 1, 1, '2019-10-27', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:02:22', 0, '', '2019-10-27 16:02:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2162, 293, 1, 1, '2019-10-27', 46.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:46:14', 0, '', '2019-10-27 16:46:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2163, 293, 1, 1, '2019-10-27', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:06:07', 0, '', '2019-10-27 17:06:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2164, 293, 1, 1, '2019-10-27', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:32:57', 0, '', '2019-10-27 17:32:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2165, 293, 1, 1, '2019-10-27', 31.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:22:08', 0, '', '2019-10-27 18:22:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2166, 293, 1, 1, '2019-10-27', 42.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:58:04', 0, '', '2019-10-27 18:58:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2167, 295, 1, 1, '2019-10-28', 11.50, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:46:33', 0, '', '2019-10-28 16:46:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2168, 297, 1, 1, '2019-10-29', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:53:55', 0, '', '2019-10-29 10:53:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2169, 297, 1, 1, '2019-10-29', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:55:10', 0, '', '2019-10-29 10:55:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2170, 297, 1, 1, '2019-10-29', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:14:53', 0, '', '2019-10-29 16:14:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2171, 297, 1, 1, '2019-10-29', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:15:42', 0, '', '2019-10-29 16:15:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2172, 297, 1, 1, '2019-10-29', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:39:53', 0, '', '2019-10-29 16:39:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2173, 299, 1, 1, '2019-10-30', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:17:29', 0, '', '2019-10-30 16:17:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2174, 299, 1, 1, '2019-10-30', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:24:28', 0, '', '2019-10-30 17:24:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2175, 299, 1, 1, '2019-10-30', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:31:39', 0, '', '2019-10-30 17:31:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2176, 299, 1, 1, '2019-10-30', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:47:46', 0, '', '2019-10-30 18:47:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2177, 299, 1, 1, '2019-10-30', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:59:40', 0, '', '2019-10-30 18:59:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2178, 299, 1, 1, '2019-10-30', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:14:19', 0, '', '2019-10-30 19:14:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2179, 301, 1, 1, '2019-10-31', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:17:16', 0, '', '2019-10-31 11:17:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2180, 301, 1, 1, '2019-10-31', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:19:21', 0, '', '2019-10-31 11:19:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2181, 301, 1, 1, '2019-10-31', 135.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:17:05', 0, '', '2019-10-31 12:17:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2182, 301, 1, 1, '2019-10-31', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:17:46', 0, '', '2019-10-31 12:17:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2183, 301, 1, 1, '2019-10-31', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:39:42', 0, '', '2019-10-31 12:39:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2184, 301, 1, 1, '2019-10-31', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:59:29', 0, '', '2019-10-31 12:59:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2185, 301, 1, 1, '2019-10-31', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:57:36', 0, '', '2019-10-31 15:57:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2186, 301, 1, 1, '2019-10-31', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:22:53', 0, '', '2019-10-31 16:22:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2187, 301, 1, 1, '2019-10-31', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:56:01', 0, '', '2019-10-31 17:56:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2188, 301, 1, 1, '2019-10-31', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:10:40', 0, '', '2019-10-31 18:10:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2189, 301, 1, 1, '2019-10-31', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:40:39', 0, '', '2019-10-31 19:40:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2190, 301, 1, 1, '2019-10-31', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:03:52', 0, '', '2019-10-31 20:03:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2191, 301, 1, 1, '2019-10-31', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:57:23', 0, '', '2019-10-31 21:57:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2192, 301, 1, 1, '2019-10-31', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:58:34', 0, '', '2019-10-31 21:58:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2193, 301, 1, 1, '2019-10-31', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:04:34', 0, '', '2019-10-31 22:04:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2194, 303, 1, 1, '2019-11-01', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:07:27', 0, '', '2019-11-01 12:07:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2195, 303, 1, 1, '2019-11-01', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:57:44', 0, '', '2019-11-01 15:57:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2196, 303, 1, 1, '2019-11-01', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:49:12', 0, '', '2019-11-01 17:49:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2197, 303, 1, 1, '2019-11-01', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:50:01', 0, '', '2019-11-01 17:50:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2198, 303, 1, 1, '2019-11-01', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:50:39', 0, '', '2019-11-01 17:50:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2199, 303, 1, 1, '2019-11-01', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:51:39', 0, '', '2019-11-01 17:51:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2200, 303, 1, 1, '2019-11-01', 68.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:15:04', 0, '', '2019-11-01 20:15:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2201, 305, 1, 1, '2019-11-02', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:30:34', 0, '', '2019-11-02 16:30:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2202, 305, 1, 1, '2019-11-02', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:56:25', 0, '', '2019-11-02 16:56:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2203, 305, 1, 1, '2019-11-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:06:21', 0, '', '2019-11-02 17:06:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2204, 305, 1, 1, '2019-11-02', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:22:33', 0, '', '2019-11-02 19:22:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2205, 305, 1, 1, '2019-11-02', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:16:03', 0, '', '2019-11-02 20:16:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2206, 305, 1, 1, '2019-11-02', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:45:07', 0, '', '2019-11-02 20:45:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2207, 305, 1, 1, '2019-11-02', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:58:38', 0, '', '2019-11-02 20:58:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2208, 305, 1, 1, '2019-11-02', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:18:54', 0, '', '2019-11-02 21:18:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2209, 307, 1, 1, '2019-11-03', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:59:41', 0, '', '2019-11-03 16:59:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2210, 307, 1, 1, '2019-11-03', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:17:59', 0, '', '2019-11-03 17:17:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2211, 307, 1, 1, '2019-11-03', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:40:45', 0, '', '2019-11-03 17:40:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2212, 307, 1, 1, '2019-11-03', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:38:15', 0, '', '2019-11-03 18:38:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2213, 307, 1, 1, '2019-11-03', 62.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:28:59', 0, '', '2019-11-03 19:28:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2214, 307, 1, 1, '2019-11-03', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:01:48', 0, '', '2019-11-03 20:01:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2215, 307, 1, 1, '2019-11-03', 21.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:07:50', 0, '', '2019-11-03 20:07:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2216, 307, 1, 1, '2019-11-03', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:47:39', 0, '', '2019-11-03 20:47:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2217, 307, 1, 1, '2019-11-03', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:56:44', 0, '', '2019-11-03 20:56:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2218, 307, 1, 1, '2019-11-03', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:49:27', 0, '', '2019-11-03 21:49:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2219, 309, 1, 1, '2019-11-04', 30.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:57:45', 0, '', '2019-11-04 18:57:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2220, 309, 1, 1, '2019-11-04', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:21:43', 0, '', '2019-11-04 19:21:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2221, 309, 1, 1, '2019-11-04', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:22:39', 0, '', '2019-11-04 19:22:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2222, 311, 1, 1, '2019-11-05', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:22:30', 0, '', '2019-11-05 16:22:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2223, 311, 1, 1, '2019-11-05', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:32:40', 0, '', '2019-11-05 18:32:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2224, 311, 1, 1, '2019-11-05', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:35:26', 0, '', '2019-11-05 18:35:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2225, 311, 1, 1, '2019-11-05', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:36:37', 0, '', '2019-11-05 18:36:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2226, 311, 1, 1, '2019-11-05', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:41:09', 0, '', '2019-11-05 18:41:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2227, 311, 1, 1, '2019-11-05', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:43:06', 0, '', '2019-11-05 18:43:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2228, 311, 1, 1, '2019-11-05', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:41:50', 0, '', '2019-11-05 19:41:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2229, 311, 1, 1, '2019-11-05', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:54:18', 0, '', '2019-11-05 20:54:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2230, 313, 1, 1, '2019-11-06', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:48:48', 0, '', '2019-11-06 10:48:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2231, 313, 1, 1, '2019-11-06', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:09:35', 0, '', '2019-11-06 12:09:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2232, 313, 1, 1, '2019-11-06', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:11:10', 0, '', '2019-11-06 12:11:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2233, 313, 1, 1, '2019-11-06', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:35:10', 0, '', '2019-11-06 15:35:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2234, 313, 1, 1, '2019-11-06', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:35:37', 0, '', '2019-11-06 15:35:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2235, 313, 1, 1, '2019-11-06', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:42:42', 0, '', '2019-11-06 15:42:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2236, 313, 1, 1, '2019-11-06', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:06:15', 0, '', '2019-11-06 16:06:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2237, 315, 1, 1, '2019-11-07', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:16:04', 0, '', '2019-11-07 16:16:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2238, 317, 1, 1, '2019-11-08', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:44:15', 0, '', '2019-11-08 16:44:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2239, 317, 1, 1, '2019-11-08', 27.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:33:18', 0, '', '2019-11-08 17:33:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2240, 317, 1, 1, '2019-11-08', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:23:12', 0, '', '2019-11-08 18:23:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2241, 317, 1, 1, '2019-11-08', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:25:09', 0, '', '2019-11-08 18:25:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2242, 317, 1, 1, '2019-11-08', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:56:43', 0, '', '2019-11-08 18:56:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2243, 317, 1, 1, '2019-11-08', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:59:10', 0, '', '2019-11-08 20:59:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2244, 317, 1, 1, '2019-11-08', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:00:20', 0, '', '2019-11-08 21:00:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2245, 319, 1, 1, '2019-11-09', 24.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:35:37', 0, '', '2019-11-09 12:35:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2246, 319, 1, 1, '2019-11-09', 24.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:48:42', 2, '001-76', '2019-11-09 12:48:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2247, 319, 1, 1, '2019-11-09', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:29:43', 0, '', '2019-11-09 16:29:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2248, 319, 1, 1, '2019-11-09', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:54:24', 0, '', '2019-11-09 16:54:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2249, 319, 1, 1, '2019-11-09', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:35:55', 0, '', '2019-11-09 18:35:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2250, 319, 1, 1, '2019-11-09', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:40:38', 0, '', '2019-11-09 18:40:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2251, 319, 1, 1, '2019-11-09', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:41:28', 0, '', '2019-11-09 18:41:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2252, 319, 1, 1, '2019-11-09', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:56:07', 0, '', '2019-11-09 18:56:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2253, 319, 1, 1, '2019-11-09', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:01:23', 0, '', '2019-11-09 19:01:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2254, 319, 1, 1, '2019-11-09', 30.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:46:23', 2, '001-77', '2019-11-09 21:46:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2255, 321, 1, 1, '2019-11-10', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:52:55', 0, '', '2019-11-10 11:52:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2256, 321, 1, 1, '2019-11-10', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:05:24', 0, '', '2019-11-10 13:05:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2257, 321, 1, 1, '2019-11-10', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:49:37', 0, '', '2019-11-10 16:49:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2258, 321, 1, 1, '2019-11-10', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:58:06', 0, '', '2019-11-10 16:58:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2259, 321, 1, 1, '2019-11-10', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:02:27', 0, '', '2019-11-10 17:02:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2260, 321, 1, 1, '2019-11-10', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:39:47', 0, '', '2019-11-10 17:39:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2261, 321, 1, 1, '2019-11-10', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:42:15', 0, '', '2019-11-10 17:42:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2262, 321, 1, 1, '2019-11-10', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:42:45', 0, '', '2019-11-10 17:42:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2263, 321, 1, 1, '2019-11-10', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:43:47', 0, '', '2019-11-10 17:43:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2264, 321, 1, 1, '2019-11-10', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:14:21', 0, '', '2019-11-10 18:14:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2265, 321, 1, 1, '2019-11-10', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:17:14', 0, '', '2019-11-10 19:17:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2266, 321, 1, 1, '2019-11-10', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:26:58', 0, '', '2019-11-10 21:26:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2267, 321, 1, 1, '2019-11-10', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:59:27', 0, '', '2019-11-10 21:59:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2268, 323, 1, 1, '2019-11-11', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:54:13', 0, '', '2019-11-11 17:54:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2269, 323, 1, 1, '2019-11-11', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:55:53', 0, '', '2019-11-11 17:55:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2270, 325, 1, 1, '2019-11-12', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:38:58', 0, '', '2019-11-12 15:38:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2271, 325, 1, 1, '2019-11-12', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:07:28', 0, '', '2019-11-12 16:07:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2272, 325, 1, 1, '2019-11-12', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:04:08', 0, '', '2019-11-12 18:04:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2273, 325, 1, 1, '2019-11-12', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:37:56', 0, '', '2019-11-12 18:37:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2274, 325, 1, 1, '2019-11-12', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:13:41', 0, '', '2019-11-12 19:13:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2275, 325, 1, 1, '2019-11-12', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:46:03', 0, '', '2019-11-12 19:46:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2276, 325, 1, 1, '2019-11-12', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:48:36', 0, '', '2019-11-12 19:48:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2277, 325, 1, 1, '2019-11-12', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:14:13', 0, '', '2019-11-12 20:14:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2278, 329, 1, 1, '2019-11-14', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '08:40:40', 0, '', '2019-11-14 08:40:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2279, 329, 1, 1, '2019-11-14', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '09:28:35', 0, '', '2019-11-14 09:28:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2280, 329, 1, 1, '2019-11-14', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '09:30:56', 0, '', '2019-11-14 09:30:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2281, 329, 1, 1, '2019-11-14', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '09:33:45', 0, '', '2019-11-14 09:33:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2282, 329, 1, 1, '2019-11-14', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:02:41', 0, '', '2019-11-14 10:02:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2283, 329, 1, 1, '2019-11-14', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:04:32', 0, '', '2019-11-14 10:04:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2284, 329, 1, 1, '2019-11-14', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:23:48', 0, '', '2019-11-14 12:23:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2285, 329, 1, 1, '2019-11-14', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:24:26', 0, '', '2019-11-14 12:24:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2286, 331, 1, 1, '2019-11-14', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:38:09', 0, '', '2019-11-14 12:38:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2287, 331, 1, 1, '2019-11-14', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:38:34', 0, '', '2019-11-14 12:38:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2288, 331, 1, 1, '2019-11-14', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:11:46', 0, '', '2019-11-14 17:11:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2289, 331, 1, 1, '2019-11-14', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:12:43', 0, '', '2019-11-14 17:12:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2290, 331, 1, 1, '2019-11-14', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:23:19', 0, '', '2019-11-14 17:23:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2291, 331, 1, 1, '2019-11-14', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:38:01', 0, '', '2019-11-14 17:38:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2292, 331, 1, 1, '2019-11-14', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:31:07', 0, '', '2019-11-14 19:31:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2293, 335, 1, 1, '2019-11-16', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:12:56', 0, '', '2019-11-16 13:12:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2294, 335, 1, 1, '2019-11-16', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:37:53', 0, '', '2019-11-16 16:37:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2295, 335, 1, 1, '2019-11-16', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:07:26', 0, '', '2019-11-16 17:07:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2296, 335, 1, 1, '2019-11-16', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:07:47', 0, '', '2019-11-16 17:07:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2297, 335, 1, 1, '2019-11-16', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:10:03', 0, '', '2019-11-16 20:10:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2298, 335, 1, 1, '2019-11-16', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:33:58', 0, '', '2019-11-16 20:33:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2299, 337, 1, 1, '2019-11-17', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:37:43', 0, '', '2019-11-17 11:37:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2300, 337, 1, 1, '2019-11-17', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:02:36', 0, '', '2019-11-17 13:02:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2301, 337, 1, 1, '2019-11-17', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:03:07', 0, '', '2019-11-17 13:03:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2302, 337, 1, 1, '2019-11-17', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:04:44', 0, '', '2019-11-17 13:04:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2303, 337, 1, 1, '2019-11-17', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:28:49', 0, '', '2019-11-17 16:28:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2304, 337, 1, 1, '2019-11-17', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:34:42', 0, '', '2019-11-17 16:34:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2305, 337, 1, 1, '2019-11-17', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:39:48', 0, '', '2019-11-17 16:39:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2306, 337, 1, 1, '2019-11-17', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:02:26', 0, '', '2019-11-17 17:02:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2307, 337, 1, 1, '2019-11-17', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:12:47', 0, '', '2019-11-17 17:12:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2308, 337, 1, 1, '2019-11-17', 25.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:14:16', 0, '', '2019-11-17 17:14:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2309, 337, 1, 1, '2019-11-17', 23.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:58:06', 0, '', '2019-11-17 17:58:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2310, 337, 1, 1, '2019-11-17', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:58:53', 0, '', '2019-11-17 17:58:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2311, 337, 1, 1, '2019-11-17', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:18:11', 0, '', '2019-11-17 18:18:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2312, 337, 1, 1, '2019-11-17', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:48:42', 0, '', '2019-11-17 18:48:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2313, 337, 1, 1, '2019-11-17', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:13:54', 0, '', '2019-11-17 20:13:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2314, 337, 1, 1, '2019-11-17', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:15:44', 0, '', '2019-11-17 21:15:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2315, 339, 1, 1, '2019-11-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:26:39', 0, '', '2019-11-18 15:26:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2316, 339, 1, 1, '2019-11-18', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:17:07', 0, '', '2019-11-18 16:17:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2317, 339, 1, 1, '2019-11-18', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:42:28', 0, '', '2019-11-18 16:42:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2318, 339, 1, 1, '2019-11-18', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:58:18', 0, '', '2019-11-18 16:58:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2319, 339, 1, 1, '2019-11-18', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:40:51', 0, '', '2019-11-18 19:40:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2320, 341, 1, 1, '2019-11-19', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:36:34', 0, '', '2019-11-19 17:36:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2321, 341, 1, 1, '2019-11-19', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:25:23', 0, '', '2019-11-19 18:25:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2322, 341, 1, 1, '2019-11-19', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:26:17', 0, '', '2019-11-19 18:26:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2323, 341, 1, 1, '2019-11-19', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:28:28', 0, '', '2019-11-19 18:28:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2324, 341, 1, 1, '2019-11-19', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:29:40', 0, '', '2019-11-19 18:29:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2325, 341, 1, 1, '2019-11-19', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:39:58', 0, '', '2019-11-19 18:39:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2326, 343, 1, 1, '2019-11-20', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:11:44', 0, '', '2019-11-20 18:11:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2327, 343, 1, 1, '2019-11-20', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:12:09', 0, '', '2019-11-20 18:12:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2328, 343, 1, 1, '2019-11-20', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:13:43', 0, '', '2019-11-20 18:13:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2329, 343, 1, 1, '2019-11-20', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:16:19', 0, '', '2019-11-20 18:16:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2330, 345, 1, 1, '2019-11-21', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '14:57:23', 0, '', '2019-11-21 14:57:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2331, 345, 1, 1, '2019-11-21', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '14:58:03', 0, '', '2019-11-21 14:58:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2332, 345, 1, 1, '2019-11-21', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:00:45', 0, '', '2019-11-21 15:00:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2333, 345, 1, 1, '2019-11-21', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:57:16', 0, '', '2019-11-21 17:57:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2334, 345, 1, 1, '2019-11-21', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:58:00', 0, '', '2019-11-21 17:58:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2335, 345, 1, 1, '2019-11-21', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:10:32', 0, '', '2019-11-21 18:10:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2336, 347, 1, 1, '2019-11-22', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '08:14:07', 0, '', '2019-11-22 08:14:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2337, 347, 1, 1, '2019-11-22', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '08:30:59', 0, '', '2019-11-22 08:30:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2338, 347, 1, 1, '2019-11-22', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:21:57', 0, '', '2019-11-22 12:21:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2339, 347, 1, 1, '2019-11-22', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:01:18', 0, '', '2019-11-22 19:01:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2340, 347, 1, 1, '2019-11-22', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:04:49', 0, '', '2019-11-22 19:04:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2341, 347, 1, 1, '2019-11-22', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:05:24', 0, '', '2019-11-22 19:05:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2342, 347, 1, 1, '2019-11-22', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:08:34', 0, '', '2019-11-22 19:08:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2343, 347, 1, 1, '2019-11-22', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:52:39', 0, '', '2019-11-22 20:52:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2344, 349, 1, 1, '2019-11-23', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:43:58', 0, '', '2019-11-23 10:43:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2345, 349, 1, 1, '2019-11-23', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:12:52', 0, '', '2019-11-23 11:12:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2346, 349, 1, 1, '2019-11-23', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:55:55', 0, '', '2019-11-23 15:55:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2347, 349, 1, 1, '2019-11-23', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:52:51', 0, '', '2019-11-23 16:52:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2348, 351, 1, 1, '2019-11-24', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:37:24', 0, '', '2019-11-24 11:37:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2349, 351, 1, 1, '2019-11-24', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:07:09', 0, '', '2019-11-24 16:07:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2350, 351, 1, 1, '2019-11-24', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:32:55', 0, '', '2019-11-24 16:32:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2351, 351, 1, 1, '2019-11-24', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:03:27', 0, '', '2019-11-24 17:03:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2352, 351, 1, 1, '2019-11-24', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:10:17', 0, '', '2019-11-24 17:10:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2353, 351, 1, 1, '2019-11-24', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:53:05', 0, '', '2019-11-24 17:53:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2354, 351, 1, 1, '2019-11-24', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:57:06', 0, '', '2019-11-24 17:57:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2355, 351, 1, 1, '2019-11-24', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:59:45', 0, '', '2019-11-24 17:59:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2356, 351, 1, 1, '2019-11-24', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:45:14', 0, '', '2019-11-24 18:45:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2357, 351, 1, 1, '2019-11-24', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:47:29', 0, '', '2019-11-24 18:47:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2358, 351, 1, 1, '2019-11-24', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:51:41', 0, '', '2019-11-24 18:51:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2359, 351, 1, 1, '2019-11-24', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:20:51', 0, '', '2019-11-24 19:20:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2360, 351, 1, 1, '2019-11-24', 29.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:21:21', 0, '', '2019-11-24 20:21:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2361, 351, 1, 1, '2019-11-24', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:31:50', 0, '', '2019-11-24 20:31:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2362, 351, 1, 1, '2019-11-24', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:36:51', 0, '', '2019-11-24 20:36:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2363, 351, 1, 1, '2019-11-24', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:32:45', 0, '', '2019-11-24 21:32:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2364, 351, 1, 1, '2019-11-24', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:39:34', 0, '', '2019-11-24 21:39:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2365, 351, 1, 1, '2019-11-24', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:42:35', 0, '', '2019-11-24 21:42:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2366, 353, 1, 1, '2019-11-26', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:11:25', 0, '', '2019-11-26 17:11:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2367, 353, 1, 1, '2019-11-26', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:22:48', 0, '', '2019-11-26 17:22:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2368, 353, 1, 1, '2019-11-26', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:26:40', 0, '', '2019-11-26 18:26:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2369, 353, 1, 1, '2019-11-26', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:28:01', 0, '', '2019-11-26 18:28:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2370, 353, 1, 1, '2019-11-26', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:06:51', 0, '', '2019-11-26 19:06:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2371, 353, 1, 1, '2019-11-26', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:34:47', 0, '', '2019-11-26 19:34:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2372, 353, 1, 1, '2019-11-26', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:59:38', 0, '', '2019-11-26 20:59:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2373, 355, 1, 1, '2019-11-27', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:14:19', 0, '', '2019-11-27 16:14:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2374, 355, 1, 1, '2019-11-27', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:15:48', 0, '', '2019-11-27 16:15:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2375, 355, 1, 1, '2019-11-27', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:16:43', 0, '', '2019-11-27 16:16:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2376, 355, 1, 1, '2019-11-27', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:17:35', 0, '', '2019-11-27 16:17:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2377, 355, 1, 1, '2019-11-27', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:21:57', 0, '', '2019-11-27 17:21:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2378, 355, 1, 1, '2019-11-27', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:23:43', 0, '', '2019-11-27 17:23:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2379, 355, 1, 1, '2019-11-27', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:21:12', 0, '', '2019-11-27 18:21:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2380, 355, 1, 1, '2019-11-27', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:54:52', 0, '', '2019-11-27 18:54:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2381, 357, 1, 1, '2019-11-28', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:51:00', 0, '', '2019-11-28 15:51:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2382, 359, 1, 1, '2019-11-29', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:18:46', 0, '', '2019-11-29 16:18:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2383, 359, 1, 1, '2019-11-29', 46.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:35:17', 0, '', '2019-11-29 16:35:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2384, 359, 1, 1, '2019-11-29', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:06:42', 0, '', '2019-11-29 17:06:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2385, 359, 1, 1, '2019-11-29', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:14:15', 0, '', '2019-11-29 17:14:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2386, 359, 1, 1, '2019-11-29', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:14:29', 0, '', '2019-11-29 17:14:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2387, 359, 1, 1, '2019-11-29', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:37:26', 0, '', '2019-11-29 17:37:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2388, 359, 1, 1, '2019-11-29', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:56:04', 0, '', '2019-11-29 17:56:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2389, 359, 1, 1, '2019-11-29', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:21:41', 0, '', '2019-11-29 18:21:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2390, 359, 1, 1, '2019-11-29', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:09:43', 0, '', '2019-11-29 20:09:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2391, 359, 1, 1, '2019-11-29', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:22:48', 0, '', '2019-11-29 21:22:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2392, 359, 1, 1, '2019-11-29', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:23:49', 0, '', '2019-11-29 21:23:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2393, 361, 1, 1, '2019-11-30', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:03:07', 0, '', '2019-11-30 16:03:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2394, 361, 1, 1, '2019-11-30', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:03:37', 0, '', '2019-11-30 16:03:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2395, 361, 1, 1, '2019-11-30', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:05:46', 0, '', '2019-11-30 16:05:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2396, 361, 1, 1, '2019-11-30', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:23:51', 0, '', '2019-11-30 16:23:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2397, 361, 1, 1, '2019-11-30', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:43:27', 0, '', '2019-11-30 16:43:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2398, 361, 1, 1, '2019-11-30', 1.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:44:04', 0, '', '2019-11-30 16:44:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2399, 361, 1, 1, '2019-11-30', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:44:47', 0, '', '2019-11-30 16:44:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2400, 361, 1, 1, '2019-11-30', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:49:00', 0, '', '2019-11-30 16:49:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2401, 361, 1, 1, '2019-11-30', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:00:58', 0, '', '2019-11-30 17:00:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2402, 361, 1, 1, '2019-11-30', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:05:28', 0, '', '2019-11-30 17:05:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2403, 361, 1, 1, '2019-11-30', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:21:57', 0, '', '2019-11-30 17:21:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2404, 361, 1, 1, '2019-11-30', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:25:32', 0, '', '2019-11-30 17:25:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2405, 361, 1, 1, '2019-11-30', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:30:09', 0, '', '2019-11-30 17:30:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2406, 361, 1, 1, '2019-11-30', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:32:47', 0, '', '2019-11-30 17:32:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2407, 361, 1, 1, '2019-11-30', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:38:17', 0, '', '2019-11-30 17:38:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2408, 361, 1, 1, '2019-11-30', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:47:37', 0, '', '2019-11-30 17:47:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2409, 361, 1, 1, '2019-11-30', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:09:24', 0, '', '2019-11-30 18:09:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2410, 361, 1, 1, '2019-11-30', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:13:06', 0, '', '2019-11-30 18:13:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2411, 361, 1, 1, '2019-11-30', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:13:45', 0, '', '2019-11-30 18:13:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2412, 361, 1, 1, '2019-11-30', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:51:30', 0, '', '2019-11-30 19:51:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2413, 363, 1, 1, '2019-12-01', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:50:00', 0, '', '2019-12-01 15:50:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2414, 363, 1, 1, '2019-12-01', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:50:58', 0, '', '2019-12-01 15:50:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2415, 367, 1, 1, '2019-12-21', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:03:12', 0, '', '2019-12-21 11:03:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2416, 367, 1, 1, '2019-12-21', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:39:02', 0, '', '2019-12-21 12:39:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2417, 367, 1, 1, '2019-12-21', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:39:50', 0, '', '2019-12-21 12:39:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2418, 367, 1, 1, '2019-12-21', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:47:01', 0, '', '2019-12-21 16:47:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2419, 367, 1, 1, '2019-12-21', 34.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:05:14', 0, '', '2019-12-21 17:05:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2420, 367, 1, 1, '2019-12-21', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:53:49', 0, '', '2019-12-21 17:53:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2421, 367, 1, 1, '2019-12-21', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:54:40', 0, '', '2019-12-21 17:54:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2422, 367, 1, 1, '2019-12-21', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:45:15', 0, '', '2019-12-21 19:45:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2423, 367, 1, 1, '2019-12-21', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:46:05', 0, '', '2019-12-21 19:46:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2424, 367, 1, 1, '2019-12-21', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:47:03', 0, '', '2019-12-21 19:47:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2425, 371, 1, 1, '2019-12-24', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:55:00', 0, '', '2019-12-24 16:55:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2426, 371, 1, 1, '2019-12-24', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:48:40', 0, '', '2019-12-24 17:48:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2427, 375, 1, 1, '2019-12-24', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:03:50', 0, '', '2019-12-24 18:03:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2428, 375, 1, 1, '2019-12-24', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:04:20', 0, '', '2019-12-24 18:04:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2429, 375, 1, 1, '2019-12-24', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:04:56', 0, '', '2019-12-24 18:04:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2430, 375, 1, 1, '2019-12-24', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:12:20', 0, '', '2019-12-24 18:12:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2431, 375, 1, 1, '2019-12-24', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:27:38', 0, '', '2019-12-24 18:27:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2432, 375, 1, 1, '2019-12-24', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:56:55', 0, '', '2019-12-24 18:56:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2433, 375, 1, 1, '2019-12-24', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:48:52', 0, '', '2019-12-24 19:48:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2434, 375, 1, 1, '2019-12-24', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:39:00', 0, '', '2019-12-24 20:39:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2435, 377, 1, 1, '2019-12-25', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:22:44', 0, '', '2019-12-25 11:22:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2436, 377, 1, 1, '2019-12-25', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:36:58', 0, '', '2019-12-25 11:36:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2437, 377, 1, 1, '2019-12-25', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:38:26', 0, '', '2019-12-25 11:38:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2438, 377, 1, 1, '2019-12-25', 25.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:41:44', 0, '', '2019-12-25 12:41:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2439, 377, 1, 1, '2019-12-25', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:34:00', 0, '', '2019-12-25 13:34:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2440, 377, 1, 1, '2019-12-25', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:16:39', 0, '', '2019-12-25 16:16:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2441, 377, 1, 1, '2019-12-25', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:17:01', 0, '', '2019-12-25 16:17:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2442, 377, 1, 1, '2019-12-25', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:20:05', 0, '', '2019-12-25 16:20:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2443, 377, 1, 1, '2019-12-25', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:35:26', 0, '', '2019-12-25 17:35:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2444, 377, 1, 1, '2019-12-25', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:15:04', 0, '', '2019-12-25 18:15:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2445, 377, 1, 1, '2019-12-25', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:18:08', 0, '', '2019-12-25 18:18:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2446, 377, 1, 1, '2019-12-25', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:43:55', 0, '', '2019-12-25 18:43:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2447, 377, 1, 1, '2019-12-25', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:44:51', 0, '', '2019-12-25 18:44:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2448, 377, 1, 1, '2019-12-25', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:48:01', 0, '', '2019-12-25 18:48:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2449, 377, 1, 1, '2019-12-25', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:50:51', 0, '', '2019-12-25 18:50:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2450, 377, 1, 1, '2019-12-25', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:44:45', 0, '', '2019-12-25 20:44:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2451, 377, 1, 1, '2019-12-25', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:45:56', 0, '', '2019-12-25 20:45:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2452, 377, 1, 1, '2019-12-25', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:49:17', 0, '', '2019-12-25 20:49:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2453, 377, 1, 1, '2019-12-25', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:52:21', 0, '', '2019-12-25 20:52:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2454, 377, 1, 1, '2019-12-25', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:03:37', 0, '', '2019-12-25 21:03:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2455, 377, 1, 1, '2019-12-25', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:04:34', 0, '', '2019-12-25 21:04:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2456, 377, 1, 1, '2019-12-25', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:06:38', 0, '', '2019-12-25 21:06:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2457, 377, 1, 1, '2019-12-25', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:08:34', 0, '', '2019-12-25 21:08:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2458, 377, 1, 1, '2019-12-25', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:11:19', 0, '', '2019-12-25 21:11:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2459, 377, 1, 1, '2019-12-25', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:52:51', 0, '', '2019-12-25 21:52:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2460, 377, 1, 1, '2019-12-25', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:01:30', 0, '', '2019-12-25 22:01:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2461, 377, 1, 1, '2019-12-25', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:25:35', 0, '', '2019-12-25 22:25:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2462, 377, 1, 1, '2019-12-25', 1.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:33:44', 0, '', '2019-12-25 22:33:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2463, 377, 1, 1, '2019-12-25', 44.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:37:23', 0, '', '2019-12-25 22:37:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2464, 377, 1, 1, '2019-12-25', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:38:36', 0, '', '2019-12-25 22:38:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2465, 377, 1, 1, '2019-12-25', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:42:20', 0, '', '2019-12-25 22:42:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2466, 377, 1, 1, '2019-12-25', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:44:43', 0, '', '2019-12-25 22:44:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2467, 379, 1, 1, '2019-12-26', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '14:37:22', 0, '', '2019-12-26 14:37:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2468, 379, 1, 1, '2019-12-26', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '14:37:51', 0, '', '2019-12-26 14:37:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2469, 379, 1, 1, '2019-12-26', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:54:26', 0, '', '2019-12-26 16:54:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2470, 379, 1, 1, '2019-12-26', 44.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:24:40', 0, '', '2019-12-26 17:24:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2471, 379, 1, 1, '2019-12-26', 86.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:24:17', 0, '', '2019-12-26 18:24:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2472, 379, 1, 1, '2019-12-26', 55.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:08:20', 0, '', '2019-12-26 19:08:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2473, 379, 1, 1, '2019-12-26', 49.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:34:34', 0, '', '2019-12-26 19:34:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2474, 379, 1, 1, '2019-12-26', 23.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:35:43', 0, '', '2019-12-26 19:35:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2475, 379, 1, 1, '2019-12-26', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:28:08', 0, '', '2019-12-26 20:28:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2476, 379, 1, 1, '2019-12-26', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:33:21', 0, '', '2019-12-26 20:33:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2477, 379, 1, 1, '2019-12-26', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:42:20', 0, '', '2019-12-26 20:42:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2478, 379, 1, 1, '2019-12-26', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:50:39', 0, '', '2019-12-26 20:50:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2479, 381, 1, 1, '2019-12-27', 30.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:10:30', 0, '', '2019-12-27 19:10:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2480, 381, 1, 1, '2019-12-28', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:31:52', 0, '', '2019-12-28 12:31:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2481, 383, 1, 1, '2019-12-28', 36.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:35:12', 0, '', '2019-12-28 12:35:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2482, 385, 1, 1, '2020-01-01', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:34:26', 0, '', '2020-01-01 11:34:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2483, 385, 1, 1, '2020-01-01', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:35:26', 0, '', '2020-01-01 11:35:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2484, 385, 1, 1, '2020-01-01', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:34:34', 0, '', '2020-01-01 16:34:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2485, 385, 1, 1, '2020-01-01', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:38:31', 0, '', '2020-01-01 16:38:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2486, 385, 1, 1, '2020-01-01', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:40:50', 0, '', '2020-01-01 16:40:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2487, 385, 1, 1, '2020-01-01', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:42:36', 2, '001-78', '2020-01-01 16:42:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2488, 385, 1, 1, '2020-01-01', 0.10, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:44:55', 0, '', '2020-01-01 16:44:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2489, 385, 1, 1, '2020-01-01', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:32:00', 0, '', '2020-01-01 17:32:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2490, 385, 1, 1, '2020-01-01', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:56:56', 0, '', '2020-01-01 18:56:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2491, 389, 1, 1, '2020-01-03', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:52:07', 2, '001-79', '2020-01-03 11:52:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2492, 389, 1, 1, '2020-01-03', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:52:39', 0, '', '2020-01-03 15:52:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2493, 389, 1, 1, '2020-01-03', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:43:19', 0, '', '2020-01-03 17:43:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2494, 389, 1, 1, '2020-01-03', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:44:11', 0, '', '2020-01-03 17:44:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2495, 391, 1, 1, '2020-01-04', 48.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:45:00', 0, '', '2020-01-04 15:45:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2496, 391, 1, 1, '2020-01-04', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:57:53', 0, '', '2020-01-04 15:57:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2497, 393, 1, 1, '2020-01-04', 24.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:16:43', 0, '', '2020-01-04 18:16:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2498, 393, 1, 1, '2020-01-04', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:17:19', 0, '', '2020-01-04 18:17:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2499, 393, 1, 1, '2020-01-04', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:20:33', 0, '', '2020-01-04 18:20:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2500, 393, 1, 1, '2020-01-04', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:35:14', 0, '', '2020-01-04 19:35:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2501, 393, 1, 1, '2020-01-04', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:38:23', 0, '', '2020-01-04 19:38:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2502, 393, 1, 1, '2020-01-04', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:43:02', 0, '', '2020-01-04 19:43:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2503, 393, 1, 1, '2020-01-05', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:50:39', 0, '', '2020-01-05 11:50:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2504, 393, 1, 1, '2020-01-05', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:51:32', 0, '', '2020-01-05 11:51:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2505, 395, 1, 1, '2020-01-05', 32.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:53:26', 0, '', '2020-01-05 11:53:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2506, 395, 1, 1, '2020-01-05', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:33:02', 0, '', '2020-01-05 17:33:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2507, 395, 1, 1, '2020-01-05', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:33:50', 0, '', '2020-01-05 17:33:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2508, 395, 1, 1, '2020-01-05', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:34:39', 0, '', '2020-01-05 17:34:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2509, 395, 1, 1, '2020-01-05', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:35:03', 0, '', '2020-01-05 18:35:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2510, 395, 1, 1, '2020-01-05', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:46:13', 0, '', '2020-01-05 19:46:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2511, 397, 1, 1, '2020-01-06', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:03:59', 0, '', '2020-01-06 13:03:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2512, 397, 1, 1, '2020-01-06', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:08:40', 0, '', '2020-01-06 13:08:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2513, 397, 1, 1, '2020-01-06', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:17:32', 0, '', '2020-01-06 13:17:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2514, 397, 1, 1, '2020-01-06', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:45:01', 0, '', '2020-01-06 16:45:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2515, 397, 1, 1, '2020-01-06', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:45:57', 0, '', '2020-01-06 16:45:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2516, 397, 1, 1, '2020-01-06', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:46:58', 0, '', '2020-01-06 16:46:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2517, 397, 1, 1, '2020-01-06', 36.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:57:36', 0, '', '2020-01-06 17:57:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2518, 397, 1, 1, '2020-01-06', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:58:12', 0, '', '2020-01-06 17:58:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2519, 401, 1, 1, '2020-01-12', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:50:21', 0, '', '2020-01-12 16:50:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2520, 401, 1, 1, '2020-01-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:50:41', 0, '', '2020-01-12 16:50:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2521, 401, 1, 1, '2020-01-12', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:50:53', 0, '', '2020-01-12 16:50:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2522, 401, 1, 1, '2020-01-12', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:51:30', 0, '', '2020-01-12 16:51:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2523, 401, 1, 1, '2020-01-12', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:54:46', 0, '', '2020-01-12 16:54:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2524, 401, 1, 1, '2020-01-12', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:45:06', 0, '', '2020-01-12 17:45:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2525, 401, 1, 1, '2020-01-12', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:45:34', 0, '', '2020-01-12 17:45:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2526, 401, 1, 1, '2020-01-12', 25.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:04:44', 0, '', '2020-01-12 18:04:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2527, 401, 1, 1, '2020-01-12', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:16:28', 0, '', '2020-01-12 18:16:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2528, 401, 1, 1, '2020-01-12', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:33:26', 0, '', '2020-01-12 18:33:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2529, 401, 1, 1, '2020-01-12', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:01:43', 0, '', '2020-01-12 20:01:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2530, 403, 1, 1, '2020-01-13', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:52:00', 0, '', '2020-01-13 15:52:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2531, 403, 1, 1, '2020-01-13', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:02:02', 0, '', '2020-01-13 16:02:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2532, 403, 1, 1, '2020-01-13', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:03:53', 0, '', '2020-01-13 19:03:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2533, 403, 1, 1, '2020-01-13', 54.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:11:54', 0, '', '2020-01-13 21:11:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2534, 403, 1, 1, '2020-01-13', 28.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:34:52', 0, '', '2020-01-13 21:34:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2535, 403, 1, 1, '2020-01-13', 30.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:35:41', 0, '', '2020-01-13 21:35:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2536, 405, 1, 1, '2020-01-14', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:59:34', 0, '', '2020-01-14 10:59:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2537, 405, 1, 1, '2020-01-14', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:37:41', 0, '', '2020-01-14 12:37:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2538, 405, 1, 1, '2020-01-14', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:59:51', 0, '', '2020-01-14 15:59:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2539, 405, 1, 1, '2020-01-14', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:09:03', 0, '', '2020-01-14 16:09:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2540, 405, 1, 1, '2020-01-14', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:39:51', 0, '', '2020-01-14 18:39:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2541, 405, 1, 1, '2020-01-14', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:54:57', 0, '', '2020-01-14 18:54:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2542, 405, 1, 1, '2020-01-14', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:55:20', 0, '', '2020-01-14 18:55:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2543, 405, 1, 1, '2020-01-14', 31.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:14:04', 0, '', '2020-01-14 20:14:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2544, 407, 1, 1, '2020-01-15', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:57:32', 0, '', '2020-01-15 10:57:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2545, 407, 1, 1, '2020-01-15', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:04:35', 0, '', '2020-01-15 12:04:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2546, 407, 1, 1, '2020-01-15', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:40:22', 0, '', '2020-01-15 12:40:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2547, 407, 1, 1, '2020-01-15', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:01:53', 0, '', '2020-01-15 13:01:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2548, 407, 1, 1, '2020-01-15', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:52:20', 0, '', '2020-01-15 15:52:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2549, 407, 1, 1, '2020-01-15', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:28:59', 0, '', '2020-01-15 16:28:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2550, 407, 1, 1, '2020-01-15', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:54:32', 0, '', '2020-01-15 18:54:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2551, 407, 1, 1, '2020-01-16', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:52:56', 0, '', '2020-01-16 10:52:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2552, 409, 1, 1, '2020-01-16', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:10:43', 0, '', '2020-01-16 12:10:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2553, 409, 1, 1, '2020-01-16', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:32:08', 0, '', '2020-01-16 12:32:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2554, 413, 1, 1, '2020-01-16', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:22:59', 0, '', '2020-01-16 15:22:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2555, 413, 1, 1, '2020-01-16', 24.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:25:21', 0, '', '2020-01-16 17:25:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2556, 413, 1, 1, '2020-01-16', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:29:43', 0, '', '2020-01-16 17:29:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2557, 413, 1, 1, '2020-01-17', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:26:02', 0, '', '2020-01-17 12:26:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2558, 413, 1, 1, '2020-01-17', 30.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:26:31', 0, '', '2020-01-17 12:26:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2559, 413, 1, 1, '2020-01-17', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:27:46', 0, '', '2020-01-17 12:27:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2560, 413, 1, 1, '2020-01-17', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:30:00', 0, '', '2020-01-17 12:30:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2561, 415, 1, 1, '2020-01-17', 30.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:31:00', 0, '', '2020-01-17 12:31:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2562, 415, 1, 1, '2020-01-17', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:31:34', 0, '', '2020-01-17 12:31:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2563, 415, 1, 1, '2020-01-17', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:31:55', 0, '', '2020-01-17 12:31:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2564, 415, 1, 1, '2020-01-17', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:54:42', 0, '', '2020-01-17 17:54:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2565, 415, 1, 1, '2020-01-17', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:55:01', 0, '', '2020-01-17 17:55:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2566, 417, 1, 1, '2020-01-18', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '09:09:32', 0, '', '2020-01-18 09:09:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2567, 419, 1, 1, '2020-01-18', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:38:39', 0, '', '2020-01-18 12:38:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2568, 421, 1, 1, '2020-01-19', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '14:56:10', 0, '', '2020-01-19 14:56:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2569, 421, 1, 1, '2020-01-19', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:34:12', 0, '', '2020-01-19 15:34:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2570, 421, 1, 1, '2020-01-19', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:15:39', 0, '', '2020-01-19 16:15:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2571, 421, 1, 1, '2020-01-19', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:16:08', 0, '', '2020-01-19 16:16:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2572, 421, 1, 1, '2020-01-19', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:26:12', 0, '', '2020-01-19 16:26:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2573, 421, 1, 1, '2020-01-19', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:12:30', 0, '', '2020-01-19 18:12:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2574, 421, 1, 1, '2020-01-19', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:35:26', 0, '', '2020-01-19 18:35:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2575, 421, 1, 1, '2020-01-19', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:51:42', 0, '', '2020-01-19 18:51:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2576, 421, 1, 1, '2020-01-19', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:03:41', 0, '', '2020-01-19 21:03:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2577, 421, 1, 1, '2020-01-19', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:10:39', 0, '', '2020-01-19 21:10:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2578, 421, 1, 1, '2020-01-19', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:25:27', 0, '', '2020-01-19 21:25:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2579, 423, 1, 1, '2020-01-20', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:37:37', 0, '', '2020-01-20 11:37:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2580, 423, 1, 1, '2020-01-20', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:24:48', 0, '', '2020-01-20 12:24:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2581, 423, 1, 1, '2020-01-20', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:53:14', 0, '', '2020-01-20 12:53:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2582, 423, 1, 1, '2020-01-20', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:46:02', 0, '', '2020-01-20 15:46:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2583, 423, 1, 1, '2020-01-20', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:46:17', 0, '', '2020-01-20 15:46:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2584, 423, 1, 1, '2020-01-20', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:56:56', 0, '', '2020-01-20 15:56:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2585, 423, 1, 1, '2020-01-20', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:00:55', 0, '', '2020-01-20 16:00:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2586, 423, 1, 1, '2020-01-20', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:35:22', 0, '', '2020-01-20 17:35:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2587, 423, 1, 1, '2020-01-20', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:58:13', 0, '', '2020-01-20 17:58:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2588, 423, 1, 1, '2020-01-20', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:17:45', 0, '', '2020-01-20 18:17:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2589, 423, 1, 1, '2020-01-20', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:24:11', 0, '', '2020-01-20 19:24:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2590, 423, 1, 1, '2020-01-20', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:09:43', 0, '', '2020-01-20 20:09:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2591, 423, 1, 1, '2020-01-20', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:11:43', 0, '', '2020-01-20 20:11:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2592, 423, 1, 1, '2020-01-20', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:15:41', 0, '', '2020-01-20 20:15:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2593, 425, 1, 1, '2020-01-21', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:31:03', 0, '', '2020-01-21 15:31:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2594, 425, 1, 1, '2020-01-21', 27.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:15:13', 0, '', '2020-01-21 17:15:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2595, 425, 1, 1, '2020-01-21', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:35:23', 0, '', '2020-01-21 17:35:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2596, 427, 1, 1, '2020-01-22', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:58:41', 0, '', '2020-01-22 10:58:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2597, 427, 1, 1, '2020-01-23', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:50:17', 0, '', '2020-01-23 16:50:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2598, 427, 1, 1, '2020-01-23', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:04:07', 0, '', '2020-01-23 17:04:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2599, 427, 1, 1, '2020-01-23', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:23:54', 0, '', '2020-01-23 17:23:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2600, 429, 1, 1, '2020-01-23', 23.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:38:14', 0, '', '2020-01-23 17:38:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2601, 429, 1, 1, '2020-01-23', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:47:30', 0, '', '2020-01-23 18:47:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2602, 429, 1, 1, '2020-01-23', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:02:33', 0, '', '2020-01-23 19:02:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2603, 431, 1, 1, '2020-01-24', 26.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:05:58', 0, '', '2020-01-24 16:05:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2604, 431, 1, 1, '2020-01-24', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:07:27', 0, '', '2020-01-24 16:07:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2605, 431, 1, 1, '2020-01-24', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:26:50', 0, '', '2020-01-24 16:26:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2606, 431, 1, 1, '2020-01-24', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:27:10', 0, '', '2020-01-24 16:27:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2607, 431, 1, 1, '2020-01-24', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:36:19', 0, '', '2020-01-24 17:36:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2608, 431, 1, 1, '2020-01-24', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:21:41', 0, '', '2020-01-24 18:21:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2609, 431, 1, 1, '2020-01-24', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:13:46', 0, '', '2020-01-24 19:13:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2610, 431, 1, 1, '2020-01-24', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:34:11', 0, '', '2020-01-24 20:34:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2611, 431, 1, 1, '2020-01-24', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:41:11', 0, '', '2020-01-24 20:41:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2612, 431, 1, 1, '2020-01-24', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:50:12', 0, '', '2020-01-24 20:50:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2613, 431, 1, 1, '2020-01-24', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:03:45', 0, '', '2020-01-24 21:03:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2614, 433, 1, 1, '2020-01-25', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:11:15', 0, '', '2020-01-25 12:11:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2615, 433, 1, 1, '2020-01-25', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:19:32', 0, '', '2020-01-25 12:19:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2616, 433, 1, 1, '2020-01-25', 24.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:56:34', 0, '', '2020-01-25 15:56:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2617, 433, 1, 1, '2020-01-25', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:00:23', 0, '', '2020-01-25 17:00:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2618, 433, 1, 1, '2020-01-25', 49.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:24:35', 0, '', '2020-01-25 18:24:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2619, 433, 1, 1, '2020-01-25', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:49:04', 0, '', '2020-01-25 19:49:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2620, 433, 1, 1, '2020-01-25', 44.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:07:52', 0, '', '2020-01-25 21:07:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2621, 433, 1, 1, '2020-01-25', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:56:53', 0, '', '2020-01-25 21:56:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2622, 435, 1, 1, '2020-01-26', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:04:38', 0, '', '2020-01-26 12:04:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2623, 435, 1, 1, '2020-01-26', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:42:14', 0, '', '2020-01-26 12:42:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2624, 435, 1, 1, '2020-01-26', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:44:19', 0, '', '2020-01-26 12:44:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2625, 435, 1, 1, '2020-01-26', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:20:30', 0, '', '2020-01-26 13:20:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2626, 435, 1, 1, '2020-01-26', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:33:26', 0, '', '2020-01-26 13:33:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2627, 435, 1, 1, '2020-01-26', 28.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:43:39', 0, '', '2020-01-26 15:43:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2628, 435, 1, 1, '2020-01-26', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:50:23', 0, '', '2020-01-26 15:50:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2629, 435, 1, 1, '2020-01-26', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:00:25', 0, '', '2020-01-26 16:00:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2630, 435, 1, 1, '2020-01-26', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:36:19', 0, '', '2020-01-26 16:36:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2631, 435, 1, 1, '2020-01-26', 27.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:06:25', 0, '', '2020-01-26 17:06:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2632, 435, 1, 1, '2020-01-26', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:07:23', 0, '', '2020-01-26 17:07:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2633, 435, 1, 1, '2020-01-26', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:08:42', 0, '', '2020-01-26 17:08:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2634, 435, 1, 1, '2020-01-26', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:14:24', 0, '', '2020-01-26 17:14:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2635, 435, 1, 1, '2020-01-26', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:13:29', 0, '', '2020-01-26 18:13:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2636, 435, 1, 1, '2020-01-26', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:14:27', 0, '', '2020-01-26 18:14:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2637, 435, 1, 1, '2020-01-26', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:41:59', 0, '', '2020-01-26 18:41:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2638, 435, 1, 1, '2020-01-26', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:44:29', 0, '', '2020-01-26 18:44:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2639, 435, 1, 1, '2020-01-26', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:54:19', 0, '', '2020-01-26 18:54:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2640, 435, 1, 1, '2020-01-26', 24.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:56:13', 0, '', '2020-01-26 18:56:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2641, 435, 1, 1, '2020-01-26', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:29:46', 0, '', '2020-01-26 19:29:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2642, 435, 1, 1, '2020-01-26', 43.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:27:42', 0, '', '2020-01-26 20:27:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2643, 435, 1, 1, '2020-01-26', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:29:52', 0, '', '2020-01-26 20:29:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2644, 435, 1, 1, '2020-01-26', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:30:25', 0, '', '2020-01-26 20:30:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2645, 435, 1, 1, '2020-01-26', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:51:10', 0, '', '2020-01-26 20:51:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2646, 435, 1, 1, '2020-01-26', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:01:29', 0, '', '2020-01-26 21:01:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2647, 435, 1, 1, '2020-01-26', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:10:06', 0, '', '2020-01-26 21:10:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2648, 435, 1, 1, '2020-01-26', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:14:43', 0, '', '2020-01-26 21:14:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2649, 435, 1, 1, '2020-01-26', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:47:29', 0, '', '2020-01-26 21:47:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2650, 437, 1, 1, '2020-01-27', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:36:03', 0, '', '2020-01-27 16:36:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2651, 441, 1, 1, '2020-01-28', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:45:29', 0, '', '2020-01-28 17:45:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2652, 441, 1, 1, '2020-01-28', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:26:37', 0, '', '2020-01-28 19:26:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2653, 441, 1, 1, '2020-01-28', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:31:51', 0, '', '2020-01-28 19:31:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2654, 441, 1, 1, '2020-01-28', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:32:13', 0, '', '2020-01-28 19:32:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2655, 441, 1, 1, '2020-01-28', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:06:07', 0, '', '2020-01-28 20:06:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2656, 441, 1, 1, '2020-01-28', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:40:16', 0, '', '2020-01-28 21:40:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2657, 441, 1, 1, '2020-01-28', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:43:37', 0, '', '2020-01-28 21:43:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2658, 441, 1, 1, '2020-01-28', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:54:38', 0, '', '2020-01-28 21:54:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2659, 443, 1, 1, '2020-01-29', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:41:33', 0, '', '2020-01-29 16:41:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2660, 443, 1, 1, '2020-01-29', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:50:06', 0, '', '2020-01-29 16:50:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2661, 443, 1, 1, '2020-01-29', 35.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:16:56', 0, '', '2020-01-29 19:16:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2662, 443, 1, 1, '2020-01-29', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:53:18', 0, '', '2020-01-29 20:53:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2663, 443, 1, 1, '2020-01-29', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:10:07', 0, '', '2020-01-29 22:10:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2664, 445, 1, 1, '2020-01-30', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:58:10', 0, '', '2020-01-30 10:58:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2665, 445, 1, 1, '2020-01-30', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:55:01', 0, '', '2020-01-30 15:55:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2666, 445, 1, 1, '2020-01-30', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:08:54', 0, '', '2020-01-30 16:08:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2667, 445, 1, 1, '2020-01-30', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:10:25', 0, '', '2020-01-30 16:10:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2668, 445, 1, 1, '2020-01-30', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:14:08', 0, '', '2020-01-30 16:14:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2669, 445, 1, 1, '2020-01-30', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:19:12', 0, '', '2020-01-30 16:19:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2670, 445, 1, 1, '2020-01-30', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:18:29', 0, '', '2020-01-30 18:18:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2671, 445, 1, 1, '2020-01-30', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:19:01', 0, '', '2020-01-30 18:19:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2672, 445, 1, 1, '2020-01-30', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:33:42', 0, '', '2020-01-30 18:33:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2673, 445, 1, 1, '2020-01-30', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:36:26', 0, '', '2020-01-30 19:36:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2674, 445, 1, 1, '2020-01-30', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:10:35', 0, '', '2020-01-30 20:10:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2675, 445, 1, 1, '2020-01-30', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:41:56', 0, '', '2020-01-30 20:41:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2676, 445, 1, 1, '2020-01-30', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:58:33', 0, '', '2020-01-30 20:58:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2677, 445, 1, 1, '2020-01-30', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:59:18', 0, '', '2020-01-30 20:59:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2678, 445, 1, 1, '2020-01-30', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:22:58', 0, '', '2020-01-30 21:22:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2679, 445, 1, 1, '2020-01-30', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:41:20', 0, '', '2020-01-30 21:41:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2680, 445, 1, 1, '2020-01-30', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:10:17', 0, '', '2020-01-30 22:10:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2681, 447, 1, 1, '2020-01-31', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:42:11', 0, '', '2020-01-31 16:42:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2682, 447, 1, 1, '2020-01-31', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:26:38', 0, '', '2020-01-31 17:26:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2683, 447, 1, 1, '2020-01-31', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:36:36', 0, '', '2020-01-31 17:36:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2684, 447, 1, 1, '2020-01-31', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:44:59', 0, '', '2020-01-31 17:44:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2685, 447, 1, 1, '2020-01-31', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:21:22', 0, '', '2020-01-31 18:21:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2686, 447, 1, 1, '2020-01-31', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:26:04', 0, '', '2020-01-31 18:26:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2687, 447, 1, 1, '2020-01-31', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:21:22', 0, '', '2020-01-31 20:21:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2688, 447, 1, 1, '2020-02-01', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:49:14', 0, '', '2020-02-01 17:49:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2689, 447, 1, 1, '2020-02-01', 46.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:32:26', 0, '', '2020-02-01 19:32:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2690, 449, 1, 1, '2020-02-01', 73.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:17:47', 0, '', '2020-02-01 20:17:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2691, 451, 1, 1, '2020-02-01', 63.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:18:37', 0, '', '2020-02-01 20:18:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2692, 451, 1, 1, '2020-02-01', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:19:32', 0, '', '2020-02-01 20:19:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2693, 453, 1, 1, '2020-02-02', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:33:07', 0, '', '2020-02-02 11:33:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2694, 453, 1, 1, '2020-02-02', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:42:06', 0, '', '2020-02-02 12:42:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2695, 453, 1, 1, '2020-02-02', 32.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:59:37', 0, '', '2020-02-02 15:59:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2696, 453, 1, 1, '2020-02-02', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:19:07', 0, '', '2020-02-02 16:19:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2697, 453, 1, 1, '2020-02-02', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:41:09', 0, '', '2020-02-02 16:41:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2698, 453, 1, 1, '2020-02-02', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:42:15', 0, '', '2020-02-02 16:42:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2699, 453, 1, 1, '2020-02-02', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:45:47', 0, '', '2020-02-02 16:45:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2700, 453, 1, 1, '2020-02-02', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:50:34', 0, '', '2020-02-02 16:50:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2701, 453, 1, 1, '2020-02-02', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:51:25', 0, '', '2020-02-02 16:51:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2702, 453, 1, 1, '2020-02-02', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:45:38', 0, '', '2020-02-02 20:45:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2703, 453, 1, 1, '2020-02-02', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:45:59', 0, '', '2020-02-02 20:45:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2704, 453, 1, 1, '2020-02-02', 69.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:06:55', 0, '', '2020-02-02 21:06:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2705, 453, 1, 1, '2020-02-02', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:27:32', 0, '', '2020-02-02 21:27:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2706, 453, 1, 1, '2020-02-02', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:36:47', 0, '', '2020-02-02 21:36:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2707, 455, 1, 1, '2020-02-03', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:25:25', 0, '', '2020-02-03 16:25:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2708, 455, 1, 1, '2020-02-03', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:45:26', 0, '', '2020-02-03 16:45:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2709, 455, 1, 1, '2020-02-03', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:21:16', 0, '', '2020-02-03 17:21:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2710, 455, 1, 1, '2020-02-03', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:24:09', 0, '', '2020-02-03 17:24:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2711, 455, 1, 1, '2020-02-03', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:16:47', 0, '', '2020-02-03 18:16:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2712, 455, 1, 1, '2020-02-03', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:21:57', 0, '', '2020-02-03 19:21:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2713, 455, 1, 1, '2020-02-03', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:08:38', 0, '', '2020-02-03 20:08:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2714, 455, 1, 1, '2020-02-03', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:09:12', 0, '', '2020-02-03 20:09:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2715, 455, 1, 1, '2020-02-03', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:50:58', 0, '', '2020-02-03 20:50:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2716, 455, 1, 1, '2020-02-03', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:21:40', 0, '', '2020-02-03 21:21:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2717, 455, 1, 1, '2020-02-03', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:31:44', 0, '', '2020-02-03 21:31:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2718, 455, 1, 1, '2020-02-03', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:45:50', 0, '', '2020-02-03 21:45:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2719, 455, 1, 1, '2020-02-03', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:46:06', 0, '', '2020-02-03 21:46:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2720, 455, 1, 1, '2020-02-03', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:46:29', 0, '', '2020-02-03 21:46:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2721, 455, 1, 1, '2020-02-03', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:47:25', 0, '', '2020-02-03 21:47:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2722, 455, 1, 1, '2020-02-03', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:48:30', 0, '', '2020-02-03 21:48:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2723, 459, 1, 1, '2020-02-05', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:56:39', 0, '', '2020-02-05 15:56:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2724, 459, 1, 1, '2020-02-05', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:35:16', 0, '', '2020-02-05 16:35:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2725, 459, 1, 1, '2020-02-05', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:56:47', 0, '', '2020-02-05 16:56:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2726, 459, 1, 1, '2020-02-05', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:10:45', 0, '', '2020-02-05 17:10:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2727, 459, 1, 1, '2020-02-05', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:18:20', 0, '', '2020-02-05 17:18:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2728, 459, 1, 1, '2020-02-05', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:20:18', 0, '', '2020-02-05 17:20:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2729, 459, 1, 1, '2020-02-05', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:04:35', 0, '', '2020-02-05 18:04:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2730, 459, 1, 1, '2020-02-05', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:06:35', 0, '', '2020-02-05 19:06:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2731, 459, 1, 1, '2020-02-05', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:23:26', 0, '', '2020-02-05 19:23:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2732, 459, 1, 1, '2020-02-05', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:16:33', 0, '', '2020-02-05 21:16:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2733, 459, 1, 1, '2020-02-05', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:19:39', 0, '', '2020-02-05 21:19:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2734, 459, 1, 1, '2020-02-05', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:22:35', 0, '', '2020-02-05 21:22:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2735, 461, 1, 1, '2020-02-06', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:10:14', 0, '', '2020-02-06 10:10:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2736, 461, 1, 1, '2020-02-06', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:27:36', 0, '', '2020-02-06 11:27:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2737, 461, 1, 1, '2020-02-06', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:27:49', 0, '', '2020-02-06 11:27:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2738, 461, 1, 1, '2020-02-06', 24.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:06:50', 0, '', '2020-02-06 16:06:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2739, 461, 1, 1, '2020-02-06', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:36:18', 0, '', '2020-02-06 16:36:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2740, 461, 1, 1, '2020-02-06', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:34:21', 0, '', '2020-02-06 17:34:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2741, 461, 1, 1, '2020-02-06', 27.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:37:30', 0, '', '2020-02-06 17:37:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2742, 461, 1, 1, '2020-02-06', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:40:50', 0, '', '2020-02-06 17:40:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2743, 461, 1, 1, '2020-02-06', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:11:45', 0, '', '2020-02-06 19:11:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2744, 461, 1, 1, '2020-02-06', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:12:18', 0, '', '2020-02-06 19:12:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2745, 462, 1, 3, '2020-02-06', 10.00, 1, 'se empezo con 40 no con 50 hago esto para cuadrar caja', '19:42:26', 5, '', '2020-02-06 19:42:26', NULL, NULL, NULL, 3.36, 1);
INSERT INTO `movimiento` VALUES (2746, 461, 1, 3, '2020-02-06', 10.00, 1, 'se empezo con 40 no con 50 hago esto para cuadrar caja', '19:43:25', 5, '', '2020-02-06 19:43:25', NULL, NULL, NULL, 3.36, 1);
INSERT INTO `movimiento` VALUES (2747, 461, 1, 1, '2020-02-06', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:33:52', 0, '', '2020-02-06 20:33:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2748, 463, 1, 1, '2020-02-07', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:32:02', 0, '', '2020-02-07 16:32:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2749, 463, 1, 1, '2020-02-07', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:01:38', 0, '', '2020-02-07 19:01:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2750, 465, 1, 1, '2020-02-08', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:42:04', 0, '', '2020-02-08 16:42:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2751, 465, 1, 1, '2020-02-08', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:59:56', 0, '', '2020-02-08 16:59:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2752, 465, 1, 1, '2020-02-08', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:04:50', 0, '', '2020-02-08 17:04:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2753, 465, 1, 1, '2020-02-08', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:32:48', 0, '', '2020-02-08 18:32:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2754, 465, 1, 1, '2020-02-08', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:10:18', 0, '', '2020-02-08 19:10:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2755, 465, 1, 1, '2020-02-08', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:16:22', 0, '', '2020-02-08 20:16:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2756, 465, 1, 1, '2020-02-08', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:21:07', 0, '', '2020-02-08 20:21:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2757, 465, 1, 1, '2020-02-08', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:01:06', 0, '', '2020-02-08 21:01:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2758, 465, 1, 1, '2020-02-08', 24.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:01:51', 0, '', '2020-02-08 21:01:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2759, 465, 1, 1, '2020-02-08', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:04:37', 0, '', '2020-02-08 21:04:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2760, 465, 1, 1, '2020-02-08', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:10:10', 0, '', '2020-02-08 21:10:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2761, 465, 1, 1, '2020-02-08', 55.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:09:05', 0, '', '2020-02-08 22:09:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2762, 465, 1, 1, '2020-02-08', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:09:41', 0, '', '2020-02-08 22:09:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2763, 467, 1, 1, '2020-02-09', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:18:18', 0, '', '2020-02-09 12:18:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2764, 467, 1, 1, '2020-02-09', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:31:20', 0, '', '2020-02-09 12:31:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2765, 467, 1, 1, '2020-02-09', 23.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:15:36', 0, '', '2020-02-09 17:15:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2766, 467, 1, 1, '2020-02-09', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:53:31', 0, '', '2020-02-09 18:53:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2767, 467, 1, 1, '2020-02-09', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:16:09', 0, '', '2020-02-09 19:16:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2768, 467, 1, 1, '2020-02-09', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:42:03', 0, '', '2020-02-09 19:42:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2769, 467, 1, 1, '2020-02-09', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:44:24', 0, '', '2020-02-09 19:44:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2770, 467, 1, 1, '2020-02-09', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:45:31', 0, '', '2020-02-09 20:45:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2771, 467, 1, 1, '2020-02-09', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:45:44', 0, '', '2020-02-09 20:45:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2772, 467, 1, 1, '2020-02-09', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:34:16', 0, '', '2020-02-09 21:34:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2773, 469, 1, 1, '2020-02-10', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:38:46', 0, '', '2020-02-10 12:38:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2774, 469, 1, 1, '2020-02-10', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:01:57', 0, '', '2020-02-10 16:01:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2775, 469, 1, 1, '2020-02-10', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:07:13', 0, '', '2020-02-10 16:07:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2776, 469, 1, 3, '2020-02-10', 8.00, 1, 'se empezo con 40 no con 50 hago esto para cuadrar caja', '16:13:27', 0, 'asdasd', '2020-02-10 16:13:27', NULL, NULL, NULL, 3.39, 1);
INSERT INTO `movimiento` VALUES (2777, 469, 1, 1, '2020-02-10', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:30:12', 0, '', '2020-02-10 16:30:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2778, 469, 1, 1, '2020-02-10', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:36:22', 0, '', '2020-02-10 16:36:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2779, 469, 1, 1, '2020-02-10', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:49:21', 0, '', '2020-02-10 17:49:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2780, 469, 1, 1, '2020-02-10', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:51:32', 0, '', '2020-02-10 18:51:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2781, 469, 1, 1, '2020-02-10', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:04:32', 0, '', '2020-02-10 20:04:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2782, 471, 1, 1, '2020-02-11', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:30:24', 0, '', '2020-02-11 11:30:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2783, 471, 1, 1, '2020-02-11', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:35:59', 0, '', '2020-02-11 11:35:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2784, 471, 1, 1, '2020-02-11', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:45:38', 0, '', '2020-02-11 11:45:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2785, 471, 1, 1, '2020-02-11', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:07:54', 0, '', '2020-02-11 12:07:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2786, 471, 1, 1, '2020-02-11', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:10:59', 0, '', '2020-02-11 12:10:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2787, 471, 1, 1, '2020-02-11', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:03:09', 0, '', '2020-02-11 16:03:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2788, 471, 1, 1, '2020-02-11', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:03:56', 0, '', '2020-02-11 16:03:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2789, 471, 1, 1, '2020-02-11', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:08:06', 0, '', '2020-02-11 16:08:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2790, 471, 1, 1, '2020-02-11', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:23:01', 0, '', '2020-02-11 16:23:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2791, 471, 1, 1, '2020-02-11', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:28:22', 0, '', '2020-02-11 16:28:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2792, 471, 1, 1, '2020-02-11', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:32:08', 0, '', '2020-02-11 16:32:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2793, 471, 1, 1, '2020-02-11', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:38:12', 0, '', '2020-02-11 16:38:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2794, 471, 1, 1, '2020-02-11', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:45:50', 0, '', '2020-02-11 16:45:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2795, 471, 1, 1, '2020-02-11', 40.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:36:51', 0, '', '2020-02-11 17:36:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2796, 471, 1, 1, '2020-02-11', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:40:35', 0, '', '2020-02-11 17:40:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2797, 471, 1, 1, '2020-02-11', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:41:15', 0, '', '2020-02-11 17:41:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2798, 471, 1, 1, '2020-02-11', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:59:16', 0, '', '2020-02-11 17:59:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2799, 471, 1, 1, '2020-02-11', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:59:25', 0, '', '2020-02-11 17:59:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2800, 471, 1, 1, '2020-02-11', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:38:49', 0, '', '2020-02-11 18:38:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2801, 471, 1, 1, '2020-02-11', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:40:28', 0, '', '2020-02-11 19:40:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2802, 471, 1, 1, '2020-02-11', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:40:40', 0, '', '2020-02-11 19:40:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2803, 471, 1, 1, '2020-02-11', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:40:54', 0, '', '2020-02-11 19:40:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2804, 473, 1, 1, '2020-02-12', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:30:39', 0, '', '2020-02-12 11:30:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2805, 473, 1, 1, '2020-02-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:16:36', 0, '', '2020-02-12 12:16:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2806, 473, 1, 1, '2020-02-12', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:12:01', 0, '', '2020-02-12 16:12:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2807, 473, 1, 1, '2020-02-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:45:13', 0, '', '2020-02-12 16:45:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2808, 473, 1, 1, '2020-02-12', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:01:45', 0, '', '2020-02-12 17:01:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2809, 473, 1, 1, '2020-02-12', 36.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:39:47', 0, '', '2020-02-12 17:39:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2810, 473, 1, 1, '2020-02-12', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:35:48', 0, '', '2020-02-12 18:35:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2811, 473, 1, 1, '2020-02-12', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:51:59', 0, '', '2020-02-12 18:51:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2812, 473, 1, 1, '2020-02-12', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:52:36', 0, '', '2020-02-12 18:52:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2813, 473, 1, 1, '2020-02-12', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:59:15', 0, '', '2020-02-12 18:59:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2814, 475, 1, 1, '2020-02-13', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:12:10', 0, '', '2020-02-13 11:12:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2815, 475, 1, 1, '2020-02-13', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:47:05', 0, '', '2020-02-13 11:47:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2816, 475, 1, 1, '2020-02-13', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:29:59', 0, '', '2020-02-13 12:29:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2817, 475, 1, 1, '2020-02-13', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:05:42', 0, '', '2020-02-13 13:05:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2818, 475, 1, 1, '2020-02-13', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:44:56', 0, '', '2020-02-13 15:44:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2819, 475, 1, 1, '2020-02-13', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:46:12', 0, '', '2020-02-13 16:46:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2820, 475, 1, 1, '2020-02-13', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:08:31', 0, '', '2020-02-13 17:08:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2821, 475, 1, 1, '2020-02-13', 35.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:41:03', 0, '', '2020-02-13 17:41:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2822, 475, 1, 1, '2020-02-13', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:22:13', 0, '', '2020-02-13 18:22:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2823, 475, 1, 1, '2020-02-13', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:50:58', 0, '', '2020-02-13 18:50:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2824, 475, 1, 1, '2020-02-13', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:54:27', 0, '', '2020-02-13 20:54:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2825, 475, 1, 1, '2020-02-13', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:13:02', 0, '', '2020-02-13 21:13:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2826, 475, 1, 1, '2020-02-13', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:11:58', 0, '', '2020-02-13 22:11:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2827, 477, 1, 1, '2020-02-14', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:59:59', 0, '', '2020-02-14 11:59:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2828, 477, 1, 1, '2020-02-14', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:05:44', 0, '', '2020-02-14 13:05:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2829, 477, 1, 1, '2020-02-14', 30.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:57:56', 0, '', '2020-02-14 16:57:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2830, 477, 1, 1, '2020-02-14', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:08:54', 0, '', '2020-02-14 17:08:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2831, 477, 1, 1, '2020-02-14', 34.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:14:13', 0, '', '2020-02-14 17:14:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2832, 477, 1, 1, '2020-02-14', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:59:48', 0, '', '2020-02-14 17:59:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2833, 477, 1, 1, '2020-02-14', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:07:27', 0, '', '2020-02-14 18:07:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2834, 477, 1, 1, '2020-02-14', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:30:05', 0, '', '2020-02-14 18:30:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2835, 477, 1, 1, '2020-02-14', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:30:36', 0, '', '2020-02-14 18:30:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2836, 477, 1, 1, '2020-02-14', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:35:51', 0, '', '2020-02-14 18:35:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2837, 477, 1, 1, '2020-02-14', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:21:45', 0, '', '2020-02-14 19:21:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2838, 477, 1, 1, '2020-02-14', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:42:13', 0, '', '2020-02-14 19:42:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2839, 477, 1, 1, '2020-02-14', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:42:44', 0, '', '2020-02-14 19:42:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2840, 477, 1, 1, '2020-02-14', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:42:56', 0, '', '2020-02-14 19:42:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2841, 477, 1, 1, '2020-02-14', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:43:07', 0, '', '2020-02-14 19:43:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2842, 477, 1, 1, '2020-02-14', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:46:45', 0, '', '2020-02-14 19:46:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2843, 477, 1, 1, '2020-02-14', 21.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:38:28', 0, '', '2020-02-14 20:38:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2844, 477, 1, 1, '2020-02-14', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:02:55', 0, '', '2020-02-14 22:02:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2845, 477, 1, 1, '2020-02-14', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:06:48', 0, '', '2020-02-14 22:06:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2846, 477, 1, 3, '2020-02-14', 30.00, 1, 'se empezo con 40 no con 50 hago esto para cuadrar caja', '22:08:03', 0, 'asdasd', '2020-02-14 22:08:03', NULL, NULL, NULL, 3.38, 1);
INSERT INTO `movimiento` VALUES (2847, 477, 1, 1, '2020-02-14', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:19:48', 0, '', '2020-02-14 22:19:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2848, 477, 1, 1, '2020-02-14', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:23:22', 0, '', '2020-02-14 22:23:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2849, 479, 1, 1, '2020-02-15', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:06:35', 0, '', '2020-02-15 15:06:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2850, 479, 1, 1, '2020-02-15', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:56:33', 0, '', '2020-02-15 16:56:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2851, 479, 1, 1, '2020-02-15', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:47:56', 0, '', '2020-02-15 17:47:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2852, 479, 1, 1, '2020-02-15', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:49:24', 0, '', '2020-02-15 17:49:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2853, 479, 1, 1, '2020-02-15', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:49:36', 0, '', '2020-02-15 17:49:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2854, 479, 1, 1, '2020-02-15', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:55:31', 0, '', '2020-02-15 17:55:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2855, 479, 1, 1, '2020-02-15', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:14:15', 0, '', '2020-02-15 20:14:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2856, 481, 1, 1, '2020-02-16', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:52:20', 0, '', '2020-02-16 15:52:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2857, 481, 1, 1, '2020-02-16', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:53:07', 0, '', '2020-02-16 15:53:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2858, 481, 1, 1, '2020-02-16', 28.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:59:31', 0, '', '2020-02-16 17:59:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2859, 481, 1, 1, '2020-02-16', 33.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:13:05', 0, '', '2020-02-16 18:13:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2860, 481, 1, 1, '2020-02-16', 27.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:34:18', 0, '', '2020-02-16 18:34:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2861, 481, 1, 1, '2020-02-16', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:01:16', 0, '', '2020-02-16 19:01:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2862, 481, 1, 1, '2020-02-16', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:52:52', 0, '', '2020-02-16 19:52:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2863, 481, 1, 1, '2020-02-16', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:15:30', 0, '', '2020-02-16 21:15:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2864, 481, 1, 1, '2020-02-16', 35.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:27:02', 0, '', '2020-02-16 21:27:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2865, 481, 1, 1, '2020-02-16', 21.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:31:13', 0, '', '2020-02-16 21:31:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2866, 481, 1, 1, '2020-02-16', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:49:19', 0, '', '2020-02-16 21:49:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2867, 481, 1, 1, '2020-02-16', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:58:50', 0, '', '2020-02-16 21:58:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2868, 483, 1, 1, '2020-02-17', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:48:02', 0, '', '2020-02-17 17:48:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2869, 483, 1, 1, '2020-02-17', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:18:37', 0, '', '2020-02-17 18:18:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2870, 483, 1, 1, '2020-02-17', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:30:49', 0, '', '2020-02-17 18:30:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2871, 483, 1, 1, '2020-02-17', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:30:58', 0, '', '2020-02-17 18:30:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2872, 483, 1, 1, '2020-02-17', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:31:40', 0, '', '2020-02-17 18:31:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2873, 483, 1, 1, '2020-02-17', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:47:24', 0, '', '2020-02-17 18:47:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2874, 483, 1, 1, '2020-02-17', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:08:41', 0, '', '2020-02-17 20:08:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2875, 483, 1, 1, '2020-02-17', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:23:58', 0, '', '2020-02-17 21:23:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2876, 483, 1, 1, '2020-02-17', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:37:19', 0, '', '2020-02-17 21:37:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2877, 483, 1, 1, '2020-02-17', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:42:36', 0, '', '2020-02-17 21:42:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2878, 485, 1, 1, '2020-02-18', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:27:44', 0, '', '2020-02-18 16:27:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2879, 485, 1, 1, '2020-02-18', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:53:54', 0, '', '2020-02-18 16:53:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2880, 485, 1, 1, '2020-02-18', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:08:03', 0, '', '2020-02-18 17:08:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2881, 485, 1, 1, '2020-02-18', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:15:12', 0, '', '2020-02-18 17:15:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2882, 485, 1, 1, '2020-02-18', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:58:26', 0, '', '2020-02-18 17:58:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2883, 485, 1, 1, '2020-02-18', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:34:33', 0, '', '2020-02-18 18:34:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2884, 485, 1, 1, '2020-02-18', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:48:49', 0, '', '2020-02-18 18:48:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2885, 485, 1, 1, '2020-02-18', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:03:05', 0, '', '2020-02-18 19:03:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2886, 485, 1, 1, '2020-02-18', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:09:00', 0, '', '2020-02-18 19:09:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2887, 485, 1, 1, '2020-02-18', 102.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:18:11', 0, '', '2020-02-18 21:18:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2888, 485, 1, 1, '2020-02-18', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:19:28', 0, '', '2020-02-18 21:19:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2889, 485, 1, 1, '2020-02-18', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:32:02', 0, '', '2020-02-18 21:32:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2890, 485, 1, 1, '2020-02-18', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:32:16', 0, '', '2020-02-18 21:32:16', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2891, 487, 1, 1, '2020-02-19', 28.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:26:05', 0, '', '2020-02-19 11:26:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2892, 487, 1, 3, '2020-02-19', 28.00, 1, 'se empezo con 40 no con 50 hago esto para cuadrar caja', '11:27:15', 0, 'asdasd', '2020-02-19 11:27:15', NULL, NULL, NULL, 3.38, 1);
INSERT INTO `movimiento` VALUES (2893, 487, 1, 1, '2020-02-19', 32.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:32:13', 0, '', '2020-02-19 12:32:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2894, 487, 1, 1, '2020-02-19', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:32:59', 0, '', '2020-02-19 12:32:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2895, 487, 1, 1, '2020-02-19', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:03:27', 0, '', '2020-02-19 16:03:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2896, 487, 1, 1, '2020-02-19', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:57:12', 0, '', '2020-02-19 17:57:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2897, 487, 1, 1, '2020-02-19', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:57:32', 0, '', '2020-02-19 17:57:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2898, 487, 1, 1, '2020-02-19', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:55:19', 0, '', '2020-02-19 18:55:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2899, 487, 1, 1, '2020-02-19', 28.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:05:00', 0, '', '2020-02-19 22:05:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2900, 487, 1, 1, '2020-02-20', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '09:55:59', 0, '', '2020-02-20 09:55:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2901, 489, 1, 1, '2020-02-20', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:32:53', 0, '', '2020-02-20 12:32:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2902, 489, 1, 1, '2020-02-20', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:33:28', 0, '', '2020-02-20 12:33:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2903, 489, 1, 1, '2020-02-20', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:46:57', 0, '', '2020-02-20 20:46:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2904, 489, 1, 1, '2020-02-20', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:47:49', 0, '', '2020-02-20 20:47:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2905, 491, 1, 1, '2020-02-21', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:37:48', 0, '', '2020-02-21 17:37:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2906, 491, 1, 1, '2020-02-21', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:38:41', 0, '', '2020-02-21 17:38:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2907, 491, 1, 1, '2020-02-21', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:39:40', 0, '', '2020-02-21 17:39:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2908, 491, 1, 1, '2020-02-21', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:40:54', 0, '', '2020-02-21 17:40:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2909, 491, 1, 1, '2020-02-21', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:41:47', 0, '', '2020-02-21 17:41:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2910, 491, 1, 1, '2020-02-21', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:42:49', 0, '', '2020-02-21 18:42:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2911, 491, 1, 1, '2020-02-21', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:43:53', 0, '', '2020-02-21 18:43:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2912, 491, 1, 1, '2020-02-21', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:29:44', 0, '', '2020-02-21 19:29:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2913, 491, 1, 1, '2020-02-21', 26.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:31:12', 0, '', '2020-02-21 19:31:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2914, 491, 1, 1, '2020-02-21', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:47:43', 0, '', '2020-02-21 19:47:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2915, 491, 1, 1, '2020-02-21', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:48:33', 0, '', '2020-02-21 19:48:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2916, 491, 1, 1, '2020-02-21', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:19:35', 0, '', '2020-02-21 20:19:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2917, 491, 1, 1, '2020-02-21', 36.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:20:01', 0, '', '2020-02-21 21:20:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2918, 491, 1, 1, '2020-02-23', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:39:56', 0, '', '2020-02-23 16:39:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2919, 491, 1, 1, '2020-02-23', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:44:40', 0, '', '2020-02-23 16:44:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2920, 491, 1, 1, '2020-02-23', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:58:28', 0, '', '2020-02-23 16:58:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2921, 491, 1, 1, '2020-02-23', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:59:25', 0, '', '2020-02-23 16:59:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2922, 491, 1, 1, '2020-02-23', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:00:21', 0, '', '2020-02-23 17:00:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2923, 491, 1, 1, '2020-02-23', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:07:06', 0, '', '2020-02-23 18:07:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2924, 491, 1, 1, '2020-02-23', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:07:48', 0, '', '2020-02-23 18:07:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2925, 491, 1, 1, '2020-02-23', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:09:21', 0, '', '2020-02-23 18:09:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2926, 491, 1, 1, '2020-02-23', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:10:54', 0, '', '2020-02-23 18:10:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2927, 491, 1, 1, '2020-02-23', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:22:11', 0, '', '2020-02-23 18:22:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2928, 491, 1, 1, '2020-02-23', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:29:18', 0, '', '2020-02-23 18:29:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2929, 491, 1, 1, '2020-02-23', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:31:28', 0, '', '2020-02-23 18:31:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2930, 491, 1, 1, '2020-02-23', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:03:03', 0, '', '2020-02-23 19:03:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2931, 493, 1, 1, '2020-02-23', 143.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:15:20', 0, '', '2020-02-23 19:15:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2932, 493, 1, 3, '2020-02-23', 13.00, 1, 'se empezo con 40 no con 50 hago esto para cuadrar caja', '19:17:01', 0, 'asdasd', '2020-02-23 19:17:01', NULL, NULL, NULL, 3.38, 1);
INSERT INTO `movimiento` VALUES (2933, 493, 1, 1, '2020-02-23', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:41:12', 0, '', '2020-02-23 19:41:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2934, 495, 1, 1, '2020-02-24', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:48:11', 0, '', '2020-02-24 16:48:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2935, 495, 1, 1, '2020-02-24', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:02:04', 0, '', '2020-02-24 17:02:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2936, 495, 1, 1, '2020-02-24', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:02:58', 0, '', '2020-02-24 17:02:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2937, 495, 1, 1, '2020-02-24', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:49:55', 0, '', '2020-02-24 17:49:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2938, 495, 1, 1, '2020-02-24', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:50:57', 0, '', '2020-02-24 17:50:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2939, 495, 1, 1, '2020-02-24', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:03:45', 0, '', '2020-02-24 18:03:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2940, 495, 1, 1, '2020-02-24', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:16:15', 0, '', '2020-02-24 18:16:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2941, 495, 1, 1, '2020-02-24', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:20:11', 0, '', '2020-02-24 18:20:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2942, 495, 1, 1, '2020-02-24', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:38:11', 0, '', '2020-02-24 18:38:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2943, 495, 1, 1, '2020-02-24', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:28:13', 0, '', '2020-02-24 19:28:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2944, 495, 1, 1, '2020-02-24', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:08:18', 0, '', '2020-02-24 20:08:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2945, 499, 1, 1, '2020-02-25', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:27:10', 0, '', '2020-02-25 16:27:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2946, 499, 1, 1, '2020-02-25', 22.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:02:54', 0, '', '2020-02-25 17:02:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2947, 499, 1, 1, '2020-02-25', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:14:23', 0, '', '2020-02-25 17:14:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2948, 499, 1, 1, '2020-02-25', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:42:02', 0, '', '2020-02-25 17:42:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2949, 499, 1, 1, '2020-02-25', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:20:00', 0, '', '2020-02-25 18:20:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2950, 499, 1, 1, '2020-02-25', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:00:17', 0, '', '2020-02-25 20:00:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2951, 499, 1, 1, '2020-02-25', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:00:37', 0, '', '2020-02-25 20:00:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2952, 501, 1, 1, '2020-02-26', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:09:48', 0, '', '2020-02-26 11:09:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2953, 501, 1, 1, '2020-02-26', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:58:57', 0, '', '2020-02-26 17:58:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2954, 501, 1, 1, '2020-02-26', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:53:34', 0, '', '2020-02-26 18:53:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2955, 501, 1, 1, '2020-02-26', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:54:10', 0, '', '2020-02-26 18:54:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2956, 501, 1, 1, '2020-02-26', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:02:57', 0, '', '2020-02-26 19:02:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2957, 501, 1, 1, '2020-02-26', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:07:32', 0, '', '2020-02-26 19:07:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2958, 501, 1, 1, '2020-02-26', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:42:39', 0, '', '2020-02-26 19:42:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2959, 501, 1, 1, '2020-02-26', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:33:55', 0, '', '2020-02-26 21:33:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2960, 501, 1, 1, '2020-02-26', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:41:29', 0, '', '2020-02-26 21:41:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2961, 503, 1, 1, '2020-02-27', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:08:49', 0, '', '2020-02-27 17:08:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2962, 503, 1, 1, '2020-02-27', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:15:22', 0, '', '2020-02-27 17:15:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2963, 503, 1, 1, '2020-02-27', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:15:50', 0, '', '2020-02-27 17:15:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2964, 503, 1, 1, '2020-02-27', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:48:53', 0, '', '2020-02-27 18:48:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2965, 503, 1, 1, '2020-02-27', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:49:17', 0, '', '2020-02-27 18:49:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2966, 503, 1, 1, '2020-02-27', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:09:13', 0, '', '2020-02-27 20:09:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2967, 503, 1, 1, '2020-02-27', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:34:08', 0, '', '2020-02-27 20:34:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2968, 503, 1, 1, '2020-02-27', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:16:56', 0, '', '2020-02-27 21:16:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2969, 503, 1, 1, '2020-02-27', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:29:50', 0, '', '2020-02-27 21:29:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2970, 503, 1, 1, '2020-02-27', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:17:09', 0, '', '2020-02-27 22:17:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2971, 505, 1, 1, '2020-02-28', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:01:46', 0, '', '2020-02-28 11:01:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2972, 505, 1, 1, '2020-02-28', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:27:32', 0, '', '2020-02-28 16:27:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2973, 505, 1, 1, '2020-02-28', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:48:17', 0, '', '2020-02-28 16:48:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2974, 505, 1, 1, '2020-02-28', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:46:23', 0, '', '2020-02-28 18:46:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2975, 505, 1, 1, '2020-02-28', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:17:28', 0, '', '2020-02-28 19:17:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2976, 505, 1, 1, '2020-02-28', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:10:17', 0, '', '2020-02-28 20:10:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2977, 505, 1, 1, '2020-02-28', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:45:17', 0, '', '2020-02-28 20:45:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2978, 505, 1, 1, '2020-02-28', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:22:06', 0, '', '2020-02-28 21:22:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2979, 505, 1, 1, '2020-02-28', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:03:42', 0, '', '2020-02-28 22:03:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2980, 507, 1, 1, '2020-02-29', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '09:32:28', 0, '', '2020-02-29 09:32:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2981, 507, 1, 1, '2020-02-29', 28.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:35:34', 0, '', '2020-02-29 10:35:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2982, 507, 1, 1, '2020-02-29', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:48:10', 0, '', '2020-02-29 10:48:10', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2983, 507, 1, 1, '2020-02-29', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:03:25', 0, '', '2020-02-29 11:03:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2984, 507, 1, 1, '2020-02-29', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:51:28', 0, '', '2020-02-29 12:51:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2985, 507, 1, 1, '2020-02-29', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:35:07', 0, '', '2020-02-29 16:35:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2986, 507, 1, 1, '2020-02-29', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:05:50', 0, '', '2020-02-29 17:05:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2987, 507, 1, 1, '2020-02-29', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:07:42', 0, '', '2020-02-29 17:07:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2988, 507, 1, 1, '2020-02-29', 24.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:16:13', 0, '', '2020-02-29 18:16:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2989, 507, 1, 1, '2020-02-29', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:18:14', 0, '', '2020-02-29 21:18:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2990, 509, 1, 1, '2020-03-01', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:45:44', 0, '', '2020-03-01 11:45:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2991, 509, 1, 1, '2020-03-01', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:23:52', 0, '', '2020-03-01 16:23:52', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2992, 509, 1, 1, '2020-03-01', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:48:58', 0, '', '2020-03-01 17:48:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2993, 509, 1, 1, '2020-03-01', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:00:50', 0, '', '2020-03-01 18:00:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2994, 509, 1, 1, '2020-03-01', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:27:56', 0, '', '2020-03-01 18:27:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2995, 511, 1, 1, '2020-03-02', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:29:25', 0, '', '2020-03-02 11:29:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2996, 511, 1, 1, '2020-03-02', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:39:08', 0, '', '2020-03-02 12:39:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2997, 511, 1, 1, '2020-03-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:39:19', 0, '', '2020-03-02 12:39:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2998, 511, 1, 1, '2020-03-02', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:38:39', 0, '', '2020-03-02 16:38:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (2999, 511, 1, 1, '2020-03-02', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:42:33', 0, '', '2020-03-02 16:42:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3000, 511, 1, 1, '2020-03-02', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:52:39', 0, '', '2020-03-02 16:52:39', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3001, 511, 1, 1, '2020-03-02', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:59:46', 0, '', '2020-03-02 16:59:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3002, 511, 1, 1, '2020-03-02', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:03:41', 0, '', '2020-03-02 17:03:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3003, 511, 1, 1, '2020-03-02', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:13:51', 0, '', '2020-03-02 17:13:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3004, 511, 1, 1, '2020-03-02', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:18:26', 0, '', '2020-03-02 17:18:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3005, 511, 1, 1, '2020-03-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:25:17', 0, '', '2020-03-02 17:25:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3006, 511, 1, 1, '2020-03-02', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:28:12', 0, '', '2020-03-02 17:28:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3007, 511, 1, 1, '2020-03-02', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:52:45', 0, '', '2020-03-02 17:52:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3008, 511, 1, 1, '2020-03-02', 26.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:01:51', 0, '', '2020-03-02 20:01:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3009, 511, 1, 1, '2020-03-02', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:05:02', 0, '', '2020-03-02 20:05:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3010, 511, 1, 1, '2020-03-02', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:47:43', 0, '', '2020-03-02 20:47:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3011, 511, 1, 1, '2020-03-02', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:48:23', 0, '', '2020-03-02 20:48:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3012, 511, 1, 1, '2020-03-02', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:02:32', 0, '', '2020-03-02 21:02:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3013, 511, 1, 1, '2020-03-02', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:21:20', 0, '', '2020-03-02 21:21:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3014, 511, 1, 1, '2020-03-02', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:53:44', 0, '', '2020-03-02 21:53:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3015, 511, 1, 1, '2020-03-02', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:53:56', 0, '', '2020-03-02 21:53:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3016, 513, 1, 1, '2020-03-03', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:14:09', 0, '', '2020-03-03 12:14:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3017, 513, 1, 1, '2020-03-03', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:17:34', 0, '', '2020-03-03 16:17:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3018, 513, 1, 1, '2020-03-03', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:04:27', 0, '', '2020-03-03 18:04:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3019, 513, 1, 1, '2020-03-03', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:15:00', 0, '', '2020-03-03 18:15:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3020, 513, 1, 1, '2020-03-03', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:15:47', 0, '', '2020-03-03 18:15:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3021, 513, 1, 1, '2020-03-03', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:49:00', 0, '', '2020-03-03 18:49:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3022, 513, 1, 1, '2020-03-03', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:49:12', 0, '', '2020-03-03 18:49:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3023, 513, 1, 1, '2020-03-03', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:18:33', 0, '', '2020-03-03 20:18:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3024, 513, 1, 1, '2020-03-03', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:22:40', 0, '', '2020-03-03 20:22:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3025, 513, 1, 1, '2020-03-03', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:28:01', 0, '', '2020-03-03 20:28:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3026, 513, 1, 1, '2020-03-03', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:33:03', 0, '', '2020-03-03 20:33:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3027, 513, 1, 1, '2020-03-03', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:37:24', 0, '', '2020-03-03 21:37:24', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3028, 513, 1, 1, '2020-03-03', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:54:21', 0, '', '2020-03-03 21:54:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3029, 513, 1, 1, '2020-03-03', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:15:05', 0, '', '2020-03-03 22:15:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3030, 513, 1, 1, '2020-03-03', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:15:17', 0, '', '2020-03-03 22:15:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3031, 515, 1, 1, '2020-03-04', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:35:51', 0, '', '2020-03-04 12:35:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3032, 515, 1, 1, '2020-03-04', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:06:37', 0, '', '2020-03-04 15:06:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3033, 515, 1, 1, '2020-03-04', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:11:07', 0, '', '2020-03-04 16:11:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3034, 515, 1, 1, '2020-03-04', 24.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:17:00', 0, '', '2020-03-04 17:17:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3035, 515, 1, 1, '2020-03-04', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:33:04', 0, '', '2020-03-04 17:33:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3036, 515, 1, 1, '2020-03-04', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:13:47', 0, '', '2020-03-04 18:13:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3037, 515, 1, 1, '2020-03-04', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:40:57', 0, '', '2020-03-04 18:40:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3038, 515, 1, 1, '2020-03-04', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:00:30', 0, '', '2020-03-04 19:00:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3039, 515, 1, 1, '2020-03-04', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:05:03', 0, '', '2020-03-04 19:05:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3040, 515, 1, 1, '2020-03-04', 5.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:28:12', 0, '', '2020-03-04 19:28:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3041, 515, 1, 1, '2020-03-04', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:44:19', 0, '', '2020-03-04 20:44:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3042, 517, 1, 1, '2020-03-05', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:31:14', 0, '', '2020-03-05 10:31:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3043, 517, 1, 1, '2020-03-05', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:51:14', 0, '', '2020-03-05 10:51:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3044, 517, 1, 1, '2020-03-05', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:19:35', 0, '', '2020-03-05 11:19:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3045, 517, 1, 1, '2020-03-05', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:27:11', 0, '', '2020-03-05 17:27:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3046, 517, 1, 1, '2020-03-05', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:57:20', 0, '', '2020-03-05 17:57:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3047, 517, 1, 1, '2020-03-05', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:16:30', 0, '', '2020-03-05 18:16:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3048, 517, 1, 1, '2020-03-05', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:06:00', 0, '', '2020-03-05 21:06:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3049, 519, 1, 1, '2020-03-07', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:45:09', 0, '', '2020-03-07 10:45:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3050, 519, 1, 1, '2020-03-07', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:12:43', 0, '', '2020-03-07 11:12:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3051, 521, 1, 1, '2020-03-07', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:13:47', 0, '', '2020-03-07 11:13:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3052, 521, 1, 1, '2020-03-07', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:32:18', 0, '', '2020-03-07 12:32:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3053, 521, 1, 1, '2020-03-07', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '13:04:26', 0, '', '2020-03-07 13:04:26', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3054, 521, 1, 1, '2020-03-07', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:24:21', 0, '', '2020-03-07 15:24:21', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3055, 521, 1, 1, '2020-03-07', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:30:48', 0, '', '2020-03-07 15:30:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3056, 521, 1, 1, '2020-03-07', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:42:36', 0, '', '2020-03-07 16:42:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3057, 521, 1, 1, '2020-03-07', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:52:04', 0, '', '2020-03-07 16:52:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3058, 521, 1, 1, '2020-03-07', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:52:18', 0, '', '2020-03-07 16:52:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3059, 521, 1, 1, '2020-03-07', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:12:40', 0, '', '2020-03-07 17:12:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3060, 521, 1, 1, '2020-03-07', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:12:51', 0, '', '2020-03-07 17:12:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3061, 521, 1, 1, '2020-03-07', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:13:48', 0, '', '2020-03-07 17:13:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3062, 521, 1, 1, '2020-03-07', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:42:02', 0, '', '2020-03-07 17:42:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3063, 521, 1, 1, '2020-03-07', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:11:29', 0, '', '2020-03-07 18:11:29', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3064, 521, 1, 1, '2020-03-07', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:26:50', 0, '', '2020-03-07 18:26:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3065, 521, 1, 1, '2020-03-07', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:02:22', 0, '', '2020-03-07 19:02:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3066, 521, 1, 1, '2020-03-07', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:02:32', 0, '', '2020-03-07 19:02:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3067, 521, 1, 1, '2020-03-07', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:05:42', 0, '', '2020-03-07 19:05:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3068, 521, 1, 1, '2020-03-07', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:22:47', 0, '', '2020-03-07 20:22:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3069, 521, 1, 1, '2020-03-07', 26.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:57:01', 0, '', '2020-03-07 20:57:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3070, 521, 1, 1, '2020-03-07', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:11:14', 0, '', '2020-03-07 21:11:14', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3071, 521, 1, 1, '2020-03-07', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:15:04', 0, '', '2020-03-07 21:15:04', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3072, 521, 1, 1, '2020-03-07', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:27:41', 0, '', '2020-03-07 21:27:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3073, 523, 1, 1, '2020-03-08', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:14:31', 0, '', '2020-03-08 18:14:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3074, 523, 1, 1, '2020-03-08', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:14:53', 0, '', '2020-03-08 18:14:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3075, 523, 1, 1, '2020-03-08', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:15:30', 0, '', '2020-03-08 18:15:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3076, 523, 1, 1, '2020-03-08', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:53:45', 0, '', '2020-03-08 18:53:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3077, 523, 1, 1, '2020-03-08', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:11:56', 0, '', '2020-03-08 19:11:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3078, 523, 1, 1, '2020-03-08', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:12:07', 0, '', '2020-03-08 19:12:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3079, 523, 1, 1, '2020-03-08', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:32:31', 0, '', '2020-03-08 19:32:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3080, 523, 1, 1, '2020-03-08', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:48:12', 0, '', '2020-03-08 19:48:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3081, 523, 1, 1, '2020-03-08', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:07:25', 0, '', '2020-03-08 20:07:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3082, 523, 1, 1, '2020-03-08', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:25:49', 0, '', '2020-03-08 20:25:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3083, 523, 1, 1, '2020-03-08', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:57:43', 0, '', '2020-03-08 20:57:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3084, 523, 1, 1, '2020-03-08', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:02:43', 0, '', '2020-03-08 21:02:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3085, 523, 1, 1, '2020-03-08', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:55:30', 0, '', '2020-03-08 21:55:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3086, 525, 1, 1, '2020-03-09', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:16:03', 0, '', '2020-03-09 16:16:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3087, 525, 1, 1, '2020-03-09', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:27:42', 0, '', '2020-03-09 16:27:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3088, 525, 1, 1, '2020-03-09', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:50:32', 0, '', '2020-03-09 16:50:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3089, 525, 1, 1, '2020-03-09', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:52:50', 0, '', '2020-03-09 16:52:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3090, 525, 1, 1, '2020-03-09', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:58:15', 0, '', '2020-03-09 17:58:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3091, 525, 1, 1, '2020-03-09', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:21:42', 0, '', '2020-03-09 20:21:42', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3092, 525, 1, 1, '2020-03-09', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:51:13', 0, '', '2020-03-09 21:51:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3093, 525, 1, 1, '2020-03-09', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:52:05', 0, '', '2020-03-09 21:52:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3094, 525, 1, 1, '2020-03-09', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:53:12', 0, '', '2020-03-09 21:53:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3095, 525, 1, 1, '2020-03-09', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:57:28', 0, '', '2020-03-09 21:57:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3096, 527, 1, 1, '2020-03-10', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:51:13', 0, '', '2020-03-10 18:51:13', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3097, 527, 1, 1, '2020-03-10', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:51:37', 0, '', '2020-03-10 18:51:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3098, 527, 1, 1, '2020-03-10', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:46:50', 0, '', '2020-03-10 21:46:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3099, 527, 1, 1, '2020-03-10', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:57:38', 0, '', '2020-03-10 21:57:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3100, 529, 1, 1, '2020-03-11', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:02:49', 0, '', '2020-03-11 10:02:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3101, 529, 1, 1, '2020-03-11', 16.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:24:19', 0, '', '2020-03-11 12:24:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3102, 529, 1, 1, '2020-03-11', 2.50, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:27:37', 0, '', '2020-03-11 12:27:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3103, 529, 1, 1, '2020-03-11', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:38:49', 0, '', '2020-03-11 12:38:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3104, 529, 1, 1, '2020-03-11', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:49:18', 0, '', '2020-03-11 15:49:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3105, 529, 1, 1, '2020-03-11', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:06:18', 0, '', '2020-03-11 16:06:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3106, 529, 1, 1, '2020-03-11', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:16:47', 0, '', '2020-03-11 16:16:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3107, 529, 1, 1, '2020-03-11', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:19:00', 0, '', '2020-03-11 16:19:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3108, 529, 1, 1, '2020-03-11', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:16:55', 0, '', '2020-03-11 17:16:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3109, 529, 1, 1, '2020-03-11', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:36:55', 0, '', '2020-03-11 17:36:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3110, 529, 1, 1, '2020-03-11', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:25:45', 0, '', '2020-03-11 18:25:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3111, 529, 1, 1, '2020-03-11', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:17:08', 0, '', '2020-03-11 19:17:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3112, 529, 1, 1, '2020-03-11', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:48:00', 0, '', '2020-03-11 19:48:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3113, 529, 1, 1, '2020-03-11', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:51:44', 0, '', '2020-03-11 19:51:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3114, 531, 1, 1, '2020-03-12', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:27:36', 0, '', '2020-03-12 15:27:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3115, 531, 1, 1, '2020-03-12', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:58:20', 0, '', '2020-03-12 16:58:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3116, 531, 1, 1, '2020-03-12', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:58:43', 0, '', '2020-03-12 16:58:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3117, 531, 1, 1, '2020-03-12', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:02:18', 0, '', '2020-03-12 17:02:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3118, 533, 1, 1, '2020-03-13', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:41:33', 0, '', '2020-03-13 11:41:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3119, 533, 1, 1, '2020-03-13', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:35:55', 0, '', '2020-03-13 12:35:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3120, 533, 1, 1, '2020-03-13', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:40:46', 0, '', '2020-03-13 12:40:46', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3121, 533, 1, 1, '2020-03-13', 19.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:38:03', 0, '', '2020-03-13 15:38:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3122, 533, 1, 1, '2020-03-13', 24.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:55:08', 0, '', '2020-03-13 15:55:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3123, 533, 1, 1, '2020-03-13', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:58:53', 0, '', '2020-03-13 16:58:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3124, 533, 1, 1, '2020-03-13', 13.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:05:12', 0, '', '2020-03-13 17:05:12', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3125, 533, 1, 1, '2020-03-13', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:51:45', 0, '', '2020-03-13 17:51:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3126, 533, 1, 1, '2020-03-13', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:23:36', 0, '', '2020-03-13 18:23:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3127, 533, 1, 1, '2020-03-13', 28.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:23:48', 0, '', '2020-03-13 18:23:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3128, 533, 1, 1, '2020-03-13', 21.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:29:35', 0, '', '2020-03-13 18:29:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3129, 533, 1, 1, '2020-03-13', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:35:44', 0, '', '2020-03-13 18:35:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3130, 533, 1, 1, '2020-03-13', 17.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:57:35', 0, '', '2020-03-13 20:57:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3131, 533, 1, 1, '2020-03-13', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:16:55', 0, '', '2020-03-13 21:16:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3132, 535, 1, 1, '2020-03-14', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:39:53', 0, '', '2020-03-14 16:39:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3133, 535, 1, 1, '2020-03-14', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:03:20', 0, '', '2020-03-14 17:03:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3134, 535, 1, 1, '2020-03-14', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:37:22', 0, '', '2020-03-14 17:37:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3135, 535, 1, 1, '2020-03-14', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:23:36', 0, '', '2020-03-14 18:23:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3136, 535, 1, 1, '2020-03-14', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:47:48', 0, '', '2020-03-14 19:47:48', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3137, 535, 1, 1, '2020-03-14', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:35:35', 0, '', '2020-03-14 20:35:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3138, 535, 1, 1, '2020-03-14', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:35:51', 0, '', '2020-03-14 20:35:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3139, 535, 1, 1, '2020-03-14', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:00:40', 0, '', '2020-03-14 21:00:40', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3140, 537, 1, 1, '2020-03-15', 2.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:38:43', 0, '', '2020-03-15 15:38:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3141, 537, 1, 1, '2020-03-15', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '15:45:19', 0, '', '2020-03-15 15:45:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3142, 537, 1, 1, '2020-03-15', 7.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:05:20', 0, '', '2020-03-15 16:05:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3143, 537, 1, 1, '2020-03-15', 14.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:52:55', 0, '', '2020-03-15 16:52:55', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3144, 537, 1, 1, '2020-03-15', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:53:51', 0, '', '2020-03-15 16:53:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3145, 537, 1, 1, '2020-03-15', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '16:57:38', 0, '', '2020-03-15 16:57:38', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3146, 537, 1, 1, '2020-03-15', 26.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '17:11:18', 0, '', '2020-03-15 17:11:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3147, 537, 1, 1, '2020-03-15', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:30:37', 0, '', '2020-03-15 18:30:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3148, 537, 1, 1, '2020-03-15', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:30:56', 0, '', '2020-03-15 18:30:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3149, 537, 1, 1, '2020-03-15', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:38:25', 0, '', '2020-03-15 18:38:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3150, 537, 1, 1, '2020-03-15', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:57:00', 0, '', '2020-03-15 18:57:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3151, 537, 1, 1, '2020-03-15', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:49:41', 0, '', '2020-03-15 19:49:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3152, 537, 1, 1, '2020-03-15', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:41:06', 0, '', '2020-03-15 20:41:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3153, 537, 1, 1, '2020-03-15', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:10:45', 0, '', '2020-03-15 21:10:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3154, 537, 1, 1, '2020-03-15', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:36:51', 0, '', '2020-03-15 22:36:51', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3155, 541, 1, 1, '2021-01-07', 4.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '23:40:05', 2, '001-80', '2021-01-07 23:40:05', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3156, 541, 1, 1, '2021-01-07', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '23:42:44', 2, '001-81', '2021-01-07 23:42:44', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3157, 541, 1, 1, '2021-01-07', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '23:42:56', 2, '001-82', '2021-01-07 23:42:56', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3158, 541, 1, 1, '2021-01-07', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '23:43:03', 2, '001-83', '2021-01-07 23:43:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3159, 541, 1, 1, '2021-01-07', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '23:43:08', 2, '001-84', '2021-01-07 23:43:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3160, 541, 1, 1, '2021-01-07', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '23:55:09', 2, '001-85', '2021-01-07 23:55:09', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3161, 541, 1, 1, '2021-01-08', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '00:00:33', 2, '001-86', '2021-01-08 00:00:33', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3162, 543, 1, 1, '2021-01-08', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '00:03:08', 2, '001-87', '2021-01-08 00:03:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3163, 543, 1, 1, '2021-01-08', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '00:04:18', 2, '001-88', '2021-01-08 00:04:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3164, 543, 1, 1, '2021-01-08', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:28:37', 2, '001-89', '2021-01-08 20:28:37', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3165, 543, 1, 1, '2021-01-08', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:38:41', 2, '001-90', '2021-01-08 20:38:41', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3166, 545, 1, 1, '2021-01-09', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:45:00', 2, '001-91', '2021-01-09 11:45:00', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3167, 545, 1, 1, '2021-01-09', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:12:50', 2, '001-92', '2021-01-09 18:12:50', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3168, 545, 1, 1, '2021-01-09', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:12:59', 2, '001-93', '2021-01-09 18:12:59', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3169, 545, 1, 1, '2021-01-09', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:13:18', 2, '001-94', '2021-01-09 18:13:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3170, 545, 1, 1, '2021-01-09', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:09:47', 2, '001-95', '2021-01-09 19:09:47', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3171, 547, 1, 1, '2021-01-10', 10.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '08:24:49', 2, 'B001-1', '2021-01-10 08:24:49', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3172, 547, 1, 1, '2021-01-10', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '18:36:02', 2, 'B001-2', '2021-01-10 18:36:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3173, 547, 1, 1, '2021-01-10', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:46:34', 2, 'B001-3', '2021-01-10 19:46:34', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3174, 547, 1, 1, '2021-01-10', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '19:47:25', 2, 'B001-4', '2021-01-10 19:47:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3175, 547, 1, 1, '2021-01-10', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:03:19', 2, 'B001-5', '2021-01-10 20:03:19', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3176, 547, 1, 1, '2021-01-10', 20.50, 1, 'COBRO DE VENTA DE PRODUCTOS', '20:04:22', 2, 'B001-6', '2021-01-10 20:04:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3177, 547, 1, 1, '2021-01-10', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:00:06', 2, 'B001-7', '2021-01-10 22:00:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3178, 547, 1, 1, '2021-01-10', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:16:07', 2, 'B001-8', '2021-01-10 22:16:07', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3179, 547, 1, 1, '2021-01-10', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '23:17:45', 2, 'B001-9', '2021-01-10 23:17:45', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3180, 547, 1, 1, '2021-01-10', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '23:17:57', 2, 'B001-10', '2021-01-10 23:17:57', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3181, 547, 1, 1, '2021-01-10', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '23:18:54', 2, 'B001-11', '2021-01-10 23:18:54', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3182, 547, 1, 1, '2021-01-10', 21.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '23:22:58', 2, 'B001-12', '2021-01-10 23:22:58', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3183, 549, 1, 1, '2021-01-11', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '00:27:08', 2, 'B001-13', '2021-01-11 00:27:08', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3184, 549, 1, 1, '2021-01-11', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '00:30:18', 2, 'B001-1', '2021-01-11 00:30:18', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3185, 549, 1, 1, '2021-01-11', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '00:34:01', 2, 'B001-2', '2021-01-11 00:34:01', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3186, 549, 1, 1, '2021-01-11', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '00:37:31', 2, 'B001-3', '2021-01-11 00:37:31', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3187, 549, 1, 1, '2021-01-11', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '00:38:20', 2, 'B001-4', '2021-01-11 00:38:20', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3188, 549, 1, 1, '2021-01-11', 18.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '08:07:17', 2, 'B001-5', '2021-01-11 08:07:17', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3189, 549, 1, 1, '2021-01-11', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '08:19:25', 2, 'B001-6', '2021-01-11 08:19:25', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3190, 549, 1, 1, '2021-01-11', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '09:12:53', 2, 'B001-7', '2021-01-11 09:12:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3191, 549, 1, 1, '2021-01-11', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '09:32:28', 2, 'B001-8', '2021-01-11 09:32:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3192, 549, 1, 1, '2021-01-11', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '09:33:53', 2, 'B001-9', '2021-01-11 09:33:53', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3193, 549, 1, 1, '2021-01-11', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '09:36:22', 2, 'B001-10', '2021-01-11 09:36:22', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3194, 549, 1, 1, '2021-01-11', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '09:38:30', 2, 'B001-11', '2021-01-11 09:38:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3195, 549, 1, 1, '2021-01-11', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '09:40:43', 2, 'B001-12', '2021-01-11 09:40:43', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3196, 549, 1, 1, '2021-01-11', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '09:43:06', 2, 'B001-13', '2021-01-11 09:43:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3197, 549, 1, 1, '2021-01-11', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:08:23', 2, 'B001-14', '2021-01-11 10:08:23', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3198, 549, 1, 1, '2021-01-11', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:21:32', 2, 'B001-15', '2021-01-11 10:21:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3199, 549, 1, 1, '2021-01-11', 8.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:33:27', 2, 'B001-16', '2021-01-11 10:33:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3200, 549, 1, 1, '2021-01-11', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:37:35', 2, 'B001-17', '2021-01-11 10:37:35', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3201, 549, 1, 1, '2021-01-11', 11.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:48:28', 2, 'B001-18', '2021-01-11 10:48:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3202, 549, 1, 1, '2021-01-11', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '10:52:27', 2, 'B001-19', '2021-01-11 10:52:27', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3203, 551, 1, 1, '2021-01-11', 15.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:19:02', 2, 'B001-20', '2021-01-11 11:19:02', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3204, 551, 1, 1, '2021-01-11', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:19:32', 2, 'B001-21', '2021-01-11 11:19:32', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3205, 551, 1, 1, '2021-01-11', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:22:11', 2, 'B001-22', '2021-01-11 11:22:11', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3206, 551, 1, 1, '2021-01-11', 9.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:25:06', 2, 'B001-23', '2021-01-11 11:25:06', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3207, 551, 1, 1, '2021-01-11', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:30:03', 2, 'B001-24', '2021-01-11 11:30:03', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3208, 551, 1, 1, '2021-01-11', 12.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:38:30', 2, 'B001-25', '2021-01-11 11:38:30', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3209, 551, 1, 2, '2021-01-11', 100.00, 1, 'PAGO DE COMPRA', '11:48:52', 1, 'F100-1', '2021-01-11 11:48:52', 0, NULL, NULL, 1.00, 1);
INSERT INTO `movimiento` VALUES (3210, 553, 1, 1, '2021-01-11', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '11:59:15', 2, 'B001-26', '2021-01-11 11:59:15', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3211, 553, 1, 1, '2021-01-11', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '12:07:28', 2, 'B001-27', '2021-01-11 12:07:28', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3212, 553, 1, 1, '2021-01-11', 3.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '21:45:36', 2, 'B001-28', '2021-01-11 21:45:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3213, 553, 1, 1, '2021-01-11', 20.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:29:36', 2, 'B001-29', '2021-01-11 22:29:36', NULL, NULL, NULL, NULL, 1);
INSERT INTO `movimiento` VALUES (3214, 553, 1, 1, '2021-01-11', 6.00, 1, 'COBRO DE VENTA DE PRODUCTOS', '22:30:09', 2, 'B001-30', '2021-01-11 22:30:09', NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for pago_empleado
-- ----------------------------
DROP TABLE IF EXISTS `pago_empleado`;
CREATE TABLE `pago_empleado`  (
  `pago_empleado_id` int(11) NOT NULL AUTO_INCREMENT,
  `pago_empleado_fecha` date NULL DEFAULT NULL,
  `pago_empleado_monto` decimal(15, 2) NULL DEFAULT NULL,
  `pago_empleado_estado` int(11) NULL DEFAULT 1,
  `id_empleado` int(11) NULL DEFAULT NULL,
  `id_movimiento` int(11) NULL DEFAULT NULL,
  `pago_empleadofechapago` date NULL DEFAULT NULL,
  `pago_empleado_estadopagado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `pago_empleado_fechainicio` date NULL DEFAULT NULL,
  `pago_empleado_cts` decimal(11, 4) NULL DEFAULT NULL,
  `pago_empleado_gratificacion` decimal(11, 4) NULL DEFAULT NULL,
  `pago_empleado_estadocts` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `pago_empleado_estadogra` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  PRIMARY KEY (`pago_empleado_id`) USING BTREE,
  INDEX `id_empleado`(`id_empleado`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for perfiles
-- ----------------------------
DROP TABLE IF EXISTS `perfiles`;
CREATE TABLE `perfiles`  (
  `perfil_id` int(11) NOT NULL AUTO_INCREMENT,
  `perfil_descripcion` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `estado` int(1) NULL DEFAULT 1,
  `perfil_url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`perfil_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of perfiles
-- ----------------------------
INSERT INTO `perfiles` VALUES (1, 'ADMINISTRADOR', 1, '');
INSERT INTO `perfiles` VALUES (2, 'MOZO', 1, 'Venta_mesa');
INSERT INTO `perfiles` VALUES (5, 'CAJERO', 1, 'Pedido');
INSERT INTO `perfiles` VALUES (6, 'COCINERO', 1, 'cocina');
INSERT INTO `perfiles` VALUES (8, 'ADMINISTRADOR DE EMPRESA', 1, 'Pedido');
INSERT INTO `perfiles` VALUES (12, 'ADMINISTRADOR DE SEDE', 1, 'Control');
INSERT INTO `perfiles` VALUES (13, 'DELIVERISTA', 1, 'Delivery');

-- ----------------------------
-- Table structure for permisos
-- ----------------------------
DROP TABLE IF EXISTS `permisos`;
CREATE TABLE `permisos`  (
  `perfil_id` int(11) NULL DEFAULT NULL,
  `modulo_id` int(11) NULL DEFAULT NULL,
  `empresa_ruc` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_tipo_negocio` int(11) NULL DEFAULT NULL,
  INDEX `fk_modulo_permiso`(`modulo_id`) USING BTREE,
  INDEX `fk_perfil_permiso`(`perfil_id`) USING BTREE,
  INDEX `permisos_ibfk_3`(`id_tipo_negocio`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for permisos_sede
-- ----------------------------
DROP TABLE IF EXISTS `permisos_sede`;
CREATE TABLE `permisos_sede`  (
  `persed_id_perfil` int(11) NULL DEFAULT NULL,
  `persed_id_modulo` int(11) NULL DEFAULT NULL,
  `persed_id_sede` int(11) NULL DEFAULT NULL,
  `persed_id_rubro` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  INDEX `fk_detalle_sed`(`persed_id_sede`) USING BTREE,
  INDEX `fk_detalle_per`(`persed_id_perfil`) USING BTREE,
  INDEX `fk_detalle_mod`(`persed_id_modulo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of permisos_sede
-- ----------------------------
INSERT INTO `permisos_sede` VALUES (1, 8, 1, NULL);
INSERT INTO `permisos_sede` VALUES (1, 16, 1, NULL);
INSERT INTO `permisos_sede` VALUES (1, 18, 1, NULL);
INSERT INTO `permisos_sede` VALUES (1, 19, 1, NULL);
INSERT INTO `permisos_sede` VALUES (1, 3, 1, NULL);
INSERT INTO `permisos_sede` VALUES (1, 4, 1, NULL);
INSERT INTO `permisos_sede` VALUES (1, 5, 1, NULL);
INSERT INTO `permisos_sede` VALUES (1, 6, 1, NULL);
INSERT INTO `permisos_sede` VALUES (2, 22, 1, NULL);
INSERT INTO `permisos_sede` VALUES (6, 41, 1, NULL);
INSERT INTO `permisos_sede` VALUES (6, 42, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 8, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 24, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 27, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 30, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 31, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 43, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 41, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 42, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 16, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 18, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 19, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 29, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 10, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 11, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 12, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 13, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 14, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 17, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 20, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 25, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 26, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 34, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 35, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 36, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 37, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 3, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 4, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 5, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 6, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 22, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 32, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 38, 1, NULL);
INSERT INTO `permisos_sede` VALUES (12, 39, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 8, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 24, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 27, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 30, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 31, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 41, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 16, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 18, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 19, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 10, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 11, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 12, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 13, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 14, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 17, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 20, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 34, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 35, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 36, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 37, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 22, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 32, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 38, 1, NULL);
INSERT INTO `permisos_sede` VALUES (5, 44, 1, NULL);

-- ----------------------------
-- Table structure for precio_unitario_producto
-- ----------------------------
DROP TABLE IF EXISTS `precio_unitario_producto`;
CREATE TABLE `precio_unitario_producto`  (
  `precio_unitario_producto_id` int(11) NOT NULL AUTO_INCREMENT,
  `precio_unitario_producto_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `precio_unitario_producto_valor` decimal(10, 2) NULL DEFAULT NULL,
  `detalle_unidad_producto_id` int(11) NULL DEFAULT NULL,
  `precio_unitario_producto_descuento` decimal(10, 2) NULL DEFAULT 0.00,
  `precio_unitario_producto_utilidad` decimal(10, 2) NULL DEFAULT NULL,
  `precio_unitario_producto_fijo` int(11) NULL DEFAULT 0,
  `precio_unidad_producto_precio_fijo` decimal(10, 2) NULL DEFAULT 0.00,
  `precio_unidad_producto_aplicar_fijo` int(11) NULL DEFAULT 0,
  `precio_unidad_producto_estado` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`precio_unitario_producto_id`) USING BTREE,
  INDEX `detalle_unidad_producto_id`(`detalle_unidad_producto_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of precio_unitario_producto
-- ----------------------------
INSERT INTO `precio_unitario_producto` VALUES (1, 'precio 1', 2.00, 1, 0.00, NULL, 1, 1.00, NULL, 1);
INSERT INTO `precio_unitario_producto` VALUES (2, 'precio 1', 1.00, 3, 0.00, NULL, 1, 0.00, 1, 1);
INSERT INTO `precio_unitario_producto` VALUES (3, 'precio caja de 24', 100.00, 4, 0.00, 0.00, 0, NULL, NULL, 0);
INSERT INTO `precio_unitario_producto` VALUES (4, 'Precio 1', 24.00, 6, 0.00, 0.00, 0, NULL, NULL, 0);
INSERT INTO `precio_unitario_producto` VALUES (5, 'Precio 1', 28.00, 6, 0.00, 0.00, 0, NULL, NULL, 0);
INSERT INTO `precio_unitario_producto` VALUES (6, 'precio 1', 2.00, 7, 0.00, NULL, 1, 1.00, 1, 1);
INSERT INTO `precio_unitario_producto` VALUES (7, 'precio 1', 20.00, 8, 0.00, 0.00, 0, NULL, NULL, 1);
INSERT INTO `precio_unitario_producto` VALUES (8, 'Precio 1', 18.00, 8, 0.00, 0.00, 0, NULL, NULL, 1);
INSERT INTO `precio_unitario_producto` VALUES (9, 'precio 1', 1.00, 10, 0.00, NULL, 1, 1.00, 1, 1);
INSERT INTO `precio_unitario_producto` VALUES (10, 'precio 1', 2.00, 13, 0.00, 0.00, 0, NULL, NULL, 1);
INSERT INTO `precio_unitario_producto` VALUES (11, 'precio 1', 1.00, 3, 0.00, 0.00, 0, NULL, NULL, 0);
INSERT INTO `precio_unitario_producto` VALUES (12, 'precio 1', 2.00, 15, 0.00, NULL, 1, 0.00, 1, 1);
INSERT INTO `precio_unitario_producto` VALUES (13, 'precio 1', 3.00, 16, 0.00, 3.00, 0, NULL, NULL, 1);
INSERT INTO `precio_unitario_producto` VALUES (14, 'Precio 1', 12.00, 17, 0.00, 0.00, 0, NULL, NULL, 1);
INSERT INTO `precio_unitario_producto` VALUES (15, 'precio 2', 100.00, 4, 0.00, 0.00, 0, NULL, NULL, 0);
INSERT INTO `precio_unitario_producto` VALUES (16, 'precio 4', 0.00, 3, 0.00, 10.00, 0, NULL, NULL, 0);
INSERT INTO `precio_unitario_producto` VALUES (17, 'Precio 1', 25.00, 6, 0.00, 0.00, 0, NULL, NULL, 0);
INSERT INTO `precio_unitario_producto` VALUES (18, 'Precio mayor', 0.00, 6, 0.00, 19.00, 0, NULL, NULL, 0);
INSERT INTO `precio_unitario_producto` VALUES (19, 'Precio 1', 0.00, 6, 0.00, 19.00, 0, NULL, NULL, 0);
INSERT INTO `precio_unitario_producto` VALUES (20, 'precio caja', 0.00, 18, 0.00, 10.00, 0, 0.00, 0, 1);

-- ----------------------------
-- Table structure for produccion
-- ----------------------------
DROP TABLE IF EXISTS `produccion`;
CREATE TABLE `produccion`  (
  `produccion_id` int(11) NOT NULL AUTO_INCREMENT,
  `empleado_id` int(11) NULL DEFAULT NULL,
  `produccion_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `produccion_fecha` datetime(0) NULL DEFAULT NULL,
  `produccion_observacion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `produccion_estado` int(255) NULL DEFAULT 1,
  `id_sede` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`produccion_id`) USING BTREE,
  INDEX `rwerqwrw`(`empleado_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of produccion
-- ----------------------------
INSERT INTO `produccion` VALUES (1, 1, 'Produccion de paletas', '2019-05-12 14:34:23', '', 1, '1');
INSERT INTO `produccion` VALUES (2, 1, 'Produccion de paletas', '2019-05-12 14:38:12', '', 1, '1');
INSERT INTO `produccion` VALUES (3, 1, 'Produccion de paletas', '2019-05-13 10:09:59', '', 1, '1');
INSERT INTO `produccion` VALUES (4, 1, 'Produccion de paletas', '2019-05-14 09:38:05', '', 1, '1');
INSERT INTO `produccion` VALUES (5, 1, 'Produccion de paletas', '2019-05-17 17:52:55', '', 1, '1');
INSERT INTO `produccion` VALUES (6, 1, 'Produccion de paletas', '2019-05-18 15:37:08', '', 1, '1');
INSERT INTO `produccion` VALUES (7, 1, 'Produccion de paletas', '2019-05-19 16:55:39', '', 1, '1');
INSERT INTO `produccion` VALUES (8, 1, 'Produccion de paletas', '2019-05-31 15:39:12', '', 1, '1');
INSERT INTO `produccion` VALUES (9, 1, 'Produccion de paletas', '2019-06-02 16:57:02', '', 1, '1');
INSERT INTO `produccion` VALUES (10, 1, 'Produccion de paletas', '2019-06-06 12:48:48', '', 1, '1');
INSERT INTO `produccion` VALUES (11, 1, 'Produccion de paletas', '2019-06-07 18:17:49', '', 1, '1');
INSERT INTO `produccion` VALUES (12, 1, 'Produccion de paletas', '2019-06-14 11:29:17', '', 1, '1');
INSERT INTO `produccion` VALUES (13, 1, 'Produccion de paletas', '2019-06-14 16:01:16', '', 1, '1');
INSERT INTO `produccion` VALUES (14, 1, 'Produccion de paletas', '2019-06-14 16:03:42', '', 1, '1');
INSERT INTO `produccion` VALUES (15, 1, 'Produccion de paletas', '2019-06-26 20:17:52', '', 1, '1');
INSERT INTO `produccion` VALUES (16, 1, 'Produccion de paletas', '2019-07-07 18:03:00', '', 1, '1');
INSERT INTO `produccion` VALUES (17, 1, 'Produccion de paletas', '2019-07-10 16:36:20', '', 1, '1');
INSERT INTO `produccion` VALUES (18, 1, 'Produccion de paletas', '2019-07-28 18:33:38', '', 1, '1');
INSERT INTO `produccion` VALUES (19, 1, 'Produccion de paletas', '2019-07-29 11:03:41', '', 1, '1');
INSERT INTO `produccion` VALUES (20, 1, 'Produccion de paletas', '2019-08-01 08:59:56', '', 1, '1');
INSERT INTO `produccion` VALUES (21, 1, 'Produccion de paletas', '2019-08-02 18:01:52', '', 1, '1');
INSERT INTO `produccion` VALUES (22, 1, 'Produccion de paletas', '2019-09-19 12:36:00', '', 1, '1');
INSERT INTO `produccion` VALUES (23, 1, 'Produccion de paletas', '2019-10-16 18:55:37', '', 1, '1');
INSERT INTO `produccion` VALUES (24, 1, 'Produccion de paletas', '2019-11-08 19:18:31', '', 1, '1');
INSERT INTO `produccion` VALUES (25, 1, 'Produccion de paletas', '2019-11-09 12:41:51', '', 1, '1');
INSERT INTO `produccion` VALUES (26, 1, 'Produccion de paletas', '2019-12-26 17:00:24', '', 1, '1');
INSERT INTO `produccion` VALUES (27, 1, 'Produccion de paletas', '2020-02-02 18:10:14', '', 1, '1');
INSERT INTO `produccion` VALUES (28, 1, 'Produccion de paletas', '2021-01-11 10:31:20', '', 1, '1');
INSERT INTO `produccion` VALUES (29, 1, 'Produccion de paletas', '2021-01-11 11:51:36', '', 1, '1');

-- ----------------------------
-- Table structure for produccion_producto
-- ----------------------------
DROP TABLE IF EXISTS `produccion_producto`;
CREATE TABLE `produccion_producto`  (
  `produccion_producto_id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NULL DEFAULT NULL,
  `produccion_producto_cantidad` decimal(10, 2) NULL DEFAULT NULL,
  `produccion_producto_estado` int(255) NULL DEFAULT 1,
  `detalle_unidad_producto_id` int(11) NULL DEFAULT NULL,
  `produccion_id` int(11) NULL DEFAULT NULL,
  `almacen_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`produccion_producto_id`) USING BTREE,
  INDEX `producto_id`(`producto_id`) USING BTREE,
  INDEX `detalle_unidad_producto_id`(`detalle_unidad_producto_id`) USING BTREE,
  INDEX `produccion_id`(`produccion_id`) USING BTREE,
  INDEX `almacen_id`(`almacen_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of produccion_producto
-- ----------------------------
INSERT INTO `produccion_producto` VALUES (1, 57, 5.00, 1, 3, 29, 1);

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto`  (
  `producto_id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `producto_precio` decimal(10, 2) NULL DEFAULT NULL,
  `producto_stock` int(11) NULL DEFAULT 0,
  `producto_minimo` decimal(10, 2) NULL DEFAULT 0.00,
  `producto_fecha_vencimiento` date NULL DEFAULT NULL,
  `producto_observacion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_sede` int(11) NULL DEFAULT NULL,
  `producto_estado` int(11) NULL DEFAULT 1,
  `producto_imagen` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `categoria_producto_id` int(11) NULL DEFAULT NULL,
  `producto_cantidad_receta` int(11) NULL DEFAULT NULL,
  `producto_codigobarra` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `producto_id_tipoproducto` int(11) NULL DEFAULT 1,
  `unidad_medida_id` int(11) NULL DEFAULT NULL,
  `producto_stock_temporal` decimal(11, 2) UNSIGNED ZEROFILL NULL DEFAULT 000000000.00,
  `producto_color_cocina` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `clase_id` int(11) NULL DEFAULT NULL,
  `marca_id` int(11) NULL DEFAULT NULL,
  `producto_codigo_referencia` varchar(255) CHARACTER SET macce COLLATE macce_general_ci NULL DEFAULT NULL,
  `moneda_id` int(11) NULL DEFAULT NULL,
  `producto_modelo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `proveedor_id` int(11) NULL DEFAULT NULL,
  `producto_ubicacion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `producto_kilogramo` decimal(10, 2) NULL DEFAULT NULL,
  `producto_estado_precio_fijo` int(11) NULL DEFAULT NULL,
  `producto_tipo_precio` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`producto_id`) USING BTREE,
  INDEX `categoria_producto_id`(`categoria_producto_id`) USING BTREE,
  INDEX `producto_ibfk_2`(`producto_id_tipoproducto`) USING BTREE,
  INDEX `producto_ibfk_3`(`unidad_medida_id`) USING BTREE,
  INDEX `clase_id`(`clase_id`) USING BTREE,
  INDEX `marca_id`(`marca_id`) USING BTREE,
  INDEX `moneda_id`(`moneda_id`) USING BTREE,
  INDEX `proveedor_id`(`proveedor_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 68 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO `producto` VALUES (1, 'paleta de aguaje', 3.00, 556, 0.00, NULL, NULL, 1, 1, 'a9e791e4425f7e10eaac3de59ff7f316.jpg', 1, NULL, '.', 3, 1, 000000392.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (2, 'paleta de chocolate', 3.00, 866, 0.00, NULL, NULL, 1, 1, '25a38a5a0c826b90667bba3eed686199.jpg', 1, NULL, '.', 3, 1, 000000064.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (3, 'paleta de café', 3.00, 819, 0.00, NULL, NULL, 1, 1, 'b1b0eff232d53d6caccebf26ef0f9d91.gif', 1, NULL, '.', 3, 1, 000000082.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (4, 'paleta de maní ', 3.00, 883, 0.00, NULL, NULL, 1, 1, 'a3ec268ff91f8f03467882d58d2ee23e.jpg', 1, NULL, '.', 3, 1, 000000061.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (5, 'paleta de oreo', 3.00, 707, 0.00, NULL, NULL, 1, 1, 'afb2ba2c905ad4b3989c0515c8c359a6.jpg', 1, NULL, '.', 3, 1, 000000113.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (6, 'paleta de maracuya', 3.00, 0, 0.00, NULL, NULL, 1, 0, '4508e3ae49cf9bb3beb9c77269746b5b.jpg', 1, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (7, 'paleta de camu camu', 3.00, 0, 0.00, NULL, NULL, 1, 0, 'b8ce8dbfd33db211a21e375f37535a11.jpg', 1, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (8, 'paleta de ungurahui', 3.00, 763, 0.00, NULL, NULL, 1, 1, '328747f9a6d00557c9bb0cbaaca91d48.jpg', 1, NULL, '.', 3, 1, 000000097.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (9, 'cremolada de aguaje', 4.00, 1154, 0.00, NULL, NULL, 1, 1, '05b1993d4626ad09e377adc34e13a95d.jpg', 4, NULL, '.', 3, 5, 000000696.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (10, 'cremolada de taperiba', 4.00, 573, 0.00, NULL, NULL, 1, 1, 'a9ece3d14e0172628c4b9f3fb2facb43.jpg', 4, NULL, '.', 3, 5, 000000172.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (11, 'cremolada de camu camu', 3.00, 0, 0.00, NULL, NULL, 1, 0, '746930f94bb5a0af118c93e25c2c389a.jpg', 4, NULL, '.', 3, 5, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (12, 'cremolada de ungurahui', 4.00, 414, 0.00, NULL, NULL, 1, 1, '825d7864d5e263f11a765e525d3f2d18.jpg', 4, NULL, '.', 3, 5, 000000242.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (13, '1 bola de helado', 2.00, 69, 0.00, NULL, NULL, 1, 1, '795be9a165cd72265852144fbd93b471.jpg', 3, NULL, '.', 3, 1, 000000901.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (14, '3 bolas de helado', 6.00, 1167, 0.00, NULL, NULL, 1, 1, '46a919ddf682cbed955c7733a1030496.jpg', 3, NULL, '.', 3, 1, 000000348.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (15, '2 bolas de helado', 4.00, 520, 0.00, NULL, NULL, 1, 1, '1d74d4227906c7c8dbc1ffe9c08656e3.jpg', 3, NULL, '.', 3, 1, 000001027.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (16, '1 bola de helado de café', 2.00, 44, 30.00, NULL, NULL, 1, 0, '5f044078d88ffa20260d443eecf6f6cd.jpg', 3, NULL, '.', 3, 1, 000000003.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (17, '2 bolas de helado de café', 4.00, 47, 30.00, NULL, NULL, 1, 0, '3e6c818ad8fc3343bf827f1a7e4d2683.jpg', 3, NULL, '.', 3, 1, 000000001.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (18, '3 bolas de helado de café', 5.00, 50, 30.00, NULL, NULL, 1, 0, '73d04bb5edeaa8c30d50ec690907c313.jpg', 3, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (19, '1 bola de helado de ungurahui', 2.00, 20, 30.00, NULL, NULL, 1, 0, '09c017939b28966ddf886cc4ee9f9b85.jpg', 3, NULL, '.', 3, 1, 000000003.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (20, '2 bolas de helado de ungurahui', 4.00, 26, 30.00, NULL, NULL, 1, 0, 'c7c9f324a64efa19ce60002b40c44146.jpg', 3, NULL, '.', 3, 1, 000000001.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (21, '3 bolas de helado de ungurahui', 5.00, 30, 30.00, NULL, NULL, 1, 0, '02372960f950ae667f641c891ea2bbc5.jpg', 3, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (22, '1 bola de helado de mani', 2.00, 48, 30.00, NULL, NULL, 1, 0, '28c854493b304f304e207ab1cd1fca52.jpg', 3, NULL, '.', 3, 1, 000000001.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (23, '2 bolas de helado de maní', 4.00, 47, 30.00, NULL, NULL, 1, 0, '742471674c9839b4e25ae5056c5e1322.jpg', 3, NULL, '.', 3, 1, 000000001.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (24, '3 bolas de helado de maní', 5.00, 50, 30.00, NULL, NULL, 1, 0, '61730b5068ee677f1a7288dbcdd7a688.jpg', 3, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (25, '1 bola de helado de chocolate', 2.00, 23, 30.00, NULL, NULL, 1, 0, 'b7a2ca1c042455db1448d14ab2348226.jpg', 3, NULL, '.', 3, 1, 000000003.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (26, '2 bolas de helado de chocolate', 4.00, 28, 30.00, NULL, NULL, 1, 0, '499127505fb53d695a1211f19d265170.jpg', 3, NULL, '.', 3, 1, 000000001.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (27, '3 bolas de helado de chocolate', 5.00, 30, 30.00, NULL, NULL, 1, 0, '157452c9611aba28cbb75a49675223c8.jpg', 3, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (28, '1 bola de helado de oreo', 2.00, 0, 30.00, NULL, NULL, 1, 0, 'ec6fc6cad7b5810cea3314f26c7369f8.jpg', 3, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (29, '2 bolas de helado de oreo', 4.00, 0, 30.00, NULL, NULL, 1, 0, '854c80fd887f6264a8d6d0c7860a07a7.jpg', 3, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (30, '3 bolas de helado de oreo', 5.00, 0, 0.00, NULL, NULL, 1, 0, '295f4587204ee585f6e7d5926097778a.jpg', 3, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (31, '1 bola de helado de temporada', 2.00, 0, 30.00, NULL, NULL, 1, 0, '6f038c0a9361fe438188e5a62b73d690.jpg', 3, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (32, '2 bolas de helado de temporada', 4.00, 0, 4.00, NULL, NULL, 1, 0, 'caa22308d27199d18007056bdc13c5a6.jpg', 3, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (33, '3 bolas de helado de temporada', 5.00, 0, 30.00, NULL, NULL, 1, 0, 'fb4b09a17e6158109b3d55ba35529fbd.jpg', 3, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (34, 'cremolada de temporada', 3.00, 0, 30.00, NULL, NULL, 1, 0, 'dbcb660e285c8829aa81420942dd9222.jpg', 4, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (35, 'paleta de temporada', 3.00, 0, 60.00, NULL, NULL, 1, 0, 'b09afc8ba10cf282164c54a6ae2b99cf.jpg', 1, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (36, 'café americano', 3.00, 167, 0.00, NULL, NULL, 1, 1, '0ddf38cb37157c3dfd644cac0b31bc27.jpg', 6, NULL, '.', 3, 1, 000000035.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (37, 'capuchino', 5.00, 62, 0.00, NULL, NULL, 1, 1, 'e55c409ddd80bba9c96dfb7c9e77966e.jpg', 6, NULL, '.', 3, 1, 000000071.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (38, 'café espresso', 4.00, 231, 0.00, NULL, NULL, 1, 1, '3bdfd3e9abbf05e95b450345b15b26c2.jpg', 6, NULL, '.', 3, 1, 000000008.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (39, 'sándwich de jamón y queso', 3.00, 920, 0.00, NULL, NULL, 1, 1, 'a5835bf319a058f6d43c8a0415ff4420.jpg', 7, NULL, '.', 3, 1, 000000126.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (40, 'sándwich de huevo y queso', 4.00, 113, 0.00, NULL, NULL, 1, 1, '4ae498bdb2f56db812300d2ead048c15.jpg', 7, NULL, '.', 3, 1, 000000037.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (41, 'keke de naranja', 2.00, 672, 0.00, NULL, NULL, 1, 1, '8c46a71b8dee50b047ac8dd6a88330b2.jpg', 8, NULL, '.', 3, 1, 000000350.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (42, 'keke de chocolate', 2.00, 153, 0.00, NULL, NULL, 1, 1, '761bd188d718a168629d53975f08f61e.jpg', 8, NULL, '.', 3, 1, 000000057.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (43, 'agua mineral', 2.00, 752, 0.00, NULL, NULL, 1, 1, '8ce4f94b1ae316a058b670341110cb30.jpg', 9, NULL, '.', 3, 1, 000000145.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (44, 'cono con 1 bola de helado', 3.00, 2128, 0.00, NULL, NULL, 1, 1, '7977d25ad7bdd0bcd22554380ad65d45.jpg', 3, NULL, '.', 3, 16, 000000008.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (45, 'cono con 2 bolas de helado', 4.00, 138, 0.00, NULL, NULL, 1, 1, '344370a0ca2e85568664bc259a5311f0.jpg', 3, NULL, '.', 3, 16, 000000005.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (46, 'cubeta de helado de aguaje', 0.00, 0, 0.00, NULL, NULL, 1, 0, '5d7a3f8c0341a333dfe0795fd50b380d.jpg', 10, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (47, 'cubeta de helado de café', 0.00, 0, 0.00, NULL, NULL, 1, 0, '3658d00d89df0db202abb2c25fc2dd83.jpg', 10, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (48, 'cubeta de helado de ungurahui', 0.00, 0, 0.00, NULL, NULL, 1, 0, '82bb1ac6da8dc90936657db7071390f9.jpg', 10, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (49, 'cubeta de helado de mani', 0.00, 0, 0.00, NULL, NULL, 1, 0, '22e444a7dab55ff7c216316d07b7b15e.jpg', 10, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (50, 'cubeta de helado de chocolate', 0.00, 0, 0.00, NULL, NULL, 1, 0, '4090b769aad22113df6c425192832985.jpg', 10, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (51, 'cubeta de helado de oreo', 0.00, 0, 0.00, NULL, NULL, 1, 0, 'fb47ee854ba38572fc88c7331c1076cd.jpg', 10, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (52, 'cubeta de helado de temporada', 0.00, 0, 0.00, NULL, NULL, 1, 0, 'e9878b9c16456c38ffe983e9227206ee.jpg', 10, NULL, '.', 3, 1, 000000000.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (53, 'Agua sin gas San Luis de 625 ml', 2.00, 0, 0.00, NULL, NULL, 1, 0, '', NULL, NULL, '.', 1, 46, 000000000.00, NULL, 1, 1, '.', 1, '', NULL, 'Cocina', 0.00, 1, NULL);
INSERT INTO `producto` VALUES (54, 'Chifle', 1.00, 73, 0.00, NULL, NULL, 1, 1, '9797c3a64beea8b2b7ab9ddaecb77588.jpeg', 6, NULL, '.', 3, 1, 000000042.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (55, 'Chifon', 2.00, 60, 0.00, NULL, NULL, 1, 1, '7153b30a3405406367812fb933ff89c1.jpeg', 8, NULL, '.', 3, 1, 000000059.00, NULL, NULL, NULL, '. ', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (56, 'Sandwich de pollo', 3.00, 80, 0.00, NULL, NULL, 1, 1, '169212efcf366aad688b5253950fced6.jpeg', 7, NULL, '. ', 3, 1, 000000006.00, NULL, NULL, NULL, '. ', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (57, 'Barquillos', 1.00, 0, 1009.00, NULL, NULL, 1, 1, 'c12543efe38f1a076d368441226f5b35.jpg', NULL, NULL, '13123', 1, 26, 000000000.00, NULL, 2, 1, '13123', 1, '0.5', NULL, '31231', 1.00, 0, 1);
INSERT INTO `producto` VALUES (58, 'Copa Aguaje', 5.00, 30, 0.00, NULL, NULL, 1, 1, 'b9a3832dc44929d6ba82488c876c5a27.jpg', 3, NULL, '. ', 3, 1, 000000002.00, NULL, NULL, NULL, '. ', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (59, 'Copa Chocolate', 5.00, 60, 0.00, NULL, NULL, 1, 1, '38164ce0beb61a5637fb73b14a7ac719.jpg', 3, NULL, '. ', 3, 1, 000000000.00, NULL, NULL, NULL, '. ', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (60, 'eqwe', 2.00, 0, 11.00, NULL, NULL, 1, 0, '', NULL, NULL, '3123', 1, 21, 000000000.00, NULL, 1, 1, '312313221', 1, 'eqwe', NULL, 'eqwe', 0.00, 1, 1);
INSERT INTO `producto` VALUES (61, 'bolsa de plastico', 0.10, 39, 0.00, NULL, NULL, 1, 1, '621434e990e78e65fe61c6405e2f194f.jpg', 11, NULL, '.', 3, 1, 000000005.00, NULL, NULL, NULL, '.', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (62, NULL, NULL, 0, NULL, NULL, NULL, 1, 1, '78789b5b5c1eacdb43530714eb82ae45.png', NULL, NULL, NULL, 3, NULL, 000000000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (63, 'Cremolada de Cocona ', 4.00, 0, 0.00, NULL, NULL, 1, 1, '566c9a47ded616bdcc3862b3f7414b51.jpg', 4, NULL, '. ', 3, 1, 000000000.00, NULL, NULL, NULL, '. ', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (64, 'prueba23', 1.00, 0, 3.00, NULL, NULL, 1, 0, '', NULL, NULL, '', 1, 1, 000000000.00, NULL, 1, 1, '|3123123', 1, '', NULL, 'fdsf', 0.00, 1, 1);
INSERT INTO `producto` VALUES (65, 'Barquillo', 0.50, 964, 0.00, NULL, NULL, 1, 1, 'f2b0c4fdf505063008b548ecc954ee12.jpeg', 3, NULL, '. ', 3, 1, 000000002.00, NULL, NULL, NULL, '. ', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `producto` VALUES (66, 'prueba agua', 2.00, 0, 0.00, NULL, NULL, 1, 1, '', NULL, NULL, '123123123', 1, 1, 000000000.00, NULL, 1, 1, '3213213', 1, '1', NULL, '1', 0.00, 0, 1);
INSERT INTO `producto` VALUES (67, 'delivery', 2.00, 999998, 0.00, NULL, NULL, 1, 1, 'default.jpg', 13, NULL, '1231', 3, 2, 000000000.00, NULL, NULL, NULL, '3123123123', 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for producto_plato
-- ----------------------------
DROP TABLE IF EXISTS `producto_plato`;
CREATE TABLE `producto_plato`  (
  `produccion_plato_id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) NULL DEFAULT NULL,
  `produccion_plato_cantidad` decimal(15, 2) NULL DEFAULT NULL,
  `produccion_plato_estado` int(255) NULL DEFAULT 1,
  `produccion_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`produccion_plato_id`) USING BTREE,
  INDEX `rwerwer`(`producto_id`) USING BTREE,
  INDEX `produccion_id`(`produccion_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of producto_plato
-- ----------------------------
INSERT INTO `producto_plato` VALUES (1, 17, 50.00, 1, 1);
INSERT INTO `producto_plato` VALUES (2, 16, 50.00, 1, 1);
INSERT INTO `producto_plato` VALUES (3, 24, 50.00, 1, 1);
INSERT INTO `producto_plato` VALUES (4, 23, 50.00, 1, 1);
INSERT INTO `producto_plato` VALUES (5, 22, 50.00, 1, 1);
INSERT INTO `producto_plato` VALUES (6, 27, 30.00, 1, 1);
INSERT INTO `producto_plato` VALUES (7, 26, 30.00, 1, 1);
INSERT INTO `producto_plato` VALUES (8, 25, 30.00, 1, 1);
INSERT INTO `producto_plato` VALUES (9, 21, 30.00, 1, 1);
INSERT INTO `producto_plato` VALUES (10, 20, 30.00, 1, 1);
INSERT INTO `producto_plato` VALUES (11, 19, 30.00, 1, 1);
INSERT INTO `producto_plato` VALUES (12, 15, 30.00, 1, 1);
INSERT INTO `producto_plato` VALUES (13, 14, 30.00, 1, 1);
INSERT INTO `producto_plato` VALUES (14, 13, 30.00, 1, 1);
INSERT INTO `producto_plato` VALUES (15, 8, 60.00, 1, 1);
INSERT INTO `producto_plato` VALUES (16, 5, 60.00, 1, 1);
INSERT INTO `producto_plato` VALUES (17, 4, 60.00, 1, 1);
INSERT INTO `producto_plato` VALUES (18, 3, 60.00, 1, 1);
INSERT INTO `producto_plato` VALUES (19, 2, 60.00, 1, 1);
INSERT INTO `producto_plato` VALUES (20, 1, 60.00, 1, 1);
INSERT INTO `producto_plato` VALUES (21, 42, 50.00, 1, 2);
INSERT INTO `producto_plato` VALUES (22, 41, 50.00, 1, 2);
INSERT INTO `producto_plato` VALUES (23, 38, 50.00, 1, 2);
INSERT INTO `producto_plato` VALUES (24, 37, 50.00, 1, 2);
INSERT INTO `producto_plato` VALUES (25, 36, 50.00, 1, 2);
INSERT INTO `producto_plato` VALUES (26, 18, 50.00, 1, 2);
INSERT INTO `producto_plato` VALUES (27, 12, 50.00, 1, 2);
INSERT INTO `producto_plato` VALUES (28, 10, 50.00, 1, 2);
INSERT INTO `producto_plato` VALUES (29, 9, 50.00, 1, 2);
INSERT INTO `producto_plato` VALUES (30, 42, 50.00, 1, 3);
INSERT INTO `producto_plato` VALUES (31, 41, 50.00, 1, 3);
INSERT INTO `producto_plato` VALUES (32, 15, 1000.00, 1, 3);
INSERT INTO `producto_plato` VALUES (33, 14, 1000.00, 1, 3);
INSERT INTO `producto_plato` VALUES (34, 13, 1000.00, 1, 3);
INSERT INTO `producto_plato` VALUES (35, 40, 100.00, 1, 3);
INSERT INTO `producto_plato` VALUES (36, 39, 100.00, 1, 3);
INSERT INTO `producto_plato` VALUES (37, 37, 100.00, 1, 3);
INSERT INTO `producto_plato` VALUES (38, 38, 100.00, 1, 3);
INSERT INTO `producto_plato` VALUES (39, 36, 100.00, 1, 3);
INSERT INTO `producto_plato` VALUES (40, 12, 1000.00, 1, 3);
INSERT INTO `producto_plato` VALUES (41, 10, 1000.00, 1, 3);
INSERT INTO `producto_plato` VALUES (42, 9, 1000.00, 1, 3);
INSERT INTO `producto_plato` VALUES (43, 45, 50.00, 1, 3);
INSERT INTO `producto_plato` VALUES (44, 44, 50.00, 1, 3);
INSERT INTO `producto_plato` VALUES (45, 45, 100.00, 1, 4);
INSERT INTO `producto_plato` VALUES (46, 44, 100.00, 1, 4);
INSERT INTO `producto_plato` VALUES (47, 43, 100.00, 1, 4);
INSERT INTO `producto_plato` VALUES (48, 42, 100.00, 1, 4);
INSERT INTO `producto_plato` VALUES (49, 41, 100.00, 1, 4);
INSERT INTO `producto_plato` VALUES (50, 40, 100.00, 1, 4);
INSERT INTO `producto_plato` VALUES (51, 39, 100.00, 1, 4);
INSERT INTO `producto_plato` VALUES (52, 38, 100.00, 1, 4);
INSERT INTO `producto_plato` VALUES (53, 37, 100.00, 1, 4);
INSERT INTO `producto_plato` VALUES (54, 36, 100.00, 1, 4);
INSERT INTO `producto_plato` VALUES (55, 5, 60.00, 1, 4);
INSERT INTO `producto_plato` VALUES (56, 4, 60.00, 1, 4);
INSERT INTO `producto_plato` VALUES (57, 3, 60.00, 1, 4);
INSERT INTO `producto_plato` VALUES (58, 2, 60.00, 1, 4);
INSERT INTO `producto_plato` VALUES (59, 1, 60.00, 1, 4);
INSERT INTO `producto_plato` VALUES (60, 1, 100.00, 1, 5);
INSERT INTO `producto_plato` VALUES (61, 8, 100.00, 1, 6);
INSERT INTO `producto_plato` VALUES (62, 1, 200.00, 1, 7);
INSERT INTO `producto_plato` VALUES (63, 1, 1000.00, 1, 8);
INSERT INTO `producto_plato` VALUES (64, 8, 1000.00, 1, 9);
INSERT INTO `producto_plato` VALUES (65, 5, 1000.00, 1, 9);
INSERT INTO `producto_plato` VALUES (66, 55, 100.00, 1, 10);
INSERT INTO `producto_plato` VALUES (67, 54, 100.00, 1, 10);
INSERT INTO `producto_plato` VALUES (68, 41, 100.00, 1, 11);
INSERT INTO `producto_plato` VALUES (69, 2, 1000.00, 1, 12);
INSERT INTO `producto_plato` VALUES (70, 3, 1000.00, 1, 13);
INSERT INTO `producto_plato` VALUES (71, 4, 1000.00, 1, 14);
INSERT INTO `producto_plato` VALUES (72, 56, 100.00, 1, 15);
INSERT INTO `producto_plato` VALUES (73, 44, 1000.00, 1, 16);
INSERT INTO `producto_plato` VALUES (74, 14, 1000.00, 1, 16);
INSERT INTO `producto_plato` VALUES (75, 15, 1000.00, 1, 16);
INSERT INTO `producto_plato` VALUES (76, 13, 1000.00, 1, 16);
INSERT INTO `producto_plato` VALUES (77, 41, 100.00, 1, 17);
INSERT INTO `producto_plato` VALUES (78, 54, 100.00, 1, 18);
INSERT INTO `producto_plato` VALUES (79, 42, 100.00, 1, 18);
INSERT INTO `producto_plato` VALUES (80, 41, 100.00, 1, 18);
INSERT INTO `producto_plato` VALUES (81, 55, 100.00, 1, 18);
INSERT INTO `producto_plato` VALUES (82, 59, 100.00, 1, 19);
INSERT INTO `producto_plato` VALUES (83, 58, 100.00, 1, 19);
INSERT INTO `producto_plato` VALUES (84, 61, 100.00, 1, 20);
INSERT INTO `producto_plato` VALUES (85, 43, 1000.00, 1, 21);
INSERT INTO `producto_plato` VALUES (86, 65, 1000.00, 1, 22);
INSERT INTO `producto_plato` VALUES (87, 9, 1000.00, 1, 23);
INSERT INTO `producto_plato` VALUES (88, 41, 1000.00, 1, 23);
INSERT INTO `producto_plato` VALUES (89, 9, 1000.00, 1, 24);
INSERT INTO `producto_plato` VALUES (90, 1, 1000.00, 1, 25);
INSERT INTO `producto_plato` VALUES (91, 44, 1000.00, 1, 26);
INSERT INTO `producto_plato` VALUES (92, 13, 1000.00, 1, 26);
INSERT INTO `producto_plato` VALUES (93, 15, 1000.00, 1, 27);
INSERT INTO `producto_plato` VALUES (94, 67, 999999.00, 1, 28);
INSERT INTO `producto_plato` VALUES (95, 58, 30.00, 1, 29);
INSERT INTO `producto_plato` VALUES (96, 2, 50.00, 1, 29);
INSERT INTO `producto_plato` VALUES (97, 1, 10.00, 1, 29);

-- ----------------------------
-- Table structure for proveedores
-- ----------------------------
DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE `proveedores`  (
  `proveedor_id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_razonsocial` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `proveedor_direccion` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `proveedor_ruc` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `proveedor_ciudad` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `proveedor_telefono` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `proveedor_nombrecomercial` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `proveedor_email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `proveedor_website` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `proveedor_contacto` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `proveedor_estado` int(1) NULL DEFAULT 1,
  `empresa_ruc` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `proveedor_estado_habido` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `proveedor_sede_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`) USING BTREE,
  INDEX `empresa_ruc`(`empresa_ruc`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of proveedores
-- ----------------------------
INSERT INTO `proveedores` VALUES (1, 'Sapolio', 'Calle Teniente Cesar López ', '78965412365', 'yurimaguas', '', 'mark expres', 'mak@hotmail.com', '-h', '-', 1, NULL, '', NULL);
INSERT INTO `proveedores` VALUES (15, 'dkasdjsa', 'dasdasd', '10752705866', 'eqwe', '933312262', '', '', '', '', 1, NULL, '', NULL);

-- ----------------------------
-- Table structure for provincia
-- ----------------------------
DROP TABLE IF EXISTS `provincia`;
CREATE TABLE `provincia`  (
  `id_provincia` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `observacion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_departamento` int(11) NULL DEFAULT NULL,
  `estado` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id_provincia`) USING BTREE,
  INDEX `sasasd`(`id_departamento`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sector_atencion
-- ----------------------------
DROP TABLE IF EXISTS `sector_atencion`;
CREATE TABLE `sector_atencion`  (
  `sector_atencion_id` int(11) NOT NULL AUTO_INCREMENT,
  `sector_atencion_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sector_atencion_precio` decimal(11, 2) NULL DEFAULT NULL,
  `sector_atencion_estado` int(11) NULL DEFAULT 1,
  `id_sede` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sector_atencion_id`) USING BTREE,
  INDEX `sdfsdf`(`id_sede`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sector_mesa
-- ----------------------------
DROP TABLE IF EXISTS `sector_mesa`;
CREATE TABLE `sector_mesa`  (
  `sector_mesa_id` int(11) NOT NULL AUTO_INCREMENT,
  `sector_mesa_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sector_mesa_estado` int(11) NULL DEFAULT 1,
  `id_sede` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`sector_mesa_id`) USING BTREE,
  INDEX `dasdasdasd`(`id_sede`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sede
-- ----------------------------
DROP TABLE IF EXISTS `sede`;
CREATE TABLE `sede`  (
  `id_sede` int(11) NOT NULL AUTO_INCREMENT,
  `sede_direccion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sede_telefono` int(11) NULL DEFAULT NULL,
  `sede_observacion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sede_horario_m_i` time(0) NULL DEFAULT NULL,
  `sede_horario_m` time(0) NULL DEFAULT NULL,
  `sede_horario_t_i` time(0) NULL DEFAULT NULL,
  `sede_horario_t` time(0) NULL DEFAULT NULL,
  `id_distrito` int(11) NULL DEFAULT NULL,
  `sede_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_provincia` int(11) NULL DEFAULT NULL,
  `id_departamento` int(11) NULL DEFAULT NULL,
  `sede_estado` int(11) NULL DEFAULT 1,
  `id_banco` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_sede`) USING BTREE,
  INDEX `id_distrito`(`id_distrito`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sede
-- ----------------------------
INSERT INTO `sede` VALUES (1, 'Calle Teniente Cesar López 116', 959982365, 'Yurimaguas', NULL, NULL, NULL, NULL, NULL, 'Yurimaguas', NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for sede_caja
-- ----------------------------
DROP TABLE IF EXISTS `sede_caja`;
CREATE TABLE `sede_caja`  (
  `id_sede_caja` int(11) NOT NULL AUTO_INCREMENT,
  `id_caja` int(11) NULL DEFAULT NULL,
  `id_sede` int(11) NULL DEFAULT NULL,
  `sede_caja_monto` float NULL DEFAULT 0,
  PRIMARY KEY (`id_sede_caja`) USING BTREE,
  INDEX `id_sede`(`id_sede`) USING BTREE,
  INDEX `id_caja`(`id_caja`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sede_caja
-- ----------------------------
INSERT INTO `sede_caja` VALUES (1, 1, 1, 28491.2);
INSERT INTO `sede_caja` VALUES (2, 2, 1, -340);

-- ----------------------------
-- Table structure for sesion_caja
-- ----------------------------
DROP TABLE IF EXISTS `sesion_caja`;
CREATE TABLE `sesion_caja`  (
  `id_sesion_caja` int(11) NOT NULL AUTO_INCREMENT,
  `id_empleado` int(11) NULL DEFAULT NULL,
  `id_sede_caja` int(11) NULL DEFAULT NULL,
  `ses_fechaapertura` datetime(0) NULL DEFAULT NULL,
  `ses_montoapertura` decimal(10, 2) NULL DEFAULT NULL,
  `ses_montocierre` decimal(10, 2) NULL DEFAULT NULL,
  `ses_estado` int(11) NULL DEFAULT 1,
  `ses_fechacierre` datetime(0) NULL DEFAULT NULL,
  `ses_montoinicial` decimal(12, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_sesion_caja`) USING BTREE,
  INDEX `id_usuario`(`id_empleado`) USING BTREE,
  INDEX `id_sede_caja`(`id_sede_caja`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 557 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sesion_caja
-- ----------------------------
INSERT INTO `sesion_caja` VALUES (1, 3, 1, '2019-05-12 14:23:00', 0.00, 535.00, 0, '2019-05-12 20:33:00', 100.00);
INSERT INTO `sesion_caja` VALUES (2, 3, 2, '2019-05-12 14:23:00', 0.00, 0.00, 0, '2019-05-12 20:33:00', 0.00);
INSERT INTO `sesion_caja` VALUES (3, 3, 1, '2019-05-14 09:14:00', 435.00, 613.00, 0, '2019-05-15 00:41:00', 200.00);
INSERT INTO `sesion_caja` VALUES (4, 3, 2, '2019-05-14 09:14:00', 0.00, 0.00, 0, '2019-05-15 00:41:00', 0.00);
INSERT INTO `sesion_caja` VALUES (5, 3, 1, '2019-05-15 09:21:00', 613.00, 824.00, 0, '2019-05-15 21:14:00', 200.00);
INSERT INTO `sesion_caja` VALUES (6, 3, 2, '2019-05-15 09:21:00', 0.00, 0.00, 0, '2019-05-15 21:14:00', 0.00);
INSERT INTO `sesion_caja` VALUES (7, 3, 1, '2019-05-16 09:12:00', 823.00, 1056.00, 0, '2019-05-16 21:08:00', 201.00);
INSERT INTO `sesion_caja` VALUES (8, 3, 2, '2019-05-16 09:12:00', 0.00, 0.00, 0, '2019-05-16 21:08:00', 0.00);
INSERT INTO `sesion_caja` VALUES (9, 3, 1, '2019-05-17 09:10:00', 1053.00, 1583.50, 0, '2019-05-17 21:38:00', 204.00);
INSERT INTO `sesion_caja` VALUES (10, 3, 2, '2019-05-17 09:10:00', 0.00, 0.00, 0, '2019-05-17 21:38:00', 0.00);
INSERT INTO `sesion_caja` VALUES (11, 3, 1, '2019-05-18 09:55:00', 1433.50, 1814.50, 0, '2019-05-18 21:12:00', 354.00);
INSERT INTO `sesion_caja` VALUES (12, 3, 2, '2019-05-18 09:55:00', 0.00, 0.00, 0, '2019-05-18 21:12:00', 0.00);
INSERT INTO `sesion_caja` VALUES (13, 3, 1, '2019-05-19 09:43:00', 1963.50, 1963.50, 0, '2019-05-19 09:47:00', 205.00);
INSERT INTO `sesion_caja` VALUES (14, 3, 2, '2019-05-19 09:43:00', 0.00, 0.00, 0, '2019-05-19 09:47:00', 0.00);
INSERT INTO `sesion_caja` VALUES (15, 3, 1, '2019-05-19 09:47:00', 1433.50, 1940.50, 0, '2019-05-19 22:34:00', 735.00);
INSERT INTO `sesion_caja` VALUES (16, 3, 2, '2019-05-19 09:47:00', 0.00, 0.00, 0, '2019-05-19 22:34:00', 0.00);
INSERT INTO `sesion_caja` VALUES (17, 3, 1, '2019-05-21 09:30:00', 2073.50, 1630.50, 0, '2019-05-21 09:46:00', 602.00);
INSERT INTO `sesion_caja` VALUES (18, 3, 2, '2019-05-21 09:30:00', 0.00, 0.00, 0, '2019-05-21 09:46:00', 0.00);
INSERT INTO `sesion_caja` VALUES (19, 3, 1, '2019-05-21 09:46:00', 2023.50, 2277.50, 0, '2019-05-21 21:12:00', 209.00);
INSERT INTO `sesion_caja` VALUES (20, 3, 2, '2019-05-21 09:46:00', 0.00, 0.00, 0, '2019-05-21 21:12:00', 0.00);
INSERT INTO `sesion_caja` VALUES (21, 3, 1, '2019-05-22 09:13:00', 2223.50, 2418.50, 0, '2019-05-22 21:02:00', 263.00);
INSERT INTO `sesion_caja` VALUES (22, 3, 2, '2019-05-22 09:13:00', 0.00, 0.00, 0, '2019-05-22 21:02:00', 0.00);
INSERT INTO `sesion_caja` VALUES (23, 3, 1, '2019-05-23 09:20:00', 2373.50, 2521.00, 0, '2019-05-23 21:45:00', 308.00);
INSERT INTO `sesion_caja` VALUES (24, 3, 2, '2019-05-23 09:20:00', 0.00, 0.00, 0, '2019-05-23 21:45:00', 0.00);
INSERT INTO `sesion_caja` VALUES (25, 3, 1, '2019-05-24 10:31:00', 2573.50, 2891.00, 0, '2019-05-24 22:05:00', 255.50);
INSERT INTO `sesion_caja` VALUES (26, 3, 2, '2019-05-24 10:31:00', 0.00, 0.00, 0, '2019-05-24 22:05:00', 0.00);
INSERT INTO `sesion_caja` VALUES (27, 3, 1, '2019-05-25 11:55:00', 2813.50, 2911.50, 0, '2019-05-26 13:27:00', 333.00);
INSERT INTO `sesion_caja` VALUES (28, 3, 2, '2019-05-25 11:55:00', 0.00, 0.00, 0, '2019-05-26 13:27:00', 0.00);
INSERT INTO `sesion_caja` VALUES (29, 3, 1, '2019-05-26 13:27:00', 3043.50, 3275.50, 0, '2019-05-26 22:16:00', 201.00);
INSERT INTO `sesion_caja` VALUES (30, 3, 2, '2019-05-26 13:27:00', 0.00, 0.00, 0, '2019-05-26 22:16:00', 0.00);
INSERT INTO `sesion_caja` VALUES (31, 3, 1, '2019-05-28 11:02:00', 3276.50, 3278.50, 0, '2019-05-28 11:46:00', 200.00);
INSERT INTO `sesion_caja` VALUES (32, 3, 2, '2019-05-28 11:02:00', 0.00, 0.00, 0, '2019-05-28 11:46:00', 0.00);
INSERT INTO `sesion_caja` VALUES (33, 3, 1, '2019-05-28 11:48:00', 3306.50, 3472.10, 0, '2019-05-28 21:17:00', 172.00);
INSERT INTO `sesion_caja` VALUES (34, 3, 2, '2019-05-28 11:48:00', 0.00, 0.00, 0, '2019-05-28 21:17:00', 0.00);
INSERT INTO `sesion_caja` VALUES (35, 3, 1, '2019-05-29 09:29:00', 3507.10, 3639.10, 0, '2019-05-29 21:00:00', 137.00);
INSERT INTO `sesion_caja` VALUES (36, 3, 2, '2019-05-29 09:29:00', 0.00, 0.00, 0, '2019-05-29 21:00:00', 0.00);
INSERT INTO `sesion_caja` VALUES (37, 3, 1, '2019-05-30 10:16:00', 3666.10, 3819.10, 0, '2019-05-30 21:16:00', 110.00);
INSERT INTO `sesion_caja` VALUES (38, 3, 2, '2019-05-30 10:16:00', 0.00, 0.00, 0, '2019-05-30 21:16:00', 0.00);
INSERT INTO `sesion_caja` VALUES (39, 3, 1, '2019-05-31 09:56:00', 3826.10, 4053.10, 0, '2019-05-31 21:23:00', 103.00);
INSERT INTO `sesion_caja` VALUES (40, 3, 2, '2019-05-31 09:56:00', 0.00, 0.00, 0, '2019-05-31 21:23:00', 0.00);
INSERT INTO `sesion_caja` VALUES (41, 3, 1, '2019-06-01 11:51:00', 4026.10, 4255.10, 0, '2019-06-02 11:52:00', 130.00);
INSERT INTO `sesion_caja` VALUES (42, 3, 2, '2019-06-01 11:51:00', 0.00, 0.00, 0, '2019-06-02 11:52:00', 0.00);
INSERT INTO `sesion_caja` VALUES (43, 3, 1, '2019-06-02 12:31:00', 2985.10, 2985.10, 0, '2019-06-02 12:33:00', 100.00);
INSERT INTO `sesion_caja` VALUES (44, 3, 2, '2019-06-02 12:31:00', 0.00, 0.00, 0, '2019-06-02 12:33:00', 0.00);
INSERT INTO `sesion_caja` VALUES (45, 3, 1, '2019-06-02 12:33:00', 2976.10, 3423.10, 0, '2019-06-02 21:41:00', 109.00);
INSERT INTO `sesion_caja` VALUES (46, 3, 2, '2019-06-02 12:33:00', 0.00, 0.00, 0, '2019-06-02 21:41:00', 0.00);
INSERT INTO `sesion_caja` VALUES (47, 3, 1, '2019-06-04 09:45:00', 3427.10, 3479.10, 0, '2019-06-04 20:58:00', 105.00);
INSERT INTO `sesion_caja` VALUES (48, 3, 2, '2019-06-04 09:45:00', 0.00, 0.00, 0, '2019-06-04 20:58:00', 0.00);
INSERT INTO `sesion_caja` VALUES (49, 3, 1, '2019-06-05 11:17:00', 3477.10, 3631.10, 0, '2019-06-05 20:58:00', 107.00);
INSERT INTO `sesion_caja` VALUES (50, 3, 2, '2019-06-05 11:17:00', 0.00, 0.00, 0, '2019-06-05 20:58:00', 0.00);
INSERT INTO `sesion_caja` VALUES (51, 3, 1, '2019-06-06 09:48:00', 3637.10, 3796.10, 0, '2019-06-06 21:09:00', 101.00);
INSERT INTO `sesion_caja` VALUES (52, 3, 2, '2019-06-06 09:48:00', 0.00, 0.00, 0, '2019-06-06 21:09:00', 0.00);
INSERT INTO `sesion_caja` VALUES (53, 3, 1, '2019-06-07 09:27:00', 3797.10, 4098.10, 0, '2019-06-07 22:53:00', 100.00);
INSERT INTO `sesion_caja` VALUES (54, 3, 2, '2019-06-07 09:27:00', 0.00, 0.00, 0, '2019-06-07 22:53:00', 0.00);
INSERT INTO `sesion_caja` VALUES (55, 3, 1, '2019-06-08 10:33:00', 4098.10, 4177.10, 0, '2019-06-09 09:48:00', 100.00);
INSERT INTO `sesion_caja` VALUES (56, 3, 2, '2019-06-08 10:33:00', 0.00, 0.00, 0, '2019-06-09 09:48:00', 0.00);
INSERT INTO `sesion_caja` VALUES (57, 3, 1, '2019-06-09 09:49:00', 4177.10, 4494.10, 0, '2019-06-09 22:03:00', 100.00);
INSERT INTO `sesion_caja` VALUES (58, 3, 2, '2019-06-09 09:49:00', 0.00, 0.00, 0, '2019-06-09 22:03:00', 0.00);
INSERT INTO `sesion_caja` VALUES (59, 3, 1, '2019-06-10 15:07:00', 4494.10, 4569.10, 0, '2019-06-10 20:40:00', 100.00);
INSERT INTO `sesion_caja` VALUES (60, 3, 2, '2019-06-10 15:07:00', 0.00, 0.00, 0, '2019-06-10 20:40:00', 0.00);
INSERT INTO `sesion_caja` VALUES (61, 3, 1, '2019-06-11 09:47:00', 4569.10, 4664.10, 0, '2019-06-11 20:59:00', 100.00);
INSERT INTO `sesion_caja` VALUES (62, 3, 2, '2019-06-11 09:47:00', 0.00, 0.00, 0, '2019-06-11 20:59:00', 0.00);
INSERT INTO `sesion_caja` VALUES (63, 3, 1, '2019-06-12 09:53:00', 4664.10, 4838.10, 0, '2019-06-12 21:14:00', 100.00);
INSERT INTO `sesion_caja` VALUES (64, 3, 2, '2019-06-12 09:53:00', 0.00, 0.00, 0, '2019-06-12 21:14:00', 0.00);
INSERT INTO `sesion_caja` VALUES (65, 3, 1, '2019-06-13 09:51:00', 4864.10, 5133.10, 0, '2019-06-14 11:38:00', 74.00);
INSERT INTO `sesion_caja` VALUES (66, 3, 2, '2019-06-13 09:51:00', 0.00, 0.00, 0, '2019-06-14 11:38:00', 0.00);
INSERT INTO `sesion_caja` VALUES (67, 3, 1, '2019-06-14 11:39:00', 5134.10, 5343.10, 0, '2019-06-14 22:14:00', 73.00);
INSERT INTO `sesion_caja` VALUES (68, 3, 2, '2019-06-14 11:39:00', 0.00, 0.00, 0, '2019-06-14 22:14:00', 0.00);
INSERT INTO `sesion_caja` VALUES (69, 3, 1, '2019-06-15 15:46:00', 5134.10, 5322.10, 0, '2019-06-15 21:52:00', 282.00);
INSERT INTO `sesion_caja` VALUES (70, 3, 2, '2019-06-15 15:46:00', 0.00, 0.00, 0, '2019-06-15 21:52:00', 0.00);
INSERT INTO `sesion_caja` VALUES (71, 3, 1, '2019-06-18 09:53:00', 5504.10, 5660.10, 0, '2019-06-18 21:28:00', 100.00);
INSERT INTO `sesion_caja` VALUES (72, 3, 2, '2019-06-18 09:53:00', 0.00, 0.00, 0, '2019-06-18 21:28:00', 0.00);
INSERT INTO `sesion_caja` VALUES (73, 3, 1, '2019-06-19 09:27:00', 5654.10, 5792.10, 0, '2019-06-20 10:13:00', 106.00);
INSERT INTO `sesion_caja` VALUES (74, 3, 2, '2019-06-19 09:27:00', 0.00, 0.00, 0, '2019-06-20 10:13:00', 0.00);
INSERT INTO `sesion_caja` VALUES (75, 3, 1, '2019-06-20 10:14:00', 5813.10, 5999.60, 0, '2019-06-20 21:07:00', 85.00);
INSERT INTO `sesion_caja` VALUES (76, 3, 2, '2019-06-20 10:14:00', 0.00, 0.00, 0, '2019-06-20 21:07:00', 0.00);
INSERT INTO `sesion_caja` VALUES (77, 3, 1, '2019-06-21 10:29:00', 6023.10, 6139.10, 0, '2019-06-22 10:07:00', 61.50);
INSERT INTO `sesion_caja` VALUES (78, 3, 2, '2019-06-21 10:29:00', 0.00, 0.00, 0, '2019-06-22 10:07:00', 0.00);
INSERT INTO `sesion_caja` VALUES (79, 3, 1, '2019-06-22 10:08:00', 6130.60, 6241.60, 0, '2019-06-23 09:37:00', 70.00);
INSERT INTO `sesion_caja` VALUES (80, 3, 2, '2019-06-22 10:08:00', 0.00, 0.00, 0, '2019-06-23 09:37:00', 0.00);
INSERT INTO `sesion_caja` VALUES (81, 3, 1, '2019-06-23 09:37:00', 6261.60, 6602.60, 0, '2019-06-23 21:57:00', 50.00);
INSERT INTO `sesion_caja` VALUES (82, 3, 2, '2019-06-23 09:37:00', 0.00, 0.00, 0, '2019-06-23 21:57:00', 0.00);
INSERT INTO `sesion_caja` VALUES (83, 3, 1, '2019-06-25 10:08:00', 6582.60, 6731.60, 0, '2019-06-25 21:01:00', 70.00);
INSERT INTO `sesion_caja` VALUES (84, 3, 2, '2019-06-25 10:08:00', 0.00, 0.00, 0, '2019-06-25 21:01:00', 0.00);
INSERT INTO `sesion_caja` VALUES (85, 3, 1, '2019-06-26 09:25:00', 6751.60, 6915.60, 0, '2019-06-26 21:07:00', 50.00);
INSERT INTO `sesion_caja` VALUES (86, 3, 2, '2019-06-26 09:25:00', 0.00, 0.00, 0, '2019-06-26 21:07:00', 0.00);
INSERT INTO `sesion_caja` VALUES (87, 3, 1, '2019-06-27 09:28:00', 6905.60, 6969.60, 0, '2019-06-27 20:48:00', 60.00);
INSERT INTO `sesion_caja` VALUES (88, 3, 2, '2019-06-27 09:28:00', 0.00, 0.00, 0, '2019-06-27 20:48:00', 0.00);
INSERT INTO `sesion_caja` VALUES (89, 3, 1, '2019-06-28 10:27:00', 6989.60, 7154.60, 0, '2019-06-28 22:11:00', 40.00);
INSERT INTO `sesion_caja` VALUES (90, 3, 2, '2019-06-28 10:27:00', 0.00, 0.00, 0, '2019-06-28 22:11:00', 0.00);
INSERT INTO `sesion_caja` VALUES (91, 3, 1, '2019-06-29 10:24:00', 7144.60, 7346.60, 0, '2019-06-29 21:57:00', 50.00);
INSERT INTO `sesion_caja` VALUES (92, 3, 2, '2019-06-29 10:24:00', 0.00, 0.00, 0, '2019-06-29 21:57:00', 0.00);
INSERT INTO `sesion_caja` VALUES (93, 3, 1, '2019-06-30 10:48:00', 7346.60, 7796.60, 0, '2019-06-30 22:16:00', 50.00);
INSERT INTO `sesion_caja` VALUES (94, 3, 2, '2019-06-30 10:48:00', 0.00, 0.00, 0, '2019-06-30 22:16:00', 0.00);
INSERT INTO `sesion_caja` VALUES (95, 3, 1, '2019-07-02 09:43:00', 7796.60, 7976.60, 0, '2019-07-02 21:03:00', 50.00);
INSERT INTO `sesion_caja` VALUES (96, 3, 2, '2019-07-02 09:43:00', 0.00, 0.00, 0, '2019-07-02 21:03:00', 0.00);
INSERT INTO `sesion_caja` VALUES (97, 3, 1, '2019-07-03 09:43:00', 7976.60, 8039.60, 0, '2019-07-04 14:23:00', 50.00);
INSERT INTO `sesion_caja` VALUES (98, 3, 2, '2019-07-03 09:43:00', 0.00, 0.00, 0, '2019-07-04 14:23:00', 0.00);
INSERT INTO `sesion_caja` VALUES (99, 3, 1, '2019-07-04 14:24:00', 8039.60, 8120.60, 0, '2019-07-04 21:05:00', 50.00);
INSERT INTO `sesion_caja` VALUES (100, 3, 2, '2019-07-04 14:24:00', 0.00, 0.00, 0, '2019-07-04 21:05:00', 0.00);
INSERT INTO `sesion_caja` VALUES (101, 3, 1, '2019-07-04 23:49:00', 8170.60, 8170.60, 0, '2019-07-04 23:50:00', 0.00);
INSERT INTO `sesion_caja` VALUES (102, 3, 2, '2019-07-04 23:49:00', 0.00, 0.00, 0, '2019-07-04 23:50:00', 0.00);
INSERT INTO `sesion_caja` VALUES (103, 3, 1, '2019-07-05 10:13:00', 8120.60, 8285.60, 0, '2019-07-05 20:45:00', 50.00);
INSERT INTO `sesion_caja` VALUES (104, 3, 2, '2019-07-05 10:13:00', 0.00, 0.00, 0, '2019-07-05 20:45:00', 0.00);
INSERT INTO `sesion_caja` VALUES (105, 3, 1, '2019-07-06 15:02:00', 8290.60, 8322.60, 0, '2019-07-07 10:06:00', 45.00);
INSERT INTO `sesion_caja` VALUES (106, 3, 2, '2019-07-06 15:02:00', 0.00, 0.00, 0, '2019-07-07 10:06:00', 0.00);
INSERT INTO `sesion_caja` VALUES (107, 3, 1, '2019-07-07 10:06:00', 8317.60, 8357.60, 0, '2019-07-09 09:23:00', 50.00);
INSERT INTO `sesion_caja` VALUES (108, 3, 2, '2019-07-07 10:06:00', 0.00, 0.00, 0, '2019-07-09 09:23:00', 0.00);
INSERT INTO `sesion_caja` VALUES (109, 3, 1, '2019-07-09 09:23:00', 8352.60, 8352.60, 0, '2019-07-09 09:24:00', 55.00);
INSERT INTO `sesion_caja` VALUES (110, 3, 2, '2019-07-09 09:23:00', 0.00, 0.00, 0, '2019-07-09 09:24:00', 0.00);
INSERT INTO `sesion_caja` VALUES (111, 3, 1, '2019-07-09 09:24:00', 8353.60, 8446.60, 0, '2019-07-10 09:22:00', 54.00);
INSERT INTO `sesion_caja` VALUES (112, 3, 2, '2019-07-09 09:24:00', 0.00, 0.00, 0, '2019-07-10 09:22:00', 0.00);
INSERT INTO `sesion_caja` VALUES (113, 3, 1, '2019-07-10 09:22:00', 8443.60, 8547.60, 0, '2019-07-11 09:09:00', 57.00);
INSERT INTO `sesion_caja` VALUES (114, 3, 2, '2019-07-10 09:22:00', 0.00, 0.00, 0, '2019-07-11 09:09:00', 0.00);
INSERT INTO `sesion_caja` VALUES (115, 3, 1, '2019-07-11 09:09:00', 8554.60, 8690.60, 0, '2019-07-11 20:48:00', 50.00);
INSERT INTO `sesion_caja` VALUES (116, 3, 2, '2019-07-11 09:09:00', 0.00, 0.00, 0, '2019-07-11 20:48:00', 0.00);
INSERT INTO `sesion_caja` VALUES (117, 3, 1, '2019-07-12 10:02:00', 8690.60, 8916.60, 0, '2019-07-12 22:40:00', 50.00);
INSERT INTO `sesion_caja` VALUES (118, 3, 2, '2019-07-12 10:02:00', 0.00, 0.00, 0, '2019-07-12 22:40:00', 0.00);
INSERT INTO `sesion_caja` VALUES (119, 3, 1, '2019-07-13 10:13:00', 8916.60, 8990.60, 0, '2019-07-13 19:27:00', 50.00);
INSERT INTO `sesion_caja` VALUES (120, 3, 2, '2019-07-13 10:13:00', 0.00, 0.00, 0, '2019-07-13 19:27:00', 0.00);
INSERT INTO `sesion_caja` VALUES (121, 3, 1, '2019-07-14 10:20:00', 8990.60, 9222.60, 0, '2019-07-14 21:59:00', 50.00);
INSERT INTO `sesion_caja` VALUES (122, 3, 2, '2019-07-14 10:20:00', 0.00, 0.00, 0, '2019-07-14 21:59:00', 0.00);
INSERT INTO `sesion_caja` VALUES (123, 3, 1, '2019-07-15 15:36:00', 9222.60, 9395.60, 0, '2019-07-16 09:38:00', 50.00);
INSERT INTO `sesion_caja` VALUES (124, 3, 2, '2019-07-15 15:36:00', 0.00, 0.00, 0, '2019-07-16 09:38:00', 0.00);
INSERT INTO `sesion_caja` VALUES (125, 3, 1, '2019-07-16 09:44:00', 9395.60, 9487.60, 0, '2019-07-17 15:04:00', 50.00);
INSERT INTO `sesion_caja` VALUES (126, 3, 2, '2019-07-16 09:44:00', 0.00, 0.00, 0, '2019-07-17 15:04:00', 0.00);
INSERT INTO `sesion_caja` VALUES (127, 3, 1, '2019-07-17 15:24:00', 9487.60, 9542.60, 0, '2019-07-17 20:52:00', 50.00);
INSERT INTO `sesion_caja` VALUES (128, 3, 2, '2019-07-17 15:24:00', 0.00, 0.00, 0, '2019-07-17 20:52:00', 0.00);
INSERT INTO `sesion_caja` VALUES (129, 3, 1, '2019-07-18 09:44:00', 9542.60, 9579.60, 0, '2019-07-19 10:07:00', 50.00);
INSERT INTO `sesion_caja` VALUES (130, 3, 2, '2019-07-18 09:44:00', 0.00, 0.00, 0, '2019-07-19 10:07:00', 0.00);
INSERT INTO `sesion_caja` VALUES (131, 3, 1, '2019-07-19 10:07:00', 9589.60, 9789.60, 0, '2019-07-20 10:13:00', 40.00);
INSERT INTO `sesion_caja` VALUES (132, 3, 2, '2019-07-19 10:07:00', 0.00, 0.00, 0, '2019-07-20 10:13:00', 0.00);
INSERT INTO `sesion_caja` VALUES (133, 3, 1, '2019-07-20 10:13:00', 9779.60, 9952.60, 0, '2019-07-21 10:10:00', 50.00);
INSERT INTO `sesion_caja` VALUES (134, 3, 2, '2019-07-20 10:13:00', 0.00, 0.00, 0, '2019-07-21 10:10:00', 0.00);
INSERT INTO `sesion_caja` VALUES (135, 3, 1, '2019-07-21 10:10:00', 9952.60, 9981.60, 0, '2019-07-28 10:42:00', 50.00);
INSERT INTO `sesion_caja` VALUES (136, 3, 2, '2019-07-21 10:10:00', 0.00, 0.00, 0, '2019-07-28 10:42:00', 0.00);
INSERT INTO `sesion_caja` VALUES (137, 3, 1, '2019-07-28 10:42:00', 9981.60, 10282.60, 0, '2019-07-29 08:57:00', 50.00);
INSERT INTO `sesion_caja` VALUES (138, 3, 2, '2019-07-28 10:42:00', 0.00, 0.00, 0, '2019-07-29 08:57:00', 0.00);
INSERT INTO `sesion_caja` VALUES (139, 3, 1, '2019-07-29 09:15:00', 10282.60, 10617.60, 0, '2019-07-30 09:50:00', 50.00);
INSERT INTO `sesion_caja` VALUES (140, 3, 2, '2019-07-29 09:15:00', 0.00, 0.00, 0, '2019-07-30 09:50:00', 0.00);
INSERT INTO `sesion_caja` VALUES (141, 3, 1, '2019-07-30 09:50:00', 10617.60, 10851.60, 0, '2019-07-30 20:59:00', 50.00);
INSERT INTO `sesion_caja` VALUES (142, 3, 2, '2019-07-30 09:50:00', 0.00, 0.00, 0, '2019-07-30 20:59:00', 0.00);
INSERT INTO `sesion_caja` VALUES (143, 3, 1, '2019-07-31 09:38:00', 10851.60, 11045.60, 0, '2019-07-31 20:40:00', 50.00);
INSERT INTO `sesion_caja` VALUES (144, 3, 2, '2019-07-31 09:38:00', 0.00, 0.00, 0, '2019-07-31 20:40:00', 0.00);
INSERT INTO `sesion_caja` VALUES (145, 3, 1, '2019-08-01 10:38:00', 11045.60, 11275.60, 0, '2019-08-01 21:34:00', 50.00);
INSERT INTO `sesion_caja` VALUES (146, 3, 2, '2019-08-01 10:38:00', 0.00, 0.00, 0, '2019-08-01 21:34:00', 0.00);
INSERT INTO `sesion_caja` VALUES (147, 3, 1, '2019-08-02 11:30:00', 11275.60, 11524.60, 0, '2019-08-03 11:16:00', 50.00);
INSERT INTO `sesion_caja` VALUES (148, 3, 2, '2019-08-02 11:30:00', 0.00, 0.00, 0, '2019-08-03 11:16:00', 0.00);
INSERT INTO `sesion_caja` VALUES (149, 3, 1, '2019-08-03 11:16:00', 11524.60, 11708.60, 0, '2019-08-06 15:37:00', 50.00);
INSERT INTO `sesion_caja` VALUES (150, 3, 2, '2019-08-03 11:16:00', 0.00, 0.00, 0, '2019-08-06 15:37:00', 0.00);
INSERT INTO `sesion_caja` VALUES (151, 3, 1, '2019-08-06 15:38:00', 11708.60, 11710.60, 0, '2019-08-07 18:06:00', 50.00);
INSERT INTO `sesion_caja` VALUES (152, 3, 2, '2019-08-06 15:38:00', 0.00, 0.00, 0, '2019-08-07 18:06:00', 0.00);
INSERT INTO `sesion_caja` VALUES (153, 3, 1, '2019-08-07 18:06:00', 11710.60, 11730.60, 0, '2019-08-08 09:47:00', 50.00);
INSERT INTO `sesion_caja` VALUES (154, 3, 2, '2019-08-07 18:06:00', 0.00, 0.00, 0, '2019-08-08 09:47:00', 0.00);
INSERT INTO `sesion_caja` VALUES (155, 3, 1, '2019-08-08 10:22:00', 11730.60, 11732.60, 0, '2019-08-16 11:20:00', 50.00);
INSERT INTO `sesion_caja` VALUES (156, 3, 2, '2019-08-08 10:22:00', 0.00, 0.00, 0, '2019-08-16 11:20:00', 0.00);
INSERT INTO `sesion_caja` VALUES (157, 3, 1, '2019-08-16 11:20:00', 11732.60, 11965.60, 0, '2019-08-16 22:14:00', 50.00);
INSERT INTO `sesion_caja` VALUES (158, 3, 2, '2019-08-16 11:20:00', -50.00, -50.00, 0, '2019-08-16 22:14:00', 50.00);
INSERT INTO `sesion_caja` VALUES (159, 3, 1, '2019-08-17 10:19:00', 11965.60, 12166.60, 0, '2019-08-17 22:24:00', 50.00);
INSERT INTO `sesion_caja` VALUES (160, 3, 2, '2019-08-17 10:19:00', -50.00, -50.00, 0, '2019-08-17 22:24:00', 50.00);
INSERT INTO `sesion_caja` VALUES (161, 3, 1, '2019-08-18 10:44:00', 12166.60, 12539.60, 0, '2019-08-18 22:02:00', 50.00);
INSERT INTO `sesion_caja` VALUES (162, 3, 2, '2019-08-18 10:44:00', -50.00, -50.00, 0, '2019-08-18 22:02:00', 50.00);
INSERT INTO `sesion_caja` VALUES (163, 3, 1, '2019-08-19 09:23:00', 12539.60, 12556.60, 0, '2019-08-20 09:22:00', 50.00);
INSERT INTO `sesion_caja` VALUES (164, 3, 2, '2019-08-19 09:23:00', -50.00, -50.00, 0, '2019-08-20 09:22:00', 50.00);
INSERT INTO `sesion_caja` VALUES (165, 3, 1, '2019-08-21 10:48:00', 12556.60, 12610.60, 0, '2019-08-24 10:04:00', 50.00);
INSERT INTO `sesion_caja` VALUES (166, 3, 2, '2019-08-21 10:48:00', 0.00, 0.00, 0, '2019-08-24 10:04:00', 0.00);
INSERT INTO `sesion_caja` VALUES (167, 3, 1, '2019-08-24 10:05:00', 12610.60, 12708.10, 0, '2019-08-24 21:46:00', 50.00);
INSERT INTO `sesion_caja` VALUES (168, 3, 2, '2019-08-24 10:05:00', -50.00, -50.00, 0, '2019-08-24 21:46:00', 50.00);
INSERT INTO `sesion_caja` VALUES (169, 3, 1, '2019-08-25 10:30:00', 12708.10, 12984.10, 0, '2019-08-25 22:06:00', 50.00);
INSERT INTO `sesion_caja` VALUES (170, 3, 2, '2019-08-25 10:30:00', -50.00, -50.00, 0, '2019-08-25 22:06:00', 50.00);
INSERT INTO `sesion_caja` VALUES (171, 3, 1, '2019-08-26 10:10:00', 12984.10, 13063.10, 0, '2019-08-26 20:36:00', 50.00);
INSERT INTO `sesion_caja` VALUES (172, 3, 2, '2019-08-26 10:10:00', -50.00, -50.00, 0, '2019-08-26 20:36:00', 50.00);
INSERT INTO `sesion_caja` VALUES (173, 3, 1, '2019-08-27 10:25:00', 13063.10, 13155.10, 0, '2019-08-27 21:14:00', 50.00);
INSERT INTO `sesion_caja` VALUES (174, 3, 2, '2019-08-27 10:25:00', -50.00, -50.00, 0, '2019-08-27 21:14:00', 50.00);
INSERT INTO `sesion_caja` VALUES (175, 3, 1, '2019-08-28 08:09:00', 13155.10, 13217.10, 0, '2019-08-29 09:04:00', 50.00);
INSERT INTO `sesion_caja` VALUES (176, 3, 2, '2019-08-28 08:09:00', -50.00, -50.00, 0, '2019-08-29 09:04:00', 50.00);
INSERT INTO `sesion_caja` VALUES (177, 3, 1, '2019-08-29 09:05:00', 13217.10, 13341.10, 0, '2019-08-29 21:22:00', 50.00);
INSERT INTO `sesion_caja` VALUES (178, 3, 2, '2019-08-29 09:05:00', -50.00, -50.00, 0, '2019-08-29 21:22:00', 50.00);
INSERT INTO `sesion_caja` VALUES (179, 3, 1, '2019-08-30 08:22:00', 13341.10, 13531.10, 0, '2019-08-30 21:51:00', 50.00);
INSERT INTO `sesion_caja` VALUES (180, 3, 2, '2019-08-30 08:22:00', -50.00, -50.00, 0, '2019-08-30 21:51:00', 50.00);
INSERT INTO `sesion_caja` VALUES (181, 3, 1, '2019-08-31 10:12:00', 13531.10, 13795.10, 0, '2019-09-01 10:39:00', 50.00);
INSERT INTO `sesion_caja` VALUES (182, 3, 2, '2019-08-31 10:12:00', -50.00, -50.00, 0, '2019-09-01 10:39:00', 50.00);
INSERT INTO `sesion_caja` VALUES (183, 3, 1, '2019-09-01 10:39:00', 13795.10, 13813.10, 0, '2019-09-02 15:10:00', 50.00);
INSERT INTO `sesion_caja` VALUES (184, 3, 2, '2019-09-01 10:39:00', -50.00, -50.00, 0, '2019-09-02 15:10:00', 50.00);
INSERT INTO `sesion_caja` VALUES (185, 3, 1, '2019-09-02 15:10:00', 13813.10, 13902.10, 0, '2019-09-03 09:57:00', 50.00);
INSERT INTO `sesion_caja` VALUES (186, 3, 2, '2019-09-02 15:10:00', -50.00, -50.00, 0, '2019-09-03 09:57:00', 50.00);
INSERT INTO `sesion_caja` VALUES (187, 3, 1, '2019-09-03 09:57:00', 13902.10, 14039.10, 0, '2019-09-03 22:02:00', 50.00);
INSERT INTO `sesion_caja` VALUES (188, 3, 2, '2019-09-03 09:57:00', -50.00, -50.00, 0, '2019-09-03 22:02:00', 50.00);
INSERT INTO `sesion_caja` VALUES (189, 3, 1, '2019-09-04 10:09:00', 14039.10, 14039.10, 0, '2019-09-04 10:09:00', 50.00);
INSERT INTO `sesion_caja` VALUES (190, 3, 2, '2019-09-04 10:09:00', 0.00, 0.00, 0, '2019-09-04 10:09:00', 0.00);
INSERT INTO `sesion_caja` VALUES (191, 3, 1, '2019-09-04 10:10:00', 14039.10, 14097.10, 0, '2019-09-04 20:38:00', 50.00);
INSERT INTO `sesion_caja` VALUES (192, 3, 2, '2019-09-04 10:10:00', -50.00, -50.00, 0, '2019-09-04 20:38:00', 50.00);
INSERT INTO `sesion_caja` VALUES (193, 3, 1, '2019-09-05 10:06:00', 14097.10, 14145.10, 0, '2019-09-05 16:21:00', 50.00);
INSERT INTO `sesion_caja` VALUES (194, 3, 2, '2019-09-05 10:06:00', -50.00, -50.00, 0, '2019-09-05 16:21:00', 50.00);
INSERT INTO `sesion_caja` VALUES (195, 3, 1, '2019-09-05 16:21:00', 14145.10, 14206.10, 0, '2019-09-06 09:30:00', 50.00);
INSERT INTO `sesion_caja` VALUES (196, 3, 2, '2019-09-05 16:21:00', -50.00, -50.00, 0, '2019-09-06 09:30:00', 50.00);
INSERT INTO `sesion_caja` VALUES (197, 3, 1, '2019-09-06 09:30:00', 14206.10, 14262.60, 0, '2019-09-07 09:12:00', 50.00);
INSERT INTO `sesion_caja` VALUES (198, 3, 2, '2019-09-06 09:30:00', -50.00, -50.00, 0, '2019-09-07 09:12:00', 50.00);
INSERT INTO `sesion_caja` VALUES (199, 3, 1, '2019-09-07 09:12:00', 14262.60, 14262.60, 0, '2019-09-09 17:14:00', 50.00);
INSERT INTO `sesion_caja` VALUES (200, 3, 2, '2019-09-07 09:12:00', -50.00, -50.00, 0, '2019-09-09 17:14:00', 50.00);
INSERT INTO `sesion_caja` VALUES (201, 3, 1, '2019-09-09 17:15:00', 14262.60, 14294.60, 0, '2019-09-10 12:55:00', 50.00);
INSERT INTO `sesion_caja` VALUES (202, 3, 2, '2019-09-09 17:15:00', -50.00, -50.00, 0, '2019-09-10 12:55:00', 50.00);
INSERT INTO `sesion_caja` VALUES (203, 3, 1, '2019-09-10 12:55:00', 14294.60, 14370.60, 0, '2019-09-10 21:16:00', 50.00);
INSERT INTO `sesion_caja` VALUES (204, 3, 2, '2019-09-10 12:55:00', -50.00, -50.00, 0, '2019-09-10 21:16:00', 50.00);
INSERT INTO `sesion_caja` VALUES (205, 3, 1, '2019-09-11 10:13:00', 14370.60, 14390.60, 0, '2019-09-11 11:15:00', 50.00);
INSERT INTO `sesion_caja` VALUES (206, 3, 2, '2019-09-11 10:13:00', -50.00, -50.00, 0, '2019-09-11 11:15:00', 50.00);
INSERT INTO `sesion_caja` VALUES (207, 3, 1, '2019-09-11 11:15:00', 14390.60, 14493.60, 0, '2019-09-12 09:11:00', 50.00);
INSERT INTO `sesion_caja` VALUES (208, 3, 2, '2019-09-11 11:15:00', -50.00, -50.00, 0, '2019-09-12 09:11:00', 50.00);
INSERT INTO `sesion_caja` VALUES (209, 3, 1, '2019-09-12 09:11:00', 14493.60, 14572.60, 0, '2019-09-13 10:18:00', 50.00);
INSERT INTO `sesion_caja` VALUES (210, 3, 2, '2019-09-12 09:11:00', -50.00, -50.00, 0, '2019-09-13 10:18:00', 50.00);
INSERT INTO `sesion_caja` VALUES (211, 3, 1, '2019-09-13 10:18:00', 14572.60, 14610.60, 0, '2019-09-13 21:01:00', 50.00);
INSERT INTO `sesion_caja` VALUES (212, 3, 2, '2019-09-13 10:18:00', -50.00, -50.00, 0, '2019-09-13 21:01:00', 50.00);
INSERT INTO `sesion_caja` VALUES (213, 3, 1, '2019-09-14 11:13:00', 14610.60, 14766.60, 0, '2019-09-15 11:33:00', 50.00);
INSERT INTO `sesion_caja` VALUES (214, 3, 2, '2019-09-14 11:13:00', -50.00, -50.00, 0, '2019-09-15 11:33:00', 50.00);
INSERT INTO `sesion_caja` VALUES (215, 3, 1, '2019-09-15 11:33:00', 14766.60, 14910.60, 0, '2019-09-16 08:31:00', 50.00);
INSERT INTO `sesion_caja` VALUES (216, 3, 2, '2019-09-15 11:33:00', -50.00, -50.00, 0, '2019-09-16 08:31:00', 50.00);
INSERT INTO `sesion_caja` VALUES (217, 3, 1, '2019-09-16 08:31:00', 14910.60, 14994.10, 0, '2019-09-16 21:14:00', 50.00);
INSERT INTO `sesion_caja` VALUES (218, 3, 2, '2019-09-16 08:31:00', -50.00, -50.00, 0, '2019-09-16 21:14:00', 50.00);
INSERT INTO `sesion_caja` VALUES (219, 3, 1, '2019-09-17 11:13:00', 14994.10, 15055.10, 0, '2019-09-17 21:00:00', 50.00);
INSERT INTO `sesion_caja` VALUES (220, 3, 2, '2019-09-17 11:13:00', -50.00, -50.00, 0, '2019-09-17 21:00:00', 50.00);
INSERT INTO `sesion_caja` VALUES (221, 3, 1, '2019-09-18 10:11:00', 15055.10, 15175.10, 0, '2019-09-19 08:24:00', 50.00);
INSERT INTO `sesion_caja` VALUES (222, 3, 2, '2019-09-18 10:11:00', -50.00, -50.00, 0, '2019-09-19 08:24:00', 50.00);
INSERT INTO `sesion_caja` VALUES (223, 3, 1, '2019-09-19 08:24:00', 15175.10, 15288.10, 0, '2019-09-20 08:19:00', 50.00);
INSERT INTO `sesion_caja` VALUES (224, 3, 2, '2019-09-19 08:24:00', -50.00, -50.00, 0, '2019-09-20 08:19:00', 50.00);
INSERT INTO `sesion_caja` VALUES (225, 3, 1, '2019-09-20 08:19:00', 15288.10, 15320.10, 0, '2019-09-20 20:24:00', 50.00);
INSERT INTO `sesion_caja` VALUES (226, 3, 2, '2019-09-20 08:19:00', -50.00, -50.00, 0, '2019-09-20 20:24:00', 50.00);
INSERT INTO `sesion_caja` VALUES (227, 3, 1, '2019-09-21 16:13:00', 15320.10, 15326.10, 0, '2019-09-23 09:00:00', 50.00);
INSERT INTO `sesion_caja` VALUES (228, 3, 2, '2019-09-21 16:13:00', -50.00, -50.00, 0, '2019-09-23 09:00:00', 50.00);
INSERT INTO `sesion_caja` VALUES (229, 3, 1, '2019-09-23 09:00:00', 15326.10, 15326.10, 0, '2019-09-24 08:55:00', 50.00);
INSERT INTO `sesion_caja` VALUES (230, 3, 2, '2019-09-23 09:00:00', -50.00, -50.00, 0, '2019-09-24 08:55:00', 50.00);
INSERT INTO `sesion_caja` VALUES (231, 3, 1, '2019-09-24 08:55:00', 15326.10, 15334.10, 0, '2019-09-25 11:41:00', 50.00);
INSERT INTO `sesion_caja` VALUES (232, 3, 2, '2019-09-24 08:55:00', -50.00, -50.00, 0, '2019-09-25 11:41:00', 50.00);
INSERT INTO `sesion_caja` VALUES (233, 3, 1, '2019-09-25 11:41:00', 15334.10, 15395.10, 0, '2019-09-25 21:03:00', 50.00);
INSERT INTO `sesion_caja` VALUES (234, 3, 2, '2019-09-25 11:41:00', -50.00, -50.00, 0, '2019-09-25 21:03:00', 50.00);
INSERT INTO `sesion_caja` VALUES (235, 3, 1, '2019-09-26 10:45:00', 15395.10, 15460.10, 0, '2019-09-26 20:55:00', 50.00);
INSERT INTO `sesion_caja` VALUES (236, 3, 2, '2019-09-26 10:45:00', -50.00, -50.00, 0, '2019-09-26 20:55:00', 50.00);
INSERT INTO `sesion_caja` VALUES (237, 3, 1, '2019-09-29 10:01:00', 15460.10, 15598.10, 0, '2019-09-29 21:16:00', 50.00);
INSERT INTO `sesion_caja` VALUES (238, 3, 2, '2019-09-29 10:01:00', -50.00, -50.00, 0, '2019-09-29 21:16:00', 50.00);
INSERT INTO `sesion_caja` VALUES (239, 3, 1, '2019-09-30 16:54:00', 15598.10, 15626.10, 0, '2019-09-30 16:59:00', 50.00);
INSERT INTO `sesion_caja` VALUES (240, 3, 2, '2019-09-30 16:54:00', -50.00, -50.00, 0, '2019-09-30 16:59:00', 50.00);
INSERT INTO `sesion_caja` VALUES (241, 3, 1, '2019-10-01 09:44:00', 15626.10, 15640.10, 0, '2019-10-01 20:15:00', 50.00);
INSERT INTO `sesion_caja` VALUES (242, 3, 2, '2019-10-01 09:44:00', -50.00, -50.00, 0, '2019-10-01 20:15:00', 50.00);
INSERT INTO `sesion_caja` VALUES (243, 3, 1, '2019-10-02 16:24:00', 15640.10, 15706.10, 0, '2019-10-02 21:11:00', 50.00);
INSERT INTO `sesion_caja` VALUES (244, 3, 2, '2019-10-02 16:24:00', -50.00, -50.00, 0, '2019-10-02 21:11:00', 50.00);
INSERT INTO `sesion_caja` VALUES (245, 3, 1, '2019-10-03 09:37:00', 15706.10, 15821.10, 0, '2019-10-04 10:38:00', 50.00);
INSERT INTO `sesion_caja` VALUES (246, 3, 2, '2019-10-03 09:37:00', -50.00, -50.00, 0, '2019-10-04 10:38:00', 50.00);
INSERT INTO `sesion_caja` VALUES (247, 3, 1, '2019-10-04 10:38:00', 15821.10, 15888.10, 0, '2019-10-05 10:25:00', 50.00);
INSERT INTO `sesion_caja` VALUES (248, 3, 2, '2019-10-04 10:38:00', -50.00, -50.00, 0, '2019-10-05 10:25:00', 50.00);
INSERT INTO `sesion_caja` VALUES (249, 3, 1, '2019-10-05 10:26:00', 15888.10, 15938.10, 0, '2019-10-05 20:42:00', 50.00);
INSERT INTO `sesion_caja` VALUES (250, 3, 2, '2019-10-05 10:26:00', -50.00, -50.00, 0, '2019-10-05 20:42:00', 50.00);
INSERT INTO `sesion_caja` VALUES (251, 3, 1, '2019-10-05 20:42:00', 15938.10, 16030.10, 0, '2019-10-05 22:00:00', 50.00);
INSERT INTO `sesion_caja` VALUES (252, 3, 2, '2019-10-05 20:42:00', -50.00, -50.00, 0, '2019-10-05 22:00:00', 50.00);
INSERT INTO `sesion_caja` VALUES (253, 3, 1, '2019-10-06 10:00:00', 16030.10, 16260.10, 0, '2019-10-06 23:01:00', 50.00);
INSERT INTO `sesion_caja` VALUES (254, 3, 2, '2019-10-06 10:00:00', -50.00, -50.00, 0, '2019-10-06 23:01:00', 50.00);
INSERT INTO `sesion_caja` VALUES (255, 3, 1, '2019-10-08 12:08:00', 16260.10, 16278.10, 0, '2019-10-10 10:12:00', 50.00);
INSERT INTO `sesion_caja` VALUES (256, 3, 2, '2019-10-08 12:08:00', -50.00, -50.00, 0, '2019-10-10 10:12:00', 50.00);
INSERT INTO `sesion_caja` VALUES (257, 3, 1, '2019-10-10 10:12:00', 16278.10, 16304.10, 0, '2019-10-11 09:08:00', 50.00);
INSERT INTO `sesion_caja` VALUES (258, 3, 2, '2019-10-10 10:12:00', -50.00, -50.00, 0, '2019-10-11 09:08:00', 50.00);
INSERT INTO `sesion_caja` VALUES (259, 3, 1, '2019-10-11 09:09:00', 16304.10, 16304.10, 0, '2019-10-12 10:27:00', 50.00);
INSERT INTO `sesion_caja` VALUES (260, 3, 2, '2019-10-11 09:09:00', -50.00, -50.00, 0, '2019-10-12 10:27:00', 50.00);
INSERT INTO `sesion_caja` VALUES (261, 3, 1, '2019-10-12 10:27:00', 16304.10, 16304.10, 0, '2019-10-13 10:09:00', 50.00);
INSERT INTO `sesion_caja` VALUES (262, 3, 2, '2019-10-12 10:27:00', -50.00, -50.00, 0, '2019-10-13 10:09:00', 50.00);
INSERT INTO `sesion_caja` VALUES (263, 3, 1, '2019-10-13 10:10:00', 16304.10, 16417.10, 0, '2019-10-14 15:38:00', 50.00);
INSERT INTO `sesion_caja` VALUES (264, 3, 2, '2019-10-13 10:10:00', -50.00, -50.00, 0, '2019-10-14 15:38:00', 50.00);
INSERT INTO `sesion_caja` VALUES (265, 3, 1, '2019-10-14 15:38:00', 16417.10, 16485.10, 0, '2019-10-15 08:56:00', 50.00);
INSERT INTO `sesion_caja` VALUES (266, 3, 2, '2019-10-14 15:38:00', -50.00, -50.00, 0, '2019-10-15 08:56:00', 50.00);
INSERT INTO `sesion_caja` VALUES (267, 3, 1, '2019-10-15 08:56:00', 16485.10, 16526.10, 0, '2019-10-16 09:13:00', 50.00);
INSERT INTO `sesion_caja` VALUES (268, 3, 2, '2019-10-15 08:56:00', -50.00, -50.00, 0, '2019-10-16 09:13:00', 50.00);
INSERT INTO `sesion_caja` VALUES (269, 3, 1, '2019-10-16 09:13:00', 16526.10, 16604.10, 0, '2019-10-17 09:32:00', 50.00);
INSERT INTO `sesion_caja` VALUES (270, 3, 2, '2019-10-16 09:13:00', -50.00, -50.00, 0, '2019-10-17 09:32:00', 50.00);
INSERT INTO `sesion_caja` VALUES (271, 3, 1, '2019-10-17 09:32:00', 16604.10, 16658.10, 0, '2019-10-18 09:03:00', 50.00);
INSERT INTO `sesion_caja` VALUES (272, 3, 2, '2019-10-17 09:32:00', -50.00, -50.00, 0, '2019-10-18 09:03:00', 50.00);
INSERT INTO `sesion_caja` VALUES (273, 3, 1, '2019-10-18 09:03:00', 16658.10, 16726.10, 0, '2019-10-19 10:31:00', 50.00);
INSERT INTO `sesion_caja` VALUES (274, 3, 2, '2019-10-18 09:03:00', -50.00, -50.00, 0, '2019-10-19 10:31:00', 50.00);
INSERT INTO `sesion_caja` VALUES (275, 3, 1, '2019-10-19 10:31:00', 16726.10, 16749.10, 0, '2019-10-20 11:11:00', 50.00);
INSERT INTO `sesion_caja` VALUES (276, 3, 2, '2019-10-19 10:31:00', -50.00, -50.00, 0, '2019-10-20 11:11:00', 50.00);
INSERT INTO `sesion_caja` VALUES (277, 3, 1, '2019-10-20 11:11:00', 16799.10, 16799.10, 0, '2019-10-20 11:11:00', 0.00);
INSERT INTO `sesion_caja` VALUES (278, 3, 2, '2019-10-20 11:11:00', 0.00, 0.00, 0, '2019-10-20 11:11:00', 0.00);
INSERT INTO `sesion_caja` VALUES (279, 3, 1, '2019-10-20 11:11:00', 16749.10, 16809.10, 0, '2019-10-21 10:00:00', 50.00);
INSERT INTO `sesion_caja` VALUES (280, 3, 2, '2019-10-20 11:11:00', -50.00, -50.00, 0, '2019-10-21 10:00:00', 50.00);
INSERT INTO `sesion_caja` VALUES (281, 3, 1, '2019-10-21 10:00:00', 16809.10, 16871.10, 0, '2019-10-21 20:09:00', 50.00);
INSERT INTO `sesion_caja` VALUES (282, 3, 2, '2019-10-21 10:00:00', -50.00, -50.00, 0, '2019-10-21 20:09:00', 50.00);
INSERT INTO `sesion_caja` VALUES (283, 3, 1, '2019-10-22 09:25:00', 16871.10, 16887.10, 0, '2019-10-23 08:24:00', 50.00);
INSERT INTO `sesion_caja` VALUES (284, 3, 2, '2019-10-22 09:25:00', -50.00, -50.00, 0, '2019-10-23 08:24:00', 50.00);
INSERT INTO `sesion_caja` VALUES (285, 3, 1, '2019-10-23 08:25:00', 16887.10, 16918.10, 0, '2019-10-24 10:08:00', 50.00);
INSERT INTO `sesion_caja` VALUES (286, 3, 2, '2019-10-23 08:25:00', -50.00, -50.00, 0, '2019-10-24 10:08:00', 50.00);
INSERT INTO `sesion_caja` VALUES (287, 3, 1, '2019-10-24 10:08:00', 16918.10, 16943.10, 0, '2019-10-24 20:55:00', 50.00);
INSERT INTO `sesion_caja` VALUES (288, 3, 2, '2019-10-24 10:08:00', -50.00, -50.00, 0, '2019-10-24 20:55:00', 50.00);
INSERT INTO `sesion_caja` VALUES (289, 3, 1, '2019-10-25 08:30:00', 16943.10, 16968.60, 0, '2019-10-26 10:12:00', 50.00);
INSERT INTO `sesion_caja` VALUES (290, 3, 2, '2019-10-25 08:30:00', -50.00, -50.00, 0, '2019-10-26 10:12:00', 50.00);
INSERT INTO `sesion_caja` VALUES (291, 3, 1, '2019-10-26 10:13:00', 16968.60, 17016.60, 0, '2019-10-27 10:05:00', 50.00);
INSERT INTO `sesion_caja` VALUES (292, 3, 2, '2019-10-26 10:13:00', -50.00, -50.00, 0, '2019-10-27 10:05:00', 50.00);
INSERT INTO `sesion_caja` VALUES (293, 3, 1, '2019-10-27 10:05:00', 17016.60, 17176.60, 0, '2019-10-28 16:45:00', 50.00);
INSERT INTO `sesion_caja` VALUES (294, 3, 2, '2019-10-27 10:05:00', -50.00, -50.00, 0, '2019-10-28 16:45:00', 50.00);
INSERT INTO `sesion_caja` VALUES (295, 3, 1, '2019-10-28 16:46:00', 17196.60, 17208.10, 0, '2019-10-29 09:07:00', 30.00);
INSERT INTO `sesion_caja` VALUES (296, 3, 2, '2019-10-28 16:46:00', -30.00, -30.00, 0, '2019-10-29 09:07:00', 30.00);
INSERT INTO `sesion_caja` VALUES (297, 3, 1, '2019-10-29 09:09:00', 17188.10, 17222.10, 0, '2019-10-30 09:35:00', 50.00);
INSERT INTO `sesion_caja` VALUES (298, 3, 2, '2019-10-29 09:09:00', -50.00, -50.00, 0, '2019-10-30 09:35:00', 50.00);
INSERT INTO `sesion_caja` VALUES (299, 3, 1, '2019-10-30 09:35:00', 17222.10, 17294.10, 0, '2019-10-31 09:57:00', 50.00);
INSERT INTO `sesion_caja` VALUES (300, 3, 2, '2019-10-30 09:35:00', -50.00, -50.00, 0, '2019-10-31 09:57:00', 50.00);
INSERT INTO `sesion_caja` VALUES (301, 3, 1, '2019-10-31 09:58:00', 17294.10, 17585.10, 0, '2019-10-31 22:28:00', 50.00);
INSERT INTO `sesion_caja` VALUES (302, 3, 2, '2019-10-31 09:58:00', -50.00, -50.00, 0, '2019-10-31 22:28:00', 50.00);
INSERT INTO `sesion_caja` VALUES (303, 3, 1, '2019-11-01 09:18:00', 17585.10, 17710.10, 0, '2019-11-02 12:57:00', 50.00);
INSERT INTO `sesion_caja` VALUES (304, 3, 2, '2019-11-01 09:18:00', -50.00, -50.00, 0, '2019-11-02 12:57:00', 50.00);
INSERT INTO `sesion_caja` VALUES (305, 3, 1, '2019-11-02 12:57:00', 17710.10, 17806.10, 0, '2019-11-03 11:33:00', 50.00);
INSERT INTO `sesion_caja` VALUES (306, 3, 2, '2019-11-02 12:57:00', -50.00, -50.00, 0, '2019-11-03 11:33:00', 50.00);
INSERT INTO `sesion_caja` VALUES (307, 3, 1, '2019-11-03 11:33:00', 17806.10, 17986.10, 0, '2019-11-03 21:50:00', 50.00);
INSERT INTO `sesion_caja` VALUES (308, 3, 2, '2019-11-03 11:33:00', -50.00, -50.00, 0, '2019-11-03 21:50:00', 50.00);
INSERT INTO `sesion_caja` VALUES (309, 3, 1, '2019-11-04 09:05:00', 17986.10, 18032.10, 0, '2019-11-05 08:53:00', 50.00);
INSERT INTO `sesion_caja` VALUES (310, 3, 2, '2019-11-04 09:05:00', -50.00, -50.00, 0, '2019-11-05 08:53:00', 50.00);
INSERT INTO `sesion_caja` VALUES (311, 3, 1, '2019-11-05 08:53:00', 18032.10, 18116.10, 0, '2019-11-06 09:11:00', 50.00);
INSERT INTO `sesion_caja` VALUES (312, 3, 2, '2019-11-05 08:53:00', -50.00, -50.00, 0, '2019-11-06 09:11:00', 50.00);
INSERT INTO `sesion_caja` VALUES (313, 3, 1, '2019-11-06 09:11:00', 18116.10, 18172.10, 0, '2019-11-07 10:02:00', 50.00);
INSERT INTO `sesion_caja` VALUES (314, 3, 2, '2019-11-06 09:11:00', -50.00, -50.00, 0, '2019-11-07 10:02:00', 50.00);
INSERT INTO `sesion_caja` VALUES (315, 3, 1, '2019-11-07 10:02:00', 18172.10, 18182.10, 0, '2019-11-08 14:08:00', 50.00);
INSERT INTO `sesion_caja` VALUES (316, 3, 2, '2019-11-07 10:02:00', -50.00, -50.00, 0, '2019-11-08 14:08:00', 50.00);
INSERT INTO `sesion_caja` VALUES (317, 3, 1, '2019-11-08 14:08:00', 18182.10, 18270.10, 0, '2019-11-09 12:28:00', 50.00);
INSERT INTO `sesion_caja` VALUES (318, 3, 2, '2019-11-08 14:08:00', -50.00, -50.00, 0, '2019-11-09 12:28:00', 50.00);
INSERT INTO `sesion_caja` VALUES (319, 3, 1, '2019-11-09 12:29:00', 18270.10, 18417.10, 0, '2019-11-10 10:56:00', 50.00);
INSERT INTO `sesion_caja` VALUES (320, 3, 2, '2019-11-09 12:29:00', -50.00, -50.00, 0, '2019-11-10 10:56:00', 50.00);
INSERT INTO `sesion_caja` VALUES (321, 3, 1, '2019-11-10 10:56:00', 18417.10, 18529.10, 0, '2019-11-10 22:02:00', 50.00);
INSERT INTO `sesion_caja` VALUES (322, 3, 2, '2019-11-10 10:56:00', -50.00, -50.00, 0, '2019-11-10 22:02:00', 50.00);
INSERT INTO `sesion_caja` VALUES (323, 3, 1, '2019-11-11 10:16:00', 18529.10, 18547.10, 0, '2019-11-12 14:52:00', 50.00);
INSERT INTO `sesion_caja` VALUES (324, 3, 2, '2019-11-11 10:16:00', -50.00, -50.00, 0, '2019-11-12 14:52:00', 50.00);
INSERT INTO `sesion_caja` VALUES (325, 3, 1, '2019-11-12 14:53:00', 18547.10, 18633.10, 0, '2019-11-13 16:35:00', 50.00);
INSERT INTO `sesion_caja` VALUES (326, 3, 2, '2019-11-12 14:53:00', -50.00, -50.00, 0, '2019-11-13 16:35:00', 50.00);
INSERT INTO `sesion_caja` VALUES (327, 3, 1, '2019-11-14 08:35:00', 18383.10, 18383.10, 0, '2019-11-14 08:39:00', 0.00);
INSERT INTO `sesion_caja` VALUES (328, 3, 2, '2019-11-14 08:35:00', -300.00, -300.00, 0, '2019-11-14 08:39:00', 0.00);
INSERT INTO `sesion_caja` VALUES (329, 3, 1, '2019-11-14 08:39:00', 18333.10, 18415.10, 0, '2019-11-14 12:37:00', 50.00);
INSERT INTO `sesion_caja` VALUES (330, 3, 2, '2019-11-14 08:39:00', -350.00, -350.00, 0, '2019-11-14 12:37:00', 50.00);
INSERT INTO `sesion_caja` VALUES (331, 3, 1, '2019-11-14 12:37:00', 18415.10, 18494.10, 0, '2019-11-15 08:46:00', 50.00);
INSERT INTO `sesion_caja` VALUES (332, 3, 2, '2019-11-14 12:37:00', -350.00, -350.00, 0, '2019-11-15 08:46:00', 50.00);
INSERT INTO `sesion_caja` VALUES (333, 3, 1, '2019-11-15 08:47:00', 18494.10, 18494.10, 0, '2019-11-16 10:28:00', 50.00);
INSERT INTO `sesion_caja` VALUES (334, 3, 2, '2019-11-15 08:47:00', -350.00, -350.00, 0, '2019-11-16 10:28:00', 50.00);
INSERT INTO `sesion_caja` VALUES (335, 3, 1, '2019-11-16 10:29:00', 18494.10, 18563.10, 0, '2019-11-17 09:00:00', 50.00);
INSERT INTO `sesion_caja` VALUES (336, 3, 2, '2019-11-16 10:29:00', -350.00, -350.00, 0, '2019-11-17 09:00:00', 50.00);
INSERT INTO `sesion_caja` VALUES (337, 3, 1, '2019-11-17 09:00:00', 18563.10, 18749.10, 0, '2019-11-18 15:25:00', 50.00);
INSERT INTO `sesion_caja` VALUES (338, 3, 2, '2019-11-17 09:00:00', -350.00, -350.00, 0, '2019-11-18 15:25:00', 50.00);
INSERT INTO `sesion_caja` VALUES (339, 3, 1, '2019-11-18 15:25:00', 18749.10, 18789.10, 0, '2019-11-18 20:13:00', 50.00);
INSERT INTO `sesion_caja` VALUES (340, 3, 2, '2019-11-18 15:25:00', -350.00, -350.00, 0, '2019-11-18 20:13:00', 50.00);
INSERT INTO `sesion_caja` VALUES (341, 3, 1, '2019-11-19 09:59:00', 18789.10, 18839.10, 0, '2019-11-20 15:37:00', 50.00);
INSERT INTO `sesion_caja` VALUES (342, 3, 2, '2019-11-19 09:59:00', -350.00, -350.00, 0, '2019-11-20 15:37:00', 50.00);
INSERT INTO `sesion_caja` VALUES (343, 3, 1, '2019-11-20 15:37:00', 18839.10, 18875.10, 0, '2019-11-21 08:51:00', 50.00);
INSERT INTO `sesion_caja` VALUES (344, 3, 2, '2019-11-20 15:37:00', -350.00, -350.00, 0, '2019-11-21 08:51:00', 50.00);
INSERT INTO `sesion_caja` VALUES (345, 3, 1, '2019-11-21 08:51:00', 18875.10, 18908.10, 0, '2019-11-22 08:13:00', 50.00);
INSERT INTO `sesion_caja` VALUES (346, 3, 2, '2019-11-21 08:51:00', -350.00, -350.00, 0, '2019-11-22 08:13:00', 50.00);
INSERT INTO `sesion_caja` VALUES (347, 3, 1, '2019-11-22 08:13:00', 18908.10, 18970.10, 0, '2019-11-23 10:39:00', 50.00);
INSERT INTO `sesion_caja` VALUES (348, 3, 2, '2019-11-22 08:13:00', -350.00, -350.00, 0, '2019-11-23 10:39:00', 50.00);
INSERT INTO `sesion_caja` VALUES (349, 3, 1, '2019-11-23 10:39:00', 18970.10, 19009.10, 0, '2019-11-24 11:27:00', 50.00);
INSERT INTO `sesion_caja` VALUES (350, 3, 2, '2019-11-23 10:39:00', -350.00, -350.00, 0, '2019-11-24 11:27:00', 50.00);
INSERT INTO `sesion_caja` VALUES (351, 3, 1, '2019-11-24 11:27:00', 19009.10, 19194.10, 0, '2019-11-26 09:22:00', 50.00);
INSERT INTO `sesion_caja` VALUES (352, 3, 2, '2019-11-24 11:27:00', -350.00, -350.00, 0, '2019-11-26 09:22:00', 50.00);
INSERT INTO `sesion_caja` VALUES (353, 3, 1, '2019-11-26 09:22:00', 19194.10, 19254.10, 0, '2019-11-27 09:29:00', 50.00);
INSERT INTO `sesion_caja` VALUES (354, 3, 2, '2019-11-26 09:22:00', -350.00, -350.00, 0, '2019-11-27 09:29:00', 50.00);
INSERT INTO `sesion_caja` VALUES (355, 3, 1, '2019-11-27 09:29:00', 19254.10, 19326.10, 0, '2019-11-28 13:52:00', 50.00);
INSERT INTO `sesion_caja` VALUES (356, 3, 2, '2019-11-27 09:29:00', -350.00, -350.00, 0, '2019-11-28 13:52:00', 50.00);
INSERT INTO `sesion_caja` VALUES (357, 3, 1, '2019-11-28 13:52:00', 19326.10, 19340.10, 0, '2019-11-29 16:05:00', 50.00);
INSERT INTO `sesion_caja` VALUES (358, 3, 2, '2019-11-28 13:52:00', -350.00, -350.00, 0, '2019-11-29 16:05:00', 50.00);
INSERT INTO `sesion_caja` VALUES (359, 3, 1, '2019-11-29 16:05:00', 19340.10, 19484.10, 0, '2019-11-30 09:19:00', 50.00);
INSERT INTO `sesion_caja` VALUES (360, 3, 2, '2019-11-29 16:05:00', -350.00, -350.00, 0, '2019-11-30 09:19:00', 50.00);
INSERT INTO `sesion_caja` VALUES (361, 3, 1, '2019-11-30 09:19:00', 19484.10, 19640.10, 0, '2019-12-01 09:48:00', 50.00);
INSERT INTO `sesion_caja` VALUES (362, 3, 2, '2019-11-30 09:19:00', -350.00, -350.00, 0, '2019-12-01 09:48:00', 50.00);
INSERT INTO `sesion_caja` VALUES (363, 3, 1, '2019-12-01 09:49:00', 19640.10, 19659.10, 0, '2019-12-18 16:45:00', 50.00);
INSERT INTO `sesion_caja` VALUES (364, 3, 2, '2019-12-01 09:49:00', -350.00, -350.00, 0, '2019-12-18 16:45:00', 50.00);
INSERT INTO `sesion_caja` VALUES (365, 3, 1, '2019-12-18 16:45:00', 19659.10, 19659.10, 0, '2019-12-21 07:45:00', 50.00);
INSERT INTO `sesion_caja` VALUES (366, 3, 2, '2019-12-18 16:45:00', -350.00, -350.00, 0, '2019-12-21 07:45:00', 50.00);
INSERT INTO `sesion_caja` VALUES (367, 3, 1, '2019-12-21 07:45:00', 19659.10, 19776.10, 0, '2019-12-22 08:41:00', 50.00);
INSERT INTO `sesion_caja` VALUES (368, 3, 2, '2019-12-21 07:45:00', -350.00, -350.00, 0, '2019-12-22 08:41:00', 50.00);
INSERT INTO `sesion_caja` VALUES (369, 3, 1, '2019-12-22 08:41:00', 19776.10, 19776.10, 0, '2019-12-23 09:15:00', 50.00);
INSERT INTO `sesion_caja` VALUES (370, 3, 2, '2019-12-22 08:41:00', -350.00, -350.00, 0, '2019-12-23 09:15:00', 50.00);
INSERT INTO `sesion_caja` VALUES (371, 3, 1, '2019-12-23 09:15:00', 19776.10, 19802.10, 0, '2019-12-24 17:55:00', 50.00);
INSERT INTO `sesion_caja` VALUES (372, 3, 2, '2019-12-23 09:15:00', -350.00, -350.00, 0, '2019-12-24 17:55:00', 50.00);
INSERT INTO `sesion_caja` VALUES (373, 3, 1, '2019-12-24 17:55:00', 19852.10, 19852.10, 0, '2019-12-24 18:03:00', 0.00);
INSERT INTO `sesion_caja` VALUES (374, 3, 2, '2019-12-24 17:55:00', -350.00, -350.00, 0, '2019-12-24 18:03:00', 50.00);
INSERT INTO `sesion_caja` VALUES (375, 3, 1, '2019-12-24 18:03:00', 19802.10, 19894.10, 0, '2019-12-25 10:41:00', 50.00);
INSERT INTO `sesion_caja` VALUES (376, 3, 2, '2019-12-24 18:03:00', -350.00, -350.00, 0, '2019-12-25 10:41:00', 50.00);
INSERT INTO `sesion_caja` VALUES (377, 3, 1, '2019-12-25 10:49:00', 19894.10, 20234.10, 0, '2019-12-25 22:54:00', 50.00);
INSERT INTO `sesion_caja` VALUES (378, 3, 2, '2019-12-25 10:49:00', -350.00, -350.00, 0, '2019-12-25 22:54:00', 50.00);
INSERT INTO `sesion_caja` VALUES (379, 3, 1, '2019-12-26 09:39:00', 20234.10, 20563.10, 0, '2019-12-26 21:56:00', 50.00);
INSERT INTO `sesion_caja` VALUES (380, 3, 2, '2019-12-26 09:39:00', -350.00, -350.00, 0, '2019-12-26 21:56:00', 50.00);
INSERT INTO `sesion_caja` VALUES (381, 3, 1, '2019-12-27 10:31:00', 20563.10, 20599.10, 0, '2019-12-28 12:33:00', 50.00);
INSERT INTO `sesion_caja` VALUES (382, 3, 2, '2019-12-27 10:31:00', -350.00, -350.00, 0, '2019-12-28 12:33:00', 50.00);
INSERT INTO `sesion_caja` VALUES (383, 3, 1, '2019-12-28 12:33:00', 20599.10, 20635.10, 0, '2020-01-01 11:31:00', 50.00);
INSERT INTO `sesion_caja` VALUES (384, 3, 2, '2019-12-28 12:33:00', -350.00, -350.00, 0, '2020-01-01 11:31:00', 50.00);
INSERT INTO `sesion_caja` VALUES (385, 3, 1, '2020-01-01 11:31:00', 20635.10, 20713.20, 0, '2020-01-02 10:17:00', 50.00);
INSERT INTO `sesion_caja` VALUES (386, 3, 2, '2020-01-01 11:31:00', -350.00, -350.00, 0, '2020-01-02 10:17:00', 50.00);
INSERT INTO `sesion_caja` VALUES (387, 3, 1, '2020-01-02 10:17:00', 20729.20, 20729.20, 0, '2020-01-03 11:45:00', 34.00);
INSERT INTO `sesion_caja` VALUES (388, 3, 2, '2020-01-02 10:17:00', -334.00, -334.00, 0, '2020-01-03 11:45:00', 34.00);
INSERT INTO `sesion_caja` VALUES (389, 3, 1, '2020-01-03 11:45:00', 20713.20, 20757.20, 0, '2020-01-04 10:35:00', 50.00);
INSERT INTO `sesion_caja` VALUES (390, 3, 2, '2020-01-03 11:45:00', -350.00, -350.00, 0, '2020-01-04 10:35:00', 50.00);
INSERT INTO `sesion_caja` VALUES (391, 3, 1, '2020-01-04 10:36:00', 20777.20, 20833.20, 0, '2020-01-04 17:02:00', 30.00);
INSERT INTO `sesion_caja` VALUES (392, 3, 2, '2020-01-04 10:36:00', -330.00, -330.00, 0, '2020-01-04 17:02:00', 30.00);
INSERT INTO `sesion_caja` VALUES (393, 3, 1, '2020-01-04 17:02:00', 20813.20, 20909.20, 0, '2020-01-05 11:52:00', 50.00);
INSERT INTO `sesion_caja` VALUES (394, 3, 2, '2020-01-04 17:02:00', -350.00, -350.00, 0, '2020-01-05 11:52:00', 50.00);
INSERT INTO `sesion_caja` VALUES (395, 3, 1, '2020-01-05 11:52:00', 20924.20, 21016.20, 0, '2020-01-06 07:50:00', 35.00);
INSERT INTO `sesion_caja` VALUES (396, 3, 2, '2020-01-05 11:52:00', -335.00, -335.00, 0, '2020-01-06 07:50:00', 35.00);
INSERT INTO `sesion_caja` VALUES (397, 3, 1, '2020-01-06 07:50:00', 21001.20, 21119.20, 0, '2020-01-10 14:35:00', 50.00);
INSERT INTO `sesion_caja` VALUES (398, 3, 2, '2020-01-06 07:50:00', -350.00, -350.00, 0, '2020-01-10 14:35:00', 50.00);
INSERT INTO `sesion_caja` VALUES (399, 3, 1, '2020-01-10 14:35:00', 21139.20, 21139.20, 0, '2020-01-10 22:34:00', 30.00);
INSERT INTO `sesion_caja` VALUES (400, 3, 2, '2020-01-10 14:35:00', -330.00, -330.00, 0, '2020-01-10 22:34:00', 30.00);
INSERT INTO `sesion_caja` VALUES (401, 3, 1, '2020-01-12 16:50:00', 21119.20, 21232.20, 0, '2020-01-13 15:11:00', 50.00);
INSERT INTO `sesion_caja` VALUES (402, 3, 2, '2020-01-12 16:50:00', -300.00, -300.00, 0, '2020-01-13 15:11:00', 0.00);
INSERT INTO `sesion_caja` VALUES (403, 3, 1, '2020-01-13 15:51:00', 21281.20, 21411.20, 0, '2020-01-14 10:58:00', 1.00);
INSERT INTO `sesion_caja` VALUES (404, 3, 2, '2020-01-13 15:51:00', -300.00, -300.00, 0, '2020-01-14 10:58:00', 0.00);
INSERT INTO `sesion_caja` VALUES (405, 3, 1, '2020-01-14 10:58:00', 21362.20, 21440.20, 0, '2020-01-15 09:29:00', 50.00);
INSERT INTO `sesion_caja` VALUES (406, 3, 2, '2020-01-14 10:58:00', -300.00, -300.00, 0, '2020-01-15 09:29:00', 0.00);
INSERT INTO `sesion_caja` VALUES (407, 3, 1, '2020-01-15 09:29:00', 21440.20, 21520.20, 0, '2020-01-16 12:04:00', 50.00);
INSERT INTO `sesion_caja` VALUES (408, 3, 2, '2020-01-15 09:29:00', -300.00, -300.00, 0, '2020-01-16 12:04:00', 0.00);
INSERT INTO `sesion_caja` VALUES (409, 3, 1, '2020-01-16 12:05:00', 21570.20, 21588.20, 0, '2020-01-16 15:19:00', 0.00);
INSERT INTO `sesion_caja` VALUES (410, 3, 2, '2020-01-16 12:05:00', -350.00, -350.00, 0, '2020-01-16 15:19:00', 50.00);
INSERT INTO `sesion_caja` VALUES (411, 3, 1, '2020-01-16 15:19:00', 21538.20, 21538.20, 0, '2020-01-16 15:21:00', 50.00);
INSERT INTO `sesion_caja` VALUES (412, 3, 2, '2020-01-16 15:19:00', -350.00, -350.00, 0, '2020-01-16 15:21:00', 50.00);
INSERT INTO `sesion_caja` VALUES (413, 3, 1, '2020-01-16 15:21:00', 21588.20, 21686.20, 0, '2020-01-17 12:30:00', 0.00);
INSERT INTO `sesion_caja` VALUES (414, 3, 2, '2020-01-16 15:21:00', -350.00, -350.00, 0, '2020-01-17 12:30:00', 50.00);
INSERT INTO `sesion_caja` VALUES (415, 3, 1, '2020-01-17 12:30:00', 21636.20, 21698.20, 0, '2020-01-17 21:56:00', 50.00);
INSERT INTO `sesion_caja` VALUES (416, 3, 2, '2020-01-17 12:30:00', -350.00, -350.00, 0, '2020-01-17 21:56:00', 50.00);
INSERT INTO `sesion_caja` VALUES (417, 3, 1, '2020-01-18 09:09:00', 21698.20, 21714.20, 0, '2020-01-18 09:09:00', 50.00);
INSERT INTO `sesion_caja` VALUES (418, 3, 2, '2020-01-18 09:09:00', -350.00, -350.00, 0, '2020-01-18 09:09:00', 50.00);
INSERT INTO `sesion_caja` VALUES (419, 3, 1, '2020-01-18 09:09:00', 21714.20, 21722.20, 0, '2020-01-19 14:53:00', 50.00);
INSERT INTO `sesion_caja` VALUES (420, 3, 2, '2020-01-18 09:09:00', -350.00, -350.00, 0, '2020-01-19 14:53:00', 50.00);
INSERT INTO `sesion_caja` VALUES (421, 3, 1, '2020-01-19 14:55:00', 21722.20, 21833.20, 0, '2020-01-20 09:52:00', 50.00);
INSERT INTO `sesion_caja` VALUES (422, 3, 2, '2020-01-19 14:55:00', -350.00, -350.00, 0, '2020-01-20 09:52:00', 50.00);
INSERT INTO `sesion_caja` VALUES (423, 3, 1, '2020-01-20 09:53:00', 21833.20, 21958.20, 0, '2020-01-21 09:24:00', 50.00);
INSERT INTO `sesion_caja` VALUES (424, 3, 2, '2020-01-20 09:53:00', -350.00, -350.00, 0, '2020-01-21 09:24:00', 50.00);
INSERT INTO `sesion_caja` VALUES (425, 3, 1, '2020-01-21 09:24:00', 21958.20, 22006.20, 0, '2020-01-22 10:58:00', 50.00);
INSERT INTO `sesion_caja` VALUES (426, 3, 2, '2020-01-21 09:24:00', -350.00, -350.00, 0, '2020-01-22 10:58:00', 50.00);
INSERT INTO `sesion_caja` VALUES (427, 3, 1, '2020-01-22 10:58:00', 22006.20, 22034.20, 0, '2020-01-23 17:36:00', 50.00);
INSERT INTO `sesion_caja` VALUES (428, 3, 2, '2020-01-22 10:58:00', -350.00, -350.00, 0, '2020-01-23 17:36:00', 50.00);
INSERT INTO `sesion_caja` VALUES (429, 3, 1, '2020-01-23 17:37:00', 22034.20, 22075.20, 0, '2020-01-23 20:24:00', 50.00);
INSERT INTO `sesion_caja` VALUES (430, 3, 2, '2020-01-23 17:37:00', -350.00, -350.00, 0, '2020-01-23 20:24:00', 50.00);
INSERT INTO `sesion_caja` VALUES (431, 3, 1, '2020-01-24 16:05:00', 22075.20, 22201.20, 0, '2020-01-25 08:42:00', 50.00);
INSERT INTO `sesion_caja` VALUES (432, 3, 2, '2020-01-24 16:05:00', -350.00, -350.00, 0, '2020-01-25 08:42:00', 50.00);
INSERT INTO `sesion_caja` VALUES (433, 3, 1, '2020-01-25 08:43:00', 22251.20, 22423.20, 0, '2020-01-26 10:27:00', 0.00);
INSERT INTO `sesion_caja` VALUES (434, 3, 2, '2020-01-25 08:43:00', -350.00, -350.00, 0, '2020-01-26 10:27:00', 50.00);
INSERT INTO `sesion_caja` VALUES (435, 3, 1, '2020-01-26 10:27:00', 22373.20, 22718.20, 0, '2020-01-26 21:50:00', 50.00);
INSERT INTO `sesion_caja` VALUES (436, 3, 2, '2020-01-26 10:27:00', -350.00, -350.00, 0, '2020-01-26 21:50:00', 50.00);
INSERT INTO `sesion_caja` VALUES (437, 3, 1, '2020-01-27 16:35:00', 22718.20, 22729.20, 0, '2020-01-28 09:35:00', 50.00);
INSERT INTO `sesion_caja` VALUES (438, 3, 2, '2020-01-27 16:35:00', -350.00, -350.00, 0, '2020-01-28 09:35:00', 50.00);
INSERT INTO `sesion_caja` VALUES (439, 3, 1, '2020-01-28 09:35:00', 22749.20, 22749.20, 0, '2020-01-28 17:40:00', 30.00);
INSERT INTO `sesion_caja` VALUES (440, 3, 2, '2020-01-28 09:35:00', -330.00, -330.00, 0, '2020-01-28 17:40:00', 30.00);
INSERT INTO `sesion_caja` VALUES (441, 3, 1, '2020-01-28 17:40:00', 22729.20, 22793.20, 0, '2020-01-29 15:21:00', 50.00);
INSERT INTO `sesion_caja` VALUES (442, 3, 2, '2020-01-28 17:40:00', -350.00, -350.00, 0, '2020-01-29 15:21:00', 50.00);
INSERT INTO `sesion_caja` VALUES (443, 3, 1, '2020-01-29 15:22:00', 22813.20, 22894.20, 0, '2020-01-30 10:57:00', 30.00);
INSERT INTO `sesion_caja` VALUES (444, 3, 2, '2020-01-29 15:22:00', -330.00, -330.00, 0, '2020-01-30 10:57:00', 30.00);
INSERT INTO `sesion_caja` VALUES (445, 3, 1, '2020-01-30 10:57:00', 22874.20, 23052.20, 0, '2020-01-31 09:51:00', 50.00);
INSERT INTO `sesion_caja` VALUES (446, 3, 2, '2020-01-30 10:57:00', -350.00, -350.00, 0, '2020-01-31 09:51:00', 50.00);
INSERT INTO `sesion_caja` VALUES (447, 3, 1, '2020-01-31 09:51:00', 23052.20, 23193.20, 0, '2020-02-01 20:16:00', 50.00);
INSERT INTO `sesion_caja` VALUES (448, 3, 2, '2020-01-31 09:51:00', -350.00, -350.00, 0, '2020-02-01 20:16:00', 50.00);
INSERT INTO `sesion_caja` VALUES (449, 3, 1, '2020-02-01 20:17:00', 23193.20, 23266.20, 0, '2020-02-01 20:18:00', 50.00);
INSERT INTO `sesion_caja` VALUES (450, 3, 2, '2020-02-01 20:17:00', -350.00, -350.00, 0, '2020-02-01 20:18:00', 50.00);
INSERT INTO `sesion_caja` VALUES (451, 3, 1, '2020-02-01 20:18:00', 23266.20, 23334.20, 0, '2020-02-02 11:32:00', 50.00);
INSERT INTO `sesion_caja` VALUES (452, 3, 2, '2020-02-01 20:18:00', -350.00, -350.00, 0, '2020-02-02 11:32:00', 50.00);
INSERT INTO `sesion_caja` VALUES (453, 3, 1, '2020-02-02 11:32:00', 23354.20, 23572.20, 0, '2020-02-03 16:25:00', 30.00);
INSERT INTO `sesion_caja` VALUES (454, 3, 2, '2020-02-02 11:32:00', -330.00, -330.00, 0, '2020-02-03 16:25:00', 30.00);
INSERT INTO `sesion_caja` VALUES (455, 3, 1, '2020-02-03 16:25:00', 23562.20, 23757.20, 0, '2020-02-05 11:56:00', 40.00);
INSERT INTO `sesion_caja` VALUES (456, 3, 2, '2020-02-03 16:25:00', -340.00, -340.00, 0, '2020-02-05 11:56:00', 40.00);
INSERT INTO `sesion_caja` VALUES (457, 3, 1, '2020-02-05 14:57:00', 23247.20, 23247.20, 0, '2020-02-05 14:57:00', 550.00);
INSERT INTO `sesion_caja` VALUES (458, 3, 2, '2020-02-05 14:57:00', -350.00, -350.00, 0, '2020-02-05 14:57:00', 50.00);
INSERT INTO `sesion_caja` VALUES (459, 3, 1, '2020-02-05 14:58:00', 23747.20, 23877.20, 0, '2020-02-06 09:34:00', 50.00);
INSERT INTO `sesion_caja` VALUES (460, 3, 2, '2020-02-05 14:58:00', -350.00, -350.00, 0, '2020-02-06 09:34:00', 50.00);
INSERT INTO `sesion_caja` VALUES (461, 3, 1, '2020-02-06 09:50:00', 23877.20, 23979.20, 0, '2020-02-07 16:19:00', 50.00);
INSERT INTO `sesion_caja` VALUES (462, 3, 2, '2020-02-06 09:50:00', -350.00, -360.00, 0, '2020-02-07 16:19:00', 50.00);
INSERT INTO `sesion_caja` VALUES (463, 3, 1, '2020-02-07 16:21:00', 23979.20, 23993.20, 0, '2020-02-08 16:41:00', 50.00);
INSERT INTO `sesion_caja` VALUES (464, 3, 2, '2020-02-07 16:21:00', -360.00, -360.00, 0, '2020-02-08 16:41:00', 50.00);
INSERT INTO `sesion_caja` VALUES (465, 3, 1, '2020-02-08 16:41:00', 23993.20, 24170.20, 0, '2020-02-09 10:10:00', 50.00);
INSERT INTO `sesion_caja` VALUES (466, 3, 2, '2020-02-08 16:41:00', -360.00, -360.00, 0, '2020-02-09 10:10:00', 50.00);
INSERT INTO `sesion_caja` VALUES (467, 3, 1, '2020-02-09 10:11:00', 24170.20, 24273.20, 0, '2020-02-10 12:36:00', 50.00);
INSERT INTO `sesion_caja` VALUES (468, 3, 2, '2020-02-09 10:11:00', -360.00, -360.00, 0, '2020-02-10 12:36:00', 50.00);
INSERT INTO `sesion_caja` VALUES (469, 3, 1, '2020-02-10 12:36:00', 24273.20, 24327.20, 0, '2020-02-11 11:23:00', 50.00);
INSERT INTO `sesion_caja` VALUES (470, 3, 2, '2020-02-10 12:36:00', -360.00, -360.00, 0, '2020-02-11 11:23:00', 50.00);
INSERT INTO `sesion_caja` VALUES (471, 3, 1, '2020-02-11 11:26:00', 24327.20, 24533.20, 0, '2020-02-11 20:20:00', 50.00);
INSERT INTO `sesion_caja` VALUES (472, 3, 2, '2020-02-11 11:26:00', -360.00, -360.00, 0, '2020-02-11 20:20:00', 50.00);
INSERT INTO `sesion_caja` VALUES (473, 3, 1, '2020-02-12 09:36:00', 24533.20, 24649.20, 0, '2020-02-13 09:52:00', 50.00);
INSERT INTO `sesion_caja` VALUES (474, 3, 2, '2020-02-12 09:36:00', -360.00, -360.00, 0, '2020-02-13 09:52:00', 50.00);
INSERT INTO `sesion_caja` VALUES (475, 3, 1, '2020-02-13 10:20:00', 24649.20, 24786.20, 0, '2020-02-14 10:59:00', 50.00);
INSERT INTO `sesion_caja` VALUES (476, 3, 2, '2020-02-13 10:20:00', -360.00, -360.00, 0, '2020-02-14 10:59:00', 50.00);
INSERT INTO `sesion_caja` VALUES (477, 3, 1, '2020-02-14 10:59:00', 24786.20, 25020.20, 0, '2020-02-14 22:30:00', 50.00);
INSERT INTO `sesion_caja` VALUES (478, 3, 2, '2020-02-14 10:59:00', -360.00, -360.00, 0, '2020-02-14 22:30:00', 50.00);
INSERT INTO `sesion_caja` VALUES (479, 3, 1, '2020-02-15 15:05:00', 25020.20, 25075.20, 0, '2020-02-15 21:06:00', 50.00);
INSERT INTO `sesion_caja` VALUES (480, 3, 2, '2020-02-15 15:05:00', -360.00, -360.00, 0, '2020-02-15 21:06:00', 50.00);
INSERT INTO `sesion_caja` VALUES (481, 3, 1, '2020-02-16 10:48:00', 25075.20, 25257.20, 0, '2020-02-16 22:01:00', 50.00);
INSERT INTO `sesion_caja` VALUES (482, 3, 2, '2020-02-16 10:48:00', -360.00, -360.00, 0, '2020-02-16 22:01:00', 50.00);
INSERT INTO `sesion_caja` VALUES (483, 3, 1, '2020-02-17 16:26:00', 25257.20, 25351.20, 0, '2020-02-18 09:46:00', 50.00);
INSERT INTO `sesion_caja` VALUES (484, 3, 2, '2020-02-17 16:26:00', -360.00, -360.00, 0, '2020-02-18 09:46:00', 50.00);
INSERT INTO `sesion_caja` VALUES (485, 3, 1, '2020-02-18 09:46:00', 25351.20, 25571.20, 0, '2020-02-19 09:25:00', 50.00);
INSERT INTO `sesion_caja` VALUES (486, 3, 2, '2020-02-18 09:46:00', -360.00, -360.00, 0, '2020-02-19 09:25:00', 50.00);
INSERT INTO `sesion_caja` VALUES (487, 3, 1, '2020-02-19 09:25:00', 25571.20, 25708.20, 0, '2020-02-20 09:56:00', 50.00);
INSERT INTO `sesion_caja` VALUES (488, 3, 2, '2020-02-19 09:25:00', -360.00, -360.00, 0, '2020-02-20 09:56:00', 50.00);
INSERT INTO `sesion_caja` VALUES (489, 3, 1, '2020-02-20 09:56:00', 25708.20, 25734.20, 0, '2020-02-21 17:37:00', 50.00);
INSERT INTO `sesion_caja` VALUES (490, 3, 2, '2020-02-20 09:56:00', -360.00, -360.00, 0, '2020-02-21 17:37:00', 50.00);
INSERT INTO `sesion_caja` VALUES (491, 3, 1, '2020-02-21 17:37:00', 25784.20, 26094.20, 0, '2020-02-23 19:11:00', 0.00);
INSERT INTO `sesion_caja` VALUES (492, 3, 2, '2020-02-21 17:37:00', -310.00, -310.00, 0, '2020-02-23 19:11:00', 0.00);
INSERT INTO `sesion_caja` VALUES (493, 3, 1, '2020-02-23 19:11:00', 26044.20, 26182.20, 0, '2020-02-24 12:12:00', 50.00);
INSERT INTO `sesion_caja` VALUES (494, 3, 2, '2020-02-23 19:11:00', -360.00, -360.00, 0, '2020-02-24 12:12:00', 50.00);
INSERT INTO `sesion_caja` VALUES (495, 3, 1, '2020-02-24 12:12:00', 26182.20, 26297.20, 0, '2020-02-25 10:02:00', 50.00);
INSERT INTO `sesion_caja` VALUES (496, 3, 2, '2020-02-24 12:12:00', -360.00, -360.00, 0, '2020-02-25 10:02:00', 50.00);
INSERT INTO `sesion_caja` VALUES (497, 3, 1, '2020-02-25 10:02:00', 26297.20, 26297.20, 0, '2020-02-25 11:47:00', 50.00);
INSERT INTO `sesion_caja` VALUES (498, 3, 2, '2020-02-25 10:02:00', -360.00, -360.00, 0, '2020-02-25 11:47:00', 50.00);
INSERT INTO `sesion_caja` VALUES (499, 3, 1, '2020-02-25 11:47:00', 26270.20, 26342.20, 0, '2020-02-25 21:50:00', 77.00);
INSERT INTO `sesion_caja` VALUES (500, 3, 2, '2020-02-25 11:47:00', -387.00, -387.00, 0, '2020-02-25 21:50:00', 77.00);
INSERT INTO `sesion_caja` VALUES (501, 3, 1, '2020-02-26 11:09:00', 26366.20, 26457.20, 0, '2020-02-27 12:52:00', 53.00);
INSERT INTO `sesion_caja` VALUES (502, 3, 2, '2020-02-26 11:09:00', -363.00, -363.00, 0, '2020-02-27 12:52:00', 53.00);
INSERT INTO `sesion_caja` VALUES (503, 3, 1, '2020-02-27 17:06:00', 26470.20, 26560.20, 0, '2020-02-28 11:01:00', 40.00);
INSERT INTO `sesion_caja` VALUES (504, 3, 2, '2020-02-27 17:06:00', -350.00, -350.00, 0, '2020-02-28 11:01:00', 40.00);
INSERT INTO `sesion_caja` VALUES (505, 3, 1, '2020-02-28 11:01:00', 26550.20, 26619.20, 0, '2020-02-29 09:21:00', 50.00);
INSERT INTO `sesion_caja` VALUES (506, 3, 2, '2020-02-28 11:01:00', -360.00, -360.00, 0, '2020-02-29 09:21:00', 50.00);
INSERT INTO `sesion_caja` VALUES (507, 3, 1, '2020-02-29 09:21:00', 26619.20, 26705.20, 0, '2020-03-01 09:53:00', 50.00);
INSERT INTO `sesion_caja` VALUES (508, 3, 2, '2020-02-29 09:21:00', -360.00, -360.00, 0, '2020-03-01 09:53:00', 50.00);
INSERT INTO `sesion_caja` VALUES (509, 3, 1, '2020-03-01 09:54:00', 26705.20, 26735.20, 0, '2020-03-02 11:21:00', 50.00);
INSERT INTO `sesion_caja` VALUES (510, 3, 2, '2020-03-01 09:54:00', -360.00, -360.00, 0, '2020-03-02 11:21:00', 50.00);
INSERT INTO `sesion_caja` VALUES (511, 3, 1, '2020-03-02 11:21:00', 26735.20, 26878.20, 0, '2020-03-03 12:12:00', 50.00);
INSERT INTO `sesion_caja` VALUES (512, 3, 2, '2020-03-02 11:21:00', -360.00, -360.00, 0, '2020-03-03 12:12:00', 50.00);
INSERT INTO `sesion_caja` VALUES (513, 3, 1, '2020-03-03 12:13:00', 26878.20, 27001.20, 0, '2020-03-04 10:20:00', 50.00);
INSERT INTO `sesion_caja` VALUES (514, 3, 2, '2020-03-03 12:13:00', -360.00, -360.00, 0, '2020-03-04 10:20:00', 50.00);
INSERT INTO `sesion_caja` VALUES (515, 3, 1, '2020-03-04 10:20:00', 27001.20, 27103.20, 0, '2020-03-05 10:18:00', 50.00);
INSERT INTO `sesion_caja` VALUES (516, 3, 2, '2020-03-04 10:20:00', -360.00, -360.00, 0, '2020-03-05 10:18:00', 50.00);
INSERT INTO `sesion_caja` VALUES (517, 3, 1, '2020-03-05 10:18:00', 27103.20, 27165.20, 0, '2020-03-07 10:44:00', 50.00);
INSERT INTO `sesion_caja` VALUES (518, 3, 2, '2020-03-05 10:18:00', -360.00, -360.00, 0, '2020-03-07 10:44:00', 50.00);
INSERT INTO `sesion_caja` VALUES (519, 3, 1, '2020-03-07 10:44:00', 27165.20, 27175.20, 0, '2020-03-07 11:12:00', 50.00);
INSERT INTO `sesion_caja` VALUES (520, 3, 2, '2020-03-07 10:44:00', -360.00, -360.00, 0, '2020-03-07 11:12:00', 50.00);
INSERT INTO `sesion_caja` VALUES (521, 3, 1, '2020-03-07 11:13:00', 27175.20, 27382.20, 0, '2020-03-08 15:36:00', 50.00);
INSERT INTO `sesion_caja` VALUES (522, 3, 2, '2020-03-07 11:13:00', -360.00, -360.00, 0, '2020-03-08 15:36:00', 50.00);
INSERT INTO `sesion_caja` VALUES (523, 3, 1, '2020-03-08 15:37:00', 27382.20, 27507.20, 0, '2020-03-09 10:27:00', 50.00);
INSERT INTO `sesion_caja` VALUES (524, 3, 2, '2020-03-08 15:37:00', -360.00, -360.00, 0, '2020-03-09 10:27:00', 50.00);
INSERT INTO `sesion_caja` VALUES (525, 3, 1, '2020-03-09 10:27:00', 27507.20, 27579.20, 0, '2020-03-10 09:54:00', 50.00);
INSERT INTO `sesion_caja` VALUES (526, 3, 2, '2020-03-09 10:27:00', -360.00, -360.00, 0, '2020-03-10 09:54:00', 50.00);
INSERT INTO `sesion_caja` VALUES (527, 3, 1, '2020-03-10 09:54:00', 27579.20, 27613.20, 0, '2020-03-11 09:42:00', 50.00);
INSERT INTO `sesion_caja` VALUES (528, 3, 2, '2020-03-10 09:54:00', -360.00, -360.00, 0, '2020-03-11 09:42:00', 50.00);
INSERT INTO `sesion_caja` VALUES (529, 3, 1, '2020-03-11 09:42:00', 27613.20, 27718.70, 0, '2020-03-11 21:12:00', 50.00);
INSERT INTO `sesion_caja` VALUES (530, 3, 2, '2020-03-11 09:42:00', -360.00, -360.00, 0, '2020-03-11 21:12:00', 50.00);
INSERT INTO `sesion_caja` VALUES (531, 3, 1, '2020-03-12 15:27:00', 27738.70, 27778.70, 0, '2020-03-13 09:53:00', 30.00);
INSERT INTO `sesion_caja` VALUES (532, 3, 2, '2020-03-12 15:27:00', -340.00, -340.00, 0, '2020-03-13 09:53:00', 30.00);
INSERT INTO `sesion_caja` VALUES (533, 3, 1, '2020-03-13 09:54:00', 27778.70, 27955.70, 0, '2020-03-13 21:17:00', 30.00);
INSERT INTO `sesion_caja` VALUES (534, 3, 2, '2020-03-13 09:54:00', -340.00, -340.00, 0, '2020-03-13 21:17:00', 30.00);
INSERT INTO `sesion_caja` VALUES (535, 3, 1, '2020-03-14 15:09:00', 27935.70, 27995.70, 0, '2020-03-15 11:19:00', 50.00);
INSERT INTO `sesion_caja` VALUES (536, 3, 2, '2020-03-14 15:09:00', -360.00, -360.00, 0, '2020-03-15 11:19:00', 50.00);
INSERT INTO `sesion_caja` VALUES (537, 3, 1, '2020-03-15 11:19:00', 27995.70, 28145.70, 0, '2020-03-15 22:43:00', 50.00);
INSERT INTO `sesion_caja` VALUES (538, 3, 2, '2020-03-15 11:19:00', -360.00, -360.00, 0, '2020-03-15 22:43:00', 50.00);
INSERT INTO `sesion_caja` VALUES (539, 3, 1, '2020-03-15 22:44:00', 28165.70, 28103.70, 0, '2021-01-08 00:01:00', 30.00);
INSERT INTO `sesion_caja` VALUES (540, 3, 2, '2020-03-15 22:44:00', -340.00, -440.00, 0, '2021-01-08 00:01:00', 30.00);
INSERT INTO `sesion_caja` VALUES (541, 13, 1, '2021-01-07 22:45:00', 28065.70, 28103.70, 0, '2021-01-08 00:01:00', 100.00);
INSERT INTO `sesion_caja` VALUES (542, 13, 2, '2021-01-07 22:45:00', -440.00, -440.00, 0, '2021-01-08 00:01:00', 100.00);
INSERT INTO `sesion_caja` VALUES (543, 13, 1, '2021-01-08 00:01:00', 28103.70, 28134.70, 0, '2021-01-09 11:42:00', 100.00);
INSERT INTO `sesion_caja` VALUES (544, 13, 2, '2021-01-08 00:01:00', -340.00, -340.00, 0, '2021-01-09 11:42:00', 0.00);
INSERT INTO `sesion_caja` VALUES (545, 13, 1, '2021-01-09 11:42:00', 28134.70, 28177.70, 0, '2021-01-10 08:21:00', 100.00);
INSERT INTO `sesion_caja` VALUES (546, 13, 2, '2021-01-09 11:42:00', -340.00, -340.00, 0, '2021-01-10 08:21:00', 0.00);
INSERT INTO `sesion_caja` VALUES (547, 13, 1, '2021-01-10 08:21:00', 28177.70, 28322.20, 0, '2021-01-11 00:26:00', 100.00);
INSERT INTO `sesion_caja` VALUES (548, 13, 2, '2021-01-10 08:21:00', -340.00, -340.00, 0, '2021-01-11 00:26:00', 0.00);
INSERT INTO `sesion_caja` VALUES (549, 13, 1, '2021-01-11 00:26:00', 28322.20, 28505.20, 0, '2021-01-11 11:12:00', 100.00);
INSERT INTO `sesion_caja` VALUES (550, 13, 2, '2021-01-11 00:26:00', -340.00, -340.00, 0, '2021-01-11 11:12:00', 0.00);
INSERT INTO `sesion_caja` VALUES (551, 13, 1, '2021-01-11 11:12:00', 28555.20, 28506.20, 0, '2021-01-11 11:56:00', 50.00);
INSERT INTO `sesion_caja` VALUES (552, 13, 2, '2021-01-11 11:12:00', -340.00, -340.00, 0, '2021-01-11 11:56:00', 0.00);
INSERT INTO `sesion_caja` VALUES (553, 13, 1, '2021-01-11 11:57:00', 28356.20, 28391.20, 0, '2021-01-12 00:41:00', 200.00);
INSERT INTO `sesion_caja` VALUES (554, 13, 2, '2021-01-11 11:57:00', -340.00, -340.00, 0, '2021-01-12 00:41:00', 0.00);
INSERT INTO `sesion_caja` VALUES (555, 13, 1, '2021-01-12 00:41:00', 28491.20, 0.00, 1, NULL, 100.00);
INSERT INTO `sesion_caja` VALUES (556, 13, 2, '2021-01-12 00:41:00', -340.00, 0.00, 1, NULL, 0.00);

-- ----------------------------
-- Table structure for sexo
-- ----------------------------
DROP TABLE IF EXISTS `sexo`;
CREATE TABLE `sexo`  (
  `sexo_id` int(11) NOT NULL AUTO_INCREMENT,
  `sexo_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `sexo_estado` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`sexo_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tipo_cliente
-- ----------------------------
DROP TABLE IF EXISTS `tipo_cliente`;
CREATE TABLE `tipo_cliente`  (
  `tipo_cliente_id` int(255) NOT NULL AUTO_INCREMENT,
  `tipo_cliente_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipo_cliente_estado` int(255) NULL DEFAULT 1,
  PRIMARY KEY (`tipo_cliente_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tipo_cliente
-- ----------------------------
INSERT INTO `tipo_cliente` VALUES (1, 'DNI', 1);
INSERT INTO `tipo_cliente` VALUES (2, 'RUC', 1);

-- ----------------------------
-- Table structure for tipo_comprobante_c
-- ----------------------------
DROP TABLE IF EXISTS `tipo_comprobante_c`;
CREATE TABLE `tipo_comprobante_c`  (
  `id_tipo_comprobante` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_comprobante_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipo_comprobante_estado` int(11) NULL DEFAULT 1,
  `tipo_comprobante_nombre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `codigo_sunat` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ordenar_venta` int(11) NULL DEFAULT NULL,
  `letras_iniciales` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipo_comprobante_contabilidad` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cu_tabla` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo_comprobante`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tipo_comprobante_c
-- ----------------------------
INSERT INTO `tipo_comprobante_c` VALUES (1, 'BOLETA DE VENTA', 1, 'BOLETA', '03', 2, 'B', 'B', NULL);
INSERT INTO `tipo_comprobante_c` VALUES (2, 'FACTURA DE VENTA', 1, 'FACTURA', '01', 1, 'F', 'F', NULL);
INSERT INTO `tipo_comprobante_c` VALUES (3, 'TICKET BOLETA', 1, 'TICKET', '12', 6, 'TB', 'TB', NULL);
INSERT INTO `tipo_comprobante_c` VALUES (4, 'TICKET FACTURA', 1, 'TICKET', '12', 5, 'TF', 'TF', NULL);
INSERT INTO `tipo_comprobante_c` VALUES (5, 'TICKET', 1, 'TICKET', '12', 7, 'T', 'T', NULL);
INSERT INTO `tipo_comprobante_c` VALUES (6, 'RECIBO DE INGRESO', 1, 'RECIBO DE INGRESO', NULL, NULL, 'RI', 'RI', NULL);
INSERT INTO `tipo_comprobante_c` VALUES (7, 'VOUCHER', 1, 'VOUCHER', NULL, NULL, 'V', 'V', NULL);
INSERT INTO `tipo_comprobante_c` VALUES (8, 'CARGO', 1, 'CARGO', NULL, NULL, 'C', 'C', NULL);
INSERT INTO `tipo_comprobante_c` VALUES (9, 'Nº DE OPERACION', 1, 'Nº DE OPERACION', NULL, NULL, 'NO', 'NO', NULL);
INSERT INTO `tipo_comprobante_c` VALUES (10, 'RECIBO', 1, 'RECIBO', NULL, NULL, 'R', 'R', NULL);
INSERT INTO `tipo_comprobante_c` VALUES (11, 'NOTA DE CREDITO', 1, 'N. CREDITO', '07', 3, 'NC', 'NC', NULL);
INSERT INTO `tipo_comprobante_c` VALUES (12, 'NOTA DE DEBITO', 1, 'N. DEBITO', '08', 4, 'ND', 'ND', NULL);
INSERT INTO `tipo_comprobante_c` VALUES (13, 'OTROS COMPROBANTES', 1, 'OTROS', NULL, NULL, 'O', 'O', NULL);
INSERT INTO `tipo_comprobante_c` VALUES (16, 'RECIBO POR HONORARIOS', 1, 'RECIBO POR HONORARIOS', '02', 8, 'RH', 'RH', '');
INSERT INTO `tipo_comprobante_c` VALUES (17, 'LIQUIDACIÓN DE COMPRA', 1, 'LIQUIDACIÓN DECOMPRA', '04', NULL, 'LC', 'LC', '');
INSERT INTO `tipo_comprobante_c` VALUES (18, 'SIN DOCUMENTO', 1, 'SIN DOCUMENTO', NULL, NULL, 'SN', 'SN', NULL);

-- ----------------------------
-- Table structure for tipo_documento
-- ----------------------------
DROP TABLE IF EXISTS `tipo_documento`;
CREATE TABLE `tipo_documento`  (
  `tipodoc_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipodoc_descripcion` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipodoc_abreviacion` varchar(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipodoc_estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  `tipodoc_codigo` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tipodoc_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tipo_documento
-- ----------------------------
INSERT INTO `tipo_documento` VALUES (1, 'FACTURA ELECTRONICA', 'FACTURA', '1', '01');
INSERT INTO `tipo_documento` VALUES (2, 'BOLETA ELECTRONICA', 'BOLETA', '1', '03');
INSERT INTO `tipo_documento` VALUES (3, 'NOTA DE CREDITO ', 'N. CRED', '1', '07');
INSERT INTO `tipo_documento` VALUES (4, 'NOTA DE DEBITO ', 'N. DEB', '1', '08');
INSERT INTO `tipo_documento` VALUES (5, 'TICKET DE MAQUINA REGISTRADORA', NULL, '1', '12');
INSERT INTO `tipo_documento` VALUES (6, 'SIN DOCUMENTO', 'SIN DOC', '1', NULL);

-- ----------------------------
-- Table structure for tipo_entrega
-- ----------------------------
DROP TABLE IF EXISTS `tipo_entrega`;
CREATE TABLE `tipo_entrega`  (
  `tipoentrega_idtipoentrega` int(11) NOT NULL AUTO_INCREMENT,
  `tipoentrega_descripcion` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipoentrega_observacion` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipoentrega_estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipoentrega_idsede` int(11) NULL DEFAULT NULL,
  `cu_tabla` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tipoentrega_idtipoentrega`) USING BTREE,
  INDEX `fk_tipoentradasede`(`tipoentrega_idsede`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tipo_entrega
-- ----------------------------
INSERT INTO `tipo_entrega` VALUES (1, 'Consumo Instantaneo', NULL, '1', NULL, NULL);
INSERT INTO `tipo_entrega` VALUES (2, 'Consumo Para llevar', NULL, '1', NULL, NULL);
INSERT INTO `tipo_entrega` VALUES (3, 'Consumo Delivery', NULL, '1', NULL, NULL);

-- ----------------------------
-- Table structure for tipo_igv
-- ----------------------------
DROP TABLE IF EXISTS `tipo_igv`;
CREATE TABLE `tipo_igv`  (
  `tipo_igv_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_igv_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipo_igv_estado` int(11) NULL DEFAULT 1,
  `tipo_igv_codigo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipo_igv` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`tipo_igv_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tipo_igv
-- ----------------------------
INSERT INTO `tipo_igv` VALUES (1, 'Gravado - Operación Onerosa', 1, '10', 1);
INSERT INTO `tipo_igv` VALUES (2, '[Gratuita] Gravado - Retiro por premio', 1, '11', 1);
INSERT INTO `tipo_igv` VALUES (3, '[Gratuita] Gravado - Retiro por donación', 1, '12', 1);
INSERT INTO `tipo_igv` VALUES (4, '[Gratuita] Gravado - Retiro', 1, '13', 1);
INSERT INTO `tipo_igv` VALUES (5, '[Gratuita] Gravado - Retiro por publicidad', 1, '14', 1);
INSERT INTO `tipo_igv` VALUES (6, '[Gratuita] Gravado - Bonificaciones', 1, '15', 1);
INSERT INTO `tipo_igv` VALUES (7, '[Gratuita] Gravado - Retiro por entrega a trabajad...', 1, '16', 1);
INSERT INTO `tipo_igv` VALUES (8, 'Exonerado - Operación Onerosa', 1, '20', 0);
INSERT INTO `tipo_igv` VALUES (9, 'Inafecto - Operación Onerosa', 1, '30', 0);
INSERT INTO `tipo_igv` VALUES (10, '[Gratuita] Inafecto - Retiro por Bonificación', 1, '31', 0);
INSERT INTO `tipo_igv` VALUES (11, '[Gratuita] Inafecto - Retiro', 1, '32', 0);
INSERT INTO `tipo_igv` VALUES (12, '[Gratuita] Inafecto - Retiro por Muestras Médicas', 1, '33', 0);
INSERT INTO `tipo_igv` VALUES (13, '[Gratuita] Inafecto - Retiro por Convenio Colectiv...', 1, '34', 0);
INSERT INTO `tipo_igv` VALUES (14, '[Gratuita] Inafecto - Retiro por premio', 1, '35', 0);
INSERT INTO `tipo_igv` VALUES (15, '[Gratuita] Inafecto - Retiro por publicidad', 1, '36', 0);
INSERT INTO `tipo_igv` VALUES (16, 'Exportación', 1, '40', 0);

-- ----------------------------
-- Table structure for tipo_movimiento
-- ----------------------------
DROP TABLE IF EXISTS `tipo_movimiento`;
CREATE TABLE `tipo_movimiento`  (
  `id_tipo_movimiento` int(11) NOT NULL,
  `tipo_movimiento_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipo_movimiento_estado` int(11) NULL DEFAULT 1,
  PRIMARY KEY (`id_tipo_movimiento`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tipo_movimiento
-- ----------------------------
INSERT INTO `tipo_movimiento` VALUES (1, 'Ingreso', 1);
INSERT INTO `tipo_movimiento` VALUES (2, 'Egreso', 1);

-- ----------------------------
-- Table structure for tipo_pago
-- ----------------------------
DROP TABLE IF EXISTS `tipo_pago`;
CREATE TABLE `tipo_pago`  (
  `tipo_pago_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_pago_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cu_tabla` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tipo_pago_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tipo_pago
-- ----------------------------
INSERT INTO `tipo_pago` VALUES (1, 'Pago al Contado', NULL);
INSERT INTO `tipo_pago` VALUES (2, 'Pago al Credito', NULL);

-- ----------------------------
-- Table structure for tipo_producto
-- ----------------------------
DROP TABLE IF EXISTS `tipo_producto`;
CREATE TABLE `tipo_producto`  (
  `tipoproducto_id` int(11) NOT NULL,
  `tipoproducto_descripcion` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipoproducto_estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tipoproducto_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tipo_producto
-- ----------------------------
INSERT INTO `tipo_producto` VALUES (1, 'Producto', '1');
INSERT INTO `tipo_producto` VALUES (2, 'Insumo', '1');
INSERT INTO `tipo_producto` VALUES (3, 'Plato', NULL);

-- ----------------------------
-- Table structure for tipomovimiento_empleado
-- ----------------------------
DROP TABLE IF EXISTS `tipomovimiento_empleado`;
CREATE TABLE `tipomovimiento_empleado`  (
  `tipomovimientoempleado_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipomovimientoempleado_descripcion` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tipomovimientoempleado_estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`tipomovimientoempleado_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for unidad_medida
-- ----------------------------
DROP TABLE IF EXISTS `unidad_medida`;
CREATE TABLE `unidad_medida`  (
  `id_unidad_medida` int(11) NOT NULL AUTO_INCREMENT,
  `unidad_medida_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `unidad_medida_estado` int(11) NULL DEFAULT 1,
  `descripcion_sunat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_unidad_medida`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of unidad_medida
-- ----------------------------
INSERT INTO `unidad_medida` VALUES (1, 'UNIDAD(Bienes)', 1, 'NIU');
INSERT INTO `unidad_medida` VALUES (2, 'UNIDAD(Servicio)', 1, 'ZZ');
INSERT INTO `unidad_medida` VALUES (3, 'BOBINAS', 1, '4A');
INSERT INTO `unidad_medida` VALUES (5, 'BALDE', 1, 'BJ');
INSERT INTO `unidad_medida` VALUES (6, 'BARRILLES', 1, 'BLL');
INSERT INTO `unidad_medida` VALUES (7, 'BOLSA', 1, 'BG');
INSERT INTO `unidad_medida` VALUES (8, 'BOTELLAS', 1, 'BO');
INSERT INTO `unidad_medida` VALUES (9, 'CAJA', 1, 'BX');
INSERT INTO `unidad_medida` VALUES (10, 'CARTONES', 1, 'CT');
INSERT INTO `unidad_medida` VALUES (11, 'CENTÍMETRO CUADRADO', 1, 'CMK');
INSERT INTO `unidad_medida` VALUES (12, 'CENTÍMETRO CUBICO', 1, 'CMQ');
INSERT INTO `unidad_medida` VALUES (13, 'CENTÍMETRO LINEAL ', 1, 'CMT');
INSERT INTO `unidad_medida` VALUES (14, 'CIENTO DE UNIDADES', 1, 'CEN');
INSERT INTO `unidad_medida` VALUES (15, 'CILINDRO', 1, 'CY');
INSERT INTO `unidad_medida` VALUES (16, 'CONOS ', 1, 'CJ');
INSERT INTO `unidad_medida` VALUES (17, 'DOCENA ', 1, 'DZN');
INSERT INTO `unidad_medida` VALUES (18, 'DOCENA POR 10**6', 1, 'DZP');
INSERT INTO `unidad_medida` VALUES (19, 'FARDO ', 1, 'BE');
INSERT INTO `unidad_medida` VALUES (20, 'GALON INGLES (4,545956L)', 1, 'GLI');
INSERT INTO `unidad_medida` VALUES (21, 'GRAMO', 1, 'GRM');
INSERT INTO `unidad_medida` VALUES (22, 'GRUESA', 1, 'GRO');
INSERT INTO `unidad_medida` VALUES (23, 'HECTOLITRO', 1, 'HLT');
INSERT INTO `unidad_medida` VALUES (24, 'HOJA', 1, 'LEF');
INSERT INTO `unidad_medida` VALUES (25, 'JUEGO', 1, 'SET');
INSERT INTO `unidad_medida` VALUES (26, 'KILOGRAMO ', 1, 'KGM');
INSERT INTO `unidad_medida` VALUES (27, 'KILOMETRO', 1, 'KTM');
INSERT INTO `unidad_medida` VALUES (28, 'KILOVATIO HORA', 1, 'KWH');
INSERT INTO `unidad_medida` VALUES (29, 'KIT', 1, 'KT');
INSERT INTO `unidad_medida` VALUES (30, 'LATAS', 1, 'CA');
INSERT INTO `unidad_medida` VALUES (31, 'LIBRAS', 1, 'LBR');
INSERT INTO `unidad_medida` VALUES (32, 'LITRO', 1, 'LTR');
INSERT INTO `unidad_medida` VALUES (33, 'MEGAWATT HORA', 1, 'MWH');
INSERT INTO `unidad_medida` VALUES (34, 'METRO', 1, 'MTR');
INSERT INTO `unidad_medida` VALUES (35, 'METRO CUADRADO', 1, 'MTK');
INSERT INTO `unidad_medida` VALUES (36, 'METRO CUBICO  ', 1, 'MTQ');
INSERT INTO `unidad_medida` VALUES (37, 'MILIGRAMOS', 1, 'MGM');
INSERT INTO `unidad_medida` VALUES (38, 'MILILITRO ', 1, 'MLT');
INSERT INTO `unidad_medida` VALUES (39, 'MILIMETRO', 1, 'MMT');
INSERT INTO `unidad_medida` VALUES (40, 'MILIMETRO CUADRADO  ', 1, 'MMK');
INSERT INTO `unidad_medida` VALUES (41, 'MILIMETRO CUBICO', 1, 'MMQ');
INSERT INTO `unidad_medida` VALUES (42, 'MILLARES', 1, 'MLL');
INSERT INTO `unidad_medida` VALUES (43, 'MILLON DE UNIDADES', 1, 'UM');
INSERT INTO `unidad_medida` VALUES (44, 'ONZAS', 1, 'ONZ');
INSERT INTO `unidad_medida` VALUES (45, 'PALETAS ', 1, 'PF');
INSERT INTO `unidad_medida` VALUES (46, 'PAQUETE ', 1, 'PK');
INSERT INTO `unidad_medida` VALUES (47, 'PAR', 1, 'PR');
INSERT INTO `unidad_medida` VALUES (48, 'PIES   ', 1, 'FOT');
INSERT INTO `unidad_medida` VALUES (49, 'PIES CUADRADOS  ', 1, 'FTK');
INSERT INTO `unidad_medida` VALUES (50, 'PIES CUBICOS ', 1, 'FTQ');
INSERT INTO `unidad_medida` VALUES (51, 'PIEZAS', 1, 'C62');
INSERT INTO `unidad_medida` VALUES (52, 'PLACAS    ', 1, 'PG');
INSERT INTO `unidad_medida` VALUES (53, 'PLIEGO', 1, 'ST');
INSERT INTO `unidad_medida` VALUES (54, 'PULGADAS', 1, 'INH');
INSERT INTO `unidad_medida` VALUES (55, 'RESMA', 1, 'RM');
INSERT INTO `unidad_medida` VALUES (56, 'TAMBOR', 1, 'DR');
INSERT INTO `unidad_medida` VALUES (57, 'TONELADA CORTA', 1, 'STN');
INSERT INTO `unidad_medida` VALUES (58, 'TONELADA LARGA ', 1, 'LTN');
INSERT INTO `unidad_medida` VALUES (59, 'TONELADAS ', 1, 'TNE     ');
INSERT INTO `unidad_medida` VALUES (60, 'TUBOS', 1, 'TU');
INSERT INTO `unidad_medida` VALUES (61, 'US GALON (3,7843 L)', 1, 'GLL');
INSERT INTO `unidad_medida` VALUES (62, 'YARDA', 1, 'YRD');
INSERT INTO `unidad_medida` VALUES (63, 'YARDA CUADRADA', 1, 'YDK');
INSERT INTO `unidad_medida` VALUES (64, 'PAQUETE AGUA', 1, '15');

-- ----------------------------
-- Table structure for usuario_eliminar
-- ----------------------------
DROP TABLE IF EXISTS `usuario_eliminar`;
CREATE TABLE `usuario_eliminar`  (
  `id_usuarioe` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_eli` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `clave_eli` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuarioe`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of usuario_eliminar
-- ----------------------------
INSERT INTO `usuario_eliminar` VALUES (1, 'admin', '123');

-- ----------------------------
-- Table structure for variable
-- ----------------------------
DROP TABLE IF EXISTS `variable`;
CREATE TABLE `variable`  (
  `variable_igv` decimal(10, 2) NULL DEFAULT NULL,
  `variable_uit` decimal(10, 2) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of variable
-- ----------------------------
INSERT INTO `variable` VALUES (0.18, 4200.00);

-- ----------------------------
-- Table structure for venta
-- ----------------------------
DROP TABLE IF EXISTS `venta`;
CREATE TABLE `venta`  (
  `venta_idventas` int(11) NOT NULL AUTO_INCREMENT,
  `venta_id_padre` int(11) NULL DEFAULT 0,
  `venta_idmoneda` int(11) NULL DEFAULT NULL,
  `ventas_idtipodocumento` int(11) NULL DEFAULT 0,
  `venta_tipopago` int(11) NULL DEFAULT NULL,
  `venta_formapago` int(11) NULL DEFAULT NULL,
  `venta_codigosilla` int(11) NULL DEFAULT NULL,
  `venta_tipoventa` int(11) NULL DEFAULT NULL,
  `venta_codigocliente` int(11) NULL DEFAULT 0,
  `venta_codigomozo` int(11) NULL DEFAULT NULL,
  `venta_fecha` datetime(0) NULL DEFAULT NULL,
  `venta_num_serie` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `venta_num_documento` int(11) NULL DEFAULT NULL,
  `venta_monto` decimal(11, 2) NULL DEFAULT NULL,
  `venta_observaciones` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `venta_estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  `venta_idsede` int(11) NULL DEFAULT NULL,
  `venta_fechapedido` int(25) NULL DEFAULT NULL,
  `venta_pedidofecha` datetime(0) NULL DEFAULT NULL,
  `ventas_vuelto` decimal(11, 2) NULL DEFAULT NULL,
  `venta_codigomesa` int(11) NULL DEFAULT NULL,
  `venta_credito_estado` int(11) NULL DEFAULT NULL,
  `venta_credito_cuotas` int(11) NULL DEFAULT NULL,
  `venta_credito_usuario` int(11) NULL DEFAULT NULL,
  `venta_fecha_pago` datetime(0) NULL DEFAULT NULL,
  `venta_monto_entregado` float(44, 2) NULL DEFAULT NULL,
  `venta_igv_estado` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `venta_igv_monto` float(44, 2) NULL DEFAULT NULL,
  `venta_monto_sinigv` float(44, 2) NULL DEFAULT NULL,
  `venta_idmovimiento` int(11) NULL DEFAULT NULL,
  `venta_estadococina` char(1) CHARACTER SET macce COLLATE macce_general_ci NULL DEFAULT '1',
  `venta_id_delivery` int(11) NULL DEFAULT 0,
  `venta_fecha_preparacion` datetime(0) NULL DEFAULT NULL,
  `venta_monto_delivery` decimal(12, 2) NULL DEFAULT 0.00,
  `venta_fecha_eliminacion` datetime(0) NULL DEFAULT NULL,
  `venta_id_cajero` int(11) NULL DEFAULT NULL,
  `venta_empleado_eliminacion` int(11) NULL DEFAULT NULL,
  `venta_eliminacion_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `venta_estado_pagado` int(11) NULL DEFAULT 0,
  `venta_empleado_deliverista` int(11) NULL DEFAULT NULL,
  `venta_estadocanje` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `venta_tidocelimi` int(11) NULL DEFAULT NULL,
  `venta_serie_eliminado` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `venta_correlativo_eliminado` int(11) NULL DEFAULT NULL,
  `venta_idpersonal_eliminado` int(11) NULL DEFAULT NULL,
  `venta_pdf_facturacion` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `venta_xml_facturacion` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `venta_cdr_facturacion` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `venta_ticket_facturacion` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `venta_comprobante_aceptado` int(11) NULL DEFAULT 0,
  `venta_estado_consumo` int(11) NOT NULL DEFAULT 0,
  `venta_estado_agrupacion` int(11) NOT NULL DEFAULT 0,
  `ventaid_tipo_venta` int(11) NULL DEFAULT NULL,
  `venta_nombre_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `venta_documento_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `venta_direccion_descripcion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `venta_ticket_external_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `venta_resumen_external_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `venta_resumen_ticket` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `venta_resumen_fecha` datetime(0) NULL DEFAULT NULL,
  `venta_resumen_xml` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `venta_resumen_cdr` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `venta_resumen_cdr_fecha` datetime(0) NULL DEFAULT NULL,
  `venta_qr` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `venta_hash` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `venta_number_to_letter` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`venta_idventas`) USING BTREE,
  INDEX `fk_venta_moneda`(`venta_idmoneda`) USING BTREE,
  INDEX `fk_venta_tipopago`(`venta_tipopago`) USING BTREE,
  INDEX `fk_venta_formapago`(`venta_formapago`) USING BTREE,
  INDEX `fk_venta_silla`(`venta_codigosilla`) USING BTREE,
  INDEX `fk_venta_mozo`(`venta_codigomozo`) USING BTREE,
  INDEX `fk_venta_cliente`(`venta_codigocliente`) USING BTREE,
  INDEX `fk_venta_tipdocumento`(`ventas_idtipodocumento`) USING BTREE,
  INDEX `venta_credito_usuario`(`venta_credito_usuario`) USING BTREE,
  INDEX `fk_venta_idmovimiento`(`venta_idmovimiento`) USING BTREE,
  INDEX `fk_cajero_empleado`(`venta_id_cajero`) USING BTREE,
  INDEX `venta_codigomesa`(`venta_codigomesa`) USING BTREE,
  INDEX `ventaid_tipo_venta`(`ventaid_tipo_venta`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3148 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of venta
-- ----------------------------
INSERT INTO `venta` VALUES (3102, 0, 1, 2, 1, 1, NULL, NULL, 1, 13, NULL, '001', 95, 10.00, NULL, '2', 1, 1610237194, '2021-01-09 19:06:34', NULL, 2, NULL, NULL, 13, '2021-01-09 19:09:47', 10.00, '0', 0.00, 10.00, 3170, '2', 0, '2021-01-09 19:09:17', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'jimmy jeiensto carbajal sanchez', '75270586', 'psje.humberto pinedo 130', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `venta` VALUES (3103, 0, 1, 2, 1, 1, NULL, NULL, 1, 14, NULL, 'B001', 1, 10.00, NULL, '2', 1, 1610241054, '2021-01-09 20:10:54', NULL, 2, NULL, NULL, 13, '2021-01-10 08:24:49', 10.00, '0', 0.00, 10.00, 3171, '2', 0, '2021-01-09 20:26:15', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/a8dc517e-4cc5-442b-a92f-145f1d2f4695', 'http://facturacion.selvafood.com/downloads/document/xml/a8dc517e-4cc5-442b-a92f-145f1d2f4695', '', NULL, 0, 0, 0, NULL, 'jimmy jeiensto carbajal sanchez', '75270586', 'psje.humberto pinedo 130', 'a8dc517e-4cc5-442b-a92f-145f1d2f4695', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEi0lEQVR4nO2d246kMAxEp1fz/7/c+4aQyBhfCrpLnPMIJGGmZCc4jvv1fr9/wJl/n34BmIKE9iChPUhoDxLag4T2IKE9SGgPEtqDhPYgoT1IaM9v8rnX6zUfbB9ST3a4NYmfXwbrtybyuzHy/1UMVmgPEtqTdaQbKscS97M1kTilfSfbuPELLB149W+/xwljhfYgoT1IaE95LtzTWOgHnSyfjz8qGvPZcdy47ZLJ7N4YLgYrtAcJ7Rk5UgmN+MvxkyOO++SjQkln+FWZm1ihPUhoz+cdaUy89kveXUZYYo/6nT5zCVZoDxLag4T2jOZCyTwRfxgsp67qRBX3vHyZ5ZVjk/w+xnVzKlZoDxLaU3akkj3YnzNXebwYR1gmG7ONcasR/EvBCu1BQnuyjvS6BZUkDtLYa4xfJriSH/cesEJ7kNAeJLRnlJBf3THYTxLViUqV/yKJodyQzE9C/oNAQnted8YyVCHjaqg67+6qbZc0msRtY7BCe5DQntHJpmqoukFjhSYZt+Gi49TIJKxInwgS2oOE9pSjM40F+nVHfpIfBnHP+SmzGo1a3l2+JyebHg0S2lPe8s37kOqRpWSGfH7cZNs81XhTTCMqtAQrtAcJ7dGsSDcmYW7VuMe2p09W2zbC+skXIMz9RJDQHiS0R1x3Js6OaSyjJzsGk0KYSRqRnfguOxVPBAntGUVnkhWykm0nkZ3Ti8m3ijuRnMaSRHb2YIX2IKE9o2zupFNq5LBUw76qQHay5+TFRlplA6zQHiS0BwntKSfkr3sZRO5j5Hk32nT9034yL5BvuwQrtAcJ7RmdbNqYuKzl81Xf23B3kwRGybj5nmOwQnuQ0J47qgJP6r98PESuCkZLctuXYIX2IKE9SGiP5vcLq/UL5DSiQsmIkqqyDDsV8CdIaI84IV+1BF92mCQ57iQqHd9dOvDJyYIYrNAeJLRnVF79uGzLZ5pIUgWTQ0xWlaq2yRmBbO4ngoT2IKE92S3fG+qZTTqUFK85bSsJQsnPW2GF9iChPZqfGolDxpPSAzGTfdTlJ0djTR8g/+RYghXag4T2XJg7M/FF8ZpTcpq+sbyUDBc/Rpj7iSChPUhoj6bujPzs0iS5Pc4yjceV/CHxLNsotRCDFdqDhPZoflF7UmllEu1tdJIsatCoOzOB6MyjQUJ77jjZJM+/S+bRfFXdmevACu1BQnuQ0B7NyabGk5KZIxnZUeXp3JOhUwUrtAcJ7RkVs6yydxfVGrrxW022bRs5LI3DpzHVGj17sEJ7kNCeC1ekG43Nv6q7i4+m5hNhkjuRMZOETXJnnggS2oOE9oh/s2lPNVohP38U95zMcMm/zKRKJbkzjwYJ7bljyzdJI4cluPJX20xvp0w+SCZRoSVYoT1IaM/HHGnVyzWOW07ayiMsk/z0GKzQHiS0BwntGc2Fk4yP6069xm0ls11+uOCuKssUK7QHCe3RnGyaII+hJEPGkzB3/FbJMI2qrhlWaA8S2qP5FVH4IFihPUhoDxLag4T2IKE9SGgPEtqDhPYgoT1IaA8S2oOE9iChPf8BBMjEcu4l/FcAAAAASUVORK5CYII=', 'PneIMMaaeJAAai+jgPthQ967PQw=', 'Diez  con 00/100 ');
INSERT INTO `venta` VALUES (3104, 0, 1, 2, 1, 1, NULL, NULL, 38, 14, NULL, 'B001', 2, 12.00, NULL, '2', 1, 1610241287, '2021-01-09 20:14:47', NULL, 3, NULL, NULL, 13, '2021-01-10 18:36:03', 12.00, '0', 0.00, 12.00, 3172, '2', 0, '2021-01-09 20:50:49', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'jimmy jeiensto carbajal sanchez', '75270586', 'psje.humberto pinedo 130', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `venta` VALUES (3105, 0, 1, 2, 1, 1, NULL, NULL, 38, 14, NULL, 'B001', 3, 11.00, NULL, '2', 1, 1610241321, '2021-01-09 20:15:21', NULL, 15, NULL, NULL, 13, '2021-01-10 19:46:34', 11.00, '0', 0.00, 11.00, 3173, '2', 0, '2021-01-09 20:26:14', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'jimmy jeiensto carbajal sanchez', '75270586', 'psje.humberto pinedo 130', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `venta` VALUES (3106, 0, 1, 2, 1, 1, NULL, NULL, 38, 14, NULL, 'B001', 4, 3.00, NULL, '2', 1, 1610242296, '2021-01-09 20:31:36', NULL, 4, NULL, NULL, 13, '2021-01-10 19:47:25', 3.00, '0', 0.00, 3.00, 3174, '2', 0, '2021-01-09 20:50:51', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'jimmy jeiensto carbajal sanchez', '75270586', 'psje.humberto pinedo 130', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `venta` VALUES (3107, 0, 1, 2, 1, 1, NULL, NULL, 38, 14, NULL, 'B001', 5, 9.00, NULL, '2', 1, 1610242320, '2021-01-09 20:32:00', NULL, 7, NULL, NULL, 13, '2021-01-10 20:03:19', 9.00, '0', 0.00, 9.00, 3175, '2', 0, '2021-01-09 20:50:53', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'jimmy jeiensto carbajal sanchez', '75270586', 'psje.humberto pinedo 130', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `venta` VALUES (3108, 0, 1, 2, 1, 1, NULL, NULL, 1, 14, NULL, 'B001', 6, 20.50, NULL, '2', 1, 1610242351, '2021-01-09 20:32:31', NULL, 5, NULL, NULL, 13, '2021-01-10 20:04:22', 20.50, '0', 0.00, 20.50, 3176, '2', 0, '2021-01-09 20:51:06', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Cliente Varios', '0000001', 'psje.humberto pinedo 130', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `venta` VALUES (3109, 0, 1, 2, 1, 1, NULL, NULL, 1, 14, NULL, 'B001', 7, 8.00, NULL, '2', 1, 1610242380, '2021-01-09 20:33:00', NULL, 14, NULL, NULL, 13, '2021-01-10 22:00:06', 8.00, '0', 0.00, 8.00, 3177, '2', 0, '2021-01-09 20:51:23', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Cliente Varios', '0000001', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `venta` VALUES (3110, 0, 1, 2, 1, 1, NULL, NULL, 1, 14, NULL, 'B001', 8, 11.00, NULL, '2', 1, 1610242401, '2021-01-09 20:33:21', NULL, 6, NULL, NULL, 13, '2021-01-10 22:16:08', 11.00, '0', 0.00, 11.00, 3178, '2', 0, '2021-01-09 20:51:08', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Cliente Varios', '0000001', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `venta` VALUES (3111, 0, 1, 2, 1, 1, NULL, NULL, 1, 13, NULL, 'B001', 9, 6.00, NULL, '2', 1, 1610338597, '2021-01-10 23:16:37', NULL, 2, NULL, NULL, 13, '2021-01-10 23:17:45', 6.00, '0', 0.00, 6.00, 3179, '2', 0, '2021-01-10 23:17:33', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Cliente Varios', '0000001', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `venta` VALUES (3112, 0, 1, 2, 1, 1, NULL, NULL, 1, 13, NULL, 'B001', 10, 18.00, NULL, '2', 1, 1610338628, '2021-01-10 23:17:08', NULL, 3, NULL, NULL, 13, '2021-01-10 23:17:57', 18.00, '0', 0.00, 18.00, 3180, '2', 0, '2021-01-10 23:17:34', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Cliente Varios', '0000001', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `venta` VALUES (3113, 0, 1, 2, 1, 1, NULL, NULL, 1, 1, NULL, 'B001', 11, 15.00, NULL, '2', 1, 1610338720, '2021-01-10 23:18:40', NULL, 2, NULL, NULL, 13, '2021-01-10 23:18:54', 15.00, '0', 0.00, 15.00, 3181, '2', 0, '2021-01-10 23:18:48', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Cliente Varios', '0000001', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `venta` VALUES (3114, 0, 1, 2, 1, 1, NULL, NULL, 1, 1, NULL, 'B001', 12, 21.00, NULL, '2', 1, 1610338970, '2021-01-10 23:22:50', NULL, 2, NULL, NULL, 13, '2021-01-10 23:22:58', 21.00, '0', 0.00, 21.00, 3182, '2', 0, '2021-01-10 23:22:54', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Cliente Varios', '0000001', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `venta` VALUES (3115, 0, 1, 2, 1, 1, NULL, NULL, 38, 13, NULL, 'B001', 13, 3.00, NULL, '2', 1, 1610341079, '2021-01-10 23:57:59', NULL, 2, NULL, NULL, 13, '2021-01-11 00:27:08', 3.00, '0', 0.00, 3.00, 3183, '2', 0, '2021-01-11 00:26:11', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'jimmy jeiensto carbajal sanchez', '75270586', 'psje.humberto pinedo 130', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `venta` VALUES (3116, 0, 1, 2, 1, 1, NULL, NULL, 1, 1, NULL, 'B001', 1, 12.00, NULL, '2', 1, 1610343003, '2021-01-11 00:30:03', NULL, 2, NULL, NULL, 13, '2021-01-11 00:30:18', 12.00, '0', 0.00, 12.00, 3184, '2', 0, '2021-01-11 00:30:06', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Cliente Varios', '0000001', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `venta` VALUES (3117, 0, 1, 2, 1, 1, NULL, NULL, 1, 1, NULL, 'B001', 2, 18.00, NULL, '2', 1, 1610343224, '2021-01-11 00:33:44', NULL, 2, NULL, NULL, 13, '2021-01-11 00:34:01', 18.00, '0', 0.00, 18.00, 3185, '2', 0, '2021-01-11 00:33:48', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/44334cd1-a863-40ad-adf3-4bb9be86a2b7', 'http://facturacion.selvafood.com/downloads/document/xml/44334cd1-a863-40ad-adf3-4bb9be86a2b7', '', NULL, 0, 0, 0, NULL, 'Cliente Varios', '0000001', '-', '44334cd1-a863-40ad-adf3-4bb9be86a2b7', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEcElEQVR4nO2d226kQAxEd1b5/1/OvowQWjoeXwpIiXNep29JyW6w3c3r+/v7Dzjz9+4FwBQktAcJ7UFCe5DQHiS0BwntQUJ7kNAeJLQHCe1BQnu+ku1er9d8sn1IPR5wa7k1y4fjjyMv5z1OEa8kniI/YJL834sV2oOE9mQd6UYjvzhxLMnp4ikmrnLfd2uZXNU1/yus0B4ktAcJ7SnvhXsae0zQbD9a/OhffXzPvxjEXeK+jS7JvjFYoT1IaM/IkUpYxl+SEZYlRzfbCKYkXeVvKOHECu1BQntuc6SxCzr+qoos/wbXpwUrtAcJ7UFCe0Z74WRfiXO5yb0t+UISEy8gThcPZ5GAFdqDhPaUHamkMOTjyHHtTDUI3ug7WfPy1/PACu1BQntet0crko+m+SdDSa5Rni88D6zQHiS0Bwntye6FSe+vqhCpls3np4uTyZNVxf8NSb3PEqzQHiS0Z1SQX3WbeccyOdkUL28SQ6nGfeJZVAF0rNAeJLTniuhM4xlskvNLOiV5dKbaF0cKb5DQHiS0p7wXNuo5G7GMZF/JySbVnpRE/hKFFdqDhPaIr0tYOqWkc1Ad5JQEo5dUz1tdkwTGCu1BQnvK+cLGhVYSJs+6+QFjJuWN8fKIzjwaJLQHCe0R3zvTeMievHLEq5KkXvO3u0nS1A2wQnuQ0B5NmDtGUjavqlIJmn3scnvfJVihPUhoz8iRXnkjYd7/TCrBJT5wEskiX/hEkNAeJLRnVEc6OW270ai6PI/Jblfdg6kjhTdIaE/5m017S9ceiswHlI9cXJCfJA76q26lwQrtQUJ7so5UnnvTXtE1IV84mXSG8aYjv9ULK7QHCe1BQns0p3wbsfmNxm43uUdNexjqvOsqyVQ8CCS0R5PyXf56bNYom49HXo42uQ0naLZs2ajomQT9l2CF9iChPZoLvCYB5aQ/kRcSSsjHm85bDFZoDxLag4T2lFO+DeS1M9XFqK6rDNovu5wXu9mDFdqDhPacmPI9Nmu8e0iuBotXOImSNI6IUpAP/4OE9px4RPSCU0LL0SZ9Y7R5Sqq54Q0S2oOE9oijM43Ua1yKWR3tY0v5NTeZuZYjU5APb5DQntEFXkfyrqPqmVVnppIHASRHUxvRmQZYoT1IaI/4rL3qeq/jFJMujVzjxdXchLkfDRLag4T2XPH9wvXEuXO8x/YfkeReJuet4lkmWfElWKE9SGhP+VMjE+Q+pNG3WtiiSjVzsgl+BAntEX/8bknycpaGU4qnOI7203Rxl+Qscd8kRGeeCBLag4T2iL/ZtGfyujJ5BK9WxzQucZgkseUFNVihPUhoj7h2Jk/1yFIjMzw55rn8Ne6bnDdZdJkHK7QHCe25zZFuJL2NvCpngvwQPUWIjwYJ7UFCe0Z74QUheUllTaOYf3LuqbFTUjvzaJDQnrIjlT9Px1c/Ss57LpHcVZwfOQkp3yeChPbcVs0NKrBCe5DQHiS0BwntQUJ7kNAeJLQHCe1BQnuQ0B4ktAcJ7UFCe/4BZJi4VPFf6YsAAAAASUVORK5CYII=', 'arSvFRykvHapKX+baqphE3hJAeU=', 'Dieciocho  con 00/100 ');
INSERT INTO `venta` VALUES (3118, 0, 1, 2, 1, 1, NULL, NULL, 1, 1, NULL, 'B001', 3, 12.00, NULL, '2', 1, 1610343444, '2021-01-11 00:37:24', NULL, 2, NULL, NULL, 13, '2021-01-11 00:37:31', 12.00, '0', 0.00, 12.00, 3186, '2', 0, '2021-01-11 00:37:27', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 'Cliente Varios', '0000001', '-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `venta` VALUES (3119, 0, 1, 2, 1, 1, NULL, NULL, 1, 1, NULL, 'B001', 4, 6.00, NULL, '2', 1, 1610343492, '2021-01-11 00:38:12', NULL, 2, NULL, NULL, 13, '2021-01-11 00:38:20', 6.00, '0', 0.00, 6.00, 3187, '2', 0, '2021-01-11 00:38:15', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/30645037-1d59-4ced-bde1-f994194dad61', 'http://facturacion.selvafood.com/downloads/document/xml/30645037-1d59-4ced-bde1-f994194dad61', '', NULL, 0, 0, 0, NULL, 'Cliente Varios', '0000001', '-', '30645037-1d59-4ced-bde1-f994194dad61', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEiElEQVR4nO2dwa7bMAwEm6L//8uvlyIwGoVZkesYC88cY1tmsiAtU6Ty+Pn5+QXJ/L7aAJiChPEgYTxIGA8SxoOE8SBhPEgYDxLGg4TxIGE8SBjPH/G8x+Mxv9kxpf46YCPhXlu1HHD3iyxtrk21/1Y1eGE8SBiPGkifuMLdZJ2yDsJiHKvD7PPoJCraHw1L8MJ4kDAeJIxn+1l4pDGnf73WMvWv73scbfdoPbLO5LeqwQvjQcJ4RoHUQh1RxQijv7e83s4VHq8q58QL40HCeK4PpE/qOVsdspbZGXFaq48smvpl8MJ4kDAeJIxn9CycTKNflwLEd4CPl3hZPikb6xjnmYoXxoOE8WwHUtd8ul5c3Q07y2vrILxr3rsPRavOAy+MBwnjeVzeay+GrEYie0m9XiiOfPmPdgQvjAcJ40HCeNRnobc4892HuwaIT8pJ3b7+2JtUA4m5qiV4YTxIGI+anWlEG+8UXI9Ou4WEeg5l8o0mJZk1eGE8SBjPdouoHjPrWdY3O5saM2FLZ9MRb8/UEbwwHiSMBwnj8Sz5NhqCvtDZ5DK1ODqpfa0vITtzI5Awnu3szDJ0TNI0X+hs+sJ+DR+Pil+T7RLuCBLG48nOvJ52xJIHafQfibfzzlHfjWzZsGwJXhgPEsaDhPGM6kgtG0Muj76e5qq72X3T0PesqZlUx9TghfEgYTwnbpfgTQrrvUuKJR+PNgK4JVSS5r4jSBiPp5pbXPPTg5IlFu2a10DvxpqUltfghfEgYTxIGM/2s9C1UjF5Yp3XjXXen4nsLuryUnEjkDCe7TT3eX+9YZ9t2yt6LI0Ay6OiVUvwwniQMB5zmtu1BtYoqGnfYjmgmMj+Tm17DV4YDxLGg4TxeLIzkzxIA8t2M0urnlj2nWlsscmz8I4gYTyelwoxFk1aJusPXe1C4juM5d2J7RLgH0gYjzk7I8a9dx+KiOWNz9P0CpfiFrpVlhS5Dl4YDxLGg4TxjOpId2sjJ0X1Dex1N5YusMkr1hK8MB4kjMecnWmESktSuFH8aMmVN0rua6iduSNIGM92IJ10J+l7x4ixqLGKKe5Zc95GjfTaw/8gYTxIGM83OpueTF4M9FyGOPLuaMszG1Y1bKjBC+NBwng8nU2WPEh9bW2DvXfpqvvWIy/BC+NBwni2dwU+Mtlm63VA12piPXJ7kCOWxivXkiReGA8SxoOE8Yx2BR7d2JExsewO49p35ps5oyN4YTxIGM/opWKXY3CwZIXEuKcvJltqdhpWieYtwQvjQcJ4RrUzIo2+y92kTKNUULz2iGjMZDpNduaOIGE8SBjPqCDfkl+YdPpMGgHE9RMd1/YHu+CF8SBhPCf+Z1PNbrVII5chhuhGRY/dKtGAJXhhPEgYz2WBdEKdbp4U9BW3+Djg7s4ydDbBP5AwHiSMZ/QsPK/uxrJDm7ge23jlaJTYTLqiavDCeJAwnu1Ael4yd1LZt/xQTILr2Pe/fEJn061Bwnguq+YGF3hhPEgYDxLGg4TxIGE8SBgPEsaDhPEgYTxIGA8SxoOE8SBhPH8BKl+yRSu8L2UAAAAASUVORK5CYII=', 'jxef9vO/IptPz78Xw5iQQzQUqFI=', 'Seis  con 00/100 ');
INSERT INTO `venta` VALUES (3120, 0, 1, 2, 1, 1, NULL, NULL, 1, 1, NULL, 'B001', 5, 18.00, NULL, '2', 1, 1610370392, '2021-01-11 08:06:32', NULL, 2, NULL, NULL, 13, '2021-01-11 08:07:17', 18.00, '0', 0.00, 18.00, 3188, '2', 0, '2021-01-11 08:06:43', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/39ae4404-73a4-4b11-8552-80c1f6759cdf', 'http://facturacion.selvafood.com/downloads/document/xml/39ae4404-73a4-4b11-8552-80c1f6759cdf', '', NULL, 0, 0, 0, NULL, 'Cliente Varios', '0000001', '-', '39ae4404-73a4-4b11-8552-80c1f6759cdf', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEf0lEQVR4nO2d0Y7jMAhFp6v5/1/uvoyiSPVS4OJ07uacxyax3V6BHcDu4/l8foEzfz49AFBBQnuQ0B4ktAcJ7UFCe5DQHiS0BwntQUJ7kNAeJLTnO3nf4/HQO4tD6ucujjuT/eZbHmE5vOqYk128BSu0BwntyTrSg0Z+celYjg/jBpPeaXn1eHbZRTyA5dXjw+rg8zScMFZoDxLag4T2lOfCM7Hjrs4T8Zy0vDM5J029VCivDcpvFYMV2oOE9kiOVKHqWJaL+wZJlxXHX5Yj+VQ5J1ZoDxLa8zFHmlxVxh++hkvetlx1wstnf1UJPFZoDxLag4T2SHOhMiVUMw/5mTL5upLMVORn2Zh90ydWaA8S2lN2pL+hDuXVj40/u/yk+uz4b7UEK7QHCe3JOtLxBVXV3e3rt7GqbESU9oEV2oOE9iChPY+k426sj5Wi+upElSyx+Vd3yZaT3yj5qjOVA8EK7UFCezamfJNx5OUnszub4uHlW65+o2teObBCe5DQnvKKtJGiW1L1J+OFh42dTbNXlyNsLE2xQnuQ0B4ktGcm5ZucEs7PKpuSlPqXuAulXL8K0Rn4AQntyb5UdJoOoxXJWEayqD7/LZT6l5GNqI0geAxWaA8S2lN2pPnMnNLylWnC/GZVJSgT38aK9NYgoT1IaI80F44HKZa9BLctmY37xFen6n14qbg1SGjPTO1M1f+caRS3V3c2KZGd8XL98b0GWKE9SGjPTDW3sjQd9zYjK0Pl6nitdwxWaA8S2oOE9gynfMd3GCll8/HVRlRo39sCmYpbg4T2SAX5Vx4Mme9rJDozsgFhvN8lWKE9SGiPVM2trGaVSIcSB2kPb9lOfloZya0uwQrtQUJ7kNCe4TPY8jWZytU45Rvz+kijMja5Zyo5ABGs0B4ktOeKlwolzJ0sqNkX5s6PqlrRk285Biu0BwntGf4XUWWbZ8PDKE5JqddOdpEvq3ztgjD3jUBCe5DQnuxcOJIxiFueqnCJ779yd1IMBfnwAxLaUw5zx4dwKeHmPCPr8pFzZ6bC3IpTxQrtQUJ7hvfa7zulJc9sQq6Rp2y4Sqq5bw0S2oOE9mycC5ePVJ+NG0myryB/X/6ETMWNQEJ7hlO+y6txZKfRxZUxFAUlAZ4HK7QHCe2RHOnI7qRGX0kHHrejVHMrI1FKFJdghfYgoT1IaM/Gvxp50/FEXfrIQTZKdqWRi2j0G4MV2oOE9khFiFUam0Abz742cr5ajezkxxD3GzdSDfqfwQrtQUJ7ytGZxpKpEaqOu4t3RR2PKJXgSjB69jiet2CF9iChPUhoz8aU7wW1MMn61akjHuJ8QvUbNaqQlmCF9iChPTP/2aSg+NuGZ5s9S1I5vEZ85AArtAcJ7fm8I42DMg1XOXt2zNvuggHEjVCECD8goT1IaM9wHek4yq6oZHI17rfRSONnoY701iChPdKpwFfSKMiPQ9XKVaVmcPY0hy+s8D8ACe35WDU3TIEV2oOE9iChPUhoDxLag4T2IKE9SGgPEtqDhPYgoT1IaA8S2vMX2vz9J8JOv7UAAAAASUVORK5CYII=', 'hLpF0ilOkOD6xNwBrFiOc1iadWI=', 'Dieciocho  con 00/100 ');
INSERT INTO `venta` VALUES (3121, 0, 1, 2, 1, 1, NULL, NULL, 39, 13, NULL, 'B001', 6, 6.00, NULL, '2', 1, 1610371145, '2021-01-11 08:19:05', NULL, 2, NULL, NULL, 13, '2021-01-11 08:19:25', 6.00, '0', 0.00, 6.00, 3189, '2', 0, '2021-01-11 08:19:09', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/caefd12d-43b2-4809-a4ca-6dde4e8b258a', 'http://facturacion.selvafood.com/downloads/document/xml/caefd12d-43b2-4809-a4ca-6dde4e8b258a', '', NULL, 0, 0, 0, NULL, 'prueba', '10752705866', 'psje. humberto 130', 'caefd12d-43b2-4809-a4ca-6dde4e8b258a', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEbElEQVR4nO2d0W4jMQhFN6v9/1/uvlRVpIwohptERznnNTO21SuwBwO9fX19/REyf9+9ANmihHiUEI8S4lFCPEqIRwnxKCEeJcSjhHiUEI8S4vnXfO52u+0nuw+pPw44CLg3V1XPO3i3Xmr8b1WjFeJRQjxdR/pDyt1t7ilrJ5z1Y5vRnrc13KMV4lFCPEqI53gvvKd23M2T9+VjkR3oZ5D70TbfA9n9OzWyVohHCfGsHGmE2qNuPEztoiPT9V3089AK8Sghnvc70h/qM9vAZTWPtfXI8QNzHK0QjxLiUUI8q70wcuJvhmkGV6+b24b6dmUw8vM+ObRCPEqI59iRps7Tj85wE+m4fLd2wk0GDnw81wytEI8S4rm9vda+eeasj4j9X0/vCzeO9DVohXiUEI8S4unuhYPU98d3n3dAH6T6N7fP/ra3yQbazKsV4lFCPN3ozMA5NOMvpzHrwVJTSYibj4pNSmaNVohHCfGsSkQ3oZPHx/pEXHRzea8J62/QCvEoIR4lxJO5qTgNPaQYRHaylU2bG5LUEUErxKOEeDK5M4PD/SZu/jya7m7wHRL5wrlEK8SjhHiOozN9Z5jNNNmc7n4dsBh5EHxv/q1Se4RWiEcJ8SghntWVb/OVyC1HPJ9zcFNxWtm0uT/poxXiUUI8q+jMaT7IJsxdO6V7Tr1cKnFyk0jYnOISrRCPEuIJVzb13V2TF+d6ZwtIB38NT6SfiBLiUUI8x5VN8ej7oCAo0p130OqyXlXN6cnAj4oPQgnxHIe5+54t0ny9OUWq+DTSTGHwa/HYr2iFeJQQT6YTYtO79p3w6fktFQA6DWRvjqb3WCL60SghHiXEE/7/hQNHP9jtmmsYpM1vMlyy7SH6aIV4lBBPuCtwnbLXH6d2hs9rPfCuEoMNWiEeJcSzOpFme/8N3q3JltX3pxvcrW6cqlaIRwnxKCGeVQ+2+rFI2VF/uuLXVLZnZA9udqXpoxXiUUI8mRLR5ofBoChyc0CPt8ksnu+/crqAX9EK8SghnkxX4EHvv2zdU2re5q3ei11ljVaIRwnxKCGeVWVT8dglm6T6+C4bSdffJPMPFnOJVohHCfEct0uIdOPqEynkTFVFbeqtmvPWI1+iFeJRQjyZ6Ezz3f6Z7TT3eXD3FkneGSSM179a2fSJKCEeJcQT7sF2MPFh/OXy3UtOvzQGe9LmlXgzNq0QjxLiCSch1tw7h0dHkeqZtenw0kyqPy28usS+M/KNEuIJ19pfMnAOkQSTF591T6cYpGReohXiUUI8Sohn1YMtm5xSf3LUUzwvM6XPu5JLtUI8Sohn5Ug3nLqOQYSlfiwy3Qta6vyKVohHCfG8zZE+MoihNLP8BmmGm06Il49t0gxrtEI8SohHCfFkOuRvaCaoNwe5XNWg5UH9biS71b4z8o0S4gl3Bd6QSgZsHu43IZtULv3jqgajaYV4lBDP27K5JYVWiEcJ8SghHiXEo4R4lBCPEuJRQjxKiEcJ8SghHiXEo4R4/gMGdZdv47AVLgAAAABJRU5ErkJggg==', 'DPToqwqbi/0MXvVFClb00G2CnTM=', 'Seis  con 00/100 ');
INSERT INTO `venta` VALUES (3122, 0, 1, 2, 1, 1, NULL, NULL, 38, 13, NULL, 'B001', 7, 3.00, NULL, '2', 1, 1610374373, '2021-01-11 09:12:53', NULL, 4, NULL, NULL, 13, '2021-01-11 09:12:53', 3.00, '0', 0.00, 3.00, 3190, '2', 0, '2021-01-11 09:38:53', 0.00, NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 8, 'Cliente Varios', '10752705866', 'psje. humberto 130', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `venta` VALUES (3123, 0, 1, 2, 1, 1, NULL, NULL, 1, 13, NULL, 'B001', 8, 3.00, NULL, '2', 1, 1610375548, '2021-01-11 09:32:28', NULL, 3, NULL, NULL, 13, '2021-01-11 09:32:28', 3.00, '0', 0.00, 3.00, 3191, '2', 0, '2021-01-11 09:38:48', 0.00, NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 8, 'Cliente Varios', '0000001', '- ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `venta` VALUES (3124, 0, 1, 2, 1, 1, NULL, NULL, 40, 13, NULL, 'B001', 13, 15.00, NULL, '2', 1, 1610375612, '2021-01-11 09:33:32', NULL, 2, NULL, NULL, 13, '2021-01-11 09:43:06', 15.00, '0', 0.00, 15.00, 3196, '2', 0, '2021-01-11 10:39:19', 0.00, NULL, 13, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/009fe4c6-815b-453e-a613-bbfdb7470cee', 'http://facturacion.selvafood.com/downloads/document/xml/009fe4c6-815b-453e-a613-bbfdb7470cee', '', NULL, 0, 0, 0, 8, 'martin jose', '75270588', 'jr. barrutia 129', '009fe4c6-815b-453e-a613-bbfdb7470cee', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEiUlEQVR4nO2d227cMAxEs0X//5fTl8JZQCqXl7Hdgc95tC3JyYCUTJHa1/f39xc48+vuF4ApSGgPEtqDhPYgoT1IaA8S2oOE9iChPUhoDxLag4T2/E4+93q95oO9h9SPDo+L70NsL1Z7Tt5t9BzvDcj/VzFYoT1IaE/WkR409he3jiV2lbEvWt9h64TjttUhGqj+VzFYoT1IaA8S2lOeC9+ZTCcXTEXbb4D4w2B9q3iWzc/B5/29WKE9SGjPyJFeQOwMD7aOKH8xeVcSdpGDFdqDhPbc70iTK8O4bX5lGI9Vjez8D7nwWKE9SGgPEtozmgsnM0Ec6Vgfy28IS+Igcc+NOfi8WRMrtAcJ7Sk7UlWEIl6Xx8v3at5NI/9l7e2r/rdfE83BCu1BQnuyjlS+oJKsZhvrxvhNkq7vgs3OPFihPUhoDxLa85pEK1bibYf8h0FylEaGarXnxkbKpEljDwQrtAcJ7ck60p8Goe/qvIHCGeZ9l6RmKj9fJJm0xQrtQUJ7NPuFDZd13JUs+RpLxKRHndzdPjlZMG/BCu1BQnuQ0J5RdOb2D5LGuOfVH1Uza1TbHVihPUhoj+a4hGT90bafRshjkgyYzNlZn/94Mdlk8oWzBSu0BwntObGyqbr2a/gQiQPf3g2ufLw7KWttgBXag4T2IKE95eiM6kCBapJno45X0rM8siOvEMYK7UFCezQHeEmqIxsn+8bOMF7xT15+21biKklCfCJIaM+oRHRy/m7s7qpOSb7pKAnxNPYLSUJ8IkhoDxLaM4rOVFfAjdhNsh/VjsF5BxxISgy2YIX2IKE94oT8ycmUMfl0lfhzJSYZ5p7k+wRjbR/7CFZoDxLaMyoRreah/KufgMYQkyyVqodUJT9SIvpokNAeJLRHc+6M5LQzVc1RdV3emJwamUTxBwlz4aNBQntOjM5MguDVxPhJAF1+5IE86B+DFdqDhPacmIQo8TbJceU1ROclTibv5sEK7UFCe5DQnvJOxb6XazNrVvLbp9VN3Xi4RsxoUqu1BSu0BwntyX5UTMotk20bTngtU9p2qIq/VDtUHQARgxXag4T2XPGL2pOkkvWx0pPB8/miJEnP611q7eEvSGgPEtpzRWWT/PiASf7/7dGZ5FvlwQrtQUJ7NAn527vrY41kfsl28V3VSfKet2CF9iChPSdmc0vqni5O6EvSCKBXe86DFdqDhPYgoT2a3JnOwIpDzpJDNCI7jdmuOrur4jVYoT1IaI8mdybJu3O4YNs2fodk20ZF1eQATs6deSJIaI/mx+9i8mdvraM0lm1rk/wQkhL7RuCJWvtHg4T2IKE9mirfLY1C2aDnfB5pNbCSn/ZURzZowQrtQUJ7rkjI3zI5auG8csvG98867uQxKpueCBLac5sjPUgm5b0TB6PlpUNt5KfhbMEK7UFCe5DQHs1hlhImHwaq83fXtqpd5WRFVQOs0B4ktGf0Q7AXIEkkTA7xkUlVVPUdiM48CCS057ZsblCBFdqDhPYgoT1IaA8S2oOE9iChPUhoDxLag4T2IKE9SGgPEtrzBypy0ycyIi/EAAAAAElFTkSuQmCC', 'xuIwrjI5ey2GKNDU5mWQAxqSvyg=', 'Quince  con 00/100 ');
INSERT INTO `venta` VALUES (3125, 0, 1, 2, 1, 1, NULL, NULL, 1, 13, NULL, 'B001', 9, 12.00, NULL, '2', 1, 1610375633, '2021-01-11 09:33:53', NULL, 3, NULL, NULL, 13, '2021-01-11 09:33:53', 12.00, '0', 0.00, 12.00, 3192, '2', 0, '2021-01-11 09:38:50', 0.00, NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 8, 'Cliente Varios', '0000001', '- ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `venta` VALUES (3126, 0, 1, 2, 1, 1, NULL, NULL, 1, 13, NULL, 'B001', 10, 6.00, NULL, '2', 1, 1610375782, '2021-01-11 09:36:22', NULL, 3, NULL, NULL, 13, '2021-01-11 09:36:22', 6.00, '0', 0.00, 6.00, 3193, '2', 0, '2021-01-11 09:38:51', 0.00, NULL, 13, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/6f8aab75-1df1-4679-ac0f-5aaf508ca2ca', 'http://facturacion.selvafood.com/downloads/document/xml/6f8aab75-1df1-4679-ac0f-5aaf508ca2ca', '', NULL, 0, 0, 0, 8, 'Cliente Varios', '0000001', '- ', '6f8aab75-1df1-4679-ac0f-5aaf508ca2ca', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEf0lEQVR4nO2dwY7bMAxEN0X//5fTQxeBASlcihwpO/B7R8eW1A5I2STFfTyfzy9w5s+nFwBdkNAeJLQHCe1BQnuQ0B4ktAcJ7UFCe5DQHiS0Bwnt+Zu87/F49Ce7htRfA74uXqeYXkyOPNIZOZ5OPvI42o9ghfYgoT1ZR/qikF+cOpbY7cS+aFxD7NCma55ejB9JDpL8dUrBCWOF9iChPUhoz/JeeGV1x1I92yH5MTPeX/j13Z0jnX8vVmgPEtrTcqQHmL7lj06pEPcJruRX9RvACu1BQns+70jjKEny2Y6r7Dz7G2rhsUJ7kNAeJLSntRd2doI40jHe1kmuxiMXSO7BqulisEJ7kNCeZUeqCkwk87FxdCaZN44jO/nlrSaEzwRxsEJ7kNCex2+IL/ynUP8iKVGcDiiprDkDVmgPEtqDhPaIC/LzW8jqJpfPJ0hCNtPlJTMehW07ufdPwQrtQUJ7so60ENhNxlDy040jy59N/lr4qOg44Ris0B4ktGf5jXRfuDn/Vrmaa0wO8m6pEjrbSgxWaA8S2oOE9mQzFQXHfTKcX8hyyEfunJkaITpzI5DQnla7hAOB3cIHSXwxXqekS0L+y2ockHYJdwQJ7dlYzb36DtZ56VUF0IP7r8TZxI7zL4AV2oOE9iChPSeiM9pvj3cXx1/jKSRbUWcPZi+Eb5DQHk0zy2Q8otDVcjrvaqo5nk6V+5W4SooQ7wgS2rOx74zEZUncXadHYf5tVpIvpAjxjiChPUhoTys6I2lqMKVT6t/Z+cZBVNWekgzJFKzQHiS050R7dUnLg8IxpSRnPnWSKV9qZ+4IEtqzMTpzINo7fc2LXda+99XXxcMnqrBCe5DQHiS0R7wXqk75rk5XeEE/sFXvO291BSu0BwntWW5m2UmBnqHTiGF8pJO2zRdOBlP8CFZoDxLas5wvVIVuVyuy48UUjnkml1cYJ/mfkD9sG4MV2oOE9iChPZo/NbKv5D5J57tlOm/nvFVyus7+fQUrtAcJ7Wn9qZF9cZDpgMECCo20CsdLJZWJyVVRhHgjkNCeVlfgF52g8PT+8c64SkXehCt52+E85RSs0B4ktAcJ7dnYg231kyP/kj1e7CQW3q0wWJUk3lSoQZ2CFdqDhPZoamditAGgr14sIzly8tnD556mYIX2IKE9mrP2yUfyzkHuIcc1SFKbqpP448h5sEJ7kNAeJLSnlfJtTSytQS30u1F1K4gHXF1VcrQrWKE9SGjPcsq3w7RtwWrdX3PeEXkxf6fFJn1n7ggS2qNprx7TiYx3vGvyRVR1wmh1VZ3q9StYoT1IaA8S2iM+5XtlNTFb6BncSb3GyNc8Qh0pfIOE9mxsZhnTCXOvNibouLvCqShJupgw941AQns+5khHCm+k02eT2cTyXLVnJZ0fp2CF9iChPUhoz8aTTR8fuXD2eLVd5b5582CF9iChPZoGXh3iaIXkiKjqeOm+8Donm24NEtrzsWpuUIEV2oOE9iChPUhoDxLag4T2IKE9SGgPEtqDhPYgoT1IaA8S2vMP8CDTIduFiskAAAAASUVORK5CYII=', 'huCvV0nXkMsbMO7iaPeJiONI8aE=', 'Seis  con 00/100 ');
INSERT INTO `venta` VALUES (3127, 0, 1, 2, 1, 1, NULL, NULL, 1, 13, NULL, 'B001', 11, 6.00, NULL, '2', 1, 1610375910, '2021-01-11 09:38:30', NULL, 3, NULL, NULL, 13, '2021-01-11 09:38:30', 6.00, '0', 0.00, 6.00, 3194, '2', 0, '2021-01-11 09:38:52', 0.00, NULL, 13, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/5555ebef-dc0a-44cb-a4c8-daa1d29eb17a', 'http://facturacion.selvafood.com/downloads/document/xml/5555ebef-dc0a-44cb-a4c8-daa1d29eb17a', '', NULL, 0, 0, 0, 8, 'Cliente Varios', '0000001', '- ', '5555ebef-dc0a-44cb-a4c8-daa1d29eb17a', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEb0lEQVR4nO2d23LbMAxE407//5fdF4+q1gyMy9LOjs55lMRLsgOQBEH6dr/fv8CZX5/uAExBQnuQ0B4ktAcJ7UFCe5DQHiS0BwntQUJ7kNAeJLTnd/K72+02bywOqZ+bOL5MtnuuOS5SrTlfiaTm59peghXag4T2ZB3pQWN/celYjodxhUnvlHSeyy+XHVh273hY7XyehhPGCu1BQnuQ0J7yWHgmPwJl3sZj0vLL5JikYrJsmPyvYrBCe5DQnpEjnVB1LPn4i2TGH8dflj35VDonVmgPEtrzMUeanFXGD5/DJd8VeWYSQP9RKfBYoT1IaA8S2jMaCydDQnXnIT9SJssmK4k3dfP/gX3DJ1ZoDxLaU3akksSQM408lGc/1shhScZf4kVFPnazD6zQHiS0J+tI5ROqqqvc125jVtmIKO0DK7QHCe1BQns2JuS/Ial+0gH5lm+ybJyh2hhHsUJ7kNAecUL+xLH8zJNNeXc3Cc1PwArtQUJ7blW7zk9Nq3MwVci4mjuTP9mkfXtmEjPCCu1BQnuQ0B7NoiIZuW8sGyYjRzwGL59I4j5JiM7AAyS0R3NEtJquoiqb7NV39QS1TTJrJjWzqLgiSGhPOTrzT+HihFB+3lx+CVfw2dcsKBN/xoz00iChPUhoT3YsbETfYyZbrzHVW9byvdLmv7CogAdIaI/muoTJDQWNVMHqdnHch8YB0kmERX7WACu0BwntEUdn5ImE+04JJf12/i+SHE1lRnpFkNAeJLRHE515/iz/pXwcjXsVl42XHPtWC+xUXBoktGfkSCebnFVUBwGqzakS8qvBdxYVFwIJ7dl4gddki1EbB4m7tyyS7PPEvavACu1BQnuQ0J6Nv18YT+6r53jzyfzV/NVlHxpnjyc7FROwQnuQ0J5ydKbBvm3bJZPIuOQSh0ngnjD3FUFCe0b3zmhznxsephFQnoSb94WqJ2WxQnuQ0B4ktGdj7syBKrElKDLZmFW1W113seULD5DQnlFC/t9aclPwM5J0m31J9Y2ySUjIh/9BQns00Znl2+fPJgcql0zmustKtNnck9z2PFihPUhoDxLas/GG/Jjk9H3SrvYA88u3yb0X+aCIFdqDhPa89d6ZM5L4iyTCEt8sk2dy78xkeMIK7UFCezSOVHIiPv+2GkOJXWUjohT05OVbyd0CZ7BCe5DQHiS0R7Pl22lYkZcuv93tDXsRjV7FYIX2IKE92UWFJLqdj4Mk0wzzrUjKShI2kyscwtwXAgnt2XjW/qBx7ilubhIin/RKEoSSl8UK7UFCe5DQHs0PwS6pDlTy6yobEZagiZdFqusuEvLhARLao9nynSDZAlWlRsqPLL2hXazQHiS05/OONDmrlGdzN+Z+1RsY8+3iSC8NEtqDhPaMxkJJ3k1jUTF5m6Rx9ngSYSGP9NIgoT0bf2qkyiQh/0w172bpwOW3wwSVDMEK7UFCez6WzQ0qsEJ7kNAeJLQHCe1BQnuQ0B4ktAcJ7UFCe5DQHiS0BwntQUJ7/gD7jhsYw4dtJgAAAABJRU5ErkJggg==', 'CIBkxfwBixdd9U+rLkQjGlN5CE0=', 'Seis  con 00/100 ');
INSERT INTO `venta` VALUES (3128, 0, 1, 2, 1, 1, NULL, NULL, 38, 13, NULL, 'B001', 12, 6.00, NULL, '2', 1, 1610376043, '2021-01-11 09:40:43', NULL, 3, NULL, NULL, 13, '2021-01-11 09:40:43', 6.00, '0', 0.00, 6.00, 3195, '2', 0, '2021-01-11 10:39:19', 0.00, NULL, 13, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/8fbbe0ac-7c44-4c7b-b86a-7f77b765cfba', 'http://facturacion.selvafood.com/downloads/document/xml/8fbbe0ac-7c44-4c7b-b86a-7f77b765cfba', '', NULL, 0, 0, 0, 8, 'jimmy jeiensto carbajal sanchez', '75270586', 'psje. humberto pinedo 130', '8fbbe0ac-7c44-4c7b-b86a-7f77b765cfba', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEdElEQVR4nO2dwW7cMAxEs0X//5fTy8IwaoEmObR3B37vWMeS04EoiRwpr9/f3x9w5s+nPwBUkNAeJLQHCe1BQnuQ0B4ktAcJ7UFCe5DQHiS0Bwnt+Zv8udfrpXe2TKlvLTcS7vFXxd0pbC3vW1v+o97FKYxCe5DQnmwg3ZgKd3G0OT5d9ht/zDJEH8Nd/jfaXkm+Oz41LGEU2oOE9iChPeW5cE9jTX98epxgThs5TkXLxf3yOxvTZ/DNeZT/qxhGoT1IaI8USBXibYMSdpQVfzUI50P0dTAK7UFCez4WSJNBKbn2S4bWBsvw/lUWeEahPUhoDxLaI82FypRQXfrnKxvHBhvblWXOSKlyXDd9MgrtQUJ7yoF0xBjS6C5e3MdVZSVnne833iZdB6PQHiS05/VViYYjcRExDpXJpzHjxslxGIX2IKE9SGjPhYZ8xWmiZFhGihvL1pLbhqRdf6oGwii0BwntyW4qlDNEjcCSJO9bTH5V3Jqyh4khkD4aJLTnDu9MconYiNWKG1Gp+SlnppR80xJGoT1IaA8S2pOdCxtGzWoJVFm+N2zzI+bSb3CoMgrtQUJ7Liz5VoPMVGCZ3Us0jpfGjOeqGIX2IKE9M2ftkyvDPLMnm5Y0Wh65boZ6IfwPEtqDhPZIm4rkTWnVw0TLdvJblOoCXcnsKPMZmwp4g4T2SCebGvaTYzsNR2G1XyW9nj8VNXJMoAGj0B4ktGc4O7N8uqEkNfJHNZPBcPmds7XGhte7AaPQHiS0BwntKRvyp66cDLpovLtsp+G7OYIhHy4HCe0ZPtk0HpSW78ZfdYMxvvG0+huR5n4QSGjP8MmmxnVXyWu29sxmihv9Bv9y2sv4rV6MQnuQ0B4ktEc62ZScG2aTOD9n82h1L6HUE5QC+NSkyCi0BwntKV/g1bgg4NjI6VMlKCUNjOMBrbqJWkKa+4kgoT0XXuAVvzsbhPPxp+roabx7c+GQUWgPEtqDhPaUKxUjF9BMNdjYDxzfnTphVP08DPnwBgntufUyS8UYny8mJ4nfTWZYpvrFkP9okNCe4Qu8phaQs05w5RIuxc3d6Jc09xNBQnuQ0J4L/xDsyGUK1R87fVcpzCq5m6RdlkrFE0FCe6TszIjDRTHkJ7v7Bmvksd/8YdsYRqE9SGhPOTvTqAgq7ph7XgkaUe6dUVpmRfogkNAeJLTnwj81ctLx6P0LSoYlbnnPSC1i+fNUKh4NEtpTPtmkMG7oU254aQTD6uGFfL6JTcWjQUJ7ht3cS5I5lHwyOrnmTH7VeDL6ngNNG4xCe5DQHiS0Z+aG/CWzzsmGIV+x3DfyPtV9F5UKeIOE9txxsimJkstQnk55WJSCMN6ZR4OE9nxRIN1TvR3mU+eP9u9WLUKYEOENEtqDhPbMGPIVRjwsy1eSd2c2uhg/96RsSBiF9iChPRceEU2iXKbQcKlsxBd4jdvmg0ZEGIX2IKE9H3NzwxSMQnuQ0B4ktAcJ7UFCe5DQHiS0BwntQUJ7kNAeJLQHCe1BQnv+AW1tBj9RL00AAAAAAElFTkSuQmCC', 'YoVfG879pFSAbXt0yxu2CfBXuxc=', 'Seis  con 00/100 ');
INSERT INTO `venta` VALUES (3129, 0, 1, 2, 1, 1, NULL, NULL, 1, 13, NULL, 'B001', 17, 3.00, NULL, '2', 1, 1610377209, '2021-01-11 10:00:09', NULL, 2, NULL, NULL, 13, '2021-01-11 10:37:35', 3.00, '0', 0.00, 3.00, 3200, '2', 0, '2021-01-11 10:39:20', 0.00, NULL, 13, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/9462920c-3066-44d4-a0d0-fd767dc6bbc3', 'http://facturacion.selvafood.com/downloads/document/xml/9462920c-3066-44d4-a0d0-fd767dc6bbc3', '', NULL, 0, 0, 0, 8, 'Cliente Varios', '0000001', '- ', '9462920c-3066-44d4-a0d0-fd767dc6bbc3', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEgUlEQVR4nO2d227jMAxEk2L//5fTN8OotCwv46QDn/MYW5KLASmJItXn6/V6gDNfn/4AmIKE9iChPUhoDxLag4T2IKE9SGgPEtqDhPYgoT1IaM+/5HvP53M+2DmkfnR4/HgeYvtjsudgiHyHyeEm35wc4lewQnuQ0J6sIz1onC9uHUvsdmJftH5Dw3flfW+1k+TTLY0/BCu0BwntQUJ7ynPhmeqMpWobs86y8VjbjYHk6f/eXJn8vVihPUhoz8iRvoFkhGXriCQbg/ir/gJYoT1IaM/nHWkcJUm2zYebq6tKefxFDlZoDxLag4T2jOZCSQzlIH+gkTzl2L5WPYvYEn9V3EQOVmgPEtpTdqSqwETs0FZPNcm7aeTOJMdNdnIpWKE9SGhP1pHKF1TyBeHBJP9Fkjvz5pANVmgPEtqDhPY8tevjRmJ8I4893jasQ+RJ9rxl8jGTcbFCe5DQnqwj3TfORUnitlsmlU0TF13t+cwkgD5pixXag4T2iHNn8qmC8XmhtrJJtaqcoHXvZ7BCe5DQHiS0R3PkK9khqKafalZOvm01hpLfYq1NiM7cCCS0R7OpiKMVDTdbzX/JJwCubRvurhF4quYK5cEK7UFCezSOtOEl4hqiSWVT8qn8BFTr/PNghfYgoT1IaM/Hcmfip5OrLqtVviquy46JwQrtQUJ7ygn5+fBB8pBTkjbfCKDLE2EkrpIw9x1BQnvKK9JGDOVAvl6Ne46RZCaq7gdYX8uDFdqDhPYgoT2jhPxNd+k7dGOSZ6qN4+KY67I9JyUGMVihPUhozygJUZJYV70IJt+2MUdUi0/lGyFyZ+4IEtpz4Yr04Lpa0cm6URIuaZTEystLsUJ7kNAeJLRH8z+b5Enm2u3KdnEvv+oyeO0xixnFYIX2IKE95U2FPKC89iZHteWoFp9y5AspkNAeTXQm6U9UgYnJxWFBb2euu3dmOwTRmVuDhPYgoT2jyqZkXWsjIV+SodpAUl28vvZQz99nsEJ7kNCeUXSmSsNnSo6LY/LxF0lmojxxEiu0BwntyZ4XSurlGx1uf7nuNHGl8TR2s5wXwk+Q0B4ktOfCKt9qCKNxmeXkVprtXzF5Go8lP+k9wArtQUJ7NPfOJFft70l9X1+Lq6Im24b8piI5NcTjbsEK7UFCe8rRmTOToPCkDij52iQYLVlsN56SO3NHkNAeJLRHXOVbGHhwfcAk36cxXJLJXTnV3s5ghfYgoT2jTUWVs3OYhIzjJuub14Wbr4v75MEK7UFCe8q19o0V7CSXpBElqbpKeWVTI6I0maewQnuQ0B4ktEdz78wWbap/4wxkvWIm/52SCyDykDtza5DQHs0/gm3QuAMr/jF4ml++JwsBJjdrEuaGnyChPR9zpAeSexJVdeuZsXptr7uwDCu0BwntQUJ7RnPh35x1Drb7FkntUvIsd1IzlQcrtAcJ7Rn9zyYtjRLR9f1tE9U3v+F6znWsX8EK7UFCez6WzQ0qsEJ7kNAeJLQHCe1BQnuQ0B4ktAcJ7UFCe5DQHiS0BwntQUJ7vgEtqME2LKLhSgAAAABJRU5ErkJggg==', 'suh3bZUZCz05qdEZXD5RuqKeMNw=', 'Tres  con 00/100 ');
INSERT INTO `venta` VALUES (3130, 0, 1, 2, 1, 1, NULL, NULL, 1, 13, NULL, 'B001', 14, 9.00, NULL, '2', 1, 1610377334, '2021-01-11 10:02:14', NULL, 1, NULL, NULL, 13, '2021-01-11 10:08:23', 9.00, '0', 0.00, 9.00, 3197, '2', 0, '2021-01-11 10:39:21', 0.00, NULL, 13, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/0ca05ecc-9756-4f0f-afed-af71ee45a3e2', 'http://facturacion.selvafood.com/downloads/document/xml/0ca05ecc-9756-4f0f-afed-af71ee45a3e2', '', NULL, 0, 0, 0, 8, 'Cliente Varios', '0000001', '- ', '0ca05ecc-9756-4f0f-afed-af71ee45a3e2', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEgElEQVR4nO2dwY7jMAxDt4v5/1+evSyKADFUWmISEH3vmCaxMYTkWKY9r9/f3z+QzN+nOwBTkDAeJIwHCeNBwniQMB4kjAcJ40HCeJAwHiSMBwnj+RHve71e88bqkvqxifedYrvHN1u6KjY36bPYxEeIwniQMB41kb5prC8uE8v7Yv1CMTstE5rYmeX9y+69L+52XqeRhInCeJAwHiSMZ3ssPFIn7t1xoh6TlnfWY5L4rM7k2cnfqoYojAcJ4xkl0gm7iUWvv9TThslk5vyIPpm5DqIwHiSM57FEKn5V1hfP5ZLlI3V5SOznx64+BVEYDxLGg4TxjMbCyZAwmRjUF8VJhfiSelFX/wtcN3wShfEgYTzbidTuTGn4UM55rOFhEesv9aSiMZmxQxTGg4TxqInU/kG1mypdTVi+KhsVpesgCuNBwniQMJ6XmLhvcJpM1gSuW3q1T1dqh2qj80RhPEgYz8iQL5aq6/xj2SV03c4mPd1NSvMTiMJ4kDAe9Yt0/fBlKcvblr536c5flz1sfJoShfEgYTxIGM+F3pndhVl9UjEZOc4vbFR2LCcjUJ2B/yBhPGZD/nWF3UlVqH5ho2Yk9mpSjWJS8UUgYTye9cJGUjr/2kB84cQq2Chz736o688uIQrjQcJ4kDCeC70zZ/QdRuLy6ZLGQsG5lcmZNRO/D5OKbwQJ49k25OsZ1fJxL36+u3w3ll8tcw8dojAeJIzH451pJLRGCWO3V8u2Jts8xV/tXu8aojAeJIwHCePZHgtdo12juQLdg7rrVrWvVNTtslLxjSBhPNtl7sZC5e5tyzuvM+Qv77Qb8ncPDmNS8UUgYTxmN/cyGYoZY5Lu9F+L+z9eFG2GdSv2U72IwniQMB4kjGdUnTkzcccs7xQnM/YxabKO0ZhEFR34CFEYDxLGMzIhPpU6drG7csQ3TxaEdYjCeJAwnlu9M5OvSnu5ebL/aNmriQN9t3tHiMJ4kDAeJIznjn81Ii4FNFwqyyvnpY/rDnFY9n95kk5x/xCiMB4kjEdNpOJRL/ojkzRiWT61FLInw4pujawhCuNBwng864VeM4v+iL384XVzN1zklLm/ESSMBwnj8exsWv5ac4NnZzL8WNZA7tneTBTGg4TxjAz53i9+1+ZTy8ZVS5l7su9JhyiMBwnjuXBnU31x0pblY7Lu3sSEOHlz429FFMaDhPEgYTwjH+moYceZjvZdvjesRTTarSEK40HCeDzeGRE9S0zM7ZOUJdZ9xA7oTezuETtCFMaDhPFsV2cmdpXGe/TDaM6PLK2CuzafRjHa4q/UIQrjQcJ4kDCex5Z8LXuIxDfbbfOWBZnJmTVHiMJ4kDAe83/UbjApVduXT+1bpW5olyiMBwnjeT6RThyFjdNhJp2pv3W9J9roEIXxIGE8SBiP2UfaYNf2+bHdiXfG0qtGhQUf6VeDhPHccYBX483i8V71r41DHCaHf4lYDs05QhTGg4TxPObmBhdEYTxIGA8SxoOE8SBhPEgYDxLGg4TxIGE8SBgPEsaDhPEgYTz/AD89GCoLLm8yAAAAAElFTkSuQmCC', 'lJhCTx+rKh74csl3Kv21VbbbmJ4=', 'Nueve  con 00/100 ');
INSERT INTO `venta` VALUES (3131, 0, 1, 2, 1, 1, NULL, NULL, 1, 13, NULL, 'B001', 15, 6.00, NULL, '2', 1, 1610378492, '2021-01-11 10:21:32', NULL, 1, NULL, NULL, 13, '2021-01-11 10:21:32', 6.00, '0', 0.00, 6.00, 3198, '2', 0, '2021-01-11 10:39:23', 0.00, NULL, 13, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/23cfc944-ecda-49df-a3a8-14a22dd23311', 'http://facturacion.selvafood.com/downloads/document/xml/23cfc944-ecda-49df-a3a8-14a22dd23311', '', NULL, 0, 0, 0, 8, 'Cliente Varios', '0000001', '- ', '23cfc944-ecda-49df-a3a8-14a22dd23311', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEd0lEQVR4nO2dwY7bMAxEN0X//5e3l8BIa4FLccZJB37vmNiSkAEpiSKVx/f39xck8+vTAwAVJIwHCeNBwniQMB4kjAcJ40HCeJAwHiSMBwnjQcJ4fjefezweemd1SP21i+PJZr+vLVuG2uxOGXOzix/BCuNBwni6jvRgcL64dCzHh3WDTe9Uf1u72eUAlsM7PtwdfJ+BE8YK40HCeJAwnu258JX+DNT5tp6Tlk/Wc9J56hJRtg3Kb1WDFcaDhPFIjlRh17H04y/1tkHZzJxfqb99D1hhPEgYz8ccaXNVWX9YrznrBaQSQP+vUuCxwniQMB4kjEeaC5UpQdkYNAdQnzbUjSxn2eb8veS66RMrjAcJ49l2pPbMlEEeytmPDaIkzXfrTUU/dnMdWGE8SBhP15HaF1S7rtLVhWVVOYgoXQdWGA8SxoOE8VyYkH9dUv0gKLPbiLJtGMzBytyPFcaDhPGYw9yvrqPpHJoB5f5ImrkzTfruzhKaH4AVxoOE8Tx27brviHZzrpfv2vtVKpu83/bHXIMVxoOE8SBhPNvRmb6PttTxWmaOerviOi7ehegMPEHCeLY3FX+9vLlA//HJ4l1X/GW3OqnvZncDSa6DaKwwHiSMx1zZpFQYuSqblMiOt7y07oIVKTxBwniQMB5zdGZwn9l1x6eWEwPX0r9oRGwZK4wHCeN5R0K+pf7olWaFkeKi628VZ2i/cwErjAcJ4/EkITYL513xiN1CzpraCSupkYNc7wFYYTxIGA8SxuM5qWgu7vvzipKQv8vgMNmyW+CkAp4gYTzd3BmLu1uiDKBuUNnM2BPyLYUAS7DCeJAwHs9/Nl0Xz1Uc+CBncDdErrh3F1hhPEgYDxLG847LLJX6o+Un9ZGv986aQbp+cwCuSRErjAcJ49nOnXG5DiV3pnazNfY1/blly2/VByuMBwnj2Q5z91eGSkX8GXvx6bKRZoh82dduemM9GMLcNwIJ40HCeN6RR+pKbDmo5+DzY/0uvNny1/0sr2CF8SBhPG+9zLL5/JfbodXYA9k1lIjCvyBhPGZHqpwIKt0NUmwGBaS7uYeDy78Ic98RJIwHCeO58K9GrluCn7tTElmVeqvBUXPz/gU2FTcCCePxbCqU8p8llt2C3RkefKruaQlWGA8SxmO+FfgVb9rywO0o1UmDbO5OXz+2PPitsMJ4kDAeJIxH+qsRqWNHXon9moY3nEUsn+ek4tYgYTzb16srKEv/2sMoafN9Z6gUL9SNEOa+NUgYj+femRol3KyEyJfPN/ttBqObA+jDivSOIGE8SBiPdFLhveGlz3k+G5T71hGWwXnC7r6LhHx4goTxXHjk22TpOpTiU0tS/QDl2FbpFyuMBwnj+bwjHawMDwZxH29G9vIGxsFSHEd6a5AwHiSMx1zZZG/NcsqhXIhgH9US8khvDRLG847r1QcNnl1QP//l/Iolkr780NWyAlYYDxLG87FsbnCBFcaDhPEgYTxIGA8SxoOE8SBhPEgYDxLGg4TxIGE8SBgPEsbzB0T7MBIW4ZvFAAAAAElFTkSuQmCC', 'C6nNyBKrfMT+Kwj9x1y4XKyq0Do=', 'Seis  con 00/100 ');
INSERT INTO `venta` VALUES (3132, 0, 1, 2, 1, 1, NULL, NULL, 38, 13, NULL, 'B001', 16, 8.00, NULL, '2', 1, 1610379207, '2021-01-11 10:33:27', NULL, 1, NULL, NULL, 13, '2021-01-11 10:33:27', 8.00, '0', 0.00, 8.00, 3199, '2', 0, '2021-01-11 10:39:21', 0.00, NULL, 13, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/b9de36ed-3d0d-4b0d-8269-7000fc9c5e98', 'http://facturacion.selvafood.com/downloads/document/xml/b9de36ed-3d0d-4b0d-8269-7000fc9c5e98', '', NULL, 0, 0, 0, 8, 'jimmy jeiensto carbajal sanchez', '75270586', 'psje. humberto pinedo 130', 'b9de36ed-3d0d-4b0d-8269-7000fc9c5e98', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEfUlEQVR4nO2d2Y6kMAxFi1H//y/XvIwQGtzGW6i64pzHgiz0lZ3EcdLb+/1+gTJ/Pt0B6IKE8iChPEgoDxLKg4TyIKE8SCgPEsqDhPIgoTxIKM9P8L1t2/qNHUPqwQr3Iv77ZrDeLHKu0C9b2AYY/1v5YIXyIKE8UUe6M+VY/Hr2Ih2n5DthvwNm2ey33+OEsUJ5kFAeJJQnPRYeKUz0nUrM9zvjmd+cT3CobhYJlvXBCuVBQnlajnSEQvzlvOQwn+4/FmI3Jp2QzTqwQnmQUJ7PO1KfYKjaf9qZuH6VzzTBCuVBQnmQUJ7WWDgyTgQXBsdhb2SgCq40/J2K+D7GujEVK5QHCeVJO9KRxJDXlav0FwZZdzfebjaCvxSsUB4klCfqSNdNqNZNL89NpN787ZfLdm8O6GCF8iChPEgoz9aZH4/sGASfFsh277c+OL1al8xPQv6DQEJ5oo7ULuxGOnaC3qYTYTGfmmTjPp0m4kX8sj5YoTxIKM9MmLvg2W44qnnDbmI8NTIIM9IngoTyIKE86UVFJ5dk3emkwsKg06uR8btzfvgIVigPEsqTvnemE8vo5L8UQtXmnQvrolGdyxSyzv8IVigPEsrT2i8MUkj3O7c74gDNeuKflk1R7AT942CF8iChPEgozx1bvj7rojMjU/9gB8zOjGflmGCF8iChPK0w9874RVqdy4BHetLJ9yksOTpXPGCF8iChPK0w9/npEd85ZPfw7tl7i/Qk/mbnRFUcrFAeJJQHCeVpRWeM6iYOQJlP480Fa/abCG5TX9bj1Fwoa4IVyoOE8swkIXaO7RS862zNcVfZYeSLTLBCeZBQnpmz9pWGk/5kKot8XfZ6kE6euAlWKA8SyoOE8rT+f2E2d6azUxHn3KtC/MUvu1NYzPh9LoAVyoOE8swkIZpkp+D3OKXsnD5eGwn5UAQJ5UnnzhzJnk4y6ewmdmJG3xlAJzrzRJBQHiSU59tzZ0xGTuoGy3aWDZ3vZSx8EEgoz8yiwvnldTXJHklXKSxmChWea+6EWqZydrBCeZBQnuGz9vGn5ddM4l+RvUXRfDO411holzD3E0FCeZBQnoX/UbtzGU12TJrKI832uZNHynUJ8A8klGfmX43ccMyz8LQw9fdrXnd3DNGZR4OE8nz7EdHLPmSb82sbObvkw34h/A8SyoOE8rRONvk/+nRST/12g3ehFZoYSfUvlPXBCuVBQnlauTNZzCOi67xTochImuFIdIZFxYNAQnlmZqQ+I9NLf2Y4Eg1/hf2nz7rguwlWKA8SyoOE8rRyZ2YvJii0NXLCyKSwmOkM+eTOPBoklKflSGcxJ/eF5PYshRNGBTc7cpmCCVYoDxLK8zFH2jleen4ar9nfTfQ743cg6/zN5goeFSuUBwnlQUJ5Fp5s8gkmtxc2B7IXUga7Z/4Y3z9Zl6GKFcqDhPLMnGzq0DmM6Tthk86VB35ngq911h4mWKE8SCjP8E2IcD9YoTxIKA8SyoOE8iChPEgoDxLKg4TyIKE8SCgPEsqDhPIgoTx/AZOd1jO+m7+YAAAAAElFTkSuQmCC', 'T/i6V603mtQtUMjl7sn4UwoJT9M=', 'Ocho  con 00/100 ');
INSERT INTO `venta` VALUES (3133, 0, 1, 2, 1, 1, NULL, NULL, 1, 14, NULL, 'B001', 18, 11.00, NULL, '2', 1, 1610379932, '2021-01-11 10:45:32', NULL, 2, NULL, NULL, 13, '2021-01-11 10:48:28', 11.00, '0', 0.00, 11.00, 3201, '2', 0, '2021-01-11 10:48:03', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/b6a70a69-5a34-4ec3-9137-7ab5550ec479', 'http://facturacion.selvafood.com/downloads/document/xml/b6a70a69-5a34-4ec3-9137-7ab5550ec479', '', NULL, 0, 0, 0, NULL, 'Cliente Varios', '0000001', '-', 'b6a70a69-5a34-4ec3-9137-7ab5550ec479', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEZUlEQVR4nO2d267iMAxFh9H5/19mXlCFqMdnx3YKW6z1SJsLbNlNHTvc7vf7H3Dm77snAF2Q0B4ktAcJ7UFCe5DQHiS0BwntQUJ7kNAeJLQHCe35Ee+73W79wcKQ+tFzIeAuzuq559UvErbNp7rvtwrBCu1BQntUR3ow5e5yb3O+Go5bmMzRJPeK4fTEtp3pFZwwVmgPEtqDhPYsPwufyR23+Jw4OskfP+G4507CJvnVa+j8VjlYoT1IaE/LkXbIXxs6bkd8W1j18/lYv3a4D6zQHiS0522OVFw3FgLZIp1g9EelwGOF9iChPUhoT+tZ2HkkXLC477xdhFfPgST9F9j3+MQK7UFCe5Yd6UhiSGG4PIdFn9VqiDykEF7fB1ZoDxLac/uoQMOZkRyWvMNONJwwNwyAhPYgoT3qs7CwPi6s+JO2+YZwIW1eRH/aia8r4muSDlZoDxLas/xSoXvF1U3dqW3b2SiJ7u5GvgiO9BtBQns+aEWqrzlzVgMrncqm/Oq+mqlnsEJ7kNAeJLRH3fIVIw7PzG6uFnoWIzuFCYRXLziIIQQrtAcJ7dn4UnFGX2TnTTqsuqxOmUBIwfnnYIX2IKE9M5VNhTXnag6LOAFxrFrPI2Fu9gvhFSS0BwntuaKyST9QJrntXZVNhcnk8FIBryChPcOHWer1R6uh6nCUkZhROO5sFF6/WgArtAcJ7bniJMTxE3ZXXXQ45457P9//69XzbVNVUVihPUhoDxLas3GnYvVq3nP+YWGnQmRfQj47FfAACe1pVTZ1aog6RaD5cB2nOpty3/lGhLm/CCS0p/Xnd4XASt7hatuRSHFnZdh5cEyBFdqDhPYgoT1XnMFWOM/soJOTGbIaKirsVHS+bzLW/8AK7UFCe1qOdPzImANxCV7YmE1uC+/Ut5rFWY1XcmGF9iChPcMHeI2f4TIybiH+cnEiYadnrNAeJLQHCe3Z+P+FszWxz3Sy5cUYSmd3ZaQyWQcrtAcJ7fmgMLfethPguCDCkkOJKLyChPbMONIRz6Y3yTtZ3fML7+ycpDPSVgcrtAcJ7UFCe1p/BCumj46kzU+lvq8GZQpJ9SHiuLxUfCNIaM9wiegz4sEEnZ7zJsdt+mGWHYc2W/ekgxXag4T2XJo70/GKnclMnR1DmBu2gIT2IKE9V2z5xgM3DrM83xb2HN62+mDWE/I78SZ2Kr4aJLSndVzCKoVTFXKPOl5aVZjh6qwIc8MrSGjP8PHqISOHYeVzyFezhbXuvohSYbgcrNAeJLQHCe254oT8vG2hTEmMdIgdFhLyQ1bfu9ipgAdIaM/GElGR3I+JsQx92/bsqaZcdGdDmNyZrwYJ7Xm/Iy3s240MEY61GubOXXQ+HEmI8AAJ7UFCe674R+2ckcTUwobw+NJ/NplfByu0BwntaZWIjjBSu1RIMyzUW3VcZdJJE6zQHiS0523Z3DAFVmgPEtqDhPYgoT1IaA8S2oOE9iChPUhoDxLag4T2IKE9SGjPP7rQ9yEXz+fHAAAAAElFTkSuQmCC', 'JkmopkO1mptdzMqvPu1Rj4gF0rc=', 'Once  con 00/100 ');
INSERT INTO `venta` VALUES (3134, 0, 1, 2, 1, 1, NULL, NULL, 1, 13, NULL, 'B001', 19, 20.00, NULL, '2', 1, 1610380168, '2021-01-11 10:49:28', NULL, 2, NULL, NULL, 13, '2021-01-11 10:52:27', 20.00, '0', 0.00, 20.00, 3202, '2', 0, '2021-01-11 10:49:35', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/6d924a72-b69a-4105-94a9-21f2b2d84952', 'http://facturacion.selvafood.com/downloads/document/xml/6d924a72-b69a-4105-94a9-21f2b2d84952', '', NULL, 0, 0, 0, NULL, 'Cliente Varios', '0000001', '-', '6d924a72-b69a-4105-94a9-21f2b2d84952', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEbklEQVR4nO2d227kIBBEM6v8/y/Pvlgja2E7TXdhp+RzHjMGI5dooC/k9X6/v8CZP3cPALogoT1IaA8S2oOE9iChPUhoDxLag4T2IKE9SGgPEtrznXzu9Xr1XzZ1qX96Ljjcp6Ma++kM/txbcqj7vtUUZqE9SGhP1pB+UJm72NqMv07fm7TMBQMem+ikRVV9qxhmoT1IaA8S2rO8Fp6JDXdynfh0kjwhfM2WonPb1RXrGjrfKoZZaA8S2tMypB3iY0PH7Ixtp2Z21c7/+K67zDWz0B4ktOc2Qxo7o5N2bNpbvF+92Ad9AcxCe5DQHiS0p7UWdpaEVWd/YXM/fUUyBhK3Lfh99i2fzEJ7kNCeZUMq2ZQXXpc/NiSJXeSSttd8K2ahPUhoz+tXORpGJDksBad5oWfc3FAECe1BQnuya6Fq115um/ewaFNm8qtdJ6OnM2ZmoT1IaI/YkHZS0OWVTfLobjKH/+KPwCy0BwntWTak1/hBklG9Dvsqmy6omTrDLLQHCe1BQns0lU3JLPdCgPT2yqZ829UzDN4ZOEBCezSHin1JInJPx6rJ6pQJTJEbf2ahPUhoT8vNnaxOSnaiqmwa2VczNX3Lalgx33YKs9AeJLQHCe3RhHwLJ414TZIktydH1Yk2dNYzDhVwgIT2tBLyV/flhfT1QnbMamB22raDJCCMIX0QSGhP63r1ZIZyMjtm2vP0L8kS0diAx7fSFHxGEm9UAWahPUhoDxLas/FW4A/y1JV4pYyfX92170vIJ1IBB0hoj9jN3XHdyj3phbZav0+hxADvzBNBQns0/7OpcM1WModFkqWSf0Un5hejLVw9wyy0BwntQUJ7rrjMsnN3zJTOOjq+Ip/7Gkc5VkelWhSZhfYgoT2a69ULBm1sqzJKHUvVuRps3yEqhlloDxLa0yoRXc3yK7h9g+f/RzKjp+Oal1TxT8HN/USQ0B4ktEd8Q36hynfKasZmYVSFVafjURoh5AsHSGiP5h/BTm3IarZIzK9K5k8Gk+PhkZAPB0hojzhe2Nnd5TtM7nXjV0gu4Zp2mDSVZHPDARLag4T2aA4VnZpYyYGkk5VTqIpKtv1xqGM/eGeeCBLaszF35oJizOlfJFl+BYOmrXvKwyy0BwntWY4X5p2zq/mDBW9Fx6lRuDtGYqIl5bRnmIX2IKE9SGiPOHdm4cWK9PUpyVV2fD7/ayFs20n1j2EW2oOE9rQus1ylYCUKFjVplJLB5PyvyQHg5oZ/QUJ7NPfOxBTihatt87vB1ShmIXGy84nYkT4RJLQHCe3ZeCuwqmp37C25fI7XxBRep4rMxM9zqHg0SGiPJgmxQ6EaNBmYnf4a93zBtWJTyJ15NEhoz/2GdF82d2FHuurmPo+zk++DIX00SGgPEtqjSciXIE/Ij5HcO3Om42HpHEiYhfYgoT1XXK8up5OlL4nldiK0kqz+M8xCe5DQntuyuUEFs9AeJLQHCe1BQnuQ0B4ktAcJ7UFCe5DQHiS0BwntQUJ7kNCev218ADlqGLlMAAAAAElFTkSuQmCC', 'VpCJ0cEsfI0ghv9dvRaBGwlaDss=', 'Veinte  con 00/100 ');
INSERT INTO `venta` VALUES (3135, 0, 1, 2, 1, 1, NULL, NULL, 1, 14, NULL, 'B001', 20, 15.00, NULL, '2', 1, 1610381767, '2021-01-11 11:16:07', NULL, 7, NULL, NULL, 13, '2021-01-11 11:19:02', 15.00, '0', 0.00, 15.00, 3203, '2', 0, '2021-01-11 11:16:40', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/7a2e1695-0fdf-490a-b6d9-0b09972ec811', 'http://facturacion.selvafood.com/downloads/document/xml/7a2e1695-0fdf-490a-b6d9-0b09972ec811', '', NULL, 0, 0, 0, NULL, 'Cliente Varios', '0000001', '- ', '7a2e1695-0fdf-490a-b6d9-0b09972ec811', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEgElEQVR4nO2dwW7cMAxEu0X+/5fTS2EsaoVLcca7Hfi9Y2zLTAakZJJSHt/f378gmd+fNgBUkDAeJIwHCeNBwniQMB4kjAcJ40HCeJAwHiSMBwnj+Wre93g89Jc9p9TPAw4S7kurjnGOq/V7a5bP1qba/1Y1eGE8SBhPN5Ae2MPdgDoIN+PY0oBmqGzi+lvV4IXxIGE8SBjP9lz4TB24myvvek4acP6oeB7t/Lrrrv50Z2HzALwwHiSMRwqkFuqI2owwy4DW/GzoBzFL2sUOXhgPEsbz+UB6UIepeu3XXw0qq8o6gf4p8MJ4kDAeJIxHmguVmaA5r9Rl20FmR5nGzs8O5lE7eGE8SBjPdiB1ZSiUoFRbZemdsfTdvCebgxfGg4TxdAOpfUHVDHfLMFub9/E2wzenbPDCeJAwHiSM5zGoqRa4MixNA+oPksGafjdnVA8yeGSQPMIL40HCeKRAuuv+9rV4s9VfCbOD9Lolgd4HL4wHCeO5sJvbsgl0MHLzajMY7v6OL+9UFsxL8MJ4kDAeJIxnu1Lh2gdUj6xQD2jpI13+5Py6QRGb7MwdQcJ4utmZF6PsJ4WVDaTvxJVArwchzX1rkDAezwFeSqZjkCLfTaYrIw96tJsNjK45Ai+MBwnjQcJ4zL0zLna7TGsGfTfLZy0Fbfv3El4YDxLGY27IV1oFB0t/paPH3lZpCZVkZ+4IEsZz4RZRJSlsWbYp8XN3efny6m71tA9eGA8SxoOE8WxXKgbBevdgs59+2BzwoGmzcpjC4GpzZD4qbgQSxvOfbhFtFkgtVi3vtOR9BiVfAukdQcJ4pP/ZpMSxwTJ1bNVyrduMVMppOC8HLEbugxfGg4TxIGE8nlOBlYN4m0twZT7rG1PjLVPTOwN/QcJ4PFtEByXQ89X+I8ri3luItmThRfDCeJAwnndkZywr0p9sKK5eV+Nc3mY5DWcAXhgPEsaDhPF4emcGy+g6w+JdlyvnNfRH3p0+B88uwQvjQcJ4pOzMmX4jYZ3psGwRHbQ3Ks9asi30ztwRJIzHc+5MM9wNQqViXnPRq4TKQWsk9UL4FySMBwnjkSoVB8pM2XzdIJehNNUPrCpuW97p6gbCC+NBwnjM2Zn62RolKCk56/5hlsedgxNtdj+iyM7cCCSMx7NFdLBMVfbL7zYh2ntYlGmlOXIfvDAeJIwHCePx/KuRyYuFmXK3MbXfO2Np9V+izN81eGE8SBiPp+Tb5Dk4nAPF4FSsZURtZliWP6mfVaw6o5yk8wxeGA8SxuOpF9ZYNmP2jVFSxoNNWE2rdgfpgxfGg4TxIGE80rkz19Uidg1YflRYjrqsP1eWjyhQqbgjSBiPFEgVdsPO4MPAa8DLR5Q9U8VtL8EL40HCeD4WSA8G/dq7e6Zevu4iXG2GNXhhPEgYDxLG4zkV2I53ohrsITr33j+jHNNQWzUAL4wHCeO58B/BWriuwqxs0bJUhmtjyM7cCCSM52Pd3OACL4wHCeNBwniQMB4kjAcJ40HCeJAwHiSMBwnjQcJ4kDAeJIznD3Fau05LEMuWAAAAAElFTkSuQmCC', 'WW7WIYBM6aB1pEOUP3oGMO98PKs=', 'Quince  con 00/100 ');
INSERT INTO `venta` VALUES (3136, 0, 1, 2, 1, 1, NULL, NULL, 1, 14, NULL, 'B001', 21, 6.00, NULL, '2', 1, 1610381896, '2021-01-11 11:18:16', NULL, 2, NULL, NULL, 13, '2021-01-11 11:19:32', 12.00, '0', 0.00, 6.00, 3204, '2', 0, '2021-01-11 11:18:25', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/e863b92c-b035-4f90-bc7a-4e6d5d204e02', 'http://facturacion.selvafood.com/downloads/document/xml/e863b92c-b035-4f90-bc7a-4e6d5d204e02', '', NULL, 0, 0, 0, NULL, 'Cliente Varios', '0000001', '-', 'e863b92c-b035-4f90-bc7a-4e6d5d204e02', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEjklEQVR4nO2d23LbMAxE607//5fTt4xT0fASWMnd0TmPsXixdwCKAMg8vr6+fkEyvz89AZiChPEgYTxIGA8SxoOE8SBhPEgYDxLGg4TxIGE8SBjPH/G5x+MxH2wZUv/uuf607qd+7PnTOqxff81jh/qcd9HTD1hhPEgYj+pIv2nkF5eOZeKLjp/Ws2oMITapXbTrt6rBCuNBwniQMJ7ttfCZxnKy24nY86QTfamejGv5rZZghfEgYTwjRzqh9mP1Y/WmYtepNtpa4i8usMJ4kDCejznSOjojIgay9U+LeS7b/g+18FhhPEgYDxLGM1oLLSvBclHcXSknOQG97WQvcd6qiRXGg4TxbDtSe2Ci3hjUbnb5F7FtY1xxzsU8zwArjAcJ41Ed6XkvVN4wjd5ho6JnNzR/DVhhPEgYDxLGMyrInxSoi/kEcU26YKl+O6tlkyP1gtr4IlhhPEgYz6ggX/Rjk5J7+9GhiR+b+G0xXdwYAiuMBwnjOTFfKJ4/sjilRu3M5K2ygRheb4AVxoOE8SBhPA/v+aOJT59cauDae0wuYhA/XY61e275GawwHiSMZ+RIxdf3iRNu5G93v9E1u4vdlACO9EYgYTyj2plJqLruZPeoZiNP2agTtxQwLqdHdObWIGE8SBiP5zLLeim6YEOin8WdJJO9x6wmVzw8gxXGg4TxbG8qJueAntkNQ+gB5d2i+knt/XKGk6QuRYh3BAnjUcPcb3px1HrrcZBirLfTm1SCW6Izk99qCVYYDxLGg4TxbKd8G5GORqWJJW0rXrWwpDErS2ZbHOsZrDAeJIxndO+MWLJnOabUKKqflPqfd2fNsbdXHYpghfEgYTye6Iw62H51c8NleWu99Z4t4xLmviNIGA8SxnPi/2yycEGE5ZpX/2J6y+GIztwIJIzniusSLAcqXUFwS6m/uNURh3g1ighWGA8SxuMJcy/dzm4MpTEH8Z2znnOjbfGXV22PuOJiWGE8SBgPEsZjvndmiX0Ib2WNzm5CuDGrBlhhPEgYj/lWYD1aMam0F5tYKmv0M1P19Ly34TyDFcaDhPF4wtzn1Xofn19O4O2T4pzrIY49N8Lck+r1JVhhPEgYDxLGM7ouYdLkvDyGZYU+9vaqiTKBZc/1uDpYYTxIGI/niGhNIzFbPKbPylLhspzMBeeedLDCeJAwntHJpkYYQnn+7RDeOZ8XUdLh3plbg4TxIGE8l57y/THwaa/+dSfiZqbucNl2Nw/cOCG8BCuMBwnj8VyvLjJJrjbK/cRx9Sctp6KWvXHvzK1BwnhGRYgijXzhpKCmpu7ZEoMW1ws9m1iDFcaDhPEgYTwn3jtjifuItxW4KuTFStHlp5MtB2vhrUHCeEaOdELtsr6xpF71uI94IcLkNBYF+fAvSBjPxxzpJPdWu7vd80eTe2dqXO69BiuMBwnjQcJ4TrzMssZyB9sSe5GnyORoA5uKW4OE8Ywus7TQOLtkORU1yV038sa7uWs2FTcCCeP5WDU3uMAK40HCeJAwHiSMBwnjQcJ4kDAeJIwHCeNBwniQMB4kjAcJ4/kL1qTuOR3GmdMAAAAASUVORK5CYII=', '2gU8GUkI7h315VzPEZUURMsDyAk=', 'Seis  con 00/100 ');
INSERT INTO `venta` VALUES (3137, 0, 1, 2, 1, 1, NULL, NULL, 1, 14, NULL, 'B001', 22, 3.00, NULL, '2', 1, 1610382002, '2021-01-11 11:20:02', NULL, 2, NULL, NULL, 13, '2021-01-11 11:22:12', 3.00, '0', 0.00, 3.00, 3205, '2', 0, '2021-01-11 11:20:26', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/72537964-e233-49f3-ad83-267641991f72', 'http://facturacion.selvafood.com/downloads/document/xml/72537964-e233-49f3-ad83-267641991f72', '', NULL, 0, 0, 0, NULL, 'Cliente Varios', '0000001', '- ', '72537964-e233-49f3-ad83-267641991f72', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEcElEQVR4nO2d247bMAxEk6L//8vbl8IIGoGhOOP1Tn3Ooy1LQgakLqSU59fX1wOS+XV1B0AFCeNBwniQMB4kjAcJ40HCeJAwHiSMBwnjQcJ4kDCe381yz+dTb6zeUn9t4ijZbPe8muvm7DW/1/YRrDAeJIyn60gPBvHFpWM5HtYVNr3T8u3xbbOJj907Hu52vs/ACWOF8SBhPEgYz/ZY+ErtuHfHiXpMWpZsjkkfK2yiLBuU36oGK4wHCeORHKnCrmNZTu4HNF1Wvf+y7MlV6ZxYYTxIGM9ljrQ5q6wfvm+XLN9a+vmxq1eBFcaDhPEgYTzSWKgMCbuRh/5IWY9YzZqbo2z/Fzhv+MQK40HCeLYdqWWm/sogD+Xdjw3cXXP/pV5U9PduzgMrjAcJ43levtEwCKR5HZoyrb3813tghf8BSBgPEsZzYkK+klTvzTQZjFjKKDtY6iiDK1YYDxLGs72oUBzLx5Lvn9hPNu3Sd3eKM8SR3hokjEdypAeDrerdhD5lSlzXY9+d2Q1YPj7NV2uwwniQMB4kjEc65bub4eI6ENQcOZrfDpLqvXcuPFhU3BwkjMeckN93LE0nvHzbTGAchIvfmxtk1tT9VPJ9lmCF8SBhPFIS4nkxsPcmlg+VWeWS2r1brpshXgj/goTxIGE83UhF01kPRsomg5tlBnHgwUqjKNbs57JmFhU3Agnj+UGLCiVLRQk1D1YIg2VD8+0ArDAeJIyn60gVn3DeqdLlk+YOy/LJUdKeDVRXojhVrDAeJIwHCePZ3p15ZXdPYXAxpP1U1O63JOTD6SBhPJIjPVB2K5rYE/KVHJbBW8tBgCVYYTxIGI/n3pn+yVBvzcqZqYHL8oYJcaTwFySMBwnj+Y472JSAcPNbZTBW4gnKKOu6WwcrjAcJ4/HcCjyYHzd9YDN1ZXDCyI6S0fNerA9WGA8SxvMdF3gt2Z2t2e9w+VFb1cq3WGE8SBgPEsZjvnem/uS8sG0f5aqFJuetH5ZghfEgYTwnJiFa9kQsrnKwIFkWU0aEuhKOiN4aJIzHcytwzeAA++6krn9KqLkps6zNcnB10KsarDAeJIwHCePxRCos549cmSa7p3yXJZU4hpLRw6LijiBhPJ5bgQcpe00GvsiSKjiY3Fuc8ACsMB4kjMf8n031J/YcFnu88EDZM7LUzIz0RiBhPEgYz3ecbFo3fNodCt4Ra9mcEotYlidScWuQMJ7u7sw3JMIoKXuuw6c1lgsRmue8WFTcCCSMR8rmbtLc0FGyVMQeNpsYhEV3YUZ6R5AwHiSMRwr5XnXDZTOoW7+td1gGkYrddReRCvgLEsZj/kdtBXtw9b22x8pTuXJYlD6TO3NrkDCe6x2pcs/XoMKa3Vn0a68sdzsOwArjQcJ4kDAeaSz05t30FxW7exn2mi29qr/tgxXGg4TxeG4FVmh6G/uNNs3mXJvRdc0KWGE8SBjPZdnc4AIrjAcJ40HCeJAwHiSMBwnjQcJ4kDAeJIwHCeNBwniQMB4kjOcPmV0d+pN9cPUAAAAASUVORK5CYII=', 'FpLPkKHsDcrSgd7GVv/x3GWAZJk=', 'Tres  con 00/100 ');
INSERT INTO `venta` VALUES (3138, 0, 1, 2, 1, 1, NULL, NULL, 40, 14, NULL, 'B001', 24, 6.00, NULL, '2', 1, 1610382072, '2021-01-11 11:21:12', NULL, 3, NULL, NULL, 13, '2021-01-11 11:30:03', 6.00, '0', 0.00, 6.00, 3207, '2', 0, '2021-01-11 11:21:23', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/2ea08313-020b-4544-b8b4-a7e407a71e14', 'http://facturacion.selvafood.com/downloads/document/xml/2ea08313-020b-4544-b8b4-a7e407a71e14', '', NULL, 0, 0, 0, NULL, 'martin jose', '75270588', 'psje. humberto pinedo 120- tarapoto', '2ea08313-020b-4544-b8b4-a7e407a71e14', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEY0lEQVR4nO2dwW7jMAxE14v+/y9nL4ERwFpmJI6cDvLesbYltQNSEkmpx+Px+APJ/P30AKALEsaDhPEgYTxIGA8SxoOE8SBhPEgYDxLGg4TxIGE8P+J7x3H0OxuG1M+WFwLu9ajOBi2Df9uytzv9r4EVxoOE8aiO9MTl7mpvc3067Lf2zEMXLbZcj0p0/vapYQhWGA8SxoOE8UzPha+Ia/r66XWCedvIdSrSF/f103qS62wbOn+rGqwwHiSMp+VIO9SLe4vbWQgGXX84dNHi03vACuNBwng+5khFpySu/fbFQYbu/VeVwGOF8SBhPEgYT2su7EwJs8F+PbNx/eS1i9nYjd5yzb7pEyuMBwnjmXak9joUsbt6ca+PavZbvd96m7QPrDAeJIzn+FWBhiviurH+LToOzV44aQcrjAcJ40HCeDYW5HcqTa5zjJ4Qnm25ZmHbIFb0uHIgWGE8SBiPuqlYKGaZLRV0pW3FDYYlOlO3rIMj/WqQMJ5pR3qPl+icPxL73fcbiU9f6UwrWGE8SBgPEsajRmcW9h7nJ52pqLNd2YflZgSiM/AECeNpRWc6ZfP7VvxFawsN6t/O/hFcsSqsMB4kjOeOk00Lx9stLnrIvjD38BNlAHrLQ7DCeJAwHiSMx5PyHdKp9uwUt4v9dkZlmc/YVMATJIxnOsy9YP6Wk6RvByM2Mrvi12/y8jpwHawwHiSMx3MrsFgkUsdQ9JCHGGFZOMXvvQ1nodZ7AawwHiSMBwnjmT7l24kpLNzdu0An9VqPhIJ82AISxmOundE9TCf1Wo/K8oml5H5hE0WY+xtBwnhaJ5u8F1otrP2Kvt52V387ZMFvF43gSOEJEsaDhPF4TjbZT71aBjN8//q0k0/QK2PrljtghfEgYTzmW4FdSU67tym6eKXT3ew9O/qoarDCeJAwHk++cPi0w77Izuxr9Rg61UCuUWGF8SBhPEgYz8ZbgU86WWWxsmahFlQcjD4nXbcN9v3DEKwwHiSMZ+O/Gpldgg/fFOtQ/tdLMaobCvLr4XFEFJ4gYTwtR2qpm7af9OnEUMSnYlq0czRVByuMBwnjQcJ4WpmKWW4uX1+o2bnhiIF9UsQK40HCeFqXWYoxFDGoobsd0duIvsh1V47FCS+AFcaDhPF8rHbGUpRnceD68AhzwxaQMB4kjGdjyvdNx9by9YUq0/rpvlzEQr81WGE8SBjPHUWIJ5aLYFyj6py3qhGPiNaDYVPxRSBhPJ5bgWv0kpnZbzvsC0bfc6DpBCuMBwnjQcJ4WilfS5JBfL9TkL9QoboQM5rd4ZCpgCdIGM8d/wi2w8IdWJ0TVR06CWFqZ74aJIzn845UjH278pqdtV+dL+zcd4Mj/WqQMB4kjMdTkG9hoSB/iOVmuH2nooZ0NiRYYTxIGI/5VuAFOtXynfeH12ydb9rL5otGmmCF8SBhPB+r5gYXWGE8SBgPEsaDhPEgYTxIGA8SxoOE8SBhPEgYDxLGg4TxIGE8/wDhC/EkAyHyIgAAAABJRU5ErkJggg==', 'HdF0FMXRWbhNQzQPHN/IkKMSb6I=', 'Seis  con 00/100 ');
INSERT INTO `venta` VALUES (3139, 0, 1, 2, 1, 1, NULL, NULL, 43, 13, NULL, 'B001', 23, 9.00, NULL, '2', 1, 1610382306, '2021-01-11 11:25:06', NULL, 1, NULL, NULL, 13, '2021-01-11 11:25:06', 9.00, '0', 0.00, 9.00, 3206, '2', 0, '2021-01-11 12:07:19', 0.00, NULL, 13, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/2bbbd0a2-e3a3-4cf5-83fa-5d071c983d67', 'http://facturacion.selvafood.com/downloads/document/xml/2bbbd0a2-e3a3-4cf5-83fa-5d071c983d67', '', NULL, 0, 0, 0, 8, 'wiliam carbajal', '12345678', 'callle lima 156', '2bbbd0a2-e3a3-4cf5-83fa-5d071c983d67', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEaklEQVR4nO2dwW7jMAxEk8X+/y9nL0FgbASW4oyTDvzetZasdkBSJin1/ng8bpDMn28vAFSQMB4kjAcJ40HCeJAwHiSMBwnjQcJ4kDAeJIwHCeP523zufr/rL6tT6sdXNJ9s5uiXi1+OrX/N15B6AR/4Wx3BCuNBwni6jvTFoL64dCyKt3lfQ+2Ea3e3/GnTQw7eWzP4s2CF8SBhPEgYz3YsPNLcgtdYAsZxkvcg1/+oqKljcI3lb7UEK4wHCeORHKmCkuloOjTFf34g/+ICK4wHCeP5miP1ZjqWO9LxSlyr+gxYYTxIGA8SxiPFQkskqHMoNbsV2lu7QLF8zFtdcYEVxoOE8Ww70t+QmKgT2ec5w+IVNy0JroAVxoOE8dy/lV/YrerVrrJGSaAvcRUgLWCF8SBhPEgYTzcWNgOVK+oo3TGWzX1z5iWDnNHuK45ghfEgYTzbHxWDU0KDY0qKL1JoOuHdKPDjkPexnGy6EEgYj+dkUz+xMn6sfp09kW130bu76D5YYTxIGA8SxvOJkq/d+zdP+Q5yRs36ST1JPdZeiMYK40HCeDwN+YNshTLzbqW3vwBLInvgXZV8E1YYDxLGs32BV38n2dzdNXdoH8ho//iY0vz4DtkZeIKE8SBhPN1YqBQ5m2FMyfvUE7oW3zzlq0TZAVhhPEgYj/mjYnAx5G5leDlJPaQ/867PV1ojf1xME6wwHiSMR+rmrlE8ZP1e5WSTfTHFqpQ+I5oQLwQSxoOE8fyihvzlhOfF0cECLJXtZoAkFl4IJIzH/D+bBiXQgWPZ/cIZZJSU/ItS8qV35oogYTzmmxAH9bOl27HUGs87Sap0ZPcbiJpghfEgYTxIGM9278zyht3mkIGjbwbXOiYpXZqurf87SkrrCFYYDxLGI/XONGubyqEeZWZL3rn25IqbpSEfniBhPOZbgV3lPcse0l509PYZsSOFJ0gYDxLGI907s/s9cF60W77XfsNLvYBmVkgJzEuwwniQMB7P9erNIfYG9cGqdscOckZLdn8jPiouBBLGI90K7N1cnddmeGS3mti/DWc3GUSaG54gYTxIGI/nZNOSb516rfFG2Tqe2W/xXIIVxoOE8Xh6Z5pDlG206+4YS4fLoJPovNCAFcaDhPGc2Duz63aUFkXlvLy9+XEA985cGiSMBwnj8fyrkReDU77NefqTWLo9B8VkpQCuxFSsMB4kjMd870zNoOVk+Zj3iKhSLq4f494ZaIGE8Xj+o3bNoCJozwUXKJ2MS5p+25XZwQrjQcJ4kDAeKTtj6SNtXnkwiJTKN8zy+brKoXxykJ25NEgYjznN3Wc37etqX1eOCSwXszuEhnz4HySM52uOVElS7Paw9Dt6mmN317nEdXsjVhgPEsaDhPGYb8jv4z31c14xWVlV/brj83xUXBokjEe6wMvCeanq5thB74ySmq9nHqwKK4wHCeMxn2yCz4MVxoOE8SBhPEgYDxLGg4TxIGE8SBgPEsaDhPEgYTxIGA8SxvMP2AeXWoc6Ke4AAAAASUVORK5CYII=', 'B3V+e1QRGLnXF3KsJ0WOcGk7qJs=', 'Nueve  con 00/100 ');
INSERT INTO `venta` VALUES (3140, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, 6.00, NULL, '0', 1, 1610382735, '2021-01-11 11:32:15', NULL, 2, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '1', 0, NULL, 0.00, '2021-01-11 11:34:40', NULL, 13, 'devolucion de pedido', 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `venta` VALUES (3141, 0, 1, 2, 1, 1, NULL, NULL, 38, 13, NULL, 'B001', 25, 12.00, NULL, '2', 1, 1610383110, '2021-01-11 11:38:30', NULL, 1, NULL, NULL, 13, '2021-01-11 11:38:30', 12.00, '0', 0.00, 12.00, 3208, '2', 0, '2021-01-11 12:07:20', 0.00, NULL, 13, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/3629c2ec-7d2e-4b95-a6f9-837833bf1eee', 'http://facturacion.selvafood.com/downloads/document/xml/3629c2ec-7d2e-4b95-a6f9-837833bf1eee', '', NULL, 0, 0, 0, 8, 'jimmy jeiensto carbajal sanchez', '75270586', 'psje. humberto pinedo 130', '3629c2ec-7d2e-4b95-a6f9-837833bf1eee', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEj0lEQVR4nO2d0W5jIQxEm9X+/y93X1ZR1EudwR7SjnLOY8IFlBHmYmzn9vn5+QHJ/PnpCcAUJIwHCeNBwniQMB4kjAcJ40HCeJAwHiSMBwnjQcJ4/ortbrfbfDDdpX4dbvlsPat6uPuzes/Xlo/N7t+++LdiFcaDhPGohvRO436xNiwNk3Vtptuua8ulMSw+cX27pGGEWYXxIGE8SBjP9l74yOSdXmwmboGNg8HyW3ErqsetH1kyiWBiFcaDhPGMDOmEXVu0bGY5VNSjLI8cvypyk1UYDxLG82OG9E5tUSfvq/oju99iSMEJEsaDhPGM9sLJlrC7Y+l3ApPNtWZyl3tu+2QVxoOE8WwbUktgyMfK3OlxKLvP1mZWf7aYybKl67eqYRXGg4Tx3H6Po0F3tYiu6nNXdA2v0DlYhfEgYTxIGM8oIH9yJyC++tfP1uM29tG6/eTKd9ffpMMqjAcJ49k+VOiRfbveihdnGInDuTKqRAPesK6swniQMJ6RId19q9Rv9epxd5m86zac4JYYc1JE3wgkjAcJ4/GUSxCjVPQjR30w2O15yXKI61bkyl2qpzeJUGUVxoOE8RxMEb1iN0rLns+FzVuumsUhOFS8EUgYz6juzO4d2KTCS93huWo4DeN/Lsh9CaswHiSMBwnj8QTkn0usbQyx6/Wf3CdYzg/LnjlUvBFIGI+nmKWYlbl0KDeGazd7Oqvau+3NqHLBKowHCePx1J1phFd7Y67rWemXnZPE1SukiIIEEsaDhPGocaSW8gHftSzaN7aT3Y15kl3cODbYjxyswniQMB5z3ZnJhfByFItRmsxZnOfTD8U8L9zc7wgSxmN2c9ctdTN1Lppb/HZp0LxR5Esab+CswniQMB4kjEfdC13prGLPdbNz+cPXK9/GbtfwZE1gFcaDhPFsp4g2jMPEKE1OCI2iBrvO94ZXaBmeg5v7rUHCeLbvCydMUkRdL72T+ozXTlxu/brnGlZhPEgYDxLG48nyFV+jG1lRjRiWazPXYcZSN46AfPgKEsZj/vO7ySu4Xt6rGOJj5f5wRanUz07SPCdnNlZhPEgYz/Z9YcORPckSOlczy5IEOnm2TqfVYRXGg4TxIGE8nkPFOb++uP2I83z6SH1MOlelkrozbw0SxuMpl3Bn4tidFCbQzc4kkFAMyG94oyawCuNBwng85dUnwYCWaO5GvvxuitN3H+7OSh9OhFUYDxLGg4TxbP9/oW3gTS9J3ckkh6iRM/W0n2IOlqicR1iF8SBhPJ4/vxNpHCoaZSMnpRZ2O5lE5VB3Bv6DhPF46s7UNIxhPdyuVW84wSeviJZXUx1WYTxIGA8SxnPwj2AnlQ5qXpCdZLmp0HuewCqMBwnjMcfOTNBfsi3xL6IxdHmUdiNrdFiF8SBhPL/IkC5Z2j3Xu1wxnMhrsulrWIXxIGE8SBiPuVyCziSfdnKpKxZTEOdcz0o/kBBH+tYgYTzm/2xqYHcZT25rxU4mAfkU8IKvIGE8PxbNDS5YhfEgYTxIGA8SxoOE8SBhPEgYDxLGg4TxIGE8SBgPEsaDhPH8A56NtUvix1QnAAAAAElFTkSuQmCC', 'E+m2Qu3JYM6Kv6cXUjurCON7CGg=', 'Doce  con 00/100 ');
INSERT INTO `venta` VALUES (3142, 0, 1, 2, 1, 1, NULL, NULL, 1, 14, NULL, 'B001', 27, 3.00, NULL, '2', 1, 1610383481, '2021-01-11 11:44:41', NULL, 2, NULL, NULL, 13, '2021-01-11 12:07:28', 3.00, '0', 0.00, 3.00, 3211, '2', 0, '2021-01-11 12:07:20', 0.00, NULL, 13, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/7fab846d-7b51-417b-846e-3d39db973f80', 'http://facturacion.selvafood.com/downloads/document/xml/7fab846d-7b51-417b-846e-3d39db973f80', '', NULL, 0, 0, 0, NULL, 'Cliente Varios', '0000001', '-', '7fab846d-7b51-417b-846e-3d39db973f80', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEgElEQVR4nO2dy27kMAwEM4v8/y/PXgLDiLUcSt22t+Gqox+SMg1SMkkpr/f7/QXJ/Ll7AKCChPEgYTxIGA8SxoOE8SBhPEgYDxLGg4TxIGE8SBjPd/O51+uld1aH1PddbE82+x22vL27v+v9Q5QxN7v4CFYYDxLG03WkGwv5xaFjGXq5orvaO/V917HBBSc8O/g+C04YK4wHCeNBwnim58I9teOenSfqOWn4ZHNOsqzyh/32UX6rGqwwHiSMR3KkCrOOpR9hsbisOv4y7Ouuck6sMB4kjOc2R9pcVdYXj+GS4Sv7u7OLyaED/69K4LHCeJAwHiSMR5oLlSlh9sOgP1MeG6k/SOqoUJ3U7f8C502fWGE8SBjPtCN1hYw3FupQjn5sIUrSfLf+qOh/zJwHVhgPEsbTdaT2BdWsq7SjrCoXIkrngRXGg4TxIGE8JxbkK0X1StpWqeE/3l34bGh+JrlyIFhhPEgYz8sSqrYso+07m+wtL9TwN8GRPhokjKfrSC3bLZU15zV7l668uzDmIVhhPEgYDxLGc0UdabMW1D5zNBt0pYtnIToDPyBhPFJ0ZtCcsPSv7y4UEjZx7V2aDfe4yhuxwniQMJ5pR+rKn9XMxoz679aFhHVrljA3+UL4DRLGg4TxTGcq9jSX4PYsR81CuOfYizKpL/ykfFQ8GiSMR/qoOLLg7mqay/eFUPVdhTD2frHCeJAwHs9e++HO9OL5jxeV471qmk54YeOqpdZ7AawwHiSMBwnj8XxUWJb+1xTk16/UyWQK8uEUkDAeKcw9iyVTutZLs+XzivlnDw4jOvMgkDAe6X82KWV3RxbiIM0GlTH/a4THK8fIzrBB+6leWGE8SBgPEsZjzlQou5OafQ272zeizNCW4yqb+61ckyJWGA8SxjN9mKV9Q+VsHnV4UUmZKqWRe5pO2FV8tIEVxoOE8XgO8BpiWXMO79YDUHY2KVtTLRtXCXM/ESSMBwnjkf7VyMJ21uIxpcKlbrk/PKWGZeO874chWGE8SBiPeYto/a6rVLDZXbOR80ojh3DuDPwGCeMxR2f6Wb3zXJayTvZWc9tX70OwwniQMB4kjMdzBlszl6vE9RciHQt1pEpBfj0X1kOtW67BCuNBwnhOPHfGEpRxhWxm+22+e/G+pyFYYTxIGI+5mru+q5T7KTUswyfPq+au7yolikOwwniQMB4kjMf8r0YmOhbi+kVre+zpDksuYvg8mYpHg4TxdD8qLjh3pr6obD5Vamc+jqFosLkt62t+zHuwwniQMB7p3JkmSuxmYWVYdPHxlXoAypk1TViRPhEkjAcJ45EyFcrOHSUe4d0/3O+i7nf2u4uCfPgBCeORHKkXVwq0GdmpU74LeMfcByuMBwnjud+RWs4NVLbk99d+dVRoNqruOjgMK4wHCeNBwng8daTn0SybV/YPK0X1w1EtRFioI300SBiPdIDXldQJYfuhBvbTYYpGRLDCeJAwntuqucEFVhgPEsaDhPEgYTxIGA8SxoOE8SBhPEgYDxLGg4TxIGE8SBjPX8vNFTMfukANAAAAAElFTkSuQmCC', 'onmwZsRiGTqD5nC01WT419HnWbM=', 'Tres  con 00/100 ');
INSERT INTO `venta` VALUES (3143, 0, 1, 2, 1, 1, NULL, NULL, 1, 13, NULL, 'B001', 26, 3.00, NULL, '2', 1, 1610384355, '2021-01-11 11:59:15', NULL, 1, NULL, NULL, 13, '2021-01-11 11:59:15', 3.00, '0', 0.00, 3.00, 3210, '2', 0, '2021-01-11 12:07:22', 0.00, NULL, 13, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/39a06a96-9527-415c-912a-1272a4f36bf4', 'http://facturacion.selvafood.com/downloads/document/xml/39a06a96-9527-415c-912a-1272a4f36bf4', '', NULL, 0, 0, 0, 8, 'Cliente Varios', '0000001', '- ', '39a06a96-9527-415c-912a-1272a4f36bf4', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEfElEQVR4nO2d0Y7cIAxFd6r+/y9PH7oaRYU6xr4he5VzHpsE2F7ZgDGe1/v9/gJnft09AOiChPYgoT1IaA8S2oOE9iChPUhoDxLag4T2IKE9SGjP7+R7r9er39kxpP5p8POPxy6m/3hLy3F38pbH1k7BCu1BQnuyjvRD4Xxx6lhitxP7onEM+fdHNzttJ/lnxq+p/q9isEJ7kNAeJLRneS48sjpjqb6NWf12ujGQPP3fmyOdvxcrtAcJ7Wk50g1MV/mjU9rpeKcDuBGs0B4ktOd+RxpHSZLf5td7q6tKefxFDlZoDxLag4T2tOZC7VI+f6CxOgXGLReIRxV/IgcrtAcJ7Vl2pKrARHy4OnqqTnZMHNnJD2/1QHhPEAcrtAcJ7Xn9hPjCX/LOcPrJSCd+Lcms2QNWaA8S2oOE9ogT8vNTyOoklz9PiL+NiefgZHZMZ9ouTLdYoT1IaE/WkRYy7OIYSrI7Sbp+nrjlzqai44RjsEJ7kNCe1oo0eULWueZ5+ub4fnK9ujn+0plWYrBCe5DQHiS0R3OzqZA2ct3GIO5rdaiF85NCv+MnRGceBBLaIy6XUIi/xGy42VRwd5JY1bRByiU8ESS0ZznMrVqhxXRuNmkzBPNBnNXkR9WqGyu0BwntQUJ7snmkheT2whXcoDtV2cjrUkCvy46JwQrtQUJ7WpuK8emRzv2juAtJy/KzX4mrJMz9RJDQnuUV6RTt4vP0aTLSkfT5nWXtdfUB8mCF9iChPUhoTys60/lEu/LO1+4dXys8LdDJqo3BCu1BQntadWc6G5LVpPrCFaegtdNRySM7nY1QDFZoDxLa00pCTN7WkafsjS0fG0muVzt+TH5gyRXRR4OE9iChPTsq5BdOOX5Oun6+3+C1r/R2pQBWaA8S2iN2pPIrk4X3rzvUHTckhU1UZ1RTsEJ7kNAeTVVgydFg3s12khDj9eqGujPyfrFCe5DQHiS0R3zk28mrzN+ZGl/rbDniluNGCvGXTjRqClZoDxLaI74iWnCGMZ0UxWkjnQRGSWai5J7XEazQHiS0R/Pjd4UMl9UVacehSfxe/mncHeeF8C9IaA8S2nNh3ZkknZmyczupEKZZPUwu1OgpgBXag4T2LB/5XldcIN+d5FZUcgDxqDbfe5qCFdqDhPZo6s4kKcQyVpNo4tdOWa0Oo0okHFvOgxXag4T2IKE9mjzSSseLuaBHJHk3qmoFcYNjy/JibFihPUhoT+uHYFc5OodO2nw8vI6blcSqVms9nDYYgxXag4T2iH/8bkrBd3WWbR2fL0lsKUSUOmPGCu1BQnuQ0B7NL2pP0R4m57cN49P8HaJOYvx1kZ0YrNAeJLRnRwGvKZ0quZLUlWm/nYsA2uNiwtwPAgntuc2Rxqw6GXlqZNBXoYtpL9xsgm+Q0B4ktKc1F2rzbuSlLjtHr9NRJT/pFGIogBXag4T2aMolXIc8zbBDMgguCZETnXkQSGjPbdncoAIrtAcJ7UFCe5DQHiS0BwntQUJ7kNAeJLQHCe1BQnuQ0B4ktOcPkCXHIa6n1g0AAAAASUVORK5CYII=', 'DStrE6AO2nXhuV8R2Nd739Yu9no=', 'Tres  con 00/100 ');
INSERT INTO `venta` VALUES (3144, 0, NULL, 0, NULL, NULL, NULL, NULL, 1, 14, NULL, NULL, NULL, 3.00, NULL, '1', 1, 1610385115, '2021-01-11 12:11:55', NULL, 2, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '2', 0, '2021-01-11 21:36:29', 0.00, NULL, NULL, NULL, NULL, 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `venta` VALUES (3145, 0, 1, 2, 1, 1, NULL, NULL, 41, 13, NULL, 'B001', 28, 3.00, NULL, '2', 1, 1610419537, '2021-01-11 21:45:37', NULL, 3, NULL, NULL, 13, '2021-01-11 21:45:37', 3.00, '0', 0.00, 3.00, 3212, '1', 0, NULL, 0.00, NULL, 13, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/941ca561-898e-47d3-bf78-c737b9b605ac', 'http://facturacion.selvafood.com/downloads/document/xml/941ca561-898e-47d3-bf78-c737b9b605ac', '', NULL, 0, 0, 0, 8, 'jimmy ', '75270588', 'prueba', '941ca561-898e-47d3-bf78-c737b9b605ac', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEbUlEQVR4nO2dwW7jMAxEm8X+/y9nL0UQrAV2xKGdDvzeMY4ptQNSNkUxj+fz+QXJ/Pn0BMAFCeNBwniQMB4kjAcJ40HCeJAwHiSMBwnjQcJ4kDCev+L3Ho+HP9gypf6y3Ei4j8yqwWuq7xNYfugP8SN4YTxIGI8aSF9Mhbs62hyvLsetJ7MM0aLl2qAY/K9ZGvDCeJAwHiSMZ3stfKcO3OI6cVxgfjRyXIqWD/fiuLVl/d4a539VgxfGg4TxWIHUoX64Hwk7jWTQ8cM6ROsB/DzwwniQMJ6PBVIxKInPfo0g7Fj+VSXweGE8SBgPEsZjrYXOkrCb7Nd3NpxZ1Tmj41V9rPOWT7wwHiSMZzuQXlyuUm/bNnLW4r0v9Hvr16TzwAvjQcJ4Hr8q0XCk3kSsnwzFqzXjhZPj4IXxIGE8SBjPiQX5TqXJcY3R9yIKI1/7y1jjtUEs15/aA8EL40HCeIZfKvTAUnxtarjxWTnvMDUE0luDhPGogdQ5JeTEsdrykt1Zjce9RlbI2YnEC+NBwniQMB41O9OocHl9WC974tV3nJNNs70MHGtkZ+AbJIxn+6XiHadaZDeH4uCUKI6H6EYSvAYvjAcJ47GeSJ0eLkcj11S4zBYh6pPZnZUOXhgPEsaDhPHMvFSI+xj1vcurorUaZ6eicfbYqcrhpeKOIGE8Mw28Gj1cdk8nLS2PbCYvhzvm6JdDiEb0qw3wwniQMJ7hs/bjLQKXY9VBWAzRjWOeI0/RjT3OGrwwHiSMBwnjsepIj1eXOI/gDcQ2mRTkw28BCeO5NM3dCErLe8VZLdlNvjsl987hBdLcNwIJ45n5zaZGRbYYKJyCGucMkThuXb1ejzsFXhgPEsaDhPGc2CH/vOi/u0vsrN+NvjPiKjv1b8EL40HCeK7oCjxSlOcM10hkNxAPro4338EL40HCeLYbeDW6+9U4z37F989g5CSXOARp7huBhPEgYTzbXYEbZ5dqg7URMXUyvo6OFMLUUJAP3yBhPFZ2RgxoI2WGegBv7OUWX9P/XhEK8uF/kDCeK7Iz4wXgopERnGruRvMv0tx3BAnjQcJ4htsl6C0PXpzX3W2q3czRYGPp2i2oYafiRiBhPDNFiOMnjGojI2F2JImzvGXk3JMOXhgPEsYz03fGORTpjLtk96FuvJrbsdyIqHhhPEgYDxLGM/xDsBsDGw0Rjrc4JfcX70U0xq3BC+NBwni2ixAdGnkQMYHudFVoTKamkfchzX1rkDCemb4zNY0k+Mi9Ysg676yWDk+ktwYJ40HCeGZqZ5Y42YramnN+WKSxn7A7ytThBbwwHiSM58QGXiKNhEi99epkWJwklBO3qZ25NUgYz+cD6Ugz8hp9Z263Kud9Art14hQhwjdIGA8SxjP8+4WOEX1TwjlR5ZTNj1heQh3prUHCeK7oCiwabLQGc77WqNkZ6aTjxMwleGE8SBjPx6q5YQq8MB4kjAcJ40HCeJAwHiSMBwnjQcJ4kDAeJIwHCeNBwniQMJ5/yvjcM3+2PDQAAAAASUVORK5CYII=', 'b2AJ+9UncXLp1hLSBl5oitWriTU=', 'Tres  con 00/100 ');
INSERT INTO `venta` VALUES (3146, 0, 1, 2, 1, 1, NULL, NULL, 44, 13, NULL, 'B001', 29, 20.00, NULL, '2', 1, 1610422176, '2021-01-11 22:29:36', NULL, 3, NULL, NULL, 13, '2021-01-11 22:29:36', 20.00, '0', 0.00, 20.00, 3213, '1', 0, NULL, 0.00, NULL, 13, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/c3bc0307-d2cb-4758-a28c-c2cf5b214a39', 'http://facturacion.selvafood.com/downloads/document/xml/c3bc0307-d2cb-4758-a28c-c2cf5b214a39', '', NULL, 0, 0, 0, 8, 'jimmy carbajal', '75270587', '', 'c3bc0307-d2cb-4758-a28c-c2cf5b214a39', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEcklEQVR4nO2d227cMAxEs0X//5fTl2Bh1Co74tBeDHzOY2xdnAEpiaK0r+/v7y9I5tenOwAuSBgPEsaDhPEgYTxIGA8SxoOE8SBhPEgYDxLGg4Tx/Bbfe71efmN1SP3YxPtNsV09WL/7Icea32X1D2mjfxFWGA8SxqM60jeN/cWlYxGdkuhR66fHJs7N6Q78/FTsvE7DCWOF8SBhPEgYz/ZYeEQfgZSny/dHxqQl9Qg9jvO/qsEK40HCeCxH6rDrWJZRkrrm5Qrh/UfRd+mLmU+lc2KF8SBhPB9zpOKssv7ju6weALo5Bn0DWGE8SBgPEsZjjYXOkLC786CPlLs0tosbUaHrhk+sMB4kjGfbkY4HgusYirhaqMuKK5Opsud+XgpWGA8SxvP6eKChsZEmOlKnCRHC3DAAEsaDhPGoY2Fjfuwk1Y8kxYgjpVjbf8s6Sx3ne7HCeJAwHishv3Yd5yL605GTTU4O/7LmXXd3XWj+CFYYDxLGsx2dGT8HNH7uUpz71WWX74980Xh+OlYYDxLGg4TxDJ/ydabgziir1yy+uZu3v9XKuWaiM48GCeOxFhVvdj3b1753nYoKXbeIEnFydpZghfEgYTxW7oyTkyLma48wlVkzG2ZiRgo/IGE8SBjPzE7Ff9/0aWzqNsYk5+lsNIpFxYNAwnisW4FH7nRsOKXZxUyjEvG4k7P20MEK40HCeGaSEJfOwTluKfbByTFfspuRXdd8XfD9CFYYDxLGg4TxqGNhY/hx5tYjm6sjd7CN71Q0aq7BCuNBwnguTMg/M5UYv1uznndzXUK+uMVNmPuJIGE8d/xm025Q40gjDjKSCd44b1UngI/MsZdghfEgYTxIGI+15XvdnTV1W7vLhrrCxn5CXfaGwNMRrDAeJIxn5mTTkpFIR6Mz4nUJokMbP1HlJP4swQrjQcJ4rBnpGyfNUGzOiQqJTXzte0gnV7HuFWHuB4GE8SBhPBf+fqEzBT8/rWvW2c1uXba7xMnKccAK40HCeLaTEI+IK43rMmsa8ZeRtPnzSQQdEvLhb5AwnltnpMun4qmoJQ2nNL55ea5Z7BXZ3PADEsaDhPEM/xDsPVc/ip05V7Isq+82OPsnuwk17FQ8CCSMx1pUOCHjM87FBHrNu0X0tmbPPelghfEgYTx3JCE2XIdT9lzJkdkjog3EADoz0geBhPEgYTzWDflWw5tjUl1Jg/GE/N0dEnYq4AckjGcmIV9k/JaWuhUnbd55sxGrYlHxaJAwnjvunWncHVM358zfxErEp0tunuRjhfEgYTxIGI+15Tty9LeBuCHs7FTckKHKvTPwAxLGc2FCvojjnRqusq5ZDEbXnRm/rrIGK4wHCeP5vCOtadw5OHuAdNmZc23/ak7sM0mIjwYJ40HCeGYS8h0aewLOGeC65hon97XGWZBghfEgYTzDR0QbjFwu0DgmsOQ6V1lUYoIVxoOE8XwsmxumwArjQcJ4kDAeJIwHCeNBwniQMB4kjAcJ40HCeJAwHiSMBwnj+QN7cv0YxaxiFQAAAABJRU5ErkJggg==', 'Pzw/pviAD//HSmhwBeuhY83ScFU=', 'Veinte  con 00/100 ');
INSERT INTO `venta` VALUES (3147, 0, 1, 2, 1, 1, NULL, NULL, 44, 13, NULL, 'B001', 30, 6.00, NULL, '2', 1, 1610422209, '2021-01-11 22:30:09', NULL, 3, NULL, NULL, 13, '2021-01-11 22:30:09', 6.00, '0', 0.00, 6.00, 3214, '1', 0, NULL, 0.00, NULL, 13, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, 'http://facturacion.selvafood.com/downloads/document/pdf/834d5608-8225-433a-81aa-63dd4f389d54', 'http://facturacion.selvafood.com/downloads/document/xml/834d5608-8225-433a-81aa-63dd4f389d54', '', NULL, 0, 0, 0, 8, 'jimmy carbajal', '75270587', 'psje. humberto pinedo 130', '834d5608-8225-433a-81aa-63dd4f389d54', NULL, NULL, NULL, NULL, NULL, NULL, 'iVBORw0KGgoAAAANSUhEUgAAAJYAAACWCAIAAACzY+a1AAAACXBIWXMAAA7EAAAOxAGVKw4bAAAEcElEQVR4nO2d3c7UMAxEWcT7v/Jyg6pKjfzZmekuo55zyTY/MLKTOI55vd/vX5DM729PAFSQMB4kjAcJ40HCeJAwHiSMBwnjQcJ4kDAeJIwHCeP50/zu9Xrpg51D6tcONwLuy1ld+7FMfjnEueflH+pD/AhWGA8SxtN1pAf3uTulw2Vvx2dLB143ac5T+XXJhhPGCuNBwniQMJ7xWnimdtz1SjBdkzZoLkX1WMtjQ/PX/ijKzgArjAcJ45EcqYXaoyrOsNl2wwHawz0KWGE8SBjP9x3pgbIzXMZfmu6u3/OV/yEXHiuMBwnjQcJ4pLVQWQmuF6Su24ZiiPqzPvWVr2uUJlhhPEgYz9iRugITV2fYd0r1rGoXfZ3/RltLAN0FVhgPEsbTdaT2DdXUZfV3lVN392OH088+HLLBCuNBwniQMB5zQr4rwqIcKixNltO7LxuoGataghXGg4TxvCxxkJ2Bv/2yyX5cUQ4zSlusMB4kjMeczV0HlPu9TRMDFc+mzLnPNN7UByuMBwnjQcJ4xtGZ/irlPXIobLxOWiajTmMoG/8aRGeeCBLGM47OrHvpZaks+UCkQ3n35HoEeu1EcdFnsMJ4kDAeTxLixp1fnQxYf+/d3W28bKpvE5vLiivFBiuMBwnjQcJ4pCvfg42N8nShUtrWKKeafhRJOTbUYIXxIGE8UhLifYVdpsHojVlNJ/AjFldJdOaJIGE845dN/T3YfXUSmyg1FjcmP3306nLgWGE8SBgPEsZzYx5ps219y2G5rd3II60n0L9UmcKh4okgYTye6IzluaWrzNb0MeZGDotSdOw6Vn/yS7DCeJAwHs+OtI5HbGwvp8GgfvKj8iK+np4S9OeJ6KNBwniQMB5PVWBlgWmGP+pVts8HLmbtKfc1WGE8SBiP9LLJ+4aoHmKJvfRA3bNS0WajzE0TrDAeJIzHU8BrI7CruL5miuKS6ebZdQPa/NfAkT4RJIwHCeMZR2f6D3rtKaDb9FdKy7GhRmm7BCuMBwnjMV/5Ln89UKoq9LfgSsy96WY3MhObkIT4RJAwHk8lxI1nns3hNlDybiy/Ksk7G2CF8SBhPEgYT/em4r7aMTUfvnqd3oH0jyj2m94DrDAeJIxHKpcwzQe577rYnuWu9Nz06ht/oyVYYTxIGM94R3pGKbNVf9Z0O0oSon1psEDuzBNBwniQMB7PfzWyM/CwYtmy7RKlrcI0ROWK12CF8SBhPFLdmSnLujP26pIfKA1Wz2qjcFjdYQ1WGA8SxuPJ5q5RascowaP6yw9Hxr1DnMEK40HCeJAwHnNV4DMfeOnjfdC7nMzGK18FbiqeCBLGIzlShanb6QevvQ8BNhIYLdfFhLkfBBLG8zVHemAvRFgPcd+9XXNcS89nsMJ4kDAeJIzHUxXYjjfScV/dGWVc6s7AP5AwnrEjtSfxNVNdFOpDRX+IZhDcEiInOvMgkDCer2VzgwusMB4kjAcJ40HCeJAwHiSMBwnjQcJ4kDAeJIwHCeNBwniQMJ6/+7+7ISf8Q7QAAAAASUVORK5CYII=', 'qKL40xh8hgYy6vr7t3jzFFYv0Ys=', 'Seis  con 00/100 ');

SET FOREIGN_KEY_CHECKS = 1;
