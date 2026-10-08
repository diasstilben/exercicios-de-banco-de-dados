**Seleção e Filtro Básico (** **SELECT** **e** **WHERE** **):** Escreva uma consulta SQL que retorne o **NomeFunc** e o **Sal** de todos os funcionários da tabela `Func` que recebem um salário superior a R$ 3.000,00[1].

SELECT NomeFunc, Sal 
FROM Func 
WHERE F.Sal > 3.000,00;

**Ordenação (** **ORDER BY** **):** Escreva uma consulta que liste o **NomeFunc** e o **Sal** de todos os funcionários, ordenados do **maior para o menor** salário (`DESC`)[1].

SELECT NomeFunc,SaL
FROM FUNC
ORDER BY SaL DESC;

**Junção Simples (** **INNER JOIN** **):** Escreva uma consulta que exiba o **NomeFunc** e o respectivo **NomeDep** de cada funcionário, realizando a junção entre a tabela `Func` e a tabela `Depto` através da chave `CodDep`

SELECT F.NomeFunc, D.NomeDep
FROM Func AS F
INNER JOIN Depto AS D ON F.CodDep = D.CodDep;

**Agrupamento e Contagem (** **COUNT** **e** **GROUP BY** **):** Escreva uma consulta que exiba o **CodDep** e a **quantidade total de funcionários** cadastrados em cada departamento[1]

SELECT CodDep, COUNT(*) AS TotalFuncionario
FROM Func
GROUP BY CodDep;

**Filtro em Grupos Agregados (** **HAVING** **):** Escreva uma consulta que exiba o **CodDep** e a **média salarial** (`AVG`) dos funcionários de cada departamento, exibindo apenas os departamentos que possuem média salarial superior a R$ 5.000,00[1].

SELECT CodDep, AVG(Sal) AS MediaSalarial
FROM Func
HAVING AVG(Sal) > 5.000,00

**Busca por Padrões de Texto (** **LIKE** **):** Escreva uma consulta na tabela `Cliente` que retorne o **NomeCli** e o **Tel** de todos os clientes cujo nome comece com a letra "A"[2].

SELECT NomeCli, Tel
FROM Clientes
WHERE NomeCli LIKE %'A';
