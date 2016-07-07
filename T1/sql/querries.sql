--I. Crie uma consulta que teste duas colunas no WHERE, mas que selecione outras duas.
--A cláusula WHERE deve possuir o operador BETWEEN
	--Nome do Projeto e Ano de término dos projetos que são sequencia de outros e que começaram entre 2000 e 2010
SELECT NomeProj, AnoFim
FROM Projeto
WHERE CodProjAnte IS NOT NULL AND AnoInicio BETWEEN '2000' AND '2010';

--II. Crie uma consulta que acesse duas tabelas. A clausula SELECT deve possuir mais de dois atributos.
--A cláusula WHERE deve possuir AND e OR. A consulta deve possuir três variantes:
	--Código e nome do curso e nome e email das pessoas onde a pessoa tem email at uni e o nome do curso
	--que ela cursa é Computação ou a pessoa é do sexo Feminino

	--(a) com operador JOIN
SELECT CodCurso, NomeCurso, NomePess, EMailPref
FROM Pessoa NATURAL JOIN Curso
WHERE Pessoa.EMailPref LIKE '%@uni%' AND (Curso.NomeCurso = 'Computação' OR Pessoa.Sexo = 'F');

	--(b) com operador de produto cartesiano
SELECT C.CodCurso, NomeCurso, NomePess, EMailPref
FROM (SELECT NomePess, EMailPref, Sexo, CodCurso FROM Pessoa) AS P, (SELECT CodCurso, NomeCurso FROM Curso) AS C
WHERE P.EMailPref LIKE '%@uni%' AND (C.NomeCurso = 'Computação' OR P.Sexo = 'F') AND P.CodCurso = C.CodCurso;

--III. Crie uma consulta que acesse três tabelas, sendo que uma delas deve ter sido criada por causa de um
--relacionamento n_n do modelo conceitual. A clausula SELECT deve possuir pelo menos um atributo de cada uma
--das tabelas relacionadas. A cláusula WHERE deve possuir pelo menos três filtros. A consulta deve ser feita
--com operador de JOIN e possuir alguma função de agregação.
	--Nome das pessoas, nome dos projetos e papel das pessoas no projeto onde o projeto tenha mais de um 
	--envolvido, seja uma continuação de um projeto anterior e tenha sido iniciado após 2000
SELECT PPP.NomePess, PPP.NomeProj, PPP.PapelPessProj
FROM (Pessoa NATURAL JOIN (
		Projeto NATURAL JOIN ProjetoPessoa
		) AS PP
	) AS PPP NATURAL JOIN (
		SELECT P.CodProj, count(NumeroCartao) AS count
		FROM Pessoa NATURAL JOIN (
				Projeto NATURAL JOIN ProjetoPessoa
				) AS P
		GROUP BY P.CodProj
	) AS GP
WHERE GP.count > 1 AND PPP.CodProjAnte IS NOT NULL AND AnoInicio > '2000';

--IV. Crie uma consulta que acesse três tabelas selecionando dois atributos quaisquer e usando a função COUNT().
--Utilize o ORDER BY e GROUP BY. A clausula WHERE deve possuir pelo menos dois filtros.
	--Nome das mulheres e seus respectivos cursos onde ela tem um email alternativo hospedado fora de @uni e o
	--número de email alternativos respeitando a cláusula.
SELECT P.NomePess, Curso.NomeCurso, count(CodCurso)
FROM Curso NATURAL JOIN (Pessoa NATURAL JOIN OutroEmail) AS P
WHERE P.sexo = 'F' AND EMail NOT LIKE '%@uni%'
GROUP BY P.NomePess, Curso.NomeCurso
ORDER BY Curso.NomeCurso;

--V. Crie uma consulta que acesse três tabelas que utilize o HAVING. A cláusula WHERE deve possuir pelo menos dois filtros.
--O HAVING deve testar o valor de retorno de uma função de agregação escrita em uma clausula SELECT.
	--O numero do cartão, nome da pessoa e número de projetos dos ALUNOS que LIDEREM dois ou mais projetos
SELECT P.NumeroCartao, P.NomePess, count(NumeroCartao)
FROM Curso NATURAL JOIN (Pessoa NATURAL JOIN ProjetoPessoa) AS P
WHERE P.PapelPessProj = 'Lider' AND CodCurso IS NOT NULL
GROUP BY P.NumeroCartao, P.NomePess
HAVING count(*) >= 2;
