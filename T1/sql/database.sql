#!/usr/bin/sql

--------------------------
-- 	Questão 3 	--
--------------------------
-- Criação do banco para a questão 3

-- Tabela com os cursos da Universidade.
CREATE TABLE curso (
    codcurso INTEGER NOT NULL,
    nomecurso VARCHAR(50),
    PRIMARY KEY(codcurso)
);

-- Tabela com emails alternativos das pessoas.
CREATE TABLE outroemail (
    numerocartao INTEGER NOT NULL,
    email VARCHAR(50) NOT NULL,
    PRIMARY KEY(numerocartao, email),
    FOREIGN KEY(numerocartao) REFERENCES pessoa(numerocartao)
);

-- Tabela de pessoas (alunos e servidores) com número de cartão,
-- nome da pessoa, sexo e email preferencial. Para alunos,
-- o código do curso identifica o curso a que eles estão vinculados.
CREATE TABLE pessoa (
    numerocartao INTEGER NOT NULL,
    nomepess VARCHAR(50),
    sexo CHAR(1),
    emailpref VARCHAR(50),
    codcurso INTEGER,
    PRIMARY KEY(numerocartao),
    FOREIGN KEY(codcurso) REFERENCES curso(codcurso)
);

-- Tabela com os projetos em andamento e concluídos. Quando
-- um projeto é continuação de outro, a coluna 'CodProjAnte'
-- informa o projeto anterior ao projeto em questão.
-- Quando o projeto não é continuação, a coluna fica vazia (NULL).
CREATE TABLE projeto (
    codproj INTEGER NOT NULL,
    nomeproj VARCHAR(50),
    anoinicio CHAR(4),
    anofim CHAR(4),
    codprojante INTEGER,
    PRIMARY KEY(codproj),
    FOREIGN KEY(codprojante) REFERENCES projeto(codprojante)
);

-- Tabela que víncula projetos a pessoas. O papel da pessoa pode
-- ser: 'Líder', 'Membro' e 'Bolsista'.
CREATE TABLE projetopessoa (
    codproj INTEGER NOT NULL,
    numerocartao INTEGER NOT NULL,
    papelpessproj CHAR(8) 
        CHECK (papelpessproj IN ('Lider', 'Membro', 'Bolsita')),
    PRIMARY KEY(codproj, numerocartao),
    FOREIGN KEY(codproj) REFERENCES projeto(codproj),
    FOREIGN KEY(numerocartao) REFERENCES pessoa(numerocartao)
);

