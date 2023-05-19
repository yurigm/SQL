-- SELF JOIN

SELECT*
FROM Customers

SELECT A.ContactName, A.Region, B.ContactName, B. Region
FROM Customers A, Customers B	
WHERE A.Region = B.Region

-- Eu quero encontrar (nome e data de contratação) de todos os funcionarios que foram contratados no mesmo ano

SELECT A.FirstName, A. HireDate, B.FirstName, B.HireDate
FROM Employees A, Employees B
WHERE DATEPART(Year,a.HireDate) = DATEPART(Year,b.Hiredate)


-- DESAFIOS

-- Quero saber na tabela detalhe do pedido ( ORder Details) quais produtos tem o mesmo porcentual de desconto

SELECT A.ProductID, A.Discount, B.ProductID, B.Discount
FROM [Order Details] A, [Order Details] B
WHERE A.Discount = B.Discount
