USE Fast_Food;

/*Eficiencia de los mensajeros: ¿Cuál es el tiempo promedio desde el despacho hasta la entrega 
de los pedidos gestionados por todo el equipo de mensajería? */

SELECT AVG(DATEDIFF(MINUTE, FechaDespacho, FechaEntrega)) AS PromedioTiempoEntrega
FROM Ordenes
WHERE FechaDespacho IS NOT NULL AND FechaEntrega IS NOT NULL;


--Análisis de Ventas por Origen de Orden: ¿Qué canal de ventas genera más ingresos?

SELECT TOP 1 OrigenesOrden.Descripcion AS CanalDeVentas,
              SUM(Ordenes.TotalCompra) AS IngresosGenerados
FROM Ordenes
JOIN OrigenesOrden ON Ordenes.OrigenID = OrigenesOrden.OrigenID
GROUP BY OrigenesOrden.Descripcion
ORDER BY IngresosGenerados DESC;

--Productividad de los Empleados: ¿Cuál es el nivel de ingreso generado por Empleado?

SELECT Empleados.Nombre AS Empleado,
              SUM(Ordenes.TotalCompra) AS IngresoGenerado
FROM Ordenes
JOIN Empleados ON Ordenes.EmpleadoID = Empleados.EmpleadoID
GROUP BY Empleados.Nombre
ORDER BY IngresoGenerado DESC;

--Análisis de Demanda por Horario y Día: ¿Cómo varía la demanda de productos a lo largo del día?

SELECT T1.HorarioVenta AS Horario,
       SUM(T2.Cantidad) AS Cantidad
FROM Ordenes AS T1
LEFT JOIN DetalleOrdenes AS T2 ON T1.OrdenID = T2.OrdenID
GROUP BY T1.HorarioVenta;

--Comparación de Ventas Mensuales: ¿Cuál es la tendencia de los ingresos generados en cada periodo mensual?

SELECT DATENAME(MONTH, FechaOrdenTomada) AS Mes,
       SUM(TotalCompra) AS Ingresos
FROM Ordenes
GROUP BY DATENAME(MONTH, FechaOrdenTomada)
ORDER BY Mes;

--¿Qué porcentaje de clientes son recurrentes versus nuevos clientes cada mes?

SELECT ClienteID, COUNT(OrdenID) AS CantidadOrdenes
FROM Ordenes
GROUP BY ClienteID;
