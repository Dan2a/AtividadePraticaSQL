-- CRIAR BANCO
CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

-- CRIANDO TABELAS
CREATE TABLE tb_classes(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo_ataque VARCHAR(100) NOT NULL
);

CREATE TABLE tb_personagens(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    nivel INT NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    classe_id BIGINT,
	FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

-- INSERIR DADOS
INSERT INTO tb_classes (nome, tipo_ataque)
VALUES
('Guerreiro', 'Físico'),
('Mago', 'Mágico'),
('Arqueiro', 'À distância'),
('Assassino', 'Crítico'),
('Paladino', 'Físico/Mágico');

INSERT INTO tb_personagens (nome, nivel, poder_ataque, poder_defesa, classe_id)
VALUES
('Thorgar', 12, 500, 1100, 1),
('Elandra', 15, 4500, 1500, 2),
('Falken', 10, 2900, 1700, 3),
('Shadow', 18, 975, 1300, 4),
('Lumciel', 20, 1100, 3900, 5),
('Ragnar', 8, 3100, 2600, 1),
('Sylphira', 14, 3400, 1900, 3),
('Creytus', 22, 5000, 2100, 4);

-- CONSULTAS
SELECT * FROM tb_personagens;

-- PERSONAGENS COM PODER MAIOR DE 2000
SELECT * FROM tb_personagens 
WHERE poder_ataque > 2000;

-- PERSONAGEM COM DEFESA ENTRE 1000 E 2000
SELECT * FROM tb_personagens 
WHERE poder_defesa 
BETWEEN 1000 AND 2000;

-- PERSONAGEM COM 'C' NO NOME
SELECT * FROM tb_personagens
WHERE nome LIKE '%c%';

-- INNER JOIN(Consulta junto os dados do personagem com a classe e ataque)
SELECT p.id, p.nome, p.nivel, p.poder_ataque, p.poder_defesa, 
	c.nome AS classe, c.tipo_ataque
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id;


-- INNER JOIN(Consulta todo os dados junto mas filtrando apenas "Arqueiro")
SELECT p.id, p.nome, p.nivel, p.poder_ataque, p.poder_defesa, 
	c.nome AS classe, c.tipo_ataque
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id
WHERE c.nome = "Arqueiro";


