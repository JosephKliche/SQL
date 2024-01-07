-- Procedure com transação, savepoint e rollback de verificação

DELIMITER //
CREATE PROCEDURE process_order(IN idPOproduct INT)
BEGIN
  DECLARE exit handler for sqlexception
  BEGIN
    ROLLBACK; -- ROLLBACK total em caso de erro
  END;

  DECLARE exit handler for sqlwarning
  BEGIN
    ROLLBACK; -- ROLLBACK total em caso de aviso
  END;

  -- Início da transação
  START TRANSACTION;
  SAVEPOINT start_savepoint; -- Criar um savepoint no início

  -- Ação 1: Inserindo dados em uma tabela
  INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
  VALUES (3, 3, 5, null);

  -- Ação 2: Atualizando o estoque
  UPDATE productWarehouse
  SET quantity = quantity - 5
  WHERE idPWHproduct = 3;

  -- Verificar se há estoque suficiente
  SELECT quantity INTO @new_stock
  FROM productWarehouse
  WHERE idPWHproduct = 3;
  
  IF @new_stock < 0 THEN
    -- Se não houver estoque, reverta até o savepoint
    ROLLBACK TO start_savepoint;
  ELSE
    -- Confirmar a transação
    COMMIT;
  END IF;
END;
//
DELIMITER ;
