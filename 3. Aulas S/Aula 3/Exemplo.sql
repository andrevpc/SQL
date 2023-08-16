create database exemploProcedure

use exemploProcedure

create table Produtos
(
ProdutoId INT PRIMARY KEY IDENTITY,
Nome VARCHAR(255),
QuantidadeEstoque INT
)



--primeiro exemplo inserir produtos
CREATE PROCEDURE InserirProduto
	@NomeProduto VARCHAR(255),
	@QuantidadeEstoque INT
AS 
BEGIN
	INSERT INTO Produtos(Nome, QuantidadeEstoque)
	VALUES (@NomeProduto, @QuantidadeEstoque);
END;


--Executar procedure 
EXEC InserirProduto
	@NomeProduto = 'Chocolate',
	@QuantidadeEstoque = 20;

--exemplo atualizar produtos

CREATE PROCEDURE AtualizarEstoque
	@ProdutoID INT,
	@NovaQuantidadeEstoque INT
AS
BEGIN
	BEGIN TRY
		UPDATE Produtos SET QuantidadeEstoque = @NovaQuantidadeEstoque
		WHERE ProdutoId = @ProdutoID
	END TRY
	BEGIN CATCH
		PRINT 'Erro ao atualiar o estoque';
		PRINT ERROR_MESSAGE();
	END CATCH
END

--execução da procedure
BEGIN
	DECLARE @ProdutoID INT = 1;
	DECLARE @NovaQuantidadeEstoque INT = 80;

	EXEC AtualizarEstoque
		@ProdutoID = @ProdutoID,
		@NovaQuantidadeEstoque = @NovaQuantidadeEstoque;
END

select * from Produtos


