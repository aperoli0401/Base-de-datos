-- Actualiza edad de los corredores

DELIMITER $$
DROP PROCEDURE IF EXISTS maratoon.actualizar_edad_corredores$$
CREATE PROCEDURE maratoon.actualizar_edad_corredores()
BEGIN
    UPDATE maratoon.corredores
    SET Edad = YEAR(CURDATE()) - YEAR(FechaNacimiento);
END$$