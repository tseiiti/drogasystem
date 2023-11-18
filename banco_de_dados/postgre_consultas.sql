

--Total de venda por medicamento genérico do mês 9
SELECT med.nome AS "Medicamento", SUM(iv.total) AS "Total de vendas", SUM(iv.quantidade) AS "Unidades Vendidas",
        ROUND(SUM(iv.total)/SUM(iv.quantidade),2) AS "Preço médio", ROUND(SUM(iv.desconto)/SUM(iv.quantidade),2) AS "Desconto médio", 
        SUM(iv.desconto) AS "Total de descontos", ROUND(SUM(iv.desconto)/ SUM(iv.total) * 100, 2) AS "% desconto"
    FROM venda v 
    JOIN itens_venda iv 
        ON (v.id = iv.venda_id)
    JOIN medicamento med
        ON (iv.medicamento_id = med.id)
    WHERE EXTRACT(MONTH FROM v.time_stamp) = 9 AND EXTRACT(YEAR FROM v.time_stamp) = 2023
        AND med.tipo = 'Genérico'
        GROUP BY med.nome
        ORDER BY med.nome ;


-- Clientes assíduos baseado na frequência média do mês
SELECT p.nome AS "Cliente", SUM(v.total) AS "Total de vendas", round(SUM(v.total)/COUNT(v.total), 2) AS "Ticket médio", 
        COUNT(v.id) AS "Frequência", FLOOR((CURRENT_DATE - c.data_nasc)/365.25) AS "Idade", p.telefone AS "Telefone", p.logradouro||', '||p.numero AS "Endereço"
    FROM venda v 
    JOIN pessoa p
        ON (v.cliente_id = p.id)
    JOIN cliente c
        ON (c.id = p.id)
    WHERE extract(MONTH FROM v.time_stamp) = 9 AND EXTRACT(YEAR FROM v.time_stamp) = 2023
    GROUP BY p.nome, c.data_nasc, p.logradouro, p.telefone, p.numero
    HAVING COUNT(v.id) > (SELECT  CEIL(CAST(COUNT(v.id) AS NUMERIC)/ CAST(COUNT(DISTINCT p.nome) AS NUMERIC)) AS "Frequência média"
                            FROM venda v 
                            JOIN pessoa p
                                ON (v.cliente_id = p.id)
                            JOIN cliente c
                                ON (c.id = p.id)
                            WHERE p.nome IS NOT NULL 
                                AND extract(MONTH FROM v.time_stamp) = 9 AND EXTRACT(YEAR FROM v.time_stamp) = 2023)
    ORDER BY COUNT(v.id) DESC, "Idade" ASC;


-- Histórico de compra dos Clientes assíduos baseado na frequência média do mês
SELECT p.nome "cliente", m.nome "medicamento", COUNT(iv.id)
    FROM venda v
    JOIN itens_venda iv ON (iv.venda_id = v.id)
    JOIN medicamento m ON (m.id = iv.medicamento_id)
    JOIN cliente c ON (c.id = v.cliente_id)
    JOIN pessoa p ON (p.id = c.id)
    WHERE v.cliente_id IN (
        SELECT c.id
            FROM venda v 
            JOIN cliente c
                ON (v.cliente_id = c.id)
            WHERE extract(MONTH FROM v.time_stamp) = 9 AND EXTRACT(YEAR FROM v.time_stamp) = 2023
            GROUP BY c.id
            HAVING COUNT(v.id) > (SELECT  CEIL(CAST(COUNT(v.id) AS NUMERIC)/ CAST(COUNT(DISTINCT c.id) AS NUMERIC)) AS "Frequência média"
                            FROM venda v 
                            JOIN cliente c
                                ON (v.cliente_id = c.id)
                            WHERE  extract(MONTH FROM v.time_stamp) = 9 AND EXTRACT(YEAR FROM v.time_stamp) = 2023)
                            )
    AND extract(MONTH FROM v.time_stamp) = 9 AND EXTRACT(YEAR FROM v.time_stamp) = 2023
    GROUP BY p.nome, m.nome;

