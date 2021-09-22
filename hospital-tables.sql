CREATE DATABASE Hospital;
USE `Hospital`;
CREATE TABLE Dept (
  Dept_No int NOT NULL,
  DNombre varchar(50) NULL,
  Loc varchar(50) NULL,
  CONSTRAINT PK_Dept
    PRIMARY KEY (Dept_No)
);
CREATE TABLE Emp (
  Emp_No int NOT NULL,
  Apellido varchar(50) NULL,
  Oficio varchar(50) NULL,
  Dir int NULL,
  Fecha_Alt SMALLDATETIME NULL,
  Salario decimal(9, 2) NULL,
  Comision decimal(9, 2) NULL,
  Dept_No int NULL,
  CONSTRAINT PK_Emp
    PRIMARY KEY (Emp_No),
  CONSTRAINT FK_Emp_Dept
    FOREIGN KEY (Dept_No)
    REFERENCES Dept (Dept_No)
);
CREATE TABLE Hospital (
  Hospital_Cod int NOT NULL,
  Nombre varchar(50) NULL,
  Direccion varchar(50) NULL,
  Telefono varchar(50) NULL,
  Num_Cama int NULL,
  CONSTRAINT PK_Hospital
    PRIMARY KEY (Hospital_Cod)
);
CREATE TABLE Doctor (
  Doctor_No int NOT NULL,
  Hospital_Cod int NOT NULL,
  Apellido varchar(50) NULL,
  Especialidad varchar(50) NULL,
  CONSTRAINT PK_Doctor
    PRIMARY KEY (Doctor_No),
  CONSTRAINT FK_Doctor_Hospital
    FOREIGN KEY (Hospital_Cod)
    REFERENCES Hospital (Hospital_Cod)
);
CREATE TABLE Sala (
  Sala_Cod int NOT NULL,
  Hospital_Cod int NOT NULL,
  Nombre varchar(50) NULL,
  Num_Cama int NULL,
  CONSTRAINT PK_Sala
    PRIMARY KEY (Sala_Cod, Hospital_Cod),
  CONSTRAINT FK_Sala_Hospital
    FOREIGN KEY (Hospital_Cod)
    REFERENCES Hospital (Hospital_Cod)
);
CREATE TABLE Plantilla (
  Empleado_No int NOT NULL,
  Sala_Cod int NOT NULL,
  Hospital_Cod int NOT NULL,
  Apellido varchar(50) NULL,
  Funcion varchar(50) NULL,
  T varchar(15) NULL,
  Salario decimal(9, 2) NULL,
  CONSTRAINT PK_Plantilla
    PRIMARY KEY (Empleado_No),
  CONSTRAINT FK_Plantilla_Sala01
    FOREIGN KEY (Sala_Cod, Hospital_Cod)
    REFERENCES Sala (Sala_Cod, Hospital_Cod)
);
CREATE TABLE Enfermo (
  Inscripcion int NOT NULL,
  Apellido varchar(50) NULL,
  Direccion varchar(50) NULL,
  Fecha_Nac varchar(50) NULL,
  S varchar(2) NULL,
  NSS int NULL
);
