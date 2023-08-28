USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--1) Sistema de Vendas

CREATE TABLE [Pedidos] (
	[PedidoID] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome do cliente] VARCHAR(100),
	[Endereço do cliente] VARCHAR(100),
	[Cidade do cliente] VARCHAR(100),
	[Data] DATE,
	[Total] DECIMAL,
	[Produto] VARCHAR(100),
	[Quantidade] INT
)