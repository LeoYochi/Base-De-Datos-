--Consultas avanzadas


--Listar todos los pedidos mostrando el numero de pedido 
--su importe y el nombre y limkte de credito del cliente
SELECT p.Num_Pedido, p.Importe, c.Empresa, c.Limite_Credito
FROM Pedidos AS p
	INNER JOIN Clientes AS c
	on c.Num_Cli =p.Cliente

--Listar las oficinas con un objetivo superior a 600000,
--mostrando el nombre de la ciudad, el nombre del representante
--Y su puesto

Select o.Ciudad AS [Oficina],
	r.Nombre AS [Representante],
	r.Puesto AS [Puesto],
	o.Objetivo As [Objetivo de ventas]
FROM Oficinas AS o
	inner JOIN Representantes AS r
	On o.Jef=r.Num_Empl
WHERE o.Objetivo > 600000;

--Listar todos los pedidos, mostrando el numero de pedido, el
--importe, el nombre y limite de credito del cliente
SElect pe.Num_Pedido as [Numero pedido],
	pe.Importe AS [Importe],
	c.Empresa AS [CLiente],
	c.Limite_Credito AS [Limite de credito]

FROM Pedidos AS pe
	INNER JOIN Clientes AS c
	ON pe.Cliente = c.Num_Cli;

SElect *

FROM Pedidos AS pe
	INNER JOIN Clientes AS c
	ON pe.Cliente = c.Num_Cli;

--Listar cada representante mostrando su nombre, la ciudad
-- y la region en que trabajan
SELECT r.Nombre AS [Nombre del empleado],
	o.Ciudad AS [Ciudad de residencia],
	o.Region AS [Region]
FROM Representantes AS r
	INNER JOIN Oficinas AS o
	ON r.Oficina_Rep= o.Oficina

--Listar las oficinas(ciudad), nombres y puestos de sus jefes
SELECT o.Ciudad AS [Oficina],
	r.Nombre AS[Nombre],
	o.Region AS [Region]
FROM Oficinas AS o
	INNER JOIN Representantes AS r
	ON r.Num_Empl=o.Jef
--Listar todos los pedidos, mostrando el numero de pedido, el importe
--y la cantidad de cada producto

SELECT pe.Num_Pedido AS [Numero pedido],
	pe.Importe AS [Importe de compra],
	pro.Descripcion AS [Descripcion],
	pro.Stock AS [CAntidad]
FROM Pedidos AS pe
	INNER JOIN Productos AS pro
	ON pro.Id_fab =pe.Fab
		AND pro.Id_producto= pe.Producto;
--Listar los nombres de los empleados y los nombres de sus jefes
Select empl.Nombre aS [nombre],
	jefs.Nombre AS [jefe]
FROM Representantes as jefs
	INNER JOIN Representantes as empl
	ON jefs.Num_Empl = empl.Jefe
-- Listar los pedidos con un importe superior a 25000 incluyendo el nombre del
--pedido, el importe, el nombre del representante que tomo nota del pedido
--y nombre del cliente
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
	go
--Listar los pedidos superiores a 25000,
-- mostrando el numero de pedido, el nombre del cliente que
--lo encargo y el nombre del representante asignado al cliente y el importe
Select p.Num_Pedido as [Numero de pedido],
	c.Empresa AS [CLiente],
	r.Nombre AS [Representante cliente],
	p.Importe
FROM Representantes AS r
	inner join Clientes AS c
	ON r.Num_Empl = c.Rep_Cli
	INNER JOIN Pedidos as p
	On c.Num_Cli = p.Cliente
WHERE Importe>25000;
	GO
USE bdG1Joins;
Select *
from Categoria

select *
from Producto
	go

--Inner join
Select *
from Categoria AS c
	INNER JOIN Producto AS p
	ON c.Categoriaid = p.categoria
/*
	LEFT JOIN o LEFT OUTER JOIN
	La primera tabla te aparece en el from es la tabla izquierda
	*/
Select *
from Categoria AS c
	LEFT OUTER JOIN Producto AS p
	ON c.Categoriaid = p.categoria

--Mostrar todas las categorias	que no tengan productos asignados
Select c.Categoriaid, c.Nombre
from Categoria AS c
	LEFT OUTER JOIN Producto AS p
	ON  c.Categoriaid = p.categoria
Where p.Categoria is null
/*
	RIGHT JOIN o RIGHT OUTER JOIN
	Toma todos los datos de la tabla derecha y los que coiciden
	con la tabla izquierda y los que no coinciden los pone null
		*/
Select *
from Categoria AS c
	RIGHT JOIN Producto AS p
	ON  c.Categoriaid = p.categoria

--Selecciona todos los productos que no tienen categoria
Select p.Nombre AS [Nombre del producto],
	p.Precio
from Categoria AS c
	RIGHT JOIN Producto AS p
	ON  c.Categoriaid = p.categoria
where Categoria is null
/*
	FULL JOIN
	obtiene los datos de la tabla izquierda los datos de la tabla derecha 
	y todos las concidencias entre las dos
	*/
Select *
from Categoria AS c
	FULL JOIN Producto AS p
	ON  c.Categoriaid = p.categoria

Select *
from Categoria AS c
	Cross  JOIN Producto AS p

Select *
from Categoria AS c,
	Producto AS p;

Select *
from Categoria AS c,
	Producto AS p
where c.Categoriaid = p.categoria
/*
	Agregacion

	count(*),  -cuentas las filas
	count(campo),	-cuenta las filas pero no cuenta los null
	min(),			-obtiene el valor minimo de un campo
	max(),			-obtiene el valor maximo de un campo
	avg(),			-obtiene la media aritmetica o el promedio
	sum(),			-obtiene el total o la sumatoria

	*/
use NORTHWND;

--cuanto clientes hay
select count(*) AS [NUmero de clientes]
From Customers;
	go

--cuentos ventas sean realizadp
select count(*) AS [Numero de ordenes]
from Orders;

--Cuantas ventas se realizaron en 1996
select count(*)
from Orders
where DATEPART(year, OrderDate)=1996;

--Seleccionar la venta de la fecha mas antigua que se 
Select MIn(OrderDate) as [Primera venta]
from Orders

--Seleccionar el total que se ha vendido
Select SUM(UnitPrice * Quantity) as [Total de ventas]
from [Order Details]

--Seleccionar el total de ventas entre 1996 y 1997
Select SUM(UnitPrice * Quantity) as [Total de ventas]
from [Order Details] as od
	INNER JOIN Orders as o
	ON o.OrderID = od.OrderID
where DATEPART(yy, o.OrderDate ) between 1996 and 1997
	and o.CustomerID = 'AROUT';

--Seleccionar las ventas totales hechas a cada uno de los clientes
Select c.CompanyName as [Cliente],
	SUM(UnitPrice * Quantity) as [Total de ventas]
from [Order Details] as od
	INNER JOIN Orders as o
	ON o.OrderID = od.OrderID
	inner join Customers as c
	ON c.CustomerID = o.CustomerID
where DATEPART(yy, o.OrderDate ) between 1996 and 1997
group BY c.CompanyName
	
