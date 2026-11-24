-- ============================================================
-- VIEW: Vendas por estado
-- Finalidade: mapa de calor de vendas por região
-- Criado em: 2026-11-23
-- ============================================================

USE olist;
GO

CREATE OR ALTER VIEW vw_vendas_por_estado AS
SELECT 
    c.customer_state AS estado,
    COUNT(DISTINCT o.order_id) AS total_pedidos,
    ROUND(SUM(oi.preco_total_item), 2) AS receita_total,
    ROUND(AVG(oi.preco_total_item), 2) AS ticket_medio
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_state;
GO