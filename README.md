Projeto de Teste de Banco de Dados
Este projeto tem como objetivo criar e manipular um banco de dados utilizando tabelas para armazenar informações sobre operadoras de planos de saúde e seus demonstrativos contábeis. O foco principal é a análise de despesas dessas operadoras em períodos específicos.

Tabelas
operadoras: Armazena informações sobre as operadoras de planos de saúde.

id_operadora: Identificador único da operadora (chave primária).

nome_operadora: Nome da operadora.

cnpj: CNPJ da operadora.

tipo_plano: Tipo de plano oferecido pela operadora.

situacao: Situação da operadora (ativa, inativa, etc.).

cidade: Cidade onde a operadora está localizada.

estado: Estado onde a operadora está localizada.

data_entrada: Data de entrada da operadora no mercado.

endereco: Endereço completo da operadora.

telefone: Número de telefone da operadora.

email: E-mail de contato da operadora.

demonstrativos_contabeis: Armazena os dados financeiros das operadoras.

id_demonstração: Identificador único da demonstração contábil (chave primária).

id_operadora: Relacionamento com a tabela operadoras.

data_periodo_inicio: Data de início do período de análise.

data_periodo_fim: Data de término do período de análise.

categoria: Categoria da despesa.

despesas: Valor total das despesas na categoria informada.

Carregamento de Dados
Os dados das tabelas são carregados a partir de arquivos CSV:

operadoras: Dados sobre as operadoras são carregados de um arquivo CSV, localizado em C:/Users/osmil/OneDrive/Desktop/Relatorio_cadop.csv.

demonstrativos_contabeis: Dados financeiros das operadoras são carregados de outro arquivo CSV, localizado em C:/Users/osmil/OneDrive/Desktop/2anos3.1.
