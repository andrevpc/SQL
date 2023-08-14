USE exercicios
GO

-- 01

	SELECT C.NAME, M.DESC_MODEL, V.PLACA FROM [VEICULO] V
		JOIN [CLIENTE] C ON V.CPF_CLIENTE = C.CPF
		JOIN [MODELO] M ON V.ID_MODEL = M.ID 


-- 02

	SELECT C.NAME, P.ID AS PATIO FROM [ESTACIONAMENTO] E
		JOIN [VEICULO] V ON V.PLACA = E.PLACA_VEICULO
		JOIN [CLIENTE] C ON C.CPF = V.CPF_CLIENTE
		JOIN [PATIO] P ON P.ID = E.ID_PATIO
		WHERE P.ID = 1

-- 03

	SELECT C.NAME, M.DESC_MODEL FROM [ESTACIONAMENTO] E
		JOIN [VEICULO] V ON V.PLACA = E.PLACA_VEICULO
		JOIN [CLIENTE] C ON C.CPF = V.CPF_CLIENTE
		JOIN [MODELO] M ON M.ID = V.ID_MODEL
	
-- 04

	SELECT C.NAME, P.ID, E.DATA_ENTRADA, E.DATA_SAIDA FROM [ESTACIONAMENTO] E
		JOIN [VEICULO] V ON V.PLACA = E.PLACA_VEICULO
		JOIN [CLIENTE] C ON C.CPF = V.CPF_CLIENTE
		JOIN [PATIO] P ON P.ID = E.ID_PATIO
		WHERE P.ID = 2

-- 05

	SELECT C.NAME, P.ID FROM [ESTACIONAMENTO] E
		JOIN [VEICULO] V ON V.PLACA = E.PLACA_VEICULO
		JOIN [CLIENTE] C ON C.CPF = V.CPF_CLIENTE
		JOIN [PATIO] P ON P.ID = E.ID_PATIO
		WHERE P.ID != 3

-- 06

	SELECT C.NAME, COUNT(V.PLACA) AS QUANT_VEICULOS FROM [ESTACIONAMENTO] E
		JOIN [VEICULO] V ON V.PLACA = E.PLACA_VEICULO
		JOIN [CLIENTE] C ON C.CPF = V.CPF_CLIENTE
		JOIN [PATIO] P ON P.ID = E.ID_PATIO
		GROUP BY C.NAME


-- 07
	
	SELECT M.DESC_MODEL AS VEICULO, V.COR FROM [ESTACIONAMENTO] E
			JOIN [VEICULO] V ON V.PLACA = E.PLACA_VEICULO
			JOIN [CLIENTE] C ON C.CPF = V.CPF_CLIENTE
			JOIN [MODELO] M ON M.ID = V.ID_MODEL
-- 08

	SELECT C.NAME, M.DESC_MODEL, V.PLACA, E.DATA_ENTRADA FROM [ESTACIONAMENTO] E
		JOIN [VEICULO] V ON V.PLACA = E.PLACA_VEICULO
		JOIN [CLIENTE] C ON C.CPF = V.CPF_CLIENTE
		JOIN [PATIO] P ON P.ID = E.ID_PATIO
		JOIN [MODELO] M ON M.ID = V.ID_MODEL
		ORDER BY E.DATA_ENTRADA

-- 09

	SELECT V.COR, V.PLACA, P.ID AS PATIO FROM [ESTACIONAMENTO] E
		JOIN [VEICULO] V ON V.PLACA = E.PLACA_VEICULO
		JOIN [CLIENTE] C ON C.CPF = V.CPF_CLIENTE
		JOIN [PATIO] P ON P.ID = E.ID_PATIO
		WHERE P.ID = 2

-- 10

	SELECT C.NAME, P.ID AS PATIO, E.DATA_ENTRADA, E.DATA_SAIDA  FROM [ESTACIONAMENTO] E
		JOIN [VEICULO] V ON V.PLACA = E.PLACA_VEICULO
		JOIN [CLIENTE] C ON C.CPF = V.CPF_CLIENTE
		JOIN [PATIO] P ON P.ID = E.ID_PATIO
		WHERE E.DATA_SAIDA IS NULL

-- 11. Listar os clientes que possuem veículos estacionados e que estão no pátio de número 1 ou 3.
SELECT *
FROM Cliente c
JOIN Veiculo v
ON c.cpf = v.cliente_cpf
JOIN Estacionamento e
ON v.placa = e.placa_veiculo
WHERE e.num_patio = 1 OR e.num_patio = 3

-- 12. Listar os clientes que possuem veículos estacionados e que estão no pátio de número 2 ou 4,
-- ordenados pela data de entrada.
SELECT *
FROM Cliente c
JOIN Veiculo v
ON c.cpf = v.cliente_cpf
JOIN Estacionamento e
ON v.placa = e.placa_veiculo
WHERE e.num_patio = 2 OR e.num_patio = 4
ORDER BY e.data_entrada

-- 13 Listar os clientes que possuem veículos estacionados no pátio de número 1 e que tiveram a
-- saída após a data do dia atual da realização da atividade
SELECT *
FROM Cliente c
JOIN Veiculo v
ON c.cpf = v.cliente_cpf
JOIN Estacionamento e
ON v.placa = e.placa_veiculo
WHERE e.num_patio = 1 AND e.data_saida > CURRENT_TIMESTAMP

-- 14 Listar os clientes que não possuem veículos estacionados.
SELECT *
FROM Cliente c
LEFT JOIN Veiculo v
ON c.cpf = v.cliente_cpf
LEFT JOIN Estacionamento e
ON v.placa = e.placa_veiculo
WHERE e.data_saida IS NULL

-- 15 Listar os clientes que possuem veículos estacionados e a quantidade de vezes que ele
-- estacionaram.
SELECT v.cliente_cpf, COUNT(e.placa_veiculo) as SOMA
FROM Cliente c
JOIN Veiculo v
ON c.cpf = v.cliente_cpf
JOIN Estacionamento e
ON v.placa = e.placa_veiculo
GROUP BY v.cliente_cpf