create database Desafio
use Desafio

create table Aluno (
	id int identity(1,1) primary key,
	nome varchar(100),
	email varchar(100),
	situacao int
	);

create table AlunoSituacao(
	id int identity(1,1) primary key,
	nome varchar(100)
	);

create table Matricula(
	id int identity(1,1) primary key,
	dtMatricula Date,
	dtCancelamento Date,
	aluno int,
	turma int,
	situacao int,
	nota int,
	faltas int
	);
	
create table MatriculaSituacao(
	id int identity(1,1) primary key,
	nome varchar(100)
	);
	
create table TurmaSituacao(
	id int identity(1,1) primary key,
	nome varchar(100)
	);
	
create table Turma(
	id int identity(1,1) primary key,
	ano int,
	semestre int,
	dtInicio Date,
	dtFim Date,
	disciplina int,
	docente int,
	situacao int
	);

create table Disciplina(
	id int identity(1,1) primary key,
	nome varchar(100)
	);

create table Docente(
	id int identity(1,1) primary key,
	nome varchar(100),
	email varchar(100)
	);

alter table aluno
add foreign key (Situacao)
references AlunoSituacao (id);

alter table matricula
add foreign key (aluno)
references Aluno (id);

alter table matricula
add foreign key (situacao)
references matriculasituacao (id);

alter table matricula
add foreign key (turma)
references turma (id);

alter table turma
add foreign key (situacao)
references turmasituacao (id);

alter table turma
add foreign key (docente)
references docente (id);

alter table turma
add foreign key (disciplina)
references disciplina (id);

insert into alunosituacao(nome) values('Ativo');
insert into alunosituacao(nome) values('Cancelado');
insert into alunosituacao(nome) values('Evadido');

insert into turmasituacao(nome) values('Aberta');
insert into turmasituacao(nome) values('Cancelada');
insert into turmasituacao(nome) values('Concluída');

insert into matriculasituacao(nome) values('Matriculado');
insert into matriculasituacao(nome) values('Cancelado');
insert into matriculasituacao(nome) values('Aprovado');
insert into matriculasituacao(nome) values('Reprovado');

insert into disciplina(nome) values ('Insight Project for Business');
insert into disciplina(nome) values ('Calculo Basico');
insert into disciplina(nome) values ('Fisica Basica');
insert into disciplina(nome) values ('Banco de Dados SQL');
insert into disciplina(nome) values ('Química Tecnológica');

insert into docente(nome,email) values ('Adriano','adriano@gmail.com');
insert into docente(nome,email) values ('André','andre@gmail.com');
insert into docente(nome,email) values ('João','joao@gmail.com');
insert into docente(nome,email) values ('Robson','robson@gmail.com');
insert into docente(nome,email) values ('Aleksandra','aleksandra@gmail.com');

insert into aluno(nome,email,situacao) values ('Pedro','pedro@gmail.com', 1);
insert into aluno(nome,email,situacao) values ('Yohan','yohan@gmail.com', 1);
insert into aluno(nome,email,situacao) values ('Rafael','rafael@gmail.com', 2);
insert into aluno(nome,email,situacao) values ('Alan','alan@gmail.com', 2);
insert into aluno(nome,email,situacao) values ('Mateus','mateus@gmail.com', 3);
insert into aluno(nome,email,situacao) values ('Jean','jean@gmail.com', 3);

insert into turma(ano,semestre,dtInicio,dtFim,disciplina,docente,situacao) values (2022,1,'2022-01-01','2022-06-01',1,1,1);
insert into turma(ano,semestre,dtInicio,dtFim,disciplina,docente,situacao) values (2022,2,'2022-06-01','2022-12-01',2,1,2);
insert into turma(ano,semestre,dtInicio,dtFim,disciplina,docente,situacao) values (2021,1,'2021-01-01','2021-06-01',1,1,3);
insert into turma(ano,semestre,dtInicio,dtFim,disciplina,docente,situacao) values (2021,2,'2021-06-01','2021-12-01',2,1,3);

insert into matricula(dtMatricula,dtCancelamento,aluno,turma,situacao,nota,faltas)  values ('2021-12-19','2022-06-15',1,1,1,9.8,0);
insert into matricula(dtMatricula,dtCancelamento,aluno,turma,situacao,nota,faltas)  values ('2022-05-15','2022-12-11',2,2,4,6.5,10);
insert into matricula(dtMatricula,dtCancelamento,aluno,turma,situacao,nota,faltas)  values ('2020-12-19','2021-06-15',3,3,1,7.5,5);
insert into matricula(dtMatricula,dtCancelamento,aluno,turma,situacao,nota,faltas)  values ('2020-12-19','2021-06-15',4,4,4,6.0,12);

--Crie uma consulta que mostre todos os alunos, apresentando o nome, e-mail e a situação do aluno.

select a.nome as nome_do_aluno,
	   a.email as email_do_aluno,
	   sa.nome as situacao_do_aluno
from aluno a
join alunosituacao sa
on a.situacao = sa.id;

--Crie uma consulta que mostre todas as turmas, apresentando o nome da disciplina correspondente, situação da turma, data de início e fim da turma

select d.nome as nome_da_disciplina,
	   ts.nome as situacao_da_turma,
	   t.dtInicio as data_de_inicio,
	   t.dtfim  as data_do_fim
from turma t
join disciplina d
on t.disciplina = d.id
join turmasituacao ts
on t.situacao = ts.id

--Complemente a consulta da questão 4, mostrando também o nome do docente responsável pela turma.

select d.nome as nome_da_disciplina,
	   ts.nome as situacao_da_turma,
	   t.dtInicio as data_de_inicio,
	   t.dtfim  as data_do_fim,
	   d2.nome as docente_da_turma
