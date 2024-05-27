SELECT he.historicid, he.notaid, a.curso AS nome, a.nome_completo
FROM historico_escolar he
JOIN aluno a ON he.aluno = a.matricula
JOIN curso c ON he.curso = c.codigo
WHERE a.nome_completo = 'Nome do Aluno';