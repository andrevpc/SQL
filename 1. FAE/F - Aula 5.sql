create database Aula_5

use Aula_5

create table funcionario (
	id int identity(1,1) primary key,
	nome varchar(100),
	dt_contrato date,
	salario decimal(19, 2),
	cargo varchar(100),
	situacao varchar(50),
	dt_demissao date
);

select * from funcionario where nome like 'Maria%'

select * from funcionario where nome like '%Luz'

select * from funcionario where nome like '%Junior%'

select * from funcionario where salario > 10000 and cargo = 'Cientista de Dados' 

select * from funcionario where salario > 1000 and salario < 5000

select * from funcionario where salario > 15000 or year(dt_contrato) < 2010

select * from funcionario where id in (1, 2, 3)

select count(*) from funcionario

select count(*) from funcionario where salario > 10000

alter table funcionario add dt_demissao date --Adiciona coluna

alter table funcionario drop column situacao

select * from funcionario where dt_demissao is null

select * from funcionario where dt_demissao is not null
