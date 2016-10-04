USE [Primitiva]
GO
/****** Object:  StoredProcedure [dbo].[rellenarTablaNumero]    Script Date: 30/09/2016 12:46:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[rellenarTablaNumero] AS

	DECLARE @i int, @limite tinyint
	SET @i = 1
	SET @limite = 49  
BEGIN
	WHILE @i <= @limite
	BEGIN
		INSERT INTO dbo.Numero (N_Numero) VALUES (@i)
		SET @i = @i + 1
	END
END