with cli as ( -- quantidade de venda por cliente no mês/ano
    select c.id, extract(year from v.time_stamp) ano, extract(month from v.time_stamp) mes, count(v.id) qtd
    from venda v 
    join cliente c on c.id = v.cliente_id
    group by c.id, ano, mes
), med as ( -- média de venda por cliente por mês
    select ano, mes, ceil(avg(qtd)) avg_qtd from cli
    group by ano, mes
), ass as ( -- quantidade de venda por cliente no mês/ano somente assíduos
    select cli.* from cli
    join med on med.ano = cli.ano and med.mes = cli.mes
    where cli.qtd > med.avg_qtd
)
select p.nome "cliente", m.nome "medicamento", count(iv.id)
    from venda v
    join itens_venda iv on iv.venda_id = v.id
    join medicamento m on m.id = iv.medicamento_id
    join cliente c on c.id = v.cliente_id
    join pessoa p on p.id = c.id
    join ass a on a.id = c.id
        and a.ano = extract(year from v.time_stamp)
        and a.mes = extract(month from v.time_stamp)
    where a.ano = 2023
    and a.mes = 9
    group by p.nome, m.nome
    order by 1, 2
;


-- Venda por faixa etária idade por mês
SELECT SUM(v.total) AS "Total de vendas", round(SUM(v.total)/COUNT(v.total), 2) AS "Ticket médio", 
        COUNT(v.total) AS "Quantidade de vendas", 
        CASE WHEN ROUND((CURRENT_DATE- c.data_nasc)/365.25, 0) >=18 AND ROUND((CURRENT_DATE- c.data_nasc)/365.25, 0) <30 THEN '18-29'
             WHEN ROUND((CURRENT_DATE- c.data_nasc)/365.25, 0) >=30 AND ROUND((CURRENT_DATE- c.data_nasc)/365.25, 0) <45 THEN '30-44'
             WHEN ROUND((CURRENT_DATE- c.data_nasc)/365.25, 0) >=45 AND ROUND((CURRENT_DATE- c.data_nasc)/365.25, 0) <60 THEN '45-59'
             WHEN ROUND((CURRENT_DATE- c.data_nasc)/365.25, 0) >=60 AND ROUND((CURRENT_DATE- c.data_nasc)/365.25, 0) <200 THEN '60+'
        END AS "Faixa etária"
    FROM venda v 
    JOIN pessoa p
        ON v.cliente_id = p.id 
    JOIN cliente c
        ON (c.id = p.id)
    WHERE extract(MONTH FROM v.time_stamp) = 9 AND EXTRACT(YEAR FROM v.time_stamp) = 2023
    GROUP BY ROUND((CURRENT_DATE- c.data_nasc)/365.25, 0) >=18 AND ROUND((CURRENT_DATE- c.data_nasc)/365.25, 0) <30,
            ROUND((CURRENT_DATE- c.data_nasc)/365.25, 0) >=30 AND ROUND((CURRENT_DATE- c.data_nasc)/365.25, 0) <45,
            ROUND((CURRENT_DATE- c.data_nasc)/365.25, 0) >=45 AND ROUND((CURRENT_DATE- c.data_nasc)/365.25, 0) <60,
            ROUND((CURRENT_DATE- c.data_nasc)/365.25, 0) >=60 AND ROUND((CURRENT_DATE- c.data_nasc)/365.25, 0) <200;


-- Medicamentos mais vendidos por faixa etária escolhida no mês escolhido
SELECT med.nome AS "Medicamento", COUNT(med.nome) AS "Qtd vendida"
    FROM venda v 
    JOIN itens_venda iv 
        ON (v.id = iv.venda_id)
    JOIN medicamento med
        ON (iv.medicamento_id = med.id)
    JOIN pessoa p
        ON (v.cliente_id = p.id)
    JOIN cliente c
        ON (c.id = p.id)
    WHERE extract(MONTH FROM v.time_stamp) = 9 AND EXTRACT(YEAR FROM v.time_stamp) = 2023
        AND 
            ROUND((CURRENT_DATE- data_nasc)/365.25, 0) >=30 AND ROUND((CURRENT_DATE- data_nasc)/365.25, 0) <45 
    GROUP BY med.nome
    HAVING COUNT(med.nome) > (SELECT FLOOR(CAST(COUNT(iv.id) AS NUMERIC)/CAST(COUNT(DISTINCT med.nome) AS NUMERIC)) AS "Venda média de medicamento" 
                                FROM venda v 
                                JOIN itens_venda iv 
                                    ON (v.id = iv.venda_id)
                                JOIN medicamento med
                                    ON (iv.medicamento_id = med.id)
                                JOIN pessoa p
                                    ON (v.cliente_id = p.id)
                                JOIN cliente c
                                    ON (c.id = p.id)
                                WHERE EXTRACT(MONTH FROM v.time_stamp ) = 9 AND EXTRACT(YEAR FROM v.time_stamp) = 2023 AND
                                    ROUND((CURRENT_DATE- data_nasc)/365.25, 0) >30 AND ROUND((CURRENT_DATE- data_nasc)/365.25, 0) <60 )
    ORDER BY COUNT(med.nome);

