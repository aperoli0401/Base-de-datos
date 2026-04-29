-- Actividad 7.4 Base de datos Tema 7
-- Descripción : uso de transacciones
-- Alejandro Peralta Oliva

-- Usar la geslibros
USE geslibros;

-- 1. Incluye en una transacción un proceso que realice las siguientes actualizaciones:
-- 1.1 Todos los libros de tema Novela se ponen en oferta y se decrementa el precio en un 10%
START TRANSACTION;
UPDATE libros 
SET precio_venta = precio_venta * 0.90
WHERE id IN (
    SELECT libro_id FROM libros_temas lt
    JOIN temas t ON lt.tema_id = t.id
    WHERE t.tema = 'Novela'
);

-- 1.2 Los libros de la editorial Anaya se incrementa el precio en un 6% mientras que el resto de editoriales se reduce en un 4,5%
UPDATE libros 
SET precio_venta = CASE 
    WHEN editorial_id = (SELECT id FROM editoriales WHERE nombre = 'Anaya') THEN precio_venta * 1.06
    ELSE precio_venta * 0.955
END;

-- 2. Finalizar la transacción deshaciendo las operaciones anteriores. Comprobar
ROLLBACK;

SELECT * FROM libros;

-- 3. Inicia una nueva transacción que contenga las siguientes operaciones:
-- 3.1 Añadir dos nuevos libros
START TRANSACTION;
INSERT INTO libros(id, isbn, ean, titulo, autor_id, editorial_id, precio_coste, precio_venta, stock, stock_min, stock_max, fecha_edicion) VALUES 
('9780000000001', 'El quijote', 1, 1, 15.00, 25.00, 50, '2026-01-01'),
('9780000000002', 'Unity', 2, 3, 18.00, 32.00, 30, '2026-02-15');

-- 3.2 Añadir una venta y 3 líneas de detalle sobre esa venta
INSERT INTO ventas(cliente_id, fecha, importe_bruto, importe_iva, importe_total) 
VALUES (3, DATE(), 75.84, 17.93, 99);
SET @ultima_venta = LAST_INSERT_ID();
INSERT INTO lineasventas(venta_id, numero_linea, libro_id, iva, cantidad, precio, importe) VALUES
(@ultima_venta, 1, 1, 0.21, 10, 10, 10),
(@ultima_venta, 2, 2, 0.21, 20, 20, 20),
(@ultima_venta, 3, 3, 0.21, 30, 30, 30);

-- 4. Finalizar la transacción confirmando las operaciones anteriores.
COMMIT;

-- 5. Incluye en una transacción las siguientes operaciones sobre la base de datos geslibros:
-- 5.1 Insertar dos libros
START TRANSACTION;
INSERT INTO libros(id, isbn, ean, titulo, autor_id, editorial_id, precio_coste, precio_venta, stock, stock_min, stock_max, fecha_edicion) VALUES 
('2712766217', 'La celestina', 1, 1, 15.00, 25.00, 50, '2026-01-01'),
('271627626872', 'Los futbolisimos', 2, 3, 18.00, 32.00, 30, '2026-02-15');

-- 5.2 Insertar dos clientes
INSERT INTO clientes(id, nombre, direccion, poblacion, c_postal, provincia_id, nif, telefono, movil, email) VALUES
('Juan Pérez', '12345678A', 'juan@ejemplo.com'),
('Marta Sánchez', '87654321B', 'marta@ejemplo.com');

-- 5.3 Crear SAVEPOINT a
SAVEPOINT a;

-- 5.4 Actualizar precios +10%
UPDATE libros SET precio_venta = precio_venta * 1.10;

-- 5.5 Crear SAVEPOINT b
SAVEPOINT b;

-- 5.6 Eliminar libros no vendidos (aquellos que no están en lineasventas)
DELETE FROM libros 
WHERE id NOT IN (SELECT DISTINCT libro_id FROM lineasventas WHERE libro_id IS NOT NULL);

-- 5.7 Deshacer a partir del SAVEPOINT a
ROLLBACK TO SAVEPOINT a;

-- 5.8 Comprobar y finalizar
SELECT * FROM libros;
SELECT * FROM Clientes;

COMMIT;