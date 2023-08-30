--7) Mídias de Entretenimento
--Modele diferentes tipos de mídias de entretenimento, como filmes, séries e jogos.
--Considere como lidar com os atributos exclusivos de cada tipo de mídia.


CREATE TABLE [Entretenimento] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(100),
	[Descrição] VARCHAR(MAX),
	[Escritor] VARCHAR(100),
	[Estudio] VARCHAR(100)
)

CREATE TABLE [Gêneros] (
	[Id] INT FOREIGN KEY REFERENCES [Entretenimento]([Id]),
	[Gênero] VARCHAR(100)	
)

CREATE TABLE [Filmes] (
	[Id] INT FOREIGN KEY REFERENCES [Entretenimento]([Id]),
	[Diretor] VARCHAR(100)	
)

CREATE TABLE [Séries] (
	[Id] INT FOREIGN KEY REFERENCES [Entretenimento]([Id]),
	[Diretor] VARCHAR(100)
)

CREATE TABLE [Jogos] (
	[Produtora] VARCHAR(100),
	[Desenvolvedora] VARCHAR(100)
)