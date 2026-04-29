-- ejemplo
-- select

-- Muestra todos los registros de la tabla libros, 
-- con todas las columnas de la tabla
-- Lista de todas las columnas: *
SELECT * FROM libros;

-- Especificamos lista de columnas
Select id, titulo, autor_id, editorial_id, precio_venta FROM libros;

-- Especificamos lista de columnas con otro orden
SELECT 
    id,
    titulo,
    precio_venta,
    autor_id,
    editorial_id precio_coste
FROM
    libros;
    
-- Lista de columnas con expresión 
-- Beneficio que obtengo de cada libro: precio_venta - precio_coste
SELECT 
    id,
    titulo,
    autor_id,
    editorial_id,
    precio_coste,
    precio_venta,
    precio_venta - precio_coste
FROM
    libros;
    
-- Lista de columnas con expresión 
-- Beneficio que obtengo de cada libro: precio_venta - precio_coste
-- Coloca el alias beneficios en esta última columna
SELECT 
    id,
    titulo,
    autor_id,
    editorial_id,
    precio_coste,
    precio_venta,
    precio_venta - precio_coste AS beneficio
FROM
    libros;
    
-- Lista de columnas con expresión 
-- Beneficio que obtengo de cada libro: precio_venta - precio_coste
-- La cláusula AS no es obligatoria
SELECT 
    id,
    titulo,
    autor_id,
    editorial_id,
    precio_coste,
    precio_venta,
    precio_venta - precio_coste beneficio
FROM
    libros;
    
-- Uso de prefijos 
-- Columnas: nombre de la base de datos, nombre de la tabla 
-- Tablas: nombre de la base de datos
SELECT 
    geslibros.libros.id,
    geslibros.libros.titulo,
    libros.autor_id,
    libros.editorial_id,
    libros.precio_coste,
    libros.precio_venta,
    libros.precio_venta - libros.precio_coste beneficio
FROM
    geslibros.libros;
    
-- Cláusula FROM 
-- las tablas a partir de la cual extraigo los datos
SELECT 
    libros.id,
    libros.titulo,
    libros.autor_id,
    autores.id as id_autor,
    autores.nombre as autor,
    libros.id as id_libro,
    libros.precio_venta
FROM
    libros,
    autores;
	

