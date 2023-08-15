--Relacionamento
create database Aula_6

use Aula_6

create table funcionario (
	id int identity(1,1) primary key,
	nome varchar(100),
	dt_contrato date,
	salario decimal(19, 2),
	cargo bigint,
	situacao varchar(50)
);

create table Cargo (
	id int identity(1,1) primary key,
	nome varchar(100),
	salario_base decimal(19, 2)
);

select * from funcionario;

select * from cargo;

alter table funcionario drop column cargo;

alter table funcionario 
add cargo int;

alter table funcionario 
add foreign key (cargo) 
references Cargo (id);

drop table Cargo
drop table funcionario

create table Cargo (
	id int identity(1,1) primary key,
	nome varchar(100),
	salario_base decimal(19, 2)
);

create table funcionario (
	id int identity(1,1) primary key,
	nome varchar(100),
	dt_contrato date,
	salario decimal(19, 2),
	cargo int,
	situacao varchar(50)
	foreign key (cargo)
	references Cargo (id)
);

insert into Cargo(nome, salario_base) values('Cargo 1', 5000);
insert into Cargo(nome, salario_base) values('Cargo 2', 6000);
insert into Cargo(nome, salario_base) values('Cargo 3', 10000);

insert into funcionario (nome, dt_contrato, salario, cargo, situacao) 
values('Funcionario 1', getdate(), 5000, 1, 'ativo')

select f.nome, c.nome from funcionario f 
	join cargo c
	on f.cargo = c.id
	
select f.nome as nome_do_funcionario,
	   c.nome as cargo_do_funcionario
from funcionario f
	join cargo c
	on f.cargo = c.id
