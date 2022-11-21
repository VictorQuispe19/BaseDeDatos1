use hito4_funciones;

create function menor_numeros()
returns INTEGER AS
BEGIN
DECLARE @min integer=0;
SET
RETURN
END;
ALTER function calculadora(@numero1 integer, @numero2 integer, @accion varchar(20))
returns INTEGER as
begin
declare @resultado INTEGER;
if (@accion = 'Sumar') 
BEGIN
set @resultado = @numero1 + @numero2; 
END;
if @accion = 'Restar'
BEGIN
set @resultado = @numero1 - @numero2;
END;
if @accion = 'Multiplicar'
BEGIN
set @resultado = @numero1 * @numero2;
END;
if @accion = 'Dividir' 
BEGIN
set @resultado = @numero1/@numero2;
END;
return (@resultado);  
end;

SELECT dbo.calculadora_v2(160,8,'RESTAR') Resutado;

Alter function calculadora_v2(@numero1 integer, @numero2 integer, @accion varchar(20))
returns INTEGER as
begin
if (@accion = 'Sumar') 
Return @numero1 + @numero2; 
if (@accion = 'Restar')
RETURN @numero1 - @numero2;
if (@accion = 'Multiplicar')
RETURN  @numero1 * @numero2;
if (@accion = 'Dividir') 
RETURN @numero1/@numero2;  
RETURN 1;
end;

SELECT est.*
FROM estudiantes as est;
SELECT esc.*
FROM escuela as esc;

SELECT COUNt(est.id_est)
FROM estudiantes as est
WHERE est.edad>25;
--CREAR UNA FUNCION QUE PERMITA SABER lA CANTIDAD DE ESTUDIANTES MAYORES A CIERTA EDAD
--Y QUE RECIBA UN PARAMETRO

CREATE FUNCTION mayores_edad(@edad INTEGER)
RETURNS INTEGER AS
BEGIN 
DECLARE @RESULT integer=0;

SELECT @RESULT=COUNt(est.id_est)
FROM estudiantes as est
WHERE est.edad > @edad;
RETURN @RESULT;
END;

SELECT dbo.mayores_edad(20) Resutado;


Alter FUNCTION mayores_edad_v2(@edad INTEGER,@genero VARCHAR(15))
RETURNS INTEGER AS
BEGIN 
DECLARE @RESULT integer=0;

SELECT @RESULT=COUNT(est.id_est) 
FROM estudiantes as est
INNER JOIN escuela as esc on esc.id_esc=est.id_esc
WHERE est.edad > @edad and est.genero=@genero AND esc.nombre='ANDRES BELLO';
RETURN @RESULT;
END;

SELECT dbo.mayores_edad_v2(20,'FEMENINO') Resutado;

CREATE FUNCTION Maximo()
RETURNS INTEGER AS
BEGIN 
DECLARE @RESULT integer=0;
SELECT @RESULT=MAX(est.id_est)
FROM estudiantes as est
RETURN @RESULT;
END;

SELECT dbo.Maximo();

CREATE FUNCTION minimo()
RETURNS INTEGER AS
BEGIN 
DECLARE @RESULT integer=0;
SELECT @RESULT=MIN(est.id_est)
FROM estudiantes as est
RETURN @RESULT;
END;

SELECT dbo.minimo();

SELECT est.*
FROM estudiantes as est
WHERE est.id_est=dbo.minimo();

SELECT est.*
FROM estudiantes as est
WHERE est.id_est=dbo.Maximo();

CREATE FUNCTION promedio()
RETURNS INTEGER AS
BEGIN
DECLARE @result integer =0;
SELECT @result=AVG(est.edad) 
FROM estudiantes as est;

RETURN @result;
END;

SELECT dbo.promedio();