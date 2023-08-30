--8) Plataformas de Streaming
--Crie um modelo para uma plataforma de streaming, com perfis de usuários e conteúdo.
--Alguns conteúdos são filmes, enquanto outros são séries, e eles têm diferentes categorias.

CREATE TABLE [Conteúdo] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(100),
	[Descrição] VARCHAR(MAX),
	[Escritor] VARCHAR(100)
)

CREATE TABLE [Gêneros] (
	[Id] INT FOREIGN KEY REFERENCES [Conteúdo]([Id]),
	[Gênero] VARCHAR(100)	
)

CREATE TABLE [Filmes] (
	[Id] INT FOREIGN KEY REFERENCES [Conteúdo]([Id]),
	[Duraçâo] INT
)

CREATE TABLE [Séries] (
	[Id] INT FOREIGN KEY REFERENCES [Conteúdo]([Id]),
	[Quantidade de episodios] INT
)