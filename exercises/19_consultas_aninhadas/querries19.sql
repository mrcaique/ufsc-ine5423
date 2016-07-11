-- 1. O nome do paciente mais novo da clínica.
SELECT paciente.nome
FROM paciente
WHERE paciente.idade = (
    SELECT min(paciente.idade)
    FROM paciente
);

-- 2. Obter a data e o horário das consultas da consulta mais cara.
SELECT consulta.data, consulta.hora
FROM consulta
WHERE consulta.valor = (
    SELECT max(consulta.valor)
    FROM consulta
);

-- 3. (nível difícil) A data que representa o dia com o maior valor total
-- arrecadado com consultas.
SELECT consulta.data
FROM consulta
GROUP BY consulta.data
HAVING sum(consulta.valor) >= ALL (
    SELECT sum(consulta.valor)
    FROM consulta
    GROUP BY consulta.data
);

-- 4. Data e hora das consultas, e nome dos convênios usados. Recupere todas as
-- consultas, mesmo quando não foi usado nenhum convenio.
SELECT consulta.data, consulta.hora, convenio.nome
FROM convenio RIGHT OUTER JOIN consulta ON convenio.codigo = consulta.codConv;

-- 5. No Banco de Dados acima, existe alguma consulta usando NATURAL JOIN que
-- faria sentido? Qual? Mostre o código SQL desta consulta com um filtro na
-- cláusula WHERE.

-- 6. Data das consultas e descrição dos medicamentos usados. Recupere todas as
-- consultas, mesmo aquelas em que não houve prescrição de nenhum medicamento.
-- Ordene a resposta por ordem crescente de descrição.
SELECT consulta.data, cm.descricao
FROM consulta NATURAL LEFT OUTER JOIN (
    cons_medicame JOIN medicamento
        ON cons_medicame.codMedica = medicamento.codigo
) AS cm
ORDER BY cm.descricao ASC;

-- 7. Selecionar o nome do paciente que seja mais velho do que todos os
-- pacientes da cidade de “Cruz Alta”.
SELECT paciente.nome, paciente.idade
FROM paciente
WHERE paciente.idade = (
    SELECT max(paciente.idade)
    FROM paciente JOIN cidade 
        ON paciente.codCid = cidade.codigo AND 
        cidade.nome = 'Cruz Alta'
);

-- 8. Uma consulta com NATURAL JOIN entre paciente e medico, qual seria o
-- resultado? Mostre o SQL.
--
-- R.: Resulta uma tabela vazia, NATURAL JOIN compara a igualdade das colunas
-- de mesmo nome. Os nomes iguais entre as duas tabelas são código, nome, email
-- e codCid. Código é chave primária de ambas as tabelas, únicas para cada uma,
-- portanto, a comparação nunca será igual.
SELECT *
FROM paciente NATURAL JOIN medico;

-- 9. Nome dos médicos e áreas de suas especializações. Recupere médicos que
-- não tem especialização e especializações que não foram associadas a nenhum
-- médico. 
SELECT mm.nome, especializacao.area
FROM especializacao LEFT OUTER JOIN (
    medico LEFT OUTER JOIN medEsp ON medEsp.codMed = medico.codigo
) AS mm
    ON especializacao.codigo = mm.codEsp;

-- 10. Nomes dos pacientes e datas de suas consultas anteriores a 2007.
-- Mesmo os pacientes que não tiveram consulta nesta época devem aparecer
-- no resultado.
SELECT paciente.nome, consulta.data
FROM paciente LEFT OUTER JOIN consulta 
    ON paciente.codigo = consulta.codPac AND
        consulta.data < '2007-01-01';

-- 11. Nome, email e idade dos pacientes e quantidade de consultas já
-- realizadas na clínica. Mesmo os pacientes que não tiveram consulta
-- devem aparecer no resultado. Ordenar o resultado pela quantidade.
SELECT paciente.nome, paciente.email, paciente.idade, count(consulta.codPac)
FROM paciente LEFT OUTER JOIN consulta ON paciente.codigo = consulta.codPac
GROUP BY paciente.nome, paciente.email, paciente.idade
ORDER BY count(consulta.codPac);

-- 12. Nome e fone dos pacientes e valor total já gasto com consultas. Mesmo
-- os pacientes que não tiveram consulta devem aparecer no resultado. Ordenar
-- o resultado pelo somatório.
SELECT paciente.nome, paciente.fone, sum(consulta.valor)
FROM paciente LEFT OUTER JOIN consulta ON paciente.codigo = consulta.codPac
GROUP BY paciente.nome, paciente.fone
ORDER BY sum(consulta.valor);
