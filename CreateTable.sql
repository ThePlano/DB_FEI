-- Criação das sequências
CREATE SEQUENCE departamento_codigo_seq START 1;
CREATE SEQUENCE professor_id_professor_seq START 1;
CREATE SEQUENCE matriz_curricular_id_seq START 1;
CREATE SEQUENCE disciplina_codigo_seq START 1;
CREATE SEQUENCE curso_codigo_seq START 1;
CREATE SEQUENCE aluno_matricula_seq START 1;
CREATE SEQUENCE tcc_codigo_seq START 1;
CREATE SEQUENCE nota_notaid_seq START 1;
CREATE SEQUENCE historico_escolar_historicid_seq START 1;

-- Tabela Departamento
CREATE TABLE Departamento (
    codigo INT PRIMARY KEY DEFAULT nextval('departamento_codigo_seq'),
    nome VARCHAR(255) NOT NULL
);

-- Tabela Professor
CREATE TABLE Professor (
    id_professor INT PRIMARY KEY DEFAULT nextval('professor_id_professor_seq'),
    nome_completo VARCHAR(255) NOT NULL,
    departamento INT,
    inicio_contratacao DATE,
    fim_contratacao DATE,
    chefe BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (departamento) REFERENCES Departamento(codigo)
);

-- Tabela Matriz_Curricular
CREATE TABLE Matriz_Curricular (
    id INT PRIMARY KEY DEFAULT nextval('matriz_curricular_id_seq'),
    periodo INT
);

-- Tabela Disciplina
CREATE TABLE Disciplina (
    codigo INT PRIMARY KEY DEFAULT nextval('disciplina_codigo_seq'),
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
    codigo INT PRIMARY KEY DEFAULT nextval('curso_codigo_seq'),
    nome VARCHAR(255) NOT NULL,
    matriz_curricular INT,
    FOREIGN KEY (matriz_curricular) REFERENCES Matriz_Curricular(id)
);

-- Tabela Aluno
CREATE TABLE Aluno (
    matricula INT PRIMARY KEY DEFAULT nextval('aluno_matricula_seq'),
    nome_completo VARCHAR(255) NOT NULL,
    nascimento DATE,
    email VARCHAR(255),
    curso INT,
    FOREIGN KEY (curso) REFERENCES Curso(codigo)
);

-- Tabela TCC
CREATE TABLE TCC (
    codigo INT PRIMARY KEY DEFAULT nextval('tcc_codigo_seq'),
    titulo VARCHAR(255) NOT NULL,
    matricula_aluno INT,
    professor_orientador INT,
    FOREIGN KEY (matricula_aluno) REFERENCES Aluno(matricula),
    FOREIGN KEY (professor_orientador) REFERENCES Professor(id_professor)
);

-- Tabela Nota
CREATE TABLE Nota (
    NotaID INT PRIMARY KEY DEFAULT nextval('nota_notaid_seq'),
    matricula INT,
    disciplina INT,
    nota_final FLOAT,
    FOREIGN KEY (matricula) REFERENCES Aluno(matricula),
    FOREIGN KEY (disciplina) REFERENCES Disciplina(codigo)
);

-- Tabela Historico_Escolar
CREATE TABLE Historico_Escolar (
    historicID INT PRIMARY KEY DEFAULT nextval('historico_escolar_historicid_seq'),
    aluno INT,
    curso INT,
    NotaID INT UNIQUE,
    FOREIGN KEY (aluno) REFERENCES Aluno(matricula),
    FOREIGN KEY (curso) REFERENCES Curso(codigo),
    CONSTRAINT fk_nota
    FOREIGN KEY (NotaID) REFERENCES Nota (NotaID)
);
