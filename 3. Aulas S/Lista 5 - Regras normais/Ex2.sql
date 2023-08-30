USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--2) Cenário: Você tem uma tabela chamada "Pedidos" com os campos Número do Pedido, Código do Produto,
--Nome do Produto e Quantidade.
--Tarefa: Normalize a tabela para a 2NF.


CREATE TABLE [Produtos] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome do Produto] VARCHAR(100),
	[Código do Produto] VARCHAR(100)
)

CREATE TABLE [Pedidos] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Numero De Pedidos] INT,
	[Quantidade] INT,
	[IdProdutos] INT FOREIGN KEY REFERENCES [Produtos]([Id]),
)