USE Fast_Food;

/*Eficiencia de los mensajeros: �Cu�l es el tiempo promedio desde el despacho hasta la entrega 
de los pedidos gestionados por todo el equipo de mensajer�a? */

SELECT AVG(DATEDIFF(MINUTE, FechaDespacho, FechaEntrega)) AS PromedioTiempoEntrega
FROM Ordenes
WHERE FechaDespacho IS NOT NULL AND FechaEntrega IS NOT NULL;


--An�lisis de Ventas por Origen de Orden: �Qu� canal de ventas genera m�s ingresos?

SELECT TOP 1 OrigenesOrden.Descripcion AS CanalDeVentas,
              SUM(Ordenes.TotalCompra) AS IngresosGenerados
FROM Ordenes
JOIN OrigenesOrden ON Ordenes.OrigenID = OrigenesOrden.OrigenID
GROUP BY OrigenesOrden.Descripcion
ORDER BY IngresosGenerados DESC;

--Productividad de los Empleados: �Cu�l es el nivel de ingreso generado por Empleado?

SELECT Empleados.Nombre AS Empleado,
              SUM(Ordenes.TotalCompra) AS IngresoGenerado
FROM Ordenes
JOIN Empleados ON Ordenes.EmpleadoID = Empleados.EmpleadoID
GROUP BY Empleados.Nombre
ORDER BY IngresoGenerado DESC;

--An�lisis de Demanda por Horario y D�a: �C�mo var�a la demanda de productos a lo largo del d�a?

SELECT T1.HorarioVenta AS Horario,
       SUM(T2.Cantidad) AS Cantidad
FROM Ordenes AS T1
LEFT JOIN DetalleOrdenes AS T2 ON T1.OrdenID = T2.OrdenID
GROUP BY T1.HorarioVenta;

--Comparaci�n de Ventas Mensuales: �Cu�l es la tendencia de los ingresos generados en cada periodo mensual?

SELECT DATENAME(MONTH, FechaOrdenTomada) AS Mes,
       SUM(TotalCompra) AS Ingresos
FROM Ordenes
GROUP BY DATENAME(MONTH, FechaOrdenTomada)
ORDER BY Mes;

--�Qu� porcentaje de clientes son recurrentes versus nuevos clientes cada mes?

SELECT ClienteID, COUNT(OrdenID) AS CantidadOrdenes
FROM Ordenes
GROUP BY ClienteID;
