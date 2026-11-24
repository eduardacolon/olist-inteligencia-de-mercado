-- ============================================================
-- VIEW: Satisfação por categoria
-- Finalidade: nota média e percentual de sentimentos por categoria
-- Criado em: 2026-11-23
-- ============================================================

USE olist;
GO

CREATE OR ALTER VIEW vw_satisfacao_categoria AS
SELECT 
    p.product_category_name_english AS categoria,
    COUNT(r.review_id) AS total_avaliacoes,
    ROUND(AVG(CAST(r.review_score AS FLOAT)), 2) AS nota_media,
    ROUND(SUM(CASE WHEN r.sentimento = 'positivo' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS pct_positivo,
    ROUND(SUM(CASE WHEN r.sentimento = 'negativo' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) AS pct_negativo
FROM reviews r
JOIN order_items oi ON r.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category_name_english
HAVING COUNT(r.review_id) >= 100;
GO