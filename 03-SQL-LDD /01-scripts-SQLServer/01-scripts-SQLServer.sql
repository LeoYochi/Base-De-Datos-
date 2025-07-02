-- Lenguaje SQL-LDD (create, alter, drop)

-- Crear la base de datos empresa
CREATE DATABASE empresa;
GO
--  Utilizar la base de datos creada
USE empresa;
GO

--Crear la tabla empleados
CREATE TABLE Empleados(
    IdEmpleado int not null,
    nombre varchar(100) not null,
    Puesto varchar(50) not null,
    FechaIngreso date,
    Salario money not null,
    CONSTRAINT pk_empleados
    PRIMARY KEY (IdEmpleado)
);

CREATE TABLE productos(
productoId int primary key,
nombreProducto nvarchar(50) not  null,
Existencia int not null,
PrecioUnitario money not null
);
GO

CREATE TABLE Productos2(
ProductoId int not null identity(1,1),
nombreProducto nvarchar(50) not null,
Existencia int not null,
precio money not null,
CONSTRAINT pk_productos2
PRIMARY KEY(ProductoId),
CONSTRAINT unique_nombreproducto
UNIQUE(NombreProducto),
CONSTRAINT chk_existencia
CHECK (Existencia>0 AND Existencia<=1000),
CONSTRAINT chk_precio
CHECK(Precio>0.0)
);

-- Insertar un producto en productos
INSERT INTO Productos (productoId, NombreProducto, Existencia, PrecioUnitario)
VALUES(1,'Burritos de frijoles',65, 20.99);
GO

SELECT *FROM Productos;
GO

--Insertar en la tabla productos2 con identity
INSERT INTO Productos2 (NombreProducto, Existencia, Precio)
VALUES('Burritos de chorizo verde',100, 21.0);
GO

INSERT INTO Productos2 (NombreProducto, Existencia, Precio)
VALUES('Burritos de chorizo grueso',450, 459.12);
GO

INSERT INTO Productos2 (NombreProducto, Existencia, Precio)
VALUES('Burritos de frijoles',999, 60);
GO

SELECT *FROM Productos2;
GO

