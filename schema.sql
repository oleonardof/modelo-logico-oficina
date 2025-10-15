CREATE TABLE Cliente (
  idCliente SERIAL PRIMARY KEY,
  Nome VARCHAR(100) NOT NULL,
  Tipo CHAR(1) NOT NULL, -- F: Física / J: Jurídica
  Identificacao VARCHAR(18) NOT NULL UNIQUE,
  Endereco VARCHAR(200),
  Telefone VARCHAR(20)
);

CREATE TABLE Veiculo (
  idVeiculo SERIAL PRIMARY KEY,
  idCliente INT NOT NULL REFERENCES Cliente(idCliente),
  Placa VARCHAR(10) NOT NULL UNIQUE,
  Modelo VARCHAR(50) NOT NULL,
  Ano INT,
  Cor VARCHAR(30)
);

CREATE TABLE Especialidade (
  idEspecialidade SERIAL PRIMARY KEY,
  Descricao VARCHAR(100) NOT NULL
);

CREATE TABLE Mecanico (
  idMecanico SERIAL PRIMARY KEY,
  Nome VARCHAR(100) NOT NULL,
  Endereco VARCHAR(200)
);

CREATE TABLE Mecanico_Especialidade (
  idMecanico INT NOT NULL REFERENCES Mecanico(idMecanico),
  idEspecialidade INT NOT NULL REFERENCES Especialidade(idEspecialidade),
  PRIMARY KEY (idMecanico, idEspecialidade)
);

CREATE TABLE Equipe (
  idEquipe SERIAL PRIMARY KEY,
  Nome VARCHAR(100) NOT NULL
);

CREATE TABLE Equipe_Mecanico (
  idEquipe INT NOT NULL REFERENCES Equipe(idEquipe),
  idMecanico INT NOT NULL REFERENCES Mecanico(idMecanico),
  PRIMARY KEY (idEquipe, idMecanico)
);

CREATE TABLE Ordem_Servico (
  idOS SERIAL PRIMARY KEY,
  idVeiculo INT NOT NULL REFERENCES Veiculo(idVeiculo),
  idEquipe INT NOT NULL REFERENCES Equipe(idEquipe),
  Numero_OS VARCHAR(20) NOT NULL UNIQUE,
  Data_Emissao TIMESTAMP NOT NULL,
  Data_Conclusao TIMESTAMP,
  Status VARCHAR(30) NOT NULL,
  Valor_Total DECIMAL(10,2),
  Autorizado BOOLEAN NOT NULL
);

CREATE TABLE Servico (
  idServico SERIAL PRIMARY KEY,
  Descricao VARCHAR(255) NOT NULL,
  Valor_Referencia DECIMAL(10,2) NOT NULL
);

CREATE TABLE OS_Servico (
  idOS INT NOT NULL REFERENCES Ordem_Servico(idOS),
  idServico INT NOT NULL REFERENCES Servico(idServico),
  Quantidade INT NOT NULL,
  Valor DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (idOS, idServico)
);

CREATE TABLE Peca (
  idPeca SERIAL PRIMARY KEY,
  Nome VARCHAR(100) NOT NULL,
  Descricao VARCHAR(255),
  Valor DECIMAL(10,2) NOT NULL,
  Estoque INT NOT NULL
);

CREATE TABLE OS_Peca (
  idOS INT NOT NULL REFERENCES Ordem_Servico(idOS),
  idPeca INT NOT NULL REFERENCES Peca(idPeca),
  Quantidade INT NOT NULL,
  Valor DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (idOS, idPeca)
);
