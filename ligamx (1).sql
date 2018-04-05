-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 05-04-2018 a las 04:04:45
-- Versión del servidor: 5.7.21-log
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ligamx`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `director`
--

CREATE TABLE `director` (
  `idDirector` int(11) NOT NULL,
  `nombreDirector` varchar(40) DEFAULT NULL,
  `equipoDire` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `director`
--

INSERT INTO `director` (`idDirector`, `nombreDirector`, `equipoDire`) VALUES
(1, 'de', 1),
(2, 'dess', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `idEquipo` int(11) NOT NULL,
  `nombreEquipo` varchar(15) DEFAULT NULL,
  `Puntos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`idEquipo`, `nombreEquipo`, `Puntos`) VALUES
(1, 'modi', 4),
(2, 'America', 0),
(3, 'Tigres', 0),
(4, 'Toluca', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fase`
--

CREATE TABLE `fase` (
  `idFase` int(11) NOT NULL,
  `nombreFase` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `fase`
--

INSERT INTO `fase` (`idFase`, `nombreFase`) VALUES
(1, 'fase modificada'),
(2, 'Cuartos de Final'),
(3, 'Semifinal'),
(4, 'Final');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornada`
--

CREATE TABLE `jornada` (
  `idJornada` int(11) NOT NULL,
  `nombreJornada` varchar(30) DEFAULT NULL,
  `idTorneo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `jornada`
--

INSERT INTO `jornada` (`idJornada`, `nombreJornada`, `idTorneo`) VALUES
(1, 'modificada', 1),
(2, 'Jornada 2', 1),
(3, 'Jornada 3', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juego`
--

CREATE TABLE `juego` (
  `idJuego` int(11) NOT NULL,
  `idFase` int(11) DEFAULT NULL,
  `equipo1` int(11) DEFAULT NULL,
  `equipo2` int(11) DEFAULT NULL,
  `goles1` int(11) DEFAULT NULL,
  `goles2` int(11) DEFAULT NULL,
  `idJornada` int(11) DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `idDirector` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `juego`
--

INSERT INTO `juego` (`idJuego`, `idFase`, `equipo1`, `equipo2`, `goles1`, `goles2`, `idJornada`, `tipo`, `idDirector`) VALUES
(1, 1, 1, 2, 2, 1, 1, 'Ida', 1),
(2, 1, 1, 2, 3, 2, 1, 'Vuelta', 1),
(3, 1, 3, 4, 0, 0, 2, 'Ida', 3),
(4, 1, 3, 4, 1, 0, 2, 'Vuelta', 3),
(5, 2, 1, 2, 1, 1, 2, 'Ida', 1),
(6, 2, 1, 2, 2, 1, 2, 'Vuelta', 1),
(7, 2, 3, 4, 3, 0, 2, 'Ida', 3),
(8, 2, 3, 4, 3, 3, 2, 'Vuelta', 3),
(9, 3, 1, 3, 1, 0, 3, 'Ida', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneo`
--

CREATE TABLE `torneo` (
  `idTorneo` int(11) NOT NULL,
  `nombreTorneo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `torneo`
--

INSERT INTO `torneo` (`idTorneo`, `nombreTorneo`) VALUES
(1, 'Clausura 2018');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `director`
--
ALTER TABLE `director`
  ADD PRIMARY KEY (`idDirector`),
  ADD KEY `equipoDire` (`equipoDire`);

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`idEquipo`);

--
-- Indices de la tabla `fase`
--
ALTER TABLE `fase`
  ADD PRIMARY KEY (`idFase`);

--
-- Indices de la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD PRIMARY KEY (`idJornada`),
  ADD KEY `idTorneo` (`idTorneo`);

--
-- Indices de la tabla `juego`
--
ALTER TABLE `juego`
  ADD PRIMARY KEY (`idJuego`),
  ADD KEY `idFase` (`idFase`),
  ADD KEY `equipo1` (`equipo1`),
  ADD KEY `equipo2` (`equipo2`),
  ADD KEY `idJornada` (`idJornada`);

--
-- Indices de la tabla `torneo`
--
ALTER TABLE `torneo`
  ADD PRIMARY KEY (`idTorneo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `director`
--
ALTER TABLE `director`
  ADD CONSTRAINT `director_ibfk_1` FOREIGN KEY (`equipoDire`) REFERENCES `equipos` (`idEquipo`);

--
-- Filtros para la tabla `jornada`
--
ALTER TABLE `jornada`
  ADD CONSTRAINT `jornada_ibfk_1` FOREIGN KEY (`idTorneo`) REFERENCES `torneo` (`idTorneo`);

--
-- Filtros para la tabla `juego`
--
ALTER TABLE `juego`
  ADD CONSTRAINT `juego_ibfk_1` FOREIGN KEY (`idFase`) REFERENCES `fase` (`idFase`),
  ADD CONSTRAINT `juego_ibfk_2` FOREIGN KEY (`equipo1`) REFERENCES `equipos` (`idEquipo`),
  ADD CONSTRAINT `juego_ibfk_3` FOREIGN KEY (`equipo2`) REFERENCES `equipos` (`idEquipo`),
  ADD CONSTRAINT `juego_ibfk_4` FOREIGN KEY (`idJornada`) REFERENCES `jornada` (`idJornada`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
