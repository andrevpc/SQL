USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--Exercicios

--4) Crie uma tabela chamada Funcionarios com as colunas FuncionarioID,
--Nome e Salario. Crie uma Stored Procedure chamada ListarFuncionarios
--que retorna todos os funcionários que possuem um salário maior do que
--um valor fornecido como parâmetro

CREATE TABLE [Funcionarios]
(
	FuncionarioID INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(100),
	Salario DECIMAL
)

CREATE PROCEDURE ListarFuncionarios
	@MinSalario INT
AS 
BEGIN
	SELECT * FROM [Funcionarios] WHERE Salario > @MinSalario
END;

INSERT INTO [Funcionarios] VALUES ('Nome1', 1000)
INSERT INTO [Funcionarios] VALUES ('Nome2', 2000)

EXEC ListarFuncionarios
	@MinSalario = 1500