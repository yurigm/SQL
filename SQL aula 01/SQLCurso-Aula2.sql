 -- funções de agregação agregam ou combinam dados de uma tabela em 1 resultado só

 -- a função SUM soma os dados de uma coluna e obtem um resultado total)
 SELECT TOP 10 SUM(linetotal) AS "Soma"
 FROM Sales.SalesOrderDetail

 -- a função MIN encontra o menor valor da tabela escolhida
 SELECT TOP 10 MIN(linetotal) AS "Minimo"
 FROM Sales.SalesOrderDetail

 -- a função MAX encontra o maior valor da tabela escolhida
 SELECT TOP 10 MAX(linetotal) AS "Máximo"
 FROM Sales.SalesOrderDetail

 -- a função AVG aponta uma média dos valores escolhidos
 SELECT TOP 10 AVG(linetotal) as "Average"
 FROM Sales.SalesOrderDetail


 -- GROUP BY divide o resultado de sua pesquisa em grupos
 SELECT SpecialOfferID, SUM(UnitPrice) AS "Soma"
 FROM Sales.SalesOrderDetail
 GROUP BY SpecialOfferID

 SELECT ProductID, COUNT(ProductID) AS "Contagem"
 FROM Sales.SalesOrderDetail
 GROUP BY ProductID

 SELECT FirstName, COUNT(FirstName) AS "Contagem"
 FROM Person.Person
 GROUP BY FirstName

 SELECT Color, AVG(LISTPRICE) AS "Preço"
 FROM Production.Product
 WHERE Color = 'Silver'
 GROUP BY Color

 -- DESAFIOS

 -- 1 - Eu preciso saber quantas pessoas tem o mesmo Middle Name agrupadas por o Middle Name

 SELECT MiddleName, COUNT(MiddleName) AS "quantidade"
 FROM Person.Person
 GROUP BY MiddleName

 -- Eu preciso saber em média qual é a quantidade que cada produto é vendido na loja
 SELECT ProductID, AVG(OrderQty) AS "Média"
 FROM Sales.SalesOrderDetail
 GROUP BY ProductID

 -- Eu quero saber quais foram as 10 vendas que no total tiveram os maiores valores de venda (linetotal) por produto do maior valor para o menor

 SELECT TOP 10 ProductID, MAX(UnitPrice) AS "Preço"
 FROM Sales.SalesOrderDetail
 GROUP BY ProductID

 -- eu quero saber qual foram as 10 vendas que no total tiveram os maiores valores de venda(linetotal) por produto do maior para o menor
 SELECT TOP 10 ProductID, SUM(linetotal) AS "total"
 FROM Sales.SalesOrderDetail
 GROUP BY ProductID
 ORDER BY SUM(linetotal) desc

 -- eu preciso saber quantos produtos e qual a quantidade media de produtos temos cadastrados nas nossas ordens de serviço (WorkOrder) agrupados por ProductID

 SELECT ProductID, COUNT(ProductID) AS "Quantidade", AVG(Orderqty) as "Media"
 FROM Production.WorkOrder
 GROUP BY ProductID


 -- HAVING é usado juntamento com o GROUP BY para filtrar resultados de um agrupamento
 
 SELECT FirstName, COUNT(FirstName) as "quantidade"
 FROM Person.Person
 GROUP BY FirstName
 HAVING COUNT(FirstName) > 10

 SELECT TOP 10 *
 FROM Sales.SalesOrderDetail

 SELECT ProductID, SUM(Linetotal) AS "Total"
 FROM Sales.SalesOrderDetail
 GROUP BY ProductID
 HAVING SUM(linetotal) between 162000 and 500000

 SELECT FirstName, COUNT(FirstName) as "quantidade"
 FROM Person.Person
 WHERE Title = 'Mr.'
 GROUP BY FirstName
 HAVING COUNT(FirstName) > 10


 -- DESAFIOS

 -- 1 - Estamos tentando identificas as provincias (StateProvinceID) com o maior nuiimero de cadastros no nosso sistema, então é preciso encontrar quais provincias estão registradas mais que 1000 vezes
 SELECT StateProvinceID, COUNT(StateProvinceID) as "quantidade"
 FROM Person.Address
 GROUP BY StateProvinceID
 HAVING COUNT (StateProvinceID) > 1000

 --2 - Sendo que se trata de uma multinacional os gerentes querem saber quais produtos não estão trazendo em média no minimo 1 milhão em total de vendas

SELECT ProductID, AVG(LineTotal) as "total"
FROM Sales.SalesOrderDetail
GROUP BY ProductID 
HAVING AVG(LineTotal) < 1000000


-- AS serve para renomear as colunas e deixar as tabelas mais ordenadas

SELECT TOP 10 ListPrice as "preço"
FROM Production.Product

SELECT TOP 10 AVG (Listprice) as "Preço medio"
FROM Production.Product

-- DESAFIO

-- Encontrar o FirstName e LastName person.person para nomes em portugues

SELECT FirstName as "Nome", LastName as "Sobrenome"
FROM Person.Person

-- Product Number da tabela production product e renomear para "Numero do Produto"

SELECT ProductNumber as "Numero do Produto"
FROM Production.Product

-- sales.salesorderdetail unit price renomear para "preço unitario"

SELECT UnitPrice as "Preço Unitario"
FROM Sales.SalesOrderDetail