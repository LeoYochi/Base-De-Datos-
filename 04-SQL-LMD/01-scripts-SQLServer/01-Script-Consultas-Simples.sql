-- Lenguaje SQL-LMD
--CONSULTAS SIMPLES

Use NORTHWND;
GO

--Seleccionar todos los clientes
SELECT *
FROM Customers;

--Seleccionar todos los clientes pero solamente mostrando la clave, el nombre del cliente, la ciudad y el pais(Proyeccion)

SELECT CustomerID, CompanyName, City, Country
FROM Customers;

--Alias de columna
SELECT CustomerID AS NumeroCliente, CompanyName AS 'Nombre Cliente', City Ciudad, Country AS [Ciudad Gei]
FROM Customers;


--CAMPOS CALCULADOS
--SELECCIONAR LAS ORDENES DE COMPRA MOSTRANDO LOS PRODUCTOS, LA CANTIDAD VENDIDA
--PRECIO DE VENTA, DESCUENTO Y TOTAL


Select ProductID AS [Nombre Producto], UnitPrice AS [Precio],
	Quantity AS [Cantidad], Discount AS [Descuento],
	(UnitPrice * Quantity) AS [Importe Sin Descuento],
	(UnitPrice * Quantity * (1 - Discount)) AS [Importe]
FROM [Order Details];

--SELECCIONAR ORDENES DE COMPRA MOSTRANDO EL CLIENTE AL QUE SE LE VENDIO EL EMPLEADO
--QUE LA REALIZO, LA FECHA DE LA ORDEN, EL TRANSPORTISTA Y LA FECHA DE LA ORDEN DIVIDIRLA
-- EN A�O, MES, DIA, TRIMESTRE

SELECT OrderID AS [Numero de Orden],
	OrderDate AS [Fecha de Orden],
	CustomerID AS [Cliente],
	EmployeeID AS [Empleado],
	ShipVia AS [Transportista],
	DATEPART (YEAR, OrderDate) AS [A�o de la compra],
	DATEPART (mm, OrderDate) AS [Mes de la compra],
	DATEPART (d, OrderDate) AS [Dia de la compra],
	DATEPART (qq, OrderDate) AS [Trimestre],
	DATEPART (wk, OrderDate) AS [Semana],
	DATEPART (WEEKDAY, OrderDate) AS [Dia de la semana],
	DATENAME (WEEKDAY, ORDERDATE) AS [Nombre D�a]
FROM Orders
Order by 9;

--SELECCIONAR TODOS LOS PRODUCTOS QUE SU PRECIO SEA MAYOR A 40.3
--(mostrar el numero del producto, nombre del producto, y el precio unitario)

SELECT ProductID AS [Nombre de Producto],
	ProductName AS [Nombre Producto],
	UnitPrice AS [Precio]
FROM Products
WHERE UnitPrice > 40.3;

SELECT ProductID AS [Nombre de Producto],
	ProductName AS [Nombre Producto],
	UnitPrice AS [Precio]
FROM Products
WHERE UnitPrice >= 40.3;

SELECT ProductID AS [Nombre de Producto],
	ProductName AS [Nombre Producto],
	UnitPrice AS [Precio]
FROM Products
WHERE ProductName = 'Carnarvon Tigers';


SELECT ProductID AS [Nombre de Producto],
	ProductName AS [Nombre Producto],
	UnitPrice AS [Precio]
FROM Products
WHERE ProductName <> 'Carnarvon Tigers';


SELECT ProductID AS [Nombre de Producto],
	ProductName AS [Nombre Producto],
	UnitPrice AS [Precio]
FROM Products
WHERE ProductName != 'Carnarvon Tigers';

--SELECCIONAR TODAS LAS ORDENES QUE SEAN DE BRAZIL - RIO DE JANERIO
--MOSTRANDO SOLO EL NUMERO DE ORDEN, LA FECHA DE ORDEN, PAIS DE ENVIO
--CIUDAD Y TRANSPORTISTA

SELECT OrderID AS [Numero de Orden],
	OrderDate AS [Fecha de Orden],
	ShipCountry AS [Pais de Envio],
	ShipCity AS [Ciudad],
	ShipVia AS [Transportista]

FROM Orders
WHERE ShipCity = 'Rio de Janeiro' and ShipCountry='Brazil';


--Inner Join (interseccion)

SELECT o.OrderID AS [Numero de Orden],
	o.OrderDate AS [Fecha de Orden],
	o.ShipCountry AS [Pais de Envio],
	o.ShipCity AS [Ciudad],
	s.ShipperID AS [Num. Transportista],
	s.CompanyName AS [Transportista]
