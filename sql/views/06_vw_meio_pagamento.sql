-- ============================================================
-- VIEW: Meio de pagamento
-- Finalidade: distribuição de pagamentos por tipo, valor e parcelas
-- Criado em: 2026-11-23
-- ============================================================

USE olist;
GO

CREATE OR ALTER VIEW vw_meio_pagamento AS
SELECT 
    payment_type AS meio_pagamento,
    COUNT(*) AS total_transacoes,
    ROUND(SUM(payment_value), 2) AS valor_total,
    ROUND(AVG(payment_value), 2) AS ticket_medio,
    ROUND(AVG(payment_installments), 2) AS parcelas_media
FROM payments
GROUP BY payment_type;
GO