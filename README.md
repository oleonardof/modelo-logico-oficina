# Oficina Mecânica - Projeto de Banco de Dados

## Descrição do Projeto
Este projeto tem como objetivo modelar e implementar um banco de dados para o cenário de uma oficina mecânica. Ele permite o gerenciamento de clientes, veículos, mecânicos, especialidades, equipes, ordens de serviço, serviços prestados e peças utilizadas.  

O banco de dados segue o modelo relacional e contempla relações 1:N e N:N para representar adequadamente o domínio do problema.  

O projeto inclui:  

- Criação das tabelas com chaves primárias e estrangeiras (arquivo `schema.sql`);
- Inserção de dados de exemplo para testes (arquivo `seed.sql`);
- Consultas SQL complexas com `SELECT`, `WHERE`, `JOIN`, `GROUP BY`, `HAVING`, `ORDER BY` e atributos derivados (arquivo `queries.sql`).

---

## Modelo Lógico

### Tabelas principais

- **Cliente**: Armazena informações de clientes Pessoa Física (F) ou Jurídica (J).  
- **Veiculo**: Cada veículo pertence a um cliente.  
- **Mecanico**: Armazena dados de mecânicos.  
- **Especialidade**: Lista de especialidades técnicas.  
- **Mecanico_Especialidade**: Relacionamento N:N entre mecânicos e especialidades.  
- **Equipe**: Agrupamento de mecânicos.  
- **Equipe_Mecanico**: Relacionamento N:N entre equipes e mecânicos.  
- **Ordem_Servico**: Registra cada ordem de serviço com veículo, equipe e status.  
- **Servico**: Serviços disponíveis na oficina.  
- **OS_Servico**: Relacionamento N:N entre ordens de serviço e serviços, com quantidade e valor.  
- **Peca**: Peças disponíveis em estoque.  
- **OS_Peca**: Relacionamento N:N entre ordens de serviço e peças, com quantidade e valor.

---

## Consultas de Exemplo

- **Recuperações simples com SELECT Statement**  
- **Filtros com WHERE Statement**  
- **Atributos derivados com SUM/COALESCE**  
- **Ordenação com ORDER BY**  
- **Condições sobre grupos com HAVING**  
- **Junções entre tabelas para análises complexas**

Todos os exemplos estão no arquivo `queries.sql` e incluem:  

1. Listar clientes com veículos;  
2. Listar mecânicos e suas especialidades;  
3. Veículos de um cliente específico;  
4. Ordens de serviço abertas;  
5. Calcular valor total de cada ordem de serviço;  
6. Quantidade de ordens de serviço por equipe;  
7. Detalhar peças utilizadas por OS;  
8. Serviços executados com cliente e veículo;  
9. Valor total gasto por cliente;  
10. Quantas especialidades cada mecânico possui.

---

## Como Executar

1. Criar o banco de dados no PostgreSQL;  
2. Executar `schema.sql` para criar as tabelas;  
3. Executar `seed.sql` para popular dados de exemplo;  
4. Executar `queries.sql` para testar as consultas e gerar relatórios.

---

