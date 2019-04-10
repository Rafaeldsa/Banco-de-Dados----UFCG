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
 cliente_cpf CHAR(11) REFERENCES CLIENTE (cpf),
 cliente_endereco endereco NOT NULL 
);

ALTER TABLE ENTREGAS ADD CONSTRAINT cliente_ender CHECK (cliente_endereco = 'residencia' OR cliente_endereco = 'trabalho' OR cliente_endereco = 'outro');

CREATE TABLE VENDAS (
 codigo INTEGER PRIMARY KEY,
 clien_cpf CHAR(11) REFERENCES CLIENTE (cpf),
 func_cpf CHAR(11) REFERENCES FUNCIONARIO (cpf)
);

ALTER TABLE FARMACIA ADD CONSTRAINT unique_bairro UNIQUE (bairro);
ALTER TABLE FUNCIONARIO ADD COLUMN id_venda INTEGER;
ALTER TABLE MEDICAMENTO ADD COLUMN id_venda INTEGER;

ALTER TABLE FUNCIONARIO ADD CONSTRAINT fgk_id_vendas FOREIGN KEY (id_venda) REFERENCES VENDAS (codigo);
ALTER TABLE MEDICAMENTO ADD CONSTRAINT fgk_id_venda FOREIGN KEY (id_venda) REFERENCES VENDAS (codigo);

ALTER TABLE FUNCIONARIO DROP COLUMN id_venda;


ALTER TABLE FARMACIA ADD CONSTRAINT tipo_excl EXCLUDE USING gist (
	tipo WITH =) WHERE (tipo = 'sede');

ALTER TABLE FARMACIA ADD COLUMN gerente_func TEXT;
ALTER TABLE FARMACIA ADD CONSTRAINT check_gerente_func CHECK (gerente_func = 'farmaceutico' OR gerente_func = 'administrador');

ALTER TABLE VENDAS ADD COLUMN vendedor_func funcao;
ALTER TABLE VENDAS ADD CONSTRAINT check_vend_fun CHECK (vendedor_func = 'vendedor');






