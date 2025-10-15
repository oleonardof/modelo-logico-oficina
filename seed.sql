-- Clientes
INSERT INTO Cliente (Nome, Tipo, Identificacao, Endereco, Telefone) VALUES
('João Silva', 'F', '123.456.789-00', 'Rua A, 100', '(11) 99999-1111'),
('Auto Peças JF', 'J', '12.345.678/0001-99', 'Av. B, 200', '(11) 98888-2222');

-- Veículos
INSERT INTO Veiculo (idCliente, Placa, Modelo, Ano, Cor) VALUES
(1, 'ABC1D23', 'Fiat Uno', 2015, 'Prata'),
(2, 'XYZ9Z87', 'Volkswagen Gol', 2018, 'Vermelho');

-- Especialidades
INSERT INTO Especialidade (Descricao) VALUES
('Motor'),
('Suspensão'),
('Freios'),
('Injeção Eletrônica'),
('Câmbio');

-- Mecânicos
INSERT INTO Mecanico (Nome, Endereco) VALUES
('Pedro Souza', 'Rua Alfa, 10'),
('Rafael Lima', 'Rua Beta, 20'),
('Anderson Costa', 'Rua Gama, 30');

-- Associação mecânico-especialidade
INSERT INTO Mecanico_Especialidade (idMecanico, idEspecialidade) VALUES
(1, 1), -- Pedro -> Motor
(1, 4), -- Pedro -> Injeção Eletrônica
(2, 2), -- Rafael -> Suspensão
(2, 3), -- Rafael -> Freios
(3, 5); -- Anderson -> Câmbio

-- Equipes
INSERT INTO Equipe (Nome) VALUES
('Equipe Alfa'),
('Equipe Beta');

-- Equipe x Mecânicos
INSERT INTO Equipe_Mecanico (idEquipe, idMecanico) VALUES
(1, 1),
(1, 2),
(2, 3);

-- Serviços
INSERT INTO Servico (Descricao, Valor_Referencia) VALUES
('Troca de óleo', 80.00),
('Alinhamento e balanceamento', 120.00),
('Troca de pastilhas de freio', 150.00),
('Revisão completa', 500.00);

-- Peças
INSERT INTO Peca (Nome, Descricao, Valor, Estoque) VALUES
('Filtro de óleo', 'Filtro compatível com motor 1.0', 30.00, 50),
('Pastilha de freio', 'Pastilha dianteira', 90.00, 30),
('Óleo 5W30', 'Lubrificante sintético', 60.00, 100);

-- Ordem de Serviço
INSERT INTO Ordem_Servico (idVeiculo, idEquipe, Numero_OS, Data_Emissao, Status, Valor_Total, Autorizado)
VALUES
(1, 1, 'OS001', NOW(), 'Aberta', 0, TRUE),
(2, 2, 'OS002', NOW(), 'Concluída', 0, TRUE);

-- Serviços nas OS
INSERT INTO OS_Servico (idOS, idServico, Quantidade, Valor) VALUES
(1, 1, 1, 80.00),
(1, 3, 1, 150.00),
(2, 4, 1, 500.00);

-- Peças nas OS
INSERT INTO OS_Peca (idOS, idPeca, Quantidade, Valor) VALUES
(1, 1, 1, 30.00),
(1, 2, 1, 90.00),
(2, 3, 3, 180.00);
