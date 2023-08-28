USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--5) Cenário: Você tem uma tabela chamada "Funcionários" com os campos Número do Funcionário, Nome,
--Departamento, Projeto, Localização do Projeto e Habilidades.
--Tarefa: Normalize a tabela para 1NF, 2NF, 3NF e BCNF, se aplicável.

CREATE TABLE [Funcionários] (
	[Número do Funcionário] INT PRIMARY KEY,
	[Nome] VARCHAR(100)
)

CREATE TABLE [Departamento] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Departamento] VARCHAR(100),
	[Número do Funcionário] INT FOREIGN KEY REFERENCES [Funcionários]([Número do Funcionário])
)

CREATE TABLE [Projeto] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Projeto] VARCHAR(100),
	[Localização do Projeto] VARCHAR(100),
	[Número do Funcionário] INT FOREIGN KEY REFERENCES [Funcionários]([Número do Funcionário])
)

CREATE TABLE [Habilidades] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Habilidades] VARCHAR(100),
	[Número do Funcionário] INT FOREIGN KEY REFERENCES [Funcionários]([Número do Funcionário])
)