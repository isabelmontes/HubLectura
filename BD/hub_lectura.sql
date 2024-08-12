SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_libro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `favoritos`
--

INSERT INTO `favoritos` (`id`, `id_usuario`, `id_libro`) VALUES
(1, 1, 1),
(2, 1, 11),
(3, 1, 18),
(4, 2, 3),
(5, 2, 5),
(6, 2, 16),
(7, 3, 7),
(8, 3, 15),
(9, 3, 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id`, `nombre`) VALUES
(1, 'Ficción'),
(2, 'No ficción'),
(3, 'Ciencia Ficción'),
(4, 'Fantasía'),
(5, 'Misterio'),
(6, 'Romance'),
(7, 'Terror'),
(8, 'Aventura'),
(9, 'Historia'),
(10, 'Biografía'),
(11, 'Poesía'),
(12, 'Autoayuda');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos_favoritos`
--

CREATE TABLE `generos_favoritos` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_genero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `generos_favoritos`
--

INSERT INTO `generos_favoritos` (`id`, `id_usuario`, `id_genero`) VALUES
(1, 1, 1),
(2, 1, 6),
(3, 1, NULL),
(4, 1, 1),
(5, 2, 4),
(6, 2, 6),
(7, 3, 12),
(8, 1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `autor` varchar(100) NOT NULL,
  `id_genero` int(11) DEFAULT NULL,
  `editorial` varchar(100) DEFAULT NULL,
  `año` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `nombre`, `autor`, `id_genero`, `editorial`, `año`) VALUES
(1, '1984', 'George Orwell', 1, 'Secker & Warburg', 1949),
(2, 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 2, 'Harper', 2014),
(3, 'Dune', 'Frank Herbert', 3, 'Chilton Books', 1965),
(4, 'El Señor de los Anillos', 'J.R.R. Tolkien', 4, 'Allen & Unwin', 1954),
(5, 'El Código Da Vinci', 'Dan Brown', 5, 'Doubleday', 2003),
(6, 'Orgullo y Prejuicio', 'Jane Austen', 6, 'T. Egerton', 1813),
(7, 'It', 'Stephen King', 7, 'Viking Press', 1986),
(8, 'La Isla del Tesoro', 'Robert Louis Stevenson', 8, 'Cassell & Co.', 1883),
(9, 'Los Pilares de la Tierra', 'Ken Follett', 9, 'Penguin Books', 1989),
(10, 'Steve Jobs', 'Walter Isaacson', 10, 'Simon & Schuster', 2011),
(11, 'Cien Sonetos de Amor', 'Pablo Neruda', 11, 'Editorial Losada', 1959),
(12, 'Los Siete Hábitos de la Gente Altamente Efectiva', 'Stephen R. Covey', 12, 'Free Press', 1989),
(13, 'Rebelión en la Granja', 'George Orwell', 1, 'Secker & Warburg', 1945),
(14, 'Breve historia de casi todo', 'Bill Bryson', 2, 'Black Swan', 2003),
(15, 'Neuromante', 'William Gibson', 3, 'Ace Books', 1984),
(16, 'Crónicas de Narnia', 'C.S. Lewis', 4, 'Geoffrey Bles', 1950),
(17, 'Sherlock Holmes: El Sabueso de los Baskerville', 'Arthur Conan Doyle', 5, 'George Newnes', 1902),
(18, 'Cumbres Borrascosas', 'Emily Brontë', 6, 'Thomas Cautley Newby', 1847),
(19, 'El Resplandor', 'Stephen King', 7, 'Doubleday', 1977),
(20, 'Viaje al Centro de la Tierra', 'Julio Verne', 8, 'Pierre-Jules Hetzel', 1864);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros_dislike`
--

CREATE TABLE `libros_dislike` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_libro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros_dislike`
--

INSERT INTO `libros_dislike` (`id`, `id_usuario`, `id_libro`) VALUES
(1, 1, 9),
(2, 1, 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros_leidos`
--

CREATE TABLE `libros_leidos` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_libro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros_leidos`
--

INSERT INTO `libros_leidos` (`id`, `id_usuario`, `id_libro`) VALUES
(1, 1, 20),
(2, 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros_recomendados`
--

CREATE TABLE `libros_recomendados` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_libro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros_recomendados`
--

INSERT INTO `libros_recomendados` (`id`, `id_usuario`, `id_libro`) VALUES
(1, 1, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros_whishlist`
--

CREATE TABLE `libros_whishlist` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_libro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros_whishlist`
--

INSERT INTO `libros_whishlist` (`id`, `id_usuario`, `id_libro`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`) VALUES
(1, 'John Doe', 'johndoe@example.com', 'hola1234'),
(2, 'Jane Smith', 'janesmith@example.com', 'hola1234'),
(3, 'Carlos Mtz', 'carlosmtz@example.com', 'hola1234');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_libro` (`id_libro`);

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `generos_favoritos`
--
ALTER TABLE `generos_favoritos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_genero` (`id_genero`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_genero` (`id_genero`);

--
-- Indices de la tabla `libros_dislike`
--
ALTER TABLE `libros_dislike`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_libro` (`id_libro`);

--
-- Indices de la tabla `libros_leidos`
--
ALTER TABLE `libros_leidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_libro` (`id_libro`);

--
-- Indices de la tabla `libros_recomendados`
--
ALTER TABLE `libros_recomendados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_libro` (`id_libro`);

--
-- Indices de la tabla `libros_whishlist`
--
ALTER TABLE `libros_whishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_libro` (`id_libro`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `generos_favoritos`
--
ALTER TABLE `generos_favoritos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `libros_dislike`
--
ALTER TABLE `libros_dislike`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `libros_leidos`
--
ALTER TABLE `libros_leidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `libros_recomendados`
--
ALTER TABLE `libros_recomendados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `libros_whishlist`
--
ALTER TABLE `libros_whishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id`);

--
-- Filtros para la tabla `generos_favoritos`
--
ALTER TABLE `generos_favoritos`
  ADD CONSTRAINT `generos_favoritos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `generos_favoritos_ibfk_2` FOREIGN KEY (`id_genero`) REFERENCES `generos` (`id`);

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `generos` (`id`);

--
-- Filtros para la tabla `libros_dislike`
--
ALTER TABLE `libros_dislike`
  ADD CONSTRAINT `libros_dislike_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `libros_dislike_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id`);

--
-- Filtros para la tabla `libros_leidos`
--
ALTER TABLE `libros_leidos`
  ADD CONSTRAINT `libros_leidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `libros_leidos_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id`);

--
-- Filtros para la tabla `libros_recomendados`
--
ALTER TABLE `libros_recomendados`
  ADD CONSTRAINT `libros_recomendados_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `libros_recomendados_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id`);

--
-- Filtros para la tabla `libros_whishlist`
--
ALTER TABLE `libros_whishlist`
  ADD CONSTRAINT `libros_whishlist_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `libros_whishlist_ibfk_2` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
