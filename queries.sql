-- ===============================================================
-- CONSULTAS SQL EXEMPLO - OFICINA MECÂNICA
-- ===============================================================

-- 1️⃣ Listar todos os clientes com seus veículos
-- Uso de JOIN e ORDER BY
SELECT 
    c.Nome AS Cliente,
    v.Placa,
    v.Modelo,
    v.Cor,
    v.Ano
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.idCliente
ORDER BY c.Nome;

-- 2️⃣ Listar mecânicos e suas especialidades
-- Relacionamento N:N entre mecânicos e especialidades
SELECT 
    m.Nome AS Mecanico,
    e.Descricao AS Especialidade
FROM Mecanico m
JOIN Mecanico_Especialidade me ON m.idMecanico = me.idMecanico
JOIN Especialidade e ON me.idEspecialidade = e.idEspecialidade
ORDER BY m.Nome;

-- 3️⃣ Veículos do cliente “João Silva”
-- Uso de WHERE
SELECT 
    v.Placa,
    v.Modelo,
    v.Ano,
    v.Cor
FROM Veiculo v
JOIN Cliente c ON v.idCliente = c.idCliente
WHERE c.Nome = 'João Silva';

-- 4️⃣ Ordens de serviço abertas
SELECT 
    Numero_OS,
    Status,
    Data_Emissao,
    Valor_Total
FROM Ordem_Servico
WHERE Status = 'Aberta';

-- 5️⃣ Calcular o valor total de cada OS (somando serviços e peças)
-- Uso de SUM, COALESCE, GROUP BY e ORDER BY
SELECT 
    os.idOS,
    os.Numero_OS,
    COALESCE(SUM(oss.Valor),0) + COALESCE(SUM(osp.Valor),0) AS Valor_Total_Calculado
FROM Ordem_Servico os
LEFT JOIN OS_Servico oss ON os.idOS = oss.idOS
LEFT JOIN OS_Peca osp ON os.idOS = osp.idOS
GROUP BY os.idOS, os.Numero_OS
ORDER BY Valor_Total_Calculado DESC;

-- 6️⃣ Quantas ordens de serviço cada equipe já executou
-- Uso de GROUP BY e HAVING
SELECT 
    e.Nome AS Equipe,
    COUNT(os.idOS) AS Total_OS
FROM Equipe e
LEFT JOIN Ordem_Servico os ON e.idEquipe = os.idEquipe
GROUP BY e.Nome
HAVING COUNT(os.idOS) > 0
ORDER BY Total_OS DESC;

-- 7️⃣ Detalhar peças utilizadas por OS
SELECT 
    os.Numero_OS,
    p.Nome AS Peca,
    osp.Quantidade,
    osp.Valor
FROM Ordem_Servico os
JOIN OS_Peca osp ON os.idOS = osp.idOS
JOIN Peca p ON osp.idPeca = p.idPeca
ORDER BY os.Numero_OS;

-- 8️⃣ Ver todos os serviços executados com nome do cliente e veículo
SELECT 
    c.Nome AS Cliente,
    v.Modelo,
    os.Numero_OS,
    s.Descricao AS Servico,
    oss.Valor
FROM Ordem_Servico os
JOIN Veiculo v ON os.idVeiculo = v.idVeiculo
JOIN Cliente c ON v.idCliente = c.idCliente
JOIN OS_Servico oss ON os.idOS = oss.idOS
JOIN Servico s ON oss.idServico = s.idServico
ORDER BY c.Nome, os.Numero_OS;

-- 9️⃣ Valor total gasto por cliente em serviços e peças
-- Uso de agregação, COALESCE e ORDER BY
SELECT 
    c.Nome AS Cliente,
    SUM(COALESCE(oss.Valor,0) + COALESCE(osp.Valor,0)) AS Total_Gasto
FROM Cliente c
JOIN Veiculo v ON c.idCliente = v.idCliente
JOIN Ordem_Servico os ON v.idVeiculo = os.idVeiculo
LEFT JOIN OS_Servico oss ON os.idOS = oss.idOS
LEFT JOIN OS_Peca osp ON os.idOS = osp.idOS
GROUP BY c.Nome
ORDER BY Total_Gasto DESC;

-- 🔟 Quantas especialidades cada mecânico possui
-- Uso de GROUP BY e COUNT
SELECT 
    m.Nome AS Mecanico,
    COUNT(me.idEspecialidade) AS Total_Especialidades
FROM Mecanico m
LEFT JOIN Mecanico_Especialidade me ON m.idMecanico = me.idMecanico
GROUP BY m.Nome
ORDER BY Total_Especialidades DESC;
