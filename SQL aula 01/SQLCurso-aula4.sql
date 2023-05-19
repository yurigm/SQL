-- SUBQUERY serve para montar selects mais complexos

-- Monte um relatorio de todos os produtos cadastrados que tem preço de venda acima de media

SELECT * 
FROM Production.Product
WHERE ListPrice > (select AVG(Listprice) from Production.Product)

-- quero saber o nome dos funcionarios que tem o cargo de 'Design Engineer'

SELECT FirstName
FROM Person.Person
WHERE BusinessEntityID IN (SELECT BusinessEntityID FROM HumanResources.Employee WHERE JobTitle = 'Design Engineer')
--ou
SELECT P.FirstName
FROM Person.Person P
INNER JOIN HumanResources.Employee E ON P.BusinessEntityID = E.BusinessEntityID
AND E.JobTitle = 'Design Engineer'

-- Desafios

-- Encontre para mim todos os endereços que estão nos estado de Alberta

SELECT *
FROM Person.Address

SELECT *
FROM Person.StateProvince

SELECT *
FROM Person.Address
WHERE StateProvinceID IN (SELECT StateProvinceID FROM Person.StateProvince WHERE Name = 'Alberta')



-- DATEPART

SELECT SalesOrderID, DATEPART(month,OrderDate) as Mês
FROM Sales.SalesOrderHeader

SELECT AVG(TotalDue) MEDIA, DATEPART(month,OrderDate) as MES
FROM Sales.SalesOrderHeader
GROUP BY DATEPART(month,orderdate)
order by MES

-- DESAFIO

SELECT BusinessEntityID, DATEPART (year,BirthDate) as Aniversario
FROM HumanResources.Employee  
WHERE BusinessEntityID IN (SELECT BusinessEntityID FROM Person.Person)
ORDER BY Aniversario


-- MANIPULAÇÂO DE STRING

SELECT CONCAT(FirstName,' ',LastName)   -- juntar 
FROM Person.Person

SELECT UPPER(FirstName) -- maiusculo
FROM Person.Person

SELECT LOWER(FirstName)  -- minusculo
FROM Person.Person

SELECT LEN(FirstNAme)  -- contagem de caracteres
FROM Person.Person	

SELECT  FirstName, SUBSTRING(FirstName,1,3) -- abreviação
FROM Person.Person

SELECT productNumber, REPLACE(ProductNumber,'-','XXXXXX')
FROM Production.Product


-- OPERAÇÔES MATEMATICAS

SELECT UnitPrice - LineTotal
FROM Sales.SalesOrderDetail

SELECT UnitPrice + LineTotal
FROM Sales.SalesOrderDetail

SELECT UnitPrice / LineTotal
FROM Sales.SalesOrderDetail

SELECT AVG(LineTotal)
FROM Sales.SalesOrderDetail

SELECT MIN(LineTotal)
FROM Sales.SalesOrderDetail

SELECT MAX(LineTotal)
FROM Sales.SalesOrderDetail

SELECT SUM(LineTotal)
FROM Sales.SalesOrderDetail

SELECT ROUND(LineTotal,2), Linetotal  --  arredondamento
FROM Sales.SalesOrderDetail

SELECT SQRT(Linetotal)                -- raiz quadrada
FROM Sales.SalesOrderDetail


-- TIPOS DE DADOS

-- 1.boleanos
-- por padrão ele é inicializado como nulo e pode receber tanto 1 ou 0 - tipo BIT

-- 2.caracteres
-- tamanho fix - char // permite inserir até uma quantidade fixa de caracteres e sempre ocupa todo o espaço reservado
-- tamanhos variaveis - varchar ou nvarchar // permite inserir at[e uma quantidade que for definida, porém so usa o espaço que for preenchido

-- 3.numeros
-- valores exatos
-- 1.TINYINT - nao tem parte valor fracionados somente 1,123123
-- 2.SMALLINT - mesma coisa porem com um limite maior
-- 3.INT - mesma coisa proem limite maior
-- 4.BIGINT - mesma coisa porem limite maior
-- 5.NUMERIC ou DECIMAL - valores exatos, porem permite ter parte fracionados, que tambem pode ser especificado a precisao escala, ex: Numeric (5,2)

-- valores aproximados 
-- 1.Real - tem precisao aproximada de ate 15 digitos
-- 2.FLOAT - mesmo conceito do real

-- valores temporais
-- DATE - armazena datas no formato aaaa/mm/dd
-- DATETIME - armazena data e horas no formato aaaa/mm/dd hh:mm:ss
-- DATETIME2 - data e horas com adição de milisegundos no formato aaaa/mm/dd hh:mm:ssssss
-- SMALLDATETIME - data e horas nos respeitando o limite entre '1990-01-01:00:00:00" ate "2079-06-06:13:59:59".
-- TIME - horas, minutos, segundos e milisegundos respeitando o limite de '00:00:00.0000000' to '23:59:59.9999999'
-- DATETIMEOFFSET - permite armazenar informações de data e horas incluindo o fuso horario


-- CHAVE PRIMARIA E ESTRANGEIRA

-- uma chave primaria é basicamente uma coluna ou grupo de colunas, usada para identificar unicamente uma linha em uma tabela
-- voce consegue criar essas chaves atraves de uma constraint que são regras que vc define quando esta criando uma coluna
-- assim quando vc faz iusso esta criando um indice unico para aquela coluna ou grupo de colunas

-- CREATE TABLE nome_tabela (
  --    nomeColuna tipodedados PRIMARY KEY
  --	  nome coluna tipodedados ...
--  )

-- uma chave estrangeira é uma coluna ou grupo de colunas em uma tabela que identifica unicamente uma linha em outra tabela
-- ou seja, uma chave estrangeira é definida em uma tabela onde ela é apenas uma referencia e não contem todos os dados ali
-- entao uma chave estrangeira é simplesmente uma coluna ou um grupo de colunas que é uma chave primaria em outra tabela

-- No SQL Server vc define uma chave estrangeira atravez de um "foreign key constraint" ou restrição de chave estrangeira
-- uma restrição de chave estrangeira indica que os valores em uma coluna ou grupo de colunas na tabela filho correspondem aos valores da tabela pai
-- nos podemos entender que uma chave estrangeira mantem a "integridade referencial"


