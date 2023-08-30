--4) Animais e suas Caracter�sticas
--Crie um modelo para um zool�gico, onde h� diferentes tipos de animais, como mam�feros, aves e r�pteis.
--Cada tipo de animal possui caracter�sticas espec�ficas.

CREATE TABLE [Animais] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(100),
	[Patas] INT
)

CREATE TABLE [Mam�feros] (
	[Id] INT FOREIGN KEY REFERENCES [Animais]([Id]),
	[Quantidade de gl�ndulas mam�rias] VARCHAR(100)
)

CREATE TABLE [Aves] (
	[Id] INT FOREIGN KEY REFERENCES [Animais]([Id]),
	[Quantidade padr�o de ovos] INT
)

CREATE TABLE [R�pteis] (
	[Id] INT FOREIGN KEY REFERENCES [Animais]([Id]),
	[Quantidade padr�o de ovos] INT
)