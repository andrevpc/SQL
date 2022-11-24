create database P2
use P2

--1) Cria as tabelas juntamente com os relacionamentos, seguindo o diagrama do sistema de venda de ingresso.

create table cidade (
	id int identity(1,1) primary key,
	nome varchar(100)
	);

create table evento (
	id int identity(1,1) primary key,
	titulo varchar(100),
	data date,
	valor_ingresso decimal(19,2),
	cidade int,
	foreign key (cidade)
	references Cidade (id)
	);
	
create table cliente (
	id int identity(1,1) primary key,
	nome varchar(100)
	);

create table ingresso (
	id int identity(1,1) primary key,
	evento int,
	cliente int,
	foreign key (evento)
	references Evento (id),
	foreign key (cliente)
	references Cliente (id)
	);

--2) Insira dados em todas as tabelas, montando os relacionamentos entre elas.

insert into cidade(nome) values('Curitiba');

insert into evento(titulo,data,valor_ingresso,cidade) values('Formatura',getdate(),100.00,1);
insert into evento(titulo,data,valor_ingresso,cidade) values('Casamento','2022-06-15',200.00,1);

insert into cliente(nome) values('André');
insert into cliente(nome) values('Pedro');
insert into cliente(nome) values('Rafael');
insert into cliente(nome) values('Yohan');

insert into ingresso(evento,cliente) values(1,1);
insert into ingresso(evento,cliente) values(2,2);
insert into ingresso(evento,cliente) values(1,3);
insert into ingresso(evento,cliente) values(2,4);
insert into ingresso(evento,cliente) values(2,1);
insert into ingresso(evento,cliente) values(1,2);

--3) Crie uma consulta que apresente todos os Eventos juntamente com a cidade de cada evento apresentando as seguintes colunas. 
--Evento: titulo e data; 
--Cidade: nome

select e.titulo as titulo_do_evento,
	   e.data as data_do_evento,
	   c.nome as cidade_do_evento
from evento e
join cidade c
on e.cidade = c.id

--4) Crie uma consulta que apresente todos os ingressos vendidos no sistema, juntamente com as informações dos clientes e eventos. Apresente as seguintes colunas:
--Evento: titulo e data;
--Cliente: nome

select e.titulo as titulo_do_evento,
	   e.data as data_do_evento,
	   cl.nome as clientes_do_evento
from ingresso i
join evento e
on i.evento = e.id
join cliente cl
on i.cliente = cl.id

--5) Crie uma consulta que apresente todos os eventos, juntamente com a quantidade de ingressos vendidos em cada evento. Apresentar as seguintes colunas:
--Evento: titulo e data;
--e a quantidade de ingressos vendidos.

select e.titulo as titulo_do_evento,
	   e.data as data_do_evento,
	   count (*) as ingressos_vendidos
from ingresso i
join evento e
on i.evento = e.id
group by e.titulo,
		 e.data

--6) Cria uma consulta que apresente todos os eventos, juntamente com o valor total arrecadado em ingressos vendidos em cada evento. Apresentar as seguintes colunas:
--Evento: titulo, data;
--Cidade: nome;
--e o valor total em ingressos vendidos em cada evento

select e.titulo as titulo_do_evento,
	   e.data as data_do_evento,
	   c.nome as nome_da_cidade,
	   sum(valor_ingresso) as valor_vendido
from evento e
join cidade c
on e.cidade = c.id
join ingresso i
on i.evento = e.id
group by e.titulo,
		 e.data,
		 c.nome