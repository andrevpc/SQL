USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--2) Cen�rio: Voc� tem uma tabela chamada "Pedidos" com os campos N�mero do Pedido, C�digo do Produto,
--Nome do Produto e Quantidade.
--Tarefa: Normalize a tabela para a 2NF.


CREATE TABLE [Produtos] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome do Produto] VARCHAR(100),
	[C�digo do Produto] VARCHAR(100)
)

CREATE TABLE [Pedidos] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Numero De Pedidos] INT,
	[Quantidade] INT,
	[IdProdutos] INT FOREIGN KEY REFERENCES [Produtos]([Id]),
)