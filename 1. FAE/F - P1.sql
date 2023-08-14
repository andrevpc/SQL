create database P1_2
use P1_2

create table Boletos (
	ID int identity(1,1) primary key,
	Nome varchar (100),
	Valor decimal (20,2),
	Vencimento date
);

insert into Boletos(Nome, Valor, Vencimento)
values('Alan', 1500.50, getdate());

insert into Boletos(Nome, Valor, Vencimento)
values('Rafael', 230.45, '2022-05-28');

insert into Boletos(Nome, Valor, Vencimento)
values('André', 594.57, '2021-09-15');

insert into Boletos(Nome, Valor, Vencimento)
values('Yohan', 50.98, '2023-05-08');

select * from Boletos order by Vencimento;

update Boletos set Vencimento = '2023-05-10' where ID = 4;

update Boletos set Valor = 550 where ID = 3;

delete from Boletos where ID = 3;

select * from Boletos where Valor > 100;

select * from Boletos where Valor > 500 AND Vencimento < '2022-04-28';

alter table Boletos add Situacao varchar(100);

update Boletos set Situacao = 'Aberto';

UPDATE Boletos SET Situacao = 'Pago' WHERE ID=1;

UPDATE Boletos SET Situacao = 'Pago' WHERE ID=2;

select count(*) from Boletos where Situacao = 'Pago';

select count(*) from Boletos where Situacao = 'Aberto'