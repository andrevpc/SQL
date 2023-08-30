--10) Tipos de Documentos
--Crie uma hierarquia de tipos de documentos, como contratos, relat�rios e apresenta��es.
--Cada tipo de documento pode ter diferentes campos e requisitos.



CREATE TABLE [Documentos] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(100)
)

CREATE TABLE [Contratos] (
	[Id] INT FOREIGN KEY REFERENCES [Documentos]([Id]),
	[Funcion�rio] VARCHAR(100)	
)

CREATE TABLE [Relat�rios] (
	[Id] INT FOREIGN KEY REFERENCES [Documentos]([Id]),
	[Motivo] VARCHAR(100)
)

CREATE TABLE [Apresenta��es] (
	[Id] INT FOREIGN KEY REFERENCES [Documentos]([Id]),
	[Tema] VARCHAR(100)
)