**Cláusula** **EXISTS** **(Departamentos com Funcionários):** Escreva uma consulta que liste o **NomeDep** de todos os departamentos que possuem **pelo menos um** funcionário cadastrado na tabela `Func`, utilizando obrigatoriamente a cláusula `EXISTS`[1][2].

SELECT D.NomeDep 
FROM Depto D
WHERE EXISTS(
    SELECT 1 
    FROM Func F
    WHERE F.CodDep = D.CodDep
)