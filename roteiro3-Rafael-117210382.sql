CREATE TYPE estado AS ENUM('paraiba','rio grande do norte','sergipe','alagoas','bahia','piaui','pernambuco','ceara','maranhao'); 

CREATE TABLE FARMACIA (
 id INTEGER PRIMARY KEY,
 nome TEXT NOT NULL,
 bairro TEXT NOT NULL,
 cidade TEXT NOT NULL,
 estado estado NOT NULL,
 tipo VARCHAR(6) NOT NULL,                    
 gerente CHAR(11)
 
);

ALTER TABLE FARMACIA ADD CONSTRAINT check_tipo CHECK (tipo = 'sede' OR tipo = 'filial');

CREATE TYPE funcao AS ENUM('farmaceutico','vendedor','entregador','caixa','administrador'); 

CREATE TABLE FUNCIONARIO (
 cpf CHAR(11) PRIMARY KEY,
 nome TEXT,
 funcao funcao, 
 locacao INTEGER REFERENCES farmacia (id)
);

ALTER TABLE FARMACIA ADD CONSTRAINT fgk_gerente FOREIGN KEY (gerente) 
 REFERENCES funcionario (cpf);

CREATE TABLE CLIENTE (
 nome TEXT NOT NULL,
 cpf CHAR(11) PRIMARY KEY
 
);

CREATE TYPE endereco AS ENUM('residencia','trabalho','outro');

CREATE  TABLE ENDERECOS_CLIENTE (
 cpf_cliente CHAR(11) REFERENCES CLIENTE (cpf),
 tipo endereco
);

CREATE TYPE venda AS ENUM('venda exclusiva com  receita');

CREATE TABLE MEDICAMENTO (
 id INTEGER PRIMARY KEY,
 nome TEXT,
 caracteristica venda 
);

CREATE TABLE ENTREGAS(
 codigo INTEGER PRIMARY KEY,
);






















