CREATE PROCEDURE grabarX @numeroBoletos int, @cantidadNumeros int, @fechaSorteo Date AS
BEGIN
DECLARE @i int SET @i = 0
DECLARE @date DATE SET @date = GETDATE()
DECLARE @n1 int, @n2 int, @n3 int, @n4 int, @n5 int, @n6 int

	WHILE @i < @numeroBoletos
	BEGIN
		SET @n1 = FLOOR(RAND()*(1-49)+1) * -1
		SET @n2 = FLOOR(RAND()*(1-49)+1) * -1
		SET @n3 = FLOOR(RAND()*(1-49)+1) * -1
		SET @n4 = FLOOR(RAND()*(1-49)+1) * -1
		SET @n5 = FLOOR(RAND()*(1-49)+1) * -1
		SET @n6 = FLOOR(RAND()*(1-49)+1) * -1

		EXEC grabarMultiple @cantidadNumeros, @fechaSorteo, @n1, @n2, @n3, @n4, @n5, @n6, null, null, null, null, null
		SET @i = @i + 1
	END

END