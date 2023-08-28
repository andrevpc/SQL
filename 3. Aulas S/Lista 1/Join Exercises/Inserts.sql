USE exercicios
GO

INSERT INTO Cliente (nome, cpf, dataNasc)
VALUES 
    ('João da Silva', '12345678901', '1990-05-15'),
    ('Maria Oliveira', '98765432101', '1985-11-30'),
    ('Pedro Santos', '45678912301', '1998-02-20'),
	('Andre Victor', '45578912301', '1998-02-20');

INSERT INTO Modelo (descricao_modelo)
VALUES 
    ('Sedan'),
    ('Hatchback'),
    ('SUV'),
    ('Caminhão');

INSERT INTO Veiculo (codigo_modelo, cliente_cpf, cor, placa)
VALUES 
    (1, '12345678901', 'Prata', 'ABC1234'),
    (2, '98765432101', 'Vermelho', 'XYZ5678'),
    (3, '45678912301', 'Preto', 'DEF9876');

INSERT INTO Patio (endereco, capacidade)
VALUES 
    ('Rua das Flores, 123', 50),
    ('Avenida Central, 456', 30),
    ('Praça da Liberdade, 789', 20),
	('Praça Rui Barbosa, 515', 20);

INSERT INTO Estacionamento (num_patio, placa_veiculo, data_entrada, data_saida)
VALUES 
    (1, 'ABC1234', '2023-07-31 10:00:00', '2023-07-31 18:00:00'),
    (2, 'XYZ5678', '2023-07-31 12:30:00', '2023-07-31 17:45:00'),
    (3, 'DEF9876', '2023-07-31 09:15:00', '2023-07-31 16:30:00'),
	(4, 'DEF9876', '2023-07-31 17:15:00', '2023-07-31 18:30:00');