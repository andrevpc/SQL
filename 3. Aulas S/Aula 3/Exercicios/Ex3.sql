USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--Exercicios

--3) Crie uma tabela chamada Notas com as colunas AlunoID, Materia e Nota. Crie uma
--Stored Procedure chamada CalcularMediaAluno que recebe o ID de um aluno e calcula
--a média das notas desse aluno em todas as matérias

CREATE TABLE [Notas]
(
	AlunoID INT,
	Materia VARCHAR(100),
	Nota FLOAT
)

CREATE PROCEDURE CalcularMediaAluno
	@AlunoID INT
AS 
BEGIN
	SELECT AVG(Nota) FROM Notas WHERE AlunoID = @AlunoID
END;

INSERT INTO NOTAS VALUES (1, 'Calculo 3', 9)
INSERT INTO NOTAS VALUES (1, 'Fisica 3', 7)

EXEC CalcularMediaAluno
	@AlunoID = 1