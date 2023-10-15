-- criação do banco de dados para o cenário de E-commerce

show databases;
create database ecommerce;
use ecommerce;
show tables;

-- criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
    fName varchar(10),
    mInit char(3),
    lName varchar(20),
    corporateName varchar(45),
    cpf_cnpj varchar(14),
    address varchar(150),
    type_client enum('PJ', 'PF'),
    constraint unique_cpf_cliente unique (cpf_cnpj)
);
select * from clients;
    
-- criar tabela produto
create table product(
	idProduct int auto_increment primary key,
    pName varchar(30) not null,
    informations varchar(150) not null,
    category enum('Vestimentas', 'Eletrônicos', 'Livraria', 'Brinquedos') not null,
    avaliation ENUM('1', '2', '3', '4', '5') default 1
);
select * from product;

-- criar tabela pagamento
create table payment(
	idClient int,
    idPayment int,
    typePayment enum('Boleto', 'Cartão', 'Dois cartões') not null,
    cardnumber varchar(20),
    limitAvailable float,
    primary key (idClient, idPayment)
);

-- criar table pedidos
create table orders(
	idOrder int auto_increment primary key,
    idOrderCliente int,
    orderStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    orderDescription varchar(255) not null,
    sendValue int,
    paymentCash bool default false,
    trackingCode varchar(45),
    constraint fk_oders_cliente foreign key (idOrderCliente) references clients(idClient)
);
select * from orders;

-- criar tabela estoque
create table wareHouse(
	idWarehouse int auto_increment primary key,
    location varchar(255) not null
);
select * from wareHouse;

-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    corporateName varchar(45) not null,
    supName varchar(45),
    cnpj char(14),
    supLocation varchar(45),
    contactSupplier char(11) not null,
    constraint unique_supplier unique (cnpj)
);
select * from supplier;

-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    corporateName varchar(45) not null,
    sellerName varchar(45),
    cpf_cnpj varchar(14),
    sellerLocation varchar(45),
    sellerContact char(11) not null,
    constraint unique_cnpj_seller unique (cpf_cnpj)
);
select * from seller;

-- criar tabela produto_vendedor
create table productSeller(
	idProdSeller int,
    idPproduct int,
    quantity int default 1,
    primary key (idProdSeller, idPproduct),
    constraint fk_product_seller foreign key (idProdSeller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
);
select * from productSeller;

-- criar tabela produto_armazem
create table productWarehouse(
	idPWHproduct int,
    idPWHwarehouse int,
    quantity int default 0,
    primary key (idPWHproduct, idPWHwarehouse),
    constraint fk_pwh_product foreign key productWarehouse(idPWHproduct) references product(idProduct),
    constraint fk_pwh_warehouse foreign key productWarehouse(idPWHwarehouse) references wareHouse(idWarehouse)
);
select * from productWarehouse;

-- criar tabela product_supplier
create table productSupplier(
	idPSproduct int,
    idPSsupplier int,
    quantity int default 1,
    primary key (idPSproduct, idPSsupplier),
    constraint fk_ps_product foreign key productSupplier(idPSproduct) references product(idProduct),
    constraint fk_ps_supplier foreign key productSupplier(idPSsupplier) references supplier(idSupplier)
);
select * from productsupplier;

-- criar tabela produto_pedido
create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_po_product foreign key (idPOproduct) references product(idProduct),
    constraint fk_po_order foreign key (idPOorder) references orders(idOrder)
);
select * from productOrder;

-- inserção de dados
insert into clients (fName, Minit, lName, cpf_cnpj, corporateName, address, type_client)
			values	('Maria', 'M', 'Silva', 12346789, 'Gymnastic', 'Rua Silva de Prata 29, Carangola - Cidade das Flores', 'PJ'),
					('Matheus', 'O', 'Pimentel', 987654321, null, 'Rua Alameda 289, Centro - Cidade das Flores', 'PF'),
					('Ricardo', 'F', 'Silva', 45678913, null, 'Rua Almeda Vinha 1009, Centro - Cidade das Flores', 'PF'),
					('Julia', 'S', 'França', 789123456, 'Doctor J.', 'Rua Lareijras 861, Centro - Cidade das Flores', 'PJ'),
					('Roberta','G', 'Assis', 98745631, null, 'Avenidade Koller 19, Centro - Cidade das Flores','PF'),
					('Isabela', 'M', 'Cruz', 654789123, 'Isacakes', 'Rua Alameda das Flores 28, Centro - Cidade das Flores', 'PJ');

