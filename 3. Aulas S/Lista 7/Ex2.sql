--2) Ve�culos
--Crie uma hierarquia de ve�culos, incluindo carros, motos e caminh�es. Cada tipo de ve�culo tem
--atributos exclusivos, como o n�mero de rodas, capacidade de carga etc.

CREATE TABLE [Veiculos] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Marca] VARCHAR(100),
	[Modelo] VARCHAR(100),
	[Ano] INT,
	[Rodas] INT
)

CREATE TABLE [Moto] (
	[Id] INT IDENTITY FOREIGN KEY REFERENCES [Veiculos]([Id]),
	[Cilindradas] VARCHAR(100)
)

CREATE TABLE [Carro] (
	[Id] INT IDENTITY FOREIGN KEY REFERENCES [Veiculos]([Id]),
	[Numero de portas] INT,
)

CREATE TABLE [Caminhao] (
	[Id] INT IDENTITY FOREIGN KEY REFERENCES [Veiculos]([Id]),
	[Volume do container] FLOAT
)