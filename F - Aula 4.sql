create database Aula_4

use Aula_4
create table Produto (
	id int identity(1,1) primary key,
	nome varchar(100),
	dt_cadastro date, --Salva a data pelo modelo americano
	valor decimal(19, 2), --Decimal com 19 valores antes e 2 depois da virgula
	qtde_estoque int default 0 --Se o campo não for adicionado será colocado o 0 ao invés do null
);

insert into produto(nome, dt_cadastro, valor, qtde_estoque) values ('Produto 1', getdate(), 50.25, 10);
insert into produto(nome, dt_cadastro, valor, qtde_estoque) values ('Produto 2', '2021-12-30', 10.251, 10);

select nome, dt_cadastro from produto;

select year(dt_cadastro), * from produto; 

select * from Produto where year(dt_cadastro) = 2021;

select year(dt_cadastro)from produto;

update Produto set qtde_estoque = qtde_estoque - 1 where id = 1

select * from Produto
