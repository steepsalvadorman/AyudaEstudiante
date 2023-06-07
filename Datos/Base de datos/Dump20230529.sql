
CREATE DATABASE IF NOT EXISTS `tutobox` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `tutobox`;

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estructura de tabla para la tabla `usuario_rol`
--

CREATE TABLE IF NOT EXISTS `usuario_rol` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario_id` int NOT NULL,
  `rol_id` int NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`),
  FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estructura de tabla para la tabla `tutoria`
--

CREATE TABLE IF NOT EXISTS `tutoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `tutor` varchar(45) NOT NULL,
  `feedback` varchar(200) NOT NULL,
  `calificacion` int,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE IF NOT EXISTS `mensaje` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asunto` varchar(45) NOT NULL,
  `contenido` varchar(45) NOT NULL,
  `fecha` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
--
-- Estructura de la tabla para la tabla `publicacion`
--

CREATE TABLE IF NOT EXISTS `publicacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `documento` LONGBLOB NOT NULL,
  `publicacion` varchar(45) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `tipo_curso` varchar(200) NOT NULL,
  `fecha_publicacion` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Agregar roles
INSERT IGNORE INTO `rol` (`nombre`) VALUES ('Estudiante Experto');
INSERT IGNORE INTO `rol` (`nombre`) VALUES ('Estudiante');

-- Agregar usuarios
INSERT INTO `usuario` (`nombres`, `apellidos`, `email`, `password`) VALUES 
('Juan', 'Perez', 'juan@example.com', '123456'),
('María', 'Lopez', 'Maria@example.com', 'abcdef'),
('Pedro', 'Jimenez', 'Pedro@example.com', 'abcdef'),
('Jose', 'Torres', 'Jose@example.com', 'abcdef'),
('Omar', 'Castillo', 'Omar@example.com', 'abcdef'),
('Rodrigo', 'Quispe', 'Rodrigo@example.com', 'abcdef'),
('Javier', 'Rodriguez', 'Javier@example.com', 'abcdef'),
('Marcelo', 'Paulet', 'Marcelo@example.com', 'abcdef'),
('Agustin', 'Saenz', 'Agustin@example.com', 'abcdef'),
('Judas', 'Roca', 'Judas@example.com', 'abcdef'),
('Ignacio', 'Cespedes', 'Ignacio@example.com', 'abcdef');


-- Asignar roles a los usuarios
INSERT INTO `usuario_rol` (`usuario_id`, `rol_id`) VALUES (1, 1); -- Juan es Estudiante Experto
INSERT INTO `usuario_rol` (`usuario_id`, `rol_id`) VALUES (1, 2); -- Juan también es Estudiante
INSERT INTO `usuario_rol` (`usuario_id`, `rol_id`) VALUES (2, 1); -- María es Estudiante Experto
INSERT INTO `usuario_rol` (`usuario_id`, `rol_id`) VALUES (3, 1); -- Pedro es Estudiante Experto
INSERT INTO `usuario_rol` (`usuario_id`, `rol_id`) VALUES (4, 1); -- Jose es Estudiante Experto
INSERT INTO `usuario_rol` (`usuario_id`, `rol_id`) VALUES (5, 1); -- Omar es Estudiante Experto
INSERT INTO `usuario_rol` (`usuario_id`, `rol_id`) VALUES (6, 1); -- Rodrigo es Estudiante Experto
INSERT INTO `usuario_rol` (`usuario_id`, `rol_id`) VALUES (7, 2); -- Javier es Estudiante 
INSERT INTO `usuario_rol` (`usuario_id`, `rol_id`) VALUES (8, 2); -- Marcelo es Estudiante 
INSERT INTO `usuario_rol` (`usuario_id`, `rol_id`) VALUES (9, 2); -- Agustin es Estudiante 
INSERT INTO `usuario_rol` (`usuario_id`, `rol_id`) VALUES (10, 2); -- Judas es Estudiante 
INSERT INTO `usuario_rol` (`usuario_id`, `rol_id`) VALUES (11, 2); -- Ignacio es Estudiante 

-- Asignar tutorias para probarlas
INSERT INTO tutoria (nombre, estado, tutor, feedback, calificacion, usuario_id)
VALUES
    ('Programacion Web', 'Finalizado', 'Juan Perez', 'Muy buena clase', 9, 1),
    ('Programacion Mobile', 'En curso', 'Maria Lopez', 'Me encanta su clase es muy ordenada', 8, 2),
    ('Arquitectura de Software', 'Pendiente', 'Pedro Jimenez', 'No tiene', null, 3),
    ('Arquitectura de TI', 'Finalizado', 'Jose Torres', 'Su clase puede mejorar', 7, 4),
    ('Ingenieria de datos', 'En curso', 'Omar Castillo', 'Su clase es muy entretenida', 9, 5),
    ('Programacion de Videojuegos', 'Pendiente', 'Rodrigo Quispe', 'No tiene', null, 6);



INSERT INTO mensaje (asunto, contenido, fecha) VALUES 
('Necesito Ayuda', 'Hola necesito ayuda en un curso los mas pronto posible', '2023-06-06'),
('Una pregunta', 'Contenido del mensaje', '2023-06-06'),
('Asunto del mensaje', 'Contenido del mensaje', '2023-06-06'),
('Asunto del mensaje', 'Contenido del mensaje', '2023-06-06'),
('Asunto del mensaje', 'Contenido del mensaje', '2023-06-06'),
('Asunto del mensaje', 'Contenido del mensaje', '2023-06-06');