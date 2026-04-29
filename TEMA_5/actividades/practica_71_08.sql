-- Actividad 7.1 Tema 7 Base de datos
-- Alejandro Peralta Oliva

-- 1. Crear usuarios

SELECT PASSWORD ('juan_01');
CREATE USER juan@juan identified by '*DBEA713660EAA6053C71DCAD75AFBC96A73ECA0F';

SELECT PASSWORD ('pedro_01');
CREATE USER pedro@pedro identified by '*63058EE0D2496A67E1B947A59809A732758516FF';

SELECT PASSWORD ('maria_03');
CREATE USER maria@maria identified by '*610163669DEF78BB9ABD9FF46C482F1235C7B03D';

SELECT PASSWORD ('miguel_04');
CREATE USER miguel@miguel identified by '*FD1C9AE91857DAED605342CF3B9B1EBA5B1E4A46';

SELECT PASSWORD ('rocio_05');
CREATE USER rocio@rocio identified by '*8D4F0AFD37706EF85EE95411E70503B0C33027DF';

-- 2. Crear conexión 

-- 3. Crear ususario tabla mysql.user

SELECT PASSWORD ('123456789');
INSERT mysql.user(host, user, password) values
('localhost', 'roberto_martinez', '*CC67043C7BCFF5EEA5566BD9B1F3C74FD9A5CF5D');
CREATE USER roberto@localhost identified by 'roberto_79';

-- Esto comando da error por mala práctica
-- Motivo: no tiene privilegios de insertar nuevos usuarios

-- 4. Eliminar rocio y miguel

DROP USER rocio;
DROP USER miguel;