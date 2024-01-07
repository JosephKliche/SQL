-- Crie o banco de dados
CREATE DATABASE OficinaMecanica;
USE OficinaMecanica;

-- Crie a tabela de clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50),
    Telefone VARCHAR(15),
    Email VARCHAR(100),
    Endereco VARCHAR(100)
);

-- Crie a tabela de veículos
CREATE TABLE Veiculos (
    VeiculoID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Ano INT,
    Placa VARCHAR(10),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Crie a tabela de mecânicos
CREATE TABLE Mecanicos (
    MecanicoID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(50),
    Endereco VARCHAR(100),
    Especialidade VARCHAR(100)
);

-- Crie a tabela de equipes de mecânicos
CREATE TABLE EquipesMecanicos (
    EMMecanicoID INT,
    EMVeiculoID INT,
    PRIMARY KEY (EMMecanicoID, EMVeiculoID),
    FOREIGN KEY (EMMecanicoID) REFERENCES Mecanicos(MecanicoID),
    FOREIGN KEY (EMVeiculoID) REFERENCES Veiculos(VeiculoID)
);

-- Crie a tabela de ordens de serviço
CREATE TABLE OrdensServico (
    OrdemID INT PRIMARY KEY AUTO_INCREMENT,
    NumeroOS VARCHAR(20),
    DataEmissao DATE,
    OSEMVeiculoID INT,
    TipoServico VARCHAR(100), -- Conserto/Revisão
    DataEntrega DATE,
    AutorizacaoCliente BOOLEAN, -- 1 para autorizado, 0 para não autorizado
    Valor DECIMAL(10, 2)
);

-- Crie a tabela de serviços
CREATE TABLE Servicos (
    ServicoID INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(100),
    DataServico DATE,
    Valor DECIMAL(10, 2),
    VeiculoID INT,
    FOREIGN KEY (VeiculoID) REFERENCES Veiculos(VeiculoID)
);

-- Crie a tabela de serviços da Ordem de Serviços
CREATE TABLE ServicosdaOS (
    SOSOrdemID INT,
    SOSServicoID INT,
    PRIMARY KEY (SOSOrdemID, SOSServicoID),
    FOREIGN KEY (SOSOrdemID) REFERENCES OrdensServico(OrdemID),
    FOREIGN KEY (SOSServicoID) REFERENCES Servicos(ServicoID)
);

-- Crie a tabela de peças
CREATE TABLE Pecas (
    PecaID INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(100),
    Preco DECIMAL(10, 2)
);

-- Crie a tabela de peças utilizadas
CREATE TABLE PecasUtilizadas (
    PUOrdemID INT,
    PUPecaID INT,
    Quantidade INT,
    PRIMARY KEY (PUOrdemID, PUPecaID),
    FOREIGN KEY (PUOrdemID) REFERENCES OrdensServico(OrdemID),
    FOREIGN KEY (PUPecaID) REFERENCES Pecas(PecaID)
);
