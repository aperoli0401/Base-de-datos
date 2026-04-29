-- Actividad 6.8
-- Consultas multitablas 

-- Activamos la base de datso de futbol
USE futbol;

-- 1. Realiza un producto cartesiano entre las tablas jugadores equipos
SELECT * FROM jugadores, equipos;

-- 2. Realiza un producto cartesiano entre las tablsa jugadores y goles
SELECT * FROM jugadores, goles;

-- 3. Realiza un producto cartesiano entre la tabla jugadores y equipos eliminando los registros espurios (where)
SELECT * FROM jugadores, equipos WHERE jugadores.equipo_id = equipo.id;

-- 4. Realiza un producto cartesiano entre las tabla jugadoes y goles eliminando los registios espurios (where)
SELECT * FROM goles, jugadores WHERE goles.jugador_id = jugador.id;

-- 5. Realiza INNER JOIN correcto entre las tablas jugadores y equipos, devolver todas las columnas de jugadores y de equipos.
SELECT 
    id,
    nombre,
    TIMESTAMPDIFF(YEAR,
        jugadores.fecha_nac,
        CURDATE()) edad
FROM
    futbol.jugadores
        INNER JOIN
    jugadores ON equipos.jugadores_id = jugadores_id;
    
    
-- 6. Realiza INNER JOIN correcto entre las tablas jugadores y equipos, devolver las columnas id, nombre, edad y equipo.
SELECT 
    *
FROM
    jugadores
        INNER JOIN
    equipos ON jugadores.equipos_id = equipos_id;
    

-- 7. Realizar INNER JOIN correcto entre las tablas jugadores y goles.
SELECT 
    *
FROM
    goles
        INNER JOIN
    jugadores ON goles.jugadores_id = jugadores_id;
    
    
-- 8. Realiza INNER JOIN correcto entre las tablas jugadores y goles, devolver las columnas id, nombre, minuto, descripción
SELECT 
    id, nombre, minuto, descripcion
FROM
    goles
        INNER JOIN
    jugadores ON goles.jugadores_id = jugadores_id;
    

-- 9. Realizar INNER JOIN correcto entre las tablas jugadores, equipos y goles.
SELECT 
    *
FROM
    equipo
        INNER JOIN
    jugadores ON equipos.jugadores_id = jugadores_id
        INNER JOIN
    goles ON jugadores.goles_id = goles_id;
    

-- 10. Realiza INNER JOIN correcto entre las tablas jugadores y goles, devolver las columnas id, nombre, equipo, minuto, descripción
SELECT 
    id, nombre, equipo, minuto, descripcion
FROM
    goles
        INNER JOIN
    jugadores ON goles.jugadores_id = jugadores_id;
    
    
-- 11. Realizar INNER JOIN correcto entre las tablas jugadores, equipos, goles y partidos. Todas las columnas
SELECT 
    *
FROM
    partidos
        INNER JOIN
    equipos ON equipos.partidos_id = partidos_id
        INNER JOIN
    jugadores ON equipos.jugadores_id = jugadores_id
        INNER JOIN
    goles ON jugadores.goles_id = goles_id;
    
    
-- 12. Realiza INNER JOIN correcto entre las tablas jugadores y goles, devolver las columnas id, nombre, equipo, minuto, descripción, observaciones
SELECT 
    id, nombre, equipo, minuto, descripcion
FROM
    goles
        INNER JOIN
    jugadores ON jugadores.goles_id = goles_id;