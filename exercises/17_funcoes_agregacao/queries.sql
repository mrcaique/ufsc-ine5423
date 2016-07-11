-- 1. Quantidade de médicos com consultas anteriores a ‘2005/09/01’
SELECT count(medico.codigo)
FROM medico JOIN consulta ON medico.codigo = consulta.codMed
WHERE consulta.data < '2005-09-01';

-- 2. Valor total das consultas já feitas.
SELECT sum(valor)
FROM consulta;

-- 3. O código, nome e CRM dos médicos, e a quantidade de consultas realizadas
-- por cada um em ‘2006’. O resultado deve ser ordenado por nome do médico.
SELECT medico.codigo, medico.nome, medico.CRM, count(consulta.codMed)
FROM medico JOIN consulta ON medico.codigo = consulta.codMed
WHERE consulta.data BETWEEN '2006-01-01' AND '2006-12-31'
GROUP BY medico.codigo, medico.CRM, consulta.codMed
ORDER BY medico.nome;

-- 4. Data e hora da consulta, nome do médico e nome do paciente. Pacientes
-- devem ter idade inferior a 18 anos, e a especialização do médico deve
-- ser ‘Pediatria’. Ordenar por data e hora da consulta. 
SELECT pc.data, pc.hora, mm.nome, pc.nome
FROM (
    especializacao JOIN (
        medico JOIN medEsp ON medico.codigo = medEsp.codMed
    ) AS mm 
    ON especializacao.codigo = mm.codEsp
) JOIN (
    paciente JOIN consulta ON paciente.codigo = consulta.codPac
) AS pc
    ON mm.codigo = pc.codMed
WHERE pc.idade < 18 AND especializacao.nome = 'Pediatria'
ORDER BY pc.data, pc.hora;

-- 5. Data das consultas, e para cada data o somatório total dos valores,
-- desde que este total seja maior do que 100.00. 
SELECT consulta.data, sum(consulta.valor)
FROM consulta
GROUP BY consulta.data
HAVING sum(valor) > 100;

-- 6. Nome das cidades, e a quantidade de pacientes moradores em cada uma
-- delas. Ordenar o resultado por ordem decrescente de nome de cidade. 
SELECT cidade.nome, count(paciente.codCid)
FROM paciente JOIN cidade ON paciente.codCid = cidade.codigo
GROUP BY cidade.nome
ORDER BY cidade.nome DESC;

-- 7. Descrição do medicamento e para cada um deles a quantidade receitada nas
-- consultas. Ordenar o resultado por pela descrição do medicamento, e colocar
-- na resposta apenas aqueles cuja quantidade receitada é maior do que 1.
SELECT medicamento.descricao, count(cc.codMedica)
FROM (
    cons_medicame NATURAL JOIN consulta
) AS cc 
    JOIN medicamento ON cc.codMedica = medicamento.codigo
GROUP BY medicamento.descricao
HAVING count(cc.codMedica) > 1;

-- 8. Nome da especialização e nome do médico que possui CRM = 23453. Ordenar o
-- resultado por ordem decrescente do nome da especialização. 
SELECT especializacao.nome, mm.nome
FROM especializacao JOIN (
    medEsp JOIN medico 
    ON medico.codigo = medEsp.codMed AND
        medico.CRM = '23453'
) AS mm
    ON especializacao.codigo = mm.codEsp
ORDER BY especializacao.nome DESC;

-- 9. Código, nome e CRM dos médicos que possuem consulta. Ordenar o resultado
-- por CRM do médico, por ordem decrescente.
SELECT DISTINCT medico.codigo, medico.nome, medico.CRM
FROM medico JOIN consulta ON consulta.codMed = medico.codigo
ORDER BY medico.CRM DESC;

-- 10. Nome do médico e para cada um deles a quantidade de consultas efetuadas.
-- Devem aparecer no resultado apenas médicos com mais de uma consulta efetuada.
SELECT medico.nome, count(consulta.codMed)
FROM medico JOIN consulta ON consulta.codMed = medico.codigo
GROUP BY medico.nome
HAVING count(consulta.codMed) > 1;

-- 11. Descrição dos medicamentos prescritos, e para cada um deles a quantidade
-- total prescrita. Ordenar pela descrição.
SELECT medicamento.descricao, count(cons_medicame.codMedica)
FROM medicamento JOIN cons_medicame 
    ON medicamento.codigo = cons_medicame.codMedica
GROUP BY medicamento.descricao
ORDER BY medicamento.descricao;

-- 12. Data da consulta, e a quantidade de pacientes com idade menor que 25.
SELECT consulta.data, count(paciente.codigo)
FROM consulta JOIN paciente ON consulta.codPac = paciente.codigo AND
    paciente.idade < 25
GROUP BY consulta.data;

-- 13. Nome das cidades, e a quantidade de pacientes moradores em cada uma
-- delas, desde que o número de pacientes moradores seja mais do que 1 (>=2).
-- Ordenar o resultado por ordem decrescente de nome de cidade.
SELECT cidade.nome, count(paciente.codCid)
FROM cidade JOIN paciente ON cidade.codigo = paciente.codCid
GROUP BY cidade.nome
HAVING count(paciente.codCid) > 1
ORDER BY cidade.nome DESC;

-- 14. Nome das cidades, e a quantidade de pacientes moradores em cada uma
-- delas, cujo nome da cidade comece com ‘C’. Ordenar o resultado por ordem
-- decrescente de nome de cidade.
SELECT cidade.nome, count(paciente.codCid)
FROM cidade JOIN paciente ON cidade.codigo = paciente.codCid
WHERE cidade.nome LIKE 'C%'
GROUP BY cidade.nome
ORDER BY cidade.nome DESC;

-- 15. Nome do médico, e para cada um deles a quantidade de consultas efetuadas;
-- o nome do médico deve começar com ‘P’ ou com ‘C’.
SELECT medico.nome, count(consulta.codMed)
FROM medico JOIN consulta ON medico.codigo = consulta.codMed AND
    (medico.nome LIKE 'C%' OR medico.nome LIKE 'P%')
GROUP BY medico.nome;
-- Ou
SELECT medico.nome, count(consulta.codMed)
FROM medico JOIN consulta ON medico.codigo = consulta.codMed
WHERE medico.nome LIKE 'C%' OR medico.nome LIKE 'P%'
GROUP BY medico.nome;
