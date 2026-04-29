-- Actividad 61
-- Tema 6 Lenguaje SQL DML
-- Base de datos 25/26
-- Alumno: Alejandro Peralta Oliva

-- Descripción: mina de datos de la bbdd futbol
USE futbol;

-- Tabla equipos
INSERT INTO equipos VALUES
(1, 'Real Madrid', 'Santiago Bernabéu', 81044, 1902, 'Madrid'),
(2, 'FC Barcelona', 'Spotify Camp Nou', 99354, 1899, 'Barcelona'),
(3, 'Atlético de Madrid', 'Cívitas Metropolitano', 68456, 1903, 'Madrid'),
(4, 'Sevilla FC', 'Ramón Sánchez-Pizjuán', 43883, 1890, 'Sevilla'),
(5, 'Real Betis Balompié', 'Benito Villamarín', 60721, 1907, 'Sevilla');

-- Tabla jugadores
INSERT INTO jugadores VALUES
(1, 'Vinícius Jr.', '2000-07-12', 1),
(2, 'Jude Bellingham', '2003-06-29', 1),
(3, 'Robert Lewandowski', '1988-08-21', 2),
(4, 'Antoine Griezmann', '1991-03-21', 3),
(5, 'Isco Alarcón', '1992-04-21', 5);

-- Tabla partidos
INSERT INTO partidos VALUES
(1, 1, 2, '2024-02-18 21:00:00', 2, 1, 'Clásico muy disputado'),
(2, 3, 4, '2024-03-02 18:30:00', 1, 0, 'Victoria ajustada'),
(3, 2, 4, '2024-03-10 20:00:00', 2, 2, 'Empate con goles'),
(4, 1, 3, '2024-03-15 21:00:00', 3, 1, 'Dominio local'),
(5, 5, 1, '2024-04-05 21:00:00', 1, 3, 'Victoria visitante');

-- Tabla goles
INSERT INTO goles VALUES
(NULL, 1, 10, 'Gol de Vinícius desde fuera del área', 1),
(NULL, 1, 80, 'Bellingham marca de cabeza', 2),
(NULL, 2, 30, 'Griezmann define con precisión', 4),
(NULL, 3, 20, 'Lewandowski anota tras un centro', 3),
(NULL, 5, 15, 'Isco marca con un disparo colocado', 5);