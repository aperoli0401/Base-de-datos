-- Actividad 6.12
-- Alejandro Peralta Oliva

-- 1. Consulta Multitabla
SELECT 
    movimientos.id,
    movimientos.id_cuenta,
    cuentas.num_cuenta,
    CONCAT(clientes.apellidos, ',', clientes.nombre) AS clientes,
    DATE(movimientos.fecha_hora) AS fecha,
    movimientos.concepto,
    movimientos.tipo,
    movimientos.cantidad,
    movimientos.saldo
FROM
    movimientos
        INNER JOIN
    cuentas ON movimientos.id_cuenta = cuentas_id
        INNER JOIN
    clientes ON clientes.id_clientes = clientes.id
ORDER BY movimientos.id;

-- 2. Crear la vista mov_clientes
CREATE OR REPLACE VIEW mov_clientes AS 
SELECT 
    movimientos.id,
    movimientos.id_cuenta,
    cuentas.num_cuenta,
    CONCAT(clientes.apellidos, ',', clientes.nombre) AS clientes,
    DATE(movimientos.fecha_hora) AS fecha,
    movimientos.concepto,
    movimientos.tipo,
    movimientos.cantidad,
    movimientos.saldo
FROM
    movimientos
        INNER JOIN
    cuentas ON movimientos.id_cuenta = cuentas_id
        INNER JOIN
    clientes ON clientes.id_clientes = clientes.id
ORDER BY movimientos.id;

-- 3. Consultas 
-- 3.1 Movimientos del año 2021
SELECT 
    *
FROM
    mov_clientes
WHERE
    YEAR(fecha) = 2021;

-- 3.2 Movimientos de tipo ingresos
SELECT 
    *
FROM
    mov_clientes
WHERE
    tipo = 'I';

-- 3.3 Movimientos inferiores a 10€
SELECT 
    *
FROM
    mov_clientes
WHERE
    tipo = 'R' AND movimientos > 10€;
    
-- 3.4 Obtener el saldo de cada una de las cuentas con agrupación de registros
SELECT 
    num_cuentas, MAX(saldo) AS saldo_final
FROM
    mov_clientes
GROUP BY num_cuentas;