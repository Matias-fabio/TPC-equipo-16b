
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
('PROD001', 'Teclado Mecánico Redragon K568', 'Teclado mecánico con iluminación RGB, switches cherry red', 1, 5, 7999.99, 'https://redragon.es/content/uploads/2021/04/DARK-AVENGER.png'),
('PROD002', 'Mouse Gamer Logitech G203', 'Mouse óptico gamer con 16000 DPI y retroiluminación', 1, 5, 4999.99, 'https://resource.logitechg.com/w_692,c_lpad,ar_4:3,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/gaming/en/products/g203/g203-gallery-1.png?v=1'),
('PROD003', 'Monitor 24" SAMSUNG FHD', 'Monitor LED 24 pulgadas Full HD con tasa de refresco de 75Hz', 1, 3, 29999.99, 'https://images.samsung.com/is/image/samsung/p6pim/ar/lf24t350fhlczb/gallery/ar-t35f-388813-lf24t350fhlczb-456991993?$650_519_PNG$'),
('PROD004', 'Memoria RAM Corsair Vengance 16GB DDR4', 'Memoria RAM DDR4 de 16GB 3200MHz para gaming', 1, 7, 12999.99, 'https://www.gamerspoint.com.ar/wp-content/uploads/Memoria-Ram-Corsair-Vengeance-Rs-16gb-2x8-3600mhz-Rgb-Ddr4-Cl18-600x600.png'),
('PROD005','Procesador AMD Ryzen 7 5800X', 'Procesador AMD Ryzen 7 5800X de 8 núcleos y 16 hilos', 1, 12, 139999.99, 'https://logg.api.cygnus.market/static/logg/Global/Procesador%20AMD%20Ryzen%207%205700X%204.6GHz%20AM4/da28f5f3752f4fb1a4d43a2c601c1eb5.webp' ),
('PROD006', 'Gigabyte Aorus RTX 3070', 'Placa de video NVIDIA RTX 3070 con 8GB GDDR6', 1, 2, 199999.99, 'https://static.gigabyte.com/StaticFile/Image/Global/163e9f51ab41e2b931919e1dde162c0a/Product/29215'),
('PROD007', 'Gabinete ATX Level Up Cassiopeia', 'Gabinete ATX para PC con panel lateral de vidrio templado y RGB', 1, 10, 14999.99, 'https://tienda.anywayinsumos.com.ar/22766-medium_default/gabinete-gm-level-up-cassiopeia-mid-tower-atx-1fan-rgb-rear-378190447mm.jpg'),
('PROD008', 'Fuente AeroCool Dorado 750W ', 'Fuente de alimentación 80 Plus Gold 750W modular, 80 PLUS GOLD', 1, 9, 10999.99, 'https://aerocool.io/wp-content/uploads/2021/03/DORADO-Infographics-01-750.png'),
('PROD009', 'Disco Duro 2TB', 'Disco duro mecánico 2TB para almacenamiento masivo', 1, 11, 8999.99, 'https://www.westerndigital.com/content/dam/store/en-us/assets/products/internal-storage/wd-purple-sata-hdd/gallery/wd-purple-surveillance-hard-drive-2tb.png.thumb.1280.1280.png'),
('PROD010', 'Procesador Intel i7 12700K', 'Procesador Intel Core i7 12700K de 12 núcleos y 20 hilos', 1, 12, 179999.99, 'https://gamerloot.com.mx/wp-content/uploads/2024/06/Procesador-Intel-Core-i7-12700K.webp'),
('PROD011', 'Aorus Gigabyte Disco Ssd 1tb M.2 Nvme Gen4', 'Unidad SSD NVMe de 1TB con velocidad de lectura de 3500MB/s', 1, 11, 24999.99, 'https://app.contabilium.com/files/explorer/7026/Productos-Servicios/concepto-5751641.png'),
('PROD012', 'ROG MAXIMUS Z690 EXTREME', 'Placa madre para Intel Z690 con soporte para DDR5', 1, 6, 37999.99, 'https://dlcdnwebimgs.asus.com/gain/293AC7FB-F2DB-4559-A749-9AD4A23598EF/w717/h525'),
('PROD013', 'Cooler Líquido 240mm', 'Sistema de refrigeración líquida con radiador de 240mm', 1, 13, 19999.99, 'https://example.com/img/cooler-liquido.jpg'),
('PROD014', 'Auriculares Gamer 7.1', 'Auriculares gaming con sonido 7.1 envolvente y micrófono', 1, 5, 9999.99, 'https://example.com/img/auriculares-gamer.jpg'),
('PROD015', 'Redragon Gaia C211', 'Silla ergonómica para gaming con reposabrazos ajustable', 1, 4, 24999.99, 'https://redragon.es/content/uploads/2021/12/C221-BW-GAIA.png'),
('PROD016', 'Router WiFi 6', 'Router de última generación con tecnología WiFi 6', 1, 5, 11999.99, 'https://example.com/img/router-wifi6.jpg'),
('PROD017', 'Webcam Full HD', 'Cámara web Full HD 1080p con micrófono incorporado', 1, 5, 7999.99, 'https://example.com/img/webcam-fhd.jpg'),
('PROD018', 'Micrófono Condensador USB', 'Micrófono condensador USB ideal para streaming y grabaciones', 1, 5, 40999.99, 'https://example.com/img/microfono-usb.jpg'),
('PROD019', 'Base Refrigerante para Laptop', 'Base refrigerante para laptops de hasta 17 pulgadas con iluminación LED', 1, 13, 34999.99, 'https://example.com/img/base-refrigerante.jpg'),
('PROD020', 'Kit de Limpieza para PC', 'Kit de limpieza profesional para PC y componentes electrónicos', 1, 5, 9899.99, 'https://example.com/img/kit-limpieza.jpg'),
('PROD021', 'Corsair T3', 'silla gamer corsair t3, maximo confort', 1, 4, 2499.99, 'https://www.liontech-gaming.com/wp-content/uploads/2021/12/SILLA-GAMER-CORSAIR-T3-RUSH-CHARCOAL-500x538.webp'),
('PROD022', 'Shenlong SCH-RGB155', 'silla gamer Shenlong, con luces led RGB,  maximo confort', 1, 4, 356499.99, 'https://shenlong.com.ar/resources/users-uploads/galleries/256/productos/sch-rgb155-black.png'),
('PROD023', 'Notebook ROG Zephyrus', 'Intel® Core™ Ultra 9 de 16 Núcleos NVIDIA GeForce RTX 4070 32GB 1TB SSD 240HZ OLED GU605MI-QR118W', 1, 1, 3855000.75, 'https://tiendadiggit.com.ar/web/image/product.image/6477/image_1024/Notebook%20Gamer%20ROG%20Zephyrus%20G16%20Intel%C2%AE%20Core%E2%84%A2%20Ultra%209%20de%2016%20N%C3%BAcleos%20NVIDIA%20GeForce%20RTX%204070%2032GB%201TB%20SSD%20240HZ%20OLED%20GU605MI-QR118W?unique=b47f338'),
('PROD024', 'Notebook XPG Xenia', 'Notebook XPG Xenia 2024 15G IPS 144HZ I7-14700HX Nvidia RTX 4070 16GB DDR5 1TB M.2', 1, 1, 1900499.99, 'https://statics.globaldrop.com.ar/bartez-02-2024/1002_09-05-2024-10-05-58-xenia_15g_pd_2000x2000_01.png'),
('PROD025', 'Monitor AOC Agon 32" 165Hz ', 'Monitor 32 AOC Agon AG323FCXE 165Hz Curvo', 1, 3, 290499.99, 'https://www.venex.com.ar/products_images/1668189743_ag323fcxe_3.png'),
('PROD026', 'Intel i5 13400F ', 'Procesador Intel Core i5-13400F 4.6GHz 20MB Raptor Lake LGA1700 c/ Cooler', 1, 12, 894999.99, 'https://logg.api.cygnus.market/static/logg/Global/Procesador_Intel_Core_i5_13400F_4.6GHz_20MB_Raptor_Lake_LGA1700_c_Cooler/13b46ae6ba40462d895a7bc90b18d91c.webp')

