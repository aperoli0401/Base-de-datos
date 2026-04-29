-- Active: 1777278235838@@127.0.0.1@3306@loteriaprimitiva
-- Practica 7.11 Base de datos tema 7
-- Alejandro Peralta Oliva

-- Usar la base de datos loteriaprimitiva
USE loteriaprimitiva;

-- 1. Crear usuarios
SELECT PASSWORD('1234567');
CREATE USER 'alejandroperalta'@'localhost' IDENTIFIED BY '1234567';

-- 2. Asignación de privilegios
-- 2.1 Superadministrador
GRANT ALL PRIVILEGES ON *.* TO 'alejandroperalta'@'localhost' WITH GRANT OPTION;

-- 2.2 Todos los privilegios sobre la base de datos geslibros
GRANT ALL PRIVILEGES ON geslibros.* TO 'alejandroperalta'@'localhost';

-- 2.3 Tdos los privilegios sobre las tablas concretas (libros, editoriales y clientes)
GRANT ALL PRIVILEGES ON geslibros.libros TO 'alejandroperalta'@'localhost';
GRANT ALL PRIVILEGES ON geslibros.editoriales TO 'alejandroperalta'@'localhost';
GRANT ALL PRIVILEGES ON geslibros.clientes TO 'alejandroperalta'@'localhost';

-- 2.4 Solo privilegios de consulta sobre las mismas tablas
GRANT SELECT ON geslibros.libros TO 'alejandroperalta'@'localhost';
GRANT SELECT ON geslibros.editoriales TO 'alejandroperalta'@'localhost';
GRANT SELECT ON geslibros.clientes TO 'alejandroperalta'@'localhost';

-- 2.5 Consultar y actualizar la tabla clientes
GRANT SELECT (nombre, direccion, poblacion, telefono, email),
    UPDATE (nombre, direccion, poblacion, telefono, email)
ON geslibros.clientes
TO 'alejandroperalta'@'localhost';

-- 2.6 Privilegios especificos en la tabla libros
GRANT SELECT (id, titulo, precio_venta, fechaedicion),
    UPDATE (precio_venta, titulo)
ON geslibros.libros
TO 'alejandroperalta'@'localhost';

-- 2.7 Consulta en todas escepto las tablas ventas y lineasventas
GRANT SELECT ON geslibros.* TO 'alejandroperalta'@'localhost';
REVOKE SELECT ON geslibros.ventas FROM 'alejandroperalta'@'localhost';
REVOKE SELECT ON geslibros.lineasventas FROM 'alejandroperalta'@'localhost';

-- 3. Eliminar privilegios
-- 3.1 Quitar GRANT OPTION
REVOKE GRANT OPTION ON *.* FROM 'alejandroperalta'@'localhost';

-- 3.2 Quitar todos los privilegios globales
REVOKE ALL PRIVILEGES ON *.* FROM 'alejandroperalta'@'localhost';

-- 3.3 Quitar privilegios sobre la base de datos 
REVOKE ALL PRIVILEGES ON geslibros.* FROM 'alejandroperalta'@'localhost';

-- 3.4 Quitar el update en libros
REVOKE UPDATE ON geslibros.libros FROM 'alejandroperalta'@'localhost';

-- 3.5 Quitar el SELECT en columnas especificas
REVOKE SELECT (id, titulo, precio_venta)
ON geslibros.libros
FROM 'alejandroperalta'@'localhost';

-- 3.6 Quitar acceso excepto a libros y cliente
REVOKE ALL PRIVILEGES ON geslibros.* FROM 'alejandroperalta'@'localhost';

GRANT ALL PRIVILEGES ON geslibros.libros TO 'alejandroperalta'@'localhost';
GRANT ALL PRIVILEGES ON geslibros.clientes TO 'alejandroperalta'@'localhost';

-- 3.7 Quitar el SELECT, UPDATE y DELETE 
REVOKE SELECT, UPDATE, DELETE 
ON geslibros.libros FROM 'alejandroperalta'@'localhost';

