--Iniciando roteiro1

CREATE TABLE AUTOMOVEL (
 placa CHAR(8),
 Modelo VARCHAR(20),
 Nchassi CHAR(17),
 Marca VARCHAR(20),
 Ano INTEGER,
 PRIMARY KEY(placa)
);

CREATE TABLE SEGURADO (
 nome VARCHAR(20),
 Splaca CHAR(8)  REFERENCES AUTOMOVEL (placa),
 cpf CHAR(11),
 telefone CHAR(14), --formato: (dd)*****-****
 PRIMARY KEY(cpf)
);

CREATE TABLE PERITO (
 nome VARCHAR(20),
 cpf CHAR(11),
 PRIMARY KEY(cpf)
);

CREATE TABLE OFICINA (
 nome VARCHAR(20),
 telefone CHAR(14), --formato: (dd)*****-****
 cnpj CHAR(14),
 servicos VARCHAR(20), --eletrico/mecanico
 PRIMARY KEY(cnpj)
);

CREATE TABLE SEGURO (
 
