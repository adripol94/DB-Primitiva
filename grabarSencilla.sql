USE Primitiva
GO

CREATE PROCEDURE grabaSencilla @sorteo smallint, @numero1 tinyint, @numero2 tinyint, 
@numero3 tinyint, @numero4 tinyint, @numero5 tinyint, @numero6 tinyint AS

DECLARE @IdBoletoInsertado smallint
DECLARE @reintegro tinyint SET @reintegro = RAND()*(0-9)+0

BEGIN

	INSERT INTO Boleto (B_IdSorteo, B_Reintegro ,B_TipoApuesta) VALUES (@sorteo, @reintegro, 'Sencilla')
	SET @IdBoletoInsertado= IDENT_CURRENT('Boleto')
	INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado, @sorteo ,@numero1)
	INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@sorteo ,@numero2)
	INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@sorteo ,@numero3)
	INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@sorteo ,@numero4)
	INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@sorteo ,@numero5)
	INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@sorteo ,@numero6)
END

GO
CREATE FUNCTION isInTime()
RETURNS bit AS
BEGIN
-- TODO
RETURN 1
END