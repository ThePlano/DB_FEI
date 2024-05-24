-- Tabela Departamento
CREATE TABLE Departamento (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

-- Tabela Professor
CREATE TABLE Professor (
    id_professor SERIAL PRIMARY KEY,
    nome_completo VARCHAR(255) NOT NULL,
    departamento INT,
    inicio_contratacao DATE,
    fim_contratacao DATE,
    chefe BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (departamento) REFERENCES Departamento(codigo)
);

-- Tabela Matriz_Curricular
CREATE TABLE Matriz_Curricular (
    id SERIAL PRIMARY KEY,
    periodo INT
);

-- Tabela Disciplina
CREATE TABLE Disciplina (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    matriz_curricular INT,
    departamento INT,
    professor_coordenador INT,
    inicio DATE,
    FOREIGN KEY (matriz_curricular) REFERENCES Matriz_Curricular(id),
    FOREIGN KEY (departamento) REFERENCES Departamento(codigo),
    FOREIGN KEY (professor_coordenador) REFERENCES Professor(id_professor)
);

-- Tabela Curso
CREATE TABLE Curso (
    codigo SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    matriz_curricular INT,
    FOREIGN KEY (matriz_curricular) REFERENCES Matriz_Curricular(id)
);

-- Tabela Aluno
CREATE TABLE Aluno (
    matricula SERIAL PRIMARY KEY,
    nome_completo VARCHAR(255) NOT NULL,
    nascimento DATE,
    email VARCHAR(255),
    curso INT,
    FOREIGN KEY (curso) REFERENCES Curso(codigo)
);

-- Tabela TCC
CREATE TABLE TCC (
    codigo SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    matricula_aluno INT,
    professor_orientador INT,
    FOREIGN KEY (matricula_aluno) REFERENCES Aluno(matricula),
    FOREIGN KEY (professor_orientador) REFERENCES Professor(id_professor)
);

-- Tabela Nota
CREATE TABLE Nota (
    matricula INT,
    disciplina INT,
    nota_final FLOAT,
    PRIMARY KEY (matricula, disciplina),
    FOREIGN KEY (matricula) REFERENCES Aluno(matricula),
    FOREIGN KEY (disciplina) REFERENCES Disciplina(codigo)
);

-- Tabela Historico_Escolar
CREATE TABLE Historico_Escolar (
    aluno INT,
    curso INT,
    PRIMARY KEY (aluno, curso),
    FOREIGN KEY (aluno) REFERENCES Aluno(matricula),
    FOREIGN KEY (curso) REFERENCES Curso(codigo)
);