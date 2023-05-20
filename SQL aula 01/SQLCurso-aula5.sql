-- CRUD


-- CREATE TABLE

-- principais tipos de restrições que podem ser aplicadas
-- NOT NULL - nao permite nulos
-- UNIQUE - força que todos os valores em uma coluna sejam diferentes
-- PRIMARY KEY - uma junção de not null e unique
-- FOREIGN KEY - identifica unicamente uma linha em outra tabela
-- CHECK - força uma cond~ição especifica em uma coluna
-- DEFAULT - força um valor padrão quando nenhum valor é passado

CREATE TABLE Canal (
CanalId int Primary Key,
Nome VARCHAR(150) NOT NULL,
ContagemInscritos INT DEFAULT 0,
DataCriacao DATETIME NOT NUll
); 

SELECT *
FROM Canal

CREATE TABLE Video (
VideoId INT PRIMARY KEY,
Nome VARCHAR(150) NOT NULL,
Vizualizacoes INT DEFAULT 0,
Likes INT DEFAULT 0,
Dislikes INT DEFAULT 0,
Duracao INT NOT NULL,
CanalId INT FOREIGN KEY REFERENCES Canal(CanalId)
);

SELECT *
FROM Video


-- INSERT INTO

CREATE TABLE aula(
id int primary key,
nome varchar(200)
);

INSERT INTO aula(id,nome)
VALUES(1,'aula 1')

INSERT INTO aula(id,nome)
VALUES
(2,'Aula 2'),
(3,'Aula 3'),
(4,'Aula 4')

SELECT * INTO tabelanova 
FROM aula

SELECT * from tabelanova



-- UPDATE

SELECT * FROM aula

UPDATE aula
SET nome = 'mudei'
WHERE id = 3

UPDATE aula
SET nome = 'introdução'
WHERE id = 1

UPDATE aula
SET nome = 'desenvolvimento'
WHERE id = 2


-- DELETE

SELECT * FROM aula

DELETE FROM aula
WHERE nome = 'mudei'


-- ALTER TABLE

-- add, remover or alterar uma coluna
-- setar valores padroes para coluna
-- add ou remover restr~ições de colunas
-- renomear uma tabela


CREATE TABLE youtube (
id int primary key,
nome varchar(150) not null unique,
categoria varchar(200) not null,
dataCriacao datetime not null
);

select * from youtube

ALTER TABLE youtube
add ativo bit

ALTER TABLE youtube
ALTER COLUMN categora varchar(300) not null

EXEC sp_rename 'youtube.nome' , 'nomeCanal', 'COLUMN'






