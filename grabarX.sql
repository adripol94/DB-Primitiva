CREATE PROCEDURE grabarX @numeroBoletos tinyint NOT NULL AS
BEGIN
DECLARE @i tinyint SET @i = 0
DECLARE @date DATE SET @date = GETDATE()
DECLARE @n1 tinyint, @n2 tinyint, @n3 tinyint, @n4 tinyint, @n5 tinyint, @n6 tinyint

	WHILE @i < @numeroBoletos
	BEGIN
		SET @n1 = RAND()*(1-49)+1
		SET @n2 = RAND()*(1-49)+1
		SET @n3 = RAND()*(1-49)+1
		SET @n4 = RAND()*(1-49)+1
		SET @n5 = RAND()*(1-49)+1
		SET @n6 = RAND()*(1-49)+1

		EXEC grabaSencilla @date, @n1, @n2, @n3, @n4, @n5, @n6
	END

END