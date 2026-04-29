-- Funciones fecha/hora
-- fecha hora actual
SELECT now();
USE maratoon;

-- sumar 1 día 
SELECT now() + INTERVAL 1 day;

SELECT now() + INTERVAL '1:1' MINUTE_SECOND;

SELECT 
    id,
    CONCAT_WS(', ', apellidos, nombre) corredor,
    TIMESTAMPDIFF(YEAR,
        fechaNacimiento,
        NOW()) edad
FROM
    corredores;
    
UPDATE corredores 
SET 
    edad = TIMESTAMPDIFF(YEAR,
        fechaNacimiento,
        NOW());
        
SELECT 
    id,
    CONCAT_WS(', ', apellidos, nombre) corredor,
    DATE_FORMAT(fechaNacimiento, '%a %e %b %Y')
FROM
    corredores;
    
-- get format 
SELECT date_format(now(), GET_FORMAT(DATE, 'EUR'));

-- FECHA ACTUAL
SELECT curdate(), current_time(), curtime();

SELECT now(), current_timestamp();

SELECT date(now());

SELECT datediff(curdate(), '2000-10-14');

SELECT dayname(curdate());

SELECT dayofmonth(curdate());

SELECT dayofweek(curdate());

SELECT last_day(curdate());

-- suscripción netflix por un año
-- cuando finaliza

SELECT last_day(curdate());

SELECT curdate() + INTERVAL 1 YEAR;

SELECT '2000-10-20' 