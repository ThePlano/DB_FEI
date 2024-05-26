import random

class GeradorNomes:
    primeiros_nomes_alunos = ['João', 'Maria', 'Pedro', 'Ana', 'Luiz', 'Carla', 'Fernando', 'Juliana', 'Lucas',
                              'Mariana', 'Rafael', 'Nathalia', 'Nicole', 'Beatriz', 'Rafaela', 'Leandro', 'Arthur', 'Camila']
    sobrenomes_alunos = ['Silva', 'Santos', 'Oliveira', 'Pereira', 'Lima', 'Costa', 'Souza', 'Ferreira', 'Almeida',
                         'Rodrigues', 'Maria', 'Shimokawa', 'Sombra', 'Assembleia', 'Dias', 'Oliveira', 'Atuki', 'Yenkei']

    @staticmethod
    def nome_aluno():
        primeiro_nome = random.choice(GeradorNomes.primeiros_nomes_alunos)
        sobrenome = random.choice(GeradorNomes.sobrenomes_alunos)
        return f"{primeiro_nome} {sobrenome}"

    @staticmethod
    def gerar_aluno():
        nome = GeradorNomes.nome_aluno()
        primeiro_nome, sobrenome = nome.split()
        email = f"{primeiro_nome.lower()}.{sobrenome.lower()}@fei.com"
        nascimento = '2000-01-01'
        curso = random.randint(1, 4)
        return {'nome': nome, 'nascimento': nascimento, 'email': email, 'curso': curso}


num_alunos = 10
alunos = [GeradorNomes.gerar_aluno() for _ in range(num_alunos)]

insert_alunos_query = "INSERT INTO Aluno (nome_completo, nascimento, email, curso) VALUES\n"
insert_alunos_query += ",\n".join([f"('{aluno['nome']}', '{aluno['nascimento']}', '{aluno['email']}', {aluno['curso']})" for aluno in alunos]) + ";"

print(insert_alunos_query)
