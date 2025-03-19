-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-05-2019 a las 18:05:39
-- Versión del servidor: 10.1.39-MariaDB
-- Versión de PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `paleteriaz`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacenes`
--

CREATE TABLE `almacenes` (
  `almacen_id` int(11) NOT NULL,
  `almacen_descripcion` varchar(60) DEFAULT NULL,
  `empresa_id` varchar(3) DEFAULT NULL,
  `almacen_direccion` varchar(80) DEFAULT NULL,
  `id_sede` int(11) DEFAULT NULL,
  `almacen_estado` int(11) DEFAULT '1',
  `almacen_uso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `almacenes`
--

INSERT INTO `almacenes` (`almacen_id`, `almacen_descripcion`, `empresa_id`, `almacen_direccion`, `id_sede`, `almacen_estado`, `almacen_uso`) VALUES
(1, 'Almacen General', NULL, 'Psje. humberto Pinedo 130', 1, 1, 1),
(2, 'almacen de frutas', NULL, 'psj. humberto pinedo N° 162', 1, 1, 0),
(3, 'almacen de frutas', NULL, 'psj. humberto pinedo N° 162', 1, 1, 0),
(4, 'almacén de frutas', NULL, 'psj. humberto pinedo N° 162', 1, 1, 0),
(5, 'sASa', NULL, 'sASas', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amortizacioncompra`
--

CREATE TABLE `amortizacioncompra` (
  `amo_cuotacompra` int(11) NOT NULL,
  `amo_movimiento` int(11) NOT NULL,
  `amo_monto` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amortizacionpago`
--

CREATE TABLE `amortizacionpago` (
  `amor_pagoempleado_idamorpa` int(11) NOT NULL,
  `amor_pagoempleado_peid` int(11) DEFAULT NULL,
  `amor_pagoempleado_idtipomov` int(11) DEFAULT NULL,
  `amor_pagoempleado_fechapago` date DEFAULT NULL,
  `amor_pagoempleado_fechafalta` date DEFAULT NULL,
  `amor_pagoempleado_faltaregistro` date DEFAULT NULL,
  `amor_pagoempleado_monto` decimal(11,2) DEFAULT NULL,
  `id_movimiento` int(11) DEFAULT NULL,
  `amor_pagoempleado_estadopago` char(1) DEFAULT '1',
  `amor_pagoempleado_estado` char(1) DEFAULT NULL,
  `amor_pagoempleado_idadelanto` int(11) DEFAULT NULL,
  `amor_pagoempleado_iddescuento` int(11) DEFAULT NULL,
  `amor_pagoempleado_idfalta` int(11) DEFAULT NULL,
  `bonoficaciones` decimal(11,2) DEFAULT NULL,
  `saludmonto` decimal(11,2) DEFAULT NULL,
  `afpmonto` decimal(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amortizacionventa`
--

CREATE TABLE `amortizacionventa` (
  `amo_ventaid` int(11) NOT NULL,
  `amo_cuotaventa` int(11) NOT NULL,
  `amo_movimiento` int(11) NOT NULL,
  `amo_monto` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `amortizacionventa`
--

INSERT INTO `amortizacionventa` (`amo_ventaid`, `amo_cuotaventa`, `amo_movimiento`, `amo_monto`) VALUES
(1, 1, 61, '15.50'),
(2, 2, 63, '15.50'),
(3, 3, 64, '15.50'),
(4, 4, 72, '15.50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE `bancos` (
  `banco_idbanco` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  `abreviatura` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `id_caja` int(11) NOT NULL,
  `caja_descripcion` varchar(255) DEFAULT NULL,
  `caja_estado` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`id_caja`, `caja_descripcion`, `caja_estado`) VALUES
(1, 'Caja Fisica', 1),
(2, 'Caja Virtual', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_producto`
--

CREATE TABLE `categoria_producto` (
  `categoria_producto_id` int(11) NOT NULL,
  `categoria_producto_descripcion` varchar(255) DEFAULT NULL,
  `categoria_producto_estado` int(11) DEFAULT '1',
  `id_sede` int(11) DEFAULT NULL,
  `categoria_imagen` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `categoria_producto`
--

INSERT INTO `categoria_producto` (`categoria_producto_id`, `categoria_producto_descripcion`, `categoria_producto_estado`, `id_sede`, `categoria_imagen`) VALUES
(1, 'Paletas', 1, 1, 'fadc310b5029e33b50ed10b6c95b9d2456744663_685727875163361_2148815547423260672_n.jpg'),
(2, 'erwerwrwr', 1, 1, 'd28d2bcf9f51226b3f753d259bc8ada043961579-de-fondo-sin-fisuras-plana-con-rebanadas-de-pastel-dibujo-lineal-y-tazas-de-té-postre-tema-fondo-brill.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE `clase` (
  `clase_id` int(11) NOT NULL,
  `clase_descripcion` varchar(255) DEFAULT NULL,
  `clase_estado` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`clase_id`, `clase_descripcion`, `clase_estado`) VALUES
(1, 'GASEOSA', 1),
(2, 'LECHE', 1),
(3, 'TORTA', 1),
(4, 'CEREALES', 1),
(5, 'CEREALES', 1),
(6, 'ARINAS', 1),
(7, 'GALLETA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` int(11) NOT NULL,
  `cliente_nombres` varchar(100) DEFAULT NULL,
  `cliente_direccion` varchar(150) DEFAULT NULL,
  `cliente_dni` char(11) DEFAULT NULL,
  `cliente_ruc` char(11) DEFAULT NULL,
  `cliente_telefono` varchar(45) DEFAULT NULL,
  `cliente_celular` varchar(45) DEFAULT NULL,
  `cliente_tipodocumento` int(11) DEFAULT NULL,
  `cliente_email` varchar(100) DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  `empresa_ruc` varchar(11) DEFAULT NULL,
  `cliente_ubicacion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `cliente_nombres`, `cliente_direccion`, `cliente_dni`, `cliente_ruc`, `cliente_telefono`, `cliente_celular`, `cliente_tipodocumento`, `cliente_email`, `estado`, `empresa_ruc`, `cliente_ubicacion`) VALUES
(0, 'VARIOS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL),
(2, 'José Martin Barrutia Trinidad', 'Jose Pardo 350', '70996529', NULL, '971555752', NULL, NULL, 'josmar08.31059@gmail.com', '1', '10709965293', 'Tarapoto'),
(3, 'July', 'xssdsd', '89898998', NULL, NULL, '952585222', NULL, NULL, '1', '10709965293', NULL),
(4, 'Jimmy perrita', 'dfdfdf', '72152255', NULL, '593254563', NULL, NULL, 'xshif@gmail.com', '1', '10709965293', 'Lima');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `compra_id` int(11) NOT NULL,
  `proveedor_id` int(11) DEFAULT NULL,
  `almacen_id` int(11) DEFAULT NULL,
  `moneda_id` int(11) DEFAULT NULL,
  `compra_fechaingresoalmacen` datetime DEFAULT NULL,
  `tipodoc_id` int(11) DEFAULT NULL,
  `compra_fechacomprobante` datetime DEFAULT NULL,
  `compra_numcomprobante` varchar(18) DEFAULT NULL,
  `compra_numguiaproveedor` varchar(18) DEFAULT NULL,
  `compra_numcfacttransporte` varchar(18) DEFAULT NULL,
  `compra_numguiatransporte` varchar(18) DEFAULT NULL,
  `compra_importe` decimal(18,2) DEFAULT '0.00',
  `compra_igv` decimal(18,2) DEFAULT '0.00',
  `compra_total` decimal(18,2) DEFAULT '0.00',
  `estado` int(1) DEFAULT '1',
  `id_tipo_pago` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `compra_credito_estado` int(11) DEFAULT NULL,
  `compra_credito_cuotas` int(11) DEFAULT NULL,
  `compra_monto_transporte` decimal(11,2) DEFAULT NULL,
  `compra_fecha_transporte` date DEFAULT NULL,
  `compra_movimiento_transporte` int(11) DEFAULT NULL,
  `compra_serie_comprobante` varchar(155) DEFAULT NULL,
  `compra_correlativo_comprobante` varchar(255) DEFAULT NULL,
  `compra_monto_cambio` decimal(10,4) DEFAULT NULL,
  `compra_idmovimiento` int(11) DEFAULT NULL,
  `id_sede` int(11) DEFAULT NULL,
  `compra_seri_nota_credito` varchar(100) DEFAULT NULL,
  `compra_correlativo_nota_credito` varchar(100) DEFAULT NULL,
  `compra_forma_pago` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`compra_id`, `proveedor_id`, `almacen_id`, `moneda_id`, `compra_fechaingresoalmacen`, `tipodoc_id`, `compra_fechacomprobante`, `compra_numcomprobante`, `compra_numguiaproveedor`, `compra_numcfacttransporte`, `compra_numguiatransporte`, `compra_importe`, `compra_igv`, `compra_total`, `estado`, `id_tipo_pago`, `id_empleado`, `compra_credito_estado`, `compra_credito_cuotas`, `compra_monto_transporte`, `compra_fecha_transporte`, `compra_movimiento_transporte`, `compra_serie_comprobante`, `compra_correlativo_comprobante`, `compra_monto_cambio`, `compra_idmovimiento`, `id_sede`, `compra_seri_nota_credito`, `compra_correlativo_nota_credito`, `compra_forma_pago`) VALUES
(1, 1, 1, 1, '2019-05-06 09:14:58', 1, '2019-05-06 00:00:00', 'F001-009', '', '', '', '15254.24', '2745.76', '18000.00', 1, 1, 2, 0, 0, '0.00', '0000-00-00', 0, 'F001', '009', '1.0000', 1, 1, NULL, NULL, 1),
(2, 1, 1, 1, '2019-05-06 09:20:32', 1, '2019-05-06 00:00:00', 'F001-009', '', '', '', '15254.24', '2745.76', '18000.00', 1, 1, 2, 0, 0, '0.00', '0000-00-00', 0, 'F001', '009', '1.0000', 1, 1, NULL, NULL, 1),
(3, 1, 1, 1, '2019-05-06 09:27:56', 1, '2019-05-06 00:00:00', 'F001-0010', '', '', '', '9745.76', '1754.24', '11500.00', 1, 1, 2, 0, 0, '0.00', '0000-00-00', 0, 'F001', '0010', '1.0000', 1, 1, NULL, NULL, 1),
(4, 1, 1, 1, '2019-05-06 09:39:37', 1, '2019-05-06 00:00:00', 'F001-0011', '', '', '', '8.47', '1.53', '10.00', 1, 1, 2, 0, 0, '0.00', '0000-00-00', 0, 'F001', '0011', '1.0000', 50, 1, NULL, NULL, 1),
(5, 1, 1, 1, '2019-05-06 09:44:24', 1, '2019-05-06 00:00:00', 'F001-0011', '', '', '', '76.27', '13.73', '90.00', 1, 1, 2, 0, 0, '0.00', '0000-00-00', 0, 'F001', '0011', '1.0000', 51, 1, NULL, NULL, 1),
(6, 1, 1, 1, '2019-05-06 10:11:34', 0, '2019-05-06 00:00:00', 'F001-001', '', '', '', '10.00', '0.00', '10.00', 1, 1, 2, 0, 0, '0.00', '0000-00-00', 0, 'F001', '001', '1.0000', 52, 1, NULL, NULL, 1),
(7, 1, 1, 1, '2019-05-06 10:17:42', 1, '2019-05-06 00:00:00', 'F001-0019', '', '', '', '1000.00', '0.00', '1000.00', 1, 1, 2, 0, 0, '0.00', '0000-00-00', 0, 'F001', '0019', '1.0000', 54, 1, NULL, NULL, 1),
(10, 1, 2, 1, '2019-05-09 23:16:24', 1, '2019-05-09 00:00:00', '145-120', '', '', '', '45.00', '0.00', '45.00', 1, 1, 2, 0, 0, '0.00', '0000-00-00', 0, '145', '120', '1.0000', 77, 1, NULL, NULL, 1),
(11, 2, 1, 1, '2019-05-09 23:20:01', 2, '2019-05-09 00:00:00', '120-124', '', '', '', '30.00', '0.00', '30.00', 1, 1, 2, 0, 0, '0.00', '0000-00-00', 0, '120', '124', '1.0000', 78, 1, NULL, NULL, 1),
(12, 1, 1, 1, '2019-05-09 23:43:17', 2, '2019-05-09 00:00:00', '120-123', '', '', '', '50.85', '9.15', '60.00', 1, 1, 2, 0, 0, '0.00', '0000-00-00', 0, '120', '123', '1.0000', 79, 1, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto`
--

CREATE TABLE `concepto` (
  `con_id` int(11) NOT NULL,
  `id_tipo_movimiento` int(11) NOT NULL,
  `con_descripcion` varchar(100) DEFAULT NULL,
  `con_estado` int(11) DEFAULT '1',
  `id_sede` int(11) DEFAULT NULL,
  `con_estado_visible` int(11) DEFAULT '1',
  `con_cuenta_contable` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `concepto`
--

INSERT INTO `concepto` (`con_id`, `id_tipo_movimiento`, `con_descripcion`, `con_estado`, `id_sede`, `con_estado_visible`, `con_cuenta_contable`) VALUES
(1, 1, 'Ingreso de Ventas', 1, NULL, 0, ''),
(2, 2, 'Egreso Compras', 1, NULL, 0, ''),
(3, 2, 'Pago a Personal', 1, 1, 1, NULL),
(4, 1, 'Cobro de Servicio', 1, 1, 1, NULL),
(5, 2, 'luz', 1, 1, 1, NULL),
(6, 1, 'cobro de bufet1', 1, 1, 1, NULL),
(7, 1, 'cobro de bufet', 0, 1, 1, NULL),
(8, 2, 'agua', 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato_personal`
--

CREATE TABLE `contrato_personal` (
  `contrato_id` int(11) NOT NULL,
  `contrato_fecha_inicio` date DEFAULT NULL,
  `contrato_fecha_fin` date DEFAULT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  `motivo_contrato_id` int(11) DEFAULT NULL,
  `contrato_estado` int(11) DEFAULT '1',
  `contrato_fecha_notificacion` date DEFAULT NULL,
  `contrato_dias_notificacion` int(11) DEFAULT NULL,
  `contrato_fecha_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_venta_temporal`
--

CREATE TABLE `cuentas_venta_temporal` (
  `cuentas_idtemporal` int(11) NOT NULL,
  `cuentas_idventas` int(11) DEFAULT NULL,
  `venta_monto` decimal(11,2) DEFAULT NULL,
  `venta_estado` char(1) DEFAULT '1',
  `venta_idsede` int(11) DEFAULT NULL,
  `venta_fechapedido` int(25) DEFAULT NULL,
  `nombre_cuenta` char(2) DEFAULT NULL,
  `cuenta_estadopago` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuotacompra`
--

CREATE TABLE `cuotacompra` (
  `cuo_id` int(11) NOT NULL,
  `cuo_compra` int(11) NOT NULL,
  `cuo_nrocuota` int(11) DEFAULT NULL,
  `cuo_fechavence` date DEFAULT NULL,
  `cuo_fechacancelado` date DEFAULT NULL,
  `cuo_montocuota` decimal(10,2) DEFAULT NULL,
  `cuo_montopagado` decimal(10,2) DEFAULT NULL,
  `cuo_estado` int(11) DEFAULT '1',
  `tipo_moneda` int(11) DEFAULT NULL,
  `cambio_dolar` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuotacompra_producto`
--

CREATE TABLE `cuotacompra_producto` (
  `cuo_id` int(11) NOT NULL,
  `cuo_compra` int(11) NOT NULL,
  `cuo_nrocuota` int(11) DEFAULT NULL,
  `cuo_fechavence` date DEFAULT NULL,
  `cuo_fechacancelado` date DEFAULT NULL,
  `cuo_montocuota` decimal(10,2) DEFAULT NULL,
  `cuo_montopagado` decimal(10,2) DEFAULT NULL,
  `cuo_estado` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuotaventa`
--

CREATE TABLE `cuotaventa` (
  `cuo_ventaid` int(11) NOT NULL,
  `cuo_venta` int(11) DEFAULT NULL,
  `cuo_ventanrocuota` int(11) DEFAULT NULL,
  `cuo_ventafechavence` date DEFAULT NULL,
  `cuo_ventafechacancelado` date DEFAULT NULL,
  `cuo_ventamontocuota` decimal(10,2) DEFAULT NULL,
  `cuo_ventamontopagado` decimal(10,2) DEFAULT NULL,
  `cuo_ventaestado` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `cuotaventa`
--

INSERT INTO `cuotaventa` (`cuo_ventaid`, `cuo_venta`, `cuo_ventanrocuota`, `cuo_ventafechavence`, `cuo_ventafechacancelado`, `cuo_ventamontocuota`, `cuo_ventamontopagado`, `cuo_ventaestado`) VALUES
(1, 78, 1, '2019-05-09', '2019-05-08', '15.50', '15.50', 0),
(2, 78, 2, '2019-05-10', '2019-05-08', '15.50', '15.50', 0),
(3, 78, 3, '2019-05-11', '2019-05-08', '15.50', '15.50', 0),
(4, 78, 4, '2019-05-13', '2019-05-09', '15.50', '15.50', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `estado` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `desactivar_producto`
--

CREATE TABLE `desactivar_producto` (
  `desactivar_producto_id` int(11) NOT NULL,
  `desactivar_producto_fecha` date DEFAULT NULL,
  `desactivar_producto_estado` int(11) DEFAULT '1',
  `producto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `id_detalle_compra` int(11) NOT NULL,
  `compra_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `detalle_compra_cantidad` decimal(18,3) DEFAULT NULL,
  `detalle_compra_preciounitatio` decimal(18,4) DEFAULT NULL,
  `detalle_compra_precio` decimal(18,4) DEFAULT NULL,
  `detalle_compra_subtotal` decimal(18,2) DEFAULT NULL,
  `detalle_compra_igv` decimal(18,4) DEFAULT NULL,
  `detalle_compra_valor_descuento` decimal(10,2) DEFAULT NULL,
  `detalle_compra_detalle_unidad_medida` int(11) DEFAULT NULL,
  `tipo_igv_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `detalle_compras`
--

INSERT INTO `detalle_compras` (`id_detalle_compra`, `compra_id`, `producto_id`, `detalle_compra_cantidad`, `detalle_compra_preciounitatio`, `detalle_compra_precio`, `detalle_compra_subtotal`, `detalle_compra_igv`, `detalle_compra_valor_descuento`, `detalle_compra_detalle_unidad_medida`, `tipo_igv_id`) VALUES
(11, 23, 26, '4.000', '1.0000', '4.0000', '4.00', '0.0000', '0.00', 35, 8),
(12, 23, 24, '4.000', '45.0000', '180.0000', '180.00', '0.0000', '0.00', 36, 8),
(13, 24, 26, '100.000', '2.0000', '200.0000', '200.00', '0.0000', '0.00', 35, 8),
(14, 24, 25, '100.000', '344.0000', '34400.0000', '29152.54', '5247.4600', '0.00', 25, 1),
(15, 24, 24, '12.000', '300.0000', '3600.0000', '3050.85', '549.1500', '0.00', 37, 1),
(16, 2, 25, '2000.000', '9.0000', '18000.0000', '15254.24', '2745.7600', '0.00', 25, 1),
(17, 3, 25, '1000.000', '2.5000', '2500.0000', '2118.64', '381.3600', '0.00', 25, 1),
(18, 3, 24, '1000.000', '9.0000', '9000.0000', '7627.12', '1372.8800', '0.00', 23, 1),
(19, 4, 24, '10.000', '1.0000', '10.0000', '8.47', '1.5300', '0.00', 23, 1),
(20, 5, 24, '10.000', '9.0000', '90.0000', '76.27', '13.7300', '0.00', 23, 1),
(21, 6, 25, '10.000', '1.0000', '10.0000', '10.00', '0.0000', '0.00', 25, 9),
(22, 7, 25, '100.000', '10.0000', '1000.0000', '1000.00', '0.0000', '0.00', 25, 9),
(23, 10, 42, '3.000', '15.0000', '45.0000', '45.00', '0.0000', '0.00', 41, 8),
(24, 11, 42, '1.000', '30.0000', '30.0000', '30.00', '0.0000', '0.00', 42, 8),
(25, 12, 42, '2.000', '30.0000', '60.0000', '50.85', '9.1500', '0.00', 42, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_cuentas_temporal`
--

CREATE TABLE `detalle_cuentas_temporal` (
  `detalle_iddetalletemporal` int(11) NOT NULL,
  `cuentas_idtemporal` int(11) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(8,2) DEFAULT NULL,
  `cod_producto_venta` int(255) DEFAULT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `estado_pedido` int(1) DEFAULT '1',
  `fecha_preparar` datetime DEFAULT NULL,
  `detalle_estado_preparado` int(1) DEFAULT '1',
  `id_tipoentrega` int(11) DEFAULT NULL,
  `observacion_eliminado` varchar(255) DEFAULT NULL,
  `estado_cuenta` char(1) DEFAULT '1',
  `importe` float(11,2) DEFAULT NULL,
  `id_detalle_producto` int(11) DEFAULT '0',
  `estado_descuento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_doc_sede`
--

CREATE TABLE `detalle_doc_sede` (
  `detalle_id_sede` int(11) DEFAULT NULL,
  `detalle_id_documento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `detalle_doc_sede`
--

INSERT INTO `detalle_doc_sede` (`detalle_id_sede`, `detalle_id_documento`) VALUES
(1, 1),
(1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_empleados_sector_mesa`
--

CREATE TABLE `detalle_empleados_sector_mesa` (
  `empleado_id` int(11) NOT NULL,
  `sector_mesa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_mesa_sector_mesa`
--

CREATE TABLE `detalle_mesa_sector_mesa` (
  `sector_mesa_id` int(11) NOT NULL,
  `mesa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_producto_almacen`
--

CREATE TABLE `detalle_producto_almacen` (
  `detalle_producto` int(11) DEFAULT NULL,
  `detalle_almacen` int(11) DEFAULT NULL,
  `detalle_stock` decimal(45,4) DEFAULT '0.0000',
  `detalle_producto_almacen_id` int(11) NOT NULL,
  `detalle_stock_temporal` decimal(45,4) DEFAULT '0.0000'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `detalle_producto_almacen`
--

INSERT INTO `detalle_producto_almacen` (`detalle_producto`, `detalle_almacen`, `detalle_stock`, `detalle_producto_almacen_id`, `detalle_stock_temporal`) VALUES
(24, 1, '1845.0000', 1, '-24.0000'),
(25, 1, '2981.0000', 2, '0.0000'),
(26, 1, '0.0000', 3, '0.0000'),
(40, 1, '0.0000', 4, '0.0000'),
(40, 2, '0.0000', 5, '0.0000'),
(40, 3, '0.0000', 6, '0.0000'),
(40, 4, '0.0000', 7, '0.0000'),
(41, 1, '0.0000', 8, '0.0000'),
(41, 2, '0.0000', 9, '0.0000'),
(41, 3, '0.0000', 10, '0.0000'),
(41, 4, '0.0000', 11, '0.0000'),
(42, 1, '69.0000', 12, '0.0000'),
(42, 2, '3.0000', 13, '0.0000'),
(42, 3, '0.0000', 14, '0.0000'),
(42, 4, '0.0000', 15, '0.0000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_unidad_producto`
--

CREATE TABLE `detalle_unidad_producto` (
  `detalle_unidad_producto_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `id_unidad_medida` int(11) DEFAULT NULL,
  `detalle_unidad_producto_factor` decimal(10,2) DEFAULT NULL,
  `detalle_unidad_producto_estado` int(11) DEFAULT '1',
  `detalle_unidad_producto_fijo` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `detalle_unidad_producto`
--

INSERT INTO `detalle_unidad_producto` (`detalle_unidad_producto_id`, `producto_id`, `id_unidad_medida`, `detalle_unidad_producto_factor`, `detalle_unidad_producto_estado`, `detalle_unidad_producto_fijo`) VALUES
(23, 24, 1, '1.00', 1, 1),
(24, 24, 60, '60.00', 0, 0),
(25, 25, 1, '1.00', 1, 1),
(26, 25, 9, '100.00', 0, 0),
(27, 25, 9, '100.00', 0, 0),
(28, 25, 9, '40.00', 0, 0),
(29, 25, 63, '100.00', 0, 0),
(30, 25, 2, '4.00', 0, 0),
(31, 25, 57, '1000.00', 0, 0),
(32, 25, 5, '100.00', 0, 0),
(33, 25, 63, '10.00', 0, 0),
(34, 25, 63, '4.00', 0, 0),
(35, 26, 1, '1.00', 1, 1),
(36, 24, 3, '4.00', 1, 0),
(37, 24, 9, '12.00', 1, 0),
(38, 40, 1, '1.00', 1, 1),
(39, 40, 9, '24.00', 1, 0),
(40, 41, 1, '1.00', 1, 1),
(41, 42, 1, '1.00', 1, 1),
(42, 42, 9, '24.00', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_detalle_venta` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(8,2) DEFAULT NULL,
  `cod_producto_venta` int(255) DEFAULT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `estado_pedido` int(1) DEFAULT '1',
  `fecha_preparar` datetime DEFAULT NULL,
  `detalle_estado_preparado` int(1) DEFAULT '1',
  `id_tipoentrega` int(11) DEFAULT NULL,
  `observacion_eliminado` varchar(255) DEFAULT NULL,
  `detalle_usuario_eliminado` int(11) DEFAULT NULL,
  `detalle_venta_fecha_eliminar` datetime DEFAULT NULL,
  `detalle_venta_imprimir` int(11) DEFAULT '1',
  `detalle_venta_estadocanje` char(1) DEFAULT '0',
  `estado_descuento` varchar(2) DEFAULT 'SD',
  `valor_descuento` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id_detalle_venta`, `descripcion`, `cantidad`, `precio`, `cod_producto_venta`, `id_venta`, `observaciones`, `estado_pedido`, `fecha_preparar`, `detalle_estado_preparado`, `id_tipoentrega`, `observacion_eliminado`, `detalle_usuario_eliminado`, `detalle_venta_fecha_eliminar`, `detalle_venta_imprimir`, `detalle_venta_estadocanje`, `estado_descuento`, `valor_descuento`) VALUES
(1, '', 3, '4.00', 24, 1, NULL, 0, '2019-05-04 00:00:00', 1, 1, 'xD', 1, '2019-05-05 11:17:02', 1, '0', 'SD', '0.00'),
(2, '', 6, '4.00', 24, 2, NULL, 0, '2019-05-05 00:00:00', 1, 1, 'Se elimino porque no había nada', 1, '2019-05-05 11:28:37', 1, '0', 'SD', '0.00'),
(3, '', 3, '4.00', 24, 3, NULL, 0, '2019-05-05 00:00:00', 1, 1, 'XD', 1, '2019-05-05 11:29:55', 1, '0', 'SD', '0.00'),
(4, '', 4, '4.00', 24, 4, NULL, 0, '2019-05-05 00:00:00', 1, 1, 'xD', 1, '2019-05-05 11:30:41', 1, '0', 'SD', '0.00'),
(5, '', 4, '4.00', 24, 5, NULL, 0, '2019-05-05 00:00:00', 1, 1, 'dsd', 1, '2019-05-05 11:36:22', 1, '0', 'SD', '0.00'),
(6, '', 4, '4.00', 24, 6, NULL, 0, '2019-05-05 00:00:00', 1, 1, 'ldfjdlfj', 1, '2019-05-05 11:38:07', 1, '0', 'SD', '0.00'),
(7, '', 5, '4.00', 24, 7, NULL, 0, '2019-05-05 00:00:00', 1, 1, 'admin', 1, '2019-05-05 11:38:49', 1, '0', 'SD', '0.00'),
(8, '', 2, '4.00', 24, 8, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(9, '', 1, '4.00', 24, 9, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(10, '', 5, '4.00', 24, 10, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(11, '', 5, '4.00', 24, 11, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(12, '', 5, '4.00', 24, 12, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 0, '0', 'SD', '0.00'),
(13, '', 5, '4.00', 24, 12, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 0, '0', 'SD', '0.00'),
(14, '', 5, '4.00', 24, 12, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 0, '0', 'SD', '0.00'),
(15, '', 5, '4.00', 24, 12, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 0, '0', 'SD', '0.00'),
(16, '', 5, '4.00', 24, 12, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 0, '0', 'SD', '0.00'),
(17, '', 5, '4.00', 24, 12, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 0, '0', 'SD', '0.00'),
(18, '', 5, '4.00', 24, 12, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 0, '0', 'SD', '0.00'),
(19, '', 5, '4.00', 24, 12, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 0, '0', 'SD', '0.00'),
(20, '', 5, '4.00', 24, 12, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 0, '0', 'SD', '0.00'),
(21, '', 5, '4.00', 24, 12, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(22, '', 5, '4.00', 24, 13, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(23, '', 5, '4.00', 24, 14, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(24, '', 5, '4.00', 24, 15, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(25, '', 5, '4.00', 24, 16, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(26, '', 5, '4.00', 24, 17, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(27, '', 5, '4.00', 24, 18, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(28, '', 5, '4.00', 24, 19, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(29, '', 5, '4.00', 24, 20, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(30, '', 5, '4.00', 24, 21, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(31, '', 5, '4.00', 24, 22, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(32, '', 5, '4.00', 24, 23, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(33, '', 5, '4.00', 24, 24, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(34, '', 5, '4.00', 24, 25, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(35, '', 5, '4.00', 24, 26, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(36, '', 5, '4.00', 24, 27, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(37, '', 5, '4.00', 24, 28, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(38, '', 5, '4.00', 24, 29, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(39, '', 5, '4.00', 24, 31, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(40, '', 5, '4.00', 24, 32, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(41, '', 5, '4.00', 24, 33, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(42, '', 5, '4.00', 24, 34, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(43, '', 5, '4.00', 24, 35, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(44, '', 5, '4.00', 24, 36, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(45, '', 5, '4.00', 24, 37, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(46, '', 5, '4.00', 24, 38, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(47, '', 5, '4.00', 24, 39, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(48, '', 5, '4.00', 24, 40, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(49, '', 5, '4.00', 24, 41, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(50, '', 5, '4.00', 24, 42, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(51, '', 5, '4.00', 24, 43, NULL, 0, '2019-05-05 00:00:00', 1, 1, 'sdsd', 2, '2019-05-05 16:42:49', 1, '0', 'SD', '0.00'),
(52, '', 5, '4.00', 24, 44, NULL, 0, '2019-05-05 00:00:00', 1, 1, 'sdsd', 2, '2019-05-05 16:44:44', 1, '0', 'SD', '0.00'),
(53, '', 5, '4.00', 24, 45, NULL, 0, '2019-05-05 00:00:00', 1, 1, 'dsd', 2, '2019-05-05 16:46:26', 1, '0', 'SD', '0.00'),
(54, '', 5, '4.00', 24, 46, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 0, '0', 'SD', '0.00'),
(55, '', 5, '4.00', 24, 46, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(56, '', 5, '4.00', 24, 47, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(57, '', 5, '4.00', 24, 48, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(58, '', 5, '4.00', 24, 49, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(59, '', 5, '4.00', 24, 50, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(60, '', 5, '4.00', 24, 51, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(61, '', 5, '4.00', 24, 52, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(62, '', 5, '4.00', 24, 53, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(63, '', 5, '4.00', 24, 53, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(64, '', 5, '4.00', 24, 54, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(65, '', 5, '4.00', 24, 54, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(66, '', 5, '4.00', 24, 55, NULL, 0, '2019-05-05 00:00:00', 1, 1, 'dsdsd', 2, '2019-05-08 23:12:02', 0, '0', 'SD', '0.00'),
(67, '', 5, '4.00', 24, 55, NULL, 0, '2019-05-05 00:00:00', 1, 1, 'dsdsd', 2, '2019-05-08 23:12:02', 1, '0', 'SD', '0.00'),
(68, '', 5, '4.00', 24, 56, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 0, '0', 'SD', '0.00'),
(69, '', 5, '4.00', 24, 56, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(70, '', 5, '10.00', 27, 57, NULL, 1, '2019-05-05 00:00:00', 2, 1, NULL, NULL, NULL, 0, '0', 'SD', '0.00'),
(71, '', 5, '10.00', 27, 57, NULL, 1, '2019-05-05 00:00:00', 2, 1, NULL, NULL, NULL, 0, '0', 'SD', '0.00'),
(72, '', 5, '10.00', 27, 57, NULL, 1, '2019-05-05 00:00:00', 2, 1, NULL, NULL, NULL, 0, '0', 'SD', '0.00'),
(73, '', 5, '10.00', 27, 57, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(74, '', 10, '4.00', 24, 58, NULL, 0, '2019-05-05 00:00:00', 1, 1, 'Se elimino porque se agoto', 2, '2019-05-09 14:41:51', 1, '0', 'SD', '0.00'),
(75, '', 5, '10.00', 27, 59, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(76, '', 10, '10.00', 27, 67, NULL, 0, '2019-05-05 00:00:00', 1, 1, 'dsds', 2, '2019-05-09 14:42:03', 1, '0', 'SD', '0.00'),
(77, '', 10, '10.00', 27, 68, NULL, 0, '2019-05-05 00:00:00', 1, 1, 'dsdsd', 2, '2019-05-05 22:25:08', 1, '0', 'SD', '0.00'),
(78, '', 10, '10.00', 27, 69, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(79, '', 4, '4.00', 24, 69, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(80, '', 10, '10.00', 27, 70, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(81, '', 5, '4.00', 24, 70, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(82, '', 10, '10.00', 27, 71, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(83, '', 10, '4.00', 24, 71, NULL, 1, '2019-05-05 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(84, '', 90, '10.00', 27, 72, NULL, 1, '2019-05-06 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(85, '', 100, '25.00', 25, 72, NULL, 1, '2019-05-06 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(86, '', 100, '4.00', 24, 72, NULL, 1, '2019-05-06 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(87, '', 6, '1.00', 37, 76, NULL, 0, '2019-05-07 00:00:00', 1, 1, 'dsd', 2, '2019-05-09 14:42:22', 1, '0', 'SD', '0.00'),
(88, '', 1, '4.00', 24, 76, NULL, 0, '2019-05-07 00:00:00', 1, 1, 'dsd', 2, '2019-05-09 14:42:22', 1, '0', 'SD', '0.00'),
(89, '', 5, '1.00', 37, 77, NULL, 1, '2019-05-07 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(90, '', 62, '1.00', 37, 78, NULL, 1, '2019-05-08 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(91, '', 3, '1.00', 38, 79, NULL, 1, '2019-05-09 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(92, '', 4, '1.00', 37, 79, NULL, 1, '2019-05-09 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(93, '', 5, '4.00', 24, 79, NULL, 1, '2019-05-09 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(94, '', 3, '4.00', 24, 80, NULL, 1, '2019-05-09 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(95, '', 4, '1.00', 37, 80, NULL, 1, '2019-05-09 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(96, '', 4, '25.00', 25, 81, NULL, 1, '2019-05-09 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(97, '', 4, '4.00', 24, 81, NULL, 1, '2019-05-09 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(98, '', 3, '4.00', 24, 82, NULL, 1, '2019-05-09 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(99, '', 3, '4.00', 24, 83, NULL, 1, '2019-05-09 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(100, '', 2, '25.00', 25, 83, NULL, 1, '2019-05-09 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(101, '', 20, '25.00', 25, 84, NULL, 1, '2019-05-09 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(102, '', 16, '4.00', 24, 84, NULL, 1, '2019-05-09 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(103, '', 5, '1.00', 38, 85, NULL, 1, '2019-05-09 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(104, '', 4, '2.00', 42, 86, NULL, 0, '2019-05-09 00:00:00', 1, 1, 'fdf', 2, '2019-05-10 11:03:28', 1, '0', 'SD', '0.00'),
(105, '', 3, '25.00', 25, 86, NULL, 0, '2019-05-09 00:00:00', 1, 1, 'fdf', 2, '2019-05-10 11:03:28', 1, '0', 'SD', '0.00'),
(106, '', 1, '2.00', 42, 87, NULL, 1, '2019-05-09 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(107, '', 1, '4.00', 24, 87, NULL, 1, '2019-05-09 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(108, '', 2, '2.00', 42, 88, NULL, 1, '2019-05-10 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(109, '', 3, '25.00', 25, 88, NULL, 1, '2019-05-10 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(110, '', 5, '4.00', 24, 90, NULL, 1, '2019-05-10 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(111, '', 5, '4.00', 24, 96, NULL, 1, '2019-05-10 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(112, '', 5, '4.00', 24, 97, NULL, 1, '2019-05-10 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(113, '', 5, '4.00', 24, 98, NULL, 1, '2019-05-10 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(114, '', 5, '4.00', 24, 99, NULL, 1, '2019-05-10 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(115, '', 5, '4.00', 24, 100, NULL, 1, '2019-05-10 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(116, '', 10, '4.00', 24, 101, NULL, 1, '2019-05-10 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00'),
(117, '', 10, '4.00', 24, 102, NULL, 1, '2019-05-10 00:00:00', 1, 1, NULL, NULL, NULL, 1, '0', 'SD', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito`
--

CREATE TABLE `distrito` (
  `id_distrito` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `id_provincia` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documento`
--

CREATE TABLE `documento` (
  `id_documento` int(1) NOT NULL,
  `doc_serie` char(4) DEFAULT NULL,
  `estado` char(1) DEFAULT '1',
  `doc_correlativo` int(11) DEFAULT NULL,
  `id_empresa` varchar(11) DEFAULT NULL,
  `id_tipodocumento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `documento`
--

INSERT INTO `documento` (`id_documento`, `doc_serie`, `estado`, `doc_correlativo`, `id_empresa`, `id_tipodocumento`) VALUES
(1, '001', '1', 76, '10709965293', 1),
(5, '001', '1', 1, '10709965293', 5),
(7, '002', '1', 1, '10709965293', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `empleado_id` int(11) NOT NULL,
  `empleado_nombres` varchar(100) NOT NULL,
  `empleado_apellidos` varchar(100) DEFAULT NULL,
  `empleado_dni` varchar(8) DEFAULT NULL,
  `empleado_direccion` varchar(50) DEFAULT NULL,
  `empleado_email` varchar(50) DEFAULT NULL,
  `empleado_telefono` varchar(30) DEFAULT NULL,
  `perfil_id` int(11) DEFAULT NULL,
  `empleado_usuario` varchar(50) DEFAULT NULL,
  `empleado_clave` varchar(200) DEFAULT NULL,
  `estado` int(1) DEFAULT '1',
  `empleado_nombre_completo` varchar(255) DEFAULT NULL,
  `empleado_foto_perfil` varchar(255) DEFAULT NULL,
  `empleado_fecha_nacimiento` date DEFAULT NULL,
  `empleado_fecha_ingreso` date DEFAULT NULL,
  `empleado_fecha_salida` date DEFAULT NULL,
  `empleado_sueldoplanilla` decimal(10,2) DEFAULT NULL,
  `empleado_sueldoreal` decimal(10,2) DEFAULT NULL,
  `empleado_fondo_pension` decimal(10,2) DEFAULT NULL,
  `id_fondo_pension` int(11) DEFAULT NULL,
  `empleado_cci` varchar(20) DEFAULT NULL,
  `empleado_numbanco` varchar(14) DEFAULT NULL,
  `empleado_idbanco` int(11) DEFAULT NULL,
  `empleado_sexo` varchar(255) DEFAULT 'm',
  `empleado_idsalud` int(11) DEFAULT NULL,
  `empleado_horario_entrada_man` time DEFAULT NULL,
  `empleado_horario_salida_man` time DEFAULT NULL,
  `empleado_horario_entrada_tar` time DEFAULT NULL,
  `empleado_horario_salida_tar` time DEFAULT NULL,
  `empleado_inicio_contrato` date DEFAULT NULL,
  `empleado_fecha_inicio` date DEFAULT NULL,
  `empleado_estado_planilla` int(1) DEFAULT '0',
  `empresa_sede` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`empleado_id`, `empleado_nombres`, `empleado_apellidos`, `empleado_dni`, `empleado_direccion`, `empleado_email`, `empleado_telefono`, `perfil_id`, `empleado_usuario`, `empleado_clave`, `estado`, `empleado_nombre_completo`, `empleado_foto_perfil`, `empleado_fecha_nacimiento`, `empleado_fecha_ingreso`, `empleado_fecha_salida`, `empleado_sueldoplanilla`, `empleado_sueldoreal`, `empleado_fondo_pension`, `id_fondo_pension`, `empleado_cci`, `empleado_numbanco`, `empleado_idbanco`, `empleado_sexo`, `empleado_idsalud`, `empleado_horario_entrada_man`, `empleado_horario_salida_man`, `empleado_horario_entrada_tar`, `empleado_horario_salida_tar`, `empleado_inicio_contrato`, `empleado_fecha_inicio`, `empleado_estado_planilla`, `empresa_sede`) VALUES
(0, 'SIN MOZO', 'SIN MOZO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL),
(1, 'José Martin', 'Barrutia Trinidad', '70996529', NULL, NULL, NULL, 12, 'admin', '123', 1, ' ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(2, 'Cajero', 'Cajero', '70996528', 'José Pardo 350', 'josmar08.31059@gmail.com', '971555752', 5, 'cajero', '123', 1, 'José Martin Barrutia Trinidad', NULL, '1996-04-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'm', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1),
(3, 'Jimmy', 'Carbajal', '71555252', 'Elvisdsdjs', 'jdfdfj@gmail.com', '998552245', 2, 'mozo', '12345678', 1, 'Jimmy Carbajal', NULL, '1998-05-21', NULL, NULL, '0.00', '0.00', NULL, NULL, NULL, NULL, NULL, 'm', NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-07', 0, 1),
(4, 'sdsdd', 'dsdsdfdf', '70996529', 'sdsdsd', 'j@gmail.com', '971555752', 6, 'xxx', '12345678', 0, 'sdsdd dsdsdfdf', 'defaut.jpg', '1993-04-21', NULL, NULL, '930.00', '930.00', NULL, NULL, NULL, NULL, NULL, 'm', NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-09', 0, 1),
(5, 'Julymarth panduro aching', ' panduro aching', '71228695', 'psj. humberto pinedo N° 162', 'Julymarthpanduro@gmail.com', '955175084', 2, 'mozo1', '12345678', 1, 'Julymarth panduro aching  panduro aching', 'defaut.jpg', '1998-09-16', NULL, NULL, '930.00', '1500.00', NULL, NULL, NULL, NULL, NULL, 'm', NULL, NULL, NULL, NULL, NULL, NULL, '2019-05-09', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_adelanto`
--

CREATE TABLE `empleado_adelanto` (
  `empleado_adelanto_id` int(11) NOT NULL,
  `empleado_adelanto_descripcion` varchar(255) DEFAULT NULL,
  `empleado_adelanto_sueldo` decimal(10,2) DEFAULT NULL,
  `empleado_adelanto_fecha` date DEFAULT NULL,
  `empleado_adelanto_estado` int(11) DEFAULT '1',
  `empleado_id` int(11) DEFAULT NULL,
  `id_movimiento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_asistencia`
--

CREATE TABLE `empleado_asistencia` (
  `empleado_asistencia_id` int(11) NOT NULL,
  `empleado_asistencia_fecha_hora` datetime DEFAULT NULL,
  `empleado_asistencia_estado` int(11) DEFAULT '1',
  `empleado_id` int(11) DEFAULT NULL,
  `empleado_asistencia_fecha` date DEFAULT NULL,
  `empleado_asistencia_hora` time DEFAULT NULL,
  `empleado_asistencia_horario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_descuento`
--

CREATE TABLE `empleado_descuento` (
  `empleado_descuento_id` int(11) NOT NULL,
  `empleado_descuento_descripcion` varchar(255) DEFAULT NULL,
  `motivo_descuento_id` int(11) DEFAULT '1',
  `empleado_descuento_monto` decimal(10,2) DEFAULT NULL,
  `empleado_descuento_fecha` date DEFAULT NULL,
  `empleado_descuento_estado` int(11) DEFAULT '1',
  `empleado_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `empresa_ruc` varchar(11) NOT NULL,
  `empresa_razon_social` varchar(255) DEFAULT NULL,
  `empresa_direccion` varchar(255) DEFAULT NULL,
  `empresa_telefono` varchar(255) DEFAULT NULL,
  `empresa_correo` varchar(255) DEFAULT NULL,
  `empresa_estado` int(11) DEFAULT '1',
  `empresa_icono` text,
  `empresa_abreviatura` varchar(255) DEFAULT NULL,
  `empresa_nombre_comercial` varchar(255) DEFAULT NULL,
  `empresa_usuario_sol` varchar(255) DEFAULT NULL,
  `empresa_clave_sol` varchar(255) DEFAULT NULL,
  `empreasa_firma_digital` text,
  `empresa_estado_activo` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`empresa_ruc`, `empresa_razon_social`, `empresa_direccion`, `empresa_telefono`, `empresa_correo`, `empresa_estado`, `empresa_icono`, `empresa_abreviatura`, `empresa_nombre_comercial`, `empresa_usuario_sol`, `empresa_clave_sol`, `empreasa_firma_digital`, `empresa_estado_activo`) VALUES
('10709965293', 'LA SELVATIÑA', 'Josd', '960152229', 'josmar08.31059@gmail.com', 1, 'logo-icon.png', NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondo_pension`
--

CREATE TABLE `fondo_pension` (
  `id_fondo_pension` int(11) NOT NULL,
  `fondo_pension_descripcion` varchar(255) DEFAULT NULL,
  `fondo_pension_porcentaje` decimal(10,2) DEFAULT NULL,
  `fondo_pension_estado` char(1) DEFAULT '1',
  `fondo_pension_idtiporetencion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondo_salud`
--

CREATE TABLE `fondo_salud` (
  `fondosalud_idsalud` int(11) NOT NULL,
  `fondosalud_descripcion` varchar(150) DEFAULT NULL,
  `fondosalud_estado` char(1) DEFAULT NULL,
  `fondosalud_porcentaje` float(11,2) DEFAULT NULL,
  `fondosalud_monto` float(11,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formapago`
--

CREATE TABLE `formapago` (
  `for_id` int(11) NOT NULL,
  `for_descripcion` varchar(100) DEFAULT NULL,
  `for_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `formapago`
--

INSERT INTO `formapago` (`for_id`, `for_descripcion`, `for_estado`) VALUES
(1, 'Efectivo', 1),
(2, 'POS VISA', 1),
(3, 'VISA', 1),
(4, 'CHECKE', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex_producto`
--

CREATE TABLE `kardex_producto` (
  `kardex_id` int(11) NOT NULL,
  `detalle_producto_almacen_id` int(11) DEFAULT NULL,
  `kardex_descripcion` varchar(255) DEFAULT NULL,
  `kardex_fecha` datetime DEFAULT NULL,
  `kardex_tipo` int(11) DEFAULT NULL,
  `kardex_serie_comprobante` varchar(255) DEFAULT NULL,
  `kardex_correlativo_comprobante` varchar(255) DEFAULT NULL,
  `kardex_serie_correlativo_comprobante` varchar(255) DEFAULT NULL,
  `kardex_estado` int(11) DEFAULT NULL,
  `kardex_cantidad_unitaria` decimal(16,4) DEFAULT NULL,
  `kardex_precio_unitaria` decimal(16,4) DEFAULT NULL,
  `kardex_subtotal_unitaria` decimal(16,4) DEFAULT NULL,
  `kardex_cantidad_total` decimal(16,4) DEFAULT NULL,
  `kardex_precio_total` decimal(16,4) DEFAULT NULL,
  `kardex_subtotal_total` decimal(16,4) DEFAULT NULL,
  `kardex_tipo_comprobante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `kardex_producto`
--

INSERT INTO `kardex_producto` (`kardex_id`, `detalle_producto_almacen_id`, `kardex_descripcion`, `kardex_fecha`, `kardex_tipo`, `kardex_serie_comprobante`, `kardex_correlativo_comprobante`, `kardex_serie_correlativo_comprobante`, `kardex_estado`, `kardex_cantidad_unitaria`, `kardex_precio_unitaria`, `kardex_subtotal_unitaria`, `kardex_cantidad_total`, `kardex_precio_total`, `kardex_subtotal_total`, `kardex_tipo_comprobante`) VALUES
(4, 1, 'Inventario Inicial', '2019-05-10 10:58:58', 1, '001', '72', '001-72', NULL, '10.0000', '4.0000', '40.0000', '10.0000', '4.0000', '40.0000', 1),
(5, 1, 'VENTA DE PRODUCTO', '2019-05-10 10:59:17', 2, '001', '73', '001-73', NULL, '10.0000', '4.0000', '40.0000', '0.0000', '4.0000', '0.0000', 1),
(6, 12, 'Inventario Inicial', '2019-05-10 11:01:57', 1, '001', '74', '001-74', NULL, '2.0000', '2.0000', '4.0000', '2.0000', '2.0000', '4.0000', 1),
(7, 2, 'Inventario Inicial', '2019-05-10 11:01:57', 1, '001', '74', '001-74', NULL, '3.0000', '25.0000', '75.0000', '3.0000', '25.0000', '75.0000', 1),
(8, 1, 'VENTA DE PRODUCTO', '2019-05-10 11:02:31', 2, '001', '75', '001-75', NULL, '5.0000', '4.0000', '20.0000', '-5.0000', '4.0000', '-20.0000', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugar_mesa`
--

CREATE TABLE `lugar_mesa` (
  `lugarmesa_id` int(11) NOT NULL,
  `lugarmesa_descripcion` varchar(100) DEFAULT NULL,
  `lugarmesa_estado` char(1) DEFAULT '1',
  `color` varchar(10) DEFAULT NULL,
  `id_sede` int(11) DEFAULT NULL,
  `cu_tabla` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `lugar_mesa`
--

INSERT INTO `lugar_mesa` (`lugarmesa_id`, `lugarmesa_descripcion`, `lugarmesa_estado`, `color`, `id_sede`, `cu_tabla`) VALUES
(1, 'Piso 1', '1', NULL, 1, NULL),
(2, 'zona 2', '1', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `marca_id` int(11) NOT NULL,
  `marca_descripcion` varchar(255) DEFAULT NULL,
  `marca_estado` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`marca_id`, `marca_descripcion`, `marca_estado`) VALUES
(1, 'GLORIA', 1),
(2, 'COCACOLA', 1),
(3, 'SUBLIME', 1),
(4, 'SMHDGUS', 1),
(5, 'IUDFHGIUFD', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE `mesa` (
  `mesa_id` int(11) NOT NULL,
  `mesa_numero` int(11) DEFAULT NULL,
  `mesa_estado` char(1) DEFAULT NULL COMMENT '0=Inhabilitado;1=Habilitado',
  `mesa_id_lugar` int(11) DEFAULT NULL,
  `mesa_disponible` char(1) DEFAULT '0' COMMENT '0=Ocupado;1=Disponible;2=Reservado',
  `mesa_empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `mesa`
--

INSERT INTO `mesa` (`mesa_id`, `mesa_numero`, `mesa_estado`, `mesa_id_lugar`, `mesa_disponible`, `mesa_empleado`) VALUES
(0, 0, NULL, NULL, '0', NULL),
(6, 1, '1', 1, '0', 2),
(7, 2, '1', 1, '0', 1),
(8, 3, '1', 1, '0', 2),
(9, 4, '1', 1, '0', 2),
(10, 5, '1', 1, '1', 2),
(11, 6, '1', 1, '0', 2),
(12, 7, '1', 1, '0', NULL),
(13, 8, '1', 1, '0', NULL),
(14, 9, '1', 1, '0', NULL),
(15, 10, '1', 1, '0', NULL),
(16, 11, '1', 1, '0', NULL),
(17, 12, '1', 1, '0', NULL),
(18, 13, '1', 1, '0', NULL),
(19, 14, '1', 1, '0', NULL),
(20, 15, '1', 1, '0', NULL),
(21, 16, '1', 1, '0', NULL),
(22, 17, '1', 1, '0', NULL),
(23, 18, '1', 1, '0', NULL),
(24, 19, '1', 1, '0', NULL),
(25, 20, '1', 1, '0', NULL),
(26, 21, '1', 1, '0', NULL),
(27, 22, '1', 1, '0', NULL),
(28, 23, '1', 1, '0', NULL),
(29, 24, '1', 1, '0', NULL),
(30, 25, '1', 1, '0', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `modulo_id` int(11) NOT NULL,
  `modulo_nombre` varchar(50) DEFAULT NULL,
  `modulo_icono` varchar(50) DEFAULT NULL,
  `modulo_url` varchar(50) DEFAULT NULL,
  `modulo_padre` int(11) DEFAULT NULL,
  `estado` int(1) DEFAULT '1',
  `modulo_orden` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`modulo_id`, `modulo_nombre`, `modulo_icono`, `modulo_url`, `modulo_padre`, `estado`, `modulo_orden`) VALUES
(1, 'MODULO PADRE', '#', '#', 1, 1, 1),
(2, 'Seguridad', 'fa fa-key', '#', 1, 1, 6),
(3, 'Permisos', ' ', 'Permisos', 2, 1, NULL),
(4, 'Perfiles', ' ', 'Perfiles', 2, 1, 4),
(5, 'Modulos', ' ', 'Modulo', 2, 1, 6),
(6, 'Empresa', '.', 'empresa', 2, 0, NULL),
(7, 'Almacen', 'fa fa-inbox', '#', 1, 1, NULL),
(8, 'R. de Almacen', ' ', 'almacen', 7, 1, NULL),
(9, 'Mantenimiento', 'fa fa-cog', '#', 1, 1, NULL),
(10, 'Categoria Producto', ' ', 'C_producto', 9, 1, NULL),
(11, 'Marca Producto', ' ', 'Marca_producto', 9, 1, NULL),
(12, 'Tipo Documento', ' ', 'Tipo_documento', 9, 1, NULL),
(13, 'Tipo Moneda', ' ', 'Tipo_moneda', 9, 1, NULL),
(14, 'Unidad Medida', ' ', 'Unidad_medida', 9, 1, NULL),
(15, 'Compras', 'fa fa-cart-arrow-down ', '#', 1, 1, NULL),
(16, 'Registrar Producto', ' ', 'R_producto', 15, 1, NULL),
(17, 'Ubicación Mesa', NULL, 'Ubicacionmesa', 9, 1, NULL),
(18, 'Proveedor', '.', 'Proveedor', 15, 1, NULL),
(19, 'Registro compra', '.', 'Compra', 15, 1, NULL),
(20, 'Mesas', ' ', 'Mesas', 9, 1, NULL),
(21, 'Ventas', 'fa fa-shopping-bag', '#', 1, 1, NULL),
(22, 'Venta Mesa', ' ', 'Venta_mesa', 21, 1, NULL),
(23, 'Caja', 'fa fa-cc', '#', 1, 1, NULL),
(24, 'Sesión Caja', ' ', 'Sesion_caja', 23, 1, NULL),
(25, 'Registro Comprobantes', ' ', 'Registro_comprobante', 9, 1, NULL),
(26, 'Asignar Comprobantes', ' ', 'Asignar_comprobantes', 9, 1, NULL),
(27, 'Pedido', ' ', 'Pedido', 23, 1, NULL),
(28, 'Empleados', 'fa fa-user-circle', '#', 1, 1, NULL),
(29, 'Empleados', ' ', 'Usuario', 28, 1, NULL),
(30, 'Concepto', ' ', 'Concepto', 23, 1, NULL),
(31, 'Gestión de Movimientos', ' ', 'movimiento', 23, 1, NULL),
(32, 'Cobro de Venta al Credito', ' ', 'Venta_credito', 21, 1, NULL),
(33, 'Reportes', 'fa fa-file-pdf', '#', 1, 1, NULL),
(34, 'Rep. Grafico Ventas', ' ', 'Reporte_venta', 33, 1, NULL),
(35, 'Gráfico de VentaxEmpleados', ' ', 'Venta_empleado', 33, 1, NULL),
(36, 'Platos Vendidos', ' ', 'R_plato_vendido', 33, 1, NULL),
(37, 'Productos Cancelados', ' ', 'R_roducto_cancelado', 33, 1, NULL),
(38, 'Clientes', ' ', 'Clientes', 21, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `monedas`
--

CREATE TABLE `monedas` (
  `moneda_id` int(11) NOT NULL,
  `moneda_descripcion` varchar(20) DEFAULT NULL,
  `moneda_simbolo` varchar(5) DEFAULT NULL,
  `moneda_estado` char(1) DEFAULT '1',
  `moneda_descripcion_contabilidad` varchar(255) DEFAULT NULL,
  `moneda_simbolo_contabilidad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `monedas`
--

INSERT INTO `monedas` (`moneda_id`, `moneda_descripcion`, `moneda_simbolo`, `moneda_estado`, `moneda_descripcion_contabilidad`, `moneda_simbolo_contabilidad`) VALUES
(1, 'Nuevo Sol.', 'S/', '1', NULL, NULL),
(2, 'Dolares', '$', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivo_contrato`
--

CREATE TABLE `motivo_contrato` (
  `motivo_contrato_id` int(11) NOT NULL,
  `motivo_contrato_descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivo_descuento`
--

CREATE TABLE `motivo_descuento` (
  `motivo_descuento_id` int(11) NOT NULL,
  `motivo_descuento_descripcion` varchar(255) DEFAULT NULL,
  `motivo_descuento_estado` int(11) DEFAULT '1',
  `id_sede` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento`
--

CREATE TABLE `movimiento` (
  `mov_id` int(11) NOT NULL,
  `id_sesion_caja` int(11) NOT NULL,
  `mov_formapago` int(11) NOT NULL,
  `mov_concepto` int(11) NOT NULL,
  `mov_fecha` date DEFAULT NULL,
  `mov_monto` decimal(10,2) DEFAULT NULL,
  `mov_estado` int(11) DEFAULT '1',
  `mov_descripcion` varchar(200) DEFAULT NULL,
  `mov_hora` time DEFAULT NULL,
  `id_tipo_comprobante` int(11) DEFAULT NULL,
  `tipo_comprobante_descripcion` varchar(255) DEFAULT NULL,
  `mov_fecha_tiempo` datetime DEFAULT NULL,
  `mov_igv` int(11) DEFAULT NULL,
  `mov_documento` varchar(11) DEFAULT NULL,
  `mov_razonsocial` varchar(100) DEFAULT NULL,
  `mov_monto_cambio` decimal(10,2) DEFAULT NULL,
  `moneda_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `movimiento`
--

INSERT INTO `movimiento` (`mov_id`, `id_sesion_caja`, `mov_formapago`, `mov_concepto`, `mov_fecha`, `mov_monto`, `mov_estado`, `mov_descripcion`, `mov_hora`, `id_tipo_comprobante`, `tipo_comprobante_descripcion`, `mov_fecha_tiempo`, `mov_igv`, `mov_documento`, `mov_razonsocial`, `mov_monto_cambio`, `moneda_id`) VALUES
(1, 5, 1, 1, '2019-05-05', '8.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '12:40:07', 1, '001-2', '2019-05-05 12:40:07', NULL, NULL, NULL, NULL, 1),
(2, 5, 1, 1, '2019-05-05', '4.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '12:41:25', 1, '001-3', '2019-05-05 12:41:25', NULL, NULL, NULL, NULL, 1),
(3, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '15:25:00', 1, '001-4', '2019-05-05 15:25:00', NULL, NULL, NULL, NULL, 1),
(4, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '15:35:22', 1, '001-5', '2019-05-05 15:35:22', NULL, NULL, NULL, NULL, 1),
(5, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '15:35:52', 1, '001-6', '2019-05-05 15:35:52', NULL, NULL, NULL, NULL, 1),
(6, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '15:37:55', 1, '001-7', '2019-05-05 15:37:55', NULL, NULL, NULL, NULL, 1),
(7, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '15:38:26', 1, '001-8', '2019-05-05 15:38:26', NULL, NULL, NULL, NULL, 1),
(8, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '15:39:14', 1, '001-9', '2019-05-05 15:39:14', NULL, NULL, NULL, NULL, 1),
(9, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '15:53:35', 1, '001-10', '2019-05-05 15:53:35', NULL, NULL, NULL, NULL, 1),
(10, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:00:38', 1, '001-11', '2019-05-05 16:00:38', NULL, NULL, NULL, NULL, 1),
(11, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:01:45', 1, '001-12', '2019-05-05 16:01:45', NULL, NULL, NULL, NULL, 1),
(12, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:02:33', 1, '001-13', '2019-05-05 16:02:33', NULL, NULL, NULL, NULL, 1),
(13, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:03:25', 1, '001-14', '2019-05-05 16:03:25', NULL, NULL, NULL, NULL, 1),
(14, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:03:52', 1, '001-15', '2019-05-05 16:03:52', NULL, NULL, NULL, NULL, 1),
(15, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:05:09', 1, '001-16', '2019-05-05 16:05:09', NULL, NULL, NULL, NULL, 1),
(16, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:06:45', 1, '001-17', '2019-05-05 16:06:45', NULL, NULL, NULL, NULL, 1),
(17, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:07:23', 1, '001-18', '2019-05-05 16:07:23', NULL, NULL, NULL, NULL, 1),
(18, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:08:18', 1, '001-19', '2019-05-05 16:08:18', NULL, NULL, NULL, NULL, 1),
(19, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:09:39', 1, '001-20', '2019-05-05 16:09:39', NULL, NULL, NULL, NULL, 1),
(20, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:10:03', 1, '001-21', '2019-05-05 16:10:03', NULL, NULL, NULL, NULL, 1),
(21, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:12:55', 1, '001-22', '2019-05-05 16:12:55', NULL, NULL, NULL, NULL, 1),
(22, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:21:26', 1, '001-23', '2019-05-05 16:21:26', NULL, NULL, NULL, NULL, 1),
(23, 5, 1, 1, '2019-05-05', '200.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:22:31', 1, '001-24', '2019-05-05 16:22:31', NULL, NULL, NULL, NULL, 1),
(24, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:22:57', 1, '001-25', '2019-05-05 16:22:57', NULL, NULL, NULL, NULL, 1),
(25, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:23:41', 1, '001-26', '2019-05-05 16:23:41', NULL, NULL, NULL, NULL, 1),
(26, 5, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:24:44', 1, '001-27', '2019-05-05 16:24:44', NULL, NULL, NULL, NULL, 1),
(27, 7, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:25:49', 1, '001-28', '2019-05-05 16:25:49', NULL, NULL, NULL, NULL, 1),
(28, 7, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:27:07', 1, '001-29', '2019-05-05 16:27:07', NULL, NULL, NULL, NULL, 1),
(29, 7, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:30:20', 1, '001-30', '2019-05-05 16:30:20', NULL, NULL, NULL, NULL, 1),
(30, 7, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:30:35', 1, '001-31', '2019-05-05 16:30:35', NULL, NULL, NULL, NULL, 1),
(31, 7, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:41:22', 1, '001-32', '2019-05-05 16:41:22', NULL, NULL, NULL, NULL, 1),
(32, 7, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:41:26', 1, '001-33', '2019-05-05 16:41:26', NULL, NULL, NULL, NULL, 1),
(33, 7, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:41:30', 1, '001-34', '2019-05-05 16:41:30', NULL, NULL, NULL, NULL, 1),
(34, 7, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:41:59', 1, '001-35', '2019-05-05 16:41:59', NULL, NULL, NULL, NULL, 1),
(35, 7, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:42:20', 1, '001-36', '2019-05-05 16:42:20', NULL, NULL, NULL, NULL, 1),
(36, 7, 1, 1, '2019-05-05', '40.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '16:59:53', 1, '001-37', '2019-05-05 16:59:53', NULL, NULL, NULL, NULL, 1),
(37, 7, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '17:03:23', 1, '001-38', '2019-05-05 17:03:23', NULL, NULL, NULL, NULL, 1),
(38, 7, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '17:04:16', 1, '001-39', '2019-05-05 17:04:16', NULL, NULL, NULL, NULL, 1),
(39, 7, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '17:05:03', 1, '001-40', '2019-05-05 17:05:03', NULL, NULL, NULL, NULL, 1),
(40, 7, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '17:05:51', 1, '001-41', '2019-05-05 17:05:51', NULL, NULL, NULL, NULL, 1),
(41, 7, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '17:09:17', 1, '001-42', '2019-05-05 17:09:17', NULL, NULL, NULL, NULL, 1),
(42, 7, 1, 1, '2019-05-05', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '17:11:52', 1, '001-43', '2019-05-05 17:11:52', NULL, NULL, NULL, NULL, 1),
(43, 7, 1, 1, '2019-05-05', '40.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '17:12:48', 1, '001-44', '2019-05-05 17:12:48', NULL, NULL, NULL, NULL, 1),
(44, 7, 1, 1, '2019-05-05', '40.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '17:16:38', 1, '001-45', '2019-05-05 17:16:38', NULL, NULL, NULL, NULL, 1),
(45, 7, 1, 1, '2019-05-05', '40.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '17:18:45', 1, '001-46', '2019-05-05 17:18:45', NULL, NULL, NULL, NULL, 1),
(46, 11, 1, 1, '2019-05-05', '50.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '22:11:14', 1, '001-47', '2019-05-05 22:11:14', NULL, NULL, NULL, NULL, 1),
(47, 11, 1, 1, '2019-05-05', '116.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '22:30:49', 1, '001-48', '2019-05-05 22:30:49', NULL, NULL, NULL, NULL, 1),
(48, 11, 1, 1, '2019-05-05', '120.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '22:31:37', 1, '001-49', '2019-05-05 22:31:37', NULL, NULL, NULL, NULL, 1),
(49, 11, 1, 1, '2019-05-05', '140.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '22:32:33', 1, '001-50', '2019-05-05 22:32:33', NULL, NULL, NULL, NULL, 1),
(50, 13, 1, 2, '2019-05-06', '0.00', 1, 'PAGO DE COMPRA', '09:39:37', NULL, '-', '2019-05-06 09:39:37', NULL, NULL, NULL, NULL, NULL),
(51, 13, 1, 2, '2019-05-06', '90.00', 1, 'PAGO DE COMPRA', '09:44:24', NULL, '-', '2019-05-06 09:44:24', NULL, NULL, NULL, NULL, NULL),
(52, 13, 1, 2, '2019-05-06', '10.00', 1, 'PAGO DE COMPRA', '10:11:34', 0, 'F001-001', '2019-05-06 10:11:34', 0, NULL, NULL, '1.00', 1),
(53, 13, 1, 1, '2019-05-06', '3800.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '10:16:14', 1, '001-51', '2019-05-06 10:16:14', NULL, NULL, NULL, NULL, 1),
(54, 13, 1, 2, '2019-05-06', '1000.00', 1, 'PAGO DE COMPRA', '10:17:41', 1, 'F001-0019', '2019-05-06 10:17:41', 0, NULL, NULL, '1.00', 1),
(55, 15, 1, 4, '2019-05-07', '1500.00', 1, 'Cobro', '12:58:46', 1, '001-52', '2019-05-07 12:58:46', NULL, NULL, NULL, '3.31', 1),
(56, 15, 1, 4, '2019-05-07', '1500.00', 1, 'Cobro', '13:01:03', 1, '001-52', '2019-05-07 13:01:03', NULL, NULL, NULL, '3.31', 1),
(57, 15, 1, 4, '2019-05-07', '1500.00', 1, 'Cobro', '13:03:30', 1, '001-52', '2019-05-07 13:03:30', NULL, NULL, NULL, '3.31', 1),
(58, 15, 2, 4, '2019-05-07', '2000.00', 1, 'cxcxc', '13:08:40', 1, '001-52', '2019-05-07 13:08:40', 1, NULL, NULL, '3.31', 1),
(59, 16, 2, 4, '2019-05-07', '2000.00', 1, 'cxcxc', '13:09:12', 1, '001-52', '2019-05-07 13:09:12', 1, NULL, NULL, '3.31', 1),
(60, 15, 1, 1, '2019-05-07', '5.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '13:21:11', 1, '001-52', '2019-05-07 13:21:11', NULL, NULL, NULL, NULL, 1),
(61, 19, 1, 1, '2019-05-08', '15.50', 1, 'PAGO DE VENTA DE CREDITO', '22:58:06', 1, '001-53', '2019-05-08 22:58:06', NULL, '70996529', 'José Martin Barrutia Trinidad', NULL, 1),
(62, 19, 1, 1, '2019-05-08', '15.50', 1, 'PAGO DE VENTA DE CREDITO', '22:58:49', 1, '001-53', '2019-05-08 22:58:49', NULL, NULL, NULL, NULL, 1),
(63, 19, 1, 1, '2019-05-08', '15.50', 1, 'PAGO DE VENTA DE CREDITO', '22:59:39', 1, '001-53', '2019-05-08 22:59:39', NULL, '70996529', 'José Martin Barrutia Trinidad', NULL, 1),
(64, 19, 1, 1, '2019-05-08', '15.50', 1, 'PAGO DE VENTA DE CREDITO', '23:00:39', 1, '001-53', '2019-05-08 23:00:39', NULL, '70996529', 'José Martin Barrutia Trinidad', NULL, 1),
(65, 21, 1, 1, '2019-05-09', '200.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '14:33:10', 1, '001-54', '2019-05-09 14:33:10', NULL, NULL, NULL, NULL, 1),
(66, 21, 1, 1, '2019-05-09', '16.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '14:39:31', 1, '001-55', '2019-05-09 14:39:31', NULL, NULL, NULL, NULL, 1),
(67, 21, 1, 1, '2019-05-09', '27.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '14:39:54', 1, '001-56', '2019-05-09 14:39:54', NULL, NULL, NULL, NULL, 1),
(68, 23, 1, 1, '2019-05-09', '116.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '14:51:42', 1, '001-57', '2019-05-09 14:51:42', NULL, NULL, NULL, NULL, 1),
(69, 23, 1, 1, '2019-05-09', '12.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '14:52:23', 1, '001-58', '2019-05-09 14:52:23', NULL, NULL, NULL, NULL, 1),
(70, 23, 1, 1, '2019-05-09', '62.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '14:53:48', 1, '001-59', '2019-05-09 14:53:48', NULL, NULL, NULL, NULL, 1),
(71, 23, 1, 6, '2019-05-09', '500.00', 1, 'un bufet de postres para 300 personas- se cobro a señora eloyne.', '20:45:41', 5, '001-1', '2019-05-09 20:45:41', NULL, NULL, NULL, '3.32', 1),
(72, 23, 1, 1, '2019-05-09', '15.50', 1, 'PAGO DE VENTA DE CREDITO', '21:16:37', 1, '001-53', '2019-05-09 21:16:37', NULL, '70996529', 'José Martin Barrutia Trinidad', NULL, 1),
(73, 23, 1, 1, '2019-05-09', '5.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '21:18:59', 1, '001-60', '2019-05-09 21:18:59', NULL, NULL, NULL, NULL, 1),
(74, 25, 1, 4, '2019-05-09', '150.00', 1, 'luz', '22:17:02', 5, '001-1', '2019-05-09 22:17:02', NULL, NULL, NULL, '3.32', 1),
(75, 25, 1, 2, '2019-05-09', '45.00', 1, 'PAGO DE COMPRA', '23:11:19', 1, '1515-125', '2019-05-09 23:11:19', 0, NULL, NULL, '1.00', 1),
(76, 25, 1, 2, '2019-05-09', '45.00', 1, 'PAGO DE COMPRA', '23:11:50', 1, '1515-125', '2019-05-09 23:11:50', 0, NULL, NULL, '1.00', 1),
(77, 25, 1, 2, '2019-05-09', '45.00', 1, 'PAGO DE COMPRA', '23:16:24', 1, '145-120', '2019-05-09 23:16:24', 0, NULL, NULL, '1.00', 1),
(78, 25, 1, 2, '2019-05-09', '30.00', 1, 'PAGO DE COMPRA', '23:20:01', 2, '120-124', '2019-05-09 23:20:01', 0, NULL, NULL, '1.00', 1),
(79, 25, 1, 2, '2019-05-09', '60.00', 1, 'PAGO DE COMPRA', '23:43:17', 2, '120-123', '2019-05-09 23:43:17', 1, NULL, NULL, '1.00', 1),
(80, 25, 1, 1, '2019-05-09', '564.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '23:48:02', 1, '001-61', '2019-05-09 23:48:02', NULL, NULL, NULL, NULL, 1),
(81, 25, 1, 1, '2019-05-10', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '10:33:58', 1, '001-62', '2019-05-10 10:33:58', NULL, NULL, NULL, NULL, 1),
(82, 25, 1, 1, '2019-05-10', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '10:37:34', 1, '001-63', '2019-05-10 10:37:34', NULL, NULL, NULL, NULL, 1),
(83, 25, 1, 1, '2019-05-10', '6.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '10:39:49', 1, '001-64', '2019-05-10 10:39:49', NULL, NULL, NULL, NULL, 1),
(84, 25, 1, 1, '2019-05-10', '6.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '10:42:34', 1, '001-65', '2019-05-10 10:42:34', NULL, NULL, NULL, NULL, 1),
(85, 25, 1, 1, '2019-05-10', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '10:43:00', 1, '001-66', '2019-05-10 10:43:00', NULL, NULL, NULL, NULL, 1),
(86, 25, 1, 1, '2019-05-10', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '10:45:05', 1, '001-67', '2019-05-10 10:45:05', NULL, NULL, NULL, NULL, 1),
(87, 25, 1, 1, '2019-05-10', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '10:47:49', 1, '001-68', '2019-05-10 10:47:49', NULL, NULL, NULL, NULL, 1),
(88, 25, 1, 1, '2019-05-10', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '10:50:08', 1, '001-69', '2019-05-10 10:50:08', NULL, NULL, NULL, NULL, 1),
(89, 25, 1, 1, '2019-05-10', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '10:55:57', 1, '001-70', '2019-05-10 10:55:57', NULL, NULL, NULL, NULL, 1),
(90, 25, 1, 1, '2019-05-10', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '10:58:08', 1, '001-71', '2019-05-10 10:58:08', NULL, NULL, NULL, NULL, 1),
(91, 25, 1, 1, '2019-05-10', '40.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '10:58:57', 1, '001-72', '2019-05-10 10:58:57', NULL, NULL, NULL, NULL, 1),
(92, 25, 1, 1, '2019-05-10', '40.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '10:59:16', 1, '001-73', '2019-05-10 10:59:16', NULL, NULL, NULL, NULL, 1),
(93, 25, 1, 1, '2019-05-10', '79.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '11:01:56', 1, '001-74', '2019-05-10 11:01:56', NULL, NULL, NULL, NULL, 1),
(94, 25, 1, 1, '2019-05-10', '20.00', 1, 'COBRO DE VENTA DE PRODUCTOS', '11:02:30', 1, '001-75', '2019-05-10 11:02:30', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago_empleado`
--

CREATE TABLE `pago_empleado` (
  `pago_empleado_id` int(11) NOT NULL,
  `pago_empleado_fecha` date DEFAULT NULL,
  `pago_empleado_monto` decimal(15,2) DEFAULT NULL,
  `pago_empleado_estado` int(11) DEFAULT '1',
  `id_empleado` int(11) DEFAULT NULL,
  `id_movimiento` int(11) DEFAULT NULL,
  `pago_empleadofechapago` date DEFAULT NULL,
  `pago_empleado_estadopagado` char(1) DEFAULT NULL,
  `pago_empleado_fechainicio` date DEFAULT NULL,
  `pago_empleado_cts` decimal(11,4) DEFAULT NULL,
  `pago_empleado_gratificacion` decimal(11,4) DEFAULT NULL,
  `pago_empleado_estadocts` char(1) DEFAULT '0',
  `pago_empleado_estadogra` char(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `perfil_id` int(11) NOT NULL,
  `perfil_descripcion` varchar(50) DEFAULT NULL,
  `estado` int(1) DEFAULT '1',
  `perfil_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`perfil_id`, `perfil_descripcion`, `estado`, `perfil_url`) VALUES
(1, 'ADMINISTRADOR', 1, ''),
(2, 'MOZO', 1, 'Venta_mesa'),
(5, 'CAJERO', 1, 'Pedido'),
(6, 'COCINERO', 1, 'cocina'),
(8, 'ADMINISTRADOR DE EMPRESA', 1, 'Pedido'),
(12, 'ADMINISTRADOR DE SEDE', 1, 'Pedido'),
(13, 'DELIVERISTA', 1, 'Delivery');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `perfil_id` int(11) DEFAULT NULL,
  `modulo_id` int(11) DEFAULT NULL,
  `empresa_ruc` varchar(11) DEFAULT NULL,
  `id_tipo_negocio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_sede`
--

CREATE TABLE `permisos_sede` (
  `persed_id_perfil` int(11) DEFAULT NULL,
  `persed_id_modulo` int(11) DEFAULT NULL,
  `persed_id_sede` int(11) DEFAULT NULL,
  `persed_id_rubro` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `permisos_sede`
--

INSERT INTO `permisos_sede` (`persed_id_perfil`, `persed_id_modulo`, `persed_id_sede`, `persed_id_rubro`) VALUES
(1, 8, 1, NULL),
(1, 16, 1, NULL),
(1, 18, 1, NULL),
(1, 19, 1, NULL),
(1, 3, 1, NULL),
(1, 4, 1, NULL),
(1, 5, 1, NULL),
(1, 6, 1, NULL),
(2, 22, 1, NULL),
(5, 8, 1, NULL),
(5, 24, 1, NULL),
(5, 27, 1, NULL),
(5, 30, 1, NULL),
(5, 31, 1, NULL),
(5, 16, 1, NULL),
(5, 18, 1, NULL),
(5, 19, 1, NULL),
(5, 29, 1, NULL),
(5, 10, 1, NULL),
(5, 11, 1, NULL),
(5, 12, 1, NULL),
(5, 13, 1, NULL),
(5, 14, 1, NULL),
(5, 17, 1, NULL),
(5, 20, 1, NULL),
(5, 3, 1, NULL),
(5, 4, 1, NULL),
(5, 5, 1, NULL),
(5, 6, 1, NULL),
(5, 22, 1, NULL),
(5, 32, 1, NULL),
(5, 38, 1, NULL),
(12, 8, 1, NULL),
(12, 24, 1, NULL),
(12, 27, 1, NULL),
(12, 30, 1, NULL),
(12, 31, 1, NULL),
(12, 16, 1, NULL),
(12, 18, 1, NULL),
(12, 19, 1, NULL),
(12, 29, 1, NULL),
(12, 10, 1, NULL),
(12, 11, 1, NULL),
(12, 12, 1, NULL),
(12, 13, 1, NULL),
(12, 14, 1, NULL),
(12, 17, 1, NULL),
(12, 20, 1, NULL),
(12, 25, 1, NULL),
(12, 26, 1, NULL),
(12, 34, 1, NULL),
(12, 35, 1, NULL),
(12, 36, 1, NULL),
(12, 37, 1, NULL),
(12, 3, 1, NULL),
(12, 4, 1, NULL),
(12, 5, 1, NULL),
(12, 6, 1, NULL),
(12, 22, 1, NULL),
(12, 32, 1, NULL),
(12, 38, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `precio_unitario_producto`
--

CREATE TABLE `precio_unitario_producto` (
  `precio_unitario_producto_id` int(11) NOT NULL,
  `precio_unitario_producto_descripcion` varchar(255) DEFAULT NULL,
  `precio_unitario_producto_valor` decimal(10,2) DEFAULT NULL,
  `detalle_unidad_producto_id` int(11) DEFAULT NULL,
  `precio_unitario_producto_descuento` decimal(10,2) DEFAULT NULL,
  `precio_unitario_producto_utilidad` decimal(10,2) DEFAULT NULL,
  `precio_unitario_producto_fijo` int(11) DEFAULT '0',
  `precio_unidad_producto_precio_fijo` decimal(10,2) DEFAULT NULL,
  `precio_unidad_producto_aplicar_fijo` int(11) DEFAULT NULL,
  `precio_unidad_producto_estado` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `precio_unitario_producto`
--

INSERT INTO `precio_unitario_producto` (`precio_unitario_producto_id`, `precio_unitario_producto_descripcion`, `precio_unitario_producto_valor`, `detalle_unidad_producto_id`, `precio_unitario_producto_descuento`, `precio_unitario_producto_utilidad`, `precio_unitario_producto_fijo`, `precio_unidad_producto_precio_fijo`, `precio_unidad_producto_aplicar_fijo`, `precio_unidad_producto_estado`) VALUES
(16, 'precio 1', '4.00', 23, '0.00', NULL, 1, '1.00', NULL, 1),
(17, 'precio 1', '25.00', 25, '0.00', NULL, 1, '0.00', 2, 1),
(19, 'precio 1', '25.00', 25, '0.00', '0.00', 0, NULL, NULL, 1),
(20, 'precio 1', '25.00', 25, '0.00', '0.00', 0, NULL, NULL, 0),
(21, 'precio 1', '25.00', 25, '0.00', '0.00', 0, NULL, NULL, 0),
(22, 'precio 2', '250.00', 34, '0.00', '0.00', 0, NULL, NULL, 0),
(23, 'precio 2', '60.00', 24, '0.00', '0.00', 0, NULL, NULL, 0),
(24, 'precio', '450.00', 24, '0.00', '0.00', 0, NULL, NULL, 0),
(25, 'precio 1', '4.00', 35, '0.00', NULL, 1, '1.00', NULL, 1),
(26, 'precio 1', '45.00', 36, '0.00', '0.00', 0, NULL, NULL, 1),
(27, 'Caja 12', '21.00', 37, '0.00', '0.00', 0, NULL, NULL, 1),
(28, 'precio 1', '30.00', 38, '0.00', NULL, 1, '1.00', 1, 1),
(29, 'precio 1', '250.00', 39, '0.00', '0.00', 0, NULL, NULL, 1),
(30, 'precio 1', '5.00', 40, '0.00', NULL, 1, '1.00', 1, 1),
(31, 'precio 1', '2.00', 41, '0.00', NULL, 1, '1.00', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion`
--

CREATE TABLE `produccion` (
  `produccion_id` int(11) NOT NULL,
  `empleado_id` int(11) DEFAULT NULL,
  `produccion_descripcion` varchar(255) DEFAULT NULL,
  `produccion_fecha` datetime DEFAULT NULL,
  `produccion_observacion` varchar(255) DEFAULT NULL,
  `produccion_estado` int(255) DEFAULT '1',
  `id_sede` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `produccion`
--

INSERT INTO `produccion` (`produccion_id`, `empleado_id`, `produccion_descripcion`, `produccion_fecha`, `produccion_observacion`, `produccion_estado`, `id_sede`) VALUES
(9, 1, 'Produccion de paletas', '2019-05-05 15:49:42', '', 1, '1'),
(10, 1, 'Produccion de paletas', '2019-05-05 15:54:12', '', 1, '1'),
(12, 1, 'Produccion de paletas', '2019-05-05 16:09:14', '', 1, '1'),
(13, 1, 'Produccion de paletas', '2019-05-05 16:11:04', '', 1, '1'),
(14, 1, 'Produccion de paletas', '2019-05-05 16:11:32', '', 1, '1'),
(15, 1, 'Produccion de paletas', '2019-05-05 16:24:04', '', 1, '1'),
(16, 1, 'Produccion de paletas', '2019-05-05 16:30:45', '', 1, '1'),
(17, 1, 'Produccion de paletas', '2019-05-05 16:41:13', '', 1, '1'),
(18, 1, 'Produccion de paletas', '2019-05-05 16:41:38', '', 1, '1'),
(19, 1, 'Produccion de paletas', '2019-05-05 16:41:56', '', 1, '1'),
(20, 1, 'Produccion de paletas', '2019-05-05 16:43:46', '', 1, '1'),
(22, 1, 'Produccion de paletas', '2019-05-05 16:47:10', '', 1, '1'),
(23, 1, 'Produccion de paletas', '2019-05-05 16:47:55', '', 1, '1'),
(24, 1, 'Produccion de paletas', '2019-05-05 16:48:21', '', 1, '1'),
(25, 1, 'Produccion de paletas', '2019-05-05 17:34:24', '', 1, '1'),
(26, 1, 'Produccion de paletas', '2019-05-05 17:40:23', '', 1, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion_producto`
--

CREATE TABLE `produccion_producto` (
  `produccion_producto_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `produccion_producto_cantidad` decimal(10,2) DEFAULT NULL,
  `produccion_producto_estado` int(255) DEFAULT '1',
  `detalle_unidad_producto_id` int(11) DEFAULT NULL,
  `produccion_id` int(11) DEFAULT NULL,
  `almacen_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `produccion_producto`
--

INSERT INTO `produccion_producto` (`produccion_producto_id`, `producto_id`, `produccion_producto_cantidad`, `produccion_producto_estado`, `detalle_unidad_producto_id`, `produccion_id`, `almacen_id`) VALUES
(5, 26, '2.00', 1, 35, 9, 1),
(6, 24, '1.00', 1, 23, 9, 1),
(7, 26, '1.00', 1, 35, 10, 1),
(8, 24, '1.00', 1, 23, 10, 1),
(9, 26, '1.00', 1, 35, 12, 1),
(10, 24, '1.00', 1, 23, 12, 1),
(11, 26, '1.00', 1, 35, 13, 1),
(12, 24, '1.00', 1, 23, 13, 1),
(13, 26, '1.00', 1, 35, 14, 1),
(14, 24, '1.00', 1, 23, 14, 1),
(15, 25, '15.00', 1, 25, 15, 1),
(16, 24, '100.00', 1, 23, 15, 1),
(17, 26, '10.00', 1, 35, 16, 1),
(18, 25, '1.00', 1, 25, 16, 1),
(19, 24, '4.00', 1, 23, 16, 1),
(20, 24, '8.00', 1, 23, 17, 1),
(21, 24, '25.00', 1, 36, 18, 1),
(22, 24, '25.00', 1, 36, 19, 1),
(23, 24, '25.00', 1, 36, 20, 1),
(25, 24, '25.00', 1, 36, 22, 1),
(26, 24, '25.00', 1, 36, 23, 1),
(27, 24, '25.00', 1, 36, 24, 1),
(28, 24, '1.00', 1, 23, 25, 1),
(29, 25, '11.00', 1, 25, 26, 1),
(30, 26, '40.00', 1, 35, 26, 1),
(31, 24, '1.00', 1, 37, 26, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `producto_id` int(11) NOT NULL,
  `producto_descripcion` varchar(255) DEFAULT NULL,
  `producto_precio` decimal(10,2) DEFAULT NULL,
  `producto_stock` int(11) DEFAULT '0',
  `producto_minimo` decimal(10,2) DEFAULT '0.00',
  `producto_fecha_vencimiento` date DEFAULT NULL,
  `producto_observacion` varchar(255) DEFAULT NULL,
  `id_sede` int(11) DEFAULT NULL,
  `producto_estado` int(11) DEFAULT '1',
  `producto_imagen` text,
  `categoria_producto_id` int(11) DEFAULT NULL,
  `producto_cantidad_receta` int(11) DEFAULT NULL,
  `producto_codigobarra` varchar(100) DEFAULT NULL,
  `producto_id_tipoproducto` int(11) DEFAULT '1',
  `unidad_medida_id` int(11) DEFAULT NULL,
  `producto_stock_temporal` decimal(11,2) UNSIGNED ZEROFILL DEFAULT '000000000.00',
  `producto_color_cocina` varchar(255) DEFAULT NULL,
  `clase_id` int(11) DEFAULT NULL,
  `marca_id` int(11) DEFAULT NULL,
  `producto_codigo_referencia` varchar(255) CHARACTER SET macce DEFAULT NULL,
  `moneda_id` int(11) DEFAULT NULL,
  `producto_modelo` varchar(255) DEFAULT NULL,
  `proveedor_id` int(11) DEFAULT NULL,
  `producto_ubicacion` varchar(255) DEFAULT NULL,
  `producto_kilogramo` decimal(10,2) DEFAULT NULL,
  `producto_estado_precio_fijo` int(11) DEFAULT NULL,
  `producto_tipo_precio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`producto_id`, `producto_descripcion`, `producto_precio`, `producto_stock`, `producto_minimo`, `producto_fecha_vencimiento`, `producto_observacion`, `id_sede`, `producto_estado`, `producto_imagen`, `categoria_producto_id`, `producto_cantidad_receta`, `producto_codigobarra`, `producto_id_tipoproducto`, `unidad_medida_id`, `producto_stock_temporal`, `producto_color_cocina`, `clase_id`, `marca_id`, `producto_codigo_referencia`, `moneda_id`, `producto_modelo`, `proveedor_id`, `producto_ubicacion`, `producto_kilogramo`, `producto_estado_precio_fijo`, `producto_tipo_precio`) VALUES
(24, 'leche de 350ml', '4.00', 0, '10.00', NULL, NULL, 1, 1, '002a7e99961c19fc8ee099c182972ae4.png', NULL, NULL, '10757058', 1, 1, '000000000.00', NULL, 2, 1, '10757058', 1, '22323', NULL, 'eqweqw', '0.00', 1, NULL),
(25, 'lata de leche 150 ml', '25.00', 0, '20.00', NULL, NULL, 1, 1, 'efd0e379c8e369b621c900ce7e183c8e.jpg', NULL, NULL, '33123123', 1, 1, '000000000.00', NULL, 1, 1, '33123123', 1, '22323', NULL, 'ejqwejklqwe', '0.00', 0, 2),
(26, 'leche de magnesia', '4.00', 0, '0.00', NULL, NULL, 1, 1, 'ed0a27549500a04b6df9606f61b18f2d.jpg', NULL, NULL, '31231', 1, 1, '000000000.00', NULL, 1, 1, '31231', 1, 'kañklsdas', NULL, '12312', '0.00', 1, NULL),
(27, 'Paleta de Maracuya', '10.00', 100, '10.00', NULL, NULL, 1, 1, '098db6f202deb406c3a9f386043b8448.jpg', 1, NULL, 'sfdfdf', 3, 1, '000000000.00', NULL, NULL, NULL, 'sfdfdf', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'eqweqwe', '45.00', 0, '0.00', NULL, NULL, 1, 0, '6f4d22a0f55d79ddb17547705ce2c9bc.jpg', 1, NULL, '12312', 3, 1, '000000000.00', NULL, NULL, NULL, '3123123', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'prueba plato\r\n', '4.00', 0, '3.00', NULL, NULL, 1, 0, '0c498141bf86ee3c930f32e7763f96e1.jpg', 1, NULL, '3123', 3, 1, '000000000.00', NULL, NULL, NULL, '3123', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'eqweqweqew', '1.00', 0, '1.00', NULL, NULL, 1, 0, '542a3d574f6cca86557ca0104b77c18c.jpg', 1, NULL, '3123', 3, 1, '000000000.00', NULL, NULL, NULL, '123132', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'wqwqeqwe', '1.00', 0, '4.00', NULL, NULL, 1, 0, 'b77affd6d93277585942525eca72d32d.jpg', 1, NULL, '3123', 3, 1, '000000000.00', NULL, NULL, NULL, '123123123', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'erwerqre', '1.00', 0, '0.00', NULL, NULL, 1, 0, '39a1598f1cc4b98a37e39a86c2bfc5e3.jpg', 1, NULL, '31231', 3, 1, '000000000.00', NULL, NULL, NULL, '31231231', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'Paleta de Fresa', '1.00', 100, '1.00', NULL, NULL, 1, 1, 'b7edb78e53e4453396fe36f2ab9fd6e0.jpg', 1, NULL, '131231', 3, 1, '000000004.00', NULL, NULL, NULL, '131231', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'Paleta de menta', '1.00', 100, '5.00', NULL, NULL, 1, 1, 'c81581a87075b4cc4f406087cc727c7a.jpg', 1, NULL, '31231', 3, 1, '000000003.00', NULL, NULL, NULL, '31231', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'Paleta de mora', '5.00', 112, '0.00', NULL, NULL, 1, 1, 'cc08b6289b0f6b091684052873dabf90.jpg', 1, NULL, '1321312', 3, 1, '000000000.00', NULL, NULL, NULL, '1321312', 1, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'cereal de trigo tostado', '30.00', 100, '5.00', NULL, NULL, 1, 1, '7b3d83d91078f3c40ead4d9f6951d7f5.jpg', NULL, NULL, 'hfdsisdf616559', 1, 1, '000000000.00', NULL, 4, 5, '160', 1, 'trigo', NULL, 'zona seca', '0.00', 1, 1),
(41, 'bebida de dieta', '5.00', 100, '5.00', NULL, NULL, 1, 1, '38bcb6fd3d68ce627dd5b31677cff3b4.jpg', NULL, NULL, '12234567896555', 1, 1, '000000000.00', NULL, 1, 2, '120', 1, '.', NULL, 'almacen ', '0.00', 1, 1),
(42, 'galleta soda', '2.00', 100, '5.00', NULL, NULL, 1, 1, '150a0298321b9f158a8b2b0c02dc5063.jpg', NULL, NULL, '949794654611+65', 1, 1, '000000000.00', NULL, 7, 3, '949794654611+65', 1, '.', NULL, 'almacen 1,  zona seca', '0.00', 1, NULL),
(43, 'Paleta de Arandano', '11.00', 100, '10.00', NULL, NULL, 1, 1, 'aa4dd860924709ae3527c05208c78a1f.jpg', 1, NULL, '1', 3, 1, '000000000.00', NULL, NULL, NULL, '1', 1, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_plato`
--

CREATE TABLE `producto_plato` (
  `produccion_plato_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `produccion_plato_cantidad` decimal(15,2) DEFAULT NULL,
  `produccion_plato_estado` int(255) DEFAULT '1',
  `produccion_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `producto_plato`
--

INSERT INTO `producto_plato` (`produccion_plato_id`, `producto_id`, `produccion_plato_cantidad`, `produccion_plato_estado`, `produccion_id`) VALUES
(6, 39, '2.00', 1, 9),
(7, 39, '1.00', 1, 10),
(9, 39, '1.00', 1, 12),
(10, 38, '6.00', 1, 13),
(11, 37, '2.00', 1, 13),
(12, 39, '1.00', 1, 13),
(13, 38, '6.00', 1, 14),
(14, 37, '2.00', 1, 14),
(15, 39, '1.00', 1, 14),
(16, 39, '50.00', 1, 15),
(17, 38, '10.00', 1, 15),
(18, 37, '100.00', 1, 15),
(19, 39, '7.00', 1, 16),
(20, 38, '10.00', 1, 16),
(21, 37, '4.00', 1, 16),
(22, 38, '4.00', 1, 17),
(23, 39, '12.00', 1, 17),
(24, 37, '2.00', 1, 17),
(25, 37, '1.00', 1, 18),
(26, 37, '1.00', 1, 19),
(27, 37, '1.00', 1, 20),
(29, 37, '1.00', 1, 22),
(30, 37, '1.00', 1, 23),
(31, 37, '1.00', 1, 24),
(32, 38, '10.00', 1, 25),
(33, 39, '40.00', 1, 26),
(34, 37, '50.00', 1, 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `proveedor_id` int(11) NOT NULL,
  `proveedor_razonsocial` varchar(100) DEFAULT NULL,
  `proveedor_direccion` varchar(100) DEFAULT NULL,
  `proveedor_ruc` varchar(11) DEFAULT NULL,
  `proveedor_ciudad` varchar(60) DEFAULT NULL,
  `proveedor_telefono` varchar(60) DEFAULT NULL,
  `proveedor_nombrecomercial` varchar(100) DEFAULT NULL,
  `proveedor_email` varchar(100) DEFAULT NULL,
  `proveedor_website` varchar(100) DEFAULT NULL,
  `proveedor_contacto` varchar(100) DEFAULT NULL,
  `proveedor_estado` int(1) DEFAULT '1',
  `empresa_ruc` varchar(11) DEFAULT NULL,
  `proveedor_estado_habido` varchar(255) DEFAULT NULL,
  `proveedor_sede_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`proveedor_id`, `proveedor_razonsocial`, `proveedor_direccion`, `proveedor_ruc`, `proveedor_ciudad`, `proveedor_telefono`, `proveedor_nombrecomercial`, `proveedor_email`, `proveedor_website`, `proveedor_contacto`, `proveedor_estado`, `empresa_ruc`, `proveedor_estado_habido`, `proveedor_sede_id`) VALUES
(1, 'jimmy jeiensto carbajal sanchez', 'psje. humberto pinedo 130', '10752705866', 'peru', '933122626', '', '', '', '', 1, NULL, 'habido', NULL),
(2, 'BARRUTIA TRINIDAD JOSE MARTIN', 'psj. humberto pinedo N° 162', '10101010101', 'tarapoto', '955175084', 'tarapooto', 'Julymarthpanduro@gmail.com', 'werwerwrw', 'ertetsdfsfs', 1, NULL, 'sdfsdfs', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id_provincia` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `observacion` varchar(255) DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sector_atencion`
--

CREATE TABLE `sector_atencion` (
  `sector_atencion_id` int(11) NOT NULL,
  `sector_atencion_descripcion` varchar(255) DEFAULT NULL,
  `sector_atencion_precio` decimal(11,2) DEFAULT NULL,
  `sector_atencion_estado` int(11) DEFAULT '1',
  `id_sede` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sector_mesa`
--

CREATE TABLE `sector_mesa` (
  `sector_mesa_id` int(11) NOT NULL,
  `sector_mesa_descripcion` varchar(255) DEFAULT NULL,
  `sector_mesa_estado` int(11) DEFAULT '1',
  `id_sede` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `id_sede` int(11) NOT NULL,
  `sede_direccion` varchar(255) DEFAULT NULL,
  `sede_telefono` int(11) DEFAULT NULL,
  `sede_observacion` varchar(255) DEFAULT NULL,
  `sede_horario_m_i` time DEFAULT NULL,
  `sede_horario_m` time DEFAULT NULL,
  `sede_horario_t_i` time DEFAULT NULL,
  `sede_horario_t` time DEFAULT NULL,
  `id_distrito` int(11) DEFAULT NULL,
  `sede_descripcion` varchar(255) DEFAULT NULL,
  `id_provincia` int(11) DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `sede_estado` int(11) DEFAULT '1',
  `id_banco` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `sede`
--

INSERT INTO `sede` (`id_sede`, `sede_direccion`, `sede_telefono`, `sede_observacion`, `sede_horario_m_i`, `sede_horario_m`, `sede_horario_t_i`, `sede_horario_t`, `id_distrito`, `sede_descripcion`, `id_provincia`, `id_departamento`, `sede_estado`, `id_banco`) VALUES
(1, 'José Pardo 350', 971555752, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede_caja`
--

CREATE TABLE `sede_caja` (
  `id_sede_caja` int(11) NOT NULL,
  `id_caja` int(11) DEFAULT NULL,
  `id_sede` int(11) DEFAULT NULL,
  `sede_caja_monto` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `sede_caja`
--

INSERT INTO `sede_caja` (`id_sede_caja`, `id_caja`, `id_sede`, `sede_caja_monto`) VALUES
(1, 1, 1, 12474.5),
(2, 2, 1, 1700);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion_caja`
--

CREATE TABLE `sesion_caja` (
  `id_sesion_caja` int(11) NOT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `id_sede_caja` int(11) DEFAULT NULL,
  `ses_fechaapertura` datetime DEFAULT NULL,
  `ses_montoapertura` decimal(10,2) DEFAULT NULL,
  `ses_montocierre` decimal(10,2) DEFAULT NULL,
  `ses_estado` int(11) DEFAULT '1',
  `ses_fechacierre` datetime DEFAULT NULL,
  `ses_montoinicial` decimal(12,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `sesion_caja`
--

INSERT INTO `sesion_caja` (`id_sesion_caja`, `id_empleado`, `id_sede_caja`, `ses_fechaapertura`, `ses_montoapertura`, `ses_montocierre`, `ses_estado`, `ses_fechacierre`, `ses_montoinicial`) VALUES
(1, 2, 1, '2019-04-28 06:28:00', '-100.00', '-100.00', 0, '2019-04-28 06:29:00', '100.00'),
(2, 2, 2, '2019-04-28 06:28:00', '-100.00', '-100.00', 0, '2019-04-28 06:29:00', '100.00'),
(3, 2, 1, '2019-05-03 15:52:00', '-100.00', '44.00', 0, '2019-05-04 15:53:00', '100.00'),
(4, 2, 2, '2019-05-03 15:52:00', '-100.00', '-100.00', 0, '2019-05-04 15:53:00', '100.00'),
(5, 2, 1, '2019-05-04 15:53:00', '144.00', '828.00', 0, '2019-05-05 16:25:00', '0.00'),
(6, 2, 2, '2019-05-04 15:53:00', '0.00', '0.00', 0, '2019-05-05 16:25:00', '0.00'),
(7, 2, 1, '2019-05-05 16:25:00', '828.00', '1288.00', 0, '2019-05-05 18:46:00', '0.00'),
(8, 2, 2, '2019-05-05 16:25:00', '0.00', '0.00', 0, '2019-05-05 18:46:00', '0.00'),
(9, 2, 1, '2019-05-05 18:46:00', '1288.00', '1288.00', 0, '2019-05-05 18:50:00', '0.00'),
(10, 2, 2, '2019-05-05 18:46:00', '0.00', '0.00', 0, '2019-05-05 18:50:00', '0.00'),
(11, 2, 1, '2019-05-05 18:50:00', '1288.00', '1714.00', 0, '2019-05-06 09:25:00', '0.00'),
(12, 2, 2, '2019-05-05 18:50:00', '0.00', '0.00', 0, '2019-05-06 09:25:00', '0.00'),
(13, 2, 1, '2019-05-06 09:25:00', '1614.00', '4314.00', 0, '2019-05-07 12:57:00', '100.00'),
(14, 2, 2, '2019-05-06 09:25:00', '-100.00', '-100.00', 0, '2019-05-07 12:57:00', '100.00'),
(15, 2, 1, '2019-05-07 12:57:00', '4414.00', '10919.00', 0, '2019-05-07 13:22:00', '0.00'),
(16, 2, 2, '2019-05-07 12:57:00', '0.00', '2000.00', 0, '2019-05-07 13:22:00', '0.00'),
(17, 2, 1, '2019-05-08 22:03:00', '10919.00', '10919.00', 0, '2019-05-08 22:04:00', '0.00'),
(18, 2, 2, '2019-05-08 22:03:00', '2000.00', '2000.00', 0, '2019-05-08 22:04:00', '0.00'),
(19, 2, 1, '2019-05-08 22:04:00', '10819.00', '10881.00', 0, '2019-05-08 23:56:00', '100.00'),
(20, 2, 2, '2019-05-08 22:04:00', '1900.00', '1900.00', 0, '2019-05-08 23:56:00', '100.00'),
(21, 2, 1, '2019-05-09 00:01:00', '10981.00', '11224.00', 0, '2019-05-09 14:48:00', '0.00'),
(22, 2, 2, '2019-05-09 00:01:00', '2000.00', '2000.00', 0, '2019-05-09 14:48:00', '0.00'),
(23, 2, 1, '2019-05-09 14:49:00', '11024.00', '11734.50', 0, '2019-05-09 22:12:00', '200.00'),
(24, 2, 2, '2019-05-09 14:49:00', '1800.00', '1800.00', 0, '2019-05-09 22:12:00', '200.00'),
(25, 2, 1, '2019-05-09 22:12:00', '11634.50', '0.00', 1, NULL, '300.00'),
(26, 2, 2, '2019-05-09 22:12:00', '1700.00', '0.00', 1, NULL, '300.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

CREATE TABLE `sexo` (
  `sexo_id` int(11) NOT NULL,
  `sexo_descripcion` varchar(255) DEFAULT NULL,
  `sexo_estado` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipomovimiento_empleado`
--

CREATE TABLE `tipomovimiento_empleado` (
  `tipomovimientoempleado_id` int(11) NOT NULL,
  `tipomovimientoempleado_descripcion` varchar(150) DEFAULT NULL,
  `tipomovimientoempleado_estado` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_comprobante_c`
--

CREATE TABLE `tipo_comprobante_c` (
  `id_tipo_comprobante` int(11) NOT NULL,
  `tipo_comprobante_descripcion` varchar(255) DEFAULT NULL,
  `tipo_comprobante_estado` int(11) DEFAULT '1',
  `tipo_comprobante_nombre` varchar(255) DEFAULT NULL,
  `codigo_sunat` varchar(11) DEFAULT NULL,
  `ordenar_venta` int(11) DEFAULT NULL,
  `letras_iniciales` char(2) DEFAULT NULL,
  `tipo_comprobante_contabilidad` varchar(255) DEFAULT NULL,
  `cu_tabla` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tipo_comprobante_c`
--

INSERT INTO `tipo_comprobante_c` (`id_tipo_comprobante`, `tipo_comprobante_descripcion`, `tipo_comprobante_estado`, `tipo_comprobante_nombre`, `codigo_sunat`, `ordenar_venta`, `letras_iniciales`, `tipo_comprobante_contabilidad`, `cu_tabla`) VALUES
(0, 'SIN DOCUMENTO', 1, 'SIN DOCUMENTO', NULL, NULL, 'SN', 'SN', NULL),
(1, 'BOLETA DE VENTA', 1, 'BOLETA', '03', 2, 'B', 'B', NULL),
(2, 'FACTURA DE VENTA', 1, 'FACTURA', '01', 1, 'F', 'F', NULL),
(3, 'TICKET BOLETA', 1, 'TICKET', '12', 6, 'TB', 'TB', NULL),
(4, 'TICKET FACTURA', 1, 'TICKET', '12', 5, 'TF', 'TF', NULL),
(5, 'TICKET', 1, 'TICKET', '12', 7, 'T', 'T', NULL),
(6, 'RECIBO DE INGRESO', 1, 'RECIBO DE INGRESO', NULL, NULL, 'RI', 'RI', NULL),
(7, 'VOUCHER', 1, 'VOUCHER', NULL, NULL, 'V', 'V', NULL),
(8, 'CARGO', 1, 'CARGO', NULL, NULL, 'C', 'C', NULL),
(9, 'Nº DE OPERACION', 1, 'Nº DE OPERACION', NULL, NULL, 'NO', 'NO', NULL),
(10, 'RECIBO', 1, 'RECIBO', NULL, NULL, 'R', 'R', NULL),
(11, 'NOTA DE CREDITO', 1, 'N. CREDITO', '07', 3, 'NC', 'NC', NULL),
(12, 'NOTA DE DEBITO', 1, 'N. DEBITO', '08', 4, 'ND', 'ND', NULL),
(13, 'OTROS COMPROBANTES', 1, 'OTROS', NULL, NULL, 'O', 'O', NULL),
(16, 'RECIBO POR HONORARIOS', 1, 'RECIBO POR HONORARIOS', '02', 8, 'RH', 'RH', ''),
(17, 'LIQUIDACIÓN DE COMPRA', 1, 'LIQUIDACIÓN DECOMPRA', '04', NULL, 'LC', 'LC', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `tipodoc_id` int(11) NOT NULL,
  `tipodoc_descripcion` varchar(60) DEFAULT NULL,
  `tipodoc_abreviacion` varchar(7) DEFAULT NULL,
  `tipodoc_estado` char(1) DEFAULT '1',
  `tipodoc_codigo` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`tipodoc_id`, `tipodoc_descripcion`, `tipodoc_abreviacion`, `tipodoc_estado`, `tipodoc_codigo`) VALUES
(0, 'SIN DOCUMENTO', 'SIN DOC', '1', NULL),
(1, 'FACTURA ELECTRONICA', 'FACTURA', '1', '01'),
(2, 'BOLETA ELECTRONICA', 'BOLETA', '1', '03'),
(3, 'NOTA DE CREDITO ', 'N. CRED', '1', '07'),
(4, 'NOTA DE DEBITO ', 'N. DEB', '1', '08'),
(5, 'TICKET DE MAQUINA REGISTRADORA', NULL, '1', '12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_entrega`
--

CREATE TABLE `tipo_entrega` (
  `tipoentrega_idtipoentrega` int(11) NOT NULL,
  `tipoentrega_descripcion` varchar(150) DEFAULT NULL,
  `tipoentrega_observacion` varchar(100) DEFAULT NULL,
  `tipoentrega_estado` char(1) DEFAULT NULL,
  `tipoentrega_idsede` int(11) DEFAULT NULL,
  `cu_tabla` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tipo_entrega`
--

INSERT INTO `tipo_entrega` (`tipoentrega_idtipoentrega`, `tipoentrega_descripcion`, `tipoentrega_observacion`, `tipoentrega_estado`, `tipoentrega_idsede`, `cu_tabla`) VALUES
(1, 'Consumo Instantaneo', NULL, '1', NULL, NULL),
(2, 'Consumo Para llevar', NULL, '1', NULL, NULL),
(3, 'Consumo Delivery', NULL, '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_igv`
--

CREATE TABLE `tipo_igv` (
  `tipo_igv_id` int(11) NOT NULL,
  `tipo_igv_descripcion` varchar(255) DEFAULT NULL,
  `tipo_igv_estado` int(11) DEFAULT '1',
  `tipo_igv_codigo` varchar(255) DEFAULT NULL,
  `tipo_igv` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tipo_igv`
--

INSERT INTO `tipo_igv` (`tipo_igv_id`, `tipo_igv_descripcion`, `tipo_igv_estado`, `tipo_igv_codigo`, `tipo_igv`) VALUES
(1, 'Gravado - Operación Onerosa', 1, '10', 1),
(2, '[Gratuita] Gravado - Retiro por premio', 1, '11', 1),
(3, '[Gratuita] Gravado - Retiro por donación', 1, '12', 1),
(4, '[Gratuita] Gravado - Retiro', 1, '13', 1),
(5, '[Gratuita] Gravado - Retiro por publicidad', 1, '14', 1),
(6, '[Gratuita] Gravado - Bonificaciones', 1, '15', 1),
(7, '[Gratuita] Gravado - Retiro por entrega a trabajad...', 1, '16', 1),
(8, 'Exonerado - Operación Onerosa', 1, '20', 0),
(9, 'Inafecto - Operación Onerosa', 1, '30', 0),
(10, '[Gratuita] Inafecto - Retiro por Bonificación', 1, '31', 0),
(11, '[Gratuita] Inafecto - Retiro', 1, '32', 0),
(12, '[Gratuita] Inafecto - Retiro por Muestras Médicas', 1, '33', 0),
(13, '[Gratuita] Inafecto - Retiro por Convenio Colectiv...', 1, '34', 0),
(14, '[Gratuita] Inafecto - Retiro por premio', 1, '35', 0),
(15, '[Gratuita] Inafecto - Retiro por publicidad', 1, '36', 0),
(16, 'Exportación', 1, '40', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_movimiento`
--

CREATE TABLE `tipo_movimiento` (
  `id_tipo_movimiento` int(11) NOT NULL,
  `tipo_movimiento_descripcion` varchar(255) DEFAULT NULL,
  `tipo_movimiento_estado` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tipo_movimiento`
--

INSERT INTO `tipo_movimiento` (`id_tipo_movimiento`, `tipo_movimiento_descripcion`, `tipo_movimiento_estado`) VALUES
(1, 'Ingreso', 1),
(2, 'Egreso', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `tipo_pago_id` int(11) NOT NULL,
  `tipo_pago_descripcion` varchar(255) DEFAULT NULL,
  `cu_tabla` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tipo_pago`
--

INSERT INTO `tipo_pago` (`tipo_pago_id`, `tipo_pago_descripcion`, `cu_tabla`) VALUES
(1, 'Pago al Contado', NULL),
(2, 'Pago al Credito', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `tipoproducto_id` int(11) NOT NULL,
  `tipoproducto_descripcion` varchar(150) DEFAULT NULL,
  `tipoproducto_estado` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`tipoproducto_id`, `tipoproducto_descripcion`, `tipoproducto_estado`) VALUES
(1, 'Producto', '1'),
(2, 'Insumo', '1'),
(3, 'Plato', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad_medida`
--

CREATE TABLE `unidad_medida` (
  `id_unidad_medida` int(11) NOT NULL,
  `unidad_medida_descripcion` varchar(255) DEFAULT NULL,
  `unidad_medida_estado` int(11) DEFAULT '1',
  `descripcion_sunat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `unidad_medida`
--

INSERT INTO `unidad_medida` (`id_unidad_medida`, `unidad_medida_descripcion`, `unidad_medida_estado`, `descripcion_sunat`) VALUES
(1, 'UNIDAD(Bienes)', 1, 'NIU'),
(2, 'UNIDAD(Servicio)', 1, 'ZZ'),
(3, 'BOBINAS', 1, '4A'),
(5, 'BALDE', 1, 'BJ'),
(6, 'BARRILLES', 1, 'BLL'),
(7, 'BOLSA', 1, 'BG'),
(8, 'BOTELLAS', 1, 'BO'),
(9, 'CAJA', 1, 'BX'),
(10, 'CARTONES', 1, 'CT'),
(11, 'CENTÍMETRO CUADRADO', 1, 'CMK'),
(12, 'CENTÍMETRO CUBICO', 1, 'CMQ'),
(13, 'CENTÍMETRO LINEAL ', 1, 'CMT'),
(14, 'CIENTO DE UNIDADES', 1, 'CEN'),
(15, 'CILINDRO', 1, 'CY'),
(16, 'CONOS ', 1, 'CJ'),
(17, 'DOCENA ', 1, 'DZN'),
(18, 'DOCENA POR 10**6', 1, 'DZP'),
(19, 'FARDO ', 1, 'BE'),
(20, 'GALON INGLES (4,545956L)', 1, 'GLI'),
(21, 'GRAMO', 1, 'GRM'),
(22, 'GRUESA', 1, 'GRO'),
(23, 'HECTOLITRO', 1, 'HLT'),
(24, 'HOJA', 1, 'LEF'),
(25, 'JUEGO', 1, 'SET'),
(26, 'KILOGRAMO ', 1, 'KGM'),
(27, 'KILOMETRO', 1, 'KTM'),
(28, 'KILOVATIO HORA', 1, 'KWH'),
(29, 'KIT', 1, 'KT'),
(30, 'LATAS', 1, 'CA'),
(31, 'LIBRAS', 1, 'LBR'),
(32, 'LITRO', 1, 'LTR'),
(33, 'MEGAWATT HORA', 1, 'MWH'),
(34, 'METRO', 1, 'MTR'),
(35, 'METRO CUADRADO', 1, 'MTK'),
(36, 'METRO CUBICO  ', 1, 'MTQ'),
(37, 'MILIGRAMOS', 1, 'MGM'),
(38, 'MILILITRO ', 1, 'MLT'),
(39, 'MILIMETRO', 1, 'MMT'),
(40, 'MILIMETRO CUADRADO  ', 1, 'MMK'),
(41, 'MILIMETRO CUBICO', 1, 'MMQ'),
(42, 'MILLARES', 1, 'MLL'),
(43, 'MILLON DE UNIDADES', 1, 'UM'),
(44, 'ONZAS', 1, 'ONZ'),
(45, 'PALETAS ', 1, 'PF'),
(46, 'PAQUETE ', 1, 'PK'),
(47, 'PAR', 1, 'PR'),
(48, 'PIES   ', 1, 'FOT'),
(49, 'PIES CUADRADOS  ', 1, 'FTK'),
(50, 'PIES CUBICOS ', 1, 'FTQ'),
(51, 'PIEZAS', 1, 'C62'),
(52, 'PLACAS    ', 1, 'PG'),
(53, 'PLIEGO', 1, 'ST'),
(54, 'PULGADAS', 1, 'INH'),
(55, 'RESMA', 1, 'RM'),
(56, 'TAMBOR', 1, 'DR'),
(57, 'TONELADA CORTA', 1, 'STN'),
(58, 'TONELADA LARGA ', 1, 'LTN'),
(59, 'TONELADAS ', 1, 'TNE     '),
(60, 'TUBOS', 1, 'TU'),
(61, 'US GALON (3,7843 L)', 1, 'GLL'),
(62, 'YARDA', 1, 'YRD'),
(63, 'YARDA CUADRADA', 1, 'YDK');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_eliminar`
--

CREATE TABLE `usuario_eliminar` (
  `id_usuarioe` int(11) NOT NULL,
  `usuario_eli` varchar(50) DEFAULT NULL,
  `clave_eli` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_eliminar`
--

INSERT INTO `usuario_eliminar` (`id_usuarioe`, `usuario_eli`, `clave_eli`) VALUES
(1, 'usuarioeliminar', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variable`
--

CREATE TABLE `variable` (
  `variable_igv` decimal(10,2) DEFAULT NULL,
  `variable_uit` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `variable`
--

INSERT INTO `variable` (`variable_igv`, `variable_uit`) VALUES
('0.18', '4200.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `venta_idventas` int(11) NOT NULL,
  `venta_id_padre` int(11) DEFAULT '0',
  `venta_idmoneda` int(11) DEFAULT NULL,
  `ventas_idtipodocumento` int(11) DEFAULT '0',
  `venta_tipopago` int(11) DEFAULT NULL,
  `venta_formapago` int(11) DEFAULT NULL,
  `venta_codigosilla` int(11) DEFAULT NULL,
  `venta_tipoventa` int(11) DEFAULT NULL,
  `venta_codigocliente` int(11) DEFAULT '0',
  `venta_codigomozo` int(11) DEFAULT NULL,
  `venta_fecha` datetime DEFAULT NULL,
  `venta_num_serie` varchar(4) DEFAULT NULL,
  `venta_num_documento` int(11) DEFAULT NULL,
  `venta_monto` decimal(11,2) DEFAULT NULL,
  `venta_observaciones` text,
  `venta_estado` char(1) DEFAULT '1',
  `venta_idsede` int(11) DEFAULT NULL,
  `venta_fechapedido` int(25) DEFAULT NULL,
  `venta_pedidofecha` datetime DEFAULT NULL,
  `ventas_vuelto` decimal(11,2) DEFAULT NULL,
  `venta_codigomesa` int(11) DEFAULT NULL,
  `venta_credito_estado` int(11) DEFAULT NULL,
  `venta_credito_cuotas` int(11) DEFAULT NULL,
  `venta_credito_usuario` int(11) DEFAULT NULL,
  `venta_fecha_pago` datetime DEFAULT NULL,
  `venta_monto_entregado` float(44,2) DEFAULT NULL,
  `venta_igv_estado` char(1) DEFAULT NULL,
  `venta_igv_monto` float(44,2) DEFAULT NULL,
  `venta_monto_sinigv` float(44,2) DEFAULT NULL,
  `venta_idmovimiento` int(11) DEFAULT NULL,
  `venta_estadococina` char(1) CHARACTER SET macce DEFAULT '1',
  `venta_id_delivery` int(11) DEFAULT '0',
  `venta_fecha_preparacion` datetime DEFAULT NULL,
  `venta_monto_delivery` decimal(12,2) DEFAULT '0.00',
  `venta_fecha_eliminacion` datetime DEFAULT NULL,
  `venta_id_cajero` int(11) DEFAULT NULL,
  `venta_empleado_eliminacion` int(11) DEFAULT NULL,
  `venta_eliminacion_descripcion` varchar(255) DEFAULT NULL,
  `venta_estado_pagado` int(11) DEFAULT '0',
  `venta_empleado_deliverista` int(11) DEFAULT NULL,
  `venta_estadocanje` char(1) DEFAULT '0',
  `venta_tidocelimi` int(11) DEFAULT NULL,
  `venta_serie_eliminado` char(5) DEFAULT NULL,
  `venta_correlativo_eliminado` int(11) DEFAULT NULL,
  `venta_idpersonal_eliminado` int(11) DEFAULT NULL,
  `venta_pdf_facturacion` text,
  `venta_xml_facturacion` text,
  `venta_cdr_facturacion` text,
  `venta_ticket_facturacion` text,
  `venta_comprobante_aceptado` int(11) DEFAULT '0',
  `venta_estado_consumo` int(11) NOT NULL DEFAULT '0',
  `venta_estado_agrupacion` int(11) NOT NULL DEFAULT '0',
  `ventaid_tipo_venta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`venta_idventas`, `venta_id_padre`, `venta_idmoneda`, `ventas_idtipodocumento`, `venta_tipopago`, `venta_formapago`, `venta_codigosilla`, `venta_tipoventa`, `venta_codigocliente`, `venta_codigomozo`, `venta_fecha`, `venta_num_serie`, `venta_num_documento`, `venta_monto`, `venta_observaciones`, `venta_estado`, `venta_idsede`, `venta_fechapedido`, `venta_pedidofecha`, `ventas_vuelto`, `venta_codigomesa`, `venta_credito_estado`, `venta_credito_cuotas`, `venta_credito_usuario`, `venta_fecha_pago`, `venta_monto_entregado`, `venta_igv_estado`, `venta_igv_monto`, `venta_monto_sinigv`, `venta_idmovimiento`, `venta_estadococina`, `venta_id_delivery`, `venta_fecha_preparacion`, `venta_monto_delivery`, `venta_fecha_eliminacion`, `venta_id_cajero`, `venta_empleado_eliminacion`, `venta_eliminacion_descripcion`, `venta_estado_pagado`, `venta_empleado_deliverista`, `venta_estadocanje`, `venta_tidocelimi`, `venta_serie_eliminado`, `venta_correlativo_eliminado`, `venta_idpersonal_eliminado`, `venta_pdf_facturacion`, `venta_xml_facturacion`, `venta_cdr_facturacion`, `venta_ticket_facturacion`, `venta_comprobante_aceptado`, `venta_estado_consumo`, `venta_estado_agrupacion`, `ventaid_tipo_venta`) VALUES
(1, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '12.00', NULL, '0', 1, 1557005425, '2019-05-04 16:30:25', NULL, 6, NULL, NULL, NULL, NULL, NULL, '0', NULL, 2.00, NULL, '2', 0, NULL, '0.00', '2019-05-05 11:17:02', NULL, 1, 'xD', 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(2, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '24.00', NULL, '0', 1, 1557073694, '2019-05-05 11:28:14', NULL, 6, NULL, NULL, NULL, NULL, NULL, '0', NULL, 2.00, NULL, '2', 0, NULL, '0.00', '2019-05-05 11:28:37', NULL, 1, 'Se elimino porque no había nada', 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(3, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '12.00', NULL, '0', 1, 1557073776, '2019-05-05 11:29:36', NULL, 6, NULL, NULL, NULL, NULL, NULL, '0', NULL, 2.00, NULL, '2', 0, NULL, '0.00', '2019-05-05 11:29:55', NULL, 1, 'XD', 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(4, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '16.00', NULL, '0', 1, 1557073809, '2019-05-05 11:30:09', NULL, 6, NULL, NULL, NULL, NULL, NULL, '0', NULL, 2.00, NULL, '2', 0, NULL, '0.00', '2019-05-05 11:30:41', NULL, 1, 'xD', 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(5, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '16.00', NULL, '0', 1, 1557073878, '2019-05-05 11:31:18', NULL, 6, NULL, NULL, NULL, NULL, NULL, '0', NULL, 2.00, NULL, '2', 0, NULL, '0.00', '2019-05-05 11:36:22', NULL, 1, 'dsd', 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(6, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '16.00', NULL, '0', 1, 1557074192, '2019-05-05 11:36:32', NULL, 6, NULL, NULL, NULL, NULL, NULL, '0', NULL, 2.00, NULL, '2', 0, NULL, '0.00', '2019-05-05 11:38:07', NULL, 1, 'ldfjdlfj', 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(7, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '20.00', NULL, '0', 1, 1557074298, '2019-05-05 11:38:18', NULL, 6, NULL, NULL, NULL, NULL, NULL, '0', NULL, 2.00, NULL, '2', 0, NULL, '0.00', '2019-05-05 11:38:49', NULL, 1, 'admin', 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(8, 0, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, '001', 2, '8.00', NULL, '2', 1, 1557074380, '2019-05-05 11:39:40', NULL, 6, NULL, NULL, 2, '2019-05-05 12:40:07', 8.00, '1', 1.22, 2.00, 1, '2', 0, NULL, '0.00', NULL, 2, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, NULL),
(9, 0, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, '001', 3, '4.00', NULL, '2', 1, 1557075607, '2019-05-05 12:00:07', NULL, 7, NULL, NULL, 2, '2019-05-05 12:41:26', 4.00, '1', 0.61, 2.00, 2, '2', 0, NULL, '0.00', NULL, 2, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, NULL),
(10, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 23, '20.00', NULL, '2', 1, 1557087877, '2019-05-05 15:24:37', NULL, 6, NULL, NULL, 2, '2019-05-05 16:21:26', 20.00, '1', 3.05, 2.00, 22, '2', 0, NULL, '0.00', NULL, 2, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, NULL),
(11, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 4, '20.00', NULL, '2', 1, 1557087901, '2019-05-05 15:25:01', NULL, 7, NULL, NULL, 2, '2019-05-05 15:25:01', 20.00, '1', 3.05, 2.00, 3, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(12, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 24, '200.00', NULL, '2', 1, 1557088346, '2019-05-05 15:32:26', NULL, 7, NULL, NULL, 2, '2019-05-05 16:22:32', 200.00, '1', 30.51, 2.00, 23, '2', 0, NULL, '0.00', NULL, 2, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, NULL),
(13, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 25, '20.00', NULL, '2', 1, 1557088479, '2019-05-05 15:34:39', NULL, 8, NULL, NULL, 2, '2019-05-05 16:22:58', 20.00, '1', 3.05, 2.00, 24, '2', 0, NULL, '0.00', NULL, 2, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, NULL),
(14, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 26, '20.00', NULL, '2', 1, 1557088500, '2019-05-05 15:35:00', NULL, 9, NULL, NULL, 2, '2019-05-05 16:23:41', 20.00, '1', 3.05, 2.00, 25, '2', 0, NULL, '0.00', NULL, 2, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, NULL),
(15, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 5, '20.00', NULL, '2', 1, 1557088522, '2019-05-05 15:35:22', NULL, 10, NULL, NULL, 2, '2019-05-05 15:35:22', 20.00, '1', 3.05, 2.00, 4, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(16, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 6, '20.00', NULL, '2', 1, 1557088553, '2019-05-05 15:35:53', NULL, 10, NULL, NULL, 2, '2019-05-05 15:35:53', 20.00, '1', 3.05, 2.00, 5, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(17, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 7, '20.00', NULL, '2', 1, 1557088675, '2019-05-05 15:37:55', NULL, 10, NULL, NULL, 2, '2019-05-05 15:37:55', 20.00, '1', 3.05, 2.00, 6, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(18, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 8, '20.00', NULL, '2', 1, 1557088708, '2019-05-05 15:38:28', NULL, 10, NULL, NULL, 2, '2019-05-05 15:38:28', 20.00, '1', 3.05, 2.00, 7, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(19, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 9, '20.00', NULL, '2', 1, 1557088754, '2019-05-05 15:39:14', NULL, 10, NULL, NULL, 2, '2019-05-05 15:39:14', 20.00, '1', 3.05, 2.00, 8, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(20, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 10, '20.00', NULL, '2', 1, 1557089616, '2019-05-05 15:53:36', NULL, 10, NULL, NULL, 2, '2019-05-05 15:53:36', 20.00, '1', 3.05, 2.00, 9, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(21, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 11, '20.00', NULL, '2', 1, 1557090038, '2019-05-05 16:00:38', NULL, 10, NULL, NULL, 2, '2019-05-05 16:00:38', 20.00, '1', 3.05, 2.00, 10, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(22, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 12, '20.00', NULL, '2', 1, 1557090105, '2019-05-05 16:01:45', NULL, 10, NULL, NULL, 2, '2019-05-05 16:01:45', 20.00, '1', 3.05, 2.00, 11, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(23, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 13, '20.00', NULL, '2', 1, 1557090154, '2019-05-05 16:02:34', NULL, 10, NULL, NULL, 2, '2019-05-05 16:02:34', 20.00, '1', 3.05, 2.00, 12, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(24, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 14, '20.00', NULL, '2', 1, 1557090206, '2019-05-05 16:03:26', NULL, 10, NULL, NULL, 2, '2019-05-05 16:03:26', 20.00, '1', 3.05, 2.00, 13, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(25, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 15, '20.00', NULL, '2', 1, 1557090233, '2019-05-05 16:03:53', NULL, 10, NULL, NULL, 2, '2019-05-05 16:03:53', 20.00, '1', 3.05, 2.00, 14, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(26, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 16, '20.00', NULL, '2', 1, 1557090309, '2019-05-05 16:05:09', NULL, 10, NULL, NULL, 2, '2019-05-05 16:05:09', 20.00, '1', 3.05, 2.00, 15, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(27, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 17, '20.00', NULL, '2', 1, 1557090405, '2019-05-05 16:06:45', NULL, 10, NULL, NULL, 2, '2019-05-05 16:06:45', 20.00, '1', 3.05, 2.00, 16, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(28, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 18, '20.00', NULL, '2', 1, 1557090444, '2019-05-05 16:07:24', NULL, 10, NULL, NULL, 2, '2019-05-05 16:07:24', 20.00, '1', 3.05, 2.00, 17, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(29, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 19, '20.00', NULL, '2', 1, 1557090499, '2019-05-05 16:08:19', NULL, 10, NULL, NULL, 2, '2019-05-05 16:08:19', 20.00, '1', 3.05, 2.00, 18, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(30, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 20, '20.00', NULL, '2', 1, 1557090580, '2019-05-05 16:09:40', NULL, 10, NULL, NULL, 2, '2019-05-05 16:09:40', 20.00, '1', 3.05, 2.00, 19, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(31, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 21, '20.00', NULL, '2', 1, 1557090603, '2019-05-05 16:10:03', NULL, 10, NULL, NULL, 2, '2019-05-05 16:10:03', 20.00, '1', 3.05, 2.00, 20, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(32, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 22, '20.00', NULL, '2', 1, 1557090776, '2019-05-05 16:12:56', NULL, 10, NULL, NULL, 2, '2019-05-05 16:12:56', 20.00, '1', 3.05, 2.00, 21, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(33, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 27, '20.00', NULL, '2', 1, 1557091484, '2019-05-05 16:24:44', NULL, 6, NULL, NULL, 2, '2019-05-05 16:24:44', 20.00, '1', 3.05, 2.00, 26, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(34, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 28, '20.00', NULL, '2', 1, 1557091550, '2019-05-05 16:25:50', NULL, 6, NULL, NULL, 2, '2019-05-05 16:25:50', 20.00, '1', 3.05, 2.00, 27, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(35, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 29, '20.00', NULL, '2', 1, 1557091595, '2019-05-05 16:26:35', NULL, 6, NULL, NULL, 2, '2019-05-05 16:27:07', 20.00, '1', 3.05, 16.95, 28, '2', 0, NULL, '0.00', NULL, 2, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, NULL),
(36, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 30, '20.00', NULL, '2', 1, 1557091669, '2019-05-05 16:27:49', NULL, 6, NULL, NULL, 2, '2019-05-05 16:30:21', 20.00, '1', 3.05, 16.95, 29, '2', 0, NULL, '0.00', NULL, 2, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(37, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 31, '20.00', NULL, '2', 1, 1557091752, '2019-05-05 16:29:12', NULL, 7, NULL, NULL, 2, '2019-05-05 16:30:35', 20.00, '1', 3.05, 16.95, 30, '2', 0, NULL, '0.00', NULL, 2, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(38, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 32, '20.00', NULL, '2', 1, 1557091850, '2019-05-05 16:30:50', NULL, 6, NULL, NULL, 2, '2019-05-05 16:41:22', 20.00, '1', 3.05, 16.95, 31, '2', 0, NULL, '0.00', NULL, 2, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(39, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 33, '20.00', NULL, '2', 1, 1557092303, '2019-05-05 16:38:23', NULL, 7, NULL, NULL, 2, '2019-05-05 16:41:27', 20.00, '1', 3.05, 16.95, 32, '2', 0, NULL, '0.00', NULL, 2, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(40, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 34, '20.00', NULL, '2', 1, 1557092448, '2019-05-05 16:40:48', NULL, 8, NULL, NULL, 2, '2019-05-05 16:41:30', 20.00, '1', 3.05, 16.95, 33, '2', 0, NULL, '0.00', NULL, 2, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(41, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 35, '20.00', NULL, '2', 1, 1557092508, '2019-05-05 16:41:48', NULL, 6, NULL, NULL, 2, '2019-05-05 16:41:59', 20.00, '1', 3.05, 16.95, 34, '2', 0, NULL, '0.00', NULL, 2, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, NULL),
(42, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 36, '20.00', NULL, '2', 1, 1557092541, '2019-05-05 16:42:21', NULL, 6, NULL, NULL, 2, '2019-05-05 16:42:21', 20.00, '1', 3.05, 16.95, 35, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(43, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, '20.00', NULL, '0', 1, 1557092558, '2019-05-05 16:42:38', NULL, 6, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '2', 0, NULL, '0.00', '2019-05-05 16:42:49', NULL, 2, 'sdsd', 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(44, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, '20.00', NULL, '0', 1, 1557092674, '2019-05-05 16:44:34', NULL, 7, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '2', 0, NULL, '0.00', '2019-05-05 16:44:44', NULL, 2, 'sdsd', 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(45, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, '20.00', NULL, '0', 1, 1557092713, '2019-05-05 16:45:13', NULL, 7, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '2', 0, NULL, '0.00', '2019-05-05 16:46:26', NULL, 2, 'dsd', 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(46, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 37, '40.00', NULL, '2', 1, 1557092814, '2019-05-05 16:46:54', NULL, 6, NULL, NULL, 2, '2019-05-05 16:59:54', 40.00, '1', 6.10, 33.90, 36, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(47, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 38, '20.00', NULL, '2', 1, 1557093790, '2019-05-05 17:03:10', NULL, 6, NULL, NULL, 2, '2019-05-05 17:03:24', 20.00, '1', 3.05, 16.95, 37, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(48, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 39, '20.00', NULL, '2', 1, 1557093847, '2019-05-05 17:04:07', NULL, 6, NULL, NULL, 2, '2019-05-05 17:04:18', 20.00, '1', 3.05, 16.95, 38, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(49, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 40, '20.00', NULL, '2', 1, 1557093894, '2019-05-05 17:04:54', NULL, 6, NULL, NULL, 2, '2019-05-05 17:05:03', 20.00, '1', 3.05, 16.95, 39, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(50, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 41, '20.00', NULL, '2', 1, 1557093940, '2019-05-05 17:05:40', NULL, 6, NULL, NULL, 2, '2019-05-05 17:05:51', 20.00, '1', 3.05, 16.95, 40, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(51, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 42, '20.00', NULL, '2', 1, 1557094042, '2019-05-05 17:07:22', NULL, 6, NULL, NULL, 2, '2019-05-05 17:09:17', 20.00, '1', 3.05, 16.95, 41, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(52, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 43, '20.00', NULL, '2', 1, 1557094291, '2019-05-05 17:11:31', NULL, 6, NULL, NULL, 2, '2019-05-05 17:11:53', 20.00, '1', 3.05, 16.95, 42, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(53, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 44, '40.00', NULL, '2', 1, 1557094344, '2019-05-05 17:12:24', NULL, 6, NULL, NULL, 2, '2019-05-05 17:12:48', 40.00, '1', 6.10, 33.90, 43, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(54, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 45, '40.00', NULL, '2', 1, 1557094585, '2019-05-05 17:16:25', NULL, 6, NULL, NULL, 2, '2019-05-05 17:16:39', 40.00, '1', 6.10, 33.90, 44, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(55, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, '40.00', NULL, '0', 1, 1557094618, '2019-05-05 17:16:58', NULL, 6, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '2', 0, NULL, '0.00', '2019-05-08 23:12:02', NULL, 2, 'dsdsd', 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(56, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 46, '40.00', NULL, '2', 1, 1557094653, '2019-05-05 17:17:33', NULL, 7, NULL, NULL, 2, '2019-05-05 17:18:46', 40.00, '1', 6.10, 33.90, 45, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(57, 0, 1, 1, 1, 1, NULL, NULL, 2, 2, NULL, '001', 54, '200.00', NULL, '2', 1, 1557105535, '2019-05-05 20:18:55', NULL, 7, NULL, NULL, 2, '2019-05-09 14:33:11', 200.00, '0', 0.00, 200.00, 65, '2', 0, NULL, '0.00', NULL, 2, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, NULL),
(58, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, '40.00', NULL, '0', 1, 1557108519, '2019-05-05 21:08:39', NULL, 8, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '2', 0, NULL, '0.00', '2019-05-09 14:41:51', NULL, 2, 'Se elimino porque se agoto', 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(59, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 47, '50.00', NULL, '2', 1, 1557112274, '2019-05-05 22:11:14', NULL, 9, NULL, NULL, 2, '2019-05-05 22:11:14', 50.00, '1', 7.63, 42.37, 46, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(67, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, '100.00', NULL, '0', 1, 1557112868, '2019-05-05 22:21:08', NULL, 9, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '2', 0, NULL, '0.00', '2019-05-09 14:42:03', NULL, 2, 'dsds', 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(68, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, '0.00', NULL, '0', 1, 1557112899, '2019-05-05 22:21:39', NULL, 10, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '2', 0, NULL, '0.00', '2019-05-05 22:25:08', NULL, 2, NULL, 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(69, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 48, '116.00', NULL, '2', 1, 1557113449, '2019-05-05 22:30:49', NULL, 10, NULL, NULL, 2, '2019-05-05 22:30:49', 116.00, '1', 17.69, 98.31, 47, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(70, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 49, '120.00', NULL, '2', 1, 1557113498, '2019-05-05 22:31:38', NULL, 10, NULL, NULL, 2, '2019-05-05 22:31:38', 120.00, '1', 18.31, 101.69, 48, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(71, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 50, '140.00', NULL, '2', 1, 1557113554, '2019-05-05 22:32:34', NULL, 10, NULL, NULL, 2, '2019-05-05 22:32:34', 140.00, '1', 21.36, 118.64, 49, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(72, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 51, '3800.00', NULL, '2', 1, 1557155774, '2019-05-06 10:16:14', NULL, 10, NULL, NULL, 2, '2019-05-06 10:16:14', 3800.00, '1', 579.66, 3220.34, 53, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(76, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, '10.00', NULL, '0', 1, 1557253254, '2019-05-07 13:20:54', NULL, 10, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '2', 0, NULL, '0.00', '2019-05-09 14:42:22', NULL, 2, 'dsd', 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(77, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 52, '5.00', NULL, '2', 1, 1557253272, '2019-05-07 13:21:12', NULL, 11, NULL, NULL, 2, '2019-05-07 13:21:12', 5.00, '1', 0.76, 4.24, 60, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(78, 0, 1, 1, 2, 1, NULL, NULL, 2, 2, NULL, '001', 53, '62.00', NULL, '2', 1, 1557373794, '2019-05-08 22:49:54', NULL, 11, 0, 4, 2, '2019-05-08 22:49:54', 62.00, '1', 9.46, 52.54, NULL, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1),
(79, 0, 1, 1, 1, 1, NULL, NULL, 2, 2, NULL, '001', 56, '27.00', NULL, '2', 1, 1557430741, '2019-05-09 14:39:01', NULL, 6, NULL, NULL, 2, '2019-05-09 14:39:54', 27.00, '0', 0.00, 27.00, 67, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 8),
(80, 0, 1, 1, 1, 1, NULL, NULL, 2, 2, NULL, '001', 55, '16.00', NULL, '2', 1, 1557430771, '2019-05-09 14:39:31', NULL, 7, NULL, NULL, 2, '2019-05-09 14:39:31', 16.00, '0', 0.00, 16.00, 66, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 8),
(81, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 57, '116.00', NULL, '2', 1, 1557431397, '2019-05-09 14:49:57', NULL, 6, NULL, NULL, 2, '2019-05-09 14:51:43', 116.00, '0', 0.00, 116.00, 68, '2', 0, NULL, '0.00', NULL, 2, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(82, 0, 1, 1, 1, 1, NULL, NULL, 2, 2, NULL, '001', 58, '12.00', NULL, '2', 1, 1557431545, '2019-05-09 14:52:25', NULL, 6, NULL, NULL, 2, '2019-05-09 14:52:25', 12.00, '0', 0.00, 12.00, 69, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 8),
(83, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 59, '62.00', NULL, '2', 1, 1557431608, '2019-05-09 14:53:28', NULL, 6, NULL, NULL, 2, '2019-05-09 14:53:48', 62.00, '0', 0.00, 62.00, 70, '2', 0, NULL, '0.00', NULL, 2, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(84, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 61, '564.00', NULL, '2', 1, 1557454689, '2019-05-09 21:18:09', NULL, 8, NULL, NULL, 2, '2019-05-09 23:48:02', 564.00, '0', 0.00, 564.00, 80, '2', 0, NULL, '0.00', NULL, 2, NULL, NULL, 1, 0, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(85, 0, 1, 1, 1, 1, NULL, NULL, 0, 2, NULL, '001', 60, '5.00', NULL, '2', 1, 1557454740, '2019-05-09 21:19:00', NULL, 9, NULL, NULL, 2, '2019-05-09 21:19:00', 5.00, '0', 0.00, 5.00, 73, '2', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 8),
(86, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, '83.00', NULL, '0', 1, 1557462564, '2019-05-09 23:29:24', NULL, 9, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '1', 0, NULL, '0.00', '2019-05-10 11:03:28', NULL, 2, 'fdf', 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(87, 0, 1, 1, 1, 1, NULL, NULL, 2, 1, NULL, '001', 64, '6.00', NULL, '2', 1, 1557464378, '2019-05-09 23:59:38', NULL, 6, NULL, NULL, 2, '2019-05-10 10:39:50', 6.00, '0', 0.00, 6.00, 83, '1', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 8),
(88, 0, 1, 1, 1, 1, NULL, NULL, 2, 1, NULL, '001', 74, '79.00', NULL, '2', 1, 1557464639, '2019-05-10 00:03:59', NULL, 7, NULL, NULL, 2, '2019-05-10 11:01:57', 79.00, '0', 0.00, 79.00, 93, '1', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 8),
(90, 0, 1, 1, 1, 1, NULL, NULL, 2, 1, NULL, '001', 62, '20.00', NULL, '2', 1, 1557502350, '2019-05-10 10:32:30', NULL, 8, NULL, NULL, 2, '2019-05-10 10:33:58', 20.00, '0', 0.00, 20.00, 81, '1', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 8),
(91, 0, 1, 1, 1, 1, NULL, NULL, 2, 2, NULL, '001', 63, '20.00', NULL, '2', 1, 1557502655, '2019-05-10 10:37:35', NULL, 8, NULL, NULL, 2, '2019-05-10 10:37:35', 20.00, '0', 0.00, 20.00, 82, '1', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 8),
(92, 0, 1, 1, 1, 1, NULL, NULL, 2, 2, NULL, '001', 65, '6.00', NULL, '2', 1, 1557502954, '2019-05-10 10:42:34', NULL, 6, NULL, NULL, 2, '2019-05-10 10:42:34', 6.00, '0', 0.00, 6.00, 84, '1', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 8),
(93, 0, 1, 1, 1, 1, NULL, NULL, 3, 2, NULL, '001', 66, '20.00', NULL, '2', 1, 1557502980, '2019-05-10 10:43:00', NULL, 8, NULL, NULL, 2, '2019-05-10 10:43:00', 20.00, '0', 0.00, 20.00, 85, '1', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 8),
(94, 0, 1, 1, 1, 1, NULL, NULL, 3, 2, NULL, '001', 67, '20.00', NULL, '2', 1, 1557503105, '2019-05-10 10:45:05', NULL, 8, NULL, NULL, 2, '2019-05-10 10:45:05', 20.00, '0', 0.00, 20.00, 86, '1', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 8),
(95, 0, 1, 1, 1, 1, NULL, NULL, 3, 2, NULL, '001', 68, '20.00', NULL, '2', 1, 1557503270, '2019-05-10 10:47:50', NULL, 8, NULL, NULL, 2, '2019-05-10 10:47:50', 20.00, '0', 0.00, 20.00, 87, '1', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 8),
(96, 0, 1, 1, 1, 1, NULL, NULL, 3, 2, NULL, '001', 69, '20.00', NULL, '2', 1, 1557503408, '2019-05-10 10:50:08', NULL, 8, NULL, NULL, 2, '2019-05-10 10:50:08', 20.00, '0', 0.00, 20.00, 88, '1', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 8),
(97, 0, 1, 1, 1, 1, NULL, NULL, 2, 2, NULL, '001', 70, '20.00', NULL, '2', 1, 1557503741, '2019-05-10 10:55:41', NULL, 8, NULL, NULL, 2, '2019-05-10 10:55:58', 20.00, '0', 0.00, 20.00, 89, '1', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 8),
(98, 0, 1, 1, 1, 1, NULL, NULL, 2, 2, NULL, '001', 71, '20.00', NULL, '2', 1, 1557503777, '2019-05-10 10:56:17', NULL, 6, NULL, NULL, 2, '2019-05-10 10:58:08', 20.00, '0', 0.00, 20.00, 90, '1', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 8),
(99, 0, 1, 1, 1, 1, NULL, NULL, 2, 2, NULL, '001', 75, '20.00', NULL, '2', 1, 1557503809, '2019-05-10 10:56:49', NULL, 8, NULL, NULL, 2, '2019-05-10 11:02:30', 20.00, '0', 0.00, 20.00, 94, '1', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 8),
(100, 0, NULL, 0, NULL, NULL, NULL, NULL, 0, 2, NULL, NULL, NULL, '20.00', NULL, '1', 1, 1557503863, '2019-05-10 10:57:43', NULL, 10, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, '1', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 0, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL),
(101, 0, 1, 1, 1, 1, NULL, NULL, 2, 2, NULL, '001', 72, '40.00', NULL, '2', 1, 1557503930, '2019-05-10 10:58:50', NULL, 6, NULL, NULL, 2, '2019-05-10 10:58:58', 40.00, '0', 0.00, 40.00, 91, '1', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 8),
(102, 0, 1, 1, 1, 1, NULL, NULL, 2, 2, NULL, '001', 73, '40.00', NULL, '2', 1, 1557503956, '2019-05-10 10:59:16', NULL, 6, NULL, NULL, 2, '2019-05-10 10:59:16', 40.00, '0', 0.00, 40.00, 92, '1', 0, NULL, '0.00', NULL, NULL, NULL, NULL, 1, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 8);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  ADD PRIMARY KEY (`almacen_id`) USING BTREE,
  ADD KEY `id_sede` (`id_sede`) USING BTREE;

--
-- Indices de la tabla `amortizacioncompra`
--
ALTER TABLE `amortizacioncompra`
  ADD KEY `amo_movimiento` (`amo_movimiento`) USING BTREE,
  ADD KEY `amortizacioncompra_ibfk_2` (`amo_cuotacompra`) USING BTREE;

--
-- Indices de la tabla `amortizacionpago`
--
ALTER TABLE `amortizacionpago`
  ADD PRIMARY KEY (`amor_pagoempleado_idamorpa`) USING BTREE,
  ADD KEY `fk_empleadoidpago` (`amor_pagoempleado_peid`) USING BTREE,
  ADD KEY `fk_empleado_tipomov` (`amor_pagoempleado_idtipomov`) USING BTREE,
  ADD KEY `fk_empleadoidmovimiento` (`id_movimiento`) USING BTREE,
  ADD KEY `fk_adelanto` (`amor_pagoempleado_idadelanto`) USING BTREE,
  ADD KEY `fk_descuento` (`amor_pagoempleado_iddescuento`) USING BTREE,
  ADD KEY `fk_falta` (`amor_pagoempleado_idfalta`) USING BTREE;

--
-- Indices de la tabla `amortizacionventa`
--
ALTER TABLE `amortizacionventa`
  ADD PRIMARY KEY (`amo_ventaid`) USING BTREE,
  ADD KEY `amortizacionventa_ibfk_1` (`amo_movimiento`) USING BTREE,
  ADD KEY `amortizacionventa_ibfk_2` (`amo_cuotaventa`) USING BTREE;

--
-- Indices de la tabla `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`banco_idbanco`) USING BTREE,
  ADD KEY `banco_idbanco` (`banco_idbanco`) USING BTREE;

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`id_caja`) USING BTREE;

--
-- Indices de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD PRIMARY KEY (`categoria_producto_id`) USING BTREE,
  ADD KEY `id_sede` (`id_sede`) USING BTREE;

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD PRIMARY KEY (`clase_id`) USING BTREE;

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`) USING BTREE;

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`compra_id`) USING BTREE,
  ADD KEY `fk_proveedores_compras` (`proveedor_id`) USING BTREE,
  ADD KEY `fk_almacen_compras` (`almacen_id`) USING BTREE,
  ADD KEY `fk_monedas_compras` (`moneda_id`) USING BTREE,
  ADD KEY `fk_tipo_documento_compras` (`tipodoc_id`) USING BTREE,
  ADD KEY `id_tipo_pago` (`id_tipo_pago`) USING BTREE,
  ADD KEY `compra_forma_pago` (`compra_forma_pago`) USING BTREE,
  ADD KEY `id_empleado` (`id_empleado`) USING BTREE,
  ADD KEY `id_sede` (`id_sede`) USING BTREE;

--
-- Indices de la tabla `concepto`
--
ALTER TABLE `concepto`
  ADD PRIMARY KEY (`con_id`) USING BTREE,
  ADD KEY `id_tipo_movimiento` (`id_tipo_movimiento`) USING BTREE,
  ADD KEY `asdas` (`id_sede`) USING BTREE;

--
-- Indices de la tabla `contrato_personal`
--
ALTER TABLE `contrato_personal`
  ADD PRIMARY KEY (`contrato_id`) USING BTREE,
  ADD KEY `empleado_id` (`empleado_id`) USING BTREE,
  ADD KEY `motivo_contrato_id` (`motivo_contrato_id`) USING BTREE;

--
-- Indices de la tabla `cuentas_venta_temporal`
--
ALTER TABLE `cuentas_venta_temporal`
  ADD PRIMARY KEY (`cuentas_idtemporal`) USING BTREE,
  ADD KEY `fk_ventas_cuenta` (`cuentas_idventas`) USING BTREE;

--
-- Indices de la tabla `cuotacompra`
--
ALTER TABLE `cuotacompra`
  ADD PRIMARY KEY (`cuo_id`) USING BTREE,
  ADD KEY `cuo_prestamo` (`cuo_compra`) USING BTREE;

--
-- Indices de la tabla `cuotacompra_producto`
--
ALTER TABLE `cuotacompra_producto`
  ADD PRIMARY KEY (`cuo_id`) USING BTREE,
  ADD KEY `cuo_prestamo` (`cuo_compra`) USING BTREE;

--
-- Indices de la tabla `cuotaventa`
--
ALTER TABLE `cuotaventa`
  ADD PRIMARY KEY (`cuo_ventaid`) USING BTREE,
  ADD KEY `cuotaventa_ibfk_1` (`cuo_venta`) USING BTREE;

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`) USING BTREE;

--
-- Indices de la tabla `desactivar_producto`
--
ALTER TABLE `desactivar_producto`
  ADD PRIMARY KEY (`desactivar_producto_id`) USING BTREE,
  ADD KEY `producto_id` (`producto_id`) USING BTREE;

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`id_detalle_compra`) USING BTREE,
  ADD KEY `fk_compras_detalles_compras` (`compra_id`) USING BTREE,
  ADD KEY `fk_productos_detalles_compras` (`producto_id`) USING BTREE,
  ADD KEY `detalle_compra_detalle_unidad_medida` (`detalle_compra_detalle_unidad_medida`) USING BTREE,
  ADD KEY `dasdasd` (`tipo_igv_id`) USING BTREE;

--
-- Indices de la tabla `detalle_cuentas_temporal`
--
ALTER TABLE `detalle_cuentas_temporal`
  ADD PRIMARY KEY (`detalle_iddetalletemporal`) USING BTREE,
  ADD KEY `fk_cuentas-productos` (`cod_producto_venta`) USING BTREE,
  ADD KEY `detalle_cuentas_temporal_ibfk_2` (`cuentas_idtemporal`) USING BTREE;

--
-- Indices de la tabla `detalle_doc_sede`
--
ALTER TABLE `detalle_doc_sede`
  ADD KEY `fk_doc_det` (`detalle_id_documento`) USING BTREE,
  ADD KEY `fk_sed_det` (`detalle_id_sede`) USING BTREE;

--
-- Indices de la tabla `detalle_empleados_sector_mesa`
--
ALTER TABLE `detalle_empleados_sector_mesa`
  ADD KEY `sector_mesa_id` (`sector_mesa_id`) USING BTREE,
  ADD KEY `detalle_empleados_sector_mesa_ibfk_1` (`empleado_id`) USING BTREE;

--
-- Indices de la tabla `detalle_mesa_sector_mesa`
--
ALTER TABLE `detalle_mesa_sector_mesa`
  ADD KEY `dasdasdasddasdasda` (`mesa_id`) USING BTREE,
  ADD KEY `detalle_mesa_sector_mesa_ibfk_1` (`sector_mesa_id`) USING BTREE;

--
-- Indices de la tabla `detalle_producto_almacen`
--
ALTER TABLE `detalle_producto_almacen`
  ADD PRIMARY KEY (`detalle_producto_almacen_id`) USING BTREE,
  ADD KEY `fk_producto_1` (`detalle_producto`) USING BTREE,
  ADD KEY `fk_almacen_1` (`detalle_almacen`) USING BTREE;

--
-- Indices de la tabla `detalle_unidad_producto`
--
ALTER TABLE `detalle_unidad_producto`
  ADD PRIMARY KEY (`detalle_unidad_producto_id`) USING BTREE,
  ADD KEY `id_unidad_medida` (`id_unidad_medida`) USING BTREE,
  ADD KEY `producto_id` (`producto_id`) USING BTREE;

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_detalle_venta`) USING BTREE,
  ADD KEY `fk_venta_detalle` (`id_venta`) USING BTREE,
  ADD KEY `fk_ventas_producto` (`cod_producto_venta`) USING BTREE,
  ADD KEY `fk_venta_tipoentrega_detalle` (`id_tipoentrega`) USING BTREE;

--
-- Indices de la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD PRIMARY KEY (`id_distrito`) USING BTREE,
  ADD KEY `kjsdkfj` (`id_provincia`) USING BTREE;

--
-- Indices de la tabla `documento`
--
ALTER TABLE `documento`
  ADD PRIMARY KEY (`id_documento`) USING BTREE,
  ADD KEY `fk_tipodoc` (`id_tipodocumento`) USING BTREE;

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`empleado_id`) USING BTREE,
  ADD KEY `fk_perfil_empleado` (`perfil_id`) USING BTREE,
  ADD KEY `id_fondo_pension` (`id_fondo_pension`) USING BTREE,
  ADD KEY `empleados_ibfk_bancos` (`empleado_idbanco`) USING BTREE,
  ADD KEY `empleados_ibfk_salud` (`empleado_idsalud`) USING BTREE,
  ADD KEY `empleados_ibfk_3` (`empresa_sede`) USING BTREE;

--
-- Indices de la tabla `empleado_adelanto`
--
ALTER TABLE `empleado_adelanto`
  ADD PRIMARY KEY (`empleado_adelanto_id`) USING BTREE,
  ADD KEY `dasdae2qwas` (`empleado_id`) USING BTREE;

--
-- Indices de la tabla `empleado_asistencia`
--
ALTER TABLE `empleado_asistencia`
  ADD PRIMARY KEY (`empleado_asistencia_id`) USING BTREE,
  ADD KEY `dasdasdasdas` (`empleado_id`) USING BTREE;

--
-- Indices de la tabla `empleado_descuento`
--
ALTER TABLE `empleado_descuento`
  ADD PRIMARY KEY (`empleado_descuento_id`) USING BTREE,
  ADD KEY `dasdasd` (`empleado_id`) USING BTREE,
  ADD KEY `fasdasdasd` (`motivo_descuento_id`) USING BTREE;

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`empresa_ruc`) USING BTREE;

--
-- Indices de la tabla `fondo_pension`
--
ALTER TABLE `fondo_pension`
  ADD PRIMARY KEY (`id_fondo_pension`) USING BTREE,
  ADD KEY `fk_tiporetencion_fodo` (`fondo_pension_idtiporetencion`) USING BTREE;

--
-- Indices de la tabla `fondo_salud`
--
ALTER TABLE `fondo_salud`
  ADD PRIMARY KEY (`fondosalud_idsalud`) USING BTREE;

--
-- Indices de la tabla `formapago`
--
ALTER TABLE `formapago`
  ADD PRIMARY KEY (`for_id`) USING BTREE;

--
-- Indices de la tabla `kardex_producto`
--
ALTER TABLE `kardex_producto`
  ADD PRIMARY KEY (`kardex_id`) USING BTREE,
  ADD KEY `detalle_insumo_almacen_id` (`detalle_producto_almacen_id`) USING BTREE;

--
-- Indices de la tabla `lugar_mesa`
--
ALTER TABLE `lugar_mesa`
  ADD PRIMARY KEY (`lugarmesa_id`) USING BTREE;

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`marca_id`) USING BTREE;

--
-- Indices de la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`mesa_id`) USING BTREE,
  ADD KEY `fk_lugar_mesa` (`mesa_id_lugar`) USING BTREE;

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`modulo_id`) USING BTREE;

--
-- Indices de la tabla `monedas`
--
ALTER TABLE `monedas`
  ADD PRIMARY KEY (`moneda_id`) USING BTREE;

--
-- Indices de la tabla `motivo_contrato`
--
ALTER TABLE `motivo_contrato`
  ADD PRIMARY KEY (`motivo_contrato_id`) USING BTREE;

--
-- Indices de la tabla `motivo_descuento`
--
ALTER TABLE `motivo_descuento`
  ADD PRIMARY KEY (`motivo_descuento_id`) USING BTREE,
  ADD KEY `sdada` (`id_sede`) USING BTREE;

--
-- Indices de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD PRIMARY KEY (`mov_id`) USING BTREE,
  ADD KEY `fsdfsf` (`mov_concepto`) USING BTREE,
  ADD KEY `ewqeqwe` (`mov_formapago`) USING BTREE,
  ADD KEY `dasdasd` (`id_sesion_caja`) USING BTREE,
  ADD KEY `id_tipo_comprobante` (`id_tipo_comprobante`) USING BTREE;

--
-- Indices de la tabla `pago_empleado`
--
ALTER TABLE `pago_empleado`
  ADD PRIMARY KEY (`pago_empleado_id`) USING BTREE,
  ADD KEY `id_empleado` (`id_empleado`) USING BTREE;

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`perfil_id`) USING BTREE;

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD KEY `fk_modulo_permiso` (`modulo_id`) USING BTREE,
  ADD KEY `fk_perfil_permiso` (`perfil_id`) USING BTREE,
  ADD KEY `permisos_ibfk_3` (`id_tipo_negocio`) USING BTREE;

--
-- Indices de la tabla `permisos_sede`
--
ALTER TABLE `permisos_sede`
  ADD KEY `fk_detalle_sed` (`persed_id_sede`) USING BTREE,
  ADD KEY `fk_detalle_per` (`persed_id_perfil`) USING BTREE,
  ADD KEY `fk_detalle_mod` (`persed_id_modulo`) USING BTREE;

--
-- Indices de la tabla `precio_unitario_producto`
--
ALTER TABLE `precio_unitario_producto`
  ADD PRIMARY KEY (`precio_unitario_producto_id`) USING BTREE,
  ADD KEY `detalle_unidad_producto_id` (`detalle_unidad_producto_id`) USING BTREE;

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`produccion_id`) USING BTREE,
  ADD KEY `rwerqwrw` (`empleado_id`) USING BTREE;

--
-- Indices de la tabla `produccion_producto`
--
ALTER TABLE `produccion_producto`
  ADD PRIMARY KEY (`produccion_producto_id`) USING BTREE,
  ADD KEY `producto_id` (`producto_id`) USING BTREE,
  ADD KEY `detalle_unidad_producto_id` (`detalle_unidad_producto_id`) USING BTREE,
  ADD KEY `produccion_id` (`produccion_id`) USING BTREE,
  ADD KEY `almacen_id` (`almacen_id`) USING BTREE;

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`producto_id`) USING BTREE,
  ADD KEY `categoria_producto_id` (`categoria_producto_id`) USING BTREE,
  ADD KEY `producto_ibfk_2` (`producto_id_tipoproducto`) USING BTREE,
  ADD KEY `producto_ibfk_3` (`unidad_medida_id`) USING BTREE,
  ADD KEY `clase_id` (`clase_id`) USING BTREE,
  ADD KEY `marca_id` (`marca_id`) USING BTREE,
  ADD KEY `moneda_id` (`moneda_id`) USING BTREE,
  ADD KEY `proveedor_id` (`proveedor_id`) USING BTREE;

--
-- Indices de la tabla `producto_plato`
--
ALTER TABLE `producto_plato`
  ADD PRIMARY KEY (`produccion_plato_id`) USING BTREE,
  ADD KEY `rwerwer` (`producto_id`) USING BTREE,
  ADD KEY `produccion_id` (`produccion_id`) USING BTREE;

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`proveedor_id`) USING BTREE,
  ADD KEY `empresa_ruc` (`empresa_ruc`) USING BTREE;

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id_provincia`) USING BTREE,
  ADD KEY `sasasd` (`id_departamento`) USING BTREE;

--
-- Indices de la tabla `sector_atencion`
--
ALTER TABLE `sector_atencion`
  ADD PRIMARY KEY (`sector_atencion_id`) USING BTREE,
  ADD KEY `sdfsdf` (`id_sede`) USING BTREE;

--
-- Indices de la tabla `sector_mesa`
--
ALTER TABLE `sector_mesa`
  ADD PRIMARY KEY (`sector_mesa_id`) USING BTREE,
  ADD KEY `dasdasdasd` (`id_sede`) USING BTREE;

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`id_sede`) USING BTREE,
  ADD KEY `id_distrito` (`id_distrito`) USING BTREE;

--
-- Indices de la tabla `sede_caja`
--
ALTER TABLE `sede_caja`
  ADD PRIMARY KEY (`id_sede_caja`) USING BTREE,
  ADD KEY `id_sede` (`id_sede`) USING BTREE,
  ADD KEY `id_caja` (`id_caja`) USING BTREE;

--
-- Indices de la tabla `sesion_caja`
--
ALTER TABLE `sesion_caja`
  ADD PRIMARY KEY (`id_sesion_caja`) USING BTREE,
  ADD KEY `id_usuario` (`id_empleado`) USING BTREE,
  ADD KEY `id_sede_caja` (`id_sede_caja`) USING BTREE;

--
-- Indices de la tabla `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`sexo_id`) USING BTREE;

--
-- Indices de la tabla `tipomovimiento_empleado`
--
ALTER TABLE `tipomovimiento_empleado`
  ADD PRIMARY KEY (`tipomovimientoempleado_id`) USING BTREE;

--
-- Indices de la tabla `tipo_comprobante_c`
--
ALTER TABLE `tipo_comprobante_c`
  ADD PRIMARY KEY (`id_tipo_comprobante`) USING BTREE;

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`tipodoc_id`) USING BTREE;

--
-- Indices de la tabla `tipo_entrega`
--
ALTER TABLE `tipo_entrega`
  ADD PRIMARY KEY (`tipoentrega_idtipoentrega`) USING BTREE,
  ADD KEY `fk_tipoentradasede` (`tipoentrega_idsede`) USING BTREE;

--
-- Indices de la tabla `tipo_igv`
--
ALTER TABLE `tipo_igv`
  ADD PRIMARY KEY (`tipo_igv_id`) USING BTREE;

--
-- Indices de la tabla `tipo_movimiento`
--
ALTER TABLE `tipo_movimiento`
  ADD PRIMARY KEY (`id_tipo_movimiento`) USING BTREE;

--
-- Indices de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`tipo_pago_id`) USING BTREE;

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`tipoproducto_id`) USING BTREE;

--
-- Indices de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  ADD PRIMARY KEY (`id_unidad_medida`) USING BTREE;

--
-- Indices de la tabla `usuario_eliminar`
--
ALTER TABLE `usuario_eliminar`
  ADD PRIMARY KEY (`id_usuarioe`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`venta_idventas`) USING BTREE,
  ADD KEY `fk_venta_moneda` (`venta_idmoneda`) USING BTREE,
  ADD KEY `fk_venta_tipopago` (`venta_tipopago`) USING BTREE,
  ADD KEY `fk_venta_formapago` (`venta_formapago`) USING BTREE,
  ADD KEY `fk_venta_silla` (`venta_codigosilla`) USING BTREE,
  ADD KEY `fk_venta_mozo` (`venta_codigomozo`) USING BTREE,
  ADD KEY `fk_venta_cliente` (`venta_codigocliente`) USING BTREE,
  ADD KEY `fk_venta_tipdocumento` (`ventas_idtipodocumento`) USING BTREE,
  ADD KEY `venta_credito_usuario` (`venta_credito_usuario`) USING BTREE,
  ADD KEY `fk_venta_idmovimiento` (`venta_idmovimiento`) USING BTREE,
  ADD KEY `fk_cajero_empleado` (`venta_id_cajero`) USING BTREE,
  ADD KEY `venta_codigomesa` (`venta_codigomesa`) USING BTREE,
  ADD KEY `ventaid_tipo_venta` (`ventaid_tipo_venta`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacenes`
--
ALTER TABLE `almacenes`
  MODIFY `almacen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `amortizacionpago`
--
ALTER TABLE `amortizacionpago`
  MODIFY `amor_pagoempleado_idamorpa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `amortizacionventa`
--
ALTER TABLE `amortizacionventa`
  MODIFY `amo_ventaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `bancos`
--
ALTER TABLE `bancos`
  MODIFY `banco_idbanco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `id_caja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  MODIFY `categoria_producto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clase`
--
ALTER TABLE `clase`
  MODIFY `clase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `compra_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `concepto`
--
ALTER TABLE `concepto`
  MODIFY `con_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `contrato_personal`
--
ALTER TABLE `contrato_personal`
  MODIFY `contrato_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuentas_venta_temporal`
--
ALTER TABLE `cuentas_venta_temporal`
  MODIFY `cuentas_idtemporal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuotacompra`
--
ALTER TABLE `cuotacompra`
  MODIFY `cuo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuotacompra_producto`
--
ALTER TABLE `cuotacompra_producto`
  MODIFY `cuo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cuotaventa`
--
ALTER TABLE `cuotaventa`
  MODIFY `cuo_ventaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  MODIFY `id_detalle_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `detalle_cuentas_temporal`
--
ALTER TABLE `detalle_cuentas_temporal`
  MODIFY `detalle_iddetalletemporal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_producto_almacen`
--
ALTER TABLE `detalle_producto_almacen`
  MODIFY `detalle_producto_almacen_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `detalle_unidad_producto`
--
ALTER TABLE `detalle_unidad_producto`
  MODIFY `detalle_unidad_producto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_detalle_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT de la tabla `distrito`
--
ALTER TABLE `distrito`
  MODIFY `id_distrito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documento`
--
ALTER TABLE `documento`
  MODIFY `id_documento` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `empleado_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empleado_adelanto`
--
ALTER TABLE `empleado_adelanto`
  MODIFY `empleado_adelanto_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado_asistencia`
--
ALTER TABLE `empleado_asistencia`
  MODIFY `empleado_asistencia_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado_descuento`
--
ALTER TABLE `empleado_descuento`
  MODIFY `empleado_descuento_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fondo_pension`
--
ALTER TABLE `fondo_pension`
  MODIFY `id_fondo_pension` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formapago`
--
ALTER TABLE `formapago`
  MODIFY `for_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `kardex_producto`
--
ALTER TABLE `kardex_producto`
  MODIFY `kardex_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `lugar_mesa`
--
ALTER TABLE `lugar_mesa`
  MODIFY `lugarmesa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `marca_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `mesa`
--
ALTER TABLE `mesa`
  MODIFY `mesa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `modulo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `monedas`
--
ALTER TABLE `monedas`
  MODIFY `moneda_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `motivo_contrato`
--
ALTER TABLE `motivo_contrato`
  MODIFY `motivo_contrato_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `motivo_descuento`
--
ALTER TABLE `motivo_descuento`
  MODIFY `motivo_descuento_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimiento`
--
ALTER TABLE `movimiento`
  MODIFY `mov_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT de la tabla `pago_empleado`
--
ALTER TABLE `pago_empleado`
  MODIFY `pago_empleado_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `perfil_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `precio_unitario_producto`
--
ALTER TABLE `precio_unitario_producto`
  MODIFY `precio_unitario_producto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
  MODIFY `produccion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `produccion_producto`
--
ALTER TABLE `produccion_producto`
  MODIFY `produccion_producto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `producto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `producto_plato`
--
ALTER TABLE `producto_plato`
  MODIFY `produccion_plato_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `proveedor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id_provincia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sector_atencion`
--
ALTER TABLE `sector_atencion`
  MODIFY `sector_atencion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sector_mesa`
--
ALTER TABLE `sector_mesa`
  MODIFY `sector_mesa_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sede`
--
ALTER TABLE `sede`
  MODIFY `id_sede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sede_caja`
--
ALTER TABLE `sede_caja`
  MODIFY `id_sede_caja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `sesion_caja`
--
ALTER TABLE `sesion_caja`
  MODIFY `id_sesion_caja` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `sexo`
--
ALTER TABLE `sexo`
  MODIFY `sexo_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipomovimiento_empleado`
--
ALTER TABLE `tipomovimiento_empleado`
  MODIFY `tipomovimientoempleado_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_comprobante_c`
--
ALTER TABLE `tipo_comprobante_c`
  MODIFY `id_tipo_comprobante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `tipodoc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_entrega`
--
ALTER TABLE `tipo_entrega`
  MODIFY `tipoentrega_idtipoentrega` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipo_igv`
--
ALTER TABLE `tipo_igv`
  MODIFY `tipo_igv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `tipo_pago_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `unidad_medida`
--
ALTER TABLE `unidad_medida`
  MODIFY `id_unidad_medida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `usuario_eliminar`
--
ALTER TABLE `usuario_eliminar`
  MODIFY `id_usuarioe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `venta_idventas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacenes`
--
ALTER TABLE `almacenes`
  ADD CONSTRAINT `almacenes_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`);

--
-- Filtros para la tabla `amortizacioncompra`
--
ALTER TABLE `amortizacioncompra`
  ADD CONSTRAINT `amortizacioncompra_ibfk_1` FOREIGN KEY (`amo_movimiento`) REFERENCES `movimiento` (`mov_id`),
  ADD CONSTRAINT `amortizacioncompra_ibfk_2` FOREIGN KEY (`amo_cuotacompra`) REFERENCES `cuotacompra` (`cuo_id`);

--
-- Filtros para la tabla `amortizacionpago`
--
ALTER TABLE `amortizacionpago`
  ADD CONSTRAINT `amortizacionpago_ibfk_1` FOREIGN KEY (`amor_pagoempleado_idadelanto`) REFERENCES `empleado_adelanto` (`empleado_adelanto_id`),
  ADD CONSTRAINT `amortizacionpago_ibfk_2` FOREIGN KEY (`amor_pagoempleado_iddescuento`) REFERENCES `empleado_descuento` (`empleado_descuento_id`),
  ADD CONSTRAINT `amortizacionpago_ibfk_3` FOREIGN KEY (`amor_pagoempleado_idtipomov`) REFERENCES `tipomovimiento_empleado` (`tipomovimientoempleado_id`),
  ADD CONSTRAINT `amortizacionpago_ibfk_4` FOREIGN KEY (`id_movimiento`) REFERENCES `movimiento` (`mov_id`),
  ADD CONSTRAINT `amortizacionpago_ibfk_5` FOREIGN KEY (`amor_pagoempleado_peid`) REFERENCES `pago_empleado` (`pago_empleado_id`),
  ADD CONSTRAINT `amortizacionpago_ibfk_6` FOREIGN KEY (`amor_pagoempleado_idfalta`) REFERENCES `personal_falta` (`id_personal_falta`);

--
-- Filtros para la tabla `amortizacionventa`
--
ALTER TABLE `amortizacionventa`
  ADD CONSTRAINT `amortizacionventa_ibfk_1` FOREIGN KEY (`amo_movimiento`) REFERENCES `movimiento` (`mov_id`),
  ADD CONSTRAINT `amortizacionventa_ibfk_2` FOREIGN KEY (`amo_cuotaventa`) REFERENCES `cuotaventa` (`cuo_ventaid`);

--
-- Filtros para la tabla `categoria_producto`
--
ALTER TABLE `categoria_producto`
  ADD CONSTRAINT `categoria_producto_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`almacen_id`) REFERENCES `almacenes` (`almacen_id`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`moneda_id`) REFERENCES `monedas` (`moneda_id`),
  ADD CONSTRAINT `compras_ibfk_3` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`proveedor_id`),
  ADD CONSTRAINT `compras_ibfk_4` FOREIGN KEY (`id_tipo_pago`) REFERENCES `tipo_documento` (`tipodoc_id`),
  ADD CONSTRAINT `compras_ibfk_5` FOREIGN KEY (`tipodoc_id`) REFERENCES `tipo_documento` (`tipodoc_id`),
  ADD CONSTRAINT `compras_ibfk_6` FOREIGN KEY (`compra_forma_pago`) REFERENCES `formapago` (`for_id`),
  ADD CONSTRAINT `compras_ibfk_7` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`empleado_id`),
  ADD CONSTRAINT `compras_ibfk_8` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`);

--
-- Filtros para la tabla `concepto`
--
ALTER TABLE `concepto`
  ADD CONSTRAINT `concepto_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`),
  ADD CONSTRAINT `concepto_ibfk_2` FOREIGN KEY (`id_tipo_movimiento`) REFERENCES `tipo_movimiento` (`id_tipo_movimiento`);

--
-- Filtros para la tabla `contrato_personal`
--
ALTER TABLE `contrato_personal`
  ADD CONSTRAINT `contrato_personal_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`),
  ADD CONSTRAINT `contrato_personal_ibfk_2` FOREIGN KEY (`motivo_contrato_id`) REFERENCES `motivo_contrato` (`motivo_contrato_id`);

--
-- Filtros para la tabla `cuentas_venta_temporal`
--
ALTER TABLE `cuentas_venta_temporal`
  ADD CONSTRAINT `cuentas_venta_temporal_ibfk_1` FOREIGN KEY (`cuentas_idventas`) REFERENCES `venta` (`venta_idventas`);

--
-- Filtros para la tabla `cuotacompra`
--
ALTER TABLE `cuotacompra`
  ADD CONSTRAINT `cuotacompra_ibfk_1` FOREIGN KEY (`cuo_compra`) REFERENCES `compras` (`compra_id`);

--
-- Filtros para la tabla `cuotacompra_producto`
--
ALTER TABLE `cuotacompra_producto`
  ADD CONSTRAINT `cuotacompra_producto_ibfk_1` FOREIGN KEY (`cuo_compra`) REFERENCES `comprasproducto` (`comprap_id`);

--
-- Filtros para la tabla `cuotaventa`
--
ALTER TABLE `cuotaventa`
  ADD CONSTRAINT `cuotaventa_ibfk_1` FOREIGN KEY (`cuo_venta`) REFERENCES `venta` (`venta_idventas`);

--
-- Filtros para la tabla `desactivar_producto`
--
ALTER TABLE `desactivar_producto`
  ADD CONSTRAINT `desactivar_producto_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`);

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `dasdasd` FOREIGN KEY (`tipo_igv_id`) REFERENCES `tipo_igv` (`tipo_igv_id`),
  ADD CONSTRAINT `detalle_compras_ibfk_1` FOREIGN KEY (`compra_id`) REFERENCES `compras` (`compra_id`),
  ADD CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`detalle_compra_detalle_unidad_medida`) REFERENCES `detalle_unidad_producto` (`detalle_unidad_producto_id`),
  ADD CONSTRAINT `detalle_compras_ibfk_3` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`);

--
-- Filtros para la tabla `detalle_cuentas_temporal`
--
ALTER TABLE `detalle_cuentas_temporal`
  ADD CONSTRAINT `detalle_cuentas_temporal_ibfk_1` FOREIGN KEY (`cod_producto_venta`) REFERENCES `producto` (`producto_id`),
  ADD CONSTRAINT `detalle_cuentas_temporal_ibfk_2` FOREIGN KEY (`cuentas_idtemporal`) REFERENCES `cuentas_venta_temporal` (`cuentas_idtemporal`);

--
-- Filtros para la tabla `detalle_doc_sede`
--
ALTER TABLE `detalle_doc_sede`
  ADD CONSTRAINT `detalle_doc_sede_ibfk_1` FOREIGN KEY (`detalle_id_documento`) REFERENCES `documento` (`id_documento`),
  ADD CONSTRAINT `detalle_doc_sede_ibfk_2` FOREIGN KEY (`detalle_id_sede`) REFERENCES `sede` (`id_sede`);

--
-- Filtros para la tabla `detalle_empleados_sector_mesa`
--
ALTER TABLE `detalle_empleados_sector_mesa`
  ADD CONSTRAINT `detalle_empleados_sector_mesa_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`),
  ADD CONSTRAINT `detalle_empleados_sector_mesa_ibfk_2` FOREIGN KEY (`sector_mesa_id`) REFERENCES `sector_mesa` (`sector_mesa_id`);

--
-- Filtros para la tabla `detalle_mesa_sector_mesa`
--
ALTER TABLE `detalle_mesa_sector_mesa`
  ADD CONSTRAINT `detalle_mesa_sector_mesa_ibfk_1` FOREIGN KEY (`sector_mesa_id`) REFERENCES `sector_mesa` (`sector_mesa_id`),
  ADD CONSTRAINT `detalle_mesa_sector_mesa_ibfk_2` FOREIGN KEY (`mesa_id`) REFERENCES `mesa` (`mesa_id`);

--
-- Filtros para la tabla `detalle_producto_almacen`
--
ALTER TABLE `detalle_producto_almacen`
  ADD CONSTRAINT `detalle_producto_almacen_ibfk_1` FOREIGN KEY (`detalle_almacen`) REFERENCES `almacenes` (`almacen_id`),
  ADD CONSTRAINT `detalle_producto_almacen_ibfk_2` FOREIGN KEY (`detalle_producto`) REFERENCES `producto` (`producto_id`);

--
-- Filtros para la tabla `detalle_unidad_producto`
--
ALTER TABLE `detalle_unidad_producto`
  ADD CONSTRAINT `detalle_unidad_producto_ibfk_1` FOREIGN KEY (`id_unidad_medida`) REFERENCES `unidad_medida` (`id_unidad_medida`),
  ADD CONSTRAINT `detalle_unidad_producto_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`);

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_tipoentrega`) REFERENCES `tipo_entrega` (`tipoentrega_idtipoentrega`),
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`venta_idventas`),
  ADD CONSTRAINT `detalle_venta_ibfk_3` FOREIGN KEY (`cod_producto_venta`) REFERENCES `producto` (`producto_id`);

--
-- Filtros para la tabla `distrito`
--
ALTER TABLE `distrito`
  ADD CONSTRAINT `distrito_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`);

--
-- Filtros para la tabla `documento`
--
ALTER TABLE `documento`
  ADD CONSTRAINT `documento_ibfk_1` FOREIGN KEY (`id_tipodocumento`) REFERENCES `tipo_documento` (`tipodoc_id`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`perfil_id`) REFERENCES `perfiles` (`perfil_id`),
  ADD CONSTRAINT `empleados_ibfk_3` FOREIGN KEY (`empresa_sede`) REFERENCES `sede` (`id_sede`),
  ADD CONSTRAINT `empleados_ibfk_4` FOREIGN KEY (`id_fondo_pension`) REFERENCES `fondo_pension` (`id_fondo_pension`),
  ADD CONSTRAINT `empleados_ibfk_5` FOREIGN KEY (`empleado_idsalud`) REFERENCES `fondo_salud` (`fondosalud_idsalud`),
  ADD CONSTRAINT `empleados_ibfk_6` FOREIGN KEY (`empleado_idbanco`) REFERENCES `bancos` (`banco_idbanco`);

--
-- Filtros para la tabla `empleado_adelanto`
--
ALTER TABLE `empleado_adelanto`
  ADD CONSTRAINT `empleado_adelanto_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`);

--
-- Filtros para la tabla `empleado_asistencia`
--
ALTER TABLE `empleado_asistencia`
  ADD CONSTRAINT `empleado_asistencia_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`);

--
-- Filtros para la tabla `empleado_descuento`
--
ALTER TABLE `empleado_descuento`
  ADD CONSTRAINT `empleado_descuento_ibfk_1` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`),
  ADD CONSTRAINT `empleado_descuento_ibfk_2` FOREIGN KEY (`motivo_descuento_id`) REFERENCES `motivo_descuento` (`motivo_descuento_id`);

--
-- Filtros para la tabla `fondo_pension`
--
ALTER TABLE `fondo_pension`
  ADD CONSTRAINT `fondo_pension_ibfk_1` FOREIGN KEY (`fondo_pension_idtiporetencion`) REFERENCES `tiporetencion` (`idtiporetencion`);

--
-- Filtros para la tabla `kardex_producto`
--
ALTER TABLE `kardex_producto`
  ADD CONSTRAINT `kardex_producto_ibfk_1` FOREIGN KEY (`detalle_producto_almacen_id`) REFERENCES `detalle_producto_almacen` (`detalle_producto_almacen_id`);

--
-- Filtros para la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD CONSTRAINT `mesa_ibfk_1` FOREIGN KEY (`mesa_id_lugar`) REFERENCES `lugar_mesa` (`lugarmesa_id`);

--
-- Filtros para la tabla `motivo_descuento`
--
ALTER TABLE `motivo_descuento`
  ADD CONSTRAINT `motivo_descuento_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`);

--
-- Filtros para la tabla `movimiento`
--
ALTER TABLE `movimiento`
  ADD CONSTRAINT `movimiento_ibfk_1` FOREIGN KEY (`mov_formapago`) REFERENCES `formapago` (`for_id`),
  ADD CONSTRAINT `movimiento_ibfk_2` FOREIGN KEY (`mov_concepto`) REFERENCES `concepto` (`con_id`),
  ADD CONSTRAINT `movimiento_ibfk_3` FOREIGN KEY (`id_sesion_caja`) REFERENCES `sesion_caja` (`id_sesion_caja`),
  ADD CONSTRAINT `movimiento_ibfk_4` FOREIGN KEY (`id_tipo_comprobante`) REFERENCES `tipo_comprobante_c` (`id_tipo_comprobante`);

--
-- Filtros para la tabla `pago_empleado`
--
ALTER TABLE `pago_empleado`
  ADD CONSTRAINT `pago_empleado_ibfk_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`empleado_id`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`modulo_id`) REFERENCES `modulos` (`modulo_id`),
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`id_tipo_negocio`) REFERENCES `tipo_negocio` (`id_tipo_negocio`);

--
-- Filtros para la tabla `permisos_sede`
--
ALTER TABLE `permisos_sede`
  ADD CONSTRAINT `permisos_sede_ibfk_1` FOREIGN KEY (`persed_id_modulo`) REFERENCES `modulos` (`modulo_id`),
  ADD CONSTRAINT `permisos_sede_ibfk_2` FOREIGN KEY (`persed_id_perfil`) REFERENCES `perfiles` (`perfil_id`),
  ADD CONSTRAINT `permisos_sede_ibfk_3` FOREIGN KEY (`persed_id_sede`) REFERENCES `sede` (`id_sede`);

--
-- Filtros para la tabla `precio_unitario_producto`
--
ALTER TABLE `precio_unitario_producto`
  ADD CONSTRAINT `precio_unitario_producto_ibfk_1` FOREIGN KEY (`detalle_unidad_producto_id`) REFERENCES `detalle_unidad_producto` (`detalle_unidad_producto_id`);

--
-- Filtros para la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD CONSTRAINT `rwerqwrw` FOREIGN KEY (`empleado_id`) REFERENCES `empleados` (`empleado_id`);

--
-- Filtros para la tabla `produccion_producto`
--
ALTER TABLE `produccion_producto`
  ADD CONSTRAINT `produccion_producto_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`),
  ADD CONSTRAINT `produccion_producto_ibfk_2` FOREIGN KEY (`detalle_unidad_producto_id`) REFERENCES `detalle_unidad_producto` (`detalle_unidad_producto_id`),
  ADD CONSTRAINT `produccion_producto_ibfk_3` FOREIGN KEY (`produccion_id`) REFERENCES `produccion` (`produccion_id`),
  ADD CONSTRAINT `produccion_producto_ibfk_4` FOREIGN KEY (`almacen_id`) REFERENCES `almacenes` (`almacen_id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`categoria_producto_id`) REFERENCES `categoria_producto` (`categoria_producto_id`),
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`producto_id_tipoproducto`) REFERENCES `tipo_producto` (`tipoproducto_id`),
  ADD CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`unidad_medida_id`) REFERENCES `unidad_medida` (`id_unidad_medida`),
  ADD CONSTRAINT `producto_ibfk_4` FOREIGN KEY (`clase_id`) REFERENCES `clase` (`clase_id`),
  ADD CONSTRAINT `producto_ibfk_5` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`marca_id`),
  ADD CONSTRAINT `producto_ibfk_6` FOREIGN KEY (`moneda_id`) REFERENCES `monedas` (`moneda_id`),
  ADD CONSTRAINT `producto_ibfk_7` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`proveedor_id`);

--
-- Filtros para la tabla `producto_plato`
--
ALTER TABLE `producto_plato`
  ADD CONSTRAINT `producto_plato_ibfk_1` FOREIGN KEY (`produccion_id`) REFERENCES `produccion` (`produccion_id`),
  ADD CONSTRAINT `rwerwer` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`);

--
-- Filtros para la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `provincia_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`);

--
-- Filtros para la tabla `sector_atencion`
--
ALTER TABLE `sector_atencion`
  ADD CONSTRAINT `sector_atencion_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`);

--
-- Filtros para la tabla `sector_mesa`
--
ALTER TABLE `sector_mesa`
  ADD CONSTRAINT `sector_mesa_ibfk_1` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`);

--
-- Filtros para la tabla `sede`
--
ALTER TABLE `sede`
  ADD CONSTRAINT `sede_ibfk_2` FOREIGN KEY (`id_distrito`) REFERENCES `distrito` (`id_distrito`);

--
-- Filtros para la tabla `sede_caja`
--
ALTER TABLE `sede_caja`
  ADD CONSTRAINT `sede_caja_ibfk_1` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id_caja`),
  ADD CONSTRAINT `sede_caja_ibfk_2` FOREIGN KEY (`id_sede`) REFERENCES `sede` (`id_sede`);

--
-- Filtros para la tabla `sesion_caja`
--
ALTER TABLE `sesion_caja`
  ADD CONSTRAINT `sesion_caja_ibfk_1` FOREIGN KEY (`id_sede_caja`) REFERENCES `sede_caja` (`id_sede_caja`),
  ADD CONSTRAINT `sesion_caja_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`empleado_id`);

--
-- Filtros para la tabla `tipo_entrega`
--
ALTER TABLE `tipo_entrega`
  ADD CONSTRAINT `tipo_entrega_ibfk_1` FOREIGN KEY (`tipoentrega_idsede`) REFERENCES `sede` (`id_sede`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`venta_id_cajero`) REFERENCES `empleados` (`empleado_id`),
  ADD CONSTRAINT `venta_ibfk_10` FOREIGN KEY (`venta_codigocliente`) REFERENCES `clientes` (`cliente_id`),
  ADD CONSTRAINT `venta_ibfk_11` FOREIGN KEY (`venta_codigomesa`) REFERENCES `mesa` (`mesa_id`),
  ADD CONSTRAINT `venta_ibfk_12` FOREIGN KEY (`ventaid_tipo_venta`) REFERENCES `tipo_igv` (`tipo_igv_id`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`venta_formapago`) REFERENCES `formapago` (`for_id`),
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`venta_idmovimiento`) REFERENCES `movimiento` (`mov_id`),
  ADD CONSTRAINT `venta_ibfk_4` FOREIGN KEY (`venta_idmoneda`) REFERENCES `monedas` (`moneda_id`),
  ADD CONSTRAINT `venta_ibfk_5` FOREIGN KEY (`venta_codigomozo`) REFERENCES `empleados` (`empleado_id`),
  ADD CONSTRAINT `venta_ibfk_7` FOREIGN KEY (`ventas_idtipodocumento`) REFERENCES `tipo_documento` (`tipodoc_id`),
  ADD CONSTRAINT `venta_ibfk_8` FOREIGN KEY (`venta_tipopago`) REFERENCES `tipo_pago` (`tipo_pago_id`),
  ADD CONSTRAINT `venta_ibfk_9` FOREIGN KEY (`venta_credito_usuario`) REFERENCES `empleados` (`empleado_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
