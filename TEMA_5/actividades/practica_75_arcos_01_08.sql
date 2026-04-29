-- practica_75_arcos_01_08.sql
-- conexion arcos_01

-- 2
USE geslibros;

-- 4 
-- Podemos mostrar la tabla clientes porque el usuario arcos no tiene la tabla bloqueada
SELECT * FROM clientes WHERE poblacion = 'Guadalajara'; 

-- Como no podemos acceder a la tabla clientes no se puede añadir el registro
INSERT INTO clientes VALUES 
(06, 'Antonio Fernandez', 'Avenida cádiz', 'Guadalajara', 11600, 19, 47982313E, 849028382, 'antofer@gmail.com');

-- 6
LOCK TABLE libros WRITE;

-- Como hemos bloqueado la tabla solo de lectura podemos seguir escribiendo
INSERT INTO libros VALUES 
(99, 43284923E, 7132498327894, 'Sql - El idioma de los datos', 1, 1, 8.30, 18.30, 8432, 1, 932);

-- 8
UNLOCK  TABLES;

-- 9
BEGIN;
LOCK TABLE editoriales IN SHARE MODE;
LOCK TABLE autores IN SHARE MODE;
INSERT INTO libros 
VALUES (101, 491302328R, 490931284, 'El interprete de los lenguajes', 1, 1, 8.30, 18.30, 8432, 1, 932);
INSERT INTO libros 
VALUES (100, 830924982G, 94873921843, 'C - un lenguaje compilado', 1, 1, 8.30, 18.30, 8432, 1, 932);
COMMIT;