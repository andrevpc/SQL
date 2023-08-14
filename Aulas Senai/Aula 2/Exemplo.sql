create database triggerExemple

use triggerExemple

create table produtos
(
 ID int primary key identity,
 Nome varchar(255),
 Preco decimal(10,2)
)


create table HistoricoAcoes
(
	id int primary key identity,
	TipoOperacao varchar(10),
	DataOperacao datetime,
	ProdutoId int,
	NomeAnterior varchar(255),
	PrecoAnterior decimal(10,2)
)



INSERT produtos values('Produto A', 10.99)
INSERT produtos values('Produto C', 99.90)
INSERT produtos values('Produto E', 102.90)

update produtos set Nome ='Produto B', Preco = 15.99 WHERE id = 1
 
 delete from produtos where id = 2


select * from produtos
select * from HistoricoAcoes

create trigger trg_historicoAcoes
on Produtos
AFTER INSERT, UPDATE, DELETE
AS 
BEGIN
	DECLARE @TipoOperacao varchar(20)
	DECLARE @ProdutoId INT
	DECLARE @NomeAnterior varchar(255)
	DECLARE @PrecoAnterior decimal(10,2)

	IF EXISTS(SELECT * FROM inserted)
	BEGIN
		IF EXISTS(SELECT * FROM deleted)
		BEGIN
			SET @TipoOperacao = 'UPDATE'
			SELECT @ProdutoId = ID, @NomeAnterior = Nome,
			@PrecoAnterior = preco FROM deleted;
		END
		ELSE
		BEGIN
			SET @TipoOperacao = 'INSERT'
			SELECT @ProdutoId = ID, @NomeAnterior = null, @PrecoAnterior = null
			FROM inserted
		END
		 INSERT INTO HistoricoAcoes(TipoOperacao, DataOperacao,
		 ProdutoId, NomeAnterior, PrecoAnterior)
		 VALUES (@TipoOperacao, GETDATE(),@ProdutoId, @NomeAnterior, @PrecoAnterior)
		 END

		ELSE IF EXISTS(SELECT * FROM deleted)
		BEGIN
		SET @TipoOperacao = 'DELETE'
		SELECT @ProdutoId = ID, @NomeAnterior = Nome, @PrecoAnterior = preco
		from deleted

	INSERT INTO HistoricoAcoes(TipoOperacao, DataOperacao, ProdutoId, NomeAnterior, PrecoAnterior)
	VALUES(@TipoOperacao, GETDATE(), @ProdutoId, @NomeAnterior, @PrecoAnterior)
	END

END



alter trigger trg_historicoAcoes
on Produtos
AFTER INSERT, UPDATE, DELETE
AS 
BEGIN
	DECLARE @TipoOperacao varchar(20)
	DECLARE @ProdutoId INT
	DECLARE @NomeAnterior varchar(255)
	DECLARE @PrecoAnterior decimal(10,2)

	IF EXISTS(SELECT * FROM inserted)
	BEGIN
		IF EXISTS(SELECT * FROM deleted)
		BEGIN
			SET @TipoOperacao = 'UPDATE'
			SELECT @ProdutoId = ID, @NomeAnterior = Nome,
			@PrecoAnterior = preco FROM deleted;
		END
		ELSE
		BEGIN
			SET @TipoOperacao = 'INSERT'
			SELECT @ProdutoId = ID, @NomeAnterior = null, @PrecoAnterior = null
			FROM inserted
		END
	END
	ELSE IF EXISTS(SELECT * FROM deleted)
		BEGIN
		SET @TipoOperacao = 'DELETE'
		SELECT @ProdutoId = ID, @NomeAnterior = Nome, @PrecoAnterior = preco
		from deleted
	END
		INSERT INTO HistoricoAcoes(TipoOperacao, DataOperacao, ProdutoId, NomeAnterior, PrecoAnterior)
		VALUES(@TipoOperacao, GETDATE(), @ProdutoId, @NomeAnterior, @PrecoAnterior)
	END





