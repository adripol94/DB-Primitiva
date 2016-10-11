CREATE PROCEDURE crearSorteo @fecha Date AS
BEGIN
INSERT INTO Sorteo (S_Fecha) VALUES (@fecha)
END