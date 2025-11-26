-- CRIAR BANCO
CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

-- CRIANDO TABELAS
CREATE TABLE tb_categorias(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(100) NOT NULL
);

CREATE TABLE tb_pizzas(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    tamanho VARCHAR(50) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    ingredientes VARCHAR(255),
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- INSERIR DADOS
INSERT INTO tb_categorias (nome, descricao)
VALUES
('Tradicional', 'Sabores clássicos e salgados'),
('Especial', 'Sabores premium com ingredientes selecionados'),
('Doce', 'Pizzas doces e sobremesas'),
('Vegetariana', 'Sem carne, com vegetais e queijos'),
('Vegana', 'Ingredientes 100% de origem vegetal');

INSERT INTO tb_pizzas (nome, tamanho, preco, ingredientes, categoria_id)
VALUES
('Mussarela', 'Grande', 45.00, 'Queijo mussarela, molho de tomate', 1),
('Calabresa', 'Grande', 48.00, 'Calabresa, cebola, mussarela', 1),
('Portuguesa', 'Grande', 55.00, 'Presunto, ovos, cebola, azeitona', 2),
('Frango com Catupiry', 'Grande', 62.00, 'Frango, catupiry, milho', 2),
('Chocolate', 'Média', 50.00, 'Chocolate ao leite e granulado', 3),
('Romeu e Julieta', 'Média', 58.00, 'Goiabada e queijo', 3),
('Marguerita', 'Grande', 47.00, 'Mussarela, manjericão, tomate', 4),
('Veggie Mix', 'Grande', 60.00, 'Tomate, rúcula, milho, ervilha', 5);

-- CONSULTAS
SELECT * FROM tb_pizzas;
SELECT * FROM tb_categorias;

-- PIZZAS COM VALOR MAIOR DE R$45
SELECT * FROM tb_pizzas
WHERE preco > 45.00
ORDER BY preco ASC;

-- PIZZAS VALORES ENTRE R$50 E R$100
SELECT * FROM tb_pizzas
WHERE preco BETWEEN 50 AND 100
ORDER BY preco ASC;

-- PIZZAS COM 'M' NO NOME
SELECT * FROM tb_pizzas
WHERE nome LIKE '%m%';

-- PIZZAS COM CATEGORIAS
SELECT p. id, p.nome AS pizza, p.tamanho, p.preco, p.ingredientes, c.nome AS categoria, c.descricao
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id =  c.id;

-- PIZZAS COM CATEGORIAS COM FILTRO POR CLASSE
SELECT p. id, p.nome AS pizza, p.tamanho, p.preco, p.ingredientes, c.nome AS categoria, c.descricao
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.categoria_id =  c.id
WHERE c.nome = "Doce";