from turma t
join disciplina d
on t.disciplina = d.id
join turmasituacao ts
on t.situacao = ts.id
join docente d2
on t.docente = d2.id

--Crie uma consulta que mostre todas as matrículas cadastradas no sistema, mostrando os seguintes campos
--Aluno: nome e situação do aluno
--Matrícula: data de matrícula e situação da matrícula
--Turma: ano, semestre, situação da turma
--Docente: nome
--Disciplina: nome


select a.nome as nome_do_aluno,
	   sa.nome as situacao_do_aluno,
	   m.dtMatricula as data_de_matricula,
	   ms.nome as situaca_de_matricula,
	   t.ano as ano_da_turma,
	   t.semestre as semestre_da_turma,
	   ts.nome as situaca_da_turma,
	   d.nome as docente,
	   ds.nome as disciplina
from aluno a
    join alunosituacao sa
	on a.situacao = sa.id
	join matricula m
	on m.aluno = a.id
	join matriculasituacao ms
	on m.situacao = ms.id
	join turma t
	on m.turma = t.id
	join turmasituacao ts
	on t.situacao = ts.id
	join docente d
	on t.docente = d.id
	join disciplina ds
	on t.disciplina = ds.id 


--Replique a consulta anterior, filtrando apenas as turmas de 2022 com situação Aberta, e Matrículas com situação Matriculado

select a.nome as nome_do_aluno,
	   sa.nome as situacao_do_aluno,
	   m.dtMatricula as data_de_matricula,
	   ms.nome as situaca_de_matricula,
	   t.ano as ano_da_turma,
	   t.semestre as semestre_da_turma,
	   ts.nome as situaca_da_turma,
	   d.nome as docente,
	   ds.nome as disciplina
from aluno a
    join alunosituacao sa
	on a.situacao = sa.id
	join matricula m
	on m.aluno = a.id
	join matriculasituacao ms
	on m.situacao = ms.id
	join turma t
	on m.turma = t.id
	join turmasituacao ts
	on t.situacao = ts.id
	join docente d
	on t.docente = d.id
	join disciplina ds
	on t.disciplina = ds.id
where t.ano = 2022 and ts.nome = 'Aberta' and ms.nome = 'Matriculado'

--Replica a consulta do exercício 3, filtrando pelo ID de um aluno.

select a.nome as nome_do_aluno,
	   sa.nome as situacao_do_aluno,
	   m.dtMatricula as data_de_matricula,
	   ms.nome as situaca_de_matricula,
	   t.ano as ano_da_turma,
	   t.semestre as semestre_da_turma,
	   ts.nome as situaca_da_turma,
	   d.nome as docente,
	   ds.nome as disciplina
from aluno a
    join alunosituacao sa
	on a.situacao = sa.id
	join matricula m
	on m.aluno = a.id
	join matriculasituacao ms
	on m.situacao = ms.id
	join turma t
	on m.turma = t.id
	join turmasituacao ts
	on t.situacao = ts.id
	join docente d
	on t.docente = d.id
	join disciplina ds
	on t.disciplina = ds.id
where a.id = 1

--Crie uma consulta que mostre todas as turmas de um determinado docente no ano de 2022, apresentando nome da disciplina e situacao da turma.

select d.nome as nome_da_disciplina,
	   ts.nome as situacao_da_turma
from turma t
join disciplina d
on t.disciplina = d.id
join turmasituacao ts
on t.situacao = ts.id
where docente = 1 and ano = 2022

--Insira uma ou mais turmas sem fornecer o Docente (null). Realize uma consulta em Turma e Docente, que traga todas as turmas independentes se a turma tenha docente cadastrado e que mostre as colunas:
--Turma: ano e semestre e nome da disciplina
--Docente: nome

insert into turma(ano,semestre,dtInicio,dtFim,disciplina,docente,situacao) values (2022,1,'2022-01-01','2022-06-01',2,null,2);
insert into turma(ano,semestre,dtInicio,dtFim,disciplina,docente,situacao) values (2021,2,'2021-06-01','2021-12-01',3,null,1);

select t.ano as ano_da_turma,
	   t.semestre as semestre_da_turma,
	   di.nome as disciplina,
	   d.nome as nome_do_docente
from turma t
left join docente d
on t.docente = d.id
join disciplina di
on t.disciplina = di.id

--Crie uma consulta que mostre a TurmaSituacao, e a quantidade de turmas existentes em cada Situação.

select ts.nome,
	   count(*) as quantidade_de_turmas
from turma t
join turmasituacao ts
on t.situacao = ts.id
group by ts.nome

--Crie uma consulta que mostre a Turma e sua disciplina, e a quantidade de alunos em cada turma, apresentando as colunas:
--Turma: ano e semestre e nome da disciplina
--Disciplina: nome
--Quantidade de alunos
select * from turma
select t.ano as ano_da_turma,
	   t.semestre as semestre_da_turma,
	   d.nome as nome_da_disciplina,
	   count(*) as quantidade_de_alunos
from turma t
join disciplina d
on t.disciplina = d.id
join matricula m
on m.turma = t.id
group by t.ano,
	   t.semestre,
	   d.nome

--Crie uma consulta que mostre a Turma e sua disciplina, a média das notas dos alunos obtidas em cada turma, apresentando as colunas:
--Turma: ano e semestre e nome da disciplina
--Disciplina: nome
--Média das notas

select t.ano as ano_da_turma,
	   t.semestre as semestre_da_turma,
	   d.nome as nome_da_disciplina,
	   avg(m.nota) as media_das_notas
from turma t
join disciplina d
on t.disciplina = d.id
join matricula m
on m.turma = t.id
group by t.ano,
	   t.semestre,
	   d.nome