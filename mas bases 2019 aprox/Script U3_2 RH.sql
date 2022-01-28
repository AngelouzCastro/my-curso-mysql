-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 09-10-2014 a las 06:15:12
-- Versión del servidor: 5.6.12-log
-- Versión de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `ejercicio_u3_4`
--
CREATE DATABASE IF NOT EXISTS `RecursosHumanos`;
USE `RecursosHumanos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE IF NOT EXISTS `empleado` (
  `No_empleado` int(11) NOT NULL,
  `Nombre` char(50) NOT NULL,
  `NSS` char(35) NOT NULL,
  PRIMARY KEY (`No_empleado`),
  UNIQUE KEY `NSS` (`NSS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`No_empleado`, `Nombre`, `NSS`) VALUES
(23, 'Javier Almanza Fernández', '98125'),
(24, 'Miriam Arroyo Díaz', '97145');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quincena`
--

CREATE TABLE IF NOT EXISTS `quincena` (
  `id_quincena` int(11) NOT NULL DEFAULT '0',
  `inicio` date DEFAULT NULL,
  `fin` date DEFAULT NULL,
  PRIMARY KEY (`id_quincena`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `quincena`
--

INSERT INTO `quincena` (`id_quincena`, `inicio`, `fin`) VALUES
(1, '2014-01-01', '2014-01-15'),
(2, '2014-01-16', '2014-01-30'),
(3, '2014-02-01', '2014-02-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjeta_es`
--

CREATE TABLE IF NOT EXISTS `tarjeta_es` (
  `no_empleado` int(11) NOT NULL DEFAULT '0',
  `id_quincena` int(11) NOT NULL DEFAULT '0',
  `dia` char(5) NOT NULL,
  `hora_entrada` time NOT NULL,
  `hora_salida` time DEFAULT NULL,
  PRIMARY KEY (`no_empleado`,`id_quincena`),
  KEY `id_quincena` (`id_quincena`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tarjeta_es`
--

INSERT INTO `tarjeta_es` (`no_empleado`, `id_quincena`, `dia`, `hora_entrada`, `hora_salida`) VALUES
(23, 1, 'Lunes', '08:05:00', '16:17:00'),
(23, 2, 'Marte', '08:06:00', '16:01:00'),
(23, 3, 'Jueve', '08:06:00', '16:14:00'),
(24, 1, 'Lunes', '12:00:00', '20:00:00'),
(24, 2, 'Marte', '12:00:00', '20:00:00');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tarjeta_es`
--
ALTER TABLE `tarjeta_es`
  ADD CONSTRAINT `tarjeta_es_ibfk_1` FOREIGN KEY (`no_empleado`) REFERENCES `empleado` (`No_empleado`),
  ADD CONSTRAINT `tarjeta_es_ibfk_2` FOREIGN KEY (`id_quincena`) REFERENCES `quincena` (`id_quincena`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
