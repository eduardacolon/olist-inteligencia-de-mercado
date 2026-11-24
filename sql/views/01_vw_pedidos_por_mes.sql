-- ============================================================
-- VIEW: Pedidos por mês
-- Finalidade: evolução temporal de pedidos e clientes únicos
-- Criado em: 2026-11-23
-- ============================================================

USE olist;
GO

CREATE OR ALTER VIEW vw_pedidos_por_mes AS
SELECT 
    o.ano_mes,
    COUNT(DISTINCT o.order_id) AS total_pedidos,
    COUNT(DISTINCT o.customer_id) AS clientes_unicos
FROM orders o
GROUP BY o.ano_mes;
GO