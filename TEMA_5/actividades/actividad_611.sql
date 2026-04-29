-- Actividad 6.11 
-- Group By - Having 

-- Base de datos empresa

USE empresa;

-- 1. Número de empleados en cada departamento columnas: id, departamento, num_empleados
SELECT 
    departamento_id, departamento.nombre departamento, COUNT(*) num_empleados
FROM
    empleados LEFT JOIN departamentos ON empleados.departamento_id = departamento.id
GROUP BY departamento_id;

-- 2. Obtener el número de empleados que hay en cada departamento cuyo sueldo esté por encima de los 30000 anuales. Mismas columnas que el ejercicio anterior. 
SELECT 
    departamento_id, departamento.nombre departamento, COUNT(*) num_empleados
FROM
    empleados LEFT JOIN departamentos ON empleados.departamento_id = departamento.id
WHERE salario > 30000
GROUP BY empleados.departamento_id;

-- 3. Obtener el número total de empleados que hay en cada departamento cuyo salario esté comprendido entre 20000 y 50000. Mismas columnas que el ejercicio anterior.
SELECT 
    departamento_id, departamento.nombre departamento, COUNT(*) num_empleados
FROM
    empleados LEFT JOIN departamentos ON empleados.departamento_id = departamento.id
WHERE salario BETWEEN 20000 AND 50000
GROUP BY empleados.departamento_id;

-- 4. Obtener el número de empleados que nacieron en cada año. Mostrar las columnas con el alias Año y Nempleados.
SELECT 
    anio, num_empleado
FROM
    empleados
GROUP BY YEAR(fecha_nac);

-- 5. Sobre la tabla Empleados_proyectos, obtener la suma total de horas trabajadas en cada proyecto. Mostrar id, Proyecto y HorasAcumuladas.
SELECT 
    id, proyecto, HorasAcumuladas
FROM
    empleados_proyectos
GROUP BY horas;

-- 6. Obtener el número de empleados que tiene a su cargo cada supervisor. Mostrar id, Apellidos, Nombre, y el alias numDependientes
SELECT 
    id, apellidos, nombre, numDependientes.supervisor_id
FROM
    empelados
GROUP BY supervisor_id;

-- 7. Obtener para cada departamento la siguiente información estadística:
-- a. Número de Departamento
SELECT 
    num_departamento.departamento_id
FROM
    empleados;
    
-- b. Nombre del Departamento
SELECT 
    nombre
FROM
    departamentos;

-- c. Jefe del Departamento
SELECT 
    jefe_departamento_id
FROM
    departamentos;
    
-- d. Numero de Empleado
SELECT 