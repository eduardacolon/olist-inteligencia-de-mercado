-- ============================================================
-- VIEW: RFM por cliente
-- Finalidade: segmentação de clientes (recência, frequência, monetário)
-- Criado em: 2026-11-23
-- ============================================================

USE olist;
GO

CREATE OR ALTER VIEW vw_rfm_clientes AS
SELECT 
    customer_unique_id,
    recencia,
    frequencia,
    monetario
FROM rfm;
GO