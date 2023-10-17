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

-- Persistindo dados
-- Tabela de Clientes
INSERT INTO Clientes (Nome, Telefone, Email, Endereco)
VALUES
('João Silva', '123-456-7890', 'joao.silva@example.com', 'Rua Principal, 123'),
('Maria Santos', '987-654-3210', 'maria.santos@example.com', 'Avenida Central, 456'),
('Pedro Almeida', '555-555-5555', 'pedro.almeida@example.com', 'Praça da Cidade, 789'),
('Ana Pereira', '777-123-4567', 'ana.pereira@example.com', 'Bairro Novo, 101'),
('Carlos Fonseca', '222-333-4444', 'carlos.fonseca@example.com', 'Rua das Flores, 77');

-- Tabela de Veículos
INSERT INTO Veiculos (ClienteID, Marca, Modelo, Ano, Placa)
VALUES
(1, 'Toyota', 'Corolla', 2019, 'ABC-123'),
(5, 'Ford', 'Focus', 2017, 'XYZ-789'),
(2, 'Honda', 'Civic', 2021, 'DEF-456'),
(3, 'Volkswagen', 'Golf', 2018, 'GHI-789'),
(4, 'Chevrolet', 'Cruze', 2016, 'JKL-987');

-- Tabela de Mecânicos
INSERT INTO Mecanicos (Nome, Endereco, Especialidade)
VALUES
('Carlos Rocha', 'Rua dos Mecânicos, 123', 'Mecânica Geral'),
('Luciana Oliveira', 'Avenida das Ferramentas, 456', 'Eletricista de Veículos'),
('Rafael Alves', 'Praça das Peças, 789', 'Mecânica de Motores'),
('Julia Souza', 'Estrada da Suspensão, 101', 'Funilaria e Pintura'),
('Marcelo Santos', 'Avenida da Transmissão, 77', 'Mecânica de Veículos Pesados');

-- Tabela de Equipes de Mecânicos
INSERT INTO EquipesMecanicos (EMMecanicoID, EMVeiculoID)
VALUES
(1, 1), 
(2, 5), 
(1, 2), 
(3, 3), 
(4, 4);

-- Tabela de Ordens de Serviço
INSERT INTO OrdensServico (NumeroOS, DataEmissao, OSEMVeiculoID, TipoServico, DataEntrega, AutorizacaoCliente, Valor)
VALUES
('OS-001', '2023-10-17', 1, 'Conserto', '2023-10-21', 1, 250.00),
('OS-002', '2023-10-18', 2, 'Revisão', '2023-10-22', 1, 300.00),
('OS-003', '2023-10-19', 3, 'Conserto', '2023-10-23', 1, 180.00),
('OS-004', '2023-10-20', 4, 'Revisão', '2023-10-24', 1, 320.00),
('OS-005', '2023-10-21', 5, 'Conserto', '2023-10-25', 1, 210.00);

-- Tabela de Serviços
INSERT INTO Servicos (Descricao, DataServico, Valor, VeiculoID)
VALUES
('Troca de Óleo', '2023-10-17', 50.00, 1),
('Reparo no Motor', '2023-10-18', 300.00, 2),
('Alinhamento e Balanceamento', '2023-10-19', 80.00, 3),
('Troca de Pastilhas de Freio', '2023-10-20', 120.00, 4),
('Troca de Pneus', '2023-10-21', 200.00, 5);

-- Tabela de Serviços da Ordem de Serviços
INSERT INTO ServicosdaOS (SOSOrdemID, SOSServicoID)
VALUES
(1, 1),
(2, 2),
(3, 3), 
(4, 4), 
(5, 5);

-- Tabela de Peças
INSERT INTO Pecas (Descricao, Preco)
VALUES
('Filtro de Óleo', 10.00),
('Pastilhas de Freio', 30.00),
('Pneu Novo', 100.00),
('Bateria de Carro', 50.00),
('Velas de Ignição', 5.00);

-- Tabela de Peças Utilizadas
INSERT INTO PecasUtilizadas (PUOrdemID, PUPecaID, Quantidade)
VALUES
(1, 1, 2),
(2, 2, 1), 
(3, 3, 4), 
(4, 4, 1), 
(5, 5, 8);

-- Recuperando dados do bd com queries
-- 1. Calcular o custo médio de serviços por cliente:
SELECT Clientes.Nome, AVG(Servicos.Valor) AS CustoMedioServico
FROM Clientes
JOIN Veiculos ON Clientes.ClienteID = Veiculos.ClienteID
JOIN Servicos ON Veiculos.VeiculoID = Servicos.VeiculoID
GROUP BY Clientes.ClienteID;

-- 2. Clientes que autorizaram os serviços de suas OS
SELECT Clientes.Nome, OrdensServico.NumeroOS
FROM Clientes
JOIN Veiculos ON Clientes.ClienteID = Veiculos.ClienteID
JOIN OrdensServico ON Veiculos.VeiculoID = OrdensServico.OSEMVeiculoID
WHERE OrdensServico.AutorizacaoCliente = 1;

-- 3. Descrição dos serviços de cada ordem
SELECT OrdensServico.NumeroOS, Servicos.Descricao
FROM OrdensServico
JOIN ServicosdaOS ON OrdensServico.OrdemID = ServicosdaOS.SOSOrdemID
JOIN Servicos ON ServicosdaOS.SOSServicoID = Servicos.ServicoID;

-- 4. Quais tipos de serviço têm uma média de valor de ordens de serviço superior a 200?
SELECT TipoServico, AVG(Valor) AS MediaValor
FROM OrdensServico
GROUP BY TipoServico
HAVING AVG(Valor) > 200;

-- 5. Quais são os nomes de todos os clientes e, se eles tiverem veículos registrados, quais são as marcas e modelos desses veículos?
SELECT Clientes.Nome, Veiculos.Marca, Veiculos.Modelo
FROM Clientes
LEFT JOIN Veiculos ON Clientes.ClienteID = Veiculos.ClienteID;

-- 6. Quantos serviços foram realizados em cada veículo na oficina mecânica?
SELECT Veiculos.VeiculoID, Veiculos.Marca, Veiculos.Modelo, COUNT(Servicos.ServicoID) AS NumeroTotalServicos
FROM Veiculos
LEFT JOIN Servicos ON Veiculos.VeiculoID = Servicos.VeiculoID
GROUP BY Veiculos.VeiculoID, Veiculos.Marca, Veiculos.Modelo;