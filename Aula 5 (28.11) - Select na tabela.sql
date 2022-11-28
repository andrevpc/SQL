select * from [NOTAS FISCAIS] where day([DATA])=3
select * from [TABELA DE CLIENTES] where Nome like 'a%'
select * from [TABELA DE CLIENTES] where Nome like '%e%'
select * from [TABELA DE CLIENTES] where Nome like '%ra'

-- uso do DISTINCT, verificar cadastro (elimina os repetidos)
select distinct EMBALAGEM, TAMANHO from [TABELA DE PRODUTOS]

-- uso do comando TOP (5 primeiros valores)
select top 5 * from [TABELA DE PRODUTOS]

-- uso do order by, se colocar um campo VARCHAR ele ordena por ordem alfabética
select * from [TABELA DE PRODUTOS] order by [PREÇO DE LISTA]
select * from [TABELA DE PRODUTOS] order by [PREÇO DE LISTA] desc
select * from [TABELA DE PRODUTOS] where SABOR = 'laranja' order by [PREÇO DE LISTA] desc

-- Mostre o produto mais caro entre os produtos que sejam PET de 1 litro
select top 1* from [TABELA DE PRODUTOS] where EMBALAGEM='PET' and TAMANHO='1 Litro' order by [PREÇO DE LISTA] desc

select ESTADO, [LIMITE DE CREDITO] from [TABELA DE CLIENTES]

-- Faça um select mostrando por agrupamento do estado e somando o limite de credito
select ESTADO, sum([LIMITE DE CREDITO]) as soma_do_lim
from [TABELA DE CLIENTES] group by ESTADO

-- Faça um select mostrando por agrupamento do estado e somando o volume de compra e mostrando apenas que tem o volume de compra maior que 5000
select ESTADO, sum([VOLUME DE COMPRA]) as soma_do_cre
from [TABELA DE CLIENTES] group by ESTADO having sum([VOLUME DE COMPRA]) >130000

-- uso do case
select [NOME DO PRODUTO], [PREÇO DE LISTA],
case when [PREÇO DE LISTA] >= 12
then 'produto caro'
when [PREÇO DE LISTA] >= 7
then 'produto em conta'
else 'produto barato' end as 'avaliação'
from [TABELA DE PRODUTOS]

-- Tem que repetir tudo do select no group by (repetir função)
select year([DATA]) as ano, count(*) as quantidade
from [NOTAS FISCAIS]
group by year([DATA])

-- Join e inner join ==
select * from [TABELA DE VENDEDORES] v  join
[NOTAS FISCAIS] f on v.MATRICULA = f.MATRICULA