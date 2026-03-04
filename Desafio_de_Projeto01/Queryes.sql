-- ================================== --
-- 1 Faturamento Total e Ticket Médio
-- ================================== --
-- Qual o faturamento total da empresa considerando apenas pagamentos aprovados ?
SELECT SUM(payments.amount) AS Total_de_Vendas 
	FROM payments
	WHERE payment_status = 'Approved';
    
-- Qual o ticket medio por Pedido?
SELECT 
	SUM(p.amount) / COUNT(DISTINCT p.order_id) as ticket_medio
    FROM payments p
    WHERE p.payment_status = 'Approved';
    
-- ================================== --
-- 2 Produtos Mais Vendidos
-- ================================== --
SELECT
	p.product_name, 
    sum(po.quantity) AS total_sold
FROM product_order po
JOIN products p 
	ON po.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold DESC
LIMIT 3;

-- ================================== --
-- 3 Clientes Mais Valiosos
-- ================================== --

-- Quais clientes geraram maior valor de compras (considerando apenas pedidos pagos e aprovado)?
select * from customers;
SELECT
	CONCAT(c.first_name, ' ', c.last_name) as complete_name,
    SUM(p.amount) AS total_spent
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN payments p
	ON p.order_id = o.order_id
WHERE p.payment_status = 'Approved'
GROUP BY c.customer_id, complete_name
ORDER BY total_spent DESC;

-- ================================== --
-- 4 Receita por categoria
-- ================================== --

-- Qual cateogria de produto gera mais receita ? 
SELECT 
	pro.category,
    SUM(po.quantity * pro.price) as total_revenue
FROM products pro
JOIN product_order po
	ON pro.product_id = po.product_id
JOIN payments pay
	ON pay.order_id = po.order_id
WHERE pay.payment_status = 'Approved'
GROUP BY pro.category
ORDER BY total_revenue DESC;

-- ================================== --
-- 5 Análise de Status dos Pedidos
-- ================================== --
 
 -- Quantos pedidos estão em cada status?
 select * from orders;
 
 SELECT 
	order_status,
    COUNT(order_id) as total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders;

-- Qual o percentual de Pedidos já entregue.
SELECT 
    ROUND(
        (SUM(order_status = 'Delivered') / COUNT(*)) * 100,
        2
    ) AS delivered_percentage
FROM orders;
