--Esquema do Banco de Dados:**

--Depto** (`CodDep`, `NomeDep`)[1]
--Func** (`Mat`, `NomeFunc`, `Sal`, `CodDep`)[1]
--Cliente** (`CodCli`, `NomeCli`, `Tel`, `Endereco`)[2][3]
--Fornecedor** (`CodForn`, `NomeForn`, `Tel`, `End`)[2][3]

---

--Instruções:** Escreva as instruções SQL correspondentes para cada uma das questões a seguir.

--a)** Escreva uma consulta SQL que exiba o nome do funcionário (`NomeFunc`), o salário (`Sal`) e o nome do seu departamento (`NomeDep`) para todos os funcionários que recebem um salário superior à média salarial de toda a empresa[1].

--b)** Escreva uma consulta SQL que retorne o nome do funcionário (`NomeFunc`), o salário (`Sal`) e o nome do departamento (`NomeDep`) apenas para os funcionários que possuem o maior salário de seu respectivo departamento[1].

--c)** Escreva uma consulta SQL utilizando obrigatoriamente a cláusula `NOT EXISTS` que liste o nome dos departamentos (`NomeDep`) que não possuem nenhum funcionário com salário superior a R$ 10.000,00[2].

--d)** Escreva uma consulta SQL que gere exatamente o mesmo resultado da questão anterior (item **c**), porém utilizando obrigatoriamente a cláusula `NOT IN` no lugar de `NOT EXISTS`[2].

--e)** Escreva uma consulta SQL que combine os registros das tabelas `Cliente` e `Fornecedor` para gerar uma lista unificada de contatos com Nome, Telefone e Endereço, garantindo a remoção de registros duplicados no resultado final[2][3].


--LETRA (A)
SELECT f.NomeFunc, f.Sal, d.NomeDep
FROM func f   
INNER JOIN depto d ON d.coddep = f.coddep
WHERE f.Sal > (SELECT AVG(f.Sal)
FROM func)

--LETRA (B)
SELECT f.NomeFunc, f.Sal, d.NomeDep
FROM func f   
INNER JOIN depto d ON d.coddep = f.coddep
WHERE f.Sal = (SELECT MAX(f1.Sal) FROM func f1
WHERE f1.coddep = f.coddep)

--LETRA (C)
SELECT d.NomeDep 
FROM depto d
WHERE NOT EXISTS (SELECT f.Sal FROM func f WHERE f.CodDep = d.CodDep AND Sal > 10000) 

--LETRA (D)
SELECT d.NomeDep 
FROM depto d
WHERE d.CodDep NOT IN (SELECT CodDep FROM func WHERE Sal > 10000) 

--LETRA (E)
SELECT NomeCli,Tel,Endereco
FROM Cliente   
UNION 
SELECT NomeForn, Tel, Endereco 
FROM Fornecedor;

