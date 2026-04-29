-- Examen Tema 6 de base de datos 
-- Alejandro Peralta Oliva

-- Usar la tabla de geslibros
USE geslibros;

-- 1. Insertar un nuevo libro en la base de datos con los siguientes datos:
INSERT INTO libros 
(autor_id, editorial_id, isbn, ean, titulo, precio_coste, precio_venta, stock, stock_min, stock_max, fecha_edicion)
VALUES 
(
    (SELECT id FROM autores WHERE nombre = 'Oscar Wilde'),
    (SELECT id FROM editoriales WHERE nombre = 'Planeta'),
    '9788408096528',
    '9788888199587',
    'El Retrato de Dorian Gray',
    18.00,
    24.00,
    12,
    5,
    25,
    '2015-03-15'
);

-- 2. Insertar los registros necesarios en la tabla libros_temas para asociar el libro insertado anteriormente con las temáticas de Novela y Ciencia.
INSERT INTO libros_temas (libro_id, tema_id)
VALUES 
(
    (SELECT id FROM libros WHERE isbn = '9788408096528'),
    (SELECT id FROM temas WHERE nombre = 'Novela')
),
(
    (SELECT id FROM libros WHERE isbn = '9788408096528'),
    (SELECT id FROM temas WHERE nombre = 'Ciencia')
); 

-- 3. Insertar un nuevo registro en la tabla ventas y sus correspondientes líneas de venta:
-- Cliente: CP Rio Tajo
-- Fecha de venta: 2014-05-10
INSERT INTO ventas (cliente_id, fecha)
VALUES (
    (SELECT id FROM clientes WHERE nombre = 'CP Rio Tajo'),
    '2014-05-10'
);

-- 4 Crear 2 líneas de venta con al menos 2 libros diferentes y que se pueda emparejar con la venta anterior
INSERT INTO lineasventas (venta_id, libro_id, cantidad, precio)
VALUES
(
    (SELECT MAX(id) FROM ventas),
    (SELECT id FROM libros LIMIT 1),
    2,
    (SELECT precio FROM libros LIMIT 1)
),
(
    (SELECT MAX(id) FROM ventas),
    (SELECT id FROM libros LIMIT 1 OFFSET 1),
    1,
    (SELECT precio FROM libros LIMIT 1 OFFSET 1)
);


-- 5. Actualizar el precio de venta de todos los libros de la editorial Planeta incrementándolo en un 15%.
UPDATE libros 
SET 
    precio_venta = precio_venta * 1.15
WHERE
    editorial_id = 'Planeta';
    

-- 6. Reducir el stock de todos los libros cuyo stock actual sea superior a 15 unidades en un 20%.
UPDATE libros 
SET 
    precio_venta = precio_venta * 1.20
WHERE
    stock > 15;
    

-- 7. Eliminar de la base de datos todos los libros de temática Viajes.
DELETE FROM libros_temas 
WHERE
    tema_id = 'Viajes';
    

-- 8. Mostrar aquellos clientes cuya dirección de email pertenezca al dominio "gmail.com" y que estén ubicados en la provincia de Guadalajara.
SELECT 
    clientes.id, nombre, direccion, c_postal, nif, telefono, email
FROM
    clientes
        INNER JOIN
    provincias ON clientes.provincia_id = provincias.id
WHERE
    email = '%gmail.com'
        AND provincia = 'Guadalajara';
        
        
-- 9. Mostrar las 5 ventas con menor importe total realizadas en el año 2013
SELECT 
    ventas.id,
    clientes.nombre,
    fecha,
    importe_bruto,
    importe_iva,
    importe_total
FROM
    ventas
        INNER JOIN
    clientes ON ventas.cliente_id = clientes.id
ORDER BY importe_total DESC
LIMIT 5;


-- 10. Mostrar los libros publicados en el año 2014 cuyo stock sea inferior a 20 unidades.
SELECT 
    libros.id,
    titulo,
    autores.nombre AS autor,
    editoriales.nombre AS editorial,
    stock,
    precio_coste,
    precio_venta
FROM
    libros
        INNER JOIN
    autores ON libros.autor_id = autores.id
        INNER JOIN
    editoriales ON libros.editorial_id = editoriales.id
WHERE
    stock < 20 AND fecha_edicion = '2014-%%'
ORDER BY titulo;


-- 11. Mostrar los libros de temática Novela cuyo precio de venta sea superior a 20 €
SELECT 
    libros.id,
    titulo,
    autores.nombre AS autor,
    editoriales.nombre AS editorial,
    temas.tema AS tema,
    precio_coste,
    precio_venta
FROM
    libros
        INNER JOIN
    autores ON libros.autor_id = autores.id
        INNER JOIN
    editoriales ON libros.editorial_id = editoriales.id
        INNER JOIN
    libros_temas ON libros.libros_temas_id = libros_temas.id
        INNER JOIN
    temas ON libros.temas_id = temas.id
WHERE
    temas.tema = 'Novela'
        AND precio_venta > 20;
        
        
-- 12. Mostrar los libros cuyo precio de venta sea superior al precio medio de todos los libros de la base de datos.
SELECT 
    libros.id,
    titulo,
    autores.nombre AS autor,
    editoriales.nombre AS editorial,
    precio_venta
FROM
    libros
        INNER JOIN
    autores ON libros.autores_id = autores.id
        INNER JOIN
    editoriales ON libros.editoriales_id = editoriales.id
WHERE
    precio_venta > AVG(precio_venta)
ORDER BY precio_venta DESC;


-- 13. Mostrar el número de ventas realizadas y el importe total facturado por cada cliente.
SELECT 
    COUNT(clientes.id),
    clientes.nombre AS nombre_cliente,
    lineasventas.cantidad AS numero_ventas,
    importe_total
FROM
    ventas
        INNER JOIN
    clientes ON ventas.cliente_id = cliente.id
GROUP BY SUM(librosventas.cantidad);

-- 14. Mostrar estadísticas de ventas para cada libro: número de unidades vendidas, importe total vendido y precio medio de venta.
SELECT 
    clientes.id AS id_cliente,
    clientes.nombre AS nombre_cliente,
	COUNT(librosventas.cantidad) AS numero_ventas,
    SUM(ventas.importe_total),
    AVG(precio_venta) AS precio_medio
FROM
    libros
        INNER JOIN
    lineasventas ON libros.lineasventas_id = lineasventas.id
ORDER BY ventas.importe_total DESC;