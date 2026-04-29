-- Practica 710 Base de datos Tema 7
-- Alejandro Peralta Oliva

-- 1. Acceder con usuario root en modo consola
mysql -h localhost -u root -p

-- 2. comandos sql
show databases;
use geslibros;
show tables;
select host, user, password from mysql.user;
show grants for root@localhost;

-- 3. Crear usuario
CREATE USER lopez@localhost identified by '1234567';
GRANT CREATE, ALTER, UPDATE ON maratoon.corredores TO lopez@localhost;

-- 4. Cambiar el password del usuario anterior
SET PASSWORD FOR lopez@localhost = PASSWORD('654321');

-- 5. Hacer una transacción
START transaction
UPDATE precio_venta = precio_venta * 1,1;
SELECT precio_venta FROM libros;
ROLLBACK;

-- 6. Comandos consola
LOCK TABLES WITH READ LOCK;
SELECT * FROM autores;
UNLOCK TABLES;
SELECT * FROM autores;

-- 7. Operaciones por consola
START TRANSACTION;
LOCK TABLES provincias WHERE provincia = 'Cádiz';
SELECT * FROM clientes WHERE provincia_id != 11;
COMMIT;

-- 8. Usar la base de datos maratoon
USE maratoon;
UPDATE Corredores 
SET Edad = TIMESTAMPDIFF(YEAR, FechaNacimiento, CURDATE());

SELECT 
    corredores.id,
    corredores.Apellidos,
    corredores.Nombre,
    corredores.Edad,
    clubs.Nombre AS Club,
    categorias.Nombre AS Categoria
FROM corredores 
LEFT JOIN clubs ON corredores.club_id = clubs.id
LEFT JOIN categorias ON corredores.categoria_id = categorias.id;

-- 9. Crea en un fichero con formato csv a partir de un comando SELECT, los corredores sólo de villamartín
SELECT *
FROM Corredores
WHERE Ciudad = 'Villamartín'
INTO OUTFILE 'corredores_villamartin.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- 10. Salir de la consola
EXIT;

-- 11. Copia de seguridad de la tabla maratoon
mysqldump -u root -p maratoon > maratoon.sql

-- 12. Copia de seguridad de todas las base de datos
mysqldump -u root -p --all-databases > alldatabases.sql

-- 13. Exportar la base de datos de empresa
mysqldump -u root -p --xml empresa > empresa.xml