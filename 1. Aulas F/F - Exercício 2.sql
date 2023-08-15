create database Exercicio_2
use Exercicio_2

create table Produto (
	id int identity(1,1) primary key,
	nome varchar(100),
	dt_cadastro date,
	valor decimal(19, 2),
	qtde_estoque int default 0
);

insert into produto(nome, dt_cadastro, valor, qtde_estoque)
values ('Produto 1', getdate(), 50.25, 53);

insert into produto(nome, dt_cadastro, valor, qtde_estoque)
values ('Produto 2', '2021-12-30', 10.251, 386);

insert into produto(nome, dt_cadastro, valor, qtde_estoque)
values ('Produto 3', getdate(), 199.99, 412)

insert into produto(nome, dt_cadastro, valor, qtde_estoque)
values ('Produto 4', '2019-09-19', 462.50, 78);

insert into produto(nome, dt_cadastro, valor, qtde_estoque)
values ('Produto 5', getdate(), 484.50, 0);

insert into produto(nome, dt_cadastro, valor, qtde_estoque)
values ('Produto 6', '2020-08-06', 212.28, 0);

insert into produto(nome, dt_cadastro, valor, qtde_estoque)
values ('Produto 7', getdate(), 450.68, 0);

insert into produto(nome, dt_cadastro, valor, qtde_estoque)
values ('Produto 8', '2019-11-24', 147.67, 0);

insert into produto(nome, dt_cadastro, valor, qtde_estoque)
values ('Produto 9', getdate(), 498.62, 85);

insert into produto(nome, dt_cadastro, valor, qtde_estoque)
values ('Produto 10', '2022-02-04', 68.10, 438);

select * from Produto where year(dt_cadastro) = 2022

select * from Produto where qtde_estoque = 0

select * from Produto where qtde_estoque = 0 and year(dt_cadastro) < 2022

select * from Produto where valor > 100

select * from Produto where qtde_estoque > 0 order by valor

select * from Produto order by qtde_estoque

select * from Produto order by dt_cadastro desc