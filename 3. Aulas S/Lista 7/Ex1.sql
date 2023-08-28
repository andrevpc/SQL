--1) Hierarquia de Funcion�rios
--Modele uma hierarquia de funcion�rios de uma empresa, com funcion�rios regulares e gerentes.
--Cada gerente supervisiona um grupo de funcion�rios regulares. Pense em como representar os
--atributos espec�ficos de cada tipo de funcion�rio.

CREATE TABLE [Funcion�rios] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(100)
)

CREATE TABLE [Regulares] (
	[Id] INT IDENTITY FOREIGN KEY REFERENCES [Funcion�rios]([Id]),
	[Gerente] INT FOREIGN KEY REFERENCES [Funcion�rios]([Id]),
)

CREATE TABLE [Gerentes] (
	[Id] INT IDENTITY FOREIGN KEY REFERENCES [Funcion�rios]([Id]),
	[Departamento] VARCHAR(100)
)