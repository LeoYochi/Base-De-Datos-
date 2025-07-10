-- CREAR BASE DE DATOS

CREATE DATABASE EmpresaPatito;
GO 

USE EmpresaPatito;
GO

--crear tabla empleado
CREATE TABLE Empleado(
EmpleadoId int not null,
Nombre varchar(20) not null,
Puesto varchar(20),
FechaIngreso date,
Salario decimal(10,2),
CONSTRAINT pk_Empleados
PRIMARY KEY(EmpleadoId)

);
GO

--AGREGAR COLUMNA EN LA TABLA EMPLEADO
ALTER TABLE Empleado
ADD CorreoElectronico varchar(50);
GO

SELECT * FROM Empleado;

--MODIFICAR EL TIPO DE DATO DE UN CAMPO

ALTER TABLE Empleado
ALTER COLUMN Salario money not null;

--RENOMBRAR UN CAMPO 
EXEC sp_rename 'Empleado.CorreoElectronico', 'Email', 'COLUMN';
GO

-- Crear tabla Departamentos

CREATE TABLE Departamentos(
IdDepartamento int not null identity(1,1),
NombreDpt nvarchar(30),
CONSTRAINT pk_IdDepartamento
PRIMARY KEY(IdDepartamento)
);
GO

--agregar un campo a la tabla Empleados
--para que sea una foreign key
ALTER TABLE Empleado
ADD IdDepartamento int not null;

--agregar fk
ALTER TABLE Empleado 
ADD CONSTRAINT fk_Empleado_Departamentos
FOREIGN KEY(IdDepartamento) REFERENCES Departamentos(IdDepartamento);
GO

--Eliminar una PK, la PK de Empleado

ALTER TABLE Empleado 
DROP CONSTRAINT  pk_Empleados;
GO

-- Eliminar la FK de la tabla de empleado

ALTER TABLE Empleado
DROP CONSTRAINT fk_Empleado_Departamentos;
GO

ALTER TABLE Departamentos
DROP CONSTRAINT pk_IdDepartamento;
GO

--CREAR UN CONSTRAINT DE VERIFICACION EN SALARIO

ALTER TABLE Empleado 
ADD CONSTRAINT chk_Salario 
CHECK (Salario > 0.0);
GO

CREATE TABLE Categorias (
Id int not null primary key DEFAULT -1,
Nombre varchar(20),
Estatus char(1) DEFAULT 'a'
);
GO

INSERT INTO Categorias
Values(1, 'Carnes', 'D');

INSERT INTO Categorias
Values(Default, 'Carnes', Default);


SELECT * FROM  Categorias;

--eliminar tabla categoria

DROP TABLE Categorias;
go

--eliminar la columna EMAIL de Empleado 

ALTER TABLE Empleado 
DROP COLUMN EMAIL;

ALTER TABLE Empleado 
ADD CONSTRAINT pk_Empleado
PRIMARY KEY(EmpleadoId);
GO

ALTER TABLE Departamentos
ADD CONSTRAINT pk_Departamentos
PRIMARY KEY(IdDepartamento);
GO

--Eliminar tabla Empleado

DROP TABLE Empleado;
GO

DROP TABLE Departamentos;
GO

DROP TABLE Categorias; 
GO

USE master;

--Eliminar la BD

DROP DATABASE EmpresaPatito;
GO