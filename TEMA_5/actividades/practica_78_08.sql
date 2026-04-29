-- Practica 7.8 Base de datos Tema 7
-- Alejandro Peralta Oliva

-- Usar la base de datos maratoon.sql
USE maratoon;

-- 1. Añadir corredores
INSERT INTO corredores(nombre, apellidos, ciudad, fechaNacimiento, sexo, club_id) VALUES
('Carlos', 'Sánchez Ruiz', 'Jerez', '1995-05-10', 'H', 5),
('Ana', 'López Castro', 'Jerez', '1988-11-22', 'M', 5),
('Roberto', 'Gómez Faz', 'Jerez', '2005-02-15', 'H', 5);

-- 2. Actualizar Feed
UPDATE corredores SET Edad = timestampdiff(YEAR, fechaNacimiento, curdate());

-- 3. Acutalizar categoria
UPDATE corredores SET categoria_id = 
	CASE 
		WHEN Edad < 12 THEN 1
        WHEN Edad < 15 THEN 2
        WHEN Edad < 18 THEN 3
        WHEN Edad < 30 THEN 4
        WHEN Edad < 40 THEN 5
        WHEN Edad < 50 THEN 6
        WHEN Edad < 60 THEN 7
        ELSE 8
	END;

-- 3.1 Mostrar corredores de manera general
SELECT 
    corredores.id,
    corredores.Nombre,
    corredores.Apellidos,
    corredores.fechaNacimiento,
    corredores.Edad,
    categorias.Nombrecorto AS Categoria,
    clubs.NombreCorto AS Club
FROM
    corredores
        INNER JOIN
    categorias ON corredores.Categoria_id = categorias.id
        INNER JOIN
    clubs ON corredores.club_id = clubs.id;
    
-- 3.2 Mostrar corredores que cumplen años el mes que viene
SELECT 
    corredores.id,
    corredores.Nombre,
    corredores.Apellidos,
    corredores.fechaNacimiento,
    corredores.Edad,
    categorias.Nombrecorto AS Categoria,
    clubs.NombreCorto AS Club
FROM
    corredores
        INNER JOIN
    categorias ON corredores.Categoria_id = categorias.id
        INNER JOIN
    clubs ON corredores.club_id = clubs.id 	WHERE month(corredores.FechaNacimiento) = MONTH(date_add(CURDATE(), INTERVAL 1 MONTH));
    
-- 3.3 Mostrar corredores nacidos en el 2º cuatrimestre
SELECT 
    corredores.id,
    corredores.Nombre,
    corredores.Apellidos,
    corredores.fechaNacimiento,
    corredores.Edad,
    categorias.Nombrecorto AS Categoria,
    clubs.NombreCorto AS Club
FROM
    corredores
        INNER JOIN
    categorias ON corredores.Categoria_id = categorias.id
        INNER JOIN
    clubs ON corredores.club_id = clubs.id where MONTH(corredores.FechaNacimiento) between 5 AND 8;
    
-- 4. Maratoon en Sevilla
INSERT INTO registros (carreras_id, corredores_id, Salida, Llegada) VALUES 
(2, 1, '2026-04-20 09:00:00', '2026-04-20 11:00:00'),
(2, 2, '2026-04-20 09:00:00', '2026-04-20 11:00:00'),
(2, 3, '2026-04-20 09:00:00', '2026-04-20 11:00:00'),
(2, 4, '2026-04-20 09:00:00', '2026-04-20 11:00:00'),
(2, 5, '2026-04-20 09:00:00', '2026-04-20 11:00:00');

-- 5. Actualizar el tiempo de llegada
UPDATE registros SET TiempoInvertido = timestampdiff(Llegadad, Salida) WHERE carreras_id = 2;

-- 6. Mostrar la clasificación
SELECT 
    corredores.id, 
    corredores.Nombre, 
    corredores.Apellidos, 
    clubs.Nombre AS Club, 
    categorias.Nombre AS Categoria, 
    registros.TiempoInvertido,
    TIME_TO_SEC(registros.TiempoInvertido) AS TotalSegundos,
    TIMEDIFF(registros.TiempoInvertido, '02:01:39') AS DiferenciaRecord
FROM registros 
INNER JOIN Corredores ON registros.corredores_id = corredores.id
INNER JOIN clubs ON corredores.club_id = clubs.id
INNER JOIN categorias ON corredores.categoria_id = categorias.id
WHERE registros.carrera_id = 2
ORDER BY registros.TiempoInvertido ASC;