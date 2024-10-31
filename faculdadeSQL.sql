CREATE DATABASE Faculdade;
USE Faculdade;

CREATE TABLE Curso (
    ID_Curso INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Carga_Horaria INT NOT NULL,
    Periodo VARCHAR(50) NOT NULL
);

CREATE TABLE Aluno (
    ID_Aluno INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Matricula VARCHAR(20) UNIQUE NOT NULL,
    Data_Nascimento DATE NOT NULL,
    Endereco VARCHAR(200),
    ID_Curso INT,
    FOREIGN KEY (ID_Curso) REFERENCES Curso(ID_Curso)
);

CREATE TABLE Professor (
    ID_Professor INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Matricula VARCHAR(20) UNIQUE NOT NULL,
    Contato VARCHAR(50)
);

CREATE TABLE Disciplina (
    ID_Disciplina INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Carga_Horaria INT NOT NULL,
    ID_Curso INT,
    FOREIGN KEY (ID_Curso) REFERENCES Curso(ID_Curso)
);

CREATE TABLE Turma (
    ID_Turma INT AUTO_INCREMENT PRIMARY KEY,
    ID_Disciplina INT,
    ID_Professor INT,
    Semestre VARCHAR(20) NOT NULL,
    FOREIGN KEY (ID_Disciplina) REFERENCES Disciplina(ID_Disciplina),
    FOREIGN KEY (ID_Professor) REFERENCES Professor(ID_Professor)
);

CREATE TABLE Nota (
    ID_Nota INT AUTO_INCREMENT PRIMARY KEY,
    ID_Aluno INT,
    ID_Turma INT,
    Nota DECIMAL(5, 2) CHECK (Nota >= 0 AND Nota <= 10),
    FOREIGN KEY (ID_Aluno) REFERENCES Aluno(ID_Aluno),
    FOREIGN KEY (ID_Turma) REFERENCES Turma(ID_Turma)
);
