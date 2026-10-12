// LETRA (A)
SELECT r.NomeRec, c.NomeCat, ref.NomeRef
FROM RECEITA r
JOIN CATEGORIARECEITA c ON r.CodCat = c.CodCat
JOIN REFEICAO ref ON r.CodRef = ref.CodRef
JOIN RECEITAITEM ri ON r.CodRec = ri.CodRec
JOIN ALIMENTO a ON ri.CodAlim = a.CodAlim
WHERE a.NomeAlim = 'Abóbora';

// LETRA (B)
SELECT NomeAlim
FROM ALIMENTO
WHERE QtdGord = (SELECT MIN(QtdGord) FROM ALIMENTO);

// LETRA (C)
SELECT r.NomeRec AS NomeReceita, SUM(ri.QtdGramas * ri.PrecoGrama) AS CustoTotal
FROM RECEITA r
JOIN CATEGORIARECEITA c ON r.CodCat = c.CodCat
JOIN RECEITAITEM ri ON r.CodRec = ri.CodRec
WHERE c.NomeCat = 'Dietéticas'
GROUP BY r.CodRec, r.NomeRec
HAVING SUM(ri.QtdGramas * ri.PrecoGrama) < 40;

// LETRA (D)
SELECT ref.NomeRef, 
       SUM(a.QtdGord * ri.QtdGramas) AS QtdTotalGord, 
       SUM(a.QtdVitamA * ri.QtdGramas) AS QtdTotalVitamA
FROM REFEICAO ref
JOIN RECEITA r ON ref.CodRef = r.CodRef
JOIN RECEITAITEM ri ON r.CodRec = ri.CodRec
JOIN ALIMENTO a ON ri.CodAlim = a.CodAlim
WHERE ref.NomeRef IN ('Almoço', 'Lanche')
GROUP BY ref.NomeRef;

// LETRA (E)
DELETE FROM ALIMENTO 
WHERE CodTipoAlim IN (
    SELECT CodTipoAlim 
    FROM TIPOALIM 
    WHERE NomeTipoAlim = 'Carnes'
);