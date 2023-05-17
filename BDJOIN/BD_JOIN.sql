CREATE DATABASE BDJOIN
GO
USE BDJOIN
GO

CREATE TABLE CATEGORIA (
	CODCATEGORIA INT NOT NULL PRIMARY KEY, 
	NOMECATEGORIA VARCHAR(30)
)
GO
CREATE TABLE FORNECEDOR (CODFORNECEDOR INT IDENTITY NOT NULL PRIMARY KEY,
NOMEFORNECEDOR VARCHAR(50)
)
GO
CREATE TABLE PRODUTO (
	CODPRODUTO INT IDENTITY NOT NULL PRIMARY KEY, 
	NOMEPRODUTO VARCHAR(30), 
	CODCATEGORIA INT FOREIGN KEY REFERENCES CATEGORIA (CODCATEGORIA), 
	CODFORNECEDOR INT FOREIGN KEY REFERENCES FORNECEDOR (CODFORNECEDOR), 
	QUANTIDADE INT, VALORUNITARIO DECIMAL(10,2))
GO

--Cadastros Tabela Categoria
INSERT INTO CATEGORIA VALUES (1,'DOCE')
INSERT INTO CATEGORIA VALUES (2,'SALGADO')
INSERT INTO CATEGORIA VALUES (3,'BEBIDA')
INSERT INTO CATEGORIA VALUES (4,'LIMPEZA')
INSERT INTO CATEGORIA VALUES (5,'CONGELADOS')
INSERT INTO CATEGORIA VALUES (6,'LEGUMES')
GO

--Cadastros Tabela Fornecedor
INSERT INTO FORNECEDOR VALUES ('FRUTIQUELLO')
INSERT INTO FORNECEDOR VALUES ('KIBOM')
INSERT INTO FORNECEDOR VALUES ('SITE ANDER')

--Cadastros Tabela Produto
INSERT INTO PRODUTO VALUES ('REFRIGERANTE COCA COLA',3,1,15,2.50)
INSERT INTO PRODUTO VALUES ('SABONETE PROTEX',4,2,50,1.99)
INSERT INTO PRODUTO VALUES ('CHOCOLATE SHOT LACTA',1,1,10,5.89)
INSERT INTO PRODUTO VALUES ('BOLACHA',1,5,3.50,3)
INSERT INTO PRODUTO VALUES ('FRIGIDEIRA TRAMONTINA',NULL,2,3,15.60)
INSERT INTO PRODUTO VALUES ('FACA TRAMONTINA',NULL,1,5,35.00)
INSERT INTO PRODUTO VALUES ('JOGO DE PRATOS',NULL,1,1,155.00)
GO

SELECT CodProduto, NomeProduto, NomeCategoria, Quantidade
FROM Produto, Categoria
WHERE Categoria.CodCategoria = Produto.CodCategoria
--EXEMPLO INNER JOIN
1 - Exibir:
codproduto      -> PRODUTO
nomeproduto     -> PRODUTO
valorunitario   -> PRODUTO
nomecategoria   -> CATEGORIA
--Código:
SELECT CodProduto, NomeProduto, ValorUnitario, NomeCategoria, Produto.CodCategoria
FROM Produto JOIN Categoria
ON Categoria.CodCategoria = Produto.CodCategoria
-----------------------------------
SELECT P.CodProduto, P.NomeProduto, P.ValorUnitario, C.NomeCategoria, P.CodCategoria
FROM Produto AS P JOIN Categoria AS C
ON C.CodCategoria = P.CodCategoria

2 - Exibir:
NomeProduto     -> PRODUTO
NomeFornecedor  -> FORNECEDOR
Relacionamento entre PRODUTO E FORNECEDOR: CodFornecedor
--Código:
SELECT NomeProduto, NomeFornecedor
    FROM Produto JOIN Fornecedor
ON Fornecedor.CodFornecedor = Produto.CodFornecedor

--EXEMPLO LEFT JOIN
3 - Exibir:
codproduto      -> PRODUTO
nomeproduto     -> PRODUTO
nomecategoria   -> CATEGORIA
--Código:
SELECT CodProduto, NomeProduto, NomeCategoria 
    FROM Produto LEFT JOIN Categoria
ON Categoria.CodCategoria = Produto.CodCategoria

