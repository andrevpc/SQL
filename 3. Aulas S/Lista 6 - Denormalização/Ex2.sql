USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--2) Cat�logo de Produtos

CREATE TABLE [Produtos] (
	[ProdutoID] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(100),
	[Pre�o] DECIMAL,
	[Estoque] INT,
	[Categoria] VARCHAR(100)
)