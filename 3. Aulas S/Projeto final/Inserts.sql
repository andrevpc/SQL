USE Projeto

-- Inserir dados na tabela Editora
INSERT INTO [Editora] ([Nome], [CNPJ])
VALUES ('Editora A', '12345678901234'),
       ('Editora B', '56789012345678');

-- Inserir dados na tabela Autor
INSERT INTO [Autor] ([Nome])
VALUES ('Autor X'),
       ('Autor Y');

-- Inserir dados na tabela Genero
INSERT INTO [Genero] ([Nome])
VALUES ('Ficção'),
       ('Aventura'),
       ('Romance');

-- Inserir dados na tabela Cliente
INSERT INTO [Cliente] ([Nome], [Sobrenome], [CPF], [Data de Nascimento], [Email], [Telefone])
VALUES ('João', 'Silva', '12345678901', '1990-01-15', 'joao@example.com', '123-456-7890'),
       ('Maria', 'Santos', '98765432101', '1985-05-20', 'maria@example.com', '987-654-3210');

-- Inserir dados na tabela Livro
INSERT INTO [Livro] ([Nome], [Quantidade], [Data de lancamento], [Id Autor], [Id Editora])
VALUES ('Livro A', 10, '2022-03-10', 1, 1),
       ('Livro B', 5, '2021-09-25', 2, 2);

-- Inserir dados na tabela LivroXGenero
INSERT INTO [LivroXGenero] ([Id Livro], [Id Genero])
VALUES (1, 1),
       (1, 3),
       (2, 2);

-- Inserir dados na tabela AutorXGenero
INSERT INTO [AutorXGenero] ([Id Autor], [Id Genero])
VALUES (1, 1),
       (2, 3);

-- Inserir dados na tabela Emprestimo
INSERT INTO [Emprestimo] ([Data que pegou], [Data que devolveu], [Data limite], [Id Cliente], [Id Livro])
VALUES ('2023-08-10', '2023-08-17', '2023-08-20', 1, 1),
       ('2023-08-05', NULL, '2023-08-20', 2, 2),
       ('2023-07-20', '2023-08-05', '2023-08-20', 1, 2);
