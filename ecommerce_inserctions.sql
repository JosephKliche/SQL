-- Dados persistidos no database ecommerce
-- inserção na tabela clients
insert into clients (fName, Minit, lName, cpf_cnpj, corporateName, address, type_client)
			values	('Maria', 'M', 'Silva', 12346789, 'Gymnastic', 'Rua Silva de Prata 29, Carangola - Cidade das Flores', 'PJ'),
					('Matheus', 'O', 'Pimentel', 987654321, null, 'Rua Alameda 289, Centro - Cidade das Flores', 'PF'),
					('Ricardo', 'F', 'Silva', 45678913, null, 'Rua Almeda Vinha 1009, Centro - Cidade das Flores', 'PF'),
					('Julia', 'S', 'França', 789123456, 'Doctor J.', 'Rua Lareijras 861, Centro - Cidade das Flores', 'PJ'),
					('Roberta','G', 'Assis', 98745631, null, 'Avenidade Koller 19, Centro - Cidade das Flores','PF'),
					('Isabela', 'M', 'Cruz', 654789123, 'Isacakes', 'Rua Alameda das Flores 28, Centro - Cidade das Flores', 'PJ');

-- inserção na tabela product
insert into product (pName, informations, category, avaliation)
			values	('Touca de dormir', 'Ótimo material para proteger o cabelo', 'Vestimentas', '4'),
					('Abajur', 'Ilumina bem e economiza energia', 'Eletrônicos', '3'),
                    ('Lord of Rings', 'Conheça o mundo onde tudo é possível', 'Livraria','5'),
                    ('1001 receitas', 'Fundamental para todo cozinheiro de primeira viagem', 'Livraria', '4'),
                    ('Barbie e Ken', 'Direto dos cinemas para seu quarto', 'Brinquedos', 5),
                    ('Echo Dot 3', 'Tecnologia e inovação para sua casa', 'Eletrônicos', '4'),
                    ('Calça Balenciaga', 'Fora da curva, assim como você', 'Vestimentas', '5');

-- inserção na tabela orders
insert into orders(idOrderCliente, orderStatus, orderDescription, sendValue, paymentCash, trackingCode)
			values	('1', 'Confirmado', 'Via Website', '3', false, '34561287'),
					('2', 'Cancelado', 'Via Website', '4', true, '654789524'),
                    ('3', default, 'Via App', '8', true, '56435159'),
                    ('4', default, 'Via Website', '4', false, '123456123'),
                    ('5', 'Confirmado', 'Via App', '3', true, '12345698');

-- inserção na tabela wareHouse
insert into wareHouse (location)
			values	('Vitória'),
					('Bahia'),
					('Rio Grande do Sul'),
                    ('Santa Catarina'),
                    ('Brasília'),
                    ('Mato Grosso do Sul');

-- inserção na tabela productWarehouse
insert into productWarehouse (idPWHproduct, idPWHwarehouse, quantity)
			values	(1, 1, 1000),
					(3, 2, 500),
					(5, 3, 750),
                    (7, 4, 320),
                    (6, 5, 580),
                    (2, 6, 460);
                    
-- inserção na tabela productOrder
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
			values	(2, 4, 2, null),
					(5, 5, 1, null),
					(3, 2, 1, null);

-- inserção na tabela supplier
insert into supplier (corporateName, supName, CNPJ, supLocation, contactSupplier)
			values	('Bezos Market', 'Amazon', 62694405000124, 'Campos do Jordão', 63975322748),
					('Pereira Shop', 'Shopeira', 49579933000174, 'Guarulhos', 69982680726),
                    ('Laila Campos', 'Lalahairs', 48949512000125, 'Maceió', 83985761917),
                    ('Rio Branco Soluções', 'SolCaseiro', 99077148000191, 'Cuiabá', 35992161238),
                    ('Imagination LTDA', 'Imagination', 88432665000115, 'Amazonas', 74997118678);

-- inserção na tabela productSupplier
insert into productSupplier (idPSproduct, idPSsupplier, quantity)
					values	(2, 4, 100),
							(3, 2, 230),
                            (5, 1, 140),
                            (1, 3, 350),
                            (4, 5, 540);

-- inserção na tabela seller
insert into seller	(corporateName, sellerName, cpf_cnpj, sellerLocation, sellerContact)
			values	('Tech eletronics', 'Tech eletronics', 12345678945632,'Rio de Janeiro', 219946287),
					('Botique Durgas', 'Botique Durgas', 123456783, 'Rio de Janeiro', 219567895),
					('Kids World', 'Kids World', 56789123654485, 'São Paulo', 1198657484);

-- inserção na tabela productSeller
insert into productSeller	(idProdSeller, idPproduct, quantity)
				values		(1,6,80),
							(2,7,10);