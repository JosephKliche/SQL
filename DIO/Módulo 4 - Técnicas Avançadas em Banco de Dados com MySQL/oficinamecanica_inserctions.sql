-- Inserção de dados no database OficinaMecanica
-- inserção na tabela Clientes
INSERT INTO Clientes (Nome, Telefone, Email, Endereco)
VALUES
('João Silva', '123-456-7890', 'joao.silva@example.com', 'Rua Principal, 123'),
('Maria Santos', '987-654-3210', 'maria.santos@example.com', 'Avenida Central, 456'),
('Pedro Almeida', '555-555-5555', 'pedro.almeida@example.com', 'Praça da Cidade, 789'),
('Ana Pereira', '777-123-4567', 'ana.pereira@example.com', 'Bairro Novo, 101'),
('Carlos Fonseca', '222-333-4444', 'carlos.fonseca@example.com', 'Rua das Flores, 77');

-- inserção na tabela Veiculos
INSERT INTO Veiculos (ClienteID, Marca, Modelo, Ano, Placa)
VALUES
(1, 'Toyota', 'Corolla', 2019, 'ABC-123'),
(5, 'Ford', 'Focus', 2017, 'XYZ-789'),
(2, 'Honda', 'Civic', 2021, 'DEF-456'),
(3, 'Volkswagen', 'Golf', 2018, 'GHI-789'),
(4, 'Chevrolet', 'Cruze', 2016, 'JKL-987');

-- inserção na tabela Mecanicos
INSERT INTO Mecanicos (Nome, Endereco, Especialidade)
VALUES
('Carlos Rocha', 'Rua dos Mecânicos, 123', 'Mecânica Geral'),
('Luciana Oliveira', 'Avenida das Ferramentas, 456', 'Eletricista de Veículos'),
('Rafael Alves', 'Praça das Peças, 789', 'Mecânica de Motores'),
('Julia Souza', 'Estrada da Suspensão, 101', 'Funilaria e Pintura'),
('Marcelo Santos', 'Avenida da Transmissão, 77', 'Mecânica de Veículos Pesados');

-- inserção na tabela EquipesMecanicos
INSERT INTO EquipesMecanicos (EMMecanicoID, EMVeiculoID)
VALUES
(1, 1), 
(2, 5), 
(1, 2), 
(3, 3), 
(4, 4);

-- inserção na tabela OrdensServico
INSERT INTO OrdensServico (NumeroOS, DataEmissao, OSEMVeiculoID, TipoServico, DataEntrega, AutorizacaoCliente, Valor)
VALUES
('OS-001', '2023-10-17', 1, 'Conserto', '2023-10-21', 1, 250.00),
('OS-002', '2023-10-18', 2, 'Revisão', '2023-10-22', 1, 300.00),
('OS-003', '2023-10-19', 3, 'Conserto', '2023-10-23', 1, 180.00),
('OS-004', '2023-10-20', 4, 'Revisão', '2023-10-24', 1, 320.00),
('OS-005', '2023-10-21', 5, 'Conserto', '2023-10-25', 1, 210.00);

-- inserção na tabela Servicos
INSERT INTO Servicos (Descricao, DataServico, Valor, VeiculoID)
VALUES
('Troca de Óleo', '2023-10-17', 50.00, 1),
('Reparo no Motor', '2023-10-18', 300.00, 2),
('Alinhamento e Balanceamento', '2023-10-19', 80.00, 3),
('Troca de Pastilhas de Freio', '2023-10-20', 120.00, 4),
('Troca de Pneus', '2023-10-21', 200.00, 5);

-- Tabela de Serviços da ServicosdaOS
INSERT INTO ServicosdaOS (SOSOrdemID, SOSServicoID)
VALUES
(1, 1),
(2, 2),
(3, 3), 
(4, 4), 
(5, 5);

-- inserção na tabela Pecas
INSERT INTO Pecas (Descricao, Preco)
VALUES
('Filtro de Óleo', 10.00),
('Pastilhas de Freio', 30.00),
('Pneu Novo', 100.00),
('Bateria de Carro', 50.00),
('Velas de Ignição', 5.00);

-- inserção na tabela PecasUtilizadas
INSERT INTO PecasUtilizadas (PUOrdemID, PUPecaID, Quantidade)
VALUES
(1, 1, 2),
(2, 2, 1), 
(3, 3, 4), 
(4, 4, 1), 
(5, 5, 8);
