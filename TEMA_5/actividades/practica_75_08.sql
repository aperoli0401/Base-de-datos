--  Practica 7.5 Base de datos Tema 7
-- Alejandro Peralta Oliva

USE geslibros;

-- 1 Creación de usuarios
CREATE USER ubrique_01@localhost identified BY 'ubrique01';
CREATE USER arcos_01@localhost identified BY 'arcos01';

-- asignación de privilegios 
GRANT ALL PRIVILEGES ON *.* TO ubrique_01@localhost, arcos_01@localhost;