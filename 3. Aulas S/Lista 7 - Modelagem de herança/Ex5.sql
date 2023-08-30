-- 5) Usu�rios e Admins em um Sistema
--Modele um sistema de gerenciamento com usu�rios normais e administradores. Os administradores
--t�m permiss�es adicionais que os usu�rios normais n�o possuem.

CREATE TABLE [Usu�rios] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(100)
)

CREATE TABLE [Normais] (
	[Id] INT FOREIGN KEY REFERENCES [Usu�rios]([Id])
)

CREATE TABLE [Administradores] (
	[Id] INT FOREIGN KEY REFERENCES [Usu�rios]([Id]),
	[Data que come�ou a ser] DATE
)