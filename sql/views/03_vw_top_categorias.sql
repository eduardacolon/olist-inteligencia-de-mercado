-- ============================================================
-- VIEW: Top 10 categorias por receita
-- Finalidade: identificar categorias mais lucrativas
-- Criado em: 2026-11-23
-- ============================================================

USE olist;
GO

CREATE OR ALTER VIEW vw_top_categorias AS
SELECT TOP 10
    p.product_category_name_english AS categoria,
    COUNT(DISTINCT o.order_id) AS total_pedidos,
    ROUND(SUM(oi.preco_total_item), 2) AS receita_total,
    ROUND(AVG(oi.preco_total_item), 2) AS ticket_medio
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'delivered'
GROUP BY p.product_category_name_english
ORDER BY receita_total DESC;
GO