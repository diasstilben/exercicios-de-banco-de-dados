**Liste o código da categoria (**CodCat**) e a **média de preços** (`AVG`) dos produtos de cada categoria, exibindo apenas as categorias cuja média de preços seja superior a R$ 200,00.

SELECT CodCat, AVG(Preco) AS MediaDePrecos
FROM Produto 
GROUP BY CodCat
HAVING AVG(Preco)> 200,00;