-- Practica 7.9 Base de datos Tema 7
-- Alejandro Peralta Oliva

-- Usar maratoon
USE maratoon;

-- 1. Crear el archivo corredores.csv

/*
-- maratoon.corredores

id,Nombre,Apellidos,Ciudad,FechaNacimiento,Sexo,Edad,Categoria_id,Club_id
17,Luis,Gómez Ruiz,Jerez,1995-03-12,H,, ,3
18,Ana,Martín López,Sevilla,2002-07-25,M,, ,2
19,Carlos,Sánchez Díaz,Cádiz,1988-11-05,H,, ,5
20,Lucía,Fernández Vega,Málaga,1975-01-18,M,, ,4
21,David,Ruiz Torres,Granada,1960-09-09,H,, ,1
*/

-- 2. Importar corredores y comprobar
LOAD DATA INFILE 'C:/Users/03_1DAW_Alum/Desktop/base de datos/corredores.csv'
INTO TABLE corredores
FIELDS terminated by ','
LINES terminated by '\n'
IGNORE 1 ROWS;

SELECT * FROM Corredores WHERE id >= 17;

-- 3. Actualizar edad y asignar la categoría
UPDATE corredores SET edad = timestampdiff(YEAR, FechaNacimiento, NOW())
WHERE id >= 17;


