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

