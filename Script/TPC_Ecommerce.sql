
USE master;

CREATE DATABASE TPC_Ecommerce

USE TPC_Ecommerce
GO


CREATE TABLE ARTICULOS(
    ID INT IDENTITY(1,1) NOT NULL,
    Codigo VARCHAR(10) NULL,
    Nombre VARCHAR(50) NULL,
    Descripcion VARCHAR(200) NULL,
    IdMarca INT NOT NULL,
    IdCategoria INT NOT NULL,
    Precio DECIMAL(10,2) NULL,
    ImgUrl VARCHAR(300) NULL,
    CONSTRAINT PK_ARTICULOS PRIMARY KEY (ID),
    CONSTRAINT FK_ARTICULOS_MARCAS FOREIGN KEY (IdMarca) REFERENCES MARCAS(Id),
    CONSTRAINT FK_ARTICULOS_CATEGORIAS FOREIGN KEY (IdCategoria) REFERENCES CATEGORIAS(Id)
)
GO

TRUNCATE TABLE ARTICULOS
GO

INSERT INTO ARTICULOS (Codigo, Nombre, Descripcion, IdMarca, IdCategoria, Precio, ImgUrl) VALUES
('PROD001', 'Teclado Mecánico RGB', 'Teclado mecánico con iluminación RGB, switches cherry red', 1, 5, 7999.99, 'https://example.com/img/teclado-rgb.jpg'),
('PROD002', 'Mouse Gamer 16000 DPI', 'Mouse óptico gamer con 16000 DPI y retroiluminación', 1, 5, 4999.99, 'https://example.com/img/mouse-gamer.jpg'),
('PROD003', 'Monitor 24" FHD', 'Monitor LED 24 pulgadas Full HD con tasa de refresco de 144Hz', 1, 3, 29999.99, 'https://example.com/img/monitor-24.jpg'),
('PROD004', 'Memoria RAM 16GB DDR4', 'Memoria RAM DDR4 de 16GB 3200MHz para gaming', 1, 7, 12999.99, 'https://example.com/img/ram-16gb.jpg'),
('PROD005', 'SSD 1TB NVMe', 'Unidad SSD NVMe de 1TB con velocidad de lectura de 3500MB/s', 1, 11, 24999.99, 'https://example.com/img/ssd-1tb.jpg'),
('PROD006', 'Placa de Video RTX 3070', 'Placa de video NVIDIA RTX 3070 con 8GB GDDR6', 1, 2, 199999.99, 'https://example.com/img/rtx-3070.jpg'),
('PROD007', 'Gabinete ATX con RGB', 'Gabinete ATX para PC con panel lateral de vidrio templado y RGB', 1, 10, 14999.99, 'https://example.com/img/gabinete-rgb.jpg'),
('PROD008', 'Fuente de Alimentación 750W', 'Fuente de alimentación 80 Plus Gold 750W modular', 1, 9, 10999.99, 'https://example.com/img/fuente-750w.jpg'),
('PROD009', 'Disco Duro 2TB', 'Disco duro mecánico 2TB para almacenamiento masivo', 1, 11, 8999.99, 'https://example.com/img/hdd-2tb.jpg'),
('PROD010', 'Procesador Intel i7 12700K', 'Procesador Intel Core i7 12700K de 12 núcleos y 20 hilos', 1, 12, 179999.99, 'https://example.com/img/intel-i7.jpg'),
('PROD011', 'Procesador AMD Ryzen 7 5800X', 'Procesador AMD Ryzen 7 5800X de 8 núcleos y 16 hilos', 1, 12, 139999.99, 'https://example.com/img/ryzen-5800x.jpg'),
('PROD012', 'Placa Madre Z690', 'Placa madre para Intel Z690 con soporte para DDR5', 1, 6, 37999.99, 'https://example.com/img/placa-madre-z690.jpg'),
('PROD013', 'Cooler Líquido 240mm', 'Sistema de refrigeración líquida con radiador de 240mm', 1, 13, 19999.99, 'https://example.com/img/cooler-liquido.jpg'),
('PROD014', 'Auriculares Gamer 7.1', 'Auriculares gaming con sonido 7.1 envolvente y micrófono', 1, 5, 9999.99, 'https://example.com/img/auriculares-gamer.jpg'),
('PROD015', 'Silla Gamer', 'Silla ergonómica para gaming con reposabrazos ajustable', 1, 4, 24999.99, 'https://example.com/img/silla-gamer.jpg'),
('PROD016', 'Router WiFi 6', 'Router de última generación con tecnología WiFi 6', 1, 5, 11999.99, 'https://example.com/img/router-wifi6.jpg'),
('PROD017', 'Webcam Full HD', 'Cámara web Full HD 1080p con micrófono incorporado', 1, 5, 7999.99, 'https://example.com/img/webcam-fhd.jpg'),
('PROD018', 'Micrófono Condensador USB', 'Micrófono condensador USB ideal para streaming y grabaciones', 1, 5, 10999.99, 'https://example.com/img/microfono-usb.jpg'),
('PROD019', 'Base Refrigerante para Laptop', 'Base refrigerante para laptops de hasta 17 pulgadas con iluminación LED', 1, 13, 4999.99, 'https://example.com/img/base-refrigerante.jpg'),
('PROD020', 'Kit de Limpieza para PC', 'Kit de limpieza profesional para PC y componentes electrónicos', 1, 5, 2499.99, 'https://example.com/img/kit-limpieza.jpg');



