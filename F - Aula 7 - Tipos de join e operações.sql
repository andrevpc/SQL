--Tipos de join:
--Join normal = inner join n�o vem o item que n�o tem na outra tabela, apenas o que tem nas duas
--Left join pega todos os itens da tabela citada primeiro e os que fazem rela��o com esses, os que n�o tem rela��o vem como NULL
--Right vem da segunda tabela
--Full join vem tudo, null dos dois lados
--Group by: (agrupar o que � igual), group by sempre � igual �s colunas do select, coloca group by no final do select j� feito
--Para contar quantas linhas foram agrupadas, coloca o count (*) antes da coluna que voc� quer agrupar
--Para somar, colocar sum(*)
--Para m�dia avg(*)

create database Aula_7

use Aula_7

create table Cargo (
	id int identity(1,1) primary key,
	nome varchar(100),
	salario_base decimal(19, 2)
)

create table funcionario (
	id int identity(1,1) primary key,
	nome varchar(100),
	dt_contrato date,
	salario decimal(19, 2),
	cargo int,
	situacao varchar(50),
	foreign key (cargo) references Cargo (id)
);

select * from funcionario f
		 inner join cargo c
		 on f.cargo = c.id

select f.id, 
	   f.nome, 
	   c.nome as cargo
from funcionario f 
         inner join cargo c
         on f.cargo = c.id

select f.id, 
	   f.nome, 
	   c.nome as cargo
from funcionario f 
         left join cargo c
         on f.cargo = c.id
         
select f.id, 
	   f.nome, 
	   c.nome as cargo
from funcionario f 
         right join cargo c
         on f.cargo = c.id

select f.id, 
	   f.nome, 
	   c.nome as cargo
from funcionario f 
         full join cargo c
         on f.cargo = c.id
         
select c.id, c.nome, count(*) total_funcionarios
from funcionario f
	 join cargo c
	 on f.cargo  = c.id
group by c.id, c.nome

select c.id, c.nome, sum(c.salario_base) total_salario
from funcionario f
	 join cargo c
	 on f.cargo  = c.id
group by c.id, c.nome