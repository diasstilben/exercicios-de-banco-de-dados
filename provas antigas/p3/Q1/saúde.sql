-- LETRA (A)
SELECT p.NomePac, m.NomeMed, e.DescrEsp
FROM PACIENTE p
INNER JOIN ATENDIMENTO a ON a.CodPac = p.CodPac
INNER JOIN MEDICO m ON m.matrMed = a.matrMed
INNER JOIN ESPECIALIDADE e e.codespec = m.codespec
WHERE m.Salario > 7.000 
AND a.Data BETWEEN '2023-03-01' AND '2023-03-31';

--LETRA (B)
SELECT e.DescrEsp, AVG(a.CustoAtend) AS CustoMedio
FROM ATENDIMENTO a
INNER JOIN MEDICO m ON m.Matr = a.matrMed
INNER JOIN ESPECIALIDADE e ON e.CodEsp = m.CodEsp
GROUP BY e.CodEsp
HAVING AVG(a.CustoAtend) < 60;

--LETRA (C)
SELECT e.DescrEsp, COUNT(a.CustoAtend) AS CustoTotal
FROM ATENDIMENTO aI
INNER JOIN PACIENTE p ON a.CodPac = p.CodPac
INNER JOIN MEDICO m ON a.MatrMed = m.Matr
INNER JOIN ESPECIALIDADE e ON m.CodEspec = e.CodEsp
WHERE YEAR(p.DataNasc) >= 2000
GROUP BY e.DescrEsp;

--LETRA (D)
SELECT p.NomePac, COUNT(a.NumAtend) AS TotalAtends
FROM ATENDIMENTO a     
INNER JOIN PACIENTE p ON p.CodPac = A.CodPac
WHERE MONTH(a.Data) = 1
    AND YEAR(a.Data) = 2024
GROUP BY p.CodPac,p.NomePac
HAVING COUNT(a.NumAtend) > 2; 

--LETRA (E)
SELECT m.NomeMed, a.Data, p.NomePac
FROM MEDICO m
JOIN ATENDIMENTO a ON m.Matr = a.MatrMed
JOIN PACIENTE p ON a.CodPac = p.CodPac
JOIN ESPECIALIDADE e ON m.CodEspec = e.CodEsp
WHERE YEAR(a.Data) = 2024
  AND e.DescrEsp = 'Cardiologia'
ORDER BY a.Data DESC;

--LETRA (F)
SELECT m.NomeMed, COUNT(a.NumAtend) AS QtdTotal, SUM(a.CustoAtend) AS CustoTotal
FROM MEDICO m
JOIN ATENDIMENTO a ON m.Matr = a.MatrMed
WHERE m.NomeMed LIKE 'A%' OR m.NomeMed LIKE 'E%'
GROUP BY m.Matr, m.NomeMed;