-- crear base de datos empresa patito
CREATE DATABASE empresapatito;


#Usar la base de datos
use empresapatito;


#crear una tabla empleados
CREATE TABLE empleados(
    Idempleado int not null,
    Nombre varchar(100) not null,
    puesto varchar(50) null,
    fechadeIngreso DATE null,
    salario DECIMAL(10,2) not null,
    CONSTRAINT pk_empleados
    PRIMARY KEY (Idempleado)
);


#Agregar una columna en la tabla empleados
ALTER TABLE empleados
ADD COLUMN CorreoElectronico VARCHAR(100);


SELECT * FROM empleados;

#-modificar el tipo de dato de un campo
ALTER TABLE empleados
MODIFY COLUMN salario DECIMAL(12,2) not null;


#Renombrar un campo
ALTER TABLE empleados
RENAME COLUMN CorreoElectronico to Email;

#Crear tabla departamentos
CREATE TABLE departamentos (
IdDepartamento int not null auto_increment primary key,
NombreDepto varchar(100)

);


#Agregar un campo a la tabla empleados
#Para que sea una foreing key
ALTER TABLE  empleados
ADD IdDepartamento int not null;


#Agregar llave foranea
ALTER TABLE empleados 
ADD CONSTRAINT fk_Empleados_departamento
FOREIGN KEY (IdDepartamento)
REFERENCES departamentos(IdDepartamento);


#Eliminar la clave primaria de Empleados
ALTER TABLE empleados
DROP PRIMARY KEY;


#Eliminar la FK de la tabla Empleados
ALTER TABLE empleados
DROP FOREIGN KEY
fk_Empleados_departamento;


#Eliminar el auto _INCREMENT
ALTER TABLE departamentos
MODIFY COLUMN IdDepartamento INT NOT NULL;

#Eliminar la PK de departamentos
ALTER TABLE departamentos
DROP PRIMARY KEY ;

#Crear un constraint de verificacion en salario
ALTER TABLE empleados
ADD CONSTRAINT chk_salario
CHECK (salario > 0.0);


CREATE TABLE Categoria (
id int NOT NULL primary key DEFAULT -1,
Nombre varchar(20),
estatus char(1) DEFAULT 'A'
);


INSERT INTO Categoria 
    VALUES (1, 'Carnes','D');

    INSERT INTO Categoria 
    VALUES (DEFAULT, 'Carnes',Default);

    SELECT * FROM Categoria;

   
    
-- Eliminar la columna Email
ALTER TABLE empleados 
DROP COLUMN Email;

ALTER TABLE empleados
ADD CONSTRAINT pk_empleados
PRIMARY KEY (Idempleado);


ALTER TABLE departamentos
ADD CONSTRAINT pk_departamentos
PRIMARY KEY (IdDepartamento);


-- Eliminar las tablas
DROP TABLE Empleados;


DROP TABLE departamentos;


DROP TABLE Categoria;


#Eliminar la base de datos


DROP DATABASE empresapatito;
