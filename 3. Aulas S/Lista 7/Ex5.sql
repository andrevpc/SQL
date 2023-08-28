-- 5) Usuários e Admins em um Sistema
--Modele um sistema de gerenciamento com usuários normais e administradores. Os administradores
--têm permissões adicionais que os usuários normais não possuem.

CREATE TABLE [Usuários] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(100)
)

CREATE TABLE [Normais] (
	[Id] INT FOREIGN KEY REFERENCES [Usuários]([Id])
)

CREATE TABLE [Administradores] (
	[Id] INT FOREIGN KEY REFERENCES [Usuários]([Id]),
	[Data que começou a ser] DATE
)