--10) Tipos de Documentos
--Crie uma hierarquia de tipos de documentos, como contratos, relatórios e apresentações.
--Cada tipo de documento pode ter diferentes campos e requisitos.



CREATE TABLE [Documentos] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(100)
)

CREATE TABLE [Contratos] (
	[Id] INT FOREIGN KEY REFERENCES [Documentos]([Id]),
	[Funcionário] VARCHAR(100)	
)

CREATE TABLE [Relatórios] (
	[Id] INT FOREIGN KEY REFERENCES [Documentos]([Id]),
	[Motivo] VARCHAR(100)
)

CREATE TABLE [Apresentações] (
	[Id] INT FOREIGN KEY REFERENCES [Documentos]([Id]),
	[Tema] VARCHAR(100)
)