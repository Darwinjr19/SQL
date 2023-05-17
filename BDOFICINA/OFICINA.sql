CREATE DATABASE BDOFICINA
USE BDOFICINA

CREATE TABLE Cliente(
CodCliente INT IDENTITY CONSTRAINT PKCliente PRIMARY KEY,
Nome VARCHAR(80) NOT NULL,
Cpf CHAR (11) CONSTRAINT UQCpf UNIQUE NOT NULL,
Email VARCHAR (80) NOT NULL,
Telefone CHAR (11),
Celular CHAR (12)
)

SELECT * FROM Cliente

------------------------------------------------------------------

CREATE TABLE Veiculo (
Placa INT IDENTITY CONSTRAINT PKPlaca PRIMARY KEY,
CodMarca INT CONSTRAINT FKCodMarca FOREIGN KEY REFERENCES Marca (CodMarca),
CodCliente INT CONSTRAINT FKCodCliente FOREIGN KEY  REFERENCES Cliente (CodCliente),
Modelo VARCHAR(15),
Cor VARCHAR (10),
Ano DATE,
)

SELECT * FROM Veiculo
---------------------------------------------------------------------
CREATE TABLE Marca(
CodMarca INT IDENTITY CONSTRAINT PKCodMarca PRIMARY KEY,
NomeMarca VARCHAR (20) NOT NULL
)

SELECT * FROM Marca
---------------------------------------------------------------------
CREATE TABLE Servico(
CodServico INT IDENTITY CONSTRAINT PKCodServico PRIMARY KEY,
Placa INT CONSTRAINT FKPlaca FOREIGN KEY REFERENCES Veiculo (Placa), 
DataHoraAtual DATETIME,
DataEntrega DATETIME,
ValorServico MONEY,
DescricaoServico VARCHAR(80)
)

SELECT * FROM Servico
-----------------------------------------------------------------------
--2 - Inserir 3 Clientes:

INSERT INTO Cliente (Nome, Cpf, Email, Telefone, Celular) VALUES ('Darwin','1234','Darwin@gmail.com','12345678','113165987') --1
INSERT INTO Cliente (Nome, Cpf, Email, Telefone, Celular) VALUES ('Larissa','523043', 'Larissa@gmail.com', '973254', '1165864752') --2
INSERT INTO Cliente (Nome, Cpf, Email, Telefone, Celular) VALUES ('Mario', '455876', 'Mario@gmail.com', '722435', '1197328453') --3

SELECT * FROM Cliente
-----------------------------------------------------------------------------------------------------------------------------------

--INSERIR 4 MARCAS:
INSERT INTO Marca (NomeMarca) VALUES ('CHEVROLET') -- 1
INSERT INTO Marca (NomeMarca) VALUES ('PEUGEOT') -- 2
INSERT INTO Marca (NomeMarca) VALUES ('FIAT') -- 3
INSERT INTO Marca(NomeMarca) VALUES ('TOYOTA') -- 4


SELECT * FROM Marca
------------------------------------------------------------------------------------------------------------------------------------

--INSERIR 5 VEICULOS:
INSERT INTO Veiculo(CodMarca,CodCliente,Modelo,Cor,Ano) VALUES ('1', '2', 'ONIX', 'PRETO', '2021-01-10') -- LARISSA Cod=2
INSERT INTO Veiculo(CodMarca,CodCliente,Modelo,Cor,Ano) VALUES ('2', '3', '208' , 'AZUL', '2022-02-05') -- MARIO Cod=3
INSERT INTO Veiculo(CodMarca,CodCliente,Modelo,Cor,Ano) VALUES ('4' ,'1', 'SW4', 'PRETO', '2022-04-18') -- DARWIN Cod=1
INSERT INTO Veiculo(CodMarca,CodCliente,Modelo,Cor,Ano) VALUES ('2', '3', 'ARGO', 'VERMELHO', '2019-06-02') -- MARIO Cod=3
INSERT INTO Veiculo(CodMarca,CodCliente,Modelo,Cor,Ano) VALUES ('1', '1', 'TRAILBLAZER', 'PRETO', '2018-10-10') -- DARWIN Cod=1
INSERT INTO Veiculo(CodMarca,CodCliente,Modelo,Cor,Ano) VALUES ('5', '1', 'ARGO', 'VERMELHO', '2015-09-10') -- DARWIN
SELECT * FROM Veiculo

