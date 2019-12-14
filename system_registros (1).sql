-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-12-2019 a las 23:06:01
-- Versión del servidor: 10.3.16-MariaDB
-- Versión de PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `system_registros`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_almacen`
--

CREATE TABLE `tb_almacen` (
  `idalmacen` char(2) NOT NULL,
  `idproducto` char(2) NOT NULL,
  `id_ctg_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_categoria`
--

CREATE TABLE `tb_categoria` (
  `idcategoria` char(2) NOT NULL,
  `nombre_cateria` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_categoria_identificacion`
--

CREATE TABLE `tb_categoria_identificacion` (
  `id_ctg_idtf` int(11) NOT NULL COMMENT 'Codigo de la categoria de tipo de identificacion',
  `nombre_ctg_idtf` varchar(50) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre del tipo de identificacion',
  `acronimo_ctg_idtf` varchar(12) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Acronimos de los tipos de identificación',
  `suspended_ctg_idtf` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Suspension por tipo de identificacion del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tb_categoria_identificacion`
--

INSERT INTO `tb_categoria_identificacion` (`id_ctg_idtf`, `nombre_ctg_idtf`, `acronimo_ctg_idtf`, `suspended_ctg_idtf`) VALUES
(1, 'LIBRETA ELECTORAL O DNI', 'L.E / DNI', 1),
(2, 'CARNET DE EXTRANJERIA', 'CARNET EXT.', 1),
(3, 'REG. UNICO DE CONTRIBUYENTES', 'RUC', 1),
(4, 'PASAPORTE', 'PASAPORTE', 1),
(5, 'PART. DE NACIMIENTO-IDENTIDAD', 'P. NAC.', 1),
(6, 'OTROS', 'OTROS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_categoria_usuario`
--

CREATE TABLE `tb_categoria_usuario` (
  `id_ctg_user` int(11) NOT NULL COMMENT 'Codigo de la categoria del usuario',
  `nombre_ctg_user` varchar(30) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre de la categoria del usuario',
  `suspended_ctg_user` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Suspension por categoria del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tb_categoria_usuario`
--

INSERT INTO `tb_categoria_usuario` (`id_ctg_user`, `nombre_ctg_user`, `suspended_ctg_user`) VALUES
(1, 'GERENTE', 1),
(2, 'JEFE DE COMPRAS', 1),
(3, 'VENDEDOR', 1),
(4, 'CAJA', 1),
(5, 'ALMACENERO', 1),
(6, 'DIVISIÓN DE SISTEMAS', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_datos_personal`
--

CREATE TABLE `tb_datos_personal` (
  `codigo_dt_user` int(8) NOT NULL COMMENT 'Codigo del usuario relacional con tb_usuario',
  `id_ctg_idtf` int(11) NOT NULL COMMENT 'Id codigo de identificacion relacional con tb_categoria_identificacion',
  `numero_idtf` int(25) NOT NULL COMMENT 'Número de identificación del trabajador',
  `nombres_pers` varchar(150) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombres del trabajador',
  `ap_p_pers` varchar(50) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Apellido paterno del trabajador',
  `ap_m_pers` varchar(50) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Apellido materno del trabajador',
  `edad_pers` int(3) NOT NULL COMMENT 'Edad del Trabajador',
  `nivel_educ_pers` enum('SECUNDARIA COMPLETA','SECUNDARIA INCOMPLETA','PRIMARIA COMPLETA','PRIMARIA INCOMPLETA') COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nivel de Educación',
  `correo_pers` varchar(150) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Correo del trabajador',
  `telefono_fijo` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Teléfono fijo del trabajador',
  `phone1` varchar(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Teléfono celular 1 del trabajador',
  `phone2` int(9) NOT NULL COMMENT 'Telefono celular 2 del trabajador',
  `city_pers` varchar(120) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Ciudad',
  `cod_pais` int(11) NOT NULL COMMENT 'Código de país, relacional con tb_país',
  `domc_f_pers` varchar(150) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Domicilio fiscal del personal',
  `fecha_nac_pers` date NOT NULL COMMENT 'Fecha de nacimiento de trabajador',
  `sexo_pers` enum('HOMBRE','MUJER') COLLATE utf8_spanish_ci NOT NULL COMMENT 'Sexo del trabajador'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tb_datos_personal`
--

INSERT INTO `tb_datos_personal` (`codigo_dt_user`, `id_ctg_idtf`, `numero_idtf`, `nombres_pers`, `ap_p_pers`, `ap_m_pers`, `edad_pers`, `nivel_educ_pers`, `correo_pers`, `telefono_fijo`, `phone1`, `phone2`, `city_pers`, `cod_pais`, `domc_f_pers`, `fecha_nac_pers`, `sexo_pers`) VALUES
(1, 1, 42196606, 'ROBERTO JOSE', 'VELASQUEZ', 'HERRERA', 30, 'SECUNDARIA COMPLETA', 'robertojvh@hotmail.com', NULL, '943651866', 943651865, 'TUMBES', 7, '', '1989-04-13', 'HOMBRE'),
(2, 1, 42196804, 'ALBERTH SEFERINO', 'YAJAHUANCA', 'SANTOS', 29, 'SECUNDARIA COMPLETA', '2103162013@uladech.pe', NULL, '', 990598423, 'TUMBES', 7, '', '1990-08-12', 'HOMBRE'),
(3, 1, 73420372, 'RAFAEL ENRIQUE', 'CALLIRGOS', 'IZQUIERDO', 20, 'SECUNDARIA COMPLETA', 'rafael_callirgos@hotmail.com', NULL, '944812170', 936526908, 'TUMBES', 7, 'AAHH PEDRO CHAMOCHUMBI MZ H LT. 14', '1999-09-07', 'HOMBRE'),
(4, 1, 73420375, 'CESAR AUGUSTO', 'BENITES', 'MONTANO', 33, 'SECUNDARIA COMPLETA', 'benites_cesar@hotmail.com', NULL, '', 936548963, 'TUMBES', 7, '', '1986-08-07', 'HOMBRE'),
(5, 1, 17612713, 'RAFAEL', 'CALLIRGOS', 'VASQUEZ', 49, 'SECUNDARIA COMPLETA', 'callirgosr@gmail.com', NULL, '990898528', 971774759, 'TUMBES', 7, 'AAHH PEDRO CHAMOCHUMBI MZ H LT. 14', '1970-08-23', 'HOMBRE'),
(6, 1, 72003485, 'SEGUNDO ROLANDO', 'GARAY', 'MORAN', 18, 'SECUNDARIA COMPLETA', 'garayrolando290@gmail.com', NULL, '972500373', 0, 'TUMBES', 7, 'JR. DIEGO FERRER#110', '2001-02-27', 'HOMBRE'),
(7, 1, 72812378, 'PABLO JR.', 'YARLEQUE', 'RAMOS', 18, 'SECUNDARIA COMPLETA', 'pabloyarleque05@gmail.com', NULL, '', 916293211, 'TUMBES', 7, 'LAS MERCEDES', '2001-06-05', 'HOMBRE'),
(8, 1, 72816725, 'CARLOS DAVID', 'VALVERDE', 'REYES', 19, 'SECUNDARIA COMPLETA', 'davidvalverdereyes21@gmail.com', NULL, '', 924802286, 'TUMBES', 7, 'EL PACIFICO', '2000-08-21', 'HOMBRE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_moneda`
--

CREATE TABLE `tb_moneda` (
  `cod_moneda` int(11) NOT NULL COMMENT 'Código de la Moneda',
  `nombre_moneda` varchar(50) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre de la Moneda',
  `acronimo_moneda` enum('MN','US') COLLATE utf8_spanish_ci NOT NULL COMMENT 'Acronimos de los nombres',
  `suspended_moneda` tinyint(4) NOT NULL DEFAULT 1 COMMENT 'Suspensión de moneda'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tb_moneda`
--

INSERT INTO `tb_moneda` (`cod_moneda`, `nombre_moneda`, `acronimo_moneda`, `suspended_moneda`) VALUES
(1, 'SOLES', 'MN', 1),
(2, 'DOLAR USA', 'US', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_pais`
--

CREATE TABLE `tb_pais` (
  `cod_pais` int(11) NOT NULL COMMENT 'Código del país',
  `nombre_pais` varchar(50) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre del país',
  `acronimo_pais` enum('AR','BO','BR','CH','CO','EC','PE','VE','USA') COLLATE utf8_spanish_ci NOT NULL COMMENT 'Acronimo del país',
  `suspended_pais` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Suspensión del país'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tb_pais`
--

INSERT INTO `tb_pais` (`cod_pais`, `nombre_pais`, `acronimo_pais`, `suspended_pais`) VALUES
(1, 'ARGENTINA', 'AR', 1),
(2, 'BOLIVIA', 'BO', 1),
(3, 'BRASIL', 'BR', 1),
(4, 'CHILE', 'CH', 1),
(5, 'COLOMBIA', 'CO', 1),
(6, 'ECUADOR', 'EC', 1),
(7, 'PERÚ', 'PE', 1),
(8, 'VENEZUELA', 'VE', 1),
(9, 'ESTADOS UNIDOS', 'USA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_producto`
--

CREATE TABLE `tb_producto` (
  `idproducto` char(2) NOT NULL,
  `idcategoria` char(2) NOT NULL,
  `nomproducto` varchar(20) NOT NULL,
  `u_medida` varchar(20) NOT NULL,
  `precio` double(4,2) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `fecha_vence` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_proveedor`
--

CREATE TABLE `tb_proveedor` (
  `cod_proveedor` int(11) NOT NULL COMMENT 'Código único del proveedor',
  `id_ctg_idtf` int(11) NOT NULL COMMENT 'Id codigo de identificacion relacional con tb_categoria_identificacion',
  `numero_idtf` varchar(13) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Número de identificación',
  `nombre_proveedor` varchar(255) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre del titular (PROVEEDOR)',
  `nombre_comercial` varchar(150) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre de la Empresa',
  `correo_proveedor` varchar(100) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Correo del proveedor',
  `skype` varchar(50) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Skype Proveedor',
  `telefono_fijo` varchar(20) COLLATE utf8_spanish_ci DEFAULT 'NULL' COMMENT 'Teléfono fijo del proveedor',
  `phone1` varchar(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Teléfono celular 1 del proveedor',
  `phone2` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Teléfono celular 2 del proveedor',
  `city` varchar(120) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Ciudad',
  `cod_pais` int(11) NOT NULL COMMENT 'Código de país, relacional con tb_país',
  `url_proveedor` varchar(255) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Pagina web del proveedor',
  `description_proveedor` longtext COLLATE utf8_spanish_ci NOT NULL COMMENT 'Descripción del proveedores',
  `fecha_registro` date NOT NULL COMMENT 'Fecha de registro del Proveedor',
  `suspended_SUNAT` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Estado según SUNAT',
  `suspended_proveedor` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Suspension por cuenta del proveedor'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tb_proveedor`
--

INSERT INTO `tb_proveedor` (`cod_proveedor`, `id_ctg_idtf`, `numero_idtf`, `nombre_proveedor`, `nombre_comercial`, `correo_proveedor`, `skype`, `telefono_fijo`, `phone1`, `phone2`, `city`, `cod_pais`, `url_proveedor`, `description_proveedor`, `fecha_registro`, `suspended_SUNAT`, `suspended_proveedor`) VALUES
(1, 3, '10421966066', 'VELASQUEZ HERRERA ROBERTO JOSE', 'COMPRA EN UN CLICK', 'compraenunclick010@gmail.com', '+51943651865', NULL, '943651865', '943651866', 'TUMBES', 7, 'www.compraencunclick.com', '- Soporte técnico y mantenimiento preventivo de hardware y software.\r\n- Mantenimiento de redes.\r\n- Diagnostico y solución de problemas informáticos.\r\n- Desarrollo de sistemas web y aplicaciones móviles.\r\n- Alquiler de sistemas educativos, de ventas y de control de inventario.\r\n- Ventas de computadoras, laptops y artículos tecnológicos.', '2019-10-07', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_sede`
--

CREATE TABLE `tb_sede` (
  `idsede` char(2) NOT NULL,
  `nom_sede` varchar(20) NOT NULL,
  `idalmacen` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_session_hst`
--

CREATE TABLE `tb_session_hst` (
  `cod_session_hst` bigint(10) NOT NULL COMMENT 'Codigo del historial de la session',
  `cod_user` int(11) NOT NULL COMMENT 'Codigo del usuario relacional con tb_usuario',
  `ip_user` char(15) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Ip del usuario que crea la ssesion',
  `sessdata` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL COMMENT 'Tiempo de inicio format unix',
  `timemodified` bigint(10) NOT NULL COMMENT 'Tiempo de modificacion o termina session format unix'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tb_session_hst`
--

INSERT INTO `tb_session_hst` (`cod_session_hst`, `cod_user`, `ip_user`, `sessdata`, `timecreated`, `timemodified`) VALUES
(1, 1, '179.7.192.135', '1191g0129qnd1i8ai98onk4r62', 1566717210, 1566724410),
(2, 2, '192.168.0.68', 'v00845l3827tbg4827b46u4214', 1566724410, 1566746010),
(3, 1, '179.7.192.135', 'v00845l3827tbg4827b46u4214', 1566832410, 1566836010),
(4, 3, '192.168.1.52', '6khivkbuusonh8pkmam3ngune0', 1566832410, 1566839610),
(5, 4, '172.16.10.85', 'iibpan3lvf0j7d14hm8fp98lo5', 1566764010, 1566766290);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_tipo_cambio`
--

CREATE TABLE `tb_tipo_cambio` (
  `id_tipo_cambio` int(11) NOT NULL COMMENT 'Código tipo de cambio',
  `cod_moneda` int(11) NOT NULL COMMENT 'Código de la moneda, relacional con tb_moneda',
  `año_registro` int(11) NOT NULL,
  `mes_registro` int(11) NOT NULL,
  `dia_registro` int(11) NOT NULL,
  `compra_moneda` decimal(10,4) NOT NULL,
  `venta_moneda` decimal(10,4) NOT NULL,
  `fecha_registro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tb_tipo_cambio`
--

INSERT INTO `tb_tipo_cambio` (`id_tipo_cambio`, `cod_moneda`, `año_registro`, `mes_registro`, `dia_registro`, `compra_moneda`, `venta_moneda`, `fecha_registro`) VALUES
(1, 2, 19, 9, 1, '3.2520', '3.2540', '2019-09-01'),
(2, 2, 19, 9, 3, '3.2510', '3.2550', '2019-09-03'),
(3, 2, 19, 9, 7, '3.5000', '3.8000', '2019-09-07'),
(4, 2, 19, 10, 9, '3.2500', '3.5000', '2019-10-09'),
(5, 1, 19, 11, 12, '3.4000', '3.5000', '2019-11-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `cod_user` int(11) NOT NULL COMMENT 'Código del usuario para la session',
  `user_name` varchar(100) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Nombre del usuario Session',
  `password_user` varchar(32) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Contraseña Encriptación MD5',
  `id_ctg_usuario` int(11) NOT NULL COMMENT 'Codigo de la categoria del usuario relacional con tb_categoria_usuario',
  `codigo_dt_user` int(8) NOT NULL COMMENT 'Codigo del usuario relacional con datos del personal',
  `suspended_user` tinyint(1) NOT NULL DEFAULT 1 COMMENT 'Suspension por cuenta del usuario',
  `description_user` longtext COLLATE utf8_spanish_ci NOT NULL COMMENT 'Descripcion de los roles del usuario segun la categoria'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tb_usuario`
--

INSERT INTO `tb_usuario` (`cod_user`, `user_name`, `password_user`, `id_ctg_usuario`, `codigo_dt_user`, `suspended_user`, `description_user`) VALUES
(1, 'rvelasquez', '123456', 1, 1, 1, 'Este usuario sólo tiene acceso de lectura y escritura en ciertas opciones (GERENTE GENERAL).'),
(2, 'rcallirgos', '1234', 2, 3, 1, 'Este usuario sólo tiene acceso de lectura y escritura en ciertas opciones (JEFE DE COMPRAS).'),
(3, 'aseferino', 'e10adc3949ba59abbe56e057f20f883e', 3, 2, 1, 'Este usuario sólo tiene acceso de lectura y escritura en ciertas opciones (VENDEDOR).'),
(4, 'cbenites', 'e10adc3949ba59abbe56e057f20f883e', 4, 4, 1, 'Este usuario sólo tiene acceso de lectura y escritura en ciertas opciones (ALMACENERO).'),
(10, 'rcallirgosv', '123456789', 4, 5, 0, 'Este usuario sólo tiene acceso de lectura y escritura en ciertas opciones (ALMACENERO).');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_almacen`
--
ALTER TABLE `tb_almacen`
  ADD PRIMARY KEY (`idalmacen`),
  ADD KEY `idproducto` (`idproducto`),
  ADD KEY `id_ctg_usuario` (`id_ctg_usuario`);

--
-- Indices de la tabla `tb_categoria`
--
ALTER TABLE `tb_categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `tb_categoria_identificacion`
--
ALTER TABLE `tb_categoria_identificacion`
  ADD PRIMARY KEY (`id_ctg_idtf`);

--
-- Indices de la tabla `tb_categoria_usuario`
--
ALTER TABLE `tb_categoria_usuario`
  ADD PRIMARY KEY (`id_ctg_user`);

--
-- Indices de la tabla `tb_datos_personal`
--
ALTER TABLE `tb_datos_personal`
  ADD PRIMARY KEY (`codigo_dt_user`),
  ADD KEY `id_ctg_idtf` (`id_ctg_idtf`),
  ADD KEY `cod_pais` (`cod_pais`);

--
-- Indices de la tabla `tb_moneda`
--
ALTER TABLE `tb_moneda`
  ADD PRIMARY KEY (`cod_moneda`);

--
-- Indices de la tabla `tb_pais`
--
ALTER TABLE `tb_pais`
  ADD PRIMARY KEY (`cod_pais`);

--
-- Indices de la tabla `tb_producto`
--
ALTER TABLE `tb_producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `idcategoria` (`idcategoria`);

--
-- Indices de la tabla `tb_proveedor`
--
ALTER TABLE `tb_proveedor`
  ADD PRIMARY KEY (`cod_proveedor`),
  ADD KEY `id_ctg_idtf` (`id_ctg_idtf`),
  ADD KEY `cod_pais` (`cod_pais`);

--
-- Indices de la tabla `tb_sede`
--
ALTER TABLE `tb_sede`
  ADD PRIMARY KEY (`idsede`),
  ADD KEY `idalmacen` (`idalmacen`);

--
-- Indices de la tabla `tb_session_hst`
--
ALTER TABLE `tb_session_hst`
  ADD PRIMARY KEY (`cod_session_hst`),
  ADD KEY `cod_user` (`cod_user`);

--
-- Indices de la tabla `tb_tipo_cambio`
--
ALTER TABLE `tb_tipo_cambio`
  ADD PRIMARY KEY (`id_tipo_cambio`),
  ADD KEY `cod_moneda` (`cod_moneda`);

--
-- Indices de la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`cod_user`),
  ADD KEY `id_ctg_usuario` (`id_ctg_usuario`),
  ADD KEY `codigo_dt_user` (`codigo_dt_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_categoria_identificacion`
--
ALTER TABLE `tb_categoria_identificacion`
  MODIFY `id_ctg_idtf` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la categoria de tipo de identificacion', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tb_categoria_usuario`
--
ALTER TABLE `tb_categoria_usuario`
  MODIFY `id_ctg_user` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Codigo de la categoria del usuario', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tb_datos_personal`
--
ALTER TABLE `tb_datos_personal`
  MODIFY `codigo_dt_user` int(8) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del usuario relacional con tb_usuario', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tb_moneda`
--
ALTER TABLE `tb_moneda`
  MODIFY `cod_moneda` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código de la Moneda', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_pais`
--
ALTER TABLE `tb_pais`
  MODIFY `cod_pais` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del país', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tb_proveedor`
--
ALTER TABLE `tb_proveedor`
  MODIFY `cod_proveedor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código único del proveedor', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tb_session_hst`
--
ALTER TABLE `tb_session_hst`
  MODIFY `cod_session_hst` bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'Codigo del historial de la session', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tb_tipo_cambio`
--
ALTER TABLE `tb_tipo_cambio`
  MODIFY `id_tipo_cambio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código tipo de cambio', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `cod_user` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Código del usuario para la session', AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_almacen`
--
ALTER TABLE `tb_almacen`
  ADD CONSTRAINT `tb_almacen_ibfk_1` FOREIGN KEY (`id_ctg_usuario`) REFERENCES `tb_usuario` (`cod_user`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_datos_personal`
--
ALTER TABLE `tb_datos_personal`
  ADD CONSTRAINT `tb_datos_personal_ibfk_1` FOREIGN KEY (`id_ctg_idtf`) REFERENCES `tb_categoria_identificacion` (`id_ctg_idtf`),
  ADD CONSTRAINT `tb_datos_personal_ibfk_2` FOREIGN KEY (`cod_pais`) REFERENCES `tb_pais` (`cod_pais`);

--
-- Filtros para la tabla `tb_producto`
--
ALTER TABLE `tb_producto`
  ADD CONSTRAINT `tb_producto_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `tb_categoria` (`idcategoria`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_proveedor`
--
ALTER TABLE `tb_proveedor`
  ADD CONSTRAINT `tb_proveedor_ibfk_1` FOREIGN KEY (`id_ctg_idtf`) REFERENCES `tb_categoria_identificacion` (`id_ctg_idtf`),
  ADD CONSTRAINT `tb_proveedor_ibfk_2` FOREIGN KEY (`cod_pais`) REFERENCES `tb_pais` (`cod_pais`);

--
-- Filtros para la tabla `tb_sede`
--
ALTER TABLE `tb_sede`
  ADD CONSTRAINT `tb_sede_ibfk_1` FOREIGN KEY (`idalmacen`) REFERENCES `tb_almacen` (`idalmacen`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tb_session_hst`
--
ALTER TABLE `tb_session_hst`
  ADD CONSTRAINT `tb_session_hst_ibfk_1` FOREIGN KEY (`cod_user`) REFERENCES `tb_usuario` (`cod_user`);

--
-- Filtros para la tabla `tb_tipo_cambio`
--
ALTER TABLE `tb_tipo_cambio`
  ADD CONSTRAINT `tb_tipo_cambio_ibfk_1` FOREIGN KEY (`cod_moneda`) REFERENCES `tb_moneda` (`cod_moneda`);

--
-- Filtros para la tabla `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD CONSTRAINT `tb_usuario_ibfk_2` FOREIGN KEY (`id_ctg_usuario`) REFERENCES `tb_categoria_usuario` (`id_ctg_user`),
  ADD CONSTRAINT `tb_usuario_ibfk_3` FOREIGN KEY (`codigo_dt_user`) REFERENCES `tb_datos_personal` (`codigo_dt_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
