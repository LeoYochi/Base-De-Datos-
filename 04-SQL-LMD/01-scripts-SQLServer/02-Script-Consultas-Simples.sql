--Lenguaje SQL-LMD


--Consultas Simples
USE NORTHWND;
go

--Seleccionar todos los clientes
SELECT *
FROM Customers;
go
--Seleccionar todos los clientes pero solamente mostrando 
--la clave, nombre del cliente, la ciudad y el pais

SELECT CustomerID, CompanyName, City, Country
FROM Customers;
go

--Alias de columna
SELECT CustomerID AS NumeroCliente, CompanyName AS NombreCliente ,
	City Ciudad, Country AS CiudadChida
FROM Customers;
go

--Campos calculados

--Seleccionar las ordenes de compra mostrando los productos
--La cantidad vendida, el descuento y el total
SELECT ProductID AS [Nombre Producto], UnitPrice AS [Precio ],
	Quantity AS [Cantidad], Discount AS[Descuento],
	(UnitPrice * Quantity ) AS [Importe sin descuento],
	(UnitPrice * Quantity * (1 - Discount)) AS [Importe]
FROM [Order Details];
go

--Seleccionar las ordenes de compra mostrando  el cliente al que se le vendio
--el empleado que la realizo, la fecha de la orden , el transportista,
-- y la fecha de la order hay que dividirla en a�o,mes,dia,trimestre

SELECT OrderID AS [Numero de orden], OrderDate AS [FEcha de orden], CustomerID AS [Cliente],
	EmployeeID AS [Empleado], ShipVia AS [Transportista],
	datepart(year,OrderDate) AS [A�o de la compra],
	datepart(mm,OrderDate) AS [Mes de la Compra],
	datepart(d ,OrderDate) AS [Dia de la compra],
	datepart(qq, OrderDate) As [Trimestre],
	datepart(week,OrderDate) AS [Semana],
	datepart(weekday, OrderDate) AS [Dia de la semana] ,
	DATENAME( weekday, OrderDate) AS [Nombre dia]
FROM Orders
order by 9 asc;

-- ordenar by-> Ordenar los daots de forma ascendente y descentente
--Seleccionar todos los empleados ordenados por su pais
SELECT (TitleOfCourtesy + ''+ FirstName + '' + LastName) AS[NOmbre COmpleto],
	country	AS [Pais], City AS [Ciudad]

FROM Employees

SELECT CONCAT(TitleOfCourtesy , '', FirstName , '' , LastName) AS[NOmbre COmpleto],
	country	AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY 2 DESC;

SELECT CONCAT(TitleOfCourtesy , '', FirstName , '' , LastName) AS[NOmbre COmpleto],
	country	AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY Country, City
;

SELECT CONCAT(TitleOfCourtesy , '', FirstName , '' , LastName) AS[NOmbre COmpleto],
	country	AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY Country DESC, City
;

SELECT CONCAT(TitleOfCourtesy , '', FirstName , '' , LastName) AS[NOmbre COmpleto],
	country	AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY Country DESC, City DESC;

SELECT CONCAT(TitleOfCourtesy , '', FirstName , '' , LastName) AS[NOmbre COmpleto],
	country	AS [Pais], City AS [Ciudad]
FROM Employees
ORDER BY 1 ASC, Country desc, 3 DESC;

--Seleccionar todos los productos que su precio 
--Sea mayor a 40.3(mostrar el numero del producto, el nombre del producto
--Y el precio unitario)

SELECT ProductID AS [Numero de producto],
	ProductName AS [Nombre Producto],
	UnitPrice AS [Precio]
FROM Products
where UnitPrice >4.3;

SELECT ProductID AS [Numero de producto],
	ProductName AS [Nombre Producto],
	UnitPrice AS [Precio]
FROM Products
where UnitPrice >=4.3;

SELECT ProductID AS [Numero de producto],
	ProductName AS [Nombre Producto],
	UnitPrice AS [Precio]
FROM Products
where ProductName ='Carnarvon Tigers';

SELECT ProductID AS [Numero de producto],
	ProductName AS [Nombre Producto],
	UnitPrice AS [Precio]
FROM Products
where ProductName <>'Carnarvon Tigers';


SELECT ProductID AS [Numero de producto],
	ProductName AS [Nombre Producto],
	UnitPrice AS [Precio]
FROM Products
where ProductName !='Carnarvon Tigers';

--Seleccionar todas las ordenes que sean de brasil rio de janeiro
--mostrando solo el numero de orden, fcha de orden , pais de envio
--ciudad y su transportista

SELECT OrderID AS [Numero de pedido],
	OrderDate AS[Fecha del pedido],
	ShipCountry AS [PAis de envio ],
	ShipCity As [ Ciudad de envio],
	ShipVia as [ transportista]
FROM Orders
where ShipCountry = 'Brazil' and ShipCity ='Rio de Janeiro';

-- inner join

SELECT o.OrderID AS [Numero de pedido],
	o.OrderDate AS[Fecha del pedido],
	o.ShipCountry AS [PAis de envio ],
	o.ShipCity As [ Ciudad de envio],
	s.ShipperID as [ Nr.transportista] ,
	s.CompanyName as [Transpostista]
FROM Orders AS o
	INNER JOIN Shippers AS s
	ON s.ShipperID = o.ShipVia
where ShipCountry = 'Brazil' and ShipCity ='Rio de Janeiro';


--Seleccionar todas las ordenes 
--mostrando lo mismo que la consulta anterior 
--pero todas aquellas que no tengan region de envio


