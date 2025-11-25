-- CRIAR BANCO
CREATE DATABASE db_ecommerce;
USE db_ecommerce;

-- CRIAR TABELA
CREATE TABLE tb_produtos(
	id BIGINT AUTO_INCREMENT,
    nome VARCHAR(250) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    quantidade INT,
    categoria VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

-- CONSULTAR
SELECT * FROM tb_produtos;
SELECT * FROM tb_produtos WHERE preco > 500;
SELECT * FROM tb_produtos WHERE preco < 500;

-- INSERIR DADOS
INSERT INTO tb_produtos (nome, preco, quantidade, categoria)
VALUES
	("Mouse Gamer RGB", 129.90, 50, "Periféricos"),
	("Teclado Mecânico Redragon", 289.90, 35, "Periféricos"),
	("Monitor 27' 144Hz", 1599.00, 20, "Monitores"),
	("Cadeira Gamer XT Premium", 899.00, 12, "Móveis"),
	("Headset Bluetooth JBL", 349.99, 40, "Áudio"),
	("Notebook Dell i5 16GB", 3899.00, 10, "Informática"),
	("Smartphone Samsung A54", 1999.00, 25, "Smartphones"),
	("Webcam Full HD Logitech", 239.50, 18, "Periféricos");
    
-- ATUALIZAR DADOS
UPDATE tb_produtos SET quantidade = 50 WHERE id = 4;




