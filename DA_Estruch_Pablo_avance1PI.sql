-- CREACION DE BASE DE DATOS DE Fast_Food

CREATE DATABASE Fast_Food;

--Posicionarse sobre la base de datos

USE Fast_Food;

-- Creacion de tablas

CREATE TABLE Categorias(
	CategoriaID INT PRIMARY KEY IDENTITY,
	Nombre NVARCHAR(255) NOT NULL);

CREATE TABLE Productos(
	ProductoID INT PRIMARY KEY IDENTITY,
	Nombre NVARCHAR(255) NOT NULL,
	CategoriaID INT,
	Precio DECIMAL(10,2) NOT NULL);

CREATE TABLE Sucursales(
	SucursalID INT PRIMARY KEY IDENTITY,
	Nombre NVARCHAR(255) NOT NULL,
	Direccion NVARCHAR(255));

CREATE TABLE Empleados(
	EmpleadoID INT PRIMARY KEY IDENTITY,
	Nombre NVARCHAR(255) NOT NULL,
	Posicion NVARCHAR(255),
	Departamento NVARCHAR(255),
	SucursalID INT,
	Rol NVARCHAR(255)); --Vendedor o Mensajero

CREATE TABLE Clientes(
	ClienteID INT PRIMARY KEY IDENTITY,
	Nombre NVARCHAR(255) NOT NULL,
	Direccion NVARCHAR(255));

CREATE TABLE OrigenesOrden(
	OrigenID INT PRIMARY KEY IDENTITY,
	Descripcion NVARCHAR(255) NOT NULL);

CREATE TABLE TiposPago(
	TipoPagoID INT PRIMARY KEY IDENTITY,
	Descripcion NVARCHAR(255) NOT NULL);

CREATE TABLE Mensajeros(
	MensajeroID INT PRIMARY KEY IDENTITY,
	Nombre NVARCHAR(255) NOT NULL,
	Externo BIT NOT NULL);

CREATE TABLE DetalleOrdenes(
	OrdenID INT,		--Clave Primaria Compuesta
	ProductoID INT,		--Clave Primaria Compuesta
	Cantidad INT,
	Precio DECIMAL (10,2),
	PRIMARY KEY(OrdenID,ProductoID));

CREATE TABLE Ordenes(
	OrdenID INT PRIMARY KEY IDENTITY,
	ClienteID INT,
	EmpleadoID INT,
	SucursalID INT,
	MensajeroID INT,
	TipoPagoID INT,
	OrigenID INT,
	HorarioVenta VARCHAR(255), -- Mañana, Tarde, Noche
	TotalCompra DECIMAL(10,2),
	KilometrosRecorrer DECIMAL(10,2), --En caso que la orden sea delivery
	FechaDespacho DATETIME, -- Fecha y hora de entregar al repartidor
	FechaEntrega DATETIME, -- Fecha y hora de entragar al cliente
	FechaOrdenTomada DATETIME, -- Fecha y hora de la recepcion de la orden
	FechaOrdenLista DATETIME); --Fecha y hora de la orden lista


----------- Generar relacion entre tablas

ALTER TABLE Productos
ADD CONSTRAINT FK_Productos_Categorias --Este es el nombre de la relacion
FOREIGN KEY(CategoriaID) REFERENCES Categorias(CategoriaID); --FK referencia PK Categorias

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Clientes
FOREIGN KEY(ClienteID) REFERENCES Clientes(ClienteID);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Empleados
FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Sucursal
FOREIGN KEY (SucursalID) REFERENCES Sucursales(SucursalID);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Mensajeros
FOREIGN KEY (MensajeroID) REFERENCES Mensajeros(MensajeroID);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_TipoPago
FOREIGN KEY (TipoPagoID) REFERENCES TiposPago(TipoPagoID);

ALTER TABLE Ordenes
ADD CONSTRAINT FK_Ordenes_Origen
FOREIGN KEY (OrigenID) REFERENCES OrigenesOrden(OrigenID);

SELECT * FROM Ordenes;
SELECT * FROM DetalleOrdenes;
SELECT * FROM Productos;

ALTER TABLE DetalleOrdenes
ADD CONSTRAINT FK_DetalleOrdenes
FOREIGN KEY(OrdenID) REFERENCES Ordenes(OrdenID);

ALTER TABLE DetalleOrdenes
ADD CONSTRAINT FK_DetalleProducto
FOREIGN KEY(ProductoID) REFERENCES Productos(ProductoID);