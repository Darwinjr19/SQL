﻿CREATE DATABASE VEICULOS
GO
USE VEICULOS
GO
CREATE TABLE CARROS(
	PLACA CHAR(8) NOT NULL PRIMARY KEY,
	MARCA VARCHAR(30), MODELO VARCHAR(50),
	ANO CHAR(4),
	COR VARCHAR(30),
	VALOR MONEY,
	PORTAS INT,
	COMBUSTIVEL VARCHAR(20)
)
GO

INSERT INTO CARROS (PLACA, MARCA, MODELO, ANO, COR, VALOR, PORTAS, COMBUSTIVEL)
VALUES ('CPX-001', 'Fiat', 'Uno', '2010', 'branco',30600,  2, 'flex')
GO
INSERT INTO CARROS (PLACA, MARCA, MODELO, ANO, COR, VALOR, PORTAS, COMBUSTIVEL)
VALUES ('CPX-002', 'Fiat', 'Uno', '2008', 'prata',29600,  4, 'GNV')
GO
INSERT INTO CARROS (PLACA, MARCA, MODELO, ANO, COR, VALOR, PORTAS, COMBUSTIVEL)
VALUES ('CPX-003', 'Fiat', 'Uno', '2008', 'branco',28000, 2, 'flex')
GO
INSERT INTO CARROS (PLACA, MARCA, MODELO, ANO, COR, VALOR, PORTAS, COMBUSTIVEL)
VALUES ('CPX-004', 'Fiat', 'Uno', '2007', 'preto',37000,  4, 'gasolina')
GO
INSERT INTO CARROS (PLACA, MARCA, MODELO, ANO, COR, VALOR, PORTAS, COMBUSTIVEL)
VALUES ('ABC-001', 'Fiat', 'Stilo', '2010', 'verde',42600,  4, 'flex')
GO
INSERT INTO CARROS (PLACA, MARCA, MODELO, ANO, COR, VALOR, PORTAS, COMBUSTIVEL)
VALUES ('ABC-002', 'Fiat', 'Stilo', '2008', 'preto',27000,  4, 'flex')
GO
INSERT INTO CARROS (PLACA, MARCA, MODELO, ANO, COR, VALOR, PORTAS, COMBUSTIVEL)
VALUES ('CBA-001', 'Fiat', 'Palio', '2007', 'prata',26000,  2, 'flex')
GO
INSERT INTO CARROS (PLACA, MARCA, MODELO, ANO, COR, VALOR, PORTAS, COMBUSTIVEL)
VALUES ('ABC-003', 'Fiat', 'Punto', '2010', 'branco',26000,  4, 'flex')
GO
INSERT INTO CARROS (PLACA, MARCA, MODELO, ANO, COR, VALOR, PORTAS, COMBUSTIVEL)
VALUES ('DEF-001', 'Volkswagen', 'Gol', '2011', 'preto',28500,  4, 'flex')
GO
INSERT INTO CARROS (PLACA, MARCA, MODELO, ANO, COR, VALOR, PORTAS, COMBUSTIVEL)
VALUES ('DEF-002', 'Volkswagen', 'Fox', '2011', 'prata',32000,  4, 'flex')
GO
INSERT INTO CARROS (PLACA, MARCA, MODELO, ANO, COR, VALOR, PORTAS, COMBUSTIVEL)
VALUES ('DEF-003', 'Volkswagen', 'Voyage', '2011', 'preto',28500,  4, 'flex')
GO
INSERT INTO CARROS (PLACA, MARCA, MODELO, ANO, COR, VALOR, PORTAS, COMBUSTIVEL)
VALUES ('GHI-001', 'Renault', 'Clio', '2009', 'vermelho',25000,  2, 'gasolina')
GO
INSERT INTO CARROS (PLACA, MARCA, MODELO, ANO, COR, VALOR, PORTAS, COMBUSTIVEL)
VALUES ('GHI-002', 'Renault', 'Sandero', '2010', 'prata',30000,  4, 'flex')
GO
INSERT INTO CARROS (PLACA, MARCA, MODELO, ANO, COR, VALOR, PORTAS, COMBUSTIVEL)
VALUES ('MNO-001', 'Chevrolet', 'Corsa', '2008', 'verde', 23000, 2, 'alco�l')
GO
INSERT INTO CARROS (PLACA, MARCA, MODELO, ANO, COR, VALOR, PORTAS, COMBUSTIVEL)
VALUES ('MNO-002', 'Chevrolet', 'Vectra', '2011', 'prata', 35800, 4, 'flex')
GO
INSERT INTO CARROS (PLACA, MARCA, MODELO, ANO, COR, VALOR, PORTAS, COMBUSTIVEL)
VALUES ('MNO-003','Chevrolet', 'Astra', '2008', 'preto', 27000, 2, 'flex')
GO

CREATE TABLE CLIENTE(
	CODCLI CHAR(3) NOT NULL PRIMARY KEY,
	NOME VARCHAR(40),
	ENDERECO VARCHAR(50),
	CIDADE VARCHAR(20),
	ESTADO CHAR(2),
	CEP CHAR (9)
)
GO

