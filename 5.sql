SELECT 
    t.codigo AS tcc_codigo,
    t.titulo AS tcc_titulo,
    p.nome_completo AS professor_orientador,
    a.nome_completo AS aluno_nome
FROM 
    tcc t
JOIN 
    professor p ON t.professor_orientador = p.id_professor
JOIN 
    aluno a ON t.matricula_aluno = a.matricula
ORDER BY 
    t.codigo, p.nome_completo, a.nome_completo;