FROM Orders AS o
	INNER JOIN Shippers AS s
	ON s.ShipperID = o.ShipVia
WHERE ShipCity = 'Rio de Janeiro';

--SELECCIONAR TODAS LAS ORDENES MOSTRANDO LO MISMO QUE LA CONSULTA ANTERIOR
--PERO TODAS AQUELLAS QUE NO TENGAN REGION DE ENVIO



--SELECCIONAR TODAS LAS ORDENES ENVIADAS A BRAZIL, ALEMANIA Y MEXICO, QUE TENGAN REGION,
--ORDENAR DE FORMA DESCENDENTE POR EL SHIPCOUNTRY

SELECT o.OrderID AS [Numero de Orden],
	o.OrderDate AS [Fecha de Orden],
	o.ShipCountry AS [Pais de Envio],
	o.ShipCity AS [Ciudad],
	s.ShipperID AS [Num. Transportista],
	s.CompanyName AS [Transportista]
FROM Orders AS o
	INNER JOIN Shippers AS s
	ON s.ShipperID = o.ShipVia
WHERE (ShipCity = 'Mexico' or
	ShipCity = 'Germany' or
	ShipCity = 'Brazil' and
	ShipRegion is not  null
,
or Order by ShipRegion Desc;
FROM Orders
Order by 9;

--Order by -> Ordenar los datos de forma ascendente y descendente
--Seleccionar los empleador ordenados por su pais

SELECT(TitleOfCourtesy + ' ' + FirstName + ' ' + LastName) AS [Nombre Completo],
	Country AS [Pais], City AS [Ciudad]
FROM Employees;

--ASCENDETE
SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
	Country AS [Pais], City AS [Ciudad]
FROM Employees
Order by Country ASC;

--DESCENDENTE
SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
	Country AS [Pais], City AS [Ciudad]
FROM Employees
Order by Country DESC;

--POR POCISION DE CAMPO
SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
	Country AS [Pais],
	City AS [Ciudad]
FROM Employees
Order by 2 DESC;


SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
	Country AS [Pais],
	City AS [Ciudad]
FROM Employees
Order by CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName);


SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
	Country AS [Pais],
	City AS [Ciudad]
FROM Employees
Order by [Nombre Completo] DESC;


SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
	Country AS [Pais],
	City AS [Ciudad]
FROM Employees
Order by Country, City;


SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
	Country AS [Pais],
	City AS [Ciudad]
FROM Employees
Order by Country DESC, City;

SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
	Country AS [Pais],
	City AS [Ciudad]
FROM Employees
Order by Country DESC, City DESC;


SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
	Country AS [Pais],
	City AS [Ciudad]
FROM Employees
Order by Country ASC, City DESC;


SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
	Country AS [Pais],
	City AS [Ciudad]
FROM Employees
Order by Country ASC, City ASC;


SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
	Country AS [Pais],
	City AS [Ciudad]
FROM Employees
Order by 2 ASC, 3 ASC;


SELECT CONCAT(TitleOfCourtesy, ' ' , FirstName , ' ' , LastName) AS [Nombre Completo],
	Country AS [Pais],
	City AS [Ciudad]
FROM Employees
Order by 1 ASC, Country DESC, 3 DESC;

--Seleccionar todos los productos que su precio sea mayor a 40.3 (mostrar num del producto y nombre del producto)

USE BDEJEMPLO2;
GO


--SELECCIONAR CUANTOS PUESTOS DIFERENTES TIENEN LOS REPRESENTANTES
SELECT DISTINCT Puesto
FROM Representantes;


Use NORTHWND;
GO

--Seleccionar todos los paises diferentes de mis clientes
SELECT distinct Country, City
FROM Customers;

SELECT Country, City, CompanyName
FROM Customers
ORDER BY 1 ASC;


SELECT Country, City, CompanyName
FROM Customers
WHERE City = 'Buenos Aires';

SELECT DISTINCT CATEGORYID
FROM Products;



USE BDEJEMPLO2;
GO

--CUANTOS PUESTOS DIFERENTES TIENEN LOS RESPRESENTANTES
--FUNCIONES DE AGREGADO

SELECT COUNT(DISTINCT PUESTO) AS [Numero de Puestos]
From Representantes;


--Seleccionar el precio minimo de los productos
Select min(Precio) as [Precio Minimo]
From Productos;

SELECT *
FROM Productos
Order by precio asc;


