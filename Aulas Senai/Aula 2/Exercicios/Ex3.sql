USE master
GO

IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Exercises')
	DROP DATABASE [Exercises]

CREATE DATABASE [Exercises]
GO

USE [Exercises]
GO

--3) Crie duas tabelas: "Produtos" e "Pedidos". A tabela "Produtos" deve ter as colunas:
--IDProduto (int), Nome (varchar) e QuantidadeEstoque (int). A tabela "Pedidos" deve
--ter as colunas: IDPedido (int), IDProduto (int) e QuantidadePedido (int). Crie um
--trigger que, após a inserção de um novo pedido na tabela "Pedidos", atualize a
--quantidade em estoque na tabela "Produtos" subtraindo a quantidade pedida no
--pedido correspondente.

CREATE TABLE [Produtos]
(
	[IDProduto] INT PRIMARY KEY IDENTITY,
	[Nome] VARCHAR(100),
	[QuantidadeEstoque] INT
)

CREATE TABLE [Pedidos]
(
	[IDPedido] INT PRIMARY KEY IDENTITY,
	[IDProduto] INT FOREIGN KEY REFERENCES [PRODUTOS]([IDProduto]),
	[QuantidadePedido] INT
)

GO

CREATE TRIGGER PedidosTrigger
	ON [Pedidos]
	AFTER INSERT
AS
BEGIN
	DECLARE
		@Id INT, @IdProduto INT, @QtdePedido INT

	SELECT @Id = [IDPedido], @IdProduto = [IDProduto], @QtdePedido = [QuantidadePedido] FROM INSERTED

	UPDATE [Produtos]
	SET [QuantidadeEstoque] = [QuantidadeEstoque] - @QtdePedido
	WHERE [Produtos].[IDProduto] = @IdProduto
END

INSERT INTO [Produtos] VALUES ('Bico injetor', 10);
INSERT INTO [Pedidos] VALUES (1, 5);
SELECT * FROM [Produtos]
SELECT * FROM [Pedidos]