SELECT OrderID AS [Numero de pedido],
	OrderDate AS[Fecha del pedido],
	ShipCountry AS [PAis de envio ],
	ShipCity As [ Ciudad de envio],
	ShipVia as [ transportista]
FROM Orders
where ShipRegion is null;

--Seleccionar todas las ordenes enviadas a brasil 
--alemania y que tengan region ordenar de forma descendente 
--por el shipcountry
SELECT OrderID AS [Numero de pedido],
	OrderDate AS[Fecha del pedido],
	ShipCountry AS [PAis de envio ],
	ShipCity As [ Ciudad de envio],
	ShipVia as [ transportista]
FROM Orders
where (ShipCountry='Mexico' or
	ShipCountry='Brazil' or
	ShipCountry='Germany') and
	ShipRegion is not null;
go

Use BDEJEMPLO2
go

--Seleccionar cuantos puestos difetentes tienen
--los representantes
Select DISTINCt Puesto

from Representantes
;
go

--Seleccionar todos los paises diferentes de mis clientes
Select Distinct country, City
FROM customers;

Select country, City, companyname
FROM customers
ORDER BY 1 ASC;

Select country, City, companyname
FROM customers
where city = 'Buenos Aires';

SELECt DISTINCT CategoryId, Supplierid
FROM products;

--CUANtos puestos diferentes tienen los representantes
-- Funciones de agregado
SElect COUNT (Distinct Puesto) AS [Numero de Puestos]
From Representantes;

--Seleccionar el precio minimo de los productos
Select *

FROm Productos
ORDER  BY precio asc;

Select MIn(precio) AS [Precio minimo]

FROm products
;
go

--Listar las oficinas cuyas ventas estan por debajo del 80% de sus objetivos
SELECT CIUDAD, VENTAS, Objetivo AS [80% de objetivo]
from Oficinas
where ventas<(.8 * objetivo);

--Seleccionar los primeros 5 registros 
Select TOP 5
	Num_Pedido, Fecha_Pedido, Producto, Cantidad, Importe
From Pedidos;

--Test de rango(Between)
--Hallar los pedidos del ultimo trimestre  de 1989
Select Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
from Pedidos
Where Fecha_Pedido BetWeen '1989-10-01 ' and '1989-12-31'
ORDER BY Fecha_Pedido desc;

Select Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
from Pedidos
Where Fecha_Pedido >= '1989-10-01 ' and Fecha_Pedido <=' 1989-12-31'
ORDER BY Fecha_Pedido desc;


Select Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
from Pedidos
Where datepart(QUARTER, Fecha_Pedido)=4
ORDER BY Fecha_Pedido desc;

--Hallar los pedidos entre 30000 y 
-- 39999
Select Num_Pedido, Fecha_Pedido, Fab, Producto, Importe
from Pedidos
Where Importe >= '30000 ' and Importe <=' 39999 '
ORDER BY Importe desc;

--listar los representantes cuyas ventas no se encuentran
--entre 80 y 120 por ciento de su cuotA
SELECT Nombre, Ventas, Puesto, Cuota
from Representantes
where Ventas not between (cuota*.8) and (Cuota*1.2);

SELECT Nombre, Ventas, Puesto, Cuota
from Representantes
where not(Ventas >= (cuota*.8) and Ventas<=(Cuota*1.2));

--test de pertenencia a cojuntos (IN)
--hallar los pedidosde cuatro representantes en concreto
SELECT Num_Pedido, Fecha_Pedido, Importe, Rep
FROm Pedidos
where Rep in (107,109,101,103);

SELECT Num_Pedido, Fecha_Pedido, Importe, Rep
FROm Pedidos
where Rep = 107 or
	Rep=109 or
	Rep=101 or
	Rep=103;

SELECT Num_Pedido, Fecha_Pedido, Importe, Rep
FROm Pedidos
where Rep not in (107,109,101,103);

SELECT Num_Pedido, Fecha_Pedido, Importe, Rep
FROm Pedidos
where not(Rep = 107 or
	Rep=109 or
	Rep=101 or
	Rep=103);

--Test de encaje de patrones (LIKEe)
SELECT *
FROM Clientes
where Empresa like 'Ac%';

SELECT *
FROM Clientes
where Empresa like '%L';

SELECT *
FROM Clientes
where Empresa like 'er%';
go

Select *
FROM Clientes
where Empresa LIKE '[A-D]%'

Select *
FROM Clientes
where Empresa LIKE '[ADf]%'

Select *
FROM Clientes
where Empresa LIKE '_ilas'

Select *
FROM Clientes
where Empresa LIKE '____'
--muestrame los registros donde la empresa no comience con A o D o F 
Select *
FROM Clientes
where Empresa LIKE '[^ADf]%'

--Hallar todos los representantes que o bien: 
--a)Trabajan en daimiel, Navara, o Castellon; o Bien 
--b)no tienen jefe y estan contratados desde junio de 1988; o
--c)superan su cuota pero tienen ventas de 600000 o menos

SELECT *
From Representantes
WHERE ((Oficina_Rep in (11, 22, 12)) or (Jefe is null)) and ((Fecha_Contrato >= '1988-06-01 ') or (Ventas>Cuota AND Ventas <= 600000))

SELECT *
From Representantes
where (Oficina_Rep in (11, 22, 12)) OR
	(Jefe is null And Fecha_Contrato>= '1988-06-01 ') OR
	(Ventas>Cuota AND Ventas<=600000)


Select *
From Oficinas
