CREATE DATABASE BDVETERINARIA
GO
USE BDVETERINARIA
CREATE TABLE SERVICO (
    CodServico  INT IDENTITY CONSTRAINT PKServico PRIMARY KEY,
    NomeServico VARCHAR(100) NOT NULL,
    Valor       MONEY NOT NULL
)
CREATE TABLE USUARIO (
    CodUsuario      INT IDENTITY CONSTRAINT PKUsuario PRIMARY KEY,
    NomeUsuario     VARCHAR(50) NOT NULL CONSTRAINT UQUsuario UNIQUE,
    Senha           VARCHAR(20) NOT NULL,
    NivelAcesso     INT NOT NULL
)
CREATE TABLE CLIENTE (
    CodCliente      INT IDENTITY CONSTRAINT PKCliente PRIMARY KEY,
    Nome            VARCHAR(50) NOT NULL INDEX IDX_NOME,
    Cpf             CHAR(11) NOT NULL CONSTRAINT UQCpf UNIQUE,
    Telefone        CHAR(11),
    Celular         CHAR(12),
    Email           VARCHAR(70) NOT NULL CONSTRAINT UQEmailCliente UNIQUE
)
CREATE TABLE ANIMAL (
    CodAnimal       INT IDENTITY CONSTRAINT PKAnimal PRIMARY KEY,
    CodCliente      INT CONSTRAINT FKCliente FOREIGN KEY REFERENCES CLIENTE (CodCliente),
    Nome            VARCHAR(50) NOT NULL INDEX IDX_NomeAnimal,
    DataNascimento  DATE,
    Raca            VARCHAR(30) NOT NULL,
    Obs             VARCHAR(100)
)
CREATE TABLE AGENDAMENTO (
    CodAgendamento      INT IDENTITY CONSTRAINT PKAgendamento PRIMARY KEY,
    CodCliente          INT CONSTRAINT FKClienteAgendamento FOREIGN KEY REFERENCES Cliente (CodCliente),
    DataServico         DATE NOT NULL,
    HoraInicio          TIME NOT NULL,
    HoraTermino         TIME NOT NULL,
    Obs                 VARCHAR(255)
)
--2 – Usando o comando ALTER TABLE, adicione os seguintes campos na tabela CLIENTE: rua, numero, cidade, bairro, cep e estado.
ALTER TABLE CLIENTE ADD 
    Rua VARCHAR(100) NOT NULL,
    Numero VARCHAR(10) NOT NULL,
    Cidade VARCHAR(100) NOT NULL,
    Bairro VARCHAR(100),
    Cep CHAR(8) NOT NULL,
    Estado CHAR(2)

	SELECT * FROM CLIENTE
--3 – Usando o comando ALTER TABLE, adicione os seguintes campos na tabela ANIMAL: nome da espécie e sexo.
ALTER TABLE ANIMAL ADD
    Especie VARCHAR(50) NOT NULL,
    Sexo    VARCHAR(30)
--4 – Usando o comando ALTER TABLE adicione o campo CODSERVICO na tabela AGENDAMENTO e deixe este campo como chave estrangeira e defina um nome para a constraint.
ALTER TABLE AGENDAMENTO ADD
    CodServico INT CONSTRAINT FKServico FOREIGN KEY REFERENCES Servico (CodServico)
--5 – Usando o comando ALTER TABLE altere o tipo de dados do campo OBS para TEXT nas tabelas ANIMAL e AGENDAMENTO.
ALTER TABLE ANIMAL ALTER COLUMN Obs TEXT
ALTER TABLE AGENDAMENTO ALTER COLUMN Obs TEXT
--6 – Usando o comando ALTER TABLE, exclua o campo NIVELACESSO da tabela USUARIO.
ALTER TABLE USUARIO DROP COLUMN NivelAcesso
--7 – Altere o nome da tabela CLIENTE para CLIENTES.
exec sp_rename 'CLIENTE', 'CLIENTES'
--8 – Altere o nome da tabela SERVICO para SERVICOS.
exec sp_rename SERVICO, SERVICOS
--9 – Altere o nome do campo DATASERVICO para DTSERVICO.
exec sp_rename 'AGENDAMENTO.DataServico', 'DtServico','COLUMN'
-- 10 – Altere o nome do campo DATANASCIMENTO para NASCIMENTO.
exec sp_rename 'ANIMAL.DataNascimento', 'Nascimento','COLUMN'
--11 – Altere o nome do banco de dados para BD_MYPETS.
ALTER DATABASE BDVETERINARIA MODIFY NAME = BD_MYPETS
--Cadastro de Serviços
INSERT INTO Servicos 
(NomeServico, Valor) 
VALUES 
('Banho', 50.99)
INSERT INTO Servicos 
(NomeServico, Valor) 
VALUES 
('Tosa', 35)

--COMANDO PARA CONSULTAR OS DADOS
SELECT  * FROM SERVICOS -- exibe todas as colunas
SELECT NomeServico, Valor FROM SERVICOS -- exibe apenas as colunas nomeservico e valor
--Realizar 3 cadastros em cada tabela