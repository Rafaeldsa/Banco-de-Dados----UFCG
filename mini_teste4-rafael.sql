CREATE TABLE USUARIO(
 nickname VARCHAR(15) PRIMARY KEY NOT NULL,
 data_nasc DATE NOT NULL
 
);

CREATE TABLE MUSICA(
 titulo TEXT PRIMARY KEY NOT NULL,
 estilo CHAR(1) NOT NULL
); 

ALTER TABLE MUSICA ADD CONSTRAINT check_estilo CHECK (estilo = 'R' OR estilo = 'P' OR estilo = 'E' OR estilo = 'S' OR estilo = 'A' OR estilo = 'C');

CREATE TABLE AVALIACOES (
 nota SMALLINT NOT NULL,
 data DATE,
 user_U VARCHAR(15) ,
 musica_titulo VARCHAR(15) 
);

ALTER TABLE AVALIACOES ADD CONSTRAINT  fgk_user FOREIGN KEY (user_u) REFERENCES USUARIO (nickname);

ALTER TABLE AVALIACOES ADD CONSTRAINT  fgk_estilo FOREIGN KEY (musica_titulo) REFERENCES MUSICA (titulo);

ALTER TABLE AVALIACOES ADD CONSTRAINT check_nota CHECK (nota >=0 AND  nota <= 5);

CREATE TABLE PERFIL_USUARIO (
 id INTEGER NOT NULL,
 descr_perfil TEXT NOT NULL,
 cadastra_usuario BOOLEAN NOT NULL,
 cadastra_música BOOLEAN NOT NULL,
 faz_avaliacao BOOLEAN NOT NULL

);

INSERT INTO perfil_usuario (id, descr_perfil, cadastra_usuario, cadastra_música, faz_avaliacao) VALUES (1, 'admin', true, true, true);

INSERT INTO perfil_usuario (id, descr_perfil, cadastra_usuario, cadastra_música, faz_avaliacao) VALUES (2, 'cliente', false, false, true);
