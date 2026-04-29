-- Practica 7.7 Base de datos Tema 7
-- Alejandro Peralta Oliva

-- Usar la base de datos empresa.sql
USE empresa;

-- 1. Añadir apellidos
UPDATE empleados SET apellidos = CONCAT(apellidos, 'García') WHERE id = 1;
UPDATE empleados SET apellidos = CONCAT(apellidos, 'Pérez') WHERE id = 2;
UPDATE empleados SET apellidos = CONCAT(apellidos, 'López') WHERE id = 3;
UPDATE empleados SET apellidos = CONCAT(apellidos, 'Peralta') WHERE id = 4;
UPDATE empleados SET apellidos = CONCAT(apellidos, 'Reina') WHERE id = 5;
UPDATE empleados SET apellidos = CONCAT(apellidos, 'Sánchez') WHERE id = 6;
UPDATE empleados SET apellidos = CONCAT(apellidos, 'Gómez') WHERE id = 7;
UPDATE empleados SET apellidos = CONCAT(apellidos, 'Ruiz') WHERE id = 8;
UPDATE empleados SET apellidos = CONCAT(apellidos, 'Alonso') WHERE id = 9;
UPDATE empleados SET apellidos = CONCAT(apellidos, 'Vidal') WHERE id = 10;
UPDATE empleados SET apellidos = CONCAT(apellidos, 'Martínez') WHERE id = 11;


-- 2. Consulta
SELECT 
    id, nss, CONCAT(nombre, ', ', nombre) AS nombre_completo
FROM
    empleados;
    
-- 3. Consulta
SELECT 
    id,
    nss,
    nombre,
    SUBSTRING(apellidos, ' ', 1) AS apellido1,
    SUBSTRING(apellidos, ' ', 2) AS apellido2
FROM
    Empleados;
    
-- 4. Consulta
SELECT 
    id, 
    nombre, 
    apellidos, 
    nss,
    TRIM(SUBSTRING_INDEX(direccion, ',', -1)) AS estado,
    -- Nota: La dirección original no parece tener 'provincia', se extrae la ciudad
    TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(direccion, ',', -2), ',', 1)) AS ciudad,
    TRIM(SUBSTRING_INDEX(direccion, ' ', 1)) AS codigo_postal
FROM Empleados;

-- 5. Crear código
SELECT 
    id,
    apellidos,
    nombre,
    nss,
    UPPER(CONCAT(
        RIGHT(nss, 3), 
        '/', 
        LEFT(nombre, 2), 
        LEFT(SUBSTRING_INDEX(apellidos, ' ', 1), 2),
        LEFT(SUBSTRING_INDEX(apellidos, ' ', -1), 2)
    )) AS codigo_generado
FROM Empleados;