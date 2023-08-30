USE Projeto

--Desenvolver consultas que geram relatórios de empréstimos atrasados.
SELECT 
	l.[Nome] AS [Livro],
    c.[Nome] + ' ' + c.[Sobrenome] AS [Nome do cliente],
	c.Email,
	c.[Telefone],
    e.[Data que pegou],
    e.[Data limite]
FROM [Emprestimo] e
JOIN [Cliente] c ON e.[Id Cliente] = c.[Id]
JOIN [Livro] l ON e.[Id Livro] = l.[Id]
WHERE [Data limite] < CURRENT_TIMESTAMP AND [Data que devolveu] IS NULL

--Gerar um relatório de livros mais populares com base nos empréstimos.
SELECT
    l.[Nome] AS Livro,
    COUNT(e.[Id]) AS [Quantidade de emprestimos]
FROM Livro l
JOIN Emprestimo e ON l.[Id] = e.[Id Livro]
GROUP BY l.Id, l.Nome
ORDER BY [Quantidade de emprestimos] DESC