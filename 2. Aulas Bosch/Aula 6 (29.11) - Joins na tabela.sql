select c.nome, count(*) as 'Notas fiscais'
from [TABELA DE CLIENTES] c inner join [NOTAS FISCAIS] nf -- = join
on c.CPF = nf.CPF
group by c.NOME

-- Faça um select usando alguma variação do join para descobrir quem é o cliente que não tem nota fiscal
-- use as tabelas 'Tabela cliente' e 'notas fiscais' use um group by para agrupar as notas

select c.nome, count(nf.CPF) as 'Notas fiscais'
from [TABELA DE CLIENTES] c left join [NOTAS FISCAIS] nf
on c.CPF = nf.CPF
group by c.nome having count(nf.CPF) = 0

select top 1 c.nome, count(nf.CPF) as 'Notas fiscais'
from [TABELA DE CLIENTES] c left join [NOTAS FISCAIS] nf
on c.CPF = nf.CPF
group by c.nome
order by count(nf.CPF)

select c.nome, nf.CPF
from [TABELA DE CLIENTES] c left join [NOTAS FISCAIS] nf
on c.CPF = nf.CPF
where nf.CPF is NULL

--

select BAIRRO from [TABELA DE CLIENTES]
union --union faz o distinct automatico, para mostrar tudo usa-se union all (tira dados repetidos)
select BAIRRO from [TABELA DE VENDEDORES]

select distinct BAIRRO from [TABELA DE CLIENTES]
union all --assim mostra os clientes sem repetir e onde tiver vendedores ele repete
select distinct BAIRRO from [TABELA DE VENDEDORES]
order by BAIRRO

select c.BAIRRO, count(c.NOME) as 'Quantidade de pessoas'
from [TABELA DE CLIENTES] c
join [TABELA DE VENDEDORES] v
on v.BAIRRO = c.BAIRRO
group by c.BAIRRO

select c.NOME, c.BAIRRO from [TABELA DE CLIENTES] c
join [TABELA DE VENDEDORES] v
on v.BAIRRO = c.BAIRRO
--==
select NOME, BAIRRO from [TABELA DE CLIENTES]
where BAIRRO in (select BAIRRO from [TABELA DE VENDEDORES])

select NOVA_CONSULTA.EMBALAGEM, NOVA_CONSULTA.MAX_PRECO
from (select EMBALAGEM, max([PREÇO DE LISTA]) as MAX_PRECO
from [TABELA DE PRODUTOS]
group by EMBALAGEM) NOVA_CONSULTA
where NOVA_CONSULTA.MAX_PRECO <= 5

select EMBALAGEM, max([PREÇO DE LISTA]) from [TABELA DE PRODUTOS]
group by EMBALAGEM having max([PREÇO DE LISTA]) <= 5

-- Insisra os produtos com valor > 1500 da tabela produtos em uma tabela nova: produtos caros(id, nome, preco)
create table Produtos_caros(
id int identity(1,1) primary key,
nome varchar(50),
preco float
)

select * from [TABELA DE PRODUTOS]

insert into Produtos_caros(nome, preco)(
select [NOME DO PRODUTO], [PREÇO DE LISTA] from [TABELA DE PRODUTOS]
where [PREÇO DE LISTA] > 15.00
)

select * from Produtos_caros

create table clientexnotas(
id int identity(1,1) primary key,
nome varchar(50),
quantidade int
)

insert clientexnotas(nome,quantidade)(
select c.nome, count(nf.CPF) as 'Quantidade'
from [TABELA DE CLIENTES] c left join [NOTAS FISCAIS]nf
on c.CPF = nf.CPF
group by c.NOME
)

select * from clientexnotas