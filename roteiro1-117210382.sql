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
 Splano VARCHAR(15) REFERENCES SEGURO(plano), 
 PRIMARY KEY(cpf)
);

CREATE TABLE PERITO (
 nome varchar(20),
 cpf char(11),
 primary key(cpf)
);

CREATE TABLE OFICINA (
 nome varchar(20),
 telefone char(14), --formato: (dd)*****-****
 cnpj char(14),
 servicos varchar(20), --eletrico/mecanico
 primary key(cnpj)
);

CREATE TABLE SEGURO (
 id integer primary key,
 Scpf char(11) REFERENCES SEGURADO (cpf) , -- cpf do segurado
 plano varchar(15),
 franquia numeric
);
 
