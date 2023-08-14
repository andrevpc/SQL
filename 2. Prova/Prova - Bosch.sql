create database Prova_Bosch
go
use Prova_Bosch

--3
create table Departamentos(
dep_id int identity(1,1) primary key,
dep_nome varchar(20) not null,
dep_local int not null
)

create table Funcionarios(
edv int primary key,
nome varchar(30) not null,
lider varchar(15) not null,
data_de_contratacao date not null,
salario int not null,
dep_id int foreign key references Departamentos(dep_id) not null
)

create table Grade_salarial(
grade int identity(1,1) primary key,
sal_min int not null,
sal_max int not null
)

insert into Departamentos(dep_nome, dep_local)
values
	('REMAN', 104),
	('ICO', 101),
	('ETS', 401),
	('FCM', 303),
	('INOVE', 303);

insert into Grade_salarial(sal_min, sal_max)
values
	(1500, 4000),
	(4001, 9000),
	(9001, 22000),
	(22001, 50000);

insert into Funcionarios(edv, nome, lider, data_de_contratacao, salario, dep_id)
values
	(92890148, 'Edna Carvalho', 'Andrea', '1990-02-24', 19000, 1),
	(92790062, 'João Manfredo', 'Andrea', '2001-09-26', 12500, 1),
	(91004090, 'Débora Junior', 'Andrea', '1999-03-02', 15600, 1),
	(94566222, 'Carla Rodrigues', 'Andrea', '1990-10-04', 20000, 1),
	(96334100, 'Maciel Oliveira', 'Andrea', '1995-12-06', 16500, 1),
	(97885245, 'Guilherme Guilhermo', 'Marcos', '2010-05-13', 9000, 2),
	(92894706, 'Jessica Lima', 'Marcos', '2015-08-14', 25678, 2),
	(91450032, 'Isabella Machado', 'Marcos', '1993-01-22', 10900, 2),
	(94661932, 'Carlo Daniel', 'Lucio', '1990-01-31', 13750, 2),
	(95780634, 'Maria Santana', 'Lucio', '2015-09-05', 8000, 2),
	(97881945, 'Dominic Ferreira', 'Pietra', '2020-02-09', 2000, 3),
	(98490620, 'Daniela Silva', 'Pietra', '2020-02-09', 1500, 3),
	(96854299, 'Felipe Augusto', 'Pietra', '2020-02-09', 1600, 3),
	(97805503, 'Natalia Reis', 'Pietra', '2019-06-14', 2200, 3),
	(90103456, 'Thiago Dias', 'Pietra', '2018-08-24', 2800, 3),
	(98462157, 'Lorena Ray', 'Pietra', '2017-02-25', 1900, 3),
	(95482340, 'Natanael Brasil', 'Pietra', '2020-06-03', 3500, 3),
	(96314782, 'Ana Mass', 'Captu', '1997-02-19', 3600, 4),
	(97854318, 'Otávio Luis', 'Captu', '2017-05-19', 9200, 4),
	(94862122, 'Luisa Otávia', 'Captu', '2002-11-11', 10500, 4),
	(97864320, 'Lucas Moura', 'Captu', '1990-08-29', 6600, 4),
	(96315782, 'Fernanda Lacerda', 'Captu', '1999-12-17', 2900, 4),
	(97546210, 'Caroline Adeus', 'Captu', '2018-02-19', 4555, 4),
	(94621573, 'Marco Valastro', 'Captu', '2003-03-30', 7000, 4),
	(96548432, 'Valdemir Cantante', 'Jonas', '2020-03-15', 1200, 5),
	(97511020, 'Eduarda Souza', 'Jonas', '2011-08-14', 1100, 5),
	(96410654, 'Allan Jonas', 'Felipe', '2008-06-17', 3200, 5),
	(95645012, 'Diana Jones', 'Felipe', '2002-09-24', 2050, 5),
	(94746054, 'Mario Bros', 'Felipe', '1990-01-18', 25600, 5),
	(92085478, 'Aline Franco', 'Jonas', '1996-05-05', 3700, 5);

--4

select f.nome,
	   d.dep_nome
from Funcionarios f
join Departamentos d
on d.dep_id = f.dep_id
where nome like 'D%'

select top(1) f.nome,
	   d.dep_nome
from Funcionarios f
join Departamentos d
on d.dep_id = f.dep_id
where nome like 'D%'
order by salario desc

--5
select f.nome,
	   d.dep_nome,
	   d.dep_local
from Funcionarios f
join Departamentos d
on d.dep_id = f.dep_id

--6
declare @valortotal int
declare @funcionariototal int

select @valortotal = sum(salario) from Funcionarios where lider = 'Jonas'
delete from Funcionarios where lider = 'Jonas'
select @funcionariototal = count(*) from Funcionarios where lider is not null
declare @aumento int = @valortotal/@funcionariototal
update Funcionarios set salario = salario + @aumento
select * from Funcionarios order by nome

--7
declare @idademaxima date
select @idademaxima = MIN(data_de_contratacao) from Funcionarios
select f.nome,
	   f.edv,
	   f.lider,
	   g.grade
from Funcionarios f
join Grade_salarial g
on g.sal_min < f.salario and f.salario < g.sal_max
where data_de_contratacao = @idademaxima

--8
select d.dep_nome as [Nome do departamento],
	   count(*) as [Funcionarios com salario maior que 4000]
from Funcionarios f
join Departamentos d
on d.dep_id = f.dep_id
where salario > 4000 group by d.dep_id, d.dep_nome

--9
update Funcionarios set lider = 'Marcos' where lider = 'Lucio'
select * from Funcionarios where year(data_de_contratacao) > 2015

--10
select d.dep_nome,
	   avg(salario) [Media do salario],
	   max(salario) [Salario maximo],
	   min(salario) [Salario minimo]
from Funcionarios f
join Departamentos d
on d.dep_id = f.dep_id
group by d.dep_id,
		 d.dep_nome