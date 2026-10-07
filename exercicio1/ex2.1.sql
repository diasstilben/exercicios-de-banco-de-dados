**Subconsulta Correlacionada (Menor Salário por Departamento):** Escreva uma consulta que liste o **NomeFunc**, o **Sal** e o **NomeDep** dos funcionários que possuem o **menor salário** de seu respectivo departamento[1].

SELECT F.NomeFunc, F.Sal, D.NomeDep
FROM Func as F 
INNER JOIN Depto D ON F.CodDep = D.CodDep
WHERE F.Sal = (
    SELECT MIN(F1.Sal)
    FROM Func F1
    WHERE F1.CodDep = F.CodDep
)