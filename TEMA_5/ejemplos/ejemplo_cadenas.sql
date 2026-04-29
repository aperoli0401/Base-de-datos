USE maratoon;

-- función locate
CREATE VIEW corredores_2 AS SELECT id, CONCAT_WS(',', apellidos, nombre) AS corredorm LEFT(apellidos, 3) FROM corredores;

-- funcion locate
SELECT LOCATE(',', corredor) from corredores_2;

