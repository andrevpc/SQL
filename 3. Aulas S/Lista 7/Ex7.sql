--7) M�dias de Entretenimento
--Modele diferentes tipos de m�dias de entretenimento, como filmes, s�ries e jogos.
--Considere como lidar com os atributos exclusivos de cada tipo de m�dia.


CREATE TABLE [Entretenimento] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(100),
	[Descri��o] VARCHAR(MAX),
	[Escritor] VARCHAR(100),
	[Estudio] VARCHAR(100)
)

CREATE TABLE [G�neros] (
	[Id] INT FOREIGN KEY REFERENCES [Entretenimento]([Id]),
	[G�nero] VARCHAR(100)	
)

CREATE TABLE [Filmes] (
	[Id] INT FOREIGN KEY REFERENCES [Entretenimento]([Id]),
	[Diretor] VARCHAR(100)	
)

CREATE TABLE [S�ries] (
	[Id] INT FOREIGN KEY REFERENCES [Entretenimento]([Id]),
	[Diretor] VARCHAR(100)
)

CREATE TABLE [Jogos] (
	[Produtora] VARCHAR(100),
	[Desenvolvedora] VARCHAR(100)
)