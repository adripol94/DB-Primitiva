USE Primitiva
GO

-- Funcion Validará la fecha del boleto respecto al sorteo 
-- que devolverá un bit (0 o 1) DONDE (0 = FALSE) & (1 = TRUE)
-- @PARAM Idsorteo Id del Sorteo a validar
-- @RETURN out BIT Devolvera 0 si queda 1 hora para el sorteo y 1 en caso contrario
CREATE PROCEDURE isInTime @IdSorteo smallint, @out bit OUTPUT AS
BEGIN

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

RETURN
END

GO
-- Procedimiento para añadir un boleto y sus 6 numeros
-- @PARAM Sorteo DATE fecha del sorteo;
-- @PARAM numero1-6 numero del sorteo
CREATE PROCEDURE grabaSencilla @fecha_Sorteo DATE, @numero1 int, @numero2 int, 
@numero3 int, @numero4 int, @numero5 int, @numero6 int AS

DECLARE @IdBoletoInsertado smallint
DECLARE @reintegro int SET @reintegro = FLOOR(RAND()*(0-9)+0)
DECLARE @Id_Sorteo smallint SET @Id_Sorteo = (SELECT S_id FROM Sorteo WHERE S_Fecha = @fecha_Sorteo)

BEGIN
DECLARE @salida bit
EXEC dbo.isInTime @Id_Sorteo, @salida

IF @salida = 1
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


go
CREATE PROCEDURE grabar5 @1 int , @2 int ,
@3 int , @4 int , @5 int , @Id_sorteo smallint, @IdBoletoInsertado smallint AS
BEGIN
	INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado, @Id_sorteo ,@1)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@2)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@3)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@4)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@5)
END

go
CREATE PROCEDURE grabar7 @1 int , @2 int ,
@3 int , @4 int , @5 int , @6 int , @7 int ,
@Id_sorteo smallint, @IdBoletoInsertado smallint AS
BEGIN
	INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado, @Id_sorteo ,@1)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@2)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@3)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@4)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@5)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@6)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@7)
END

go
CREATE PROCEDURE grabar8 @1 int , @2 int ,
@3 int , @4 int , @5 int , @6 int , @7 int , 
@8 int , @Id_sorteo smallint, @IdBoletoInsertado smallint AS
BEGIN
	INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado, @Id_sorteo ,@1)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@2)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@3)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@4)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@5)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@6)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@7)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@8)
END

go
CREATE PROCEDURE grabar9 @1 int , @2 int ,
@3 int , @4 int , @5 int , @6 int , @7 int , 
@8 int , @9 int , @Id_sorteo smallint, @IdBoletoInsertado smallint AS
BEGIN
	INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado, @Id_sorteo ,@1)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@2)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@3)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@4)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@5)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@6)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@7)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@8)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@9)
END

go
CREATE PROCEDURE grabar10 @1 int , @2 int ,
@3 int , @4 int , @5 int , @6 int , @7 int , 
@8 int , @9 int , @10 int , @Id_sorteo smallint, @IdBoletoInsertado smallint AS
BEGIN
	INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado, @Id_sorteo ,@1)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@2)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@3)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@4)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@5)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@6)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@7)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@8)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@9)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@10)
END

go
CREATE PROCEDURE grabar11 @1 int , @2 int ,
@3 int , @4 int , @5 int , @6 int , @7 int , 
@8 int , @9 int , @10 int , @11 int , 
@Id_sorteo smallint, @IdBoletoInsertado smallint AS
BEGIN
	INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado, @Id_sorteo ,@1)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@2)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@3)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@4)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@5)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@6)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@7)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@8)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@9)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@10)
		INSERT INTO Boleto_Numero VALUES (@IdBoletoInsertado,@Id_sorteo ,@11)
END

go

-- Hay que crear un procedimiento por cantidad de numeros insertados!!!! TODO

CREATE PROCEDURE grabarMultiple @cantidadNumero int , @Fecha_sorteo DATE , 
@1 int , @2 int , @3 int , @4 int , @5 int ,
@6 int NULL, @7 int NULL, @8 int NULL, @9 int NULL, @10 int NULL, @11 int NULL AS
BEGIN
DECLARE @contador smallint
DECLARE @IdBoletoInsertado smallint
DECLARE @reintegro int 
DECLARE @Id_Sorteo smallint 

	IF @cantidadNumero = 6
		EXEC dbo.grabaSencilla @Fecha_sorteo, @1, @2, @3, @4, @5, @6
	ELSE
		BEGIN
		
		SET @reintegro = FLOOR(RAND()*(0-9)+0)
		SET @Id_Sorteo = (SELECT S_id FROM Sorteo WHERE S_Fecha = @fecha_Sorteo)

		INSERT INTO Boleto (B_IdSorteo, B_Reintegro ,B_TipoApuesta) VALUES (@Id_sorteo, @reintegro, 0)
		SET @IdBoletoInsertado= IDENT_CURRENT('Boleto')	

		IF @cantidadNumero = 5
			EXEC grabar5 @1, @2, @3, @4, @5, @Id_sorteo, @IdBoletoInsertado
		ELSE
			BEGIN
				IF @cantidadNumero = 7
					EXEC grabar7 @1, @2, @3, @4, @5, @6, @7, @Id_sorteo, @IdBoletoInsertado
				ELSE
				BEGIN
					IF @cantidadNumero = 8
						EXEC grabar8 @1, @2, @3, @4, @5, @6, @7, @8, @Id_sorteo, @IdBoletoInsertado
					ELSE
					BEGIN
						IF @cantidadNumero = 9
							EXEC grabar9 @1, @2, @3, @4, @5, @6, @7, @8, @9, @Id_sorteo, @IdBoletoInsertado
						ELSE
						BEGIN
							IF @cantidadNumero = 10
								EXEC grabar10 @1, @2, @3, @4, @5, @6, @7, @8, @9, @10, @Id_sorteo, @IdBoletoInsertado
							ELSE
							BEGIN
								IF @cantidadNumero = 11
									EXEC grabar11 @1, @2, @3, @4, @5, @6, @7, @8, @9, @10,@11, @Id_sorteo, @IdBoletoInsertado
							END
						END
					END
				END 
			END


		END
END

