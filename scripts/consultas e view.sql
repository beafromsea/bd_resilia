#Pergunta 1, quantos estudantes estão cadastrados no banco de dados
SELECT COUNT(ESTUDANTE_ID) 
FROM ESTUDANTES;

#Pergunta 2, Quais os facilitadores que atuam em mais de uma turma
SELECT PESSOAS.NOME AS NOME_FACILITADOR, COUNT(FACILITADORES.FACILITADOR_ID) AS QUANTIDADE_TURMAS 
FROM FACILITADORES
JOIN PESSOAS ON FACILITADORES.PESSOA_ID = PESSOAS.PESSOA_ID
JOIN FACILITADOR_TURMA ON FACILITADORES.FACILITADOR_ID = FACILITADOR_TURMA.FACILITADOR_ID
GROUP BY FACILITADORES.FACILITADOR_ID
HAVING QUANTIDADE_TURMAS >1;

#Pergunta 3.1, Criar uma view que seleciona os alunos inativos
CREATE VIEW EstudantesInativosPorTurma AS
SELECT
    TURMAS.TURMA_ID,
    TURMAS.NOME AS NOME_TURMA,
    COUNT(ESTUDANTES.ESTUDANTE_ID) AS ESTUDANTES_INATIVOS
FROM TURMAS
LEFT JOIN ESTUDANTE_TURMA ON TURMAS.TURMA_ID = ESTUDANTE_TURMA.TURMA_ID AND ESTUDANTE_TURMA.STATUS = 'inativo'
LEFT JOIN ESTUDANTES ON ESTUDANTE_TURMA.ESTUDANTE_ID = ESTUDANTES.ESTUDANTE_ID
GROUP BY TURMAS.TURMA_ID, TURMAS.NOME;

SELECT * FROM ESTUDANTESINATIVOSPORTURMA;

#Pergunta 3.2 (para ver quem são os alunos inativos)
SELECT
    ESTUDANTES.ESTUDANTE_ID,
    PESSOAS.NOME AS NOME_ESTUDANTE,
    TURMAS.NOME AS NOME_TURMA,
    ESTUDANTE_TURMA.STATUS
FROM ESTUDANTE_TURMA
JOIN ESTUDANTES ON ESTUDANTE_TURMA.ESTUDANTE_ID = ESTUDANTES.ESTUDANTE_ID
JOIN PESSOAS ON ESTUDANTES.PESSOA_ID = PESSOAS.PESSOA_ID
JOIN TURMAS ON ESTUDANTE_TURMA.TURMA_ID = TURMAS.TURMA_ID
WHERE ESTUDANTE_TURMA.STATUS = 'inativo';

#Pergunta 4, Quantos alunos tem por turma
SELECT TURMAS.NOME AS NOME_TURMA,
	COUNT(ESTUDANTE_TURMA.ESTUDANTE_ID) AS QUANTIDADE_POR_TURMA
FROM TURMAS
JOIN ESTUDANTE_TURMA ON TURMAS.TURMA_ID = ESTUDANTE_TURMA.TURMA_ID
GROUP BY NOME_TURMA;

#Pergunta 5 Quantos alunos tiveram uma frequencia abaixo de 80 no módulo 1
SELECT
    DESEMPENHOS_ESTUDANTE.ESTUDANTE_ID,
    PESSOAS.NOME AS NOME_ESTUDANTE,
    DESEMPENHOS.FREQUENCIA
FROM DESEMPENHOS_ESTUDANTE
JOIN DESEMPENHOS ON DESEMPENHOS_ESTUDANTE.DESEMPENHO_ID = DESEMPENHOS.DESEMPENHO_ID
JOIN PESSOAS ON DESEMPENHOS_ESTUDANTE.ESTUDANTE_ID = PESSOAS.PESSOA_ID
WHERE DESEMPENHOS_ESTUDANTE.MODULO_ID = 1 AND DESEMPENHOS.FREQUENCIA < 85;