-- 1. Hola mundo
DELIMITER $$
DROP PROCEDURE IF EXISTS hola_mundo$$
CREATE PROCEDURE test.hola_mundo()
BEGIN
    SELECT 'Hola mundo PL/SQL';
END$$