REVOKE SELECT, UPDATE, DELETE 
ON geslibros.clientes FROM 'alejandroperalta'@'localhost';

REVOKE SELECT, UPDATE, DELETE 
ON geslibros.editoriales FROM 'alejandroperalta'@'localhost';

REVOKE SELECT, UPDATE, DELETE 
ON geslibros.autores FROM 'alejandroperalta'@'localhost';


-- 4. Cambiar el PASSWORD 
-- 4.1 Obtener el pasword cifrado
SELECT PASSWORD('21436587');

-- 4.2 Cambiar el password del usuario
SET PASSWORD FOR 'alejandroperalta@localhost' = '987654321';

-- 5. Sorteo lotería primitiva
START TRANSACTION;

INSERT INTO sorteos 
(fecha, num1, num2, num3, num4, num5, num6, complementario, reintegro)
VALUES
(NOW(),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(RAND()*10)
),

(NOW(),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(1 + RAND()*49),
 FLOOR(RAND()*10)
);

COMMIT;

-- 6. Base de datos maratoon 
-- 6.1 Añadrir columnas 
ALTER TABLE corredores
ADD apellido1 VARCHAR(40),
ADD apellido2 VARCHAR(40),
ADD codigo CHAR(11);

-- 6.2 Separar apellidos
UPDATE corredores
SET 
apellido1 = SUBSTRING_INDEX(apellidos, ' ', 1),
apellido2 = SUBSTRING_INDEX(apellidos, ' ', -1);

-- 6.3 Generar código 
UPDATE corredores
SET codigo = UPPER(
 CONCAT(
  YEAR(fecha_nacimiento), '/',
  LEFT(nombre,2),
  LEFT(apellido1,2),
  LEFT(apellido2,2)
 )
);

-- 6.4 Actualizar edad
UPDATE corredores
SET edad = TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE());

-- 6.5 Actualizar categoría
UPDATE corredores 
JOIN categorias categorias ON corredores
SET corredores.categoria_id = categorias.id;

-- 6.6 Transicion con bloqueo
START TRANSACTION;

LOCK TABLES categorias WRITE;

UPDATE Corredores
SET edad = TIMESTANPDIFF(YEAR, fecha_nacimiento, CURDATE()),
UPDATE Corredores SET categoria_id = 1 WHERE Edad < 12;
UPDATE Corredores SET categoria_id = 2 WHERE Edad BETWEEN 12 AND 14;
UPDATE Corredores SET categoria_id = 3 WHERE Edad BETWEEN 15 AND 17;
UPDATE Corredores SET categoria_id = 4 WHERE Edad BETWEEN 18 AND 29;
UPDATE Corredores SET categoria_id = 5 WHERE Edad BETWEEN 30 AND 39;
UPDATE Corredores SET categoria_id = 6 WHERE Edad BETWEEN 40 AND 49;
UPDATE Corredores SET categoria_id = 7 WHERE Edad BETWEEN 50 AND 60;
UPDATE Corredores SET categoria_id = 8 WHERE Edad >= 60;

UNLOCK TABLES;

COMMIT;

-- 7. Exportat clientes de Ubrique
SELECT * 
FROM clientes
WHERE poblacion = 'Ubrique'
INTO OUTFILE 'C://Escitorio/DAW/Base_de_datos/clientesUbrique.csv'
FIELDS TERMINATED BY ';'
optionally ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- 7.1 Exportar autores XML
SELECT 
CONCAT('<autor><id>', id, '</id><nombre>', nombre, '</nombre></autor>')
FROM autores
INTO OUTFILE 'C://Escritorio/DAW/Base_de_datos/autores.xml';

-- 7.2 Backup a la base de datos
-- mysqldump -u root -p geslibros > geslibros_backup.sql

-- 7.3 Crear libros.csv
/*
"1";"Libro1";"20.5"
"2";"Libro2";"15.0"
"3";"Libro3";"30.0"
"4";"Libro4";"10.0"
*/


-- 7.4 Importar libros.csv
LOAD DATA INFILE 'C://Escitorio/DAW/Base_de_datos/libros.csv'
INTO TABLE libros
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n';