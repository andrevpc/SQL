USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--2) Crie duas tabelas: "Clientes" e "LogClientes". A tabela "Clientes" deve ter as colunas:
--IDCliente (int), Nome (varchar) e SaldoDevedor (decimal). A tabela "LogClientes" deve ter
--as colunas: IDLog (int), IDCliente (int), DataHora (datetime) e Acao (varchar). Crie um
--trigger que, após a atualização do campo "SaldoDevedor" na tabela "Clientes", insira um
--registro na tabela "LogClientes" contendo o ID do cliente, a data e hora da ação, e a
--descrição da ação como 'Atualização de Saldo'.

CREATE TABLE [Clientes]
(
	[IDCliente] INT PRIMARY KEY IDENTITY,
	[Nome] VARCHAR(10),
	[SaldoDevedor] DECIMAL
)

CREATE TABLE [LogClientes]
(
	[IDLog] INT PRIMARY KEY IDENTITY,
	[IDCliente] INT,
	[DataHora] DATETIME DEFAULT CURRENT_TIMESTAMP,
	[Acao] VARCHAR(100)
)

GO

CREATE TRIGGER ClientesTrigger
	ON [Clientes]
	AFTER UPDATE
AS
BEGIN
	DECLARE
		@Id INT

	IF UPDATE (SaldoDevedor)
	BEGIN
		SELECT @Id = [IDCliente] FROM inserted
		INSERT INTO LogClientes(IDCliente, Acao) VALUES (@id, 'Atualização de Saldo')
	END
END

INSERT INTO [Clientes] VALUES ('André', 10);
UPDATE [Clientes] SET SaldoDevedor = 20 WHERE IDCliente = 1

SELECT * FROM [Clientes]
SELECT * FROM [LogClientes]