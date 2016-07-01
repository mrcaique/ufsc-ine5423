CREATE TABLE Aluno (
	nCartao INTEGER NOT NULL,
	nome VARCHAR(50),
	sexo CHAR(1),
	PRIMARY KEY(nCartao)
);
CREATE TABLE Grupo (
	numero INTEGER NOT NULL, 
	nome VARCHAR(50),
	PRIMARY KEY(numero)
);
CREATE TABLE Trabalho (
	numero INTEGER NOT NULL,
	nome VARCHAR(50),
	tipoEntrega char(1),
	de DATE,
	ate DATE,
	PRIMARY KEY(numero)
);
CREATE TABLE Prova (
	numero INTEGER NOT NULL,
	nCartao INTEGER NOT NULL,
	nome VARCHAR(50),
	nota DECIMAL,
	data DATE,
	PRIMARY KEY(numero, nCartao)
	FOREIGN KEY nCartao REFERENCES Aluno(nCartao)
);
CREATE TABLE T_G (
	nGrupo INTEGER NOT NULL,
	nTrab INTEGER NOT NULL,
	nota DECIMAL,
	PRIMARY KEY(nGrupo, nTrab)
	FOREIGN KEY nGrupo REFERENCES Grupo(numero)
	FOREIGN KEY nTrab REFERENCES Trabalho(numero)
);
CREATE TABLE G_A (
	nAluno INTEGER NOT NULL,
	nGrupo INTEGER NOT NULL,
	PRIMARY KEY(nAluno, nGrupo)
	FOREIGN KEY nAluno REFERENCES Aluno(nCartao)
	FOREIGN KEY nGrupo REFERENCES Grupo(numero)
);