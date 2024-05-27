SELECT 
    a.nome_completo,
    a.matricula,
    a.nascimento,
    a.email
FROM 
    aluno a
JOIN 
    historico_escolar he ON a.matricula = he.aluno
JOIN 
    curso c ON he.curso = c.codigo
JOIN 
    matriz_curricular mc ON c.matriz_curricular = mc.id
JOIN 
    nota n ON he.notaid = n.notaid
WHERE 
    n.nota_final >= 5 -- Supondo que a nota mínima para aprovação é 5
    AND NOT EXISTS (
        SELECT 1
        FROM curso c2
        LEFT JOIN historico_escolar he2 ON c2.codigo = he2.curso AND he2.aluno = a.matricula
        LEFT JOIN nota n2 ON he2.notaid = n2.notaid
        WHERE 
            c2.matriz_curricular = mc.id
            AND (n2.nota_final < 5 OR n2.nota_final IS NULL)
    )
    AND n.semestre = '2024.1' -- Especifique o semestre e ano desejado
GROUP BY 
    a.nome_completo, a.matricula, a.nascimento, a.email
ORDER BY 
    a.nome_completo;
