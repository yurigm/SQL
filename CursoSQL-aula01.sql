
-- uso do SELECT para selecionar itens na tabela
SELECT firstName,lastName
FROM Person.Person

--uso do DISTINCT para selecionar apenas itens únicos
SELECT DISTINCT LastName
FROM Person.Person

--uso do WHERE para estabelecer condições na pesquisa
SELECT *
FROM Person.Person
WHERE LastName = 'miller' and FirstName = 'Anna'

SELECT *
FROM Production.Product
WHERE ListPrice > 1500 and ListPrice < 5000

SELECT *
FROM Production.Product
WHERE Color <> 'red'

SELECT *
FROM Production.Product
WHERE Weight > 500 and Weight < 700

SELECT *
FROM HumanResources.Employee
WHERE MaritalStatus = 'm' and SalariedFlag = 1 

SELECT *
FROM Person.Person
WHERE FirstName = 'Peter'

SELECT *
FROM Person.EmailAddress
WHERE BusinessEntityID = '26'

-- uso do COUNT para contar a quantidade de algum elemento
SELECT count(DISTINCT Title)
FROM Person.Person

SELECT count(*)
FROM Production.Product

SELECT count (size)
FROM Production.Product

-- uso do TOP para limitar a quantidade de dados determinadas por um select
SELECT TOP 10 *
FROM Production.Product

-- uso do ORDER BY para ordenar os resultados por ordem crescente ou descrescente
SELECT FirstName, LastName
FROM Person.Person
ORDER BY FirstName asc, LastName desc

SELECT TOP 10 ProductID
FROM Production.Product
ORDER BY ListPrice desc

SELECT TOP 4 name, ProductNumber
FROM Production.Product
ORDER BY ProductID asc

-- uso do BETWEEN é usado para encontrar um elemento entre o valor minimo e maximo estabelecido
SELECT *
FROM Production.Product
WHERE ListPrice NOT between 1000 and 1500
ORDER BY ListPrice asc

SELECT *
FROM HumanResources.Employee
WHERE HireDate Between '2009/01/01' and '2010/01/01'
ORDER BY HireDate 

-- uso do IN junto com o where para verificar se o valor corresponde com qualquer valor na lista
SELECT *
FROM Person.Person
WHERE BusinessEntityID IN (2,7,13)

--uso do LIKE é usado para encontrar algo na tabela quando não se sabe a informação inteira da pesquisa
SELECT *
FROM Person.Person
WHERE FirstName like '%essa%'

SELECT *
FROM Person.Person
WHERE FirstName like '%ro_' -- 1 caractere

-- DESAFIOS

-- 1 - quantos produtos temos cadastrados no sistema que custam mais que 1500 dolares?  R=39
SELECT COUNT (ListPrice)
FROM Production.product
WHERE ListPrice > 1500

-- 2 - Quantas pessoas temos com o sobrenome que inicia com a letra P? R=1087
SELECT COUNT (LastName)
FROM Person.Person
WHERE LastName like 'P%'

--3 - Em quantas cidades únicas estão cadastrados os nossos clientes? R= 575
SELECT COUNT (DISTINCT City)
FROM Person.Address

--4 Quais são as cidades únicas que temos cadastrados em nosso sistema?
SELECT DISTINCT City
FROM Person.Address

--5 - Quantos produtos vermelhos tem o preco entre 500 a 1000 dolares? R=11
SELECT COUNT (*)
FROM Production.Product
WHERE Color = 'red' and ListPrice BETWEEN 500 and 1000

--6 - Quantos produtos cadastrados tem a palavra 'road' no nome deles? R=103
SELECT COUNT (*)
FROM Production.Product
WHERE Name like '%road%'