insert into product (pName, informations, category, avaliation)
			values	('Touca de dormir', 'Ótimo material para proteger o cabelo', 'Vestimentas', '4'),
					('Abajur', 'Ilumina bem e economiza energia', 'Eletrônicos', '3'),
                    ('Lord of Rings', 'Conheça o mundo onde tudo é possível', 'Livraria','5'),
                    ('1001 receitas', 'Fundamental para todo cozinheiro de primeira viagem', 'Livraria', '4'),
                    ('Barbie e Ken', 'Direto dos cinemas para seu quarto', 'Brinquedos', 5),
                    ('Echo Dot 3', 'Tecnologia e inovação para sua casa', 'Eletrônicos', '4'),
                    ('Calça Balenciaga', 'Fora da curva, assim como você', 'Vestimentas', '5');
                    
insert into orders(idOrderCliente, orderStatus, orderDescription, sendValue, paymentCash, trackingCode)
			values	('1', 'Confirmado', 'Via Website', '3', false, '34561287'),
					('2', 'Cancelado', 'Via Website', '4', true, '654789524'),
                    ('3', default, 'Via App', '8', true, '56435159'),
                    ('4', default, 'Via Website', '4', false, '123456123'),
                    ('5', 'Confirmado', 'Via App', '3', true, '12345698');

insert into wareHouse (location)
			values	('Vitória'),
					('Bahia'),
					('Rio Grande do Sul'),
                    ('Santa Catarina'),
                    ('Brasília'),
                    ('Mato Grosso do Sul');

insert into productWarehouse (idPWHproduct, idPWHwarehouse, quantity)
			values	(1, 1, 1000),
					(3, 2, 500),
					(5, 3, 750),
                    (7, 4, 320),
                    (6, 5, 580),
                    (2, 6, 460);
                    
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
			values	(2, 4, 2, null),
					(5, 5, 1, null),
					(3, 2, 1, null);

insert into supplier (corporateName, supName, CNPJ, supLocation, contactSupplier)
			values	('Bezos Market', 'Amazon', 62694405000124, 'Campos do Jordão', 63975322748),
					('Pereira Shop', 'Shopeira', 49579933000174, 'Guarulhos', 69982680726),
                    ('Laila Campos', 'Lalahairs', 48949512000125, 'Maceió', 83985761917),
                    ('Rio Branco Soluções', 'SolCaseiro', 99077148000191, 'Cuiabá', 35992161238),
                    ('Imagination LTDA', 'Imagination', 88432665000115, 'Amazonas', 74997118678);

insert into productSupplier (idPSproduct, idPSsupplier, quantity)
					values	(2, 4, 100),
							(3, 2, 230),
                            (5, 1, 140),
                            (1, 3, 350),
                            (4, 5, 540);

insert into seller	(corporateName, sellerName, cpf_cnpj, sellerLocation, sellerContact)
			values	('Tech eletronics', 'Tech eletronics', 12345678945632,'Rio de Janeiro', 219946287),
					('Botique Durgas', 'Botique Durgas', 123456783, 'Rio de Janeiro', 219567895),
					('Kids World', 'Kids World', 56789123654485, 'São Paulo', 1198657484);

insert into productSeller	(idProdSeller, idPproduct, quantity)
				values		(1,6,80),
							(2,7,10);

-- //queries do desafio 
-- Quantos pedidos foram feitos por cada cliente?
select c.idClient, c.fName, count(*) as Number_of_orders
		from clients c
		inner join orders o ON c.idClient = o.idOrderCliente
		group by idClient;

-- Algum vendedor também é fornecedor?
select s.sellerName as Vendedor_Fornecedor, p.cnpj as CPF_CNPJ
	from seller s join supplier p
    on s.cpf_cnpj = p.cnpj;

-- Relação de produtos, fornecedores e estoques
select s.supName as Fornecedor, p.pName as 'Nome dos Produtos'
		from supplier s
		inner join product p
			on s.idSupplier = p.idProduct
		inner join wareHouse w
			on location = p.idProduct;
        
-- Relação de nomes dos fornecedores e nomes dos produtos
select s.supName as Fornecedor, p.pName as 'Nome dos Produtos'
	from supplier s
	inner join product p
		on s.idSupplier = p.idProduct;
	
-- Relação de pedidos que estão em processamento
select c.fName as Cliente, o.idOrder as Número_do_Pedido, o.orderStatus as Status_do_Pedido
		from clients c
		inner join orders o
		on o.idOrdercliente = c.idClient
		where o.orderStatus = 'Em processamento';
        
-- Canais com 2 pedidos ou mais
select orderDescription, count(*)
	from orders
    group by orderDescription
    having count(*) >= 2;
    
-- Listar clientes PJ
select c.fName as Cliente, c.cpf_cnpj as CNPJ
	from clients c
	where type_client = 'PJ'
    order by c.fname;