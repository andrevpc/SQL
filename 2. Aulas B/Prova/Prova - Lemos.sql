create database ProvaSQL
go
use ProvaSQL

--Considerei o mes 12 como o mes que vem

create table Aluno(
id int identity(1,1) primary key,
nome varchar(30) not null,
cpf varchar(15) unique not null,
dt_nasc date not null
)

create table Professor(
id int identity(1,1) primary key,
nome varchar(30) not null,
cpf varchar(15) unique
)

create table Curso(
id int identity(1,1) primary key,
nome varchar(30) not null,
ativo bit not null default 1
)

create table Disciplina(
id int identity(1,1) primary key,
nome varchar(30) not null,
ativo bit not null default 1
)

create table DisciplinaxCurso(
id int identity(1,1) primary key,
curso int not null foreign key references Curso(id),
disciplina int not null foreign key references Disciplina(id),
ativa bit not null default 1
)

create table Turma(
id int identity(1,1) primary key,
aluno int not null foreign key references Aluno(id),
professor int not null foreign key references Professor(id),
disciplinaxcurso int not null foreign key references DisciplinaxCurso(id),
nota1 float,
nota2 float,
nota3 float,
nota4 float,
notafinal float,
ativa bit default 1
)

create table Pagamentos(
id int identity(1,1) primary key,
aluno int not null foreign key references Aluno(id),
boleto date not null,
situacao varchar(10) check (situacao = 'pendente' or situacao = 'pago' or situacao = 'em  atraso') not null
)

INSERT INTO Aluno (nome,cpf,dt_nasc)
VALUES
  ('Illiana Colon','768.695.150-26','1977-12-4'),
  ('Kevyn Moran','253.595.720-51','1988-5-3'),
  ('Raymond Haley','024.089.040-05','2000-5-16'),
  ('Xandra Flowers','988.734.440-08','1974-4-20'),
  ('Fulton Booker','752.151.680-08','1983-4-9'),
  ('Kellie Frederick','887.331.730-87','1986-6-5'),
  ('Orli Finch','185.005.050-36','1961-7-11'),
  ('Aquila Maynard','519.634.730-51','2001-8-12'),
  ('Abraham Henry','192.803.580-90','1971-9-14'),
  ('Nadine Pitts','776.777.100-85','1970-4-10');
INSERT INTO Aluno (nome,cpf,dt_nasc)
VALUES
  ('Courtney Joseph','913.602.910-67','1994-5-9'),
  ('Stewart Cannon','115.603.110-96','1971-5-9'),
  ('Madeline Graham','703.517.010-36','2005-10-12'),
  ('Kirby Bauer','207.346.620-68','1968-12-28'),
  ('Howard Jackson','956.640.790-45','1963-11-13'),
  ('Wilma Hood','411.668.150-48','1971-10-8'),
  ('Halla Warren','413.757.940-78','2004-4-7'),
  ('Willa Mcdonald','618.139.300-58','1971-7-13'),
  ('Wallace Stone','237.964.450-04','1985-8-25'),
  ('Cullen Carpenter','549.323.150-66','1977-9-1');

INSERT INTO Professor (nome,cpf)
VALUES
  ('Melodie Harrell','324.445.510-79'),
  ('John Burnett','497.045.390-02'),
  ('Ferdinand Weeks','497.046.390-02'),
  ('Alea Rojas','044.229.080-22'),
  ('Chaney Hayden','098.261.850-60');

insert into Curso(nome)
values
	('Engenharia Mecanica'),
	('Ciencia de Dados'),
	('Psicologia');

insert into Disciplina(nome)
values
	('Fisica'),
	('Calculo'),
	('Algebra'),
	('Geometria'),
	('Quimica'),
	('Big Data'),
	('SQL'),
	('Programação');

insert into DisciplinaxCurso(curso,disciplina)
values
	(1,1),
	(2,2),
	(3,3),
	(1,4),
	(2,5),
	(3,6),
	(1,7),
	(2,8);

insert into Turma(aluno,professor,disciplinaxcurso,nota1,nota2,nota3)
values(1,1,1,10,9.8,9.9);
insert into Turma(aluno,professor,disciplinaxcurso,nota1,nota2)
values(2,2,2,8.8,9.4),(3,3,3,8.5,8.3);
insert into Turma(aluno,professor,disciplinaxcurso,nota1)
values(4,4,4,9.5);
insert into Turma(aluno,professor,disciplinaxcurso)
values
	(5,5,5),
	(6,1,6),
	(7,2,7),
	(8,3,8),
	(9,4,1),
	(10,5,2);
insert into Turma(aluno,professor,disciplinaxcurso)
values
	(11,1,3),
	(12,2,4),
	(13,3,5),
	(14,4,6),
	(15,5,7),
	(16,1,8),
	(17,2,1),
	(18,3,2),
	(19,4,3),
	(20,5,4);

