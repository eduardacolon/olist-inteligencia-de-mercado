-- ============================================================
-- VIEW: Receita por mês
-- Finalidade: receita total, ticket médio por item e volume de pedidos
-- Criado em: 2026-11-23
-- ============================================================

USE olist;
GO

CREATE OR ALTER VIEW vw_receita_por_mes AS
SELECT 
    o.ano_mes,
    COUNT(DISTINCT o.order_id) AS total_pedidos,
    ROUND(AVG(oi.preco_total_item), 2) AS ticket_medio_item,
    ROUND(SUM(oi.preco_total_item), 2) AS receita_total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY o.ano_mes;
GO