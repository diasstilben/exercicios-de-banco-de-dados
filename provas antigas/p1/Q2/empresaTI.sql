// LETRA (A)
SELECT f.NomeFunc, p.NomeProj, e.DescrEsp
FROM FUNC f
JOIN ESPECIALIDADE e ON f.CodEsp = e.CodEsp
JOIN ALOCACAO a ON f.Matr = a.Matr
JOIN PROJETO p ON a.NumProj = p.NumProj
WHERE p.Custo > 50000 
  AND f.Salario > 5000;

// LETRA (B)
SELECT e.DescrEsp, AVG(f.Salario) AS Salariomedio
FROM FUNC f
JOIN ESPECIALIDADE e ON f.CodEsp = e.CodEsp
GROUP BY e.DescrEsp;

// LETRA (C)
SELECT SUM(p.Custo) AS CustoTotal
FROM PROJETO p
JOIN CLIENTE c ON p.CodCli = c.CodCli
WHERE c.NomeCli LIKE 'A%'
  AND p.Dataini BETWEEN '2016-01-01' AND '2016-01-31'

// LETRA (D)
SELECT c.NomeCli, COUNT(p.NumProj) AS TotalProjs
FROM CLIENTE c
JOIN PROJETO p ON c.CodCli = p.CodCli
WHERE p.DataIni BETWEEN '2015-01-01' AND '2015-12-31'
GROUP BY c.NomeCli;

// LETRA (E)
SELECT c.NomeCli, SUM(p.Custo) AS CustoTotal
FROM CLIENTE c
JOIN PROJETO p ON c.CodCli = p.CodCli
GROUP BY c.NomeCli
HAVING SUM(p.Custo) > 100000;

// LETRA (F)
SELECT f.NomeFunc, f.Salario, chefe.NomeFunc AS NomeChefe
FROM FUNC f
JOIN FUNC chefe ON f.MatrChefe = chefe.Matr
JOIN ESPECIALIDADE e ON chefe.CodEsp = e.CodEsp
WHERE f.Salario BETWEEN 3000 AND 4000
  AND e.DescrEsp = 'Banco de dados';