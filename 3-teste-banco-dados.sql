-- Criação das tabelas
CREATE TABLE operadoras(
    id_operadora SERIAL PRIMARY KEY,
    nome_operadora VARCHAR(255),
    cnpj VARCHAR(18) UNIQUE,
    tipo_plano VARCHAR(50),
    situacao VARCHAR(50),
    cidade VARCHAR(100),
    estado VARCHAR(2),
    data_entrada DATE,
    endereco VARCHAR(255),
    telefone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE demonstrativos_contabeis(
    id_demonstração SERIAL PRIMARY KEY,
    id_operadora INT,
    data_periodo_inicio DATE,
    data_periodo_fim DATE,
    categoria VARCHAR(255),
    despesas DECIMAL(15,2),
    CONSTRAINT fk_operadora FOREIGN KEY(id_operadora) REFERENCES operadoras(id_operadora)
);

-- Carregar dados para a tabela 'operadoras'
COPY operadoras(nome_operadora, cnpj, tipo_plano, situacao, cidade, estado, data_entrada, endereco, telefone, email)
FROM 'C:/Users/osmil/OneDrive/Desktop/Relatorio_cadop.csv'
DELIMITER ';'
CSV HEADER;

-- Carregar dados para a tabela 'demonstrativos_contabeis'
COPY demonstrativos_contabeis(id_operadora, data_periodo_inicio, data_periodo_fim, categoria, despesas)
FROM 'C:/Users/osmil/OneDrive/Desktop/2anos3.1'
DELIMITER ';'
CSV HEADER;

-- Consultar as 10 operadoras com maiores despesas nos últimos 3 meses
SELECT o.nome_operadora, SUM(d.despesas) AS total_despesas
FROM demonstrativos_contabeis d
JOIN operadoras o ON d.id_operadora = o.id_operadora
WHERE d.categoria = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
AND d.data_periodo_fim >= CURRENT_DATE - INTERVAL '3 months'
GROUP BY o.id_operadora
ORDER BY total_despesas DESC
LIMIT 10;

-- Consultar as 10 operadoras com maiores despesas no último ano
SELECT o.nome_operadora, SUM(d.despesas) AS total_despesas
FROM demonstrativos_contabeis d
JOIN operadoras o ON d.id_operadora = o.id_operadora
WHERE d.categoria = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
AND d.data_periodo_fim >= CURRENT_DATE - INTERVAL '1 year'
GROUP BY o.id_operadora
ORDER BY total_despesas DESC
LIMIT 10;
