--Cliente (CodCli, NomeCli, Cidade)
--Pedido (NumPed, DataPed, ValorTotal, CodCli)
--Produto (CodProd, NomeProd, Preco, CodCategoria)
--Categoria (CodCategoria, NomeCategoria)

--Exercício 1
--Objetivo: Listar o nome do produto, o preço e o nome da sua categoria para todos os produtos que têm o --MENOR preço de sua respectiva categoria.
--Colunas a exibir: NomeProd, Preco, NomeCategoria

--Exercício 2
--Objetivo: Listar o número do pedido, a data, o valor total do pedido e o nome do cliente para todos os --pedidos cujo valor seja SUPERIOR à média de valores dos pedidos daquele mesmo cliente.
--Colunas a exibir: NumPed, DataPed, ValorTotal, NomeCli

--Exercício 3
--Objetivo: Listar a data do pedido, o valor total e o nome do cliente para o pedido mais recente (maior DataPed) de CADA cliente.
--Colunas a exibir: NomeCli, DataPed, ValorTotal

SELECT pr.nomeProd, pr.preco , c.NomeCategoroia
FROM PRODTO pr  
INNER JOIN Categoria c ON c.CodCategoria = pr.CodCategoria
WHERE  pr.preco = (SELECT MIN(pr1.preco) FROM produto pr1 WHERE pr.CodCategoria = pr1.CodCategoria)

SELECT p.NumPed, p.DataPed, p.ValorTotal, c.NomeCli
FROM Pedido p  
INNER JOIN Cliente c ON p.CodCli = c.CodCli
WHERE p.ValorTotal > (SELECT AVG(p1.ValorTotal) FROM Pedido p1 WHERE p1.CodCli = p.CodCli)


SELECT c.NomeCli , p.DataPed, p.ValorTotal
FROM Pedido p  
INNER JOIN Cliente c ON p.CodCli = c.CodCli
WHERE p.DataPed = (SELECT MAX(p1.DataPed) FROM Pedido p1 WHERE p1.CodCli = p.CodCli)

UPDATE Livro
SET preco = preco * 1.5
WHERE codedit = (SELECT  codedit FROM editora WHERE Nomeedit = 'Pearson')

DELETE FROM Cliente 
WHERE NomeCli LIKE 'h%'

SELECT f.NomeFunc, g.SalarioGer
FROM Func f  
INNER JOIN Func g ON g.Matr = f.Matr
INNER JOIN Editora e ON e.codedit = f.codedit
WHERE Nomeedit = 'Bookman' AND g.Salario < 7000

