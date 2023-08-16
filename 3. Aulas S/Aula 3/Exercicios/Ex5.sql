USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--Exercicios

--5) Crie uma tabela chamada Pedidos com as colunas PedidoID, ClienteID e DataPedido.
--Crie uma Stored Procedure chamada ExcluirPedido que recebe o ID de um pedido e exclui
--esse pedido da tabela.

CREATE TABLE [Pedidos]
(
	PedidoID INT PRIMARY KEY IDENTITY,
	ClienteID INT,
	DataPedido DATETIME DEFAULT CURRENT_TIMESTAMP
)

CREATE PROCEDURE ExcluirPedido
	@PedidoID INT
AS 
BEGIN
	DELETE FROM [Pedidos] WHERE PedidoID = @PedidoID
END;

INSERT INTO [Pedidos] VALUES (1, 1)

EXEC ExcluirPedido
	@PedidoID = 1

SELECT * FROM [Pedidos]