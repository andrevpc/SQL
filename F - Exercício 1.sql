--Crie uma tabela para armazenar dados sobre o Covid no Brasil, utilizando o arquivo abaixo:
--https://github.com/wcota/covid19br/blob/master/cases-brazil-total.csv
--Armazenar as seguintes colunas:
--Estado, Total de Casos, Total de Mortes, Número de recuperados, número de suspeitos, número de testes, números de vacinados

--Montar os comandos create table e insert para o armazenamento dos dados acima.
create database Exercicio_1
use Exercicio_1

create table casos_de_covid_no_brasil (
	id int identity(1,1) primary key,
	estado varchar (100),
	total_casos int,
	total_mortes int,
	recuperados int,
	suspeitos int,
	testes int,
	vacinados int
);

insert into casos_de_covid_no_brasil(estado, total_casos, total_mortes, recuperados, suspeitos, testes, vacinados)
values('total', 29882397, 659508, 27366309, 8866327, 70923215, 175828057);

insert into casos_de_covid_no_brasil(estado, total_casos, total_mortes, recuperados, suspeitos, testes, vacinados)
values('AC', 123808, 1992, 119470, 48179, 318928, 636138);

insert into casos_de_covid_no_brasil(estado, total_casos, total_mortes, recuperados, suspeitos, testes, vacinados)
values('AL', 296066, 6876, 286515, 7363, 789028, 2517949);

insert into casos_de_covid_no_brasil(estado, total_casos, total_mortes, recuperados, suspeitos, testes, vacinados)
values('AM', 581177, 14153, 559537, 3123, 1166605, 3079619);

insert into casos_de_covid_no_brasil(estado, total_casos, total_mortes, recuperados, suspeitos, testes, vacinados)
values('AP', 160336, 2124, 126023, 960, 227745, 542175);

insert into casos_de_covid_no_brasil(estado, total_casos, total_mortes, recuperados, suspeitos, testes, vacinados)
values('BA', 1530947, 29688, 1484295, 302676, 2689354, 11616582);

insert into casos_de_covid_no_brasil(estado, total_casos, total_mortes, recuperados, suspeitos, testes, vacinados)
values('CE', 1240113, 26725, 1110838, 87312, 3702346, 7875595);

insert into casos_de_covid_no_brasil(estado, total_casos, total_mortes, recuperados, suspeitos, testes, vacinados)
values('DF', 691980, 11579, 672192, 663, 782118, 2495339);

insert into casos_de_covid_no_brasil(estado, total_casos, total_mortes, recuperados, suspeitos, testes, vacinados)
values('ES', 1038416, 14333, 961369, 451323, 2396293, 3344859);

insert into casos_de_covid_no_brasil(estado, total_casos, total_mortes, recuperados, suspeitos, testes, vacinados)
values('GO', 1273065, 26221, 1176485, 693823, 1619728, 5678126);



--Crie uma consulta para mostrar os estados que tiveram mais de 1.500.000 casos


select * from casos_de_covid_no_brasil where total_casos >= 1500000;


--Crie uma consulta mostrando os estados ordenando pelos que mais vacinaram


select * from casos_de_covid_no_brasil order by vacinados desc;


--Utilizando as opções de consulta que vimos em sala de aula, crie outras consultas para responder outras perguntas.


select * from casos_de_covid_no_brasil order by estado;

select * from casos_de_covid_no_brasil order by estado desc;

select * from casos_de_covid_no_brasil where total_mortes >= 14000

select * from casos_de_covid_no_brasil where estado like 'BA';

select estado, total_mortes from casos_de_covid_no_brasil where total_casos >= 100000 and total_casos <= 200000