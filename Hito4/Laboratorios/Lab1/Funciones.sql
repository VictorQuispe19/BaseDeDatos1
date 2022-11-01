--Las funciones de agregacion se usan dentro de la clausula select en grupo de registros de devolver un unico valor que se aplica 
--a un grupo de registros, aplicado a una columna de una tabla.
CREATE DATABASE hito4_funciones;
Use hito4_funciones;
--Manejo de funciones
--Una funcion de agregacion siempre se ejecuta
--En la clausula SELECT
--Ademas siempre retorna un unico valor(Una fila)
--Es aplicado a un grupo de registros (A una columna de la tabla)
--AVG: Utilizada para calcular el promedio de los valores
--COUNT: Utilizada para devolver el numero de registros de la seleccion
--SUM: suma de todos los valores de un campo determinado
--MAX: El valor mas alto de un campo utilizado
--MIN: El valor mas bajo de un campo utilizado

--INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, genero) VALUES
--('Miguel' ,'Gonzales Veliz', 20, 2832115, 'miguel@gmail.com', 'Av. 6 de Agosto', 'masculino'),
--('Sandra' ,'Mavir Uria', 25, 2832116, 'sandra@gmail.com', 'Av. 6 de Agosto', 'femenino'),
--('Joel' ,'Adubiri Mondar', 30, 2832117, 'joel@gmail.com', 'Av. 6 de Agosto', 'masculino'),
--('Andrea' ,'Arias Ballesteros', 21, 2832118, 'andrea@gmail.com', 'Av. 6 de Agosto', 'femenino'),
--('Santos' ,'Montes Valenzuela', 24, 2832119, 'santos@gmail.com', 'Av. 6 de Agosto', 'masculino');
SELECT est.*
FROM estudiantes AS est;
--DETERMINAR Cuantos estudiantes registrados hay:

SELECT COUNT (est.id_est) AS numero_de_estudiantes
FROM estudiantes AS est
WHERE est.edad Between 21 and 29 and est.licencia_conducir=1;

SELECT COUNT (*) AS numero_de_estudiantes
FROM estudiantes AS est;

SELECT MIN (est.edad) edad_minima
FROM estudiantes as est;

SELECT MAX (est.edad) edad_maxima
FROM estudiantes as est
WHERE est.genero='masculino' or est.genero='femenino';

SELECT AVG (est.edad) prom_edad
FROM estudiantes as est;

SELECT SUM (est.edad) suma_edad
FROM estudiantes as est;

SELECT COUNT (est.id_est) AS numero_de_estudiantes
FROM estudiantes AS est
WHERE est.apellidos LIKE '%el%' AND est.genero='masculino';

SELECT COUNT(est.licencia_conducir)
FROM estudiantes as est;

SELECT COUNT (est.edad) AS numero_de_estudiantes
FROM estudiantes AS est
WHERE est.edad=20;

CREATE TABLE escuela(id_esc int identity PRIMARY KEY not null,
nombre varchar(100) not null,
direccion varchar (50) not null,
turno varchar (10) not null);


CREATE TABLE estudiantes(id_est int identity PRIMARY KEY not null,
nombres varchar (25) not null,
apellidos varchar (30) not null,
edad integer not null,
fono integer not null,
email varchar (100) not null,
direccion varchar (200) not null,
genero varchar(30) not null,
id_esc int not null,
FOREIGN KEY (id_esc) REFERENCES escuela(id_esc));
INSERT INTO escuela(nombre,direccion,turno)VALUES
('San Francisco de Asis','16 de Julio','Nocturno'),
('Mejillones','Avenida del Policia','Diurno');
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, genero,id_esc) VALUES
('Miguel' ,'Gonzales Veliz', 20, 2832115, 'miguel@gmail.com', 'Av. 6 de Agosto', 'masculino',1),
('Sandra' ,'Mavir Uria', 25, 2832116, 'sandra@gmail.com', 'Av. 6 de Agosto', 'femenino',2),
('Joel' ,'Adubiri Mondar', 30, 2832117, 'joel@gmail.com', 'Av. 6 de Agosto', 'masculino',2),
('Andrea' ,'Arias Ballesteros', 21, 2832118, 'andrea@gmail.com', 'Av. 6 de Agosto', 'femenino',1),
('Santos' ,'Montes Valenzuela', 24, 2832119, 'santos@gmail.com', 'Av. 6 de Agosto', 'masculino',2);
ALTER TABLE estudiantes ADD licencia_conducir BIT;
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, genero,id_esc,licencia_conducir) VALUES
('Ana' ,'Gonzales Veliz', 20, 2832116, 'ana@gmail.com', 'Av. 6 de Agosto', 'femenino',1,1);
INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, genero,id_esc,licencia_conducir) VALUES
('Pepito' ,'Gonzales Veliz', 20, 2832117, 'pep@gmail.com', 'Av. 6 de Agosto', 'masculino',2,0);
SELECT est.*
FROM estudiantes as est;
SELECT esc.*
FROM escuela as esc;

SELECT COUNT(est.id_est)
FROM estudiantes as est
INNER join escuela as esc ON esc.id_esc=est.id_esc
WHERE esc.id_esc=1;