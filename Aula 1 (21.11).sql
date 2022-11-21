create table tabela1(
id int,
nome varchar(30),
data_nasc date
)

drop table tabela1

alter table tabela1
add cpf varchar(12)

alter table tabela1
drop column cpf

alter table tabela1
alter column nome varchar(100)

create table tabela2(
id int not null,
nome varchar(30),
cpf varchar(12) not null unique
)

insert into tabela2(id, nome, cpf)
values(5, 'André', '208038999-80')
insert into tabela2(id, cpf)
values(5, '218038999-80')
insert into tabela2
values(6, 'Dedé', '228038999-80')

--Contraint é uma regra de validação, assim fazemos com que o nome seja unico (mas não faz sentido ser)
alter table tabela2
add constraint campo_unique unique(nome)

select id,nome,cpf from tabela2
-- * == all
select * from tabela2

select * from tabela2 where id = 5

update tabela2 set nome = 'José da Silva' where id = 6