--Listas las oficinas cuyas ventas estan por debajo del 80% de sus objetivos

SELECT*
FROM Oficinas;



SELECT Ciudad, Ventas, Objetivo, (0.8 * Objetivo) AS [80% del objetivo]
FROM Oficinas
WHERE ventas < (0.8 * Objetivo);


--SELECCIONAR LOS PRIMEROS 5 REGISTROS DE LOS PEDIDOS
SELECT TOP 5
	Num_Pedido, Fecha_Pedido, Producto, Cantidad, Importe
FROM Pedidos

-- 5 PEDIDOS CON EL IMPORTE M�S CARO
SELECT TOP 5
	Num_Pedido, Fecha_Pedido, Producto, Cantidad, Importe
FROM Pedidos
ORDER BY 5 DESC;


--TEST DE RANGO (BETWEEN)
--Hallar los pedidos del ultimo trimestre de 1989

SELECT Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
FROM Pedidos
WHERE Fecha_Pedido BETWEEN '1989-10-01' AND '1989-12-31'
Order by Fecha_Pedido DESC;


SELECT Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
FROM Pedidos
WHERE Fecha_Pedido >= '1989-10-01' AND Fecha_Pedido <='1989-12-31'
Order by Fecha_Pedido DESC;


SELECT Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
FROM Pedidos
WHERE datepart(quarter, Fecha_Pedido) = 4
Order by Fecha_Pedido DESC;


--Hallar los pedidos que tiene un importe entre 30000 y 39999.99
SELECT Num_Pedido, Fecha_Pedido, FAB, Producto, Importe
FROM Pedidos
WHERE Importe >= '30000' AND Importe <='39999.99'
Order by Importe;

SELECT Num_Pedido, Fecha_Pedido, FAB, Producto, Importe
FROM Pedidos
WHERE Importe >= 30000 AND Importe <= 39999.99;


--Listar los representantes cuyas ventas no se encuentran entre 80 y el 120 de su cuota
SELECT Num_Empl, Nombre, Puesto, Cuota, Ventas
FROM Representantes
Where Ventas not between (Cuota *.8) AND (Cuota * 1.2);



--TEST DE PERTENENCIA A CONJUNTOS(IN)
--HALLAR LOS PEDIDOS DE CUATRO REPRESENTANTES EN CONCRETO

SELECT Num_Pedido, Fecha_Pedido, Importe, Rep
FROM Pedidos
WHERE REP IN (107, 109, 101, 103);

SELECT Num_Pedido, Fecha_Pedido, Importe, Rep
FROM Pedidos
WHERE REP = 107 OR
	REP = 109 OR
	REP = 101 OR
	REP = 103;


SELECT Num_Pedido, Fecha_Pedido, Importe, Rep
FROM Pedidos
WHERE NOT (REP = 107 OR
	REP = 109 OR
	REP = 101 OR
	REP = 103);


--TEST DE ENCAJE DE PATRONES (LIKE)

SELECT *
FROM Clientes
WHERE Empresa LIKE '%Ac%';

SELECT *
FROM Clientes
WHERE Empresa LIKE '%er%';



USE BDEJEMPLO2;
GO


SELECT *
FROM Clientes
WHERE Empresa LIKE '[A-D]%';


SELECT *
FROM Clientes
WHERE Empresa LIKE '[ADF]%';

SELECT *
FROM Clientes
WHERE Empresa LIKE '_ILAS';

SELECT *
FROM Clientes
WHERE Empresa LIKE '_____';


SELECT *
FROM Clientes
WHERE Empresa LIKE '[^ADF]%';

--Hallar a todos los representantes que o bien: 
--a)trabajan en Daimiel, Navarra, Castell�n
--b) no tienen jefe y estan contratados desde Junio de 1988
--c)superan su cuota pero tienen ventas de 600000 o menos


SELECT Ciudad
FROM Oficinas
WHERE Ciudad= 'Daimiel, Navarra, Castellon';

SELECT *
FROM Representantes
WHERE Oficina_Rep IN ('Daimiel', 'Navarra', 'Castellon')
	OR
	(Jefe IS NULL AND Fecha_Contrato >= '1988-06-01')
	OR
	(Ventas > Cuota AND Ventas <= 600000);


Select Nombre, Fecha_Contrato, Puesto
FROM Representantes
WHERE (Oficina_Rep in (11,12,22)) OR
	(Jefe is null and Fecha_Contrato>='1988-06-01') OR
	(Ventas>Cuota AND NOT Ventas <= 600000);