--EXEMPLO RIGHT JOIN
4 - Exibir:
codproduto      -> PRODUTO
nomeproduto     -> PRODUTO
nomecategoria   -> CATEGORIA
--Código:
SELECT CodProduto, NomeProduto, NomeCategoria 
    FROM Produto RIGHT JOIN Categoria
ON Categoria.CodCategoria = Produto.CodCategoria
--EXEMPLO FULL JOIN
5 - Exibir:
codproduto      -> PRODUTO
nomeproduto     -> PRODUTO
nomecategoria   -> CATEGORIA
--Código:
SELECT CodProduto, NomeProduto, NomeCategoria 
    FROM Produto FULL JOIN Categoria
ON Categoria.CodCategoria = Produto.CodCategoria
--LEFT EXCLUDING JOIN (EXCLUIR A JUNÇÃO)
Exibir:
codproduto      -> PRODUTO
nomeproduto     -> PRODUTO
nomecategoria   -> CATEGORIA
--Código:
SELECT CodProduto, NomeProduto, NomeCategoria 
    FROM Produto LEFT JOIN Categoria
ON Categoria.CodCategoria = Produto.CodCategoria
WHERE Produto.CodCategoria IS NULL
--RIGHT EXCLUDING JOIN (EXCLUIR A JUNÇÃO)
--Código:
SELECT CodProduto, NomeProduto, NomeCategoria 
    FROM Produto RIGHT JOIN Categoria
ON Categoria.CodCategoria = Produto.CodCategoria
WHERE Produto.CodCategoria IS NULL
--FULL EXCLUDING JOIN (EXCLUIR A JUNÇÃO)
--Código:
SELECT CodProduto, NomeProduto, NomeCategoria 
    FROM Produto FULL JOIN Categoria
ON Categoria.CodCategoria = Produto.CodCategoria
WHERE Produto.CodCategoria IS NULL

--EXERCÍCIOS
Inner JOIN
Exibir os seguintes campos:
NomeProduto (Produto)
NomeCategoria (Categoria)
Quantidade (Produto)

Obs: Apenas dos produtos que forem da categoria: Doce

SELECT NomeProduto, NomeCategoria, Quantidade 
    FROM Produto INNER JOIN Categoria
ON CATEGORIA.CODCATEGORIA = PRODUTO.CODCATEGORIA
WHERE Produto.CODCATEGORIA = 1
---------------------------------------
Inner Join
Exibir os seguintes campos:
CodProduto
NomeProduto
NomeFornecedor

Obs: Apenas dos produtos que tiverem preço acima de 10.00

SELECT CodProduto, NomeProduto, NomeFornecedor, VALORUNITARIO 
    FROM Produto JOIN Fornecedor 
ON FORNECEDOR.CODFORNECEDOR = Produto.CODFORNECEDOR
WHERE VALORUNITARIO > 10
----------------------------------------
Inner Join
Exibir os seguintes campos:
NomeProduto (Produto)
NomeCategoria (Categoria)
NomeFornecedor (Fornecedor)

SELECT NomeProduto, NomeCategoria, NomeFornecedor
    FROM Produto 
JOIN CATEGORIA
    ON Produto.CODCATEGORIA = CATEGORIA.CODCATEGORIA 
JOIN FORNECEDOR
    ON FORNECEDOR.CODFORNECEDOR = PRODUTO.CODFORNECEDOR
----------------------------------------------
Left Join
Exibir os seguintes campos: 
NomeProduto
NomeCategoria
Quantidade

OBS: Os produtos que tem ou não categorias vinculadas. 
Apenas produtos com quantidade acima de 5

SELECT NomeProduto, NomeCategoria, Quantidade
    FROM PRODUTO LEFT JOIN CATEGORIA
ON PRODUTO.CODCATEGORIA = CATEGORIA.CODCATEGORIA
    WHERE QUANTIDADE > 5
----------------------------------------------
Right Join
Exibir os seguintes campos:
NomeProduto
NomeFornecedor
Quantidade
Preco

Obs: Os produtos que tem ou não fornecedores vinculados

SELECT NomeProduto, NomeFornecedor, Quantidade, ValorUnitario 
    FROM Fornecedor RIGHT JOIN  Produto
ON PRODUTO.CODFORNECEDOR = FORNECEDOR.CODFORNECEDOR