USE ecommerce;

-- ========================
-- customers (8)
-- ========================
INSERT INTO customers 
(Fname, Lname, CPF, Address_line1, City, State, postal_code, Country)
VALUES
('Ana','Oliveira','11111111111','Rua 1','Salvador','BA','40000001','Brasil'),
('Bruno','Santos','22222222222','Rua 2','Feira','BA','44000001','Brasil'),
('Carla','Mendes','33333333333','Rua 3','Ilheus','BA','45600000','Brasil'),
('Daniel','Costa','44444444444','Rua 4','Itabuna','BA','45700000','Brasil'),
('Eduardo','Alves','55555555555','Rua 5','Jequie','BA','45200000','Brasil'),
('Fernanda','Lima','66666666666','Rua 6','PortoSeguro','BA','45800000','Brasil'),
('Gabriel','Rocha','77777777777','Rua 7','Barreiras','BA','47800000','Brasil'),
('Helena','Ribeiro','88888888888','Rua 8','Juazeiro','BA','48900000','Brasil');

-- ========================
-- SELLERS (5)
-- ========================
INSERT INTO seller 
(socialName, CNPJ, CPF, contact, location)
VALUES
('TechMax','10000000000001','90000000001','71911110001','Salvador'),
('ModaTop','10000000000002','90000000002','71911110002','Feira'),
('KidsWorld','10000000000003','90000000003','71911110003','Ilheus'),
('FoodBrasil','10000000000004','90000000004','71911110004','Itabuna'),
('GameStore','10000000000005','90000000005','71911110005','Salvador');

-- ========================
-- PRODUCTS (12)
-- ========================
INSERT INTO product
(Pname, Category, Information, Price, Brand, Rating)
VALUES
('Notebook','Eletrônico','i5 16GB',4200.00,'Lenovo',4.7),
('Mouse','Eletrônico','Mouse Gamer',120.00,'Logitech',4.6),
('Teclado','Eletrônico','Teclado Mecânico',350.00,'Redragon',4.5),
('Camisa','Vestimenta','Camisa Preta',89.90,'Adidas',4.3),
('Calca','Vestimenta','Calça Jeans',159.90,'Levis',4.4),
('Tenis','Vestimenta','Tenis Esportivo',299.90,'Nike',4.6),
('Boneca','Brinquedo','Boneca Fashion',79.90,'Estrela',4.8),
('Carrinho','Brinquedo','Carrinho Controle',199.90,'HotWheels',4.7),
('Chocolate','Alimento','Chocolate 200g',9.50,'Lacta',4.9),
('Cafe','Alimento','Cafe 500g',18.00,'Pilao',4.5),
('Console','Eletrônico','Console X',3500.00,'Sony',4.9),
('Headset','Eletrônico','Headset RGB',280.00,'HyperX',4.6);

-- ========================
-- PRODUCT SELLER
-- ========================
INSERT INTO productseller VALUES
(1,1,20),(1,2,50),(1,3,40),(5,11,10),(5,12,25),
(2,4,60),(2,5,40),(2,6,30),
(3,7,50),(3,8,35),
(4,9,200),(4,10,150);

-- ========================
-- PRODUCT STORAGE (5)
-- ========================
INSERT INTO productstorage (storageLocation, quantity) VALUES
('Galpao A',300),
('Galpao B',400),
('Galpao C',250),
('Galpao D',500),
('Galpao E',150);

-- ========================
-- STORAGE LOCATION
-- ========================
INSERT INTO storagelocation VALUES
(1,1,'A1'),(2,1,'A2'),(3,1,'A3'),
(4,2,'B1'),(5,2,'B2'),(6,2,'B3'),
(7,3,'C1'),(8,3,'C2'),
(9,4,'D1'),(10,4,'D2'),
(11,5,'E1'),(12,5,'E2');

-- ========================
-- ORDERS (10)
-- ========================
INSERT INTO orders (idOrderCliente, orderStatus, orderDescription, Shipping) VALUES
(1,'Confirmado','Compra eletronicos',25),
(2,'Enviado','Compra roupas',18),
(3,'Processando','Compra brinquedos',20),
(4,'Confirmado','Compra alimentos',15),
(5,'Cancelado','Pedido cancelado',10),
(6,'Confirmado','Compra console',30),
(7,'Enviado','Compra headset',20),
(8,'Processando','Compra variada',22),
(1,'Confirmado','Segunda compra',12),
(3,'Enviado','Compra extra',18);

-- ========================
-- PRODUCT ORDER (20 registros)
-- ========================
INSERT INTO productorder VALUES
(1,1,1,'Disponível'),
(2,1,2,'Disponível'),
(4,2,1,'Disponível'),
(5,2,1,'Disponível'),
(7,3,2,'Disponível'),
(8,3,1,'Disponível'),
(9,4,5,'Disponível'),
(10,4,3,'Disponível'),
(11,6,1,'Disponível'),
(12,7,1,'Disponível'),
(3,8,1,'Disponível'),
(6,8,1,'Disponível'),
(2,9,3,'Disponível'),
(1,9,1,'Disponível'),
(8,10,2,'Disponível'),
(7,10,1,'Disponível'),
(5,8,2,'Disponível'),
(9,8,4,'Disponível'),
(12,6,1,'Disponível'),
(10,5,2,'Sem estoque');

-- ========================
-- PAYMENTS (10)
-- ========================
INSERT INTO payments
(idOrder, paymentMethod, amount, paymentDate, paymentStatus, transactionCode)
VALUES
(1,'Cartao',4440.00,NOW(),'Aprovado','TX1001'),
(2,'Pix',249.80,NOW(),'Aprovado','TX1002'),
(3,'Boleto',359.70,NOW(),'Pendente','TX1003'),
(4,'Pix',110.50,NOW(),'Aprovado','TX1004'),
(5,'Cartao',36.00,NOW(),'Estornado','TX1005'),
(6,'Cartao',3500.00,NOW(),'Aprovado','TX1006'),
(7,'Pix',280.00,NOW(),'Aprovado','TX1007'),
(8,'Boleto',689.80,NOW(),'Pendente','TX1008'),
(9,'Pix',4560.00,NOW(),'Aprovado','TX1009'),
(10,'Cartao',479.70,NOW(),'Aprovado','TX1010');