CREATE TABLE CATEGORIAS(
    Id int IDENTITY(1,1) NOT NULL,
    Nombre VARCHAR(50) NULL,
    Descripcion VARCHAR(100) NULL,
    UrlImagen VARCHAR(300) NULL,
    CONSTRAINT PK_CATEGORIAS PRIMARY KEY(Id)
)
GO




-- ALTER TABLE CATEGORIAS
-- ADD UrlImagen VARCHAR(300) NULL;
-- GO

TRUNCATE TABLE CATEGORIAS
GO

INSERT INTO CATEGORIAS (Nombre, Descripcion, UrlImagen)
VALUES 
('Notebooks', 'Dispositivos portátiles de computación', 'https://lh3.googleusercontent.com/pw/AP1GczPUn_MWduzpCaQ_gfPzZvr1z8KaSKo_-UNB3UckY5yHl11V1YGrq2FvGCEXbpvtLm-p6E3FIH-_emDYpl0FAlSV78iXDGnPmPVZCj0m6szYalu0x8Px4OefvC2GCLAsAhDRGL2mjmle-3pO-hdimm6vQg=w380-h380-s-no-gm?authuser=0'),
('Placas de Video', 'placas de video', 'https://lh3.googleusercontent.com/pw/AP1GczPzZLiScaQFTnA17zbUxu0tBbBypZ_e0K3ImvxmS2HFWEloKkoDN6IFQde14Eg6MvGPOx0wGG5RQMh0Wq6LnmTAvX9APdjoc7MUz4mRdH5RytI9omfL1gO27tEvuQtTvxA5VQgszqVKgHM_kuxSBRqshw=w380-h380-s-no-gm?authuser=0'),
('Monitores', 'pantallitas', 'https://lh3.googleusercontent.com/pw/AP1GczNrM0mhx0vn2gvoeTMxWPOZUI4UrtP9p0c1DUUlzIXs31cfVtfS0xROvzEPHaROW0_vCg5aDgDiBkylqRQUW8h4goPDDW6t1csziB4GQiGZWCqcN9NF3V-oI1K8Nmm1JC9CjclVFp1vZejxLWBcV-DRGw=w380-h380-s-no-gm?authuser=0'),
('Sillas Gamer', 'sillitas para sentarse', 'https://lh3.googleusercontent.com/pw/AP1GczNGoCT5w0GmIZ8G5pZaVql97vqeJPwwS9lkfrMj7aLqVt9R9nsH58-JZh2Qq-rddAyfl_DCHNz0FGzI0uAkpGcnBQuv5uSzrb-was4Dr6wX9mJU4ZGndigzys8I2bZgxlOFG8fiXIfyOCeBNJb889DDJA=w380-h380-s-no-gm?authuser=0'),
('Perifericos', 'Accesorios para conectar a la compu', 'https://lh3.googleusercontent.com/pw/AP1GczMSrgsPdWfN5QO5W65EjS79IbefZolwHPFqo0dmwIFp6DLLZyDgF6V-00KKs-M6GlJu2218iS4vJE_Bv71xr6eNz5aqbn3-4jSP1eZZRq3K7i164OnR3bCmclRZ0X62B18W1g-qL8-JWiQWH6qPafujOg=w380-h380-s-no-gm?authuser=0'),
('mothers', 'Placas base para ensamblar computadoras', ''),
('Memorias RAM', 'Módulos de memoria de acceso aleatorio', ''),
('Discos SSD', 'Dispositivos de almacenamiento sólido para computadoras', ''),
('Fuentes de Poder', 'Fuentes de alimentación para computadoras', ''),
('Gabinetes', 'Carcasas para ensamblar componentes de computadoras', ''),
('Almacenamiento Externo', 'Discos duros y SSD externos para almacenamiento adicional', '')
GO
-- INSERT INTO CATEGORIAS (Nombre, Descripcion, UrlImagen)
-- VALUES 
-- ('Procesadores', 'procesadores logicos para mejor funcionamiento', ''),
-- ('Refigeracion', 'para mantener fresca la pc', '')
-- GO

CREATE TABLE MARCAS(
    Id int IDENTITY(1,1) NOT NULL, 
    Nombre VARCHAR(50) NULL,
    Logo VARCHAR(300) NULL,
    CONSTRAINT PK_MARCAS PRIMARY KEY(Id)
)
GO

INSERT INTO MARCAS(Nombre, Logo)
VALUES
('AMD','')
GO


-- CONSULTAS
-- MARCAS
SELECT * FROM MARCAS
GO  
-- CATEGORIAS
SELECT * FROM CATEGORIAS
GO
select * from CATEGORIAS
go

SELECT c.Nombre FROM CATEGORIAS c
go 

SELECT TOP 5 c.Id, c.Nombre FROM CATEGORIAS c;
GO
-- ARTICULOS
SELECT * FROM ARTICULOS
GO

SELECT TOP 5
a.ID, a.Codigo, a.Nombre, a.Descripcion, a.Precio
FROM ARTICULOS a
GO

SELECT 
    A.Codigo,
    A.Nombre AS NombreArticulo,
    A.Descripcion AS DescripcionArticulo,
    A.Precio,
    C.Nombre AS NombreCategoria,
    M.Nombre AS NombreMarca
FROM ARTICULOS A
JOIN CATEGORIAS C ON A.IdCategoria = C.Id
JOIN MARCAS M ON A.IdMarca = M.Id;

-- SELECT A.Codigo, A.Nombre AS NombreArticulo, A.Descripcion AS DescripcionArticulo, A.Precio, C.Nombre AS NombreCategoria, M.Nombre AS NombreMarca FROM ARTICULOS A JOIN CATEGORIAS C ON A.IdCategoria = C.Id JOIN MARCAS M ON A.IdMarca = M.Id;