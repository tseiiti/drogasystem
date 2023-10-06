-- drop database if exists drogasystem;
-- create database drogasystem;

drop table if exists itens_venda;
drop table if exists venda;
drop table if exists profissional;
drop table if exists cliente;
drop table if exists estoque_total;
drop table if exists estoque;
drop table if exists medicamento;
drop table if exists laboratorio;

create table laboratorio (
  id              serial primary key, 
  nome            varchar(255) not null, 
  razao           varchar(255) not null, 
  cnpj            varchar(255) not null
);

create table medicamento (
  id              serial primary key, 
  laboratorio_id  int not null references laboratorio(id), 
  nome            varchar(255) not null, 
  dosagem         varchar(255) not null, 
  apresentacacao  varchar(255) not null check (apresentacacao in ('sólido', 'liquido', 'semissólido')), 
  tipo            varchar(255) not null check (tipo in ('genérico', 'similar', 'referência')), 
  controle        varchar(255) not null check (controle in ('não controlado', 'A2', 'A3', 'B1', 'B2', 'C1', 'C2', 'AM')), 
  quantidade      varchar(255) not null, 
  preco           numeric(10, 2) not null
);

create table estoque (
  id              serial primary key, 
  medicamento_id  int not null references medicamento(id), 
  quantidade      int not null, 
  lote            varchar(255) not null, 
  preco           numeric(10, 2) not null, 
  validade        date not null, 
  data            date not null default current_date
);

create table estoque_total (
  id              serial primary key, 
  medicamento_id  int not null unique references medicamento(id), 
  total           int not null, 
  minimo          int not null default 0, 
  maximo          int not null default 9999
);

create table cliente (
  id              serial primary key, 
  nome            varchar(255) not null, 
  cpf             varchar(255) not null, 
  endereco        varchar(255), 
  telefone        varchar(255), 
  data_nasc       date not null, 
  sexo            char(1) not null check (sexo in ('F', 'M'))
);

create table profissional (
  id              serial primary key, 
  registro        varchar(255) not null unique, 
  nome            varchar(255) not null, 
  endereco        varchar(255), 
  telefone        varchar(255), 
  tipo            varchar(255) not null check (tipo in ('médico', 'dentista', 'veterinário'))
);

create table venda (
  id              serial primary key, 
  time_stamp      timestamp not null default now(), 
  total           numeric(10, 2) not null, 
  cliente_id      int references cliente(id), 
  profissional_id int references profissional(id)
);

create table itens_venda (
  id              serial primary key, 
  venda_id        int not null references venda(id), 
  medicamento_id  int not null references medicamento(id), 
  quantidade      int not null, 
  desconto        numeric(10, 2) not null default 0, 
  total           numeric(10, 2) not null
);

insert into laboratorio (nome, razao, cnpj) 
  values ('Medley', 'SANOFI MEDLEY FARMACÊUTICA LTDA', '10.588.595/0012-54');
insert into laboratorio (nome, razao, cnpj) 
  values ('Atenolol', 'BIOMAXFARMA JOTA LTDA', '19.987.783/0001-77');
  
insert into medicamento (laboratorio_id, nome, dosagem, apresentacacao, tipo, controle, quantidade, preco) 
  values (1, 'Glimepirida', '1 comprimido por dia', 'sólido', 'genérico', 'não controlado', '60 comprimidos', 45.00);
insert into medicamento (laboratorio_id, nome, dosagem, apresentacacao, tipo, controle, quantidade, preco) 
  values (2, 'Angipress', '1 comprimido por dia', 'sólido', 'genérico', 'não controlado', '30 comprimidos', 23.00);
  
insert into estoque (medicamento_id, quantidade, lote, preco, validade) 
  values (1, 10, 'lote 1', 20.00, '2023-12-31');
insert into estoque (medicamento_id, quantidade, lote, preco, validade) 
  values (1, 10, 'lote 2', 20.00, '2023-11-30');
insert into estoque (medicamento_id, quantidade, lote, preco, validade) 
  values (2, 15, 'lote 3', 9.50, '2023-12-31');
insert into estoque (medicamento_id, quantidade, lote, preco, validade) 
  values (2, 10, 'lote 4', 9.50, '2023-11-30');

insert into estoque_total (medicamento_id, total) 
  select id, 0 from medicamento;
update estoque_total set total = total + 10 where medicamento_id = 1;
update estoque_total set total = total + 10 where medicamento_id = 1;
update estoque_total set total = total + 15 where medicamento_id = 2;
update estoque_total set total = total + 10 where medicamento_id = 2;

insert into cliente (nome, cpf, sexo, data_nasc) 
  values ('eu', '1234567890', 'M', '1965-12-31');

insert into profissional (registro, nome, tipo) 
  values ('123456', 'prof', 'médico');

insert into venda (cliente_id, total) 
  values (1, 129.2);
insert into itens_venda (venda_id, medicamento_id, quantidade, desconto, total) 
  values (1, 1, 2, 4.5, 85.5);
update estoque_total set total = total - 2 where medicamento_id = 1;
insert into itens_venda (venda_id, medicamento_id, quantidade, desconto, total) 
  values (1, 2, 2, 2.3, 43.7);
update estoque_total set total = total - 2 where medicamento_id = 2;

insert into venda (profissional_id, total) 
  values (1, 69);
insert into itens_venda (venda_id, medicamento_id, quantidade, total) 
  values (2, 1, 1, 46);
update estoque_total set total = total - 1 where medicamento_id = 1;
insert into itens_venda (venda_id, medicamento_id, quantidade, total) 
  values (2, 2, 1, 23);
update estoque_total set total = total - 1 where medicamento_id = 2;

select * from laboratorio;
select * from medicamento;
select * from estoque;
select * from estoque_total;
select * from cliente;
select * from venda;
select * from itens_venda;
