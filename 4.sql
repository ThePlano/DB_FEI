SELECT p.nome_completo AS "Nome do Professor",
       d.nome AS "Nome do Departamento"
FROM professor p
JOIN departamento d ON p.id_professor = d.codigo
WHERE p.chefe = false ;