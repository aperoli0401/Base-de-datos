-- Actividad 5.13
-- Tema: Lenguajje SQL - DDL 
-- Módulo: Base de Datos
-- Curso: 25/26
-- Nombre: Alejandro Peralta

-- Creación de la base de datos
DROP DATABASE IF EXISTS bd_proyectos;
CREATE DATABASE IF NOT EXISTS bd_proyectos;

-- Usar base de datos taller
USE bd_proyectos;

-- Crear tabla clientes
DROP TABLE IF EXISTS clientes;
CREATE TABLE IF NOT EXISTS clientes (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	nif CHAR(9) UNIQUE NOT NULL
);

-- Crear la tabla Teléfonos de clientes
DROP TABLE IF EXISTS telefonos_clientes;
CREATE TABLE IF NOT EXISTS telefonos_clientes (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
	cliente_id INT UNSIGNED NOT NULL,
	telefono CHAR(9) NOT NULL,
	UNIQUE (cliente_id, telefono),
	FOREIGN KEY (cliente_id) REFERENCES clientes(id)
	ON DELETE CASCADE ON UPDATE CASCADE
);

-- Crear la tabla proyectos
DROP TABLE IF EXISTS proyectos;
CREATE TABLE IF NOT EXISTS proyectos (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	proyecto VARCHAR(100) NOT NULL, 
	descripcion TEXT NOT NULL, 
	presupuesto DECIMAL(10,2),
	cliente_id INT UNSIGNED,
	jefe_id INT UNSIGNED
);

-- Crear la tabla empleados
DROP TABLE IF EXISTS empleados;
CREATE TABLE IF NOT EXISTS empleados (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	dni CHAR(9) UNIQUE NOT NULL, 
	proyecto_id INT UNSIGNED,
	supervisor_id INT UNSIGNED,
	email VARCHAR(60) UNIQUE NOT NULL
);

-- Crear la tabla telefonos_empleados
DROP TABLE IF EXISTS telefonos_empleados;
CREATE TABLE IF NOT EXISTS telefonos_empleados (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	empleado_id INT UNSIGNED NOT NULL,
	telefono CHAR(9) NOT NULL,
	UNIQUE (empleado_id, telefono),
	FOREIGN KEY (empleado_id) REFERENCES empleados(id)
	ON DELETE CASCADE ON UPDATE CASCADE
);

-- Crear la tabla beneficiarios
DROP TABLE IF EXISTS beneficiarios;
CREATE TABLE IF NOT EXISTS beneficiarios (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
	fecha_nac DATE NOT NULL,
	empleado_id INT UNSIGNED NOT NULL,
	FOREIGN KEY (empleado_id) REFERENCES empleados(id)
	ON DELETE CASCADE ON UPDATE CASCADE 
);

-- Crear tabla Proyectos_empleados 
DROP TABLE IF EXISTS proyectos_empleados;
CREATE TABLE IF NOT EXISTS proyectos_empleados (
	empleado_id INT UNSIGNED NOT NULL, 
	proyecto_id INT UNSIGNED NOT NULL,
	horas SMALLINT UNSIGNED,
	valoracion VARCHAR(255),
	f_inicio DATE,
	f_fin DATE,
	PRIMARY KEY (empleado_id, proyecto_id),
	FOREIGN KEY (empleado_id) REFERENCES empleados(id)
	ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (proyecto_id) REFERENCES proyectos(id)
	ON DELETE RESTRICT ON UPDATE CASCADE
);

-- Tabla empleados restricciones FOREIGN KEY
ALTER TABLE empleados
ADD CONSTRAINT FK_proyecto_id_empleados
FOREIGN KEY (proyecto_id) REFERENCES proyectos(id)
ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT FK_supervisor_id_empleados
FOREIGN KEY (supervisor_id) REFERENCES empleados(id)
ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE proyectos
ADD CONSTRAINT FK_cliente_proyectos
FOREIGN KEY (cliente_id) REFERENCES clientes(id)
ON DELETE RESTRICT ON UPDATE CASCADE,
ADD CONSTRAINT FK_jefe_proyectos
FOREIGN KEY (jefe_id) REFERENCES empleados(id)
ON DELETE SET NULL ON UPDATE CASCADE;

-- Crear índice para la columna nombre de la tabla empleados
CREATE INDEX IN_nombre_empleados ON empleados(nombre);

-- Crear índice para la columna proyecto de la tabla proyectos
CREATE INDEX IN_proyecto_proyectos ON proyectos(proyecto);

SHOW INDEX FROM proyectos;
SHOW INDEX FROM empleados;
