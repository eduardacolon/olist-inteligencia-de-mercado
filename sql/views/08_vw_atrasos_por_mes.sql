-- ============================================================
-- VIEW: Atrasos por mês
-- Finalidade: taxa de atraso, tempos de aprovação e despacho
-- Criado em: 2026-11-23
-- ============================================================

USE olist;
GO

CREATE OR ALTER VIEW vw_atrasos_por_mes AS
SELECT 
    o.ano_mes,
    COUNT(*) AS total_entregues,
    COUNT(CASE WHEN o.atrasou = 'Sim' THEN 1 END) AS pedidos_atrasados,
    COUNT(CASE WHEN o.atrasou = 'Não' THEN 1 END) AS pedidos_no_prazo,
    ROUND(AVG(o.dias_atraso), 2) AS atraso_medio_dias,
    ROUND(AVG(o.horas_aprovacao), 2) AS horas_aprovacao_media,
    ROUND(AVG(o.horas_despacho), 2) AS horas_despacho_media
FROM orders o
WHERE o.order_status = 'delivered'
GROUP BY o.ano_mes;
GO