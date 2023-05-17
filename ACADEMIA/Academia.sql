CREATE DATABASE BDACADEMIA
USE BDACADEMIA


CREATE TABLE MATRICULA(

CodMatricula INT IDENTITY CONSTRAINT PKMatricula PRIMARY KEY,
CodPlano INT CONSTRAINT FKPlano FOREIGN KEY REFERENCES PLANO (CodPlano),
CodAluno INT CONSTRAINT FKAluno FOREIGN KEY REFERENCES ALUNO (CodAluno),
DataMatricula DATE NOT NULL,
DataVencimento DATE NOT NULL,
)

CREATE TABLE PLANO(

CodPlano INT IDENTITY CONSTRAINT PKPlano PRIMARY KEY,
NomePlano VARCHAR(60) NOT NULL,
ValorPlano MONEY NOT NULL,
)

CREATE TABLE ALUNO(

CodAluno INT IDENTITY CONSTRAINT PKAluno PRIMARY KEY,
Nome VARCHAR(80),
CPF CHAR(11) NOT NULL CONSTRAINT CPFaluno UNIQUE,
RG VARCHAR(20) NOT NULL CONSTRAINT RGaluno UNIQUE,
Email VARCHAR(100) CONSTRAINT EmailAluno UNIQUE,
DataNascimento DATE NOT NULL,
)

CREATE TABLE USUARIO(

CodUsuario INT IDENTITY CONSTRAINT PKusuario PRIMARY KEY,
NomeUsuario VARCHAR(80) NOT NULL,
Senha VARCHAR(10) NOT NULL,
TipoUsuario VARCHAR(20),
)

INSERT INTO USUARIO
(NomeUsuario, Senha, TipoUsuario)
VALUES('DARWIN', 123456, 'ADM')

INSERT INTO USUARIO
(NomeUsuario, Senha, TipoUsuario)
VALUES('NUNEZZ', 1234567, 'USUARIO')

SELECT * FROM USUARIO
----------------------------------------------------------

INSERT INTO PLANO
(NomePlano, ValorPlano)
VALUES('Mensal', 35.00)

INSERT INTO PLANO
(NomePlano, ValorPlano)
VALUES('Trimestral', 70.00)

INSERT INTO PLANO
(NomePlano, ValorPlano)
VALUES('Semestral', 140.00)

INSERT INTO PLANO
(NomePlano, ValorPlano)
VALUES('Anual', 280.00)

SELECT * FROM PLANO

-----------------------------------------------------------------

INSERT INTO ALUNO
(Nome, CPF, RG, Email, DataNascimento)
VALUES('JOÃO', 52588899977, 74241104, 'joão@gmail.com', '2004-06-01'), ('MARIA', 52588899978, 74241105, 'maria@gmail.com', '2003-07-04'),
('ALBERTINA', 52588899457, 84241104, 'albertina@gmail.com', '2000-08-25'), ('JESSICA', 52566699977, 74289104, 'jessica@gmail.com', '2008-09-13'),
('CR7', 52577799977, 77771104, 'CR7@gmail.com', '1997-03-10')

SELECT * FROM ALUNO
----------------------------------------------------------------

INSERT INTO MATRICULA
(CodPlano,CodAluno,DataMatricula,DataVencimento)
VALUES(4,3,'2022-05-02','2023-05-02'), (1,5,'2022-05-02','2022-06-02'),(2,4,'2022-05-02','2022-08-02')

SELECT * FROM MATRICULA
----------------------------------------------------------------
UPDATE ALUNO SET Nome = 'Dwayne Johnson',
					   CPF = 12345678909,
					   RG  = 442341234,
					 Email = 'therock@gmail.com',
		    DataNascimento = '1972-05-02'
WHERE CodAluno = 3

------------------------------------------------------------------

DELETE FROM USUARIO WHERE CodUsuario = 1

------------------------------------------------------------------

UPDATE PLANO SET ValorPlano = 950.00
			 WHERE CodPlano = 4

SELECT * FROM PLANO

--------------------------------------------------------------------

UPDATE PLANO SET ValorPlano = ValorPlano + ValorPlano * 10 / 100

---------------------------------------------------------------------

SELECT * FROM PLANO WHERE ValorPlano > 100

----------------------------------------------------------------------

SELECT * FROM MATRICULA WHERE DataMatricula < '2022-04-25'

-----------------------------------------------------------------------

SELECT * FROM ALUNO WHERE CodAluno = 3