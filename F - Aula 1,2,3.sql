create database Aula_1_2_3

use Aula_1_2_3

create table cliente (
	id int identity(1,1) primary key, --int = números inteiros
	nome varchar (100), --varchar = texto com 100 caracteres
	email varchar (100)
);

insert into cliente(nome, email) values('Luisa', 'luisa@gmail.com');
insert into cliente(nome, email) values('Luiza', 'luiza@gmail.com');
insert into cliente(nome, email) values('Andre', 'andre@gmail.com');
insert into cliente(nome, email) values('Andres', 'andres@gmail.com');

select * from cliente order by nome; --*=all

select * from cliente order by nome desc;

select * from cliente where nome = 'Andre';

select * from cliente where id = 2;

select * from cliente where nome like 'Andre%'; --% = alguma coisa (Todos os André...)

delete from cliente --Apaga toda a tabela

update cliente set nome = 'antonio' where id = 4 --Update sem where=demissão

drop table cliente --Apaga toda a tabela