insert into Pagamentos(aluno,boleto,situacao)
values
	(1,'2022-11-1','pago'),
	(2,'2022-11-1','pago'),
	(3,'2022-11-1','pago'),
	(4,'2022-11-1','pago'),
	(5,'2022-11-1','pago'),
	(1,'2022-12-1','pendente'),
	(2,'2022-12-1','pendente'),
	(3,'2022-12-1','pendente'),
	(4,'2022-12-1','pendente'),
	(5,'2022-12-1','pendente');
insert into Pagamentos(aluno,boleto,situacao)
values
	(6,'2022-12-1','pendente'),
	(7,'2022-12-1','pendente'),
	(8,'2022-12-1','pendente'),
	(9,'2022-12-1','pendente'),
	(10,'2022-12-1','pendente'),
	(11,'2022-12-1','pendente'),
	(12,'2022-12-1','pendente'),
	(13,'2022-12-1','pendente'),
	(14,'2022-12-1','pendente'),
	(15,'2022-12-1','pendente'),

	(6,'2022-11-1','pago'),
	(7,'2022-11-1','pago'),
	(8,'2022-11-1','pago'),
	(9,'2022-11-1','pago'),
	(10,'2022-11-1','pago'),
	(11,'2022-11-1','pago'),
	(12,'2022-11-1','pago'),
	(13,'2022-11-1','pago'),
	(14,'2022-11-1','pago'),
	(15,'2022-11-1','pago'),

	(6,'2022-12-1','pago'),
	(7,'2022-12-1','pago'),
	(8,'2022-12-1','pago'),
	(9,'2022-12-1','pago'),
	(10,'2022-12-1','pago'),
	(11,'2022-12-1','pago'),
	(12,'2022-12-1','pago'),
	(13,'2022-12-1','pago'),
	(14,'2022-12-1','pago'),
	(15,'2022-12-1','pago');

insert into Pagamentos(aluno,boleto,situacao)
values
	(16,'2022-12-1','pendente'),
	(17,'2022-12-1','pendente'),
	(18,'2022-12-1','pendente'),

	(16,'2022-7-1','pago'),
	(17,'2022-7-1','pago'),
	(18,'2022-7-1','pago'),

	(16,'2022-8-1','pago'),
	(17,'2022-8-1','pago'),
	(18,'2022-8-1','pago'),

	(16,'2022-9-1','pago'),
	(17,'2022-9-1','pago'),
	(18,'2022-9-1','pago'),

	(16,'2022-10-1','pago'),
	(17,'2022-10-1','pago'),
	(18,'2022-10-1','pago'),

	(16,'2022-11-1','pago'),
	(17,'2022-11-1','pago'),
	(18,'2022-11-1','pago');

insert into Pagamentos(aluno,boleto,situacao)
values
	(19,'2022-11-1','pendente'),
	(20,'2022-11-1','pendente'),

	(19,'2022-12-1','pendente'),
	(20,'2022-12-1','pendente'),

	(19,'2022-8-1','pago'),
	(20,'2022-8-1','pago'),

	(19,'2022-9-1','pago'),
	(20,'2022-9-1','pago'),

	(19,'2022-10-1','pago'),
	(20,'2022-10-1','pago');

--'2022-12-1' '2022-11-1' '2022-10-1' '2022-9-1' '2022-8-1' '2022-7-1'
--'pendente' 'pago' 'em  atraso'

create trigger atualiza_DxC_D
on Disciplina
after update
as begin
declare @ativo bit
declare @id int
select @id = id, @ativo = ativo from inserted
update DisciplinaxCurso set ativa = @ativo where disciplina = @id
end
select * from Disciplina
select * from Curso
select * from DisciplinaxCurso
update Disciplina set ativo = 0 where id = 1

create trigger atualiza_DxC_C
on Curso
after update
as begin
declare @ativo bit
declare @id int
select @id = id, @ativo = ativo from inserted
update DisciplinaxCurso set ativa = @ativo where curso = @id
end
select * from Disciplina
select * from Curso
select * from DisciplinaxCurso
update Curso set ativo = 0 where id = 1

create trigger atualiza_turma
on DisciplinaxCurso
after update
as begin
declare @ativo bit
declare @id int
select @id = id, @ativo = ativa from inserted
update Turma set ativa = @ativo where disciplinaxcurso = @id
end
select * from Turma

create or alter procedure boleto_atrasados
as 
begin 
update Pagamentos set situacao = 'em  atraso' where situacao = 'pendente' and  boleto < getdate()
end
exec boleto_atrasados
select * from Pagamentos

create view view_alunos_disciplinas_notas as
select a.nome as [Nome do aluno],
	   d.nome as [Nome da disciplina],
	   t.nota1,
	   t.nota2,
	   t.nota3,
	   t.nota4,
	   t.notafinal
from Turma t
join Aluno a
on a.id = t.aluno
join DisciplinaxCurso dxc
on dxc.id = t.disciplinaxcurso
join Disciplina d
on d.id = dxc.disciplina

select * from view_alunos_disciplinas_notas

create view view_boleto_atrasado as
select a.nome, p.situacao
from Aluno a
join Pagamentos p
on p.aluno = a.id
where p.situacao = 'em atraso'

select * from view_boleto_atrasado