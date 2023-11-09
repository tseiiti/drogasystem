-- Active: 1698656816356@@127.0.0.1@5432@drogasystem@public

select * from laboratorio order by 1;
select * from medicamento order by 1;
select * from estoque order by 1;
select * from estoque_total order by 1;
select * from pessoa order by 1;
select * from cliente order by 1;
select * from profissional order by 1;
select * from venda order by 1;
select * from itens_venda order by 1;

select * from pessoa inner join cliente on cliente.id = pessoa.id;
select * from pessoa inner join profissional on profissional.id = pessoa.id;

select * from venda order by 2 desc limit 10;
select * from medicamento where nome ilike '%DICLOFENACO POT%';

select * 
from venda v
join itens_venda iv on iv.venda_id = v.id
where cliente_id = 10
and extract(year from v.time_stamp) = 2023
and extract(month from v.time_stamp) = 9
and iv.medicamento_id = 484

and v.time_stamp BETWEEN '20230901' and '20230930 235959'
;

select * from venda
where time_stamp BETWEEN '20221201' and '20230102'
;


select * from venda
where time_stamp BETWEEN '20221201' and '20221231'
;

-- -- estoque baixo
-- select medicamento.id, medicamento.nome, medicamento.preco, estoque_total.minimo, estoque_total.total, estoque.quant_inicial, estoque.quant_atual
-- from estoque_total 
-- join medicamento on medicamento.id = estoque_total.medicamento_id
-- join estoque on estoque.medicamento_id = estoque_total.medicamento_id
-- where estoque_total.total <= estoque_total.minimo
-- order by estoque_total.total - estoque_total.minimo;

-- -- lucro por produto
-- select medicamento.id, medicamento.nome
--   , to_char(sum(itens_venda.total - estoque.custo * itens_venda.quantidade), '999990.00') lucro_total
--   , to_char(min(itens_venda.total / itens_venda.quantidade - estoque.custo), '999990.00') menor_lucro_unitario
--   , to_char(max(itens_venda.total / itens_venda.quantidade - estoque.custo), '999990.00') maior_lucro_unitario
--   , sum(itens_venda.quantidade) quant_venda
--   , sum(itens_venda.desconto) total_desconto
--   , min(estoque.custo) custo
--   , min(medicamento.preco) preco
--   , to_char(min(itens_venda.total / itens_venda.quantidade), '999990.00') preco_venda
-- from medicamento
-- left join estoque on estoque.medicamento_id = medicamento.id
-- left join itens_venda on itens_venda.medicamento_id = medicamento.id
-- where estoque.quant_venda > 0
-- group by medicamento.id, medicamento.nome
-- order by 3 desc;

-- -- medicamentos mais vendidos
-- select medicamento.id, medicamento.nome, sum(quant_venda) quant_venda
-- from estoque 
-- join medicamento on medicamento.id = estoque.medicamento_id
-- group by medicamento.id, medicamento.nome 
-- order by 3 desc;

-- -- horário das vendas
-- select to_char(time_stamp, 'YYYYMMDD') d
--   , min(to_char(time_stamp, 'HH24:MI:SS'))
--   , max(to_char(time_stamp, 'HH24:MI:SS'))
--   , count(*)
-- from venda
-- group by to_char(time_stamp, 'YYYYMMDD')
-- order by 3 desc;

-- -- medicamentos com estoque baixo
-- select medicamento.nome, estoque_total.minimo, estoque_total.total restante
-- from estoque_total 
-- join medicamento on medicamento.id = estoque_total.medicamento_id
-- where estoque_total.total < estoque_total.minimo;

-- select * from venda where id = 2;
-- select * from itens_venda where venda_id = 2;
-- select * from venda 
-- join itens_venda on itens_venda.venda_id = venda.id;

-- select to_char(time_stamp, 'Month'), to_char(time_stamp, 'dd/mm/yyyy'), to_char(time_stamp, 'hh24:mi:ss'), * from venda;

-- -- vendas por sexo do cliente
-- select sexo, sum(total)
-- from venda 
-- join cliente on cliente.id = venda.cliente_id
-- group by sexo;

-- -- total de vendas por mês
-- select to_char(time_stamp, 'yyyymm'), sum(total) 
-- from venda
-- group by to_char(time_stamp, 'yyyymm')
-- order by 1;

-- -- verifica totais
-- select venda.id, venda.total, sum(itens_venda.quantidade), sum(itens_venda.desconto), sum(itens_venda.total) 
-- from venda 
-- join itens_venda on itens_venda.venda_id = venda.id
-- group by venda.id, venda.total
-- -- having venda.total != sum(itens_venda.total)
-- order by 1;

-- create TEMPORARY TABLE x (aaa char(10));
-- select * from x;
-- insert into x values ('teste');
-- insert into x values (null);
