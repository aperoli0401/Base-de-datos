-- Procedimiento que d

-- Parametros: id de la carrera.
-- Sálida: clasificación de la carrera

DELIMITER $$
CREATE PROCEDURE maratoon.clasificacion_carrera(IN id_carrera INT) 
BEGIN
    SELECT
        r.id AS Registro,
        co.id,
        co.apellidos,
        co.nombre,
        co.Club_id,
        cl.NombreCorto AS Club,
        co.Categoria_id,
        ca.NombreCorto AS Categoria,
        r.TiempoInvertido
    FROM
        maratoon.corredores co
        INNER JOIN
        maratoon.clubs cl ON co.Club_id = cl.id
        INNER JOIN
        maratoon.categorias ca ON co.categoria_id = ca.id
        INNER JOIN
        maratoon.registros r ON co.id = r.corredor_id
    WHERE   
        r.carrera_id = id_carrera
        ORDER BY r.TiempoInvertido ASC;
END$$