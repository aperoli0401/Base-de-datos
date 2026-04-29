-- Actividad 6.6
-- Alejandro Peralta Oliva

USE empresa;

-- 1. Order By, limit, all distinct

-- 1.1
SELECT 
    *
FROM
    empleado
ORDER BY salario DESC
LIMIT 3;

-- 1.2
SELECT 
    *
FROM
    empleado
ORDER BY salario ASC
LIMIT 5;

-- 1.3
SELECT 
    *
FROM
    empleado
ORDER BY apellido , nombre;

-- 1.4
SELECT 
    *
FROM
    departamentos
ORDER BY departamentos DESC
LIMIT 3;

-- 1.5  
SELECT 
    *
FROM
    departamentos
ORDER BY empleados DESC
LIMIT 3;



-- 2. Función COUNT()

-- 2.1
SELECT 
    COUNT(*)
FROM
    departamentos;
    
-- 2.2
SELECT 
    COUNT(*)
FROM
    beneficiarios
WHERE
    sexo = 'M';
    
-- 2.3
SELECT 
    COUNT(*)
FROM
    empleados
WHERE
    salario > '20000' AND salario < '50000';
    
-- 2.4 
SELECT 
    COUNT(*)
FROM
    empleados
WHERE
    fecha_nac > '1970';
    
-- 2.5 
SELECT 
    COUNT(*)
FROM
    departamentos
WHERE
    proyecto;
    
-- 2.6 
SELECT 
    COUNT(*)
FROM
    empleados
WHERE
    proyecto;
    

-- 3. Función SUM()

-- 3.1 
SELECT SUM(




