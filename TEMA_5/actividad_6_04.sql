-- Atividad 6.4
-- Insertamos las ventas
INSERT INTO ventas (id, cliente_id, fecha, importe_bruto, importe_iva, importe_total) VALUES 
(11, 6, now(), 289.50, 60.80, 350.30);

-- Insertamos las lines_ventas de esa factura
INSERT INTO lineasventas (venta_id, numero_linea, libro_id, iva, cantidad, precio, importe) VALUES
(11, 1, 11, 0.21, 5, 30, 150),
(11, 2, 12, 0.21, 10, 13, 130),
(11, 3, 15, 0.21, 1, 9.50, 9.50);

-- 2.1 Actualizar la dierección del cliente
-- id = 5
UPDATE clientes 
SET 
    direccion = 'Polígono Ansu Fati, Calle Messi, Nave 20'
WHERE
    nif = '23423232G';

-- 2.2 Al escritor Osaar Wilde hay que añadirle también el premio planeta
SELECT id from autores where nombre = 'Oscar Wile';
UPDATE autores 
SET 
    premios = CONCAT_WS(',', premios, 'Planeta')
WHERE
    id = 2;
    
-- 2.3 Se decrementa el precio de venta de todos los libros en un 10%    
UPDATE libros
SET 
	precio_venta = precio_venta * 0.9
    
-- 2.4 Debido a una serie de impuestos se incrementa el precio de costo de todos los libros de las editoriales Alfaguara y Anaya en un 10%
SELECT id from editoriales where nombre = 'Alfaguara';
SELECT id from editoriales where nombre = 'Anaya'

UPDATE libros SET precio_coste = precio_coste * 1.10 WHERE editorial_id IN (5,6);

-- 2.5 Todos los libros editados antes del año 2000 se les descuenta 2 € del precio de venta
UPDATE libros 
SET 
    precio_venta = precio_venta - 2
WHERE
    YEAR(fecha_edicion) < 2000;
    
-- 4.3 Eliminar la editorial alfaguara, pero antes todos los libros de dicha editorial
SELECT id FROM editoriales WHERE nombre = 'Alfaguara';

-- Elimino todos los libros de la editorial Afaguara
DELETE FROM libros WHERE editorial_id = 5;

-- Elimino la eeditorial alfaguara
DELETE FROM editoriales WHERE id = 5;