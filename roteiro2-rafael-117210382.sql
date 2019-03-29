--Questão 1
CREATE TABLE TAREFAS (
 id INTEGER,
 tarefa VARCHAR(60),
 cpf CHAR(11),
 vaiFazer INTEGER, 
 sexo CHAR(1)
);


INSERT INTO TAREFAS VALUES (2147483646, 'limpar chão do corredor central', '98765432111',0,'F');

INSERT INTO TAREFAS VALUES (2147483647, 'limpar janelas da sala 203', '98765432122',1,'F');

INSERT INTO TAREFAS VALUES (null, null, null, null, null);

--INSERT INTO TAREFAS VALUES (2147483644, 'limpar chão do corredor superior', '987654323211',0,'F'); este comando não deve ter a execução autorizada

--INSERT INTO TAREFAS VALUES (2147483643, 'limpar chão do corredor superior', '98765432122',1,'FF'); este comando não deve ter a execução autorizada

--Questão 2
ALTER TABLE TAREFAS ALTER COLUMN id TYPE BIGINT;

INSERT INTO TAREFAS VALUES (2147483648, 'limpar portas do térreo', '32323232955',4,'A');

--Questão 3
ALTER TABLE TAREFAS ADD CONSTRAINT check_vfazer CHECK (vaiFazer < 32768);

--INSERT INTO TAREFAS VALUES (2147483649, 'limpar portas da entrada principal', '32322525199',32768,'A'); este comando não deve ter a execução autorizada

--INSERT INTO TAREFAS VALUES (2147483650, 'limpar janelas da entrada principal', '32333233288',32769,'A'); este comando não deve ter a execução autorizada

INSERT INTO TAREFAS VALUES (2147483651, 'limpar portas do 1o andar', '32323232911',32767,'A');

INSERT INTO TAREFAS VALUES (2147483652, 'limpar portas do 2o andar', '32323232911',32766,'A');

--Questão 4
DELETE FROM TAREFAS WHERE id is null;

ALTER TABLE TAREFAS RENAME COLUMN tarefa TO descricao;
ALTER TABLE TAREFAS RENAME COLUMN cpf TO func_resp_cpf;
ALTER TABLE TAREFAS RENAME COLUMN vaifazer TO prioridade;
ALTER TABLE TAREFAS RENAME COLUMN sexo TO status;

ALTER TABLE TAREFAS ALTER COLUMN id SET NOT NULL;
ALTER TABLE TAREFAS ALTER COLUMN descricao SET NOT NULL;
ALTER TABLE TAREFAS ALTER COLUMN func_resp_cpf SET NOT NULL;
ALTER TABLE TAREFAS ALTER COLUMN prioridade SET NOT NULL;
ALTER TABLE TAREFAS ALTER COLUMN status SET NOT NULL;

--Questão 5
ALTER TABLE TAREFAS ADD CONSTRAINT pk PRIMARY KEY (func_resp_cpf, id);

INSERT INTO TAREFAS VALUES (2147483653, 'limpar portas do 1o andar', '32323232911',2,'A');
--INSERT INTO TAREFAS VALUES (2147483653, 'aparar a grama da área frontal', '32323232911',3,'A');
--não funciona após o insert anterior ter sido executado

--Questão 6
--a) 
ALTER TABLE TAREFAS ADD CONSTRAINT validaCPF CHECK (LENGTH(func_resp_cpf) = 11);

--INSERT INTO TAREFAS VALUES (2147483653, 'limpar portas do 1o andar', '323232329115',2,'A');
--não foi inserido pois o length foi maior do cpf

--b)
--ALTER TABLE TAREFAS ADD CONSTRAINT vldStatus CHECK (status = 'P' OR status = 'E' OR status = 'C');
-- erro pois ainda não houve o update

UPDATE TAREFAS SET status = 'P' WHERE status = 'A';
UPDATE TAREFAS SET status = 'E' WHERE status = 'F';

ALTER TABLE TAREFAS ADD CONSTRAINT vldStatus CHECK (status = 'P' OR status = 'E' OR status = 'C');

--Questão 7
UPDATE TAREFAS SET prioridade = 5 WHERE prioridade = 32767;
UPDATE TAREFAS SET prioridade = 5 WHERE prioridade = 32766;

ALTER TABLE TAREFAS ADD CONSTRAINT valorPrioridade CHECK (prioridade >= 0 AND prioridade <= 5;

--Questão 8
CREATE TABLE FUNCIONARIO (
 cpf CHAR(11) PRIMARY KEY,
 data_nasc DATE NOT NULL,
 nome VARCHAR(30) NOT NULL,
 funcao VARCHAR(11) NOT NULL,
 nivel CHAR(1),
 superior_cpf CHAR(11) REFERENCES FUNCIONARIO (cpf)
);

ALTER TABLE FUNCIONARIO ADD CONSTRAINT checkFuncao CHECK (funcao = 'LIMPEZA' OR funcao = 'SUP_LIMPEZA');

ALTER TABLE FUNCIONARIO ALTER COLUMN nivel SET NOT NULL;

ALTER TABLE FUNCIONARIO ADD CONSTRAINT checkNivel CHECK (nivel = 'J' OR nivel = 'P' OR nivel = 'S');

ALTER TABLE FUNCIONARIO ADD CONSTRAINT checkSuperior CHECK (funcao = 'LIMPEZA' AND superior_cpf IS NOT NULL OR (funcao = 'SUP_LIMPEZA' and superior_cpf is null));

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678911', '1982-05-07','Pedro da Silva', 'SUP_LIMPEZA', 'S', null);

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678912', '1980-03-08','Jose da Silva', 'LIMPEZA', 'J', '12345678911');

--INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678913', '1980-04-09','joao da Silva', 'LIMPEZA', 'J', null);
--não deve funcionar

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678913', '1972-04-15','Alvaro Dantas', 'SUP_LIMPEZA', 'P', null);
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678914', '1972-03-25','Gabriel Dantas', 'LIMPEZA', 'J', '12345678913');
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678915', '1972-03-27','Marilane Azevedo', 'SUP_LIMPEZA', 'S', null);
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678916', '1972-01-08','Rafaela Dantas', 'LIMPEZA', 'P', '12345678915');



