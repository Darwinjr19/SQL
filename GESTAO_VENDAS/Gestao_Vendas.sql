CREATE DATABASE BDGESTAOVENDAS

GO
USE BDGESTAOVENDAS

CREATE TABLE PRODUTOS
(
	CodProduto INT IDENTITY CONSTRAINT PKProduto PRIMARY KEY,
	NomeProduto VARCHAR(60) NOT NULL,
	DataValidade DATE NOT NULL,
	Preco MONEY NOT NULL,
	Quantidade INT NOT NULL,
	Unidade CHAR(2), NOT NULL,
	CodCategoria INT CONSTRAINT FKCategoria FOREIGN KEY REFERENCES CATEGORIA(CodCategoria),
)

ALTER TABLE PRODUTOS ALTER COLUMN Unidade CHAR(2)
SELECT * FROM PRODUTOS

CREATE TABLE CATEGORIA
(
	CodCategoria INT IDENTITY CONSTRAINT PKCategoria PRIMARY KEY,
	NomeCategoria VARCHAR(50) NOT NULL,
)

CREATE TABLE ITENS
(
	CodItem INT IDENTITY CONSTRAINT PKItem PRIMARY KEY,
	CodProduto INT CONSTRAINT FKProduto FOREIGN KEY REFERENCES PRODUTOS(CodProduto),
	CodVenda INT CONSTRAINT FKVenda FOREIGN KEY REFERENCES VENDA(CodVenda),
	Quantidade INT NOT NULL,
	Preco MONEY NOT NULL,
)

CREATE TABLE VENDA
(
	CodVenda INT IDENTITY CONSTRAINT PKVenda PRIMARY KEY,
	DataVenda DATE NOT NULL,
	FormaPagto VARCHAR(20),
	CodCliente INT CONSTRAINT FKCliente FOREIGN KEY REFERENCES CLIENTE(CodCliente),
)

CREATE TABLE CLIENTE
(
	CodCliente INT IDENTITY CONSTRAINT PKCliente PRIMARY KEY,
	Nome VARCHAR(100) NOT NULL,
	CPF CHAR(11) CONSTRAINT UQCpf UNIQUE NOT NULL,
	Email VARCHAR(200) CONSTRAINT UQEmail UNIQUE NOT NULL,
)

------------------------------------------ CLIENTES---------------------------------------------------------
INSERT INTO CLIENTE (Nome, CPF, Email) VALUES ('DARWIN', '12345678912', 'DARWIN@GMAIL.COM')

INSERT INTO CLIENTE (Nome, CPF, Email) VALUES ('NUNEZZ', '45741881890', 'NUNEZZ@GMAIL.COM' )

INSERT INTO CLIENTE (Nome, CPF, Email) VALUES ('GABRIELA', '98745612305', 'GABRIELA@GMAIL.COM' )

INSERT INTO CLIENTE (Nome, CPF, Email) VALUES ('JARANDILLA', '45678912307', 'JARANDILLA@GMAIL.COM' )

SELECT * FROM CLIENTE
-------------------------------------------------------------------------------------------------------------

----------------------------------------- CATEGORIA ---------------------------------------------------------
INSERT INTO CATEGORIA(NomeCategoria) VALUES ('DOCES')

INSERT INTO CATEGORIA(NomeCategoria) VALUES ('SALGADOS')

INSERT INTO CATEGORIA(NomeCategoria) VALUES ('BEBIDAS')

INSERT INTO CATEGORIA(NomeCategoria) VALUES ('LIMPEZA')

SELECT * FROM CATEGORIA
---------------------------------------------------------------------------------------------------------------

----------------------------------------- PRODUTOS ------------------------------------------------------------
INSERT INTO PRODUTOS(NomeProduto, DataValidade, Preco, Quantidade, Unidade, CodCategoria) 
VALUES ('Bala', '2022-10-18', '00.25', '30', 'PC','1')

INSERT INTO PRODUTOS(NomeProduto, DataValidade, Preco, Quantidade, Unidade, CodCategoria) 
VALUES ('Salgadinho', '2022-12-02', '7.00', '15', 'PC','2')

INSERT INTO PRODUTOS(NomeProduto, DataValidade, Preco, Quantidade, Unidade, CodCategoria) 
VALUES ('Coca-Cola', '2022-09-05', '5.00', '25', 'UN','3')

INSERT INTO PRODUTOS(NomeProduto, DataValidade, Preco, Quantidade, Unidade, CodCategoria) 
VALUES ('Sabonete', '2024-05-01', '1.50', '50', 'UN','4')

INSERT INTO PRODUTOS(NomeProduto, DataValidade, Preco, Quantidade, Unidade, CodCategoria) 
VALUES ('Corote', '2023-07-04', '6.00', '10', 'UN','3')

SELECT * FROM PRODUTOS
-----------------------------------------------------------------------------------------------------------------

------------------------------------------- VENDA ----------------------------------------------------------------
INSERT INTO VENDA(DataVenda, FormaPagto, CodCliente) 
VALUES ('2022-08-07', 'Débito', '1' )

INSERT INTO VENDA(DataVenda, FormaPagto, CodCliente) 
VALUES ('2022-05-07', 'Débito', '1' )

INSERT INTO VENDA(DataVenda, FormaPagto, CodCliente) 
VALUES ('2023-05-08', 'Crédito', '2' )

SELECT * FROM VENDA
-----------------------------------------------------------------------------------------------------------------

------------------------------------------ ITENS -----------------------------------------------------------------
INSERT INTO ITENS(CodProduto, CodVenda, Quantidade, Preco) 
VALUES ('4', '3', '5', '5.00' )

INSERT INTO ITENS(CodProduto, CodVenda, Quantidade, Preco) 
VALUES ('3', '3', '10', '7.00' )

SELECT * FROM ITENS
-----------------------------------------------------------