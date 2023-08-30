--3) Produtos em uma Loja
--Modele uma loja com uma variedade de produtos. Alguns produtos são físicos (como eletrônicos)
--e outros são serviços (como serviços de reparo). Pense em como lidar com as diferenças na
--estrutura entre esses dois tipos de produtos.

CREATE TABLE [Produtos] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(100),
	[Preço] VARCHAR(100)
)

CREATE TABLE [Fisicos] (
	[IdFisico] INT IDENTITY(1,1) PRIMARY KEY,
	[Id] INT FOREIGN KEY REFERENCES [Produtos]([Id]),
	[Categoria] VARCHAR(100)
)

CREATE TABLE [Serviços] (
	[Id] INT IDENTITY FOREIGN KEY REFERENCES [Produtos]([Id]),
	[Produto para reparo] INT FOREIGN KEY REFERENCES [Fisicos]([IdFisico])
)