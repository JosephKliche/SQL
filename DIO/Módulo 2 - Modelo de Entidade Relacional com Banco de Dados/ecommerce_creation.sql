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
