CREATE DATABASE ejercicio1999;

USE ejercicio1999;

CREATE TABLE empleado(
EmpleadoId int not null auto_increment,
Nombre nvarchar(15) not null,
Apellido1 nvarchar(15) not null,
Apellido2 nvarchar(15) ,
Direccion nvarchar(50) not null,
Salario decimal (10,2) not null,
Jef int, 
departamneto int not null,
CONSTRAINT pk_empleado
PRIMARY KEY (EmpleadoId),
CONSTRAINT chk_Salario
CHECK (Salario between 200 and 5000),
CONSTRAINT fk_empleado_empleado
FOREIGN KEY (jef)
REFERENCES empleado (EmpleadoId)
ON DELETE NO ACTION
ON UPDATE NO ACTION

);


CREATE TABLE Departamento(
Departamentoid int not null auto_increment,
NombreDepto nvarchar (15) not null,
estatus char(2) not null,
administrador int not null,
CONSTRAINT pk_departamento
PRIMARY KEY (Departamentoid),
CONSTRAINT unique_nombredepto
UNIQUE (NombreDepto),
CONSTRAINT chk_estatus
CHECK (estatus IN ('SI','NO')),
CONSTRAINT fk_empleado_depto
FOREIGN KEY (administrador)
REFERENCES empleado(EmpleadoId)



);


ALTER TABLE empleado
ADD CONSTRAINT fk_empleado_depto1
FOREIGN KEY (departamneto)
REFERENCES Departamento (Departamentoid);


CREATE TABLE Ubicacion(
Ubicacionid int not null auto_increment,
Ubicacion nvarchar(15) not null,
Deptoid int not null,
CONSTRAINT pk_ubicacion
UNIQUE (Deptoid),
CONSTRAINT fk_ubicacion_depto
FOREIGN KEY (Deptoid)
REFERENCES Departamento (Departamentoid)

);
