USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--4) Crie uma tabela chamada "Clientes" com as colunas: IDCliente (int), Nome (varchar) e
--SaldoDevedor (decimal). Crie uma tabela chamada "HistoricoClientes" com as colunas: IDHistorico
--(int), IDCliente (int), DataAtualizacao (datetime) e SaldoAnterior (decimal). Crie uma trigger
--na qual a tabela “HistoricoClientes” mostre os a data da atualização e o SaldoAnterior da modificação.

CREATE TABLE [Clientes]
(
	[IDCliente] INT PRIMARY KEY IDENTITY,
	[Nome] VARCHAR(100),
	[SaldoDevedor] DECIMAL
)

CREATE TABLE [HistoricoClientes]
(
	[IDHistorico] INT PRIMARY KEY IDENTITY,
	[IDCliente] INT FOREIGN KEY REFERENCES [Clientes]([IDCliente]),
	[DataAtualizacao] DATETIME DEFAULT CURRENT_TIMESTAMP,
	[SaldoAnterior] DECIMAL
)

GO
--“HistoricoClientes” mostre os a data da atualização e o SaldoAnterior da modificação.
CREATE TRIGGER UpdateHistTrigger
ON [Clientes]
AFTER UPDATE
AS
BEGIN
	IF(UPDATE([SaldoDevedor]))
	BEGIN
		DECLARE
			@Id INT, @Saldo DECIMAL
			SELECT @Id = [IDCliente], @Saldo = [SaldoDevedor] FROM DELETED
			INSERT INTO HistoricoClientes(IDCliente, SaldoAnterior) VALUES (@Id, @Saldo)
	END
END


INSERT INTO [Clientes] VALUES ('Cliente', 10)
UPDATE [Clientes] SET SaldoDevedor = 11

SELECT * FROM [Clientes]
SELECT * FROM [HistoricoClientes]