-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-11-2023 a las 01:46:26
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tiendita_de_peliculas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artistas`
--

CREATE TABLE `artistas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre_completo` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `biografia` text NOT NULL,
  `foto_perfil` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `artistas`
--

INSERT INTO `artistas` (`id`, `nombre_completo`, `biografia`, `foto_perfil`) VALUES
(1, 'john williams', 'john williams es artista cantante y director de la opera en los soundtracks de star wars durante su triologia de peliculas', ''),
(2, 'george lucas', 'george lucas fue guionista y artista de la saga de star wars. ha sido reconocido como uno de los iconos mas importantes de la saga', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capitulo`
--

CREATE TABLE `capitulo` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `historia` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `capitulo`
--

INSERT INTO `capitulo` (`id`, `nombre`, `historia`) VALUES
(1, 'star wars', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guionistas`
--

CREATE TABLE `guionistas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre_completo` varchar(256) NOT NULL,
  `biografia` text NOT NULL,
  `foto_perfil` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `guionistas`
--

INSERT INTO `guionistas` (`id`, `nombre_completo`, `biografia`, `foto_perfil`) VALUES
(1, 'george lucas', 'george lucas fue uno de los guionistas mas conocidos de star wras', 'https://hips.hearstapps.com/hmg-prod/images/george-lucas-luke-skywalker-1569331068.jpg'),
(2, 'john williams', 'un especialista en la musica de la orchestra', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/John_Williams_with_Boston_Pops-1.jpg/1200px-John_Williams_with_Boston_Pops-1.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

CREATE TABLE `peliculas` (
  `id` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(256) NOT NULL,
  `personaje_principal_id` int(10) UNSIGNED NOT NULL,
  `guionista_id` int(10) UNSIGNED NOT NULL,
  `artista_id` int(10) UNSIGNED NOT NULL,
  `capitulo_id` int(11) UNSIGNED NOT NULL,
  `volumen` tinyint(3) UNSIGNED NOT NULL,
  `numero` smallint(5) UNSIGNED NOT NULL,
  `publicacion` date NOT NULL,
  `origen` varchar(256) NOT NULL,
  `editorial` varchar(256) NOT NULL,
  `bajada` text NOT NULL,
  `portada` varchar(256) NOT NULL,
  `precio` float(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`id`, `titulo`, `personaje_principal_id`, `guionista_id`, `artista_id`, `capitulo_id`, `volumen`, `numero`, `publicacion`, `origen`, `editorial`, `bajada`, `portada`, `precio`) VALUES
(1, 'La amenaza fantasma', 1, 1, 1, 0, 3, 1, '1999-05-01', 'Estados unidos', 'star wars', 'Explora los orígenes de Anakin Skywalker y el surgimiento del malvado Darth Maul. La galaxia se sumerge en la política y la guerra', 'img/covers/capitulo-1.jpg', 2000.00),
(2, 'El ataque de los clones', 1, 1, 1, 1, 3, 2, '2002-05-04', 'Estados unidos', 'star wars', 'La galaxia se encuentra al borde de la guerra mientras los Jedi intentan mantener la paz. Anakin Skywalker comienza su viaje hacia la oscuridad', 'img/covers/capitulo-2.jpg', 2100.00),
(3, 'La venganza de los sits', 1, 1, 1, 1, 3, 3, '2005-05-10', 'Estados unidos', 'star wars', 'La galaxia se encuentra al borde de la guerra mientras los Jedi intentan mantener la paz. Anakin Skywalker comienza su viaje hacia la oscuridad', 'img/covers/capitulo-3.jpg', 2500.00),
(4, 'Una nueva esperanza', 1, 1, 1, 1, 3, 4, '1977-05-10', 'Estados unidos', 'Star wars', 'Únete a Luke Skywalker, la Princesa Leia y Han Solo en su lucha contra el malvado Imperio Galáctico. Una historia épica de aventuras, amistad y la Fuerza.', 'img/covers/capitulo-4.jpg', 2200.00),
(5, 'El imperio contraataca', 1, 1, 1, 1, 3, 5, '1980-05-15', 'Estados unidos', 'Star wars', 'La Rebelión enfrenta desafíos mayores mientras Luke entrena con Yoda para convertirse en un Jedi. Mientras tanto, el Imperio contraataca con fuerza implacable.', 'img/covers/capitulo-5.jpg', 2300.00),
(6, 'El retorno del jedi', 1, 1, 1, 1, 3, 6, '1983-05-21', 'Estados unidos', 'Star wars', 'La saga original llega a su conclusión con la batalla final entre las fuerzas de la Rebelión y el Imperio. Luke enfrenta a Darth Vader y al Emperador en un enfrentamiento épico', 'img/covers/capitulo-6.jpg', 2400.00),
(7, 'El despertar de la fuerza', 1, 1, 1, 1, 3, 7, '2015-12-13', 'Estados unidos', 'Star wars', 'Nuevos héroes y viejas leyendas se unen en la lucha contra la malvada Primera Orden. Rey, Finn y Poe enfrentan un oscuro despertar de la Fuerza', 'img/covers/capitulo-7.jpg', 2600.00),
(8, 'El ultimo jedi', 1, 1, 1, 1, 3, 8, '2017-07-21', 'Estados unidos', 'Star wars', 'La esperanza del jedi se esta marchando', 'img/covers/capitulo-8.jpg', 1900.00),
(9, 'El ascenso de Skywalker', 1, 1, 1, 1, 3, 9, '2019-12-15', 'Estados unidos', 'Star wars', 'La saga Skywalker llega a su fin. Rey enfrenta a Palpatine mientras la Resistencia se prepara para la batalla final contra la Primera Orden', 'img/covers/capitulo-9.jpg', 2800.00),
(10, 'La guerra de los clones', 1, 1, 1, 1, 3, 10, '2008-04-10', 'Estados unidos', 'Star wars', 'En el Senado Galáctico reina la inquietud. Varios miles de sistemas solares han declarado su intención de abandonar la República.', 'img/covers/La-guerra-de-los-clones-10.jpg', 3000.00),
(11, 'Rogue one: una historia de star wars', 1, 1, 1, 1, 3, 11, '2018-12-17', 'Estados unidos', 'Star wars', 'En los albores de la Rebelión, un grupo de héroes inverosímiles se une para robar los planos de la Estrella de la Muerte y cambiar el destino de la galaxia', 'img/covers/Rogue-One-12.jpg', 3500.00),
(12, 'Han solo: Una Historia de Star Wars', 3, 1, 1, 1, 3, 12, '2018-05-10', 'Estados unidos', 'Star wars', 'Acompaña a un joven Han Solo en sus primeras aventuras, desde su encuentro con Chewbacca hasta los orígenes de su amistad con Lando Calrissian', 'img/covers/Han-Solo-11.jpg', 3100.00),
(13, 'La leyenda de Yoda', 3, 1, 1, 1, 3, 13, '2019-09-10', 'Estados Unidos', 'Star wars', 'Sumérgete en las historias legendarias de Yoda, el sabio maestro Jedi. Desde sus primeros días hasta sus hazañas más asombrosas, este cómic revela los secretos de la Fuerza', 'img/covers/especial-13.jpg', 2800.00),
(14, 'El ultimo Padawan', 15, 1, 1, 1, 3, 14, '2015-11-10', 'Estados unidos', 'Star Wars', 'Descubre la historia de Kanan Jarrus, el último padawan Jedi tras la ejecución de la Orden 66. ¿Cómo sobrevivió a la purga Jedi y se convirtió en el héroe que conocemos?', 'img/covers/especial-14.jpg', 2600.00),
(15, 'La senda Jedi', 2, 1, 1, 1, 3, 15, '2021-03-15', 'Estados Unidos', 'Star wars', 'Explora los caminos de la Senda Jedi a través de las eras. Desde los antiguos guardianes hasta los héroes contemporáneos, este cómic celebra la diversidad y el legado de la Orden Jedi', 'img/covers/especial-15.jpg', 2900.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula_x_personaje`
--

CREATE TABLE `pelicula_x_personaje` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_pelicula` int(10) UNSIGNED NOT NULL,
  `id_personaje` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pelicula_x_personaje`
--

INSERT INTO `pelicula_x_personaje` (`id`, `id_pelicula`, `id_personaje`) VALUES
(1, 1, 19),
(2, 1, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajes`
--

CREATE TABLE `personajes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(256) NOT NULL,
  `alias` varchar(256) NOT NULL,
  `biografia` text NOT NULL,
  `creador` varchar(256) NOT NULL,
  `primera_aparicion` year(4) NOT NULL,
  `imagen` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personajes`
--

INSERT INTO `personajes` (`id`, `nombre`, `alias`, `biografia`, `creador`, `primera_aparicion`, `imagen`) VALUES
(1, 'obiwan kenoby', 'obiwan', 'obiwan fue el personaje principal de todas las sagas', 'george lucas', 1978, 'img/personajes/obiwan.jpg'),
(2, 'anakin skywalker', 'anakin', 'anakin fue uno de los yeday que lamentablemente ha sido parte de los sit', 'george lucas', 1980, 'img/personajes/anakin.jpg'),
(3, 'maestro joda', 'joda', 'el maestro joda fue el progimo y el legendario maestro del planeta', 'George lucas', 1979, 'img/personajes/yoda.jpg'),
(15, 'Chewbacca dota', 'Chewbacca', 'Chewbacca es un personaje del universo ficticio de Star Wars. Es un wookiee, un bípedo alto, peludo y robusto, especie inteligente del planeta Kashyyyk. Chewbacca es el leal amigo y socio de Han Solo, y sirve como copiloto en la nave espacial de Solo, el Halcón Milenario', 'George lucas', 1980, 'img/personajes/chewbacca.jpg'),
(19, 'El emperador palpatin', 'palpatin', 'palpatin es el villano principal y mas malvado de star wars. fue el creador de darth vader', 'George lucas', 1980, 'img/personajes/palpatin.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(256) NOT NULL,
  `nombre_usuario` varchar(20) NOT NULL,
  `nombre_completo` int(255) NOT NULL,
  `password` varchar(256) NOT NULL,
  `roles` enum('usuario','admin','superadmin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `artistas`
--
ALTER TABLE `artistas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `capitulo`
--
ALTER TABLE `capitulo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `guionistas`
--
ALTER TABLE `guionistas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `guionista_id` (`guionista_id`),
  ADD KEY `artista_id` (`artista_id`),
  ADD KEY `capitulo_id` (`capitulo_id`),
  ADD KEY `personaje_principal_id` (`personaje_principal_id`);

--
-- Indices de la tabla `pelicula_x_personaje`
--
ALTER TABLE `pelicula_x_personaje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pelicula` (`id_pelicula`),
  ADD KEY `id_personaje` (`id_personaje`);

--
-- Indices de la tabla `personajes`
--
ALTER TABLE `personajes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `artistas`
--
ALTER TABLE `artistas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `capitulo`
--
ALTER TABLE `capitulo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `guionistas`
--
ALTER TABLE `guionistas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `pelicula_x_personaje`
--
ALTER TABLE `pelicula_x_personaje`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `personajes`
--
ALTER TABLE `personajes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD CONSTRAINT `peliculas_ibfk_1` FOREIGN KEY (`guionista_id`) REFERENCES `guionistas` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `peliculas_ibfk_2` FOREIGN KEY (`artista_id`) REFERENCES `artistas` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `peliculas_ibfk_3` FOREIGN KEY (`personaje_principal_id`) REFERENCES `personajes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `pelicula_x_personaje`
--
ALTER TABLE `pelicula_x_personaje`
  ADD CONSTRAINT `pelicula_x_personaje_ibfk_1` FOREIGN KEY (`id_pelicula`) REFERENCES `peliculas` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
