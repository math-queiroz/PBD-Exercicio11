------- Definição das Tabelas -------
-- Criando a tabela: Aluno
CREATE TABLE tb_aluno (
    ra INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cd_curso INTEGER NOT NULL
);

-- Criando a tabela: Curso
CREATE TABLE tb_curso (
    cd_curso INTEGER PRIMARY KEY,
    nome VARCHAR(200) NOT NULL
);

-- Criando a tabela: Disciplina
CREATE TABLE tb_disciplina (
    cd_disciplina INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(250) NOT NULL,
    cd_departamento INTEGER NOT NULL
);

-- Criando a tabela: Associativa de Curso-Disciplina
CREATE TABLE tb_curso_disciplina (
    cd_curso INTEGER NOT NULL,
    cd_disciplina INTEGER NOT NULL,
    CONSTRAINT pk_curso_disciplina PRIMARY KEY (cd_curso, cd_disciplina),
    CONSTRAINT fk_curso_assoc FOREIGN KEY (cd_curso) REFERENCES tb_curso(cd_curso),
    CONSTRAINT fk_disciplina_assoc FOREIGN KEY (cd_disciplina) REFERENCES tb_disciplina(cd_disciplina)
);

-- Criando a tabela: Associativa de Pré-Requisitos
CREATE TABLE tb_pre_requisitos (
    cd_disc_1 INTEGER NOT NULL,
    cd_disc_2 INTEGER NOT NULL,
    CONSTRAINT pk_pre_requisitos PRIMARY KEY (cd_disc_1, cd_disc_2),
    CONSTRAINT pk_disc_1 FOREIGN KEY (cd_disc_1) REFERENCES tb_disciplina(cd_disciplina),
    CONSTRAINT pk_disc_2 FOREIGN KEY (cd_disc_2) REFERENCES tb_disciplina(cd_disciplina)
);

-- Criando a tabela: Departamento
CREATE TABLE tb_departamento (
    cd_departamento INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

------- Chaves Estrangeiras -------
-- Chave estrangeira: Curso em Aluno
ALTER TABLE tb_aluno ADD CONSTRAINT fk_curso_aluno FOREIGN KEY (cd_curso) REFERENCES tb_curso(cd_curso);

-- Chave estrangeira: Departamento em Disciplina
ALTER TABLE tb_disciplina ADD CONSTRAINT fk_departamento_disciplina FOREIGN KEY (cd_departamento) REFERENCES tb_departamento(cd_departamento);