-- Active: 1777278235838@@127.0.0.1@3306@maratoon
-- variable global
SET @nombre = 'Juan Carlos';
SELECT @nombre;

SET @numero_1 = 1;

SET @numero_2 = 2;

SELECT @numero_1 + @numero_2;

USE maratoon;
SET @villamartin = 'Villamartín';
SELECT nombre FROM maratoon.corredores WHERE ciudad = @villamartin;

