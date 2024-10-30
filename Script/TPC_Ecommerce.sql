
USE master;

CREATE DATABASE TPC_Ecommerce

USE TPC_Ecommerce
GO

CREATE TABLE ARTICULOS(
    ID int IDENTITY(1,1) NOT NULL,
    Codigo VARCHAR(10) NULL,
    Nombre VARCHAR(50) NULL,
    Descripcion VARCHAR(200) NULL,
    Precio DECIMAL(10,2) NULL,
    CONSTRAINT PK_ARTICULOS PRIMARY KEY (ID)
)
GO

INSERT INTO ARTICULOS
VALUES 
('A001', 'Articulo 1', 'Descripción del Artículo 1', 100.50),
('A002', 'Articulo 2', 'Descripción del Artículo 2', 150.75),
('A003', 'Articulo 3', 'Descripción del Artículo 3', 200.00),
('A004', 'Articulo 4', 'Descripción del Artículo 4', 250.25)
GO

CREATE TABLE CATEGORIAS(
    Id int IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(50) NULL,
    Descripcion VARCHAR(100) NULL,
    UrlImagen VARCHAR(300) NULL,
    CONSTRAINT PK_CATEGORIAS PRIMARY KEY(Id)
)
GO


ALTER TABLE CATEGORIAS
ADD UrlImagen VARCHAR(300) NULL;
GO

TRUNCATE TABLE CATEGORIAS
GO

INSERT INTO CATEGORIAS (Nombre, Descripcion, UrlImagen)
VALUES 
('Notebooks', 'Dispositivos portátiles de computación', 'https://png.pngtree.com/png-vector/20240712/ourmid/pngtree-high-performance-gaming-laptop-png-image_13046149.png'),
('Placas de Video', 'placas de video', 'https://lh3.googleusercontent.com/pw/AP1GczPi9C02YYtRz_OanRK99wrqnIJP-JUqoWxw2s1qpTqIL-Ydsl9vdukQAlfFnMEtFr0N-m0sHJ_Db-RtgJKsKerWQ9dhei9zhZooz4iBUjlezxiMfbmCexwhG3SOUvu0cVdPSTZnhUDEEv2CQG1LwJM9tg=w640-h500-s-no-gm?authuser=0')
GO


SELECT * FROM CATEGORIAS
GO

SELECT
a.ID, a.Codigo, a.Nombre, a.Descripcion, a.Precio
FROM ARTICULOS a
GO
select * from CATEGORIAS
go
SELECT c.Nombre FROM CATEGORIAS c
go  
SELECT TOP 5 c.Id, c.Nombre FROM CATEGORIAS c;