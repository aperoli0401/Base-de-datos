-- Examen Práctico Tema 7 Base de datos
-- Alejandro Peralta Oliva

-- Usar las bases de datos empresa y fútbol
USE empresa;
USE futbol;

-- 1. Crear usuarios
-- 1.1 Crear el usuario estadio con password Est@dio25. Sin ningún privilegio, sólo podrá acceder a la base de datos de prueba test
CREATE USER 'estadio@localhost' IDENTIFIED BY 'Est@dio25';

-- 1.2 Crear el usuario marcador con password Gol#2025. Sin ningún privilegio, sólo podrá acceder a la base de datos de prueba test
CREATE USER 'marcador@localhost' IDENTIFIED BY 'Gol#2025';

-- 1.3 Crear el usuario cuyo nombre sea tu nombre seguido del primer apellido, todo junto y en minúsculas (por ejemplo: juanmoreno), con password Examen#07. Sin ningún privilegio inicial
CREATE USER 'alejandroperalta@localhost' IDENTIFIED BY 'Examen#07';

-- 2. Asignación de privilegios
-- 2.1 Asignar al usuario estadio privilegios de superadministrador: todos los privilegios sobre todas las bases de datos, incluyendo el privilegio GRANT OPTION
GRANT options ON *.* TO 'estadio@localhost';

-- 2.2 Asignar al usuario estadio todos los privilegios sobre la base de datos futbol
GRANT options ON futbol.* TO 'estadio@localhost';

-- 2.3 Asignar al usuario estadio todos los privilegios sobre las tablas equipos y jugadores de la base de datos futbol
GRANT options ON futbol.equipos TO 'estadio@localhost';
GRANT options ON futbol.jugadores TO 'estadio@localhost';

-- 2.4 Asignar al usuario marcador privilegios para sólo consultar (SELECT) las tablas equipos, jugadores, partidos y goles de la base de datos futbol
GRANT SELECT ON futbol.equipos TO 'marcador@localhost';
GRANT SELECT ON futbol.jugadores TO 'marcador@localhost';
GRANT SELECT ON futbol.partidos TO 'marcador@localhost';
GRANT SELECT ON futbol.goles TO 'marcador@localhost';

-- 2.5 Asignar al usuario marcador privilegios para consultar y actualizar las columnas nombre, estadio, aforo y ciudad de la tabla equipos de la base de datos futbol
GRANT UPDATE ON futbol.equipos.estadio TO 'marcador@localhost';
GRANT SELECT ON futbol.equipos.estadio TO 'marcador@localhost';
GRANT UPDATE ON futbol.equipos.nombre TO 'marcador@localhost';
GRANT SELECT ON futbol.equipos.nombre TO 'marcador@localhost';
GRANT UPDATE ON futbol.equipos.aforo TO 'marcador@localhost';
GRANT SELECT ON futbol.equipos.aforo TO 'marcador@localhost';
GRANT UPDATE ON futbol.equipos.ciudad TO 'marcador@localhost';
GRANT SELECT ON futbol.equipos.ciudad TO 'marcador@localhost';

-- 2.6 Asignar al usuario marcador privilegios para sólo consultar las columnas id, nombre y fecha_nac, y actualizar únicamente la columna equipo_id de la tabla jugadores de la base de datos futbol
GRANT SELECT ON futbol.jugadores.id TO 'marcador@localhost';
GRANT SELECT ON futbol.jugadores.nombre TO 'marcador@localhost';
GRANT SELECT ON futbol.jugadores.fecha_nac TO 'marcador@localhost';
GRANT UPDATE ON futbol.jugadores.equipo_id TO 'marcador@localhost';

-- 2.7 Asignar al usuario con tu nombre todos los privilegios para acceder en modo consulta a todas las tablas de la base de datos futbol excepto a la tabla goles
GRANT SELECT ON futbol.* TO 'alejandroperalta@localhost';
REVOKE SELECT ON futbol.goles FROM 'alejandroperalta@localhost';

-- 3. Eliminar privilegios
-- 3.1 Quitar al usuario estadio el privilegio GRANT OPTION
REVOKE GRANT OPTION ON *.* FROM 'estadio@localhost';

-- 3.2 Quitar al usuario estadio todos los privilegios sobre todas las bases de datos
REVOKE ALL ON *.* FROM 'estadio@localhost';

-- 3.3 Quitar al usuario estadio todos los privilegios sobre la base de datos futbol
REVOKE ALL ON futbol.* FROM 'estadio@localhost';

-- 3.4 Quitar al usuario marcador el privilegio de inserción (INSERT) sobre la tabla partidos de la base de datos futbol
REVOKE INSERT ON partidos.* FROM 'marcador@localhost';

-- 3.5 Quitar al usuario marcador el privilegio de consulta sobre las columnas id, nombre y fecha_nac de la tabla jugadores de la base de datos futbol
REVOKE SELECT ON futbol.jugadores.id FROM 'marcador@localhost';
REVOKE SELECT ON futbol.jugadores.nombre FROM 'marcador@localhost';
REVOKE SELECT ON futbol.jugadores.fecha_nac FROM 'marcador@localhost';

