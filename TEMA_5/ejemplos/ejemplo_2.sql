-- ejemplo 52
-- Creacion de tabla 

-- 1 
-- Seleccionar base de datos activa

USE geslibros;

-- 2
-- Crear la tabla libros
-- id, titulo, precio, autor, editorial, paginas

DROP TABLE IF EXISTS libros;
CREATE TABLE IF NOT EXISTS libros (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	titulo VARCHAR(40),
    autor VARCHAR(50),
    editorial VARCHAR(20),
    paginas SMALLINT UNSIGNED,
);