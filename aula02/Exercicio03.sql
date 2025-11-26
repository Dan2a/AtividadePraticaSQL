-- CRIAR BANCO
CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

-- CRIANDO TABELAS
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    fabricante VARCHAR(100) NOT NULL,
    estoque INT NOT NULL,
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- INSERIR DADOS
INSERT INTO tb_categorias (nome, descricao)
VALUES
('Medicamentos', 'Remédios em geral, com e sem prescrição'),
('Higiene', 'Itens de higiene pessoal'),
('Cosméticos', 'Produtos estéticos e de beleza'),
('Vitaminas', 'Suplementos e vitaminas'),
('Dermocosméticos', 'Tratamentos para pele e cuidados dermatológicos');

INSERT INTO tb_produtos (nome, preco, fabricante, estoque, categoria_id)
VALUES
('Dipirona 500mg', 8.50, 'Neo Química', 120, 1),
('Amoxicilina 500mg', 32.00, 'EMS', 80, 1),
('Shampoo Anticaspa', 27.90, 'Clear', 50, 2),
('Sabonete Líquido Neutro', 12.00, 'Granado', 100, 2),
('Creme Hidratante Corporal', 54.90, 'Nivea', 40, 3),
('Protetor Solar FPS 50', 72.00, 'La Roche-Posay', 30, 5),
('Vitamina C 500mg', 44.00, 'Sundown', 60, 4),
('Colágeno Hidrolisado', 85.00, 'Maxinutri', 25, 4);

-- CONSULTAS
SELECT * FROM tb_produtos;
SELECT * FROM tb_categorias;

-- PRODUTOS COM VALOR MAIOR QUE R$50
SELECT * FROM tb_produtos
WHERE preco > 50.00
ORDER BY preco ASC;

-- PRODUTOS COM VALOR ENTRE R$5 E R$60
SELECT * FROM tb_produtos
WHERE preco BETWEEN 5 AND 60
ORDER BY preco ASC;

-- PRODUTOS COM 'C' NO NOME
SELECT * FROM tb_produtos
WHERE nome LIKE '%c%'
ORDER BY nome ASC;

-- PRODUTOS COM CATEGORIAS
SELECT p.id, p.nome AS produto, p.preco, p.fabricante, p.estoque, 
	c.nome AS categoria, c.descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- PRODUTOS COM CATEGORIAS COM FILTRO
SELECT p.id, p.nome AS produto, p.preco, p.fabricante, p.estoque,
	c.nome AS categoria, c.descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome = "Cosméticos";