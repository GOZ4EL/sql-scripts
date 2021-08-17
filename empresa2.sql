-- Trabajando sobre la base de datos creada en el archivo 'empresa.sql.' --
USING empresa;

--Consulta que muestra el código, nombre y
--la cantidad de empleados de cada departamento.
SELECT d.codigo, d.nombre, COUNT(*) AS num_empleados
FROM departamento d, empleado e
WHERE d.codigo = e.codigo_departamento
GROUP BY d.codigo;

--Consulta que muestra el código, nombre y la cantidad
--de empleados de cada departamento, donde esta última sea mayor a 5.
SELECT d.codigo, d.nombre, COUNT(*) AS num_empleados
FROM departamento d, empleado e
WHERE d.codigo = e.codigo_departamento
GROUP BY d.codigo
HAVING COUNT(*) > 5;

--Consulta que muestra el código, nombre y la cantida de empleados de cada departamento
--donde la cantidad de empleados esté entre el 1 y el 10 y
--el nombre del departamento comience con la letra c.
SELECT d.codigo, d.nombre, COUNT(*) AS num_empleados
FROM departamento d, empleado e
WHERE d.codigo = e.codigo_departamento
AND UPPER(d.nombre) LIKE "C%"
GROUP BY d.codigo
HAVING COUNT(*) BETWEEN 1 AND 10;

--Consulta donde se muestre el promedio de presupuesto de los departamentos.
SELECT ROUND(AVG(presupuesto), 2) AS promedio_presupuesto FROM departamento;

--Consulta donde se muestra el valor mínimo de presupuesto de los departamentos.
SELECT MIN(presupuesto) AS presupuesto_minimo FROM departamento;

--Consulta donde se muestra el valor m+aximo de presupuesto de los departamentos.
SELECT MAX(presupuesto) AS presupuesto_maximo FROM departamento;

--Consulta que indique el número de empleados que existe en la empresa.
SELECT COUNT(*) FROM empleado AS total_empleados;

--Consulta que muestra una lista donde se pueden visualizar los empleados que
--trabajen en los departamentos de SISTEMAS, ADMINISTRACION y CONTADURIA
SELECT e.* FROM empleado e
JOIN departamento d ON d.codigo = e.codigo_departamento
WHERE UPPER(d.nombre) IN ("SISTEMAS", "ADMINISTRACION", "CONTADURIA");

--Consulta que muestre los departamentos que tengan 
--un presupuesto entre 10000000 y 20000000.
SELECT * FROM departamento d
WHERE d.presupuesto BETWEEN 10000000 AND 20000000;

--Consulta que lista el código, nombre y apellidos (en una sola columna)
--de los empleados, nombre del departamento donde trabajan.
SELECT CONCAT('#', e.codigo, ' ', e.nombre, ' ', e.apellido1, ' ', e.apellido2, '.') 
AS "Código, nombre y apellidos de empleado",
d.nombre as nombre_departamento
FROM empleado e
JOIN departamento d ON d.codigo = e.codigo_departamento;

