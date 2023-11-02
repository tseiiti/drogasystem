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

-- medicamentos com estoque baixo
select medicamento.nome, estoque_total.minimo, estoque_total.total restante
from estoque_total 
join medicamento on medicamento.id = estoque_total.medicamento_id
where estoque_total.total < estoque_total.minimo;

-- medicamentos mais vendidos
select * 
from itens_venda;

select estoque.id, estoque.medicamento_id, estoque.quant_atual, medicamento.preco, medicamento.controle, estoque.custo, estoque.data, estoque.validade, estoque_total.minimo 
from estoque 
inner join medicamento on medicamento.id = estoque.medicamento_id 
inner join estoque_total on estoque_total.medicamento_id = estoque.medicamento_id 
where quant_atual > 0 
and estoque.id in (
  select min(id) from estoque 
  where quant_atual > 0 
  group by medicamento_id
)
order by 1;


create TEMPORARY TABLE x (aaa char(10));

select * from x;
insert into x values ('teste');
insert into x values (null);
