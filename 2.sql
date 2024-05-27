SELECT 
    p.nome_completo AS professor_nome,
    d.nome AS disciplina_nome,
    m.periodo AS semestre_ano
FROM 
    professor p
JOIN 
    disciplina d ON p.id_professor = d.professor_coordenador
JOIN 
    matriz_curricular m ON d.matriz_curricular = m.id
ORDER BY 
    p.nome_completo, m.periodo;
