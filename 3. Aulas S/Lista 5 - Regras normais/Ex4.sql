USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--4) Cen�rio: Voc� tem uma tabela chamada "Professores" com os campos C�digo do Professor, Disciplina,
--Sala e Hor�rio.
--Tarefa: Normalize a tabela para a BCNF.

CREATE TABLE [Professores] (
	[C�digo do Professor] VARCHAR(100) PRIMARY KEY,
	[Nome] VARCHAR(100)
)

CREATE TABLE [Hor�rio] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Hor�rio] TIME,
	[Disciplina] VARCHAR(100),
	[Sala] VARCHAR(100),
	[C�digo do Professor] VARCHAR(100) FOREIGN KEY REFERENCES [Professores]([C�digo do Professor])
)