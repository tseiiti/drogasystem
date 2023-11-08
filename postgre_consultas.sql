-- Active: 1698355710028@@127.0.0.1@5432@DrogaSystem@public



--Total de venda por medicamento de genérico do mês 8 
--Pode ser alterado o mês e o tipo de medicamento
SELECT 'Medicamento : '||med.nome|| 'vendeu um total de R$'||SUM(v.total) 
    FROM venda v 
    JOIN itens_venda iv 
        ON (v.id = iv.venda_id)
    JOIN medicamento med
        ON (iv.medicamento_id = med.id)
    WHERE extract(MONTH FROM v.time_stamp) = 9
        AND med.tipo = 'Genérico'
        GROUP BY med.nome ;
-- Adicionar o percentual do medicamento no total de vendas
SELECT med.nome AS "Medicamento", SUM(v.total) AS "Total de vendas", SUM(iv.desconto) AS "Total de descontos", SUM(iv.quantidade) AS "Unidade Vendidas",
        ROUND(SUM(v.total)/SUM(iv.quantidade),2) AS "Preço médio", ROUND(SUM(iv.desconto)/SUM(iv.quantidade),2) AS "Desconto médio", ROUND(SUM(iv.desconto)/ SUM(v.total) *100, 2) AS "% desconto"
    FROM venda v 
    JOIN itens_venda iv 
        ON (v.id = iv.venda_id)
    JOIN medicamento med
        ON (iv.medicamento_id = med.id)
    WHERE extract(MONTH FROM v.time_stamp) = 9
        AND med.tipo = 'Genérico'
        GROUP BY med.nome ;

-- Adicionar no Python em uma fun, add mês, quant de clientes
-- Clientes assíduos
SELECT p.nome AS "Cliente", SUM(v.total) AS "Total de vendas", round(SUM(v.total)/COUNT(v.total), 2) AS "Ticket médio", 
        COUNT(v.total) AS "Frequência", ROUND((CURRENT_DATE - c.data_nasc)/365.15,0) AS "Idade"
    FROM venda v 
    JOIN itens_venda iv 
        ON (v.id = iv.venda_id)
    JOIN medicamento med
        ON (iv.medicamento_id = med.id)
    JOIN pessoa p
        ON (v.cliente_id = p.id)
    JOIN cliente c
        ON (c.id = p.id)
    WHERE extract(MONTH FROM v.time_stamp) = 9
        GROUP BY p.nome, c.data_nasc
        ORDER BY SUM(v.total) DESC
        LIMIT 10;

-- Venda por faixa etária idade
SELECT SUM(v.total) AS "Total de vendas", round(SUM(v.total)/COUNT(v.total), 2) AS "Ticket médio", 
        COUNT(v.total) AS "Quantidade de vendas"
    FROM venda v 
    JOIN itens_venda iv 
        ON (v.id = iv.venda_id)
    JOIN medicamento med
        ON (iv.medicamento_id = med.id)
    JOIN pessoa p
        ON (v.cliente_id = p.id)
    JOIN cliente c
        ON (c.id = p.id)
    WHERE extract(MONTH FROM v.time_stamp) = 9 
        AND 
            ROUND((CURRENT_DATE- data_nasc)/365.15, 0) >10 AND ROUND((CURRENT_DATE- data_nasc)/365.15, 0) <200 
        ORDER BY SUM(v.total) ;





-- Venda por localidade

SELECT SUM(v.total) AS "Total de vendas", p.bairro AS "Bairro dos clientes"
    FROM venda v 
    JOIN itens_venda iv 
        ON (v.id = iv.venda_id)
    JOIN medicamento med
        ON (iv.medicamento_id = med.id)
    JOIN pessoa p
        ON (v.cliente_id = p.id)
    JOIN cliente c
        ON (c.id = p.id)
    WHERE extract(MONTH FROM v.time_stamp) = 9
        GROUP BY p.bairro
        ORDER BY SUM(v.total) DESC
        LIMIT 10;

--- Model
SELECT SUM(v.total) AS "Total de vendas", p.nome AS "Cliente"
    FROM venda v 
    JOIN itens_venda iv 
        ON (v.id = iv.venda_id)
    JOIN medicamento med
        ON (iv.medicamento_id = med.id)
    JOIN pessoa p
        ON (v.cliente_id = p.id)
    JOIN cliente c
        ON (c.id = p.id)
    WHERE extract(MONTH FROM v.time_stamp) = 9
        GROUP BY p.nome
        ORDER BY SUM(v.total) DESC
        LIMIT 10;

