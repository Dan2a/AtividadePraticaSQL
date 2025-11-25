-- CRIAÇÃO DO BANCO
CREATE DATABASE db_rh;

USE db_rh;

-- CRIAÇÃO DA TABELA
CREATE TABLE tb_colaboradores(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    dataNascimento  DATE NOT NULL,
	cargo VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id)
);

-- CONSULTA
SELECT * FROM tb_colaboradores;
SELECT * FROM tb_colaboradores WHERE salario > 2000;
SELECT * FROM tb_colaboradores WHERE salario < 2000;

-- INSERÇÃO DE DADOS
INSERT INTO tb_colaboradores(nome, dataNascimento, cargo, salario)
VALUES("Daniel", "2000-03-13", "Desenvolvedor Full Stack", 5000),
("Mariana Silva", "1998-07-22", "Jovem Aprendiz", 1200),
("Carlos Henrique", "1995-11-10", "Desenvolvedor Backend", 6200),
("Juliana Rocha", "2001-02-05", "UX/UI Designer", 4500),
("Pedro Martins", "1999-09-18", "Estagiario", 1500);

-- ATUALIZAR DADOS DA TABELA
UPDATE tb_colaboradores SET cargo = "Analista de Sistemas", salario = 4800 WHERE Id = 2;



