-- Transações do desafio

use ecommerce;
show tables;

-- Desabilitar o autocommit
SET autocommit = 0;

-- Início da transação
START TRANSACTION;

	-- Ação 1: Inserindo dados em uma tabela
	INSERT INTO orders (idOrderCliente, orderStatus, orderDescription, sendValue, paymentCash, trackingCode)
	VALUES ('4', 'Em processamento', 'Via App', '4', false, '15436287');

	-- Ação 2: Atualizando dados em outra tabela
	UPDATE clients
	SET lName = 'Santos'
	WHERE cpf_cnpj = 987654321;

	-- Ação 3: Deletando registros em uma terceira tabela
	DELETE FROM supplier
	WHERE CNPJ = 48949512000125;

-- Confirma a transação
COMMIT;

-- Ou, em caso de erro, desfaz a transação
-- ROLLBACK;