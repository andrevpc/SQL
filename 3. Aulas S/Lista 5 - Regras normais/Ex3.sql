USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--3) Cen�rio: Voc� tem uma tabela chamada "Livros" com os campos ISBN, T�tulo, Editora e Nome do Autor.
--Tarefa: Normalize a tabela para a 3NF.

CREATE TABLE [Livros] (
	[ISBN] VARCHAR(100) PRIMARY KEY,
	[T�tulo] VARCHAR(100),
	[Nome do Autor] VARCHAR(100)
)

CREATE TABLE [Editora] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Editora] VARCHAR(100),
	[ISBN] VARCHAR(100) FOREIGN KEY REFERENCES [Livros]([ISBN])
)