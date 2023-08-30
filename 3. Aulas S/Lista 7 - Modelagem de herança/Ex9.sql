--9) Instrumentos Musicais
--Modele uma variedade de instrumentos musicais, como guitarras, pianos e violinos.
--Pense em como lidar com os atributos específicos de cada instrumento.

CREATE TABLE [Instrumentos] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(100)
)

CREATE TABLE [Guitarras] (
	[Id] INT FOREIGN KEY REFERENCES [Instrumentos]([Id]),
	[Cordas] INT	
)

CREATE TABLE [Pianos] (
	[Id] INT FOREIGN KEY REFERENCES [Instrumentos]([Id]),
	[Peças] INT
)

CREATE TABLE [Violinos] (
	[Id] INT FOREIGN KEY REFERENCES [Instrumentos]([Id]),
	[Cordas] INT
)