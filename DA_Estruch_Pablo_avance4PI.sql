USE Fast_Food;


--�C�mo puedo obtener una lista de todos los productos junto con sus categor�as?

SELECT T1.Nombre AS Productos, T2.Nombre AS Categorias
FROM Productos AS T1
INNER JOIN Categorias AS T2 ON T1.CategoriaID = T2.CategoriaID;

--�C�mo puedo saber a qu� sucursal est� asignado cada empleado?

SELECT T1.Nombre AS Empleados, T2.Nombre AS Sucursales
FROM Empleados AS T1
INNER JOIN Sucursales AS T2
ON T1.SucursalID = T2.SucursalID;


--�Existen productos que no tienen una categor�a asignada?

SELECT * FROM Productos AS T1
LEFT JOIN Categorias AS T2
ON T1.CategoriaID = T2.CategoriaID
WHERE T2.CategoriaID IS NULL;


/*�C�mo puedo obtener un detalle completo de las �rdenes, incluyendo el Nombre del 
cliente, Nombre del empleado que tom� la orden, y Nombre del mensajero que la entreg�?*/

SELECT 
    T1.*,
    T2.Nombre AS Clientes,
    T3.Nombre AS Empleados,
    T4.Nombre AS Mensajeros
FROM Ordenes AS T1
LEFT JOIN Clientes AS T2
    ON T1.ClienteID = T2.ClienteID
LEFT JOIN Empleados AS T3
    ON T1.EmpleadoID = T3.EmpleadoID
LEFT JOIN Mensajeros AS T4
    ON T1.MensajeroID = T4.MensajeroID;

--�Cu�ntos art�culos correspondientes a cada Categor�a de Productos se han vendido en cada sucursal?

SELECT T5.Nombre AS Categorias,
       T3.Nombre AS Sucursales,
       SUM(T2.Cantidad) AS Cantidad
FROM Ordenes AS T1
INNER JOIN DetalleOrdenes AS T2 
ON T1.OrdenID = T2.OrdenID
INNER JOIN Sucursales AS T3 
ON T1.SucursalID = T3.SucursalID
INNER JOIN Productos AS T4 
ON T2.ProductoID = T4.ProductoID
INNER JOIN Categorias AS T5 
ON T4.CategoriaID = T5.CategoriaID
GROUP BY T5.Nombre, T3.Nombre
ORDER BY Cantidad;