-- DROP TABLE - excluir uma tabela

drop table Errorlog

truncate table person.password

-- CHECK CONSTRAINT

CREATE TABLE CarteiraMotorista (
Id int NOT NULL,
Nome varchar (255) NOT NULL,
Idade int Check (Idade >= 18)
);

Select * FROM CarteiraMotorista

insert into CarteiraMotorista (id,nome,idade)
values (1,'rafael', 18)

-- VIEWS

CREATE VIEW [Pessoas Simplificado] AS
SELECT FirstName,LastName
FROM Person.Person
WHERE Title = 'Ms.'

SELECT * FROM [Pessoas Simplificado]