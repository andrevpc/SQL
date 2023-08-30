USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--4) Cenário: Você tem uma tabela chamada "Professores" com os campos Código do Professor, Disciplina,
--Sala e Horário.
--Tarefa: Normalize a tabela para a BCNF.

CREATE TABLE [Professores] (
	[Código do Professor] VARCHAR(100) PRIMARY KEY,
	[Nome] VARCHAR(100)
)

CREATE TABLE [Horário] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Horário] TIME,
	[Disciplina] VARCHAR(100),
	[Sala] VARCHAR(100),
	[Código do Professor] VARCHAR(100) FOREIGN KEY REFERENCES [Professores]([Código do Professor])
)