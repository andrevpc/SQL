USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--3) Sistema de Biblioteca

CREATE TABLE [Emprestimos] (
	[ISBN] VARCHAR(100) PRIMARY KEY,
	[Titulo] VARCHAR(100),
	[Autor] VARCHAR(100),
	[Data] DATE
)