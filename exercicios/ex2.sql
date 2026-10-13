--**Curso** (`CodCurso`, `NomeCurso`, `Duracao`)
--**Aluno** (`Matricula`, `NomeAluno`, `Mensalidade`, `CodCurso`)
--**Professor** (`CodProf`, `NomeProf`, `Salario`, `CodCurso`)

---

--Instruções:** Escreva a instrução SQL correspondente para cada uma das questões a seguir.

--a)** Escreva uma consulta SQL que exiba o nome do curso (`NomeCurso`) apenas para os cursos cuja **média das mensalidades dos seus alunos seja maior do que a média geral de mensalidade de todos os alunos da instituição**.

--b)** Escreva uma consulta SQL que retorne o nome do aluno (`NomeAluno`), o valor da sua mensalidade (`Mensalidade`) e o código do seu curso (`CodCurso`) para os alunos que pagam uma **mensalidade abaixo da média de mensalidade do seu próprio curso**.

--c)** Escreva uma consulta SQL utilizando obrigatoriamente a cláusula **EXISTS** que liste o nome dos cursos (`NomeCurso`) que possuem **pelo menos um professor** cadastrado com salário superior a R$ 8.000,00.

--d)** Escreva uma consulta SQL utilizando a cláusula **IN** que retorne o nome do aluno (`NomeAluno`) e o código do seu curso (`CodCurso`) para os alunos matriculados em cursos que possuem **mais de 5 alunos cadastrados**.

--e)** Escreva uma consulta SQL utilizando obrigatoriamente a cláusula **NOT EXISTS** que liste o nome dos cursos (`NomeCurso`) que **não possuem nenhum aluno** matriculado.


--LETRA (A)
SELECT c.NomeCurso
FROM CURSO
INNER JOIN Aluno a ON a.CodCurso = c.CodCurso
GROUP BY c.CodCurso, c.NomeCurso
HAVING AVG(a.Mensalidade) > (SELECT AVG(a1.Mensalidade) FROM aluno a1) 

--LETRA (B)
SELECT a.NomeAluno, a.Mensalidade, c.CodCurso
FROM Aluno a     
INNER JOIN Curso c ON c.CodCurso = a.CodCurso
WHERE a.Mensalidade < (SELECT AVG(a1.Mensalidade) FROM Aluno a1 WHERE a1.CodCurso = a.CodCurso)

--LETRA (C)
SELECT c.NomeCurso 
FROM Curso c
WHERE EXISTS (SELECT p.Salario FROM Professor p WHERE p.Salario > 8000 AND p.CodCurso = c.CodCurso)

--LETRA (D)
SELECT a.NomeAluno, c.CodCurso
FROM Aluno a   
INNER JOIN Curso c ON c.CodCurso = a.CodCurso
WHERE a.CodCurso IN (SELECT a1.CodCurso FROM Aluno a1 
GROUP BY CodCurso
HAVING COUNT(a1.CodCurso) > 5)

--LETRA (E)
SELECT c.NomeCurso FROM Curso c WHERE NOT EXISTS ( SELECT 1 FROM Aluno a WHERE a.CodCurso = c.CodCurso );