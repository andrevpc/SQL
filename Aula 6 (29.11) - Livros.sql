create database livro
use livro

create table Editora(
	id int identity(1,1) primary key,
	nome varchar(30)
);

create table Livro(
	id int identity(1,1) primary key,
	nome varchar(30),
	editora int
	foreign key (editora)
	references Editora (id)
);

select * from Editora
insert into Editora(nome) values('Companhia da Letras');
insert into Editora(nome) values('Suma');
insert into Editora(nome) values('Intrínseca');

select * from Livro
insert into Livro(nome, editora) values('Mindset', 1);
insert into Livro(nome, editora) values('O poder do hábito', 1);
insert into Livro(nome, editora) values('A revolução dos bichos', 1);
insert into Livro(nome, editora) values('1984', 1);
insert into Livro(nome, editora) values('As Crônicas De Gelo E Fogo', 2);
insert into Livro(nome, editora) values('Lore Olympus', 2);
insert into Livro(nome, editora) values('Trilogia Bill Hodges', 2);
insert into Livro(nome, editora) values('Teto Para Dois', 3);
insert into Livro(nome, editora) values('A Sutil Arte de Ligar o Fda-Se', 3);
insert into Livro(nome, editora) values('Amor & Gelato: 1', 3);

select l.nome as livro,
	   e.nome as editora
from Livro l
join Editora e
on e.id = l.editora

select nome from Livro
where editora in 
(select id from Editora where nome = 'Companhia da Letras')
