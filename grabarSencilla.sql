USE Primitiva
GO

-- Procedimiento para añadir un boleto y sus 6 numeros
-- @PARAM Sorteo DATE fecha del sorteo;
-- @PARAM numero1-6 numero del sorteo
CREATE PROCEDURE grabaSencilla @fecha_Sorteo DATE, @numero1 tinyint, @numero2 tinyint, 
@numero3 tinyint, @numero4 tinyint, @numero5 tinyint, @numero6 tinyint AS

DECLARE @IdBoletoInsertado smallint
DECLARE @reintegro tinyint SET @reintegro = RAND()*(0-9)+0
DECLARE @Id_Sorteo smallint SET @Id_Sorteo = (SELECT S_id FROM Sorteo WHERE S_Fecha = @fecha_Sorteo)

BEGIN

	IF isInTime(@Id_Sorteo) = 1
	BEGIN
		INSERT INTO Boleto (B_IdSorteo, B_Reintegro ,B_TipoApuesta) VALUES (@Id_sorteo, @reintegro, 0)
		SET @IdBoletoInsertado= IDENT_CURRENT('Boleto')
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado, @Id_sorteo ,@numero1)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@numero2)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@numero3)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@numero4)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@numero5)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@numero6)
	END
END

GO
-- Funcion Validará la fecha del boleto respecto al sorteo 
-- que devolverá un bit (0 o 1) DONDE (0 = FALSE) & (1 = TRUE)
-- @PARAM Idsorteo Id del Sorteo a validar
-- @RETURN out BIT Devolvera 0 si queda 1 hora para el sorteo y 1 en caso contrario
CREATE FUNCTION isInTime(@IdSorteo smallint)
RETURNS bit AS
BEGIN

DECLARE @out bit
DECLARE @fechaActual Date SET @fechaActual = GETDATE()
DECLARE @fechaSorteo Date SET @fechaSorteo = (SELECT S_Fecha FROM Sorteo WHERE S_Id = @IdSorteo)

IF DATEPART(day, @fechaActual) = DATEPART(day, @fechaSorteo)
	BEGIN
		IF DATEPART(hour, @fechaActual) > DATEPART(hour, @fechaSorteo)
				SET @out = 0
			ELSE
				SET @out = 1
	END
ELSE
	SET @out = 1;

RETURN @out
END