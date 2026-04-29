-- Practica 7.6 Base de datos Tema 7
-- Alejandro Peralta Oliva

-- 1. Crear la tabla fmatematicas
DROP DATABASE IF EXISTS fmatematicas;
CREATE DATABASE if not exists fmatematicas;

USE fmatematicas;

-- 2. Crear la tabla angulos los valores con máxima precisión
CREATE TABLE IF NOT EXISTS angulos(
	id INT UNSIGNED AUTO_INCREMENT primary key, 
    grados SMALLINT UNSIGNED, -- [0,360]
    radianes DOUBLE(31, 30), --  
    seno DOUBLE(31, 30), -- [-1, 1]
    coseno DOUBLE(31, 30), -- [-1, 1]
    tangente DOUBLE -- cualquier valor real
);

-- 3. Insertar en la tabla angulos los valores de 5 ángulos (0 a 360)
INSERT INTO angulos (grados) VALUES
(0), (30), (60), (180), (270);
INSERT INTO angulos (grados) VALUES
(10), (45), (60), (90), (360);

-- 4. Actualizar la columna radianes a partir de la columna grados
UPDATE angulos
SET 
    radianes = RADIANS(grados);

-- 5. Actualizar las columnas seno, coseno y tangente a partir de la columna radianes
UPDATE angulos 
SET 
    seno = SIN(radianes);
    
UPDATE angulos 
SET 
    coseno = cos(radianes);
    
UPDATE angulos 
SET 
    tangente = tan(radianes);

-- 6. Obtener un valor entre [1, 10]
SELECT ceiling(RAND() * 10);

-- 7. Obtener un valor entre [0, 9]
SELECT floor(RAND() * 9);

-- 8. Obtener un valor entre [0, 4]
SELECT floor(RAND() * 4);

-- 9. Obtener un valor entre [0, 100000]
SELECT floor(RAND() * 100001);