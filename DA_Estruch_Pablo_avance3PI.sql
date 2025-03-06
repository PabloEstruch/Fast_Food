USE Fast_Food;

--¿Cuál es el total de ventas (TotalCompra) a nivel global?

SELECT SUM(TotalCompra) AS TotalCompra
FROM Ordenes;

--¿Cuál es el precio promedio de los productos dentro de cada categoría?

SELECT CategoriaID, AVG(Precio) AS Promedio_Precio
FROM Productos
GROUP BY CategoriaID;

--¿Cuál es el valor de la orden mínima y máxima por cada sucursal?

SELECT SucursalID, 
		MIN(TotalCompra) AS Compra_Minima,
		MAX(TotalCompra) AS Compra_Maxima
FROM Ordenes
GROUP BY SucursalID

--¿Cuál es el mayor número de kilómetros recorridos para una entrega?

SELECT MAX(KilometrosRecorrer) AS KmMax
FROM Ordenes;

--¿Cuál es la cantidad promedio de productos por orden?

SELECT OrdenID,AVG(Cantidad) AS Cantidad
FROM DetalleOrdenes
GROUP BY OrdenID

--¿Cómo se distribuye la Facturación Total del Negocio de acuerdo a los métodos de pago?

SELECT TipoPagoID, SUM(TotalCompra) AS Facturacion
FROM Ordenes
GROUP BY TipoPagoID

--¿Cuál Sucursal tiene el ingreso promedio más alto?

SELECT TOP 1
SucursalID, AVG(TotalCompra) AS VentaPromedio
FROM Ordenes
GROUP BY SucursalID
ORDER BY VentaPromedio DESC

--¿Cuáles son las sucursales que han generado ventas totales por encima de $ 1000?

SELECT SucursalID, SUM(TotalCompra) AS TotalCompra
FROM Ordenes
GROUP BY SucursalID
HAVING SUM(TotalCompra) >=1000
ORDER BY TotalCompra

--¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023?

SELECT DISTINCT
    (SELECT AVG(TotalCompra) AS VentasPromedio 
     FROM Ordenes 
     WHERE FechaOrdenTomada < '2023-07-01') AS 'Antes de Julio',
    (SELECT AVG(TotalCompra) AS VentasPromedio 
     FROM Ordenes 
     WHERE FechaOrdenTomada >= '2023-07-01') AS 'Despues de Julio'

/*¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor cantidad de ventas,
cuál es el ingreso promedio de estas ventas, y cuál ha sido el importe máximo alcanzado por una orden en dicha jornada?*/

SELECT	HorarioVenta, 
		COUNT(OrdenID) AS NroVentas,
		MAX(TotalCompra) AS MaxIngresos,
		AVG(TotalCompra) AS PromedioIngresos
FROM Ordenes
GROUP BY HorarioVenta
ORDER BY NroVentas, MaxIngresos DESC;


