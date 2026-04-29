CREATE DATABASE empleados_taller;
USE empleados_taller;

CREATE TABLE Clientes (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    nif VARCHAR(20)
);

CREATE TABLE Empleados (
    id INT PRIMARY KEY,
    dni VARCHAR(20),
    nombre VARCHAR(100),
    id_proyecto INT,
    id_empleado_sup INT,
    FOREIGN KEY (id_proyecto) REFERENCES Proyectos(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    FOREIGN KEY (id_empleado_sup) REFERENCES Empleados(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE TelefonosEmpleados (
    id_empleado INT,
    telefono VARCHAR(20),
    PRIMARY KEY (id_empleado, telefono),
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE TelefonosClientes (
    id_cliente INT,
    telefono VARCHAR(20),
    PRIMARY KEY (id_cliente, telefono),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Proyectos (
    id INT PRIMARY KEY,
    proyecto VARCHAR(100),
    descripcion VARCHAR(255),
    presupuesto DECIMAL(10,2),
    id_empleado_jefe INT,
    id_cliente INT,
    FOREIGN KEY (id_empleado_jefe) REFERENCES Empleados(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE ProyectoEmpleados (
    id_proyecto INT,
    id_empleado INT,
    horas INT,
    f_inicio DATE,
    f_fin DATE,
    valoracion INT,
    PRIMARY KEY (id_proyecto, id_empleado),
    FOREIGN KEY (id_proyecto) REFERENCES Proyectos(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

CREATE TABLE Beneficiarios (
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    fechaNac DATE,
    id_empleado INT,
    FOREIGN KEY (id_empleado) REFERENCES Empleados(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);
