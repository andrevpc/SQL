--1) Hierarquia de Funcionários
--Modele uma hierarquia de funcionários de uma empresa, com funcionários regulares e gerentes.
--Cada gerente supervisiona um grupo de funcionários regulares. Pense em como representar os
--atributos específicos de cada tipo de funcionário.

CREATE TABLE [Funcionários] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(100)
)

CREATE TABLE [Regulares] (
	[Id] INT IDENTITY FOREIGN KEY REFERENCES [Funcionários]([Id]),
	[Gerente] INT FOREIGN KEY REFERENCES [Funcionários]([Id]),
)

CREATE TABLE [Gerentes] (
	[Id] INT IDENTITY FOREIGN KEY REFERENCES [Funcionários]([Id]),
	[Departamento] VARCHAR(100)
)