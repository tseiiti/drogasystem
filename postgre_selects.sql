-- Active: 1692452936450@@127.0.0.1@5432@drogasystem@public

select * from laboratorio;
select * from medicamento;
select * from estoque;
select * from estoque_total;
select * from pessoa;
select * from cliente;
select * from profissional;
select * from venda;
select * from itens_venda;

select * from pessoa inner join cliente on cliente.id = pessoa.id;
select * from pessoa inner join profissional on profissional.id = pessoa.id;