----------------------------------------------------------------------------------------------------------------------------------
--INSERIR 3 SERVÇOS:
INSERT INTO Servico (Placa,DataHoraAtual,DataEntrega,ValorServico,DescricaoServico) VALUES('1', '2021-01-10 10:46' , '2021-01-12 12:40' , 120 , 'Troca de pneus' )
INSERT INTO Servico (Placa,DataHoraAtual,DataEntrega,ValorServico,DescricaoServico) VALUES('2' , '2022-02-05 13:49' , '2022-03-02 10:00' , 2.500 ,'Pintura' )
INSERT INTO Servico (Placa,DataHoraAtual,DataEntrega,ValorServico,DescricaoServico) VALUES('3' , '2019-06-02 15:50', '2019-06-02 18:00', 800 ,'Suspenção')

 UPDATE Servico SET ValorServico = 2500.00  WHERE CodServico = 2

 SELECT * FROM Servico
------------------------------------------------------------------------------------------------------------------------------------

--3 -ATUALIZA OS DADOS DE UM CLIENTE:

UPDATE Cliente SET Nome = 'Michael Jackson',
					CPF = 12345678909,
				  Email ='mjackson@gmail.com',
			   Telefone = 1144443333,
			    Celular = 11988887777
WHERE CodCliente = 3

SELECT * FROM Cliente

-------------------------------------------------------------------------------------------------------------------------------------

--4 – Exclua uma marca que não esteja sendo usada em um cadastro de veículo:

DELETE FROM Marca WHERE  CodMarca = 3    --EXCLUINDO A MARCA FIAT CODIGO 3


------------------------------------------------------------------------------------------------------------------------------------			   
--5 - Faça uma consulta de todos os clientes exibindo seu nome em letras maiúsculas:
SELECT UPPER(Nome) AS [Nome do Cliente] FROM Cliente  

------------------------------------------------------------------------------------------------------------------------------------
--6- Faça uma consulta de todos os veículos cadastrados, ordenando por ano de maneira decrescente.

 SELECT * FROM Veiculo ORDER BY Ano DESC   

 ------------------------------------------------------------------------------------------------------------------------------------
--7- Faça uma consulta dos veículos com ano maior que 2015 e marca diferente de Fiat.
SELECT * FROM Veiculo WHERE Ano > '2015' AND CodMarca <> '5'
-------------------------------------------------------------------------------------------------------------------------------------
--8- – Faça uma consulta que exiba o valor do serviço mais caro.

SELECT MAX (ValorServico) AS [Maior Valor] FROM Servico

-------------------------------------------------------------------------------------------------------------------------------------
--9-Faça uma consulta que retorne a média de valores dos serviços.

SELECT AVG (ValorServico) AS[Media dos Valores] FROM Servico

-------------------------------------------------------------------------------------------------------------------------------------
--10 -–Faça uma consulta que exiba todos os serviços entregues no primeiro semestre de 2021.

SELECT * FROM Servico WHERE  DataEntrega BETWEEN '2021-01-01' AND '2021-06-01' 

--11 - – Faça uma consulta que retorne a somatória de valores dos serviços entregues no ano de 2021.

SELECT SUM (ValorServico) FROM Servico WHERE  DataEntrega = '2021'

--12 --– Faça uma consulta que retorne os veículos com ano entre 2015 e 2020.

SELECT * FROM Veiculo WHERE YEAR (Ano) BETWEEN 2015 AND 2020

--13 --– Faça uma consulta que retorne os veículos que tenham as seguintes marcas: Fiat, Toyota, Hyundai e Volkswagen

SELECT * FROM Veiculo WHERE CodMarca IN (5,4)

--14--– Faça uma consulta que retorne todos os clientes em que o nome inicia com a letra A.
SELECT * FROM Cliente WHERE Nome LIKE'a%'

--15--Faça uma consulta que retorne todos os veículos em que a placa termina com o número 7.
SELECT * FROM Veiculo WHERE Placa LIKE '%7'

--16--– Faça uma consulta que retorne todos os clientes que tem o e-mail do gmail.
SELECT * FROM Cliente WHERE Email LIKE '%gmail%'

--17-- Faça uma consulta que exiba em apenas uma coluna a placa, o modelo e a cor dos veículos
SELECT CONCAT(Placa,' ',Cor,' ',Modelo) AS[Veiculo] FROM Veiculo 

--18-- – Faça uma consulta que retorne a quantidade de veículos da marca Fiat.
SELECT (NomeMarca) FROM Marca  WHERE CodMarca = '5' 

--19--Atualizar todos os serviços para um valor de 10% a mais sobre o valor atual do serviço cadastrado.
UPDATE Servico SET ValorServico = ValorServico+ ValorServico *10/100 
SELECT * FROM Servico
--20--Faça uma consulta que retorne a quantidade de veículos agrupados por marca
SELECT CodMarca , COUNT(*) AS Quantidade FROM Marca GROUP BY CodMarca

SELECT * FROM Veiculo