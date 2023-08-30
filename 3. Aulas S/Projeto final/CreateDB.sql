USE master
GO

IF EXISTS(SELECT * FROM SYS.DATABASES WHERE NAME = 'Projeto')
	DROP DATABASE Projeto

CREATE DATABASE	Projeto
go

USE Projeto
GO

CREATE TABLE [Editora] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(50),
	[CNPJ] VARCHAR(14)
)

CREATE TABLE [Autor] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(50)
)

CREATE TABLE [Genero] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(50)
)

CREATE TABLE [Cliente] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(50),
	[Sobrenome] VARCHAR(50),
	[CPF] VARCHAR(50),
	[Data de Nascimento] DATE,
	[Email] VARCHAR(50),
	[Telefone] VARCHAR(100)
)

CREATE TABLE [Livro] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(50),
	[Quantidade] INT,
	[Data de lancamento] DATE,
	[Id Autor] INT FOREIGN KEY REFERENCES [Autor]([Id]),
	[Id Editora] INT FOREIGN KEY REFERENCES [Editora]([Id])
)

CREATE TABLE [LivroXGenero] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Id Livro] INT FOREIGN KEY REFERENCES [Livro]([Id]),
	[Id Genero] INT FOREIGN KEY REFERENCES [Genero]([Id])
)

CREATE TABLE [AutorXGenero] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Id Autor] INT FOREIGN KEY REFERENCES [Autor]([Id]),
	[Id Genero] INT FOREIGN KEY REFERENCES [Genero]([Id])
)

CREATE TABLE [Emprestimo] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Data que pegou] DATE,
	[Data que devolveu] DATE,
	[Data limite] DATE,
	[Id Cliente] INT FOREIGN KEY REFERENCES [Cliente]([Id]),
	[Id Livro] INT FOREIGN KEY REFERENCES [Livro]([Id]),
)

GO
CREATE TRIGGER EmprestimoTrigger
	ON [Emprestimo]
	AFTER INSERT
AS
BEGIN
	DECLARE
	@LivroId INT, @DataDevolveu DATE
	SELECT @LivroId = [Id Livro], @DataDevolveu = [Data que devolveu] FROM INSERTED
	IF @DataDevolveu IS NULL
		UPDATE [Livro] SET [Quantidade] = [Quantidade] - 1
		WHERE [Livro].[Id] = @LivroId
END

GO
CREATE TRIGGER UpdateEmprestimoTrigger
	ON [Emprestimo]
	AFTER UPDATE
AS
BEGIN
	IF(UPDATE([Data que devolveu]))
		BEGIN
			DECLARE
			@LivroId INT, @DataLimiteAntiga DATE, @DataLimiteNova DATE, @EmprestimoId INT
			SELECT @EmprestimoId = [Id], @LivroId = [Id Livro], @DataLimiteAntiga = [Data que devolveu] FROM DELETED
			SELECT @DataLimiteNova = [Data que devolveu] FROM [Emprestimo] WHERE [Id] = @EmprestimoId
			IF(@DataLimiteAntiga IS NULL AND @DataLimiteNova IS NOT NULL)
				UPDATE [Livro] SET [Quantidade] = [Quantidade] + 1 WHERE [Livro].[Id] = @LivroId
		END
END

GO
SELECT * FROM [Livro]
INSERT INTO [Emprestimo] ([Data que pegou], [Data que devolveu], [Data limite], [Id Cliente], [Id Livro])
VALUES ('2023-08-10', NULL, '2023-08-20', 1, 1)
SELECT * FROM [Emprestimo]
UPDATE [Emprestimo] SET [Data que devolveu] = '2023-08-19' WHERE [Id] = 4