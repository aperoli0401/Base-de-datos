-- Actividad 7.2 Tema 7 Base de datos
-- Alejandro Peralta Oliva

-- 1. Asignar al usuario juan todos los privilegios a nivel global.alter
GRANT ALL ON *.* TO juan;

-- 2. Asignar al usuario pedro el privilegio de poder acceder a todas las bases de datos pero sólo para consultar (SELECT)
GRANT SELECT ON *.* TO pedro;

-- 3. Asignar al usuario maria privilegios de acceso a las bases de datos gestlibros y maratoon sólo para ejecutar los comandos ALTER, CREATE, UPDATE Y SELECT.
GRANT ALTER, CREATE, UPDATE, SELECT ON geslibros TO maria;
GRANT ALTER, CREATE, UPDATE, SELECT ON maratoon TO maria;

-- 4. Asignar al nuevo usuario roberto/roberto_67 privilegios de super administrador.
CREATE USER roberto@localhost IDENTIFIED BY 'roberto_67';
GRANT ALL ON *.* TO roberto@localhost WITH GRANT OPTION;

-- 5. Asignar al nuevo usuario rocio/rocio_69 todos los privilegios sobre la base de datos geslibros.
CREATE USER rocio@localhost IDENTIFIED BY 'rocio_69';
GRANT ALL ON geslibros TO rocio@localhost;

-- 6. Asignar al nuevo usuario carlos/carlos_90 privilegios sobre la tabla libros, editoriales y clientes de la base de datos geslibros, además sólo podrá realizar consultas y actualizaciones.
CREATE USER carlos@localhost IDENTIFIED BY 'carlos_90';
GRANT ALL ON geslibros.libros TO carlos@localhost;
GRANT ALL ON geslibros.editoriales TO carlos@localhost;
GRANT ALL ON geslibros.clientes TO carlos@localhost;

-- 7. Asignar al nuevo usuario anamari/anamari_2000 privilegios para acceder a las columnas titulo, ean, isbn y precio_venta de la tabla libros de la base de datos geslibros sólo para consultar.
CREATE USER anamari@localhost IDENTIFIED BY 'anamari2000';
GRANT SELECT (titulo, ean, isbn, precio_venta) ON geslibros.libros TO anamari@localhost;

-- 8. Asignar al usuario anamari privilegios para acceder a las columnas nombre, telefono, email de la tabla clientes de la base de datos geslibros sólo para consultar y actualizar.
GRANT SELECT (nombre, telefono, email), UPDATE (nombre, telefono, email) ON geslibros.clientes TO 'anamari'@'localhost';