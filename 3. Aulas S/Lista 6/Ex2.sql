USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--2) Catálogo de Produtos

CREATE TABLE [Produtos] (
	[ProdutoID] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(100),
	[Preço] DECIMAL,
	[Estoque] INT,
	[Categoria] VARCHAR(100)
)