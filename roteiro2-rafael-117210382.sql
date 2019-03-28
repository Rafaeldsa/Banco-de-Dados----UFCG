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