;
GO
UPDATE ARTICULOS
SET Nombre = 'ROG MAXIMUS Z690 EXTREME'
WHERE Codigo = 'PROD011';
GO

UPDATE ARTICULOS
SET ImgUrl = 'https://dlcdnwebimgs.asus.com/gain/293AC7FB-F2DB-4559-A749-9AD4A23598EF/w717/h525'
WHERE Codigo = 'PROD012';
GO

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

create table Usuarios(
    ID int IDENTITY(1,1) NOT NULL,
    IDAdmin INT NOT NULL,
    Nombre VARCHAR(50) NULL,
    Apellido VARCHAR(50) NULL,
    Direcion VARCHAR(100) NULL,
    Telefono VARCHAR(20) NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Contraseña VARCHAR(20) NOT NULL,
)


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

SELECT A.Id, A.Codigo, A.Nombre, A.Descripcion, A.Precio, A.ImgUrl, C.Nombre AS Categoria, M.Nombre AS NombreMarca
FROM ARTICULOS A
INNER JOIN CATEGORIAS C ON A.IdCategoria = C.Id
INNER JOIN MARCAS M ON A.IdMarca = M.Id
WHERE A.ID = 2;

--USUARIOS
select * from Usuarios


TRUNCATE TABLE Usuarios
GO


