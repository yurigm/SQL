-- INNER JOIN retorna os resultados que existem tanto na tabela A como na tabela B

-- filtrado
SELECT p.BusinessEntityID,p.FirstName,p.LastName,pe.EmailAddress
FROM Person.Person as P
INNER JOIN Person.EmailAddress PE on p.BusinessEntityID = pe.BusinessEntityID

SELECT pr.listprice, pr.name, ps.name
FROM Production.Product Pr
INNER JOIN Production.ProductSubcategory PS on PS.ProductSubcategoryID = Pr.ProductSubcategoryID

-- geral
SELECT TOP 10 *
FROM Person.BusinessEntityAddress BA
INNER JOIN Person.Address PA ON PA.AddressID = BA.AddressID

-- DESAFIOS

-- 1. person.phoneNumberType juntar com person.personphone incluindo o businessentityId, Name, PhoneNumberTypeID, PhoneNumber
SELECT pp.BusinessEntityID,PN.Name,pp.PhoneNumberTypeID,pp.PhoneNumber
FROM Person.PersonPhone PP
INNER JOIN person.PhoneNumberType PN on PP.PhoneNumberTypeID = PN.PhoneNumberTypeID

-- 2. person.stateprovince jntar com person.adress incluindo: AdressId,StateProvinceId,Nome do Estado
SELECT TOP 10 PA.AddressID,pa.City,ps.StateprovinceId,ps.Name
FROM Person.Address PA
INNER JOIN Person.StateProvince PS on PA.StateProvinceID = PS.StateProvinceID


-- FULL OUTER JOIN retorna um conjunto de todos os registros correspondentes da Tabela A e Tabela B quando são iguais e se não houver valores correspondentes, ele simplismente ira preencher esses resultados com NULL

SELECT TOP 20 *
FROM Person.Person A
FULL OUTER JOIN Person.PersonPhone B on A.BusinessEntityID = B.BusinessEntityID

-- LEFT/RIGHT OUTER JOIN retorna um conjunto de todos os registros da tabela A, e alem disso, os registros correspondentes quando disponiveis da tabela B. se não houver registros correspondentes ele simplesmente vai preencer com NULL

SELECT TOP 20 *
FROM Person.Person A
LEFT JOIN Person.PersonPhone B on A.BusinessEntityID = B.BusinessEntityID

-- quero descobrir quais pessoas tem um cartao de credito registrado

SELECT *
FROM Person.Person PP
INNER JOIN Sales.PersonCreditCard PC
ON PP.BusinessEntityID = Pc.BusinessEntityID

-- INNER JOIN : 19118 pessoas

SELECT *
FROM Person.Person PP
LEFT JOIN Sales.PersonCreditCard PC
ON PP.BusinessEntityID = Pc.BusinessEntityID

-- LEFT JOIN : 19972 (incluindo pessoas sem cartão de credito registrado, correspondente da tabela A (PP)

SELECT *
FROM Person.Person PP
LEFT JOIN Sales.PersonCreditCard PC
ON PP.BusinessEntityID = Pc.BusinessEntityID
WHERE PC.BusinessEntityID IS NULL

SELECT 19972 - 19118 -- = 854 pessoas sem cartao de credito registrado


-- UNION combina dois ou mais resuldados de um select em um resultado apenas --

SELECT ProductId, Name, ProductNumber
FROM Production.Product 
WHERE Name Like '%Chain%'
UNION
SELECT ProductId, Name, ProductNumber
FROM Production.Product 
WHERE Name Like '%Decal%'
order by Name desc

SELECT FirstName, Title, MiddleName
FROM Person.Person
WHERE Title = 'Mr.'
UNION
SELECT FirstName, Title, MiddleName
FROM Person.Person
WHERE MiddleName = 'A'

-- DESAFIO

SELECT FirstName, LastName
FROM Person.Person
WHERE FirstName = 'Charles'
UNION
SELECT FirstName, LastName
FROM Person.Person
WHERE FirstName = 'John'

