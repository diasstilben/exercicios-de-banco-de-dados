**Subconsulta Correlacionada (Média por Departamento):** Escreva uma consulta SQL que retorne o **NomeFunc** e o **Sal** de todos os funcionários que ganham um salário superior à **média salarial do seu próprio departamento** (`CodDep`)[1].

SELECT F.NomeFunc, F.Sal
FROM Func as F 
WHERE F.Sal > (
    SELECT AVG(F1.Sal)
    FROM Func F1
    WHERE F1.CodDep = F.Coddep
);
