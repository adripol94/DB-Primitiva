CREATE DATABASE Primitiva
GO
USE Primitiva
GO
CREATE TABLE  Sorteo(
S_Id smallint IDENTITY CONSTRAINT PK_IdSorteo PRIMARY KEY,
S_Fecha datetime CONSTRAINT U_SorteoFecha UNIQUE,
S_Reintegro tinyint NULL,
S_Complementario tinyint NULL
)
GO
CREATE TABLE Boleto(
B_Id smallint IDENTITY PRIMARY KEY,  -- se calcula comprobando el ultimo id de boleto en sorteo.
B_IdSorteo smallint CONSTRAINT FK_BoletoSorteo FOREIGN KEY (B_IdSorteo) REFERENCES Sorteo(S_Id),
B_Reintegro tinyint NOT NULL,
B_T_Apuesta varchar(10) not null
)
GO

CREATE TABLE Numero(
N_Numero tinyint PRIMARY KEY
)

GO
CREATE TABLE Boleto_Numero(
CONSTRAINT PK_Boleto_Numero PRIMARY KEY (BN_IdBoleto, BN_Numero_Bol, BN_IdSorteo),
BN_IdSorteo smallint not null,
BN_IdBoleto smallint not null,
BN_Numero_Bol tinyint not null,
CONSTRAINT FK_Boleto FOREIGN KEY (BN_IdBoleto) REFERENCES Boleto (B_Id),
CONSTRAINT FK_Numero_Bol FOREIGN KEY (BN_Numero_Bol) REFERENCES Numero(N_Numero),
CONSTRAINT FK_IdSorteo FOREIGN KEY (BN_IdSorteo) REFERENCES Boleto(B_IdSorteo)
)

GO
CREATE TABLE Numero_Sorteo(
CONSTRAINT PK_Numero_Sorteo PRIMARY KEY (NS_IdSorteo, NS_NumeroSorteo),
NS_IdSorteo smallint not null,
NS_NumeroSorteo tinyint not null,
CONSTRAINT FK_Sorteo FOREIGN KEY (NS_IdSorteo) REFERENCES Sorteo (S_Id),
CONSTRAINT FK_Numero_Sor FOREIGN KEY (NS_NumeroSorteo) REFERENCES Numero (N_Numero)
)