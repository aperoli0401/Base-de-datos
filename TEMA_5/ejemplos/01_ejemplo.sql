-- Juegos caracteres mysql
SHOW CHARACTER SET; 

-- Muestro las colecciones disponibles
Show Collation;

-- Crear una base de datos de ejemplo
Create Database ejemplo;

-- Crear la Base de Datos BANCO Multilingüe con UTF-8
Create Database If Not Exists BANCO
Character set utf8 Collate utf8_general_ci;

-- Crear la base de datos banco para ESPAÑOL con UTF8
Create Database If Not Exists BANCO
Character set utf8 Collate utf8_spanish_ci;

-- Crear la base de datos BANCO para españa UTF8MB4
Create Database If Not Exists BANCO
Character set utf8mb4 Collate utf8mb4_spanish_ci;

-- Crear la base de datos BANCO para Español con Latin1
Create Database If Not Exists BANCO
Character set latin1 Collate latin1_spanish_ci;

-- Crear la base de datos BANCO para Multiligüe con Latin1
Create Database If Not Exists BANCO
Character set latin1 Collate latin1_general_ci;

-- Crear la bsse de datos geslibros español multilingüe con
-- juego de caracteres utf8mb4
-- Opciones por defecto 
create database if not exists geslibros
character set utf8mb4 collate utf8mb4_general_ci;