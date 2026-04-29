-- ejemplo de vistas
SELECT * FROM registros;
SELECT * FROM registros where carrera_id = 1 order by TiempoInvertido;

-- nombre del corredor
SELECT 
    registros.id,
    registros.corredor_id,
    corredores.nombre,
    corredores.apellidos,
    corredores.Categoria_id,
    categorias.nombrecorto,
    corredores.Club_id,
    clubs.nombre club,
    registro.TiempoInvertido
FROM
    ((registros
        INNER JOIN
    corredores ON registros.corredor_id = corredores.id)
    INNER JOIN clubs ON corredores.club_id = club.id)
    INNER JOIN categorias ON corredores.categorias_id = categorias.id
WHERE
    carrera_id = 1
ORDER BY TiempoInvertido;

-- convertir en una vista clasificacion_nutrias
CREATE OR REPLACE VIEW clasificacion_nutrias AS
SELECT 
    registros.id,
    registros.corredor_id,
    corredores.nombre,
    corredores.apellidos,
    corredores.Categoria_id,
    categorias.nombrecorto,
    corredores.Club_id,
    clubs.nombre club,
    registro.TiempoInvertido
FROM
    ((registros
        INNER JOIN
    corredores ON registros.corredor_id = corredores.id)
    INNER JOIN clubs ON corredores.club_id = club.id)
    INNER JOIN categorias ON corredores.categorias_id = categorias.id
WHERE
    carrera_id = 1
ORDER BY TiempoInvertido;

-- creada la vista puedo usarla como una tabla
-- clasificación VTB a partir de la vista
SELECT * FROM clasificacion_nutrias WHERE categoria = 'VTB';
SELECT 
    id, nombre, apellidos, categoria, club, tiempoinvertido
FROM
    clasificacion_nutrias
WHERE
    categoria = 'VTB';
    
    
-- ahora vamos a crear la clasificacion VTA
SELECT * FROM clasificacion_nutrias WHERE categoria = 'VTA';
SELECT 
    id, nombre, apellidos, categoria, club, tiempoinvertido
FROM
    clasificacion_nutrias
WHERE
    categoria = 'VTA';

-- cuantos corredores han llegado de cada cateoria
SELECT categoria, COUNT(*) participantes FROM clasificacion_nutrias GROUP BY categoria;

-- cuantos corredores han llegado de cada club
SELECT club, COUNT(*) participantes FROM clasificacion_nutrias GROUP BY club;