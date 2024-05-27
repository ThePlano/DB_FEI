import random

alunos_ids = list(range(1, 11))
disciplinas_ids = list(range(1, 6))

notas = [(aluno_id, random.choice(disciplinas_ids), round(random.uniform(5.0, 10.0), 1)) for aluno_id in alunos_ids for _ in range(2)]

insert_notas_query = "INSERT INTO Nota (matricula, disciplina, nota_final) VALUES\n"
insert_notas_query += ",\n".join([f"({matricula}, {disciplina}, {nota_final})" for matricula, disciplina, nota_final in notas]) + ";"

print(insert_notas_query)
