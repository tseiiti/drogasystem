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


-- update estoque_total set minimo = 5;

-- select estoque.quant_atual, estoque_total.minimo, medicamento.nome from estoque 
-- inner join estoque_total on estoque_total. medicamento_id = estoque.medicamento_id
-- inner join medicamento on medicamento.id = estoque.medicamento_id
-- where estoque.quant_atual <= estoque_total.minimo;

select estoque_total.total, estoque_total.minimo, medicamento.nome, estoque_total.medicamento_id
from estoque_total 
inner join medicamento on medicamento.id = estoque_total.medicamento_id
where estoque_total.total <= estoque_total.minimo;

select exists(select id from laboratorio where id = 9);
