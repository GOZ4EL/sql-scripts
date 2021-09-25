-- Mostrar el número de empleado, el apellido y la fecha de alta
-- del empleado más antiguo de la empresa.
SELECT Emp_No, Apellido, Fecha_Alt FROM Emp 
WHERE Fecha_Alt 
IN (SELECT MIN(Fecha_Alt) FROM Emp);

-- Mostrar el número de empleado, el apellido y la fecha de alta
-- del empleado más moderno de la empresa.
SELECT Emp_No, Apellido, Fecha_Alt FROM Emp 
WHERE Fecha_Alt 
IN (SELECT MAX(Fecha_Alt) FROM Emp);

-- Queremos saber el apellido, oficio, salario y numero de departamento
-- de los empleados con salario mayor que el mejor salario del departamento 30.
SELECT Apellido, Oficio, Salario, Dept_No FROM Emp
WHERE Salario > (
	SELECT MAX(Salario) FROM Emp e 
	JOIN Dept d ON e.Dept_No = d.Dept_No
	WHERE d.Dept_No = 30
);

-- Mostrar el apellido, la función, sala o departamento 
-- de todos los empleados que trabajen en la empresa.
SELECT e.Apellido, e.Oficio AS "Función", 
	   d.DNombre AS "Sala o departamento" FROM Emp e
JOIN Dept d ON e.Dept_No = d.Dept_No
UNION  
SELECT p.Apellido, p.Funcion, s.Nombre FROM Plantilla p
JOIN Sala s ON s.Sala_Cod = p.Sala_Cod;

-- Averiguar el salario de todos los empleados de la empresa,
-- de forma que se aprecien las diferencias entre ellos.
SELECT e.Apellido, e.Oficio AS "Función", e.Salario,
	   d.DNombre AS "Sala o departamento" FROM Emp e
JOIN Dept d ON e.Dept_No = d.Dept_No
UNION  
SELECT p.Apellido, p.Funcion, p.Salario, s.Nombre FROM Plantilla p
JOIN Sala s ON s.Sala_Cod = p.Sala_Cod;

-- Mostrar apellidos y oficio de los empleados del departamento 20
-- cuyo trabajo sea el mismo que el de cualquier empleado de ventas.
SELECT e.Apellido, e.Oficio FROM Emp e
JOIN Dept d ON e.Dept_No = d.Dept_No
WHERE d.Dept_No = 20
AND e.Oficio IN(
	SELECT e.Oficio FROM Emp e
	JOIN Dept d ON e.Dept_No = d.Dept_No
	WHERE UPPER(d.DNombre) = UPPER("ventas")
);

-- Mostrar los empleados que tienen mejor salario que la media 
-- de los directores, no incluyendo al presidente.
SELECT Apellido, Oficio, Salario FROM Emp 
WHERE Salario > (
	SELECT AVG(Salario) FROM Emp 
	WHERE UPPER(Oficio) = UPPER("Director")
)
AND UPPER(Oficio) != UPPER("Presidente");

-- Mostrar el apellido, función, salario y código de hospital
-- de los empleados de la platinlla que siendo enfermeros
-- o enfermeras pertenecen al hospital SAN CARLOS.
SELECT p.Apellido, p.Funcion, p.Salario, p.Hospital_Cod FROM Plantilla p
JOIN Hospital h ON p.Hospital_Cod = h.Hospital_Cod
WHERE UPPER(p.funcion) LIKE UPPER("Enfermer%")
AND UPPER(h.Nombre) = UPPER("San Carlos");

-- Visualizar los datos de los hospitales que tienen personal 
-- (Doctores) en cardiología.
SELECT h.* FROM Hospital h 
JOIN Doctor d ON h.Hospital_Cod = d.Hospital_Cod
WHERE UPPER(d.Especialidad) LIKE UPPER("Cardiolog_a");

-- Visualizar el salario anual de los empleados de 
-- la plantilla del hospital Provincial y General
SELECT p.Apellido, 
	   (p.Salario * 12) AS "Salario Anual", 
	   h.Nombre AS "Hospital"
FROM Plantilla p
JOIN Hospital h ON p.Hospital_Cod = h.Hospital_Cod 
WHERE UPPER(h.Nombre) = UPPER("Provincial")
OR UPPER(h.Nombre) = UPPER("General");
