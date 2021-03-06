CREATE DATABASE Primitiva
GO
USE Primitiva
GO
CREATE TABLE  Sorteo(
S_Id smallint IDENTITY CONSTRAINT PK_IdSorteo PRIMARY KEY,
S_Fecha datetime CONSTRAINT U_SorteoFecha UNIQUE,
S_Reintegro int NULL,
S_Complementario int NULL
)
GO
CREATE TABLE Boleto(
B_Id smallint IDENTITY,
B_IdSorteo smallint CONSTRAINT FK_BoletoSorteo FOREIGN KEY (B_IdSorteo) REFERENCES Sorteo(S_Id),
B_Reintegro int NOT NULL,
B_TipoApuesta bit not null, -- @IMPORTANT! Tipo BIT B_TipoApuesta 0 y 1 DONDE (0 = SENCILLA) & (1 = MULTIPLE)
CONSTRAINT PK_Boleto  PRIMARY KEY (B_Id, B_IdSorteo) --hay que reiniciar el identity del idBoleto cuando a�adamos un nuevo sorteo (Con DBCC CHECKIDENT)
)
GO
/*
CREATE TABLE Numero(
N_Numero int PRIMARY KEY
)*/

GO
CREATE TABLE Boleto_Numero(
BN_IdSorteo smallint not null,
BN_IdBoleto smallint not null,
BN_Numero_Bol int not null,
CONSTRAINT PK_Boleto_Numero PRIMARY KEY (BN_IdBoleto, BN_Numero_Bol, BN_IdSorteo),
CONSTRAINT FK_Boleto FOREIGN KEY (BN_IdBoleto, BN_IdSorteo) REFERENCES Boleto (B_Id, B_IdSorteo)

)

GO
CREATE TABLE Numero_Sorteo(
NS_IdSorteo smallint not null,
NS_NumeroSorteo int not null,
CONSTRAINT PK_Numero_Sorteo PRIMARY KEY (NS_IdSorteo, NS_NumeroSorteo),
CONSTRAINT FK_Sorteo FOREIGN KEY (NS_IdSorteo) REFERENCES Sorteo (S_Id)
)