--Creación de la Base de Datos:
CREATE DATABASE Biblioteca;
USE Biblioteca;

--Creación de la tabla Libros:
CREATE TABLE Libros(
Cota 				VARCHAR(5) NOT NULL,
Nombre 				VARCHAR(80) NOT NULL,
Aniopublicacion 	INT(4) NOT NULL,
Editorial 			VARCHAR(50) NOT NULL,
Paginas 			INT(4) NOT NULL,
edicion 			INT(2) NOT NULL,
PRIMARY KEY ( Cota )
);

--Añadiendo los registros:
INSERT INTO Libros VALUES('N001', 'Hannibal', 1999, 'Dell Publishing', 484, 1);
INSERT INTO Libros VALUES('N002', 'El retrato de Dorian Gray', 1890, "Lippincott's Monthly Magazine", 250, 10);
INSERT INTO Libros VALUES('C001', 'El principito', 1992, 'Editorial Panapo', 64, 1);
INSERT INTO Libros VALUES('P001', 'Cantar de mio Cid', 1200, 'Manuscrito', 50, 1);
INSERT INTO Libros VALUES('N003', 'Cañas y Barro', 1902, 'Editorial Panapo', 150, 4);
INSERT INTO Libros VALUES('N004', 'Sonatas', 1904, 'Española WW', 170, 2);
INSERT INTO Libros VALUES('N005', 'Tirano Banderas', 1926, 'Española WW', 190, 1);
INSERT INTO Libros VALUES('N006', 'A.M.D.G', 1910, 'Española WW', 270, 2);
INSERT INTO Libros VALUES('N007', 'Jarapellejos', 1914, 'Paulinas', 136, 5);
INSERT INTO Libros VALUES('N008', 'Niebla', 1914, 'Editorial Caracol', 236, 2);
INSERT INTO Libros VALUES('N009', "La tía Tula", 1921, 'Unamuno International', 149, 5);
INSERT INTO Libros VALUES('N010', 'El obispo leproso', 1926, 'Miro CC', 235, 1);
INSERT INTO Libros VALUES('N011', 'La colmena', 1936, 'Editorial Caracol', 138, 2);
INSERT INTO Libros VALUES('N012', 'Nada', 1944, 'Laforet Española', 178, 1);
INSERT INTO Libros VALUES('N013', 'Ficciones', 1944, 'La Argentina', 100, 1);

--Consulta de todos los libros de la biblioteca:
SELECT * FROM Libros;

--Consulta de libros cuyo año de publicación fue antes del 2010:
SELECT * FROM Libros WHERE Aniopublicacion < 2010;

--Consulta de libros cuya cantidad de páginas supera las 2000:
SELECT * FROM Libros WHERE Paginas > 2000;

--Consulta de libros cuya edición es el número 5:
SELECT * FROM Libros WHERE edicion = 5;

--Consulta de todos los libros ordenados por el nombre de forma ascendente:
SELECT * FROM Libros ORDER BY Nombre ASC;