-- 3.6 Quitar al usuario marcador el privilegio de acceso a todas las tablas de la base de datos futbol excepto a las tablas equipos y jugadores

-- 3.7 Quitar al usuario con tu nombre los privilegios de consulta, actualización y eliminación sobre las tablas equipos, jugadores y partidos de la base de datos futbol
REVOKE SELECT ON futbol.equipos FROM 'alejandroperalta@localhost';
REVOKE UPDATE ON futbol.equipos FROM 'alejandroperalta@localhost';
REVOKE DELETE ON futbol.equipos FROM 'alejandroperalta@localhost';

REVOKE SELECT ON futbol.jugadores FROM 'alejandroperalta@localhost';
REVOKE UPDATE ON futbol.jugadores FROM 'alejandroperalta@localhost';
REVOKE DELETE ON futbol.jugadores FROM 'alejandroperalta@localhost';

REVOKE SELECT ON futbol.partidos FROM 'alejandroperalta@localhost';
REVOKE UPDATE ON futbol.partidos FROM 'alejandroperalta@localhost';
REVOKE DELETE ON futbol.partidos FROM 'alejandroperalta@localhost';

-- 4. Renombrar usuarios y cambiar passwords
-- 4.1 Renombrar el usuario estadio a estadio_admin
RENAME USER 'estadio@localhost' TO 'estadio_admin@localhost';

-- 4.2 Renombrar el usuario marcador a marcador_ro (read-only)
RENAME USER 'marcador@localhost' TO 'marcador_ro@localhost';

-- 4.3 Cambiar el password del usuario estadio_admin. El nuevo password será Admin#2026. Se ha de mostrar la obtención del password cifrado

-- 4.4 Cambiar el password del usuario marcador_ro. El nuevo password será ReadOnly#99. Se ha de mostrar la obtención del password cifrado

-- 4.5 Eliminar el usuario con tu nombre
DROP USER 'alejandroperalta@localhost';

-- 5. Transacción con SAVEPOINT - Base de datos empresa
-- 5.1 Iniciar transacción 
START TRANSACTION 

-- 5.2 Crear un SAVEPOINT llamado antes_subida
SAVEPOINT antes_subida;

-- 5.3 Insertar dos nuevos empleados con datos válidos a criterio del alumno en el departamento de 'Desarrollo' (id = 5).

-- 5.4 Crear un SAVEPOINT llamado despues_insercion.
SAVEPOINT despues_insercion;

-- 5.5 Incrementar en un 15% el salario de todos los empleados del departamento 'Investigación' (id = 1).
UPDATE empleados SET salario = salario * 1.15 WHERE departamento_id = 1;

-- 5.6 Incrementar en un 10% el salario de todos los empleados del departamento 'Desarrollo' (id = 5).
UPDATE empleados SET salario = salario * 1.1 WHERE departamento_id = 5;

-- 5.7 Si tras la subida algún empleado del departamento 'Investigación' superase un salario de 60.000 €, deshacer únicamente las actualizaciones de salario volviendo al SAVEPOINT despues_insercion, manteniendo así los dos empleados insertados

-- 5.8 En caso contrario, confirmar la transacción completa con COMMIT.
COMMIT;

-- 6  Funciones MySQL - Base de datos empresa
-- 6.1 Mostrar el nombre completo de cada empleado en mayúsculas (nombre + apellidos), junto con la longitud total del nombre completo y los 4 primeros caracteres de los apellidos como código abreviado.
SELECT empleados (nombre, ' ', apellidos) AS nombre_completo;

-- 6.2 Mostrar el nombre, los apellidos y el salario formateado con separador de miles y 2 decimales usando FORMAT. Ordenar de mayor a menor salario.
SELECT empleados nombre, apellidos, salario;

-- 6.3 Mostrar el nombre, los apellidos y la edad actual de cada empleado. Calcular la edad usando TIMESTAMPDIFF(YEAR, fecha_nac, NOW()
SELECT empleados nombre, apellidos, timestampdiff(YEAR, fecha_nac, NOW());

-- 7. Bloqueos de tablas - Base de datos futbol
-- 7.1 Bloquear la tabla equipos en modo lectura (READ).
lock TABLES equipos read;

-- 7.2 Comprobar que se puede consultar (SELECT) la tabla equipos (debe permitirlo).
SELECT equipos;

-- 7.3 Intentar insertar un nuevo equipo (no debe permitirlo; indicar en un comentario el error obtenido)
INSERT INTO equipo(nombre, estadio, aforo, fundacion, ciudad) VALUES 
('Ubrique', 'Antonio Barbadillos', 398127098721, 'Fundación López Mariscal', 'Ubrique');

-- 7.4 Desbloquear todas las tablas
UNLOCK TABLES;

-- 8 Exportar e importar datos
-- 8.1 Exportar al fichero empleados_houston.csv todos los empleados cuya dirección contenga la ciudad 'Houston'. El fichero ha de estar en formato CSV con las siguientes características:
