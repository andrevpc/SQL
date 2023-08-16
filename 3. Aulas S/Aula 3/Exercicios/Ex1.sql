USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--Exercicios

--1) Crie uma tabela chamada Clientes com as colunas ClienteID, Nome e Email.
--Em seguida, crie uma Stored Procedure chamada InserirCliente que recebe
--parâmetros para nome e email, e insere um novo cliente na tabela

CREATE TABLE [Clientes]
(
	ClienteID INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(100),
	Email VARCHAR(100)
)

CREATE PROCEDURE InserirCliente
	@Nome VARCHAR(100),
	@Email VARCHAR(100)
AS 
BEGIN
	INSERT INTO [Clientes] VALUES (@Nome, @Email)
END;

EXEC InserirCliente
	@Nome = 'Nome',
	@Email = 'Email'

SELECT * FROM [Clientes]