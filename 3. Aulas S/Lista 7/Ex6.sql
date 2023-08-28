--6) Atividades Esportivas
--Crie uma hierarquia para diferentes atividades esportivas, como esportes individuais e
--esportes em equipe. Cada tipo de esporte tem regras específicas e números de jogadores diferentes.

CREATE TABLE [Esporte] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Nome] VARCHAR(100),
	[Descrição] VARCHAR(MAX)
)

CREATE TABLE [Individual] (
	[Id] INT FOREIGN KEY REFERENCES [Esporte]([Id])
)

CREATE TABLE [Equipe] (
	[Id] INT FOREIGN KEY REFERENCES [Esporte]([Id]),
	[Quantidade de pessoas no time] INT
)