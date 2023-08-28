--4) Animais e suas Características
--Crie um modelo para um zoológico, onde há diferentes tipos de animais, como mamíferos, aves e répteis.
--Cada tipo de animal possui características específicas.

CREATE TABLE [Animais] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(100),
	[Patas] INT
)

CREATE TABLE [Mamíferos] (
	[Id] INT FOREIGN KEY REFERENCES [Animais]([Id]),
	[Quantidade de glândulas mamárias] VARCHAR(100)
)

CREATE TABLE [Aves] (
	[Id] INT FOREIGN KEY REFERENCES [Animais]([Id]),
	[Quantidade padrão de ovos] INT
)

CREATE TABLE [Répteis] (
	[Id] INT FOREIGN KEY REFERENCES [Animais]([Id]),
	[Quantidade padrão de ovos] INT
)