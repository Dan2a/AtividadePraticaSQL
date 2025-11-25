-- CRIAR BANCO
CREATE DATABASE db_escola;
USE db_escola;

-- CRIAR TABELA ESTUDANTES 
CREATE TABLE tb_estudantes(
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    idade INT NOT NULL,
    turma VARCHAR(20) NOT NULL,
    nota DECIMAL(3,1) NOT NULL,
    PRIMARY KEY(id)
);

-- CONSULTAR
SELECT * FROM tb_estudantes;
SELECT * FROM tb_estudantes WHERE nota > 7.0;
SELECT * FROM tb_estudantes WHERE nota < 7.0;

-- INSERIR DADOS
INSERT INTO tb_estudantes (nome, idade, turma, nota)
VALUES
("Daniel Andrade", 17, "3A", 8.5),
("Mariana Silva", 16, "2B", 6.8),
("Lucas Ferreira", 15, "1C", 7.2),
("Juliana Santos", 17, "3A", 9.1),
("Pedro Oliveira", 14, "1A", 5.9),
("Carla Menezes", 16, "2C", 7.8),
("Rafael Costa", 15, "1B", 4.5),
("Ana Beatriz", 17, "3B", 8.0);

-- ATUALIZAR DADOS
UPDATE tb_estudantes SET nota = 9.5 WHERE id = 3;