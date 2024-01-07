-- Recuperando dados do bd OficinaMecanica
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
