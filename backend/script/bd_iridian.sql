-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-09-2022 a las 01:44:49
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `bd_iridian`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `id` int(10) UNSIGNED NOT NULL,
  `area` varchar(128) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` char(1) COLLATE utf8_spanish2_ci NOT NULL,
  `deleted_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`id`, `area`, `estado`, `deleted_at`) VALUES
(1, 'Administrativa', 'A', NULL),
(2, 'Logistica', 'A', NULL),
(3, 'Comercial', 'A', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(128) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(128) COLLATE utf8_spanish2_ci NOT NULL,
  `correo` varchar(128) COLLATE utf8_spanish2_ci NOT NULL,
  `celular` int(11) DEFAULT NULL,
  `id_area` int(10) DEFAULT NULL,
  `mensaje` text COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`id`, `nombre`, `apellido`, `correo`, `celular`, `id_area`, `mensaje`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, 'Alecx', 'Rave', 'jhonnyrave21@gmail.com', 2147483647, 1, 'erere', '2022-09-04 23:00:03', '2022-09-04 23:00:03', NULL),
(16, 'Jhonny', 'Rave', 'jhonny@gmail.com', 2147483647, 2, 'Mensaje de prueba', '2022-09-06 12:42:52', '2022-09-06 12:42:52', NULL),
(17, 'Alexander', 'Rave S', 'ra@gmail.com', 2147483647, 2, 'Mensaje de prueba', '2022-09-06 12:45:47', '2022-09-06 12:45:47', NULL),
(18, 'Jhonny', 'Raveeee', 'jy@maill.com', 242423, 2, 'sdfsdfdsfsd', '2022-09-06 12:52:07', '2022-09-06 12:52:07', NULL),
(22, 'Jhonny', 'ererer', 'jh@gmail.com', 2342342, 3, 'sdfasf fsdfsd', '2022-09-06 16:02:37', '2022-09-06 16:02:37', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id` int(11) NOT NULL,
  `nombre_curso` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id`, `nombre_curso`) VALUES
(1, 'Sociales'),
(2, 'Humanidades');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id` int(11) NOT NULL,
  `identificacion` int(11) NOT NULL,
  `nombre_estudiante` varchar(255) NOT NULL,
  `apellido_estudiante` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id`, `identificacion`, `nombre_estudiante`, `apellido_estudiante`) VALUES
(1, 326589, 'Ana', 'Montoya'),
(2, 452369, 'Pablo', 'Perez'),
(3, 45269, 'Carla', 'Saenz'),
(4, 785236, 'Tomas', 'Acevedo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE `evaluacion` (
  `id` int(11) NOT NULL,
  `nombre_evaluacion` varchar(255) NOT NULL,
  `nota` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `estudiante_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `evaluacion`
--

INSERT INTO `evaluacion` (`id`, `nombre_evaluacion`, `nota`, `curso_id`, `estudiante_id`) VALUES
(1, 'Evaluacion Sociales', 5, 1, 1),
(2, 'Evaluacion Humanidades', 4, 2, 2),
(3, 'Evaluacion Sociales', 4, 2, 3),
(4, 'Evaluacion Humanidades', 3, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id` int(11) NOT NULL,
  `enunciado_pregunta` varchar(255) NOT NULL,
  `evaluacion_id` int(11) NOT NULL,
  `tipo_pregunta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id`, `enunciado_pregunta`, `evaluacion_id`, `tipo_pregunta_id`) VALUES
(1, 'Cual es la capital de Argentina', 1, 3),
(2, 'Cuales son las figuras literarias', 2, 2),
(3, 'Define con tus palabras que es la globalizacion', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `id` int(11) NOT NULL,
  `respuesta` varchar(255) NOT NULL,
  `calificacion_respuesta` varchar(10) NOT NULL,
  `pregunta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`id`, `respuesta`, `calificacion_respuesta`, `pregunta_id`) VALUES
(1, 'Lima', '0', 1),
(2, 'Buenos Aires', '1', 1),
(3, 'Bogotá', '0', 1),
(4, 'Analogia', '1', 2),
(5, 'Simil', '1', 2),
(6, 'Ninguna de las anteriores', '0', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pregunta`
--

CREATE TABLE `tipo_pregunta` (
  `id` int(11) NOT NULL,
  `tipo_pregunta` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_pregunta`
--

INSERT INTO `tipo_pregunta` (`id`, `tipo_pregunta`) VALUES
(1, 'Abierta'),
(2, 'Multiple'),
(3, 'Sencilla');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_area` (`id_area`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_pregunta`
--
ALTER TABLE `tipo_pregunta`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area`
--
ALTER TABLE `area`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;
