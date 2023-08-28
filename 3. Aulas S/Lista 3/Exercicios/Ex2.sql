USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--Exercicios

--1) Crie uma tabela chamada Produtos com as colunas ProdutoID, Nome e Preco. Crie
--uma Stored Procedure chamada AtualizarPrecoProduto que recebe o ID de um produto
--e um novo preço, e atualiza o preço desse produto na tabela.

CREATE TABLE [Produtos]
(
	ProdutoID INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(100),
	Preco DECIMAL
)

CREATE PROCEDURE AtualizarPrecoProduto
	@ProdutoID INT,
	@NovoPreco DECIMAL
AS 
BEGIN
	UPDATE [Produtos] SET Preco = @NovoPreco WHERE ProdutoID = @ProdutoID
END;

INSERT INTO [Produtos] VALUES ('Nome1', 1000)

EXEC AtualizarPrecoProduto
	@ProdutoID = 1,
	@NovoPreco = 1500

SELECT * FROM [Produtos]