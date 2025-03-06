# 📊 Proyecto: Descubriendo la Base de Datos de Fast Food

**Autor:** Pablo Martín Estruch Contreras  
**Email:** pablo.m.estruch@gmail.com  
**Cohorte:** DAFT-11  
**Fecha de entrega:** 16/01/2025  

## 📌 Introducción

Este proyecto se centra en la optimización y consolidación de la base de datos de una empresa de comida rápida, que anteriormente manejaba información dispersa en Google Sheets y documentos manuales. Como Analista de Datos, mi rol fue diseñar, poblar y analizar la base de datos para mejorar la toma de decisiones.

## 🏠 Desarrollo del Proyecto

1️⃣ **Diseño y Creación de la Base de Datos**  
   - Modelado del esquema relacional.  
   - Definición de tablas, columnas, claves primarias y foráneas.  

2️⃣ **Inserción de Datos**  
   - Poblamiento de tablas asegurando integridad referencial.  

3️⃣ **Consultas Simples**  
   - Respuestas a preguntas básicas del negocio.  

4️⃣ **Consultas Complejas**  
   - Análisis avanzado enfocado en eficiencia y rendimiento.  

## 📈 Análisis de Resultados

🔹 **Ingresos Totales:** Evaluación de rentabilidad.  
🔹 **Promedio de Precios por Categoría:** Segmentación del mercado.  
🔹 **Sucursales con Ventas Altas:** Identificación de mejores prácticas.  
🔹 **Comparación de Ventas Antes y Después de Julio 2023:** Impacto de estrategias de marketing.  
🔹 **Métodos de Pago:** Preferencia por pagos digitales.  
🔹 **Demanda por Horario:** Ajuste de recursos según picos de venta.  
🔹 **Clientes Recurrentes vs Nuevos:** Estrategias de fidelización.  

## 🛠️ Consultas SQL Destacadas

🔸 **Eficiencia de los Mensajeros**
```sql
SELECT AVG(DATEDIFF(MINUTE, FechaDespacho, FechaEntrega)) AS PromedioTiempoEntrega
FROM Ordenes
WHERE FechaDespacho IS NOT NULL AND FechaEntrega IS NOT NULL;
```
*Tiempo promedio: 30 minutos.*

🔸 **Análisis de Ventas por Canal**
```sql
SELECT TOP 1 OrigenesOrden.Descripcion AS CanalDeVentas,
              SUM(Ordenes.TotalCompra) AS IngresosGenerados
FROM Ordenes
JOIN OrigenesOrden ON Ordenes.OrigenID = OrigenesOrden.OrigenID
GROUP BY OrigenesOrden.Descripcion
ORDER BY IngresosGenerados DESC;
```
*El canal de ventas más rentable es el presencial.*

🔸 **Productividad de los Empleados**
```sql
SELECT Empleados.Nombre AS Empleado,
              SUM(Ordenes.TotalCompra) AS IngresoGenerado
FROM Ordenes
JOIN Empleados ON Ordenes.EmpleadoID = Empleados.EmpleadoID
GROUP BY Empleados.Nombre
ORDER BY IngresoGenerado DESC;
```
*Evaluación del rendimiento de los empleados.*

## 📈 Optimización y Sostenibilidad de la Base de Datos

✔️ Normalización y relaciones entre tablas.  
✔️ Consultas optimizadas y vistas predefinidas.  
✔️ Seguridad con encriptación y control de accesos.  
✔️ Escalabilidad y mantenimiento regular.  

## 🚀 Desafíos y Soluciones

Durante el proyecto, enfrenté desafíos como consultas complejas, datos inconsistentes y problemas de rendimiento. Para superarlos:  
✅ Simplifiqué y optimicé consultas SQL.  
✅ Corregí errores en los datos para mejorar precisión.  
✅ Implementé métricas de rendimiento.  

## 💡 Reflexión Personal

Este proyecto me permitió profundizar en modelado de bases de datos, optimización de SQL y análisis de datos para la toma de decisiones. Si lo repitiera, dedicaría más tiempo a documentar el proceso y automatizar tareas repetitivas.