SELECT R.Nombre AS [Nombre Empleado],
	R.Num_Empl AS [Num Empleado],
	R.Fecha_Contrato AS [Fecha de Contratacion],
	R.Cuota AS [Cuotas de Ventas],
	R.Ventas AS [Ventas Totales],
	O.Ciudad AS [Ciudad de Oficina],
	R.Jefe AS [Numero de Jefe]
FROM Representantes AS R
	INNER JOIN Oficinas AS O
	ON O.Oficina = R.Oficina_Rep
WHERE (O.Ciudad IN ('Daimiel','Navarra','Castellon')) OR
	(R.Jefe IS NULL AND R.Fecha_Contrato >='1988-07-01') OR
	(R.Ventas>Cuota AND R.Ventas<=600000);




--Listar todos los pedidos mostrando el numero de pedido 
--su importe y el nombre y limite de credito del cliente

SELECT p.Num_Pedido, p.Importe, c.Empresa, c.Limite_Credito
FROM Pedidos AS p
	INNER JOIN Clientes AS c
	on c.Num_Cli =p.Cliente


--Listar las oficinas con un objetivo superior a 600,000
--mostrando el nombre de la ciudad, nombre del representante,
--y su puesto

SELECT o.Ciudad AS [Oficina],
	r.Nombre AS [Representante],
	r.Puesto AS [Puesto], o.Objetivo AS [Objetivo de Ventas]

FROM Oficinas As O
	INNER JOIN Representantes As r
	ON o.Jef = r.Num_Empl
WHERE o.Objetivo > 600000;


--Listar todos los pedidos, mostrando el numero de pedido,
--el importe , el nombre y limite de credito del cliente 

SELECT pe.Num_Pedido AS [Numero Pedido],
	pe.Importe AS [Importe],
	c.Empresa AS [Cliente],
	c.Limite_Credito AS [Limite_Credito]

FROM Pedidos AS pe
	INNER JOIN Clientes AS c
	ON pe.Cliente = c.Num_Cli;

--Listar cada representante mostrando su nombre, la ciudad
--y la region en la que trabajan 

SELECT re.Nombre AS [Representante],
	o.Ciudad AS [Oficina],
	o.Region AS [Region]

FROM Representantes AS re
	INNER JOIN Oficinas AS o
	ON re.Oficina_Rep = o.Oficina;

--Listar las oficinas (ciudad), nombres y puestos de sus jefes 

SELECT o.Ciudad AS [Oficina],
	r.Nombre AS[Nombre],
	o.Region AS [Region]
FROM Oficinas AS o
	INNER JOIN Representantes AS r
	ON r.Num_Empl=o.Jef



--Listar los pedidos, mostrando el numero de pedido, el importe y 
--la cantidad de cada producto 

SELECT pe. Num_Pedido AS [Numero de pedido],
	pe.importe AS [Importe],
	pr.Descripcion AS [Descripcion],
	pr.Stock AS [Cantidad]


FROM Pedidos AS pe
	INNER JOIN Productos AS pr
	ON pr.Id_fab = pe.Fab
		and pr.Id_producto = pe.Producto;

--Listar nombres de los empleados  y los nombres de sus jefes 

SELECT empl.Nombre AS[Empleado],
	jefs.Nombre AS [Jefe]
FROM Representantes AS jefs
	INNER JOIN Representantes AS empl
	ON jefs.Num_Empl = empl.Jefe

select *
from Representantes

--Listar los pedidos con un importe superior a 25000, incluyendo el 
--numero de pedido, el importe, el nombre del representante que 
--tomo nota del pedido y el nombre del cliente 



Select p.Num_Pedido as [numero pedido],
	p.Importe AS [Importe],
	r.Nombre as [Nombre],
	c.Empresa as [Empresa]
FROM Pedidos as p
	inner join Representantes as r
	On r.Num_Empl = p.Rep
	inner join Clientes as c
	ON c.Num_Cli = p.Cliente
WHERE p.Importe > 25000;

--Listar los pedidos superiores a 25000,
-- mostrando el numero de pedido, el nombre del cliente que
--lo encargo y el nombre del representante asignado al cliente y el importe

SELECT
	ped.Num_Pedido AS [Número de Pedido],
	rep.Nombre AS [Representante],
	ped.Importe AS [Importe],
	c.Empresa AS [Empresa]

FROM
	Pedidos AS ped
	INNER JOIN
	Clientes AS c ON ped.Cliente = c.Num_Cli
	INNER JOIN
	Representantes AS rep ON c.Rep_Cli = rep.Num_Empl
WHERE 
    ped.Importe > 25000