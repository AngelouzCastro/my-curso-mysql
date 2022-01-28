

CREATE TABLE IF NOT EXISTS `articulo` (
  `idArticulo` int(11) NOT NULL,
  `titulo_articulo` varchar(50) NOT NULL,
  `idautor` int(11) NOT NULL,
  `idRevista` int(11) NOT NULL,
  PRIMARY KEY (`idArticulo`),
  KEY `idRevista` (`idRevista`),
  KEY `idautor` (`idautor`)
) engine=innodb;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE IF NOT EXISTS `autor` (
  `idautor` int(11) NOT NULL,
  `titulo_prof` char(5) DEFAULT NULL,
  `nombre_autor` varchar(20) NOT NULL,
  PRIMARY KEY (`idautor`)
) engine=innodb;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revista`
--

CREATE TABLE IF NOT EXISTS `revista` (
  `idRevista` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `volumen` tinyint(4) DEFAULT NULL,
  `numero` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idRevista`)
) engine=innodb;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temas`
--

CREATE TABLE IF NOT EXISTS `tema` (
  `idTema` int(11) NOT NULL,
  `titulo_tema` varchar(50) NOT NULL,
  PRIMARY KEY (`idTema`)
) engine=innodb;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temas_articulo`
--

CREATE TABLE IF NOT EXISTS `temas_articulos` (
  `idTema` int(11) NOT NULL,
  `idArticulo` int(11) NOT NULL,
  PRIMARY KEY (`idArticulo`,`idTema`)
) engine=innodb;


--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `articulo_ibfk_2` FOREIGN KEY (`idautor`) REFERENCES `autor` (`idautor`),
  ADD CONSTRAINT `articulo_ibfk_1` FOREIGN KEY (`idRevista`) REFERENCES `revista` (`idRevista`);

--
-- Filtros para la tabla `temas_articulo`
--
ALTER TABLE `temas_articulos`
  ADD CONSTRAINT `temas_articulo_ibfk_1` FOREIGN KEY (`idArticulo`) REFERENCES `articulo` (`idArticulo`) ,
  ADD CONSTRAINT `temas_articulo_ibfk_2` FOREIGN KEY (`idTema`) REFERENCES `tema` (`idTema`);
