-- practica_75_ubrique_01_08.sql
-- conexion ubrique_01

-- 2
USE geslibros;

-- 3 
-- No nos permite la acción porque una vez que se bloquea la tabla libros ya no se puede acceder a ninguna tabla
LOCK TABLE clientes READ;
SELECT * FROM libros;

-- 5 
UNLOCK TABLES;

-- 7 
-- La tabla no e puede mostrar porque la tabla se encuentra bloqueada 
SELECT * FROM libros;

-- La tabla al encontrarse bloqueada no se puede volver a bloquear
LOCK TABLE libros READ;

UNLOCK TABLES;

-- 9
BEGIN;
LOCK TABLE libros;

UPDATE libros
SET precio_venta = precio_venta * 0.70;

COMMIT;