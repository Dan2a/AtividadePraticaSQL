-- CRIAR BANCO
CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

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
    marca VARCHAR(100) NOT NULL,
    estoque INT NOT NULL,
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- INSERIR DADOS
INSERT INTO tb_categorias (nome, descricao)
VALUES
('Hidráulica', 'Canos, conexões e acessórios'),
('Elétrica', 'Fios, lâmpadas e componentes'),
('Acabamento', 'Revestimentos e pisos'),
('Ferramentas', 'Ferramentas manuais e elétricas'),
('Pintura', 'Tintas, pincéis e rolos');

INSERT INTO tb_produtos (nome, preco, marca, estoque, categoria_id)
VALUES
('Cano PVC 50mm', 39.90, 'Tigre', 200, 1),
('Joelho 90° 50mm', 9.50, 'Tigre', 150, 1),
('Fio 2,5mm', 129.00, 'Prysmian', 80, 2),
('Lâmpada LED 9W', 19.90, 'Philips', 300, 2),
('Piso Cerâmico 60x60', 75.00, 'Portobello', 50, 3),
('Furadeira Impacto', 199.00, 'Bosch', 20, 4),
('Martelo Unha', 45.00, 'Tramontina', 60, 4),
('Tinta Acrílica 18L', 169.00, 'Suvinil', 15, 5);

-- CONSULTAS
SELECT * FROM tb_produtos;
SELECT * FROM tb_categorias;

-- PRODUTOS COM VALOR MAIOR QUE R$100
SELECT * FROM tb_produtos
WHERE preco > 100
ORDER BY preco ASC;

-- PRODUTOS ENTRE R$70 E R$150
SELECT * FROM tb_produtos
WHERE preco BETWEEN 70 AND 150
ORDER BY preco ASC;

-- PRODUTOS COM 'C' NO NOME
SELECT * FROM tb_produtos
WHERE nome LIKE '%c%'
ORDER BY nome ASC;

-- INNER JOIN PARA VER CATEGORIAS
SELECT p.id, p.nome AS produto, p.preco, p.marca, p.estoque, 
	c.nome AS categoria, c.descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- PRODUTOS FILTRADOS POR CATEGORIA
SELECT p.id, p.nome AS produto, p.preco, p.marca, p.estoque, 
	c.nome AS categoria, c.descricao
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome = 'Hidráulica';
