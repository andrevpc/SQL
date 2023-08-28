USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--1) Cenário: Você tem uma tabela chamada “Clientes” com os campos Nome, Telefone, e Lista de Produtos
--Comprados (armazenando uma lista separada por vírgula)
--Tarefa: Normalizar a tabela para a 1NF.


CREATE TABLE [Clientes] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(100),
	[Telefone] VARCHAR(100)
)

CREATE TABLE [Produtos] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Produtos] VARCHAR(100),
	[IdClientes] INT FOREIGN KEY REFERENCES [Clientes]([Id]),
)