**Escreva uma consulta SQL que retorne o **NomeProd**, o **Preco** e o **NomeCat** de todos os produtos que pertencem à categoria `'Eletrônicos'` e custam mais de R$ 500,00.

SELECT P.NomeProd, P.Preco, C.NomeCat
FROM Produto AS P
INNER JOIN Categoria AS C ON P.CodCat = C.CodCat
WHERE C.NomeCat = 'Eletrônicos' AND P.Preco > 500,00;