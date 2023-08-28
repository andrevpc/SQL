USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--Exercicios

--6) Crie uma tabela chamada Categorias com as colunas CategoriaID e Nome.
--Crie uma Stored Procedure chamada ContarCategorias que retorna o número
--total de categorias na tabela

CREATE TABLE [Categorias]
(
	CategoriaID INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(100)
)

CREATE PROCEDURE ContarCategorias
AS 
BEGIN
	SELECT COUNT(*) FROM [Categorias]
END;

INSERT INTO [Categorias] VALUES ('Categoria')

EXEC ContarCategorias