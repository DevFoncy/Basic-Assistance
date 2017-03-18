-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-01-2017 a las 10:30:35
-- Versión del servidor: 5.6.24
-- Versión de PHP: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `regasis`
--

DELIMITER $$
--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `regentrada`(`p_cod` VARCHAR(8), `p_entrada` TIME) RETURNS int(1)
BEGIN
DECLARE v_usuario varchar(50);
SELECT nombre INTO v_usuario FROM usuario where cod_usuario = p_cod;

IF v_usuario IS NULL THEN
	RETURN 0;
ELSE
	INSERT INTO asistencia VALUES("",p_entrada,"",p_cod);
	RETURN 1;
END IF;


END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE IF NOT EXISTS `asistencia` (
  `id_asistencia` int(11) NOT NULL,
  `timein` datetime NOT NULL,
  `timeout` datetime NOT NULL,
  `cod_usuario` varchar(8) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asistencia`
--

INSERT INTO `asistencia` (`id_asistencia`, `timein`, `timeout`, `cod_usuario`) VALUES
(6, '2017-01-22 15:48:34', '0000-00-00 00:00:00', '14200047'),
(7, '2017-01-23 00:00:00', '0000-00-00 00:00:00', '14200045'),
(8, '2017-01-23 00:00:00', '0000-00-00 00:00:00', '14200045'),
(9, '2017-01-23 09:25:18', '0000-00-00 00:00:00', '14200045'),
(10, '2017-01-23 03:49:34', '0000-00-00 00:00:00', '14200046'),
(11, '2017-01-23 03:51:11', '0000-00-00 00:00:00', '14200047'),
(12, '2017-01-23 03:51:51', '0000-00-00 00:00:00', '14200046'),
(13, '2017-01-23 03:54:43', '0000-00-00 00:00:00', '14200047'),
(14, '2017-01-23 03:59:13', '0000-00-00 00:00:00', '14200047'),
(15, '2017-01-23 03:59:30', '0000-00-00 00:00:00', '14200045'),
(16, '2017-01-23 03:59:45', '0000-00-00 00:00:00', '14200045'),
(17, '2017-01-23 04:14:42', '0000-00-00 00:00:00', '14200047'),
(18, '2017-01-23 04:15:36', '0000-00-00 00:00:00', '14200046'),
(19, '2017-01-23 04:16:48', '0000-00-00 00:00:00', '14200045'),
(20, '2017-01-23 04:18:34', '0000-00-00 00:00:00', '14200045'),
(21, '2017-01-23 04:21:06', '0000-00-00 00:00:00', '14200047');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `cod_usuario` varchar(8) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `cargo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`cod_usuario`, `nombre`, `cargo`) VALUES
('14200045', 'andherson', 'bolsista'),
('14200046', 'frank', 'bolsista'),
('14200047', 'angel', 'bolsista');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`id_asistencia`), ADD KEY `fk_asistencia_usuario` (`cod_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cod_usuario`), ADD UNIQUE KEY `cod_usuario` (`cod_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `id_asistencia` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistencia`
--
ALTER TABLE `asistencia`
ADD CONSTRAINT `fk_asistencia_usuario` FOREIGN KEY (`cod_usuario`) REFERENCES `usuario` (`cod_usuario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
