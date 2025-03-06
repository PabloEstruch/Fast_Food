USE Fast_Food;

--�Cu�l es el total de ventas (TotalCompra) a nivel global?

SELECT SUM(TotalCompra) AS TotalCompra
FROM Ordenes;

--�Cu�l es el precio promedio de los productos dentro de cada categor�a?

SELECT CategoriaID, AVG(Precio) AS Promedio_Precio
FROM Productos
GROUP BY CategoriaID;

--�Cu�l es el valor de la orden m�nima y m�xima por cada sucursal?

SELECT SucursalID, 
		MIN(TotalCompra) AS Compra_Minima,
		MAX(TotalCompra) AS Compra_Maxima
FROM Ordenes
GROUP BY SucursalID

--�Cu�l es el mayor n�mero de kil�metros recorridos para una entrega?

SELECT MAX(KilometrosRecorrer) AS KmMax
FROM Ordenes;

--�Cu�l es la cantidad promedio de productos por orden?

SELECT OrdenID,AVG(Cantidad) AS Cantidad
FROM DetalleOrdenes
GROUP BY OrdenID

--�C�mo se distribuye la Facturaci�n Total del Negocio de acuerdo a los m�todos de pago?

SELECT TipoPagoID, SUM(TotalCompra) AS Facturacion
FROM Ordenes
GROUP BY TipoPagoID

--�Cu�l Sucursal tiene el ingreso promedio m�s alto?

SELECT TOP 1
SucursalID, AVG(TotalCompra) AS VentaPromedio
FROM Ordenes
GROUP BY SucursalID
ORDER BY VentaPromedio DESC

--�Cu�les son las sucursales que han generado ventas totales por encima de $ 1000?

SELECT SucursalID, SUM(TotalCompra) AS TotalCompra
FROM Ordenes
GROUP BY SucursalID
HAVING SUM(TotalCompra) >=1000
ORDER BY TotalCompra

--�C�mo se comparan las ventas promedio antes y despu�s del 1 de julio de 2023?

SELECT DISTINCT
    (SELECT AVG(TotalCompra) AS VentasPromedio 
     FROM Ordenes 
     WHERE FechaOrdenTomada < '2023-07-01') AS 'Antes de Julio',
    (SELECT AVG(TotalCompra) AS VentasPromedio 
     FROM Ordenes 
     WHERE FechaOrdenTomada >= '2023-07-01') AS 'Despues de Julio'

/*�Durante qu� horario del d�a (ma�ana, tarde, noche) se registra la mayor cantidad de ventas,
cu�l es el ingreso promedio de estas ventas, y cu�l ha sido el importe m�ximo alcanzado por una orden en dicha jornada?*/

SELECT	HorarioVenta, 
		COUNT(OrdenID) AS NroVentas,
		MAX(TotalCompra) AS MaxIngresos,
		AVG(TotalCompra) AS PromedioIngresos
FROM Ordenes
GROUP BY HorarioVenta
ORDER BY NroVentas, MaxIngresos DESC;


