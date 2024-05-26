import random

class GeradorTCC:
    titulos_tcc = [
        'Desenvolvimento de um Sistema de Recomendação',
        'Análise de Algoritmos Genéticos',
        'O Uso de Machine Learning na Previsão de Vendas',
        'Desenvolvimento de um Aplicativo Mobile para Educação',
        'Implementação de um Sistema de Controle de Estoque',
        'Estudo de Redes Neurais Convolucionais',
        'Desenvolvimento de um Jogo Educativo',
        'Análise de Big Data em Sistemas de Informação',
        'Uso de IoT na Automação Residencial',
        'Desenvolvimento de uma Plataforma de E-commerce'
    ]

    @staticmethod
    def gerar_tcc(matricula_aluno, professor_orientador):
        titulo = random.choice(GeradorTCC.titulos_tcc)
        return {'titulo': titulo, 'matricula_aluno': matricula_aluno, 'professor_orientador': professor_orientador}

num_tccs = 5
tccs = [GeradorTCC.gerar_tcc(i + 1, i + 1) for i in range(num_tccs)]

insert_tcc_query = "INSERT INTO TCC (titulo, matricula_aluno, professor_orientador) VALUES\n"
insert_tcc_query += ",\n".join([f"('{tcc['titulo']}', {tcc['matricula_aluno']}, {tcc['professor_orientador']})" for tcc in tccs]) + ";"

print(insert_tcc_query)
