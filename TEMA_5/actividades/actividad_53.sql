-- Actividad 5.3
-- tema 5 : lenguaje sql - ddl 
-- Descripción: tipos de dato numéricos

-- borro y crea la base de datos si existe y no existe respectivamente
DROP DATABASE IF EXISTS tipo_datos;
CREATE DATABASE IF NOT EXISTS tipo_datos;

-- poner la base de datos activa
USE tipos_datos;

-- borro y creo la tabla tipo_datos_num
DROP TABLE IF EXISTS tipo_datos_num;
CREATE TABLE IF NOT EXISTS tipo_datos_num (
	
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    num_camiseta TINYINT UNSIGNED,
    diferencia_goles SMALLINT,
    goles_a_favor SMALLINT  UNSIGNED,
    goles_en_contra SMALLINT UNSIGNED,
    num_habitantes INT UNSIGNED,
    humedad FLOAT (3 , 2) UNSIGNED,
    precipitaciones SMALLINT UNSIGNED,
    temperatura_maxima FLOAT (5 , 2),
    temperatura_minima FLOAT (5 , 2),
    velocidad_viento SMALLINT UNSIGNED,
    altura SMALLINT UNSIGNED,
    precio DECIMAL (10 , 2),
    sueldo DECIMAL (10 , 2),
    seno DOUBLE (30 , 29),
    coseno DOUBLE (30 , 29),
    tangente SMALLINT UNSIGNED
) CHARACTER SET = 'UTF8MB4' COLLATE = 'utf8mb4_general_ci';

-- Añadir tres registros validos a la tabla anterior
INSERT INTO tipos_datos_num VALUES
(
	NULL,
	34,
    -5,
    56,
    45,
    345000,
    0.90,
    300,
    45.56,
    -12.78,
    500,
    10000,
    45.67,
    45000,
    0.5678,
    0.785,
    34
),
(
	NULL,
	39,
    -2,
    64,
    75,
    345950,
    0.26,
    420,
    45.56,
    -12.41,
    597,
    10001,
    45.96,
    45612,
    0.5913,
    0.372,
    87
)
;