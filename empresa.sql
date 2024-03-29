--Creación de la base de datos:
CREATE DATABASE empresa;
USE empresa;

--Creación de la tabla departamento:
CREATE TABLE departamento(
	codigo INT(10) NOT NULL,
	nombre VARCHAR(100) NOT NULL,
	presupuesto DOUBLE NOT NULL,
	PRIMARY KEY (codigo)
);

--Creación de la tabla empleado:
CREATE TABLE empleado(
	codigo INT(10) NOT NULL,
	nif VARCHAR(9) NOT NULL,
	nombre VARCHAR(100) NOT NULL,
	apellido1 VARCHAR(100) NOT NULL,
	apellido2 VARCHAR(100),
	codigo_departamento INT(10) NOT NULL,
	PRIMARY KEY (codigo),
	CONSTRAINT FK_departamento_empleado FOREIGN KEY (codigo_departamento)
		REFERENCES departamento(codigo)
);
ALTER TABLE empleado
ADD UNIQUE(nif);

--Creación de departamentos para hacer pruebas:
INSERT INTO departamento VALUES(1, "Ventas", 3000000);
INSERT INTO departamento VALUES(2, "Recursos Humanos", 1000000);
INSERT INTO departamento VALUES(3, "Ingeniería", 20000000);
INSERT INTO departamento VALUES(4, "Marketing", 100000000);
INSERT INTO departamento VALUES(5, "Diseño Gráfico", 9233974.78);
INSERT INTO departamento VALUES(6, "Salud", 8987234.99);
INSERT INTO departamento VALUES(7, "Sistemas", 7896000);
INSERT INTO departamento VALUES(8, "Arte", 4598667.96);

--Creación de empleados para hacer pruebas
INSERT INTO empleado VALUES(1, "V26555455", "Miguel", "Gozaine", "Arrieche", 3);
INSERT INTO empleado VALUES(2, "V10773189", "Marilin", "Martinez", "Polanco", 2);
INSERT INTO empleado VALUES(3, "V6275615", "Martin", "Marquez", "Anderson", 1);
INSERT INTO empleado VALUES(4, "V12364697", "Antonio", "Pereira", "Gonzalez", 5);
INSERT INTO empleado VALUES(5, "V9615188", "Orlando", "Alvarez", "Marquina", 4);
INSERT INTO empleado VALUES(6, "E80932476", "Jorge", "Dos Santos", "Dos Santos", 1);
INSERT INTO empleado VALUES(7, "V6753289", "Manuel", "Santos", "", 4);
INSERT INTO empleado VALUES(8, "E82678901", "Xiao", "Han", "", 7);
INSERT INTO empleado VALUES(9, "E50845276", "Viktor", "Lindeman", "Strauss", 8);
INSERT INTO empleado VALUES(10, "V20756990", "Nicolás", "Schurman", "LIndeman", 3);
INSERT INTO empleado VALUES(11, "V23903549", "Vanesa", "Escobar", "Sequera", 6);
INSERT INTO empleado VALUES(12, "V5672189", "Rosa", "Rivero", "Zhao", 2);
INSERT INTO empleado VALUES(13, "V23678900", "Giuseppina", "Coletti", "Gozaine", 8);

--Consulta de todos los empleados con el nombre del departamento al cual pertenecen:
SELECT empleado.*,
departamento.nombre AS nombre_departamento 
FROM empleado 
JOIN departamento ON empleado.codigo_departamento = departamento.codigo;

--Consulta de todos los empleados con el nombre del departamento, pertenecientes a los
--departamentos 001 o 003:
SELECT empleado.nif, empleado.nombre, empleado.apellido1, empleado.apellido2, 
departamento.nombre AS departamento 
FROM empleado 
JOIN departamento ON empleado.codigo_departamento = departamento.codigo
WHERE departamento.codigo = 001 OR departamento.codigo = 003;

--Consulta que muestra todos los empleados cuyo apellido comience por "P" o "R":
SELECT * FROM empleado 
WHERE apellido1 LIKE "P%" OR apellido2 LIKE "P%"
OR apellido1 LIKE "R%" OR apellido2 LIKE "R%";

--Consulta de todos los empleados cuyo departamento tiene un 
--presupuesto mayor a 10.000.000:
SELECT empleado.* FROM empleado 
LEFT JOIN departamento ON departamento.codigo = empleado.codigo_departamento
WHERE departamento.presupuesto > 10000000;

--Consulta de todos los empleados cuyo departamento tenga un presupuesto
--entre los 5.000.000 y los 15.000.000:
SELECT empleado.* FROM empleado
LEFT JOIN departamento ON departamento.codigo = empleado.codigo_departamento
WHERE departamento.presupuesto BETWEEN 5000000 AND 15000000;

--Consulta de todos los empleados cuyo nombre de departamento empiece con "S":
SELECT empleado.* FROM empleado
LEFT JOIN departamento ON departamento.codigo = empleado.codigo_departamento
WHERE departamento.nombre LIKE "S%";

--Consulta de todos los empleados cuyo apellido contenga "MAR":
SELECT * FROM empleado 
WHERE UPPER(apellido1) LIKE "%MAR%" OR UPPER(apellido2) LIKE "%MAR%";

--Consulta que muestra el código, nombre del empleado, código del departamento y
--nombre del departamento ordenado por el nombre del departamento 
--de forma descendente:
SELECT empleado.codigo AS codigo_empleado, empleado.nombre AS nombre_empleado, 
empleado.codigo_departamento, departamento.nombre AS nombre_departamento
FROM empleado
JOIN departamento ON departamento.codigo = empleado.codigo_departamento
ORDER BY departamento.nombre DESC;

--Consulta que muestra el código, nombre del empleado, apellido1, 
--código departamento y nombre del departamento ordenado por el apellido1:
SELECT empleado.codigo AS codigo_empleado, empleado.nombre AS nombre_empleado,
empleado.apellido1 AS apellido, empleado.codigo_departamento,
departamento.nombre AS nombre_departamento 
FROM empleado
JOIN departamento ON departamento.codigo = empleado.codigo_departamento
ORDER BY empleado.apellido1;

--Consulta que hace uso de LEFT JOIN:
SELECT apellido1, apellido2, departamento.nombre AS nombre_departamento
FROM empleado
LEFT JOIN departamento ON departamento.codigo = empleado.codigo_departamento;
