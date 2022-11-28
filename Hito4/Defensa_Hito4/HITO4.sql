use defensa_hito3_unifranzitos;

CREATE TABLE BDA1(nombre varchar(50),
aula varchar(20),
gestion int);

INSERT INTO BDA1(nombre,aula,gestion)VALUES
('Juan Carlos Roque','BDA I-218',2022),
('Pedro Pascal Mamani','BDA I-218',2021);

SELECT *
FROM BDA1;

SELECT jug.nombres,eq.nombre_equipo
FROM jugador as jug
inner join equipo as eq on eq.id_equipo=jug.id_equipo
WHERE eq.id_equipo='equ-222';

SELECT COUNT(jug.id_jugador)
FROM jugador as jug;

SELECT MIN (jug.edad) edad_minima
FROM jugador as jug;

SELECT MAX (jug.edad) edad_maxima
FROM jugador as jug;

SELECT AVG (jug.edad) prom_edad
FROM jugador as jug;


SELECT CONCAT('Hola',' ','compañeros de BASE DE DATOS I');

select *
from jugador;
SELECT *
FROM equipo;
SELECT *
FROM campeonato;

--Ejercicio 1 Manejo de consultas
SELECT jug.*
FROM jugador as jug
inner join equipo as eq on eq.id_equipo=jug.id_equipo
WHERE eq.id_equipo='equ-333';

--EJercicio 2 Manejo de consultas
Create function F1_CantidadJugadores()
RETURNS INTEGER AS
BEGIN 
DECLARE @RESULT integer=0;
SELECT @RESULT=COUNT(jug.id_jugador)
FROM jugador as jug
RETURN @RESULT;
END;

SELECT dbo.F1_CantidadJugadores();

--Ejercicio 3 Manejo de consultas
Create function F2_CantidadJugadoresParam(@cat varchar(20))
RETURNS INTEGER AS
BEGIN 
DECLARE @RESULT integer=0;
SELECT @RESULT=COUNt(jug.id_jugador)
FROM jugador as jug
Inner join equipo as eq on eq.id_equipo=jug.id_equipo
WHERE eq.categoria=@cat
RETURN @RESULT;
END;

SELECT dbo.F2_CantidadJugadoresParam('VARONES') jugadores_inscritos;

--Ejercicio 4 Manejo de consultas
CREATE function F3_PromedioEdades(@cat varchar(20),@edad int)
RETURNS INTEGER AS
BEGIN 
DECLARE @RESULT integer=0;
SELECT @RESULT=AVG(jug.edad)
FROM jugador as jug
Inner join equipo as eq on eq.id_equipo=jug.id_equipo
WHERE eq.categoria=@cat and jug.edad>@edad
RETURN @RESULT;
END;

SELECT dbo.F3_PromedioEdades('MUJERES',18) jugadores_inscritos;

--Ejercicio 5 Manejo de consultas

Create FUNCTION F4_Concatitems(@char1 varchar(40),@char2 varchar(40),@char3 varchar(40))
RETURNS VARCHAR (120) AS 
BEGIN
DECLARE @RESULT VARCHAR(120);
SELECT @RESULT=concat(jug.nombres+' ',eq.nombre_equipo+' ',cam.sede)
FROM jugador as jug
inner join equipo as eq on eq.id_equipo=jug.id_equipo
inner join campeonato as cam on cam.id_campeonato=eq.id_campeonato
WHERE jug.id_jugador=@char1 and eq.id_equipo=@char2 and cam.id_campeonato=@char3
RETURN @RESULT;
END;

SELECT dbo.F4_Concatitems('jug-222','equ-222','camp-111')

--Ejercicio 6 Manejo de consultas

Create function fn_fibo(@num int)
returns varchar(255) as
begin
declare @a int, @b int,@fib int, @counter int;
declare @fstring varchar(255);
set @num = @num-2;
set @a = 0;
set @b = 1;
set @fib = 0;
set @counter = 0;
select @fstring = CASt(@a as varchar(10)) + ','
select @fstring = @fstring + CAST(@b as varchar(10));
while (@counter < @num)
begin
select @fstring = @fstring + ','
set @fib = @a + @b;
set @a = @b;
set @b = @fib;
select @fstring = @fstring + CAST(@fib as varchar(20));
set @counter = @counter + 1;
end;
Return @fstring;
END;


SELECT dbo.fn_fibo(20);