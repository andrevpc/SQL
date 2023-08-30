USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--5) Cen�rio: Voc� tem uma tabela chamada "Funcion�rios" com os campos N�mero do Funcion�rio, Nome,
--Departamento, Projeto, Localiza��o do Projeto e Habilidades.
--Tarefa: Normalize a tabela para 1NF, 2NF, 3NF e BCNF, se aplic�vel.

CREATE TABLE [Funcion�rios] (
	[N�mero do Funcion�rio] INT PRIMARY KEY,
	[Nome] VARCHAR(100)
)

CREATE TABLE [Departamento] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Departamento] VARCHAR(100),
	[N�mero do Funcion�rio] INT FOREIGN KEY REFERENCES [Funcion�rios]([N�mero do Funcion�rio])
)

CREATE TABLE [Projeto] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Projeto] VARCHAR(100),
	[Localiza��o do Projeto] VARCHAR(100),
	[N�mero do Funcion�rio] INT FOREIGN KEY REFERENCES [Funcion�rios]([N�mero do Funcion�rio])
)

CREATE TABLE [Habilidades] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Habilidades] VARCHAR(100),
	[N�mero do Funcion�rio] INT FOREIGN KEY REFERENCES [Funcion�rios]([N�mero do Funcion�rio])
)