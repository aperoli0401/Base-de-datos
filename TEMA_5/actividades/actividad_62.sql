-- Alejandro Peralta Oliva
-- Actividad 6.2 - Base de datos
-- Operaciones de actualización (UPDATE)

-- Uso la tabla de futbol actualizada
USE futbol;

-- Actualiza el nombre del equipo Girona FC
UPDATE equipos
SET nombre = 'Girona Futbol Club'
WHERE nombre = 'Girona FC';

-- Actualiza la ciudad del Villarreal CF
UPDATE equipos
SET ciudad = 'Vila-real'
WHERE nombre = 'Villarreal CF';

-- Incrementa el aforo en 1000 a los equipos con más de 50.000 plazas
UPDATE equipos
SET aforo = aforo + 1000
WHERE aforo > 50000;

-- Asigna al jugador Hugo Duro al equipo con id = 7
UPDATE jugadores
SET equipo_id = 7
WHERE nombre = 'Hugo Duro';

-- Actualiza la fecha de nacimiento de Takefusa Kubo
UPDATE jugadores
SET fecha_nac = '2001-06-05'
WHERE nombre = 'Takefusa Kubo';

-- Actualiza el resultado del partido con id = 7
UPDATE partidos
SET goles_casa = 2,
    goles_fuera = 1
WHERE id = 7;

-- Añade "(actualizado)" a las observaciones de los 3 partidos más recientes
UPDATE partidos
SET observaciones = concat_ws(' ',observaciones, ' (actualizado)')
ORDER BY fecha DESC
LIMIT 3;

-- Incrementa en 1 el minuto de los goles marcados de penalti
UPDATE goles
SET minuto = minuto + 1
WHERE descripcion LIKE '%penalti%';

-- Cambia el autor del gol al jugador con id = 18
-- Solo si el gol pertenece al equipo local en el partido con id = 13
UPDATE goles 
JOIN partidos p ON goles.partido_id = partido.id
SET goles.jugador_id = 18
WHERE goles.partido_id = 13
  AND goles.equipo_id = partido.equipo_casa_id;


-- Incrementa en 1 el minuto de los dos primeros goles del jugador con id = 20
UPDATE goles
SET minuto = minuto + 1
WHERE jugador_id = 20
ORDER BY minuto
LIMIT 2;

-- Actualiza el nombre del estadio de la Real Sociedad
UPDATE equipos
SET estadio = 'Reale Arena Nuevo'
WHERE nombre = 'Real Sociedad';

-- Cambia de equipo a todos los jugadores del Girona Futbol Club al equipo con id = 8
UPDATE jugadores
SET equipo_id = 8
WHERE equipo_id = (
    SELECT id FROM equipos WHERE nombre = 'Girona Futbol Club'
);

-- Suma un gol al equipo local cuando el Valencia CF juega en casa
UPDATE partidos
SET goles_casa = goles_casa + 1
WHERE equipo_casa_id = 6;

-- Resta 2 minutos a los goles marcados después del minuto 80
UPDATE goles
SET minuto = minuto - 2
WHERE minuto > 80;

-- Corrige el nombre completo del jugador José Gayà
UPDATE jugadores
SET nombre = 'José Gayà'
WHERE id = 16;
