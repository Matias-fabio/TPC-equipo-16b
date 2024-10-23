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