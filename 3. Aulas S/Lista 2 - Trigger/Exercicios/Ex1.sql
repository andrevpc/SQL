USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--Exercicios

--1) Crie uma tabela chamada "Pedidos" com as colunas: IDPedido (int), ValorTotal (decimal) e
--Status (varchar). Crie um trigger que, após a inserção de um novo pedido na tabela, atualize o
--campo "Status" para 'NovoPedido' e o campo "ValorTotal" seja atualizado para o dobro do valor inserido.

CREATE TABLE [Pedidos]
(
	[id] INT PRIMARY KEY IDENTITY,
	[ValorTotal] DECIMAL,
	[Status] VARCHAR(10)
)

GO

CREATE TRIGGER PedidoTrigger
	ON [Pedidos]
	AFTER INSERT
AS
BEGIN
	DECLARE
		@ValorTotal DECIMAL, @Id INT

	SELECT @ValorTotal = [ValorTotal], @Id = [id] FROM INSERTED

	UPDATE [Pedidos]
	SET [ValorTotal] = @ValorTotal * 2, [Status] = 'NovoPedido'
	WHERE [Pedidos].Id = @Id
END

INSERT INTO [Pedidos] VALUES (10, 'status');
SELECT * FROM [Pedidos]