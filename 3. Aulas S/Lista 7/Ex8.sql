--8) Plataformas de Streaming
--Crie um modelo para uma plataforma de streaming, com perfis de usu�rios e conte�do.
--Alguns conte�dos s�o filmes, enquanto outros s�o s�ries, e eles t�m diferentes categorias.

CREATE TABLE [Conte�do] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(100),
	[Descri��o] VARCHAR(MAX),
	[Escritor] VARCHAR(100)
)

CREATE TABLE [G�neros] (
	[Id] INT FOREIGN KEY REFERENCES [Conte�do]([Id]),
	[G�nero] VARCHAR(100)	
)

CREATE TABLE [Filmes] (
	[Id] INT FOREIGN KEY REFERENCES [Conte�do]([Id]),
	[Dura��o] INT
)

CREATE TABLE [S�ries] (
	[Id] INT FOREIGN KEY REFERENCES [Conte�do]([Id]),
	[Quantidade de episodios] INT
)