CREATE TABLE IMAGENES_ARTICULO (
    Id_Img INT ,
    Id_art INT ,
    UrlImagen NVARCHAR(255),
    CONSTRAINT PK_IMAGENES_ARTICULO PRIMARY KEY(Id_img),
    CONSTRAINT FK_ARTICULO_IMG FOREIGN KEY(Id_art) REFERENCES ARTICULOS(ID)
);
GO

INSERT INTO IMAGENES_ARTICULO(Id_Img, Id_art, UrlImagen) VALUES
(1,1,'https://redragon.es/content/uploads/2021/04/DARK-AVENGER.png'),
(2,1,'https://acdn.mitiendanube.com/stores/001/574/495/products/redragon-teclado-k568-dark-avenger-21-d8488808cf855d4ad116276016279618-240-0.png'),
(3,1,'https://acdn.mitiendanube.com/stores/001/375/073/products/1602166650_k568_hq_81-4ad250b79b19b6973d16559401896465-1024-1024.png'),
(4,1,'https://b3669556.smushcdn.com/3669556/wp-content/uploads/2023/11/K568RGB-SP-RED-PNG-WEB-7.png?lossy=2&strip=1&webp=1'),
(5,2,'https://resource.logitechg.com/w_692,c_lpad,ar_4:3,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/gaming/en/products/g203/g203-gallery-1.png?v=1'),
(6,2,'https://resource.logitechg.com/w_692,c_lpad,ar_4:3,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/gaming/en/products/g203/g203-gallery-5.png?v=1'),
(7,2,'https://static-geektopia.com/storage/geek/products/logitech/g203-prodigy/g102-g203-2.png'),
(8,2,'https://imagedelivery.net/4fYuQyy-r8_rpBpcY7lH_A/falabellaPE/120072605_01/w=800,h=800,fit=pad'),
(9,3,'https://images.samsung.com/is/image/samsung/p6pim/ar/lf24t350fhlczb/gallery/ar-t35f-388813-lf24t350fhlczb-456991993?$650_519_PNG$'),
(10,3,'https://betterdeals.cw/cdn/shop/files/5010124_1500x.webp?v=1721074121'),
(11,3,'https://www.casadelaudio.com/Image/0/750_750-553-SAM-411_-4.png'),
(12,3,'https://fotopoint.com.ar/wp-content/uploads/2022/06/samsung-monitor-24-t35f-fotopoint1.webp'),
(13,4,'https://www.gamerspoint.com.ar/wp-content/uploads/Memoria-Ram-Corsair-Vengeance-Rs-16gb-2x8-3600mhz-Rgb-Ddr4-Cl18-600x600.png'),
(14,4,'https://www.invidcomputers.com/images/0000000000414765602990414765.png-1200Wx1200H'),
(15,4,'https://i0.wp.com/www.aslanstoreuy.com/wp-content/uploads/2023/07/Memoria-RAM-Corsair-Vengeance-RGB-DDR5-Aslan-Store-11.webp?fit=600%2C600&ssl=1'),
(16,4,'https://etchile.net/wp-content/uploads/2023/11/VENGEANCE_RGB_RS_14-PhotoRoom-600x600.png'),
(17,5,'https://logg.api.cygnus.market/static/logg/Global/Procesador%20AMD%20Ryzen%207%205700X%204.6GHz%20AM4/da28f5f3752f4fb1a4d43a2c601c1eb5.webp'),
(18,5,'https://acf.geeknetic.es/imgw/imagenes/Tutoriales/2020/1922-AMD-Ryzen-7-5800/1922-AMD-Ryzen-7-5800-1.jpg?f=webp'),
(19,5,'https://www.exceed.rs/images/products/big/32327.jpg'),
(20,5,'https://http2.mlstatic.com/D_NQ_NP_828419-MLU69999470484_062023-O.webp'),
(21,6,'https://static.gigabyte.com/StaticFile/Image/Global/163e9f51ab41e2b931919e1dde162c0a/Product/29215'),
(22,6,'https://static.gigabyte.com/StaticFile/Image/Global/43f240ef13daf8907ddacad9f38eaf06/Product/26294/png/1000'),
(23,6,'https://www.liontech-gaming.com/wp-content/uploads/2023/11/RTX-3070-AORUS-MASTER-8GB.png'),
(24,6,'https://rigstation.ae/cdn/shop/products/6_25accfcd-ee28-45df-90ab-80bf3ef17a31_436x436.png?v=1668265126'),
(25,7,'https://tienda.anywayinsumos.com.ar/22766-medium_default/gabinete-gm-level-up-cassiopeia-mid-tower-atx-1fan-rgb-rear-378190447mm.jpg'),
(26,7,'https://levelupworld.com/assets/img/dt/gabinetes/cassiopeia/cassiopeia1.png'),
(27,7,'https://levelupworld.com/assets/img/dt/gabinetes/cassiopeia/cassiopeia2.png'),
(28,8,'https://aerocool.io/wp-content/uploads/2021/03/DORADO-Infographics-01-750.png'),
(29,8,'https://logg.api.cygnus.market/static/logg/Global/Fuente%20AeroCool%20DORADO%20750W%2080+Gold%20ARGB/feeadf50644840668557151b1719c9a6.webp'),
(30,8,'https://aerocool.io/wp-content/uploads/2021/04/DORADO-750W-Txt-01.png'),
(31,8,'https://aerocool.io/wp-content/uploads/2021/04/DORADO-Key-Visual-Responsive-Design-750.jpg'),
(32,9,'https://www.westerndigital.com/content/dam/store/en-us/assets/products/internal-storage/wd-purple-sata-hdd/gallery/wd-purple-surveillance-hard-drive-2tb.png.thumb.1280.1280.png'),
(33,9,'https://distecbc.com/wp-content/uploads/2022/04/Hardware-Discos-Duros-Internos-Western-Digital-WD20PURZ-161828-4Aay300nv8pgvAYy-removebg-preview.png'),
(34,9,'https://essistemas.com/1095-medium_default/disco-duro-interno-western-digital-purple-35-1tb-sata-3-5400-rpm.jpg'),
(36,10,''),
(37,10,''),
(38,10,''),
(39,10,''),
(40,11,'https://app.contabilium.com/files/explorer/7026/Productos-Servicios/concepto-5751641.png'),
(41,11,'https://www.cncnet.com.ar/wp-content/uploads/2022/07/GP-ASM2NE6200TTTD-4-600x600.png'),
(42,11,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLcV8-HUE1ewgfQDdB4b-InuabzQhocl7-wg&s'),
(43,11,'https://www.gigabyte.com/FileUpload/Global/KeyFeature/1731/innergigabyteimages/efficiency.png'),
(44,12,'https://dlcdnwebimgs.asus.com/gain/293AC7FB-F2DB-4559-A749-9AD4A23598EF/w717/h525'),
(45,12,'https://cdn.inet.se/product/1600x900/1903625_0.jpg'),
(46,12,'https://dlcdnwebimgs.asus.com/files/media/B9DF352A-7A21-4B18-BE82-6BE926565C5D/v2/img/connectivity/thunderbolt.png'),
(47,12,'https://dlcdnwebimgs.asus.com/files/media/B9DF352A-7A21-4B18-BE82-6BE926565C5D/v2/img/kv/pd.png')

GO

TRUNCATE TABLE IMAGENES_ARTICULO
GO

SELECT * FROM IMAGENES_ARTICULO
GO

SELECT * FROM ARTICULOS
GO