-- CRIAR BANCO
CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

-- CRIANDO TABELAS
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

CREATE TABLE tb_cursos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    carga_horaria INT NOT NULL,
    instrutor VARCHAR(100) NOT NULL,
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- INSERIR DADOS
INSERT INTO tb_categorias (nome, descricao)
VALUES
('Programação', 'Cursos de desenvolvimento de software'),
('Design', 'Design gráfico e UX/UI'),
('Marketing', 'Estratégias de marketing digital'),
('Negócios', 'Empreendedorismo e gestão'),
('Infraestrutura', 'Redes, Linux e servidores');

INSERT INTO tb_cursos (nome, preco, carga_horaria, instrutor, categoria_id)
VALUES
('Java Completo', 799.90, 80, 'João Silva', 1),
('Python do Zero', 650.00, 60, 'Maria Santos', 1),
('UI/UX Design', 500.00, 50, 'Ana Torres', 2),
('Photoshop Avançado', 550.00, 40, 'Carlos Lima', 2),
('Marketing Digital', 720.00, 70, 'Rafael Melo', 3),
('Gestão Empresarial', 950.00, 90, 'Paula Reis', 4),
('Linux para Iniciantes', 480.00, 45, 'Bruno Costa', 5),
('Redes de Computadores', 820.00, 80, 'Amanda Rocha', 5);

-- CONSULTAS
SELECT * FROM tb_cursos;
SELECT * FROM tb_categorias;

-- CURSOS ACIMA DE R$500
SELECT * FROM tb_cursos
WHERE preco > 500
ORDER BY preco ASC;

-- CURSOS ENTRE 600 E 1000
SELECT * FROM tb_cursos
WHERE preco BETWEEN 600 AND 1000
ORDER BY preco ASC;

-- CURSOS COM 'J' NO NOME
SELECT * FROM tb_cursos
WHERE nome LIKE '%j%'
ORDER BY nome ASC;

-- INNER JOIN COMPLETO
SELECT c.id, c.nome AS curso, c.preco, c.carga_horaria, c.instrutor,
	cat.nome AS categoria, cat.descricao
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.categoria_id = cat.id;

-- FILTRAR POR CATEGORIA
SELECT c.id, c.nome AS curso, c.preco, c.carga_horaria, c.instrutor,
	cat.nome AS categoria, cat.descricao
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.categoria_id = cat.id
WHERE cat.nome = 'Programação';
