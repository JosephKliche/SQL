-- Queries do desafio 
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
