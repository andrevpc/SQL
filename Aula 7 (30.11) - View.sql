--Mostre o nome do cliente e do vendedor e também o nome do produto relacionado por vendas
--cliente: nome
--vendedores: nome
--produtos: nome
--notas: cpf, matricula, numero -> itens:codigo -> produtos: nome

create or alter view View_Vendas_ClieneteProduto as 
select c.NOME as [Nome do cliente],
	   v.NOME as [Nome do vendedor],
	   p.[NOME DO PRODUTO] as [Nome do produto]
--	   i.QUANTIDADE
from [NOTAS FISCAIS] f
join [TABELA DE CLIENTES] c
on f.CPF = c.CPF
join [TABELA DE VENDEDORES] v
on f.MATRICULA = v.MATRICULA
join [ITENS NOTAS FISCAIS] i
on f.NUMERO = i.NUMERO
join [TABELA DE PRODUTOS] p
on i.[CODIGO DO PRODUTO] = p.[CODIGO DO PRODUTO]
--order by i.QUANTIDADE

select * from View_Vendas_ClieneteProduto --não aceita parametros

select v.NOME as [Nome do vendedor],
	   f.[DATA] as [Data],
	   sum(i.PREÇO) as Preco
from [NOTAS FISCAIS] f
join [TABELA DE VENDEDORES] v
on f.MATRICULA = v.MATRICULA
join [ITENS NOTAS FISCAIS] i
on f.NUMERO = i.NUMERO
group by v.nome, f.[DATA]