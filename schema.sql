-- ================================================
-- BANCO DE DADOS: Oficina Mecânica
-- ================================================

CREATE TABLE Cliente (
  idCliente SERIAL PRIMARY KEY,
  Nome VARCHAR(100) NOT NULL,
  Tipo CHAR(1) NOT NULL CHECK (Tipo IN ('F', 'J')),
  Identificacao VARCHAR(18) UNIQUE NOT NULL,
  Endereco VARCHAR(200),
  Telefone VARCHAR(20)
);

CREATE TABLE Veiculo (
  idVeiculo SERIAL PRIMARY KEY,
  idCliente INT NOT NULL REFERENCES Cliente(idCliente) ON DELETE CASCADE,
  Placa VARCHAR(10) UNIQUE NOT NULL,
  Marca VARCHAR(50),
  Modelo VARCHAR(50) NOT NULL,
  Ano INT,
  Cor VARCHAR(30),
  Chassi VARCHAR(30)
);

CREATE TABLE Especialidade (
  idEspecialidade SERIAL PRIMARY KEY,
  Nome VARCHAR(100) NOT NULL
);

CREATE TABLE Mecanico (
  idMecanico SERIAL PRIMARY KEY,
  Nome VARCHAR(100) NOT NULL,
  Endereco VARCHAR(200),
  idEspecialidade INT REFERENCES Especialidade(idEspecialidade)
);

CREATE TABLE Equipe (
  idEquipe SERIAL PRIMARY KEY,
  Nome VARCHAR(100) NOT NULL
);

CREATE TABLE Equipe_Mecanico (
  idEquipe INT NOT NULL REFERENCES Equipe(idEquipe) ON DELETE CASCADE,
  idMecanico INT NOT NULL REFERENCES Mecanico(idMecanico) ON DELETE CASCADE,
  PRIMARY KEY (idEquipe, idMecanico)
);

CREATE TABLE Ordem_Servico (
  idOS SERIAL PRIMARY KEY,
  idVeiculo INT NOT NULL REFERENCES Veiculo(idVeiculo) ON DELETE CASCADE,
  idEquipe INT NOT NULL REFERENCES Equipe(idEquipe),
  Numero_OS VARCHAR(20) UNIQUE NOT NULL,
  Data_Emissao TIMESTAMP NOT NULL DEFAULT NOW(),
  Data_Conclusao TIMESTAMP,
  Status VARCHAR(30) NOT NULL CHECK (Status IN ('Aberta', 'Em Execucao', 'Concluida', 'Cancelada')),
  Valor_Total NUMERIC(10,2),
  Autorizado BOOLEAN NOT NULL DEFAULT FALSE,
  Forma_Pagamento VARCHAR(50),
  Observacoes TEXT
);

CREATE TABLE Servico (
  idServico SERIAL PRIMARY KEY,
  Descricao VARCHAR(255) NOT NULL,
  Valor_Referencia NUMERIC(10,2) NOT NULL
);

CREATE TABLE OS_Servico (
  idOS INT NOT NULL REFERENCES Ordem_Servico(idOS) ON DELETE CASCADE,
  idServico INT NOT NULL REFERENCES Servico(idServico),
  Quantidade INT NOT NULL,
  Valor NUMERIC(10,2) NOT NULL,
  PRIMARY KEY (idOS, idServico)
);

CREATE TABLE Fornecedor (
  idFornecedor SERIAL PRIMARY KEY,
  Razao_Social VARCHAR(255) NOT NULL,
  CNPJ VARCHAR(20) UNIQUE NOT NULL,
  Telefone VARCHAR(20)
);

CREATE TABLE Peca (
  idPeca SERIAL PRIMARY KEY,
  Nome VARCHAR(100) NOT NULL,
  Descricao VARCHAR(255),
  Valor NUMERIC(10,2) NOT NULL,
  Estoque INT NOT NULL DEFAULT 0
);

CREATE TABLE Fornecedor_Peca (
  idFornecedor INT NOT NULL REFERENCES Fornecedor(idFornecedor),
  idPeca INT NOT NULL REFERENCES Peca(idPeca),
  PRIMARY KEY (idFornecedor, idPeca)
);

CREATE TABLE OS_Peca (
  idOS INT NOT NULL REFERENCES Ordem_Servico(idOS) ON DELETE CASCADE,
  idPeca INT NOT NULL REFERENCES Peca(idPeca),
  Quantidade INT NOT NULL,
  Valor NUMERIC(10,2) NOT NULL,
  PRIMARY KEY (idOS, idPeca)
);