-- Venda de medicamentos controlados por mês
SELECT med.id AS "Id", med.nome AS "Medicamento", med.controle AS "Tipo de controle", COUNT(iv.id) AS "Qtd vendida"
    FROM venda v 
    JOIN itens_venda iv 
        ON (v.id = iv.venda_id)
    JOIN medicamento med
        ON (iv.medicamento_id = med.id)
    WHERE extract(MONTH FROM v.time_stamp) = 9 AND EXTRACT(YEAR FROM v.time_stamp) = 2023
        AND med.controle <> 'Liberado'
        GROUP BY med.id, med.nome, med.controle
        ORDER BY med.controle ASC;


-- Medicamentos próximos do vencimento de acordo com um intervalo estabelecido (3 meses)
SELECT med.id AS "Id", med.nome AS "Medicamento", e.validade, quant_atual
    FROM estoque e
    JOIN medicamento med
        ON (e.medicamento_id = med.id)
    WHERE e.validade < CAST(CURRENT_DATE + INTERVAL '3' MONTH AS DATE)
    ORDER BY e.validade DESC;


-- Venda por localidade
SELECT SUM(v.total) AS "Total de vendas", p.bairro AS "Bairro dos clientes"
    FROM venda v 
    JOIN pessoa p
        ON (v.cliente_id = p.id)
    WHERE extract(MONTH FROM v.time_stamp) = 9 AND EXTRACT(YEAR FROM v.time_stamp) = 2023
        GROUP BY p.bairro
        ORDER BY SUM(v.total) DESC;


-- medicamentos com estoque baixo
select medicamento.nome, estoque_total.minimo, estoque_total.total restante
from estoque_total 
join medicamento on medicamento.id = estoque_total.medicamento_id
where estoque_total.total < estoque_total.minimo;


-- lucro por produto
select medicamento.id, medicamento.nome
  , round(sum(itens_venda.total - estoque.custo * itens_venda.quantidade), 2) lucro_total
  , round(min(itens_venda.total / itens_venda.quantidade - estoque.custo), 2) menor_lucro_unitario
  , round(max(itens_venda.total / itens_venda.quantidade - estoque.custo), 2) maior_lucro_unitario
  , sum(itens_venda.quantidade) quant_venda
  , estoque.custo
  , medicamento.preco
from medicamento
left join estoque on estoque.medicamento_id = medicamento.id
left join itens_venda on itens_venda.medicamento_id = medicamento.id
left join venda on venda.id = itens_venda.venda_id
where estoque.quant_venda > 0
and extract(MONTH FROM venda.time_stamp) = 9 AND EXTRACT(YEAR FROM venda.time_stamp) = 2023
group by medicamento.id, medicamento.nome, estoque.custo, medicamento.preco
order by 3 desc;


-- desconto por produto
select medicamento.id, medicamento.nome
  , sum(itens_venda.desconto) total_desconto
from medicamento
left join estoque on estoque.medicamento_id = medicamento.id
left join itens_venda on itens_venda.medicamento_id = medicamento.id
left join venda on venda.id = itens_venda.venda_id
where estoque.quant_venda > 0
and extract(MONTH FROM venda.time_stamp) = 9 AND EXTRACT(YEAR FROM venda.time_stamp) = 2023
group by medicamento.id, medicamento.nome, estoque.custo, medicamento.preco
order by 3 desc;


-- histórico de venda por produto
select v.time_stamp, m.nome, iv.quantidade, iv.total
from venda v, itens_venda iv, medicamento m
where v.id = iv.venda_id
and m.id = iv.medicamento_id
and v.time_stamp between '2023-09-01' and '2023-10-01';
