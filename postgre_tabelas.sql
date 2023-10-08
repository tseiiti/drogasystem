-- Active: 1692452936450@@127.0.0.1@5432@drogasystem@public

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
  apresentacao    varchar(255) not null check (apresentacao in ('sólido', 'liquido', 'semissólido')), 
  tipo            varchar(255) not null check (tipo in ('genérico', 'similar', 'referência')), 
  controle        varchar(255) not null check (controle in ('não controlado', 'A2', 'A3', 'B1', 'B2', 'C1', 'C2', 'AM')), 
  quantidade      varchar(255) not null, 
  preco           numeric(10, 2) not null
);

create table estoque (
  id              serial primary key, 
  medicamento_id  int not null references medicamento(id), 
  lote            varchar(255) not null, 
  data            date not null default current_date, 
  validade        date not null, 
  preco           numeric(10, 2) not null, 
  quant_inicial   int not null, 
  quant_venda     int not null default 0, 
  quant_atual     int not null default 0
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
  estoque_id      int not null references estoque(id), 
  quantidade      int not null, 
  desconto        numeric(10, 2) not null default 0, 
  total           numeric(10, 2) not null
);
