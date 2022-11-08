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

--ALTER TABLE estudiantes ADD licencia_conducir BIT;
--INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, genero,id_esc,licencia_conducir) VALUES
--('Ana' ,'Gonzales Veliz', 20, 2832116, 'ana@gmail.com', 'Av. 6 de Agosto', 'femenino',1,1);
--INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, genero,id_esc,licencia_conducir) VALUES
--('Pepito' ,'Gonzales Veliz', 20, 2832117, 'pep@gmail.com', 'Av. 6 de Agosto', 'masculino',2,0);

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

SELECT COUNT(est.id_est) estudiantes_con_licencia
FROM estudiantes as est
WHERE est.licencia_conducir=1;

SELECT COUNT (est.id_est) AS numero_de_estudiantes
FROM estudiantes AS est
WHERE est.edad<20 and est.licencia_conducir=0;

CREATE TABLE escuela(id_esc int identity PRIMARY KEY not null,
nombre varchar(100) not null,
direccion varchar (50) not null,
turno varchar (50) not null);

CREATE TABLE estudiantes(id_est int identity PRIMARY KEY not null,
nombres varchar (25) not null,
apellidos varchar (30) not null,
edad integer not null,
fono integer not null,
email varchar (100) not null,
direccion varchar (200) not null,
genero varchar(30) not null,
id_esc int not null,
licencia_conducir bit not null,
FOREIGN KEY (id_esc) REFERENCES escuela(id_esc));

INSERT INTO escuela(nombre,direccion,turno)VALUES
('San Simon','Cochabamba','manana'),
('Andres Bello','El Alto','manana-tarde'),
('Amor de Dios Fe y Alegria','El Alto','manana-tarde'),
('Don Bosco','La Paz','manana-tarde-noche');

INSERT INTO estudiantes (nombres, apellidos, edad, fono, email, direccion, genero,id_esc,licencia_conducir) VALUES
('Miguel' ,'Gonzales Veliz', 20, 2832115, 'miguel@gmail.com', 'Av. 6 de Agosto', 'masculino',1,0),
('Sandra' ,'Mavir Uria', 25, 2832116, 'sandra@gmail.com', 'Av. 6 de Agosto', 'femenino',2,0),
('Joel' ,'Adubiri Mondar', 30, 2832117, 'joel@gmail.com', 'Av. 6 de Agosto', 'masculino',3,0),
('Andrea' ,'Arias Ballesteros', 21, 2832118, 'andrea@gmail.com', 'Av. 6 de Agosto', 'femenino',4,0),
('Santos' ,'Montes Valenzuela', 24, 2832119, 'santos@gmail.com', 'Av. 6 de Agosto', 'masculino',1,0),
('Ana' ,'Gonzales Veliz', 20, 2832116, 'ana@gmail.com', 'Av. 6 de Agosto', 'femenino',2,1),
('Pepito' ,'Gonzales Veliz', 20, 2832117, 'pep@gmail.com', 'Av. 6 de Agosto', 'masculino',3,0);

SELECT est.*
FROM estudiantes as est;
SELECT esc.*
FROM escuela as esc;


SELECT COUNT(est.id_est) estudiantes_escuela
FROM estudiantes as est
INNER join escuela as esc ON esc.id_esc=est.id_esc
WHERE esc.nombre='Amor de Dios Fe y Alegria';

SELECT COUNT(est.id_est) estudiantes_escuela
FROM estudiantes as est
INNER join escuela as esc ON esc.id_esc=est.id_esc
WHERE est.edad>25 and esc.turno LIKE '%tarde%';

--Funciones en SQL creadas por el usuraio

CREATE FUNCTION retorna_nombre_materias()
 RETURNS Varchar(20) AS
 BEGIN
 RETURN 'Base De Datos I'

 END;
 SELECT dbo.retorna_nombre_materias() AS DBA_I;
 SELECT dbo.retorna_nombre_materia_v2() AS DBA;

 SELECT dbo.retorna_nombre_materia_v3('Base De Datos II') AS DBA;

 --SI quieres cambiar valores con ALTER O DROP

 ALTER FUNCTION retorna_nombre_materia_v2()
 RETURNS VARCHAR (25) AS
 BEGIN
 Declare @nombre VARCHAR(25);
 SET @nombre='Base De Datos III';
 return @nombre;
 END;

 CREATE FUNCTION retorna_nombre_materia_v3(@nombreMateria VARCHAR (25))
 RETURNS VARCHAR (25) AS
 BEGIN
	DECLARE @nombre VARCHAR(25);
	SET @nombre=@nombreMateria;
	RETURN @nombre;
 END;

  Create FUNCTION nombre_completo(@nombre VARCHAR(25),@apellidos VARCHAR(25))
 RETURNS VARCHAR (100) AS
 BEGIN
	DECLARE @nombre_completo VARCHAR (100);
	SET @nombre_completo=@nombre+' '+@apellidos;
	RETURN @nombre_completo;
 END;

 SELECT dbo.nombre_completo('Victor Hugo','Quispe Torrez') AS nombre_completo;
  
CREATE FUNCTION suma_tres_numeros(@num1 INTEGER, @num2 INTEGER,@num3 Integer)
 RETURNS INTEGER AS
 BEGIN
   DECLARE @respuesta INTEGER;
   SET @respuesta = @num1 + @num2 + @num3;

   RETURN @respuesta;
 END;
 SELECT dbo.suma_tres_numeros(11,4,7) AS suma;
 
 CREATE FUNCTION suma_dos_numeros()
 RETURNS INTEGER AS
 BEGIN
   DECLARE @respuesta INTEGER;
   SET @respuesta = 25+40;

   RETURN @respuesta;
 END;

 SELECT dbo.suma_dos_numeros() AS suma;

 --CREATE FUNCTION suma_tres_numeros(@num1 INTEGER, @num2 INTEGER,@accion Varchar(20))
 --RETURNS INTEGER AS
 --BEGIN
 --  DECLARE @respuesta INTEGER;
   --IF @accion='sumar'
   --SET @respuesta = @num1 + @num2 + @num3;

   --RETURN @respuesta;
 --END;
 --Accion es sumar RETORNAR LA suma de los numeros
 --Accion es restar retornar la resta de los numeros