INSERT INTO CLIENTE VALUES('250', 'BANCO BARCA S/A', 'R. VITO, 34','SÃO SEBASTIãO','CE','62380-000')
GO
INSERT INTO CLIENTE VALUES('820', 'MECANICA SÀO PAULO', 'R. DO MACUCO, 99','SANTO ANTONIO','ES','29810-020')
GO
INSERT INTO CLIENTE VALUES('170', 'POSTO BRASIL LTDA', 'AV. IMPERIO, 83','GUAGIRUS','BA','42837-000')
GO
INSERT INTO CLIENTE VALUES('100', 'MICROS INFORMATICA S/A', 'R. DAS PALMEIRAS, 4','SãO PAULO','SP','01226-010')
GO
INSERT INTO CLIENTE VALUES('750', 'IMOBILIARIA PAVãO', 'AV. BRASIL,105','RIO DO PRADO','MG','39940-000')
GO
INSERT INTO CLIENTE VALUES('230', 'SUPERMERCADO BOTAFOGO', 'R. DA LAGOA, 999','RIO DAS OSTRAS','RJ','28890-540')
GO
INSERT INTO CLIENTE VALUES('150', 'MARCONDES E IRMãO LTDA', 'R. DO ORATORIO, 66','ROSARIO OESTE','MT','78470-000')
GO

CREATE TABLE VENDA(
	DUPLIC CHAR(6) NOT NULL PRIMARY KEY,
	VALOR DECIMAL(10,2),
	VENCTO DATETIME,
	CODCLI CHAR(3) FOREIGN KEY REFERENCES CLIENTE (CODCLI),
	PLACA CHAR(8) FOREIGN KEY REFERENCES CARROS(PLACA)
)
GO

INSERT INTO VENDA VALUES('230001',1300.00,'2016-06-10','250','DEF-002')
GO
INSERT INTO VENDA VALUES('230099',10000.00,'2002-02-10','750','MNO-003')
GO
INSERT INTO VENDA VALUES('997818',30000.00,'2001-11-11','100','DEF-003')
GO
INSERT INTO VENDA VALUES('202550',9818.55,'2002-11-10','230','ABC-003')
GO
INSERT INTO VENDA VALUES('113340',3200.00,'2001-11-02','820','CPX-004')
GO
INSERT INTO VENDA VALUES('124354',25700.00,'2007-12-12','230','GHI-002')
GO
INSERT INTO VENDA VALUES('445522',22300.00,'2014-01-12','230','CPX-004')
GO
INSERT INTO VENDA VALUES('221133',17500.00,'2015-12-09','750','DEF-003')
GO
INSERT INTO VENDA VALUES('654321',75000.00,'2009-05-05','750','ABC-002')
GO
INSERT INTO VENDA VALUES('123456',50000.00,'2008-03-01','820','MNO-002')
GO


----EXEMPLOS---------
--------TABELA VIRTUAL (VIEWS)----------------
--1 - CRIE UMA TABELA VIRTUAL CHAMADA DUAS_PORTAS ONDE MOSTRE APENAS OS CARROS COM DUAS PORTAS


--2 - CRIE UMA TABELA VIRTUAL CHAMADA RESUMO_CARROS ONDE MOSTRE APENAS A PLACA, A MARCA, A COR E O COMBUSTÍVEL DOS CARROS

--4 - FAÇA O CADASTRO DE UM REGISTRO NA TABELA VIRTUAL (VIEW) RESUMO_CARROS

--5 - EXCLUA UM CADASTRO ATRAVÉS DA TABELA VIRTUAL RESUMO_CARROS

--6 - CRIE UMA TABELA VIRTUAL ONDE MOSTRE APENAS OS CARROS COM VALORES ABAIXO DE 30000

--7 - CRIE UMA TABELA VIRTUAL CHAMADA VENDAS_CARROS ONDE MOSTRE O NOME DO CLIENTE, O MODELO DO CARRO QUE ELE COMPROU E O VALOR QUE ELE PAGOU


---EXCLUIR UMA VIEW


--COMANDO TOP
TABELA VIRTUAL (VIEWS)
--1 - CRIE UMA TABELA VIRTUAL CHAMADA DUAS_PORTAS ONDE MOSTRE APENAS OS CARROS COM DUAS PORTAS
CREATE VIEW vwDuasPortas
AS
SELECT * FROM CARROS WHERE PORTAS = 2
SELECT * FROM vwDuasPortas
------------------------------------------------------------------------------------------------------------------------------------------

2 - CRIE UMA TABELA VIRTUAL CHAMADA RESUMO_CARROS ONDE MOSTRE APENAS A PLACA, A MARCA, A COR E O COMBUSTÍVEL DOS CARROS
CREATE VIEW vwResumoCarros
AS
SELECT PLACA, MARCA, COR, COMBUSTIVEL FROM CARROS
------------------------------------------------------------------------------------------------------------------------------------------

4 - FAÇA O CADASTRO DE UM REGISTRO NA TABELA VIRTUAL (VIEW) RESUMO_CARROS
INSERT INTO vwResumoCarros (PLACA,MARCA,COR,combustivel) 
VALUES ('AFD3040','Ford','Prata','álcool')
SELECT * FROM vwResumoCarros
------------------------------------------------------------------------------------------------------------------------------------------

5 - EXCLUA UM CADASTRO ATRAVÉS DA TABELA VIRTUAL RESUMO_CARROS
DELETE FROM vwResumoCarros WHERE placa = 'AFD3040'
------------------------------------------------------------------------------------------------------------------------------------------

6 - CRIE UMA TABELA VIRTUAL ONDE MOSTRE APENAS OS CARROS COM VALORES ABAIXO DE 30000
create view vwCarrosAbaixo
AS
SELECT * from CARROS WHERE VALOR <= 30000
------------------------------------------------------------------------------------------------------------------------------------------

7 - CRIE UMA TABELA VIRTUAL CHAMADA VENDAS_CARROS ONDE MOSTRE O NOME DO CLIENTE, 
O MODELO DO CARRO QUE ELE COMPROU E O VALOR QUE ELE PAGOU
create view vwVendas
AS
select NOME, MODELO, VENDA.VALOR FROM VENDA JOIN CLIENTE 
ON CLIENTE.CODCLI = VENDA.CODCLI 
JOIN CARROS
ON CARROS.PLACA = VENDA.PLACA
------------------------------------------------------------------------------------------------------------------------------------------

--EXEMPLOS DE EXECUÇÃO A PARTIR DA VIEW (vwVendas)
SELECT * FROM vwVendas WHERE MODELO = 'UNO'
SELECT * FROM vwVendas ORDER BY VALOR DESC
SELECT * FROM vwVendas WHERE VALOR >= 100000
------------------------------------------------------------------------------------------------------------------------------------------

--COMANDO TOP
Exibir uma quantidade específica de registros com base em uma listagem
1 - Exibir apenas 5 clientes cadastrados
SELECT TOP 5 * from CLIENTE
------------------------------------------------------------------------------------------------------------------------------------------

2 - Exibir os 5 carros mais caros
SELECT TOP 5 MODELO, VALOR FROM CARROS ORDER BY VALOR DESC
------------------------------------------------------------------------------------------------------------------------------------------

3 - Exibir os dados do carro mais barato
SELECT TOP 1 * FROM CARROS ORDER BY VALOR ASC
------------------------------------------------------------------------------------------------------------------------------------------

4 - Exibir as 3 vendas mais caras. Mostrar o nome do cliente e valor da venda 
SELECT TOP 3 NOME, VENDA.VALOR FROM VENDA JOIN CLIENTE ON CLIENTE.CODCLI = VENDA.CODCLI 
ORDER BY VENDA.VALOR DESC
----------------------------OU------------------------------------------------------------------------------------------------------------
SELECT TOP 3 NOME, VALOR FROM vwVendas ORDER BY VALOR DESC
------------------------------------------------------------------------------------------------------------------------------------------


-- SUBCONSULTAS (UTILIZAR UMA CONSULTA COMO BASE DE OUTRA CONSULTA OU COMANDO SQL)
1 - Consultar os CARROS que tem preço acima da média
SELECT * FROM CARROS WHERE VALOR > (SELECT AVG(VALOR) FROM CARROS)
------------------------------------------------------------------------------------------------------------------------------------------

2 - Exibir todos os veículos que foram vendidos usando como base a sua placa
SELECT * FROM CARROS WHERE PLACA IN (SELECT PLACA FROM VENDA)
------------------------------------------------------------------------------------------------------------------------------------------

3 - Exibir os dados dos clientes que compraram usando como base seu código
SELECT * FROM CLIENTE WHERE CODCLI IN (SELECT CODCLI FROM VENDA)
------------------------------------------------------------------------------------------------------------------------------------------

4 - Exibir os dados da venda buscando pelo nome do cliente: 'MECANICA SÀO PAULO'
SELECT * FROM VENDA WHERE CODCLI IN 
(SELECT CODCLI FROM CLIENTE WHERE NOME LIKE '%MECANICA SÀO PAULO%')
------------------------------------------------------------------------------------------------------------------------------------------

5 - Realizar o cadastro de um novo veículo na tabela carros, mas para o valor do 
veículo você deverá usar o valor médio de todos os veículos
INSERT INTO CARROS (PLACA, MARCA, MODELO, ANO, COR, VALOR, PORTAS, COMBUSTIVEL) 
VALUES ('QWR-0001','CHEVROLET','CRUZE',2022,'BRANCO',(SELECT AVG(VALOR) FROM CARROS),
        4, 'FLEX')
------------------------------------------------------------------------------------------------------------------------------------------

6 - Exibir uma nova coluna na tabela venda a partir de uma subconsulta 
onde será exibido o nome do cliente 
SELECT *, (SELECT NOME FROM CLIENTE WHERE CODCLI = VENDA.CODCLI) AS CLIENTE 
FROM VENDA