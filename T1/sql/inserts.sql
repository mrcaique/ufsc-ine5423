-- inserts
INSERT INTO Curso VALUES (1, 'Matemática');
INSERT INTO Curso VALUES (2, 'Física');
INSERT INTO Curso VALUES (3, 'Computação');
INSERT INTO Curso VALUES (4, 'Filosofia');
INSERT INTO Curso VALUES (5, 'História');

INSERT INTO Pessoa VALUES (1, 'Vinicius Moraes', 'M', 'vmoraes@uni.br', 2);
INSERT INTO Pessoa VALUES (2, 'Alice Abbud', 'F', 'aabbud@uni.br', 3);
INSERT INTO Pessoa VALUES (3, 'Beto Abbud', 'M', 'betinhoabbud@uni.br', 3);	
INSERT INTO Pessoa VALUES (4, 'Daisy Margarida', 'F', 'flowers@uni.br', 4);
INSERT INTO Pessoa VALUES (5, 'João Sheppard', 'M', 'shepn7@uni.br', 1);
INSERT INTO Pessoa VALUES (6, 'Garrus Valkarian', 'M', 'turian@uni.br', 2);
INSERT INTO Pessoa VALUES (7, 'Gordon Freeman', 'M', 'homemliberdade@uni.br', NULL);
INSERT INTO Pessoa VALUES (8, 'Alyx Vance', 'F', 'ravenholm@uni.br', 2 );
INSERT INTO Pessoa VALUES (9, 'Elias Vance', 'M', 'b.east@uni.br', NULL);
INSERT INTO Pessoa VALUES (10, 'Tali vas Normandy', 'F', 'flotilla@uni.br', NULL);
INSERT INTO Pessoa VALUES (11, 'Marvin Bot', 'M', 'robot42@uni.br', NULL);
INSERT INTO Pessoa VALUES (12, 'Shinji Ikari', 'M', 'eva01@uni.br', NULL);
INSERT INTO Pessoa VALUES (13, 'Amy Pond', 'F', 'waited@uni.br', 5);
INSERT INTO Pessoa VALUES (14, 'John Smith', 'M', 'wibbly-wobbly@uni.br', 5);
INSERT INTO Pessoa VALUES (15, 'Clara Oswald', 'F', 'oswald@uni.br', 5);
INSERT INTO Pessoa VALUES (16, 'Samantha Carter', 'F', 'gate@uni.br', 1);
INSERT INTO Pessoa VALUES (17, 'Rey Ridley', 'F', 'force@uni.br', 4);

INSERT INTO OutroEmail VALUES (14, 'time-y-wimey@stuff.br');
INSERT INTO OutroEmail VALUES (7, 'lambda@locator.br');
INSERT INTO OutroEmail VALUES (3, 'carbine@m1.br');
INSERT INTO OutroEmail VALUES (17, 'awakens@sw.br');

INSERT INTO Projeto VALUES (1, 'Tardis', '1963', '1989', NULL);
INSERT INTO Projeto VALUES (2, '42', '1995', '2000', NULL);
INSERT INTO Projeto VALUES (3, 'StarGate', '1995', '1997', NULL);
INSERT INTO Projeto VALUES (4, 'SG-1', '1997', '2007', 3);
INSERT INTO Projeto VALUES (5, 'Vortigaut', '1997', '2004', NULL);
INSERT INTO Projeto VALUES (6, 'Combine', '2004', '2007', 5);
INSERT INTO Projeto VALUES (7, 'Geth', '2008', '2010', NULL);
INSERT INTO Projeto VALUES (8, 'Collector', '2010', '2012', 7);
INSERT INTO Projeto VALUES (9, 'Reaper', '2012', '2016', 8);
INSERT INTO Projeto VALUES (10, 'Screw Driver', '2006', '2015', 1);

INSERT INTO ProjetoPessoa VALUES (2, 11, 'Lider');
INSERT INTO ProjetoPessoa VALUES (3, 16, 'Lider');
INSERT INTO ProjetoPessoa VALUES (4, 16, 'Lider');
INSERT INTO ProjetoPessoa VALUES (5, 7, 'Lider');
INSERT INTO ProjetoPessoa VALUES (5, 9, 'Membro');
INSERT INTO ProjetoPessoa VALUES (5, 8, 'Bolsista');
INSERT INTO ProjetoPessoa VALUES (6, 7, 'Lider');
INSERT INTO ProjetoPessoa VALUES (6, 9, 'Membro');
INSERT INTO ProjetoPessoa VALUES (6, 8, 'Bolsista');
INSERT INTO ProjetoPessoa VALUES (7, 5, 'Lider');
INSERT INTO ProjetoPessoa VALUES (7, 6, 'Membro');
INSERT INTO ProjetoPessoa VALUES (7, 10, 'Membro');
INSERT INTO ProjetoPessoa VALUES (8, 5, 'Lider');
INSERT INTO ProjetoPessoa VALUES (8, 6, 'Membro');
INSERT INTO ProjetoPessoa VALUES (8, 10, 'Membro');
INSERT INTO ProjetoPessoa VALUES (9, 5, 'Lider');
INSERT INTO ProjetoPessoa VALUES (9, 6, 'Membro');
INSERT INTO ProjetoPessoa VALUES (9, 10, 'Membro');
INSERT INTO ProjetoPessoa VALUES (10, 14, 'Lider');
INSERT INTO ProjetoPessoa VALUES (10, 13, 'Bolsista');
INSERT INTO ProjetoPessoa VALUES (10, 15, 'Bolsista');


