-- Active: 1692452936450@@127.0.0.1@5432@drogasystem@public

-- insert into estoque (medicamento_id, lote, validade, preco, quant_inicial, quant_atual) values (1, 'lote 1', '2023-12-31', 20.00, 10, 10);
-- insert into estoque (medicamento_id, lote, validade, preco, quant_inicial, quant_atual) values (1, 'lote 2', '2024-04-30', 20.00, 10, 10);
-- insert into estoque (medicamento_id, lote, validade, preco, quant_inicial, quant_atual) values (2, 'lote 3', '2023-12-31', 9.50, 15, 15);
-- insert into estoque (medicamento_id, lote, validade, preco, quant_inicial, quant_atual) values (2, 'lote 4', '2024-01-31', 9.50, 10, 10);

-- insert into estoque_total (medicamento_id, total) 
--   select id, 0 from medicamento;
-- update estoque_total set total = total + 10 where medicamento_id = 1;
-- update estoque_total set total = total + 10 where medicamento_id = 1;
-- update estoque_total set total = total + 15 where medicamento_id = 2;
-- update estoque_total set total = total + 10 where medicamento_id = 2;


insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Adônis Daniel Aranda Sobrinho','Rua Carlos José de Castilho', 29, 'Cambuci', 06168043, 'São Paulo', 'SP', 011928368496);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Aldo João Paes Rivera dos Santos','Alameda Ibiracemas', 99, 'Cidade Líder', 07615900, 'São Paulo', 'SP', 011936020385);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Andrea Quitéria Assunção','Rua Carneiro Leão', 82, 'Pari', 01843906, 'São Paulo', 'SP', 011961991053);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Antônio Diego Aguiar de Galvão','Avenida Onze de Junho', 12, 'Santa Cecília', 05360307, 'São Paulo', 'SP', 011932772123);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Bella Priscila Colaço Gil','Rua Filadélphia', 94, 'Vila Maria', 09912424, 'São Paulo', 'SP', 011975207230);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Berenice Gonçalves Leon','Rua Engenheiro Toledo Malta', 94, 'Aricanduva', 08299462, 'São Paulo', 'SP', 011947284138);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Damião Benites de Junqueira','Rua Delfino Casal de Rey', 30, 'Santa Cecília', 04274254, 'São Paulo', 'SP', 011946426695);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Daniela Eloá de Aragão','Rua General Costa Campos', 36, 'Cidade Líder', 06594037, 'São Paulo', 'SP', 011947819562);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Danielle Fátima Pontes de Quintana','Rua Barão da Cunha de Araripe', 60, 'Santo Amaro', 07454333, 'São Paulo', 'SP', 011940753992);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Danilo Juan Burgos de Fernandes','Praça José Moreno', 22, 'Campo Limpo', 08635179, 'São Paulo', 'SP', 011932735226);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Edivaldo Quintana Jr.','Rua Caiabu',1,'Lapa', 06459989, 'São Paulo', 'SP', 011962352421);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Edson Esteves Marés','Rua Desembargador Isnard dos Reis', 36, 'São Miguel Paulista', 08920501, 'São Paulo', 'SP', 011923734049);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Eduardo Godói Jr.','Praça Argemiro Alves de Sá', 14, 'Bom Retiro', 05456620, 'São Paulo', 'SP', 011947211180);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Elias Dias Souto','Rua Emílio Baumgart', 62, 'Alto de Pinheiros', 09891591, 'São Paulo', 'SP', 011915708270);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Francisco Aranda','Rua Frei Galvão', 28, 'Cidade Líder', 04592864, 'São Paulo', 'SP', 011956700938);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Gilson Abreu de Aguiar','Rua Dario Vilares Barbosa', 29, 'São Miguel Paulista', 01123625, 'São Paulo', 'SP', 011927174666);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Joaquim Saulo Oliveira Padrão de Cardoso','Rua Aracari', 73, 'Bela Vista', 05692120, 'São Paulo', 'SP', 011950535833);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Laís Maria Maldonado Quintana','Rua Benício José da Fonseca', 34, 'Cambuci', 03128340, 'São Paulo', 'SP', 011994738091);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Luara Elisângela Colaço da Silva','Alameda Olga', 47, 'Cangaíba', 04452012, 'São Paulo', 'SP', 011956712681);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Martinho Aranda Feliciano','Rua Eusébio da Silva', 16, 'Ponte Rasa', 06892250, 'São Paulo', 'SP', 011991592293);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Martinho Colaço Jr.','Parque Luiz Carlos Prestes', 36, 'Jaraguá', 05487508, 'São Paulo', 'SP', 011933809113);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Micaela Ivone Domingues de Prado','Rua Aracena', 34, 'Moema', 04721519, 'São Paulo', 'SP', 011986932061);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Nicole Duarte Jangada','Avenida Doutor Vital Brasil', 3, 'Moema', 09083759, 'São Paulo', 'SP', 011997160743);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Samuel Batista de Marinho','Rua Brejo Alegre', 9, 'São Miguel Paulista', 07254951, 'São Paulo', 'SP', 011971500983);
insert into pessoa (nome, logradouro, numero, bairro, cep, cidade, estado, telefone) values ('Tomás Rodrigo Lozano Madeira','Praça Memória do Jaçanã', 23, 'Barra Funda', 02136420, 'São Paulo', 'SP', 011987756463);

insert into cliente (id, cpf, data_nasc, sexo) values (1, 78930017253, '1973-2-2', 'M');
insert into cliente (id, cpf, data_nasc, sexo) values (2, 79298401366, '1991-5-25', 'M');
insert into cliente (id, cpf, data_nasc, sexo) values (3, 51301866175, '1984-12-11', 'M');
insert into cliente (id, cpf, data_nasc, sexo) values (4, 23541139515, '1990-10-13', 'F');
insert into cliente (id, cpf, data_nasc, sexo) values (5, 81285894012, '1985-7-18', 'M');
insert into cliente (id, cpf, data_nasc, sexo) values (6, 88687662707, '1986-5-8', 'F');
insert into cliente (id, cpf, data_nasc, sexo) values (7, 27083655243, '1986-5-16', 'F');
insert into cliente (id, cpf, data_nasc, sexo) values (8, 50949967968, '1972-11-12', 'M');
insert into cliente (id, cpf, data_nasc, sexo) values (9, 46786757450, '1987-5-6', 'F');
insert into cliente (id, cpf, data_nasc, sexo) values (10, 58823171687, '1952-9-20', 'F');
insert into cliente (id, cpf, data_nasc, sexo) values (11, 61265916930, '1965-6-16', 'M');
insert into cliente (id, cpf, data_nasc, sexo) values (12, 74937483659, '1953-9-13', 'M');
insert into cliente (id, cpf, data_nasc, sexo) values (13, 83224514706, '1993-5-20', 'M');
insert into cliente (id, cpf, data_nasc, sexo) values (14, 79223348792, '1975-1-21', 'M');
insert into cliente (id, cpf, data_nasc, sexo) values (15, 69667630559, '1987-8-27', 'M');
insert into cliente (id, cpf, data_nasc, sexo) values (16, 96393555783, '1950-5-19', 'M');
insert into cliente (id, cpf, data_nasc, sexo) values (17, 23717077615, '1994-10-3', 'M');
insert into cliente (id, cpf, data_nasc, sexo) values (18, 68435004671, '1983-4-14', 'M');
insert into cliente (id, cpf, data_nasc, sexo) values (19, 20611262083, '1977-5-22', 'F');
insert into cliente (id, cpf, data_nasc, sexo) values (20, 26612046766, '1983-4-21', 'F');

insert into profissional (id, registro, tipo) values (21, '15487', 'veterinário');
insert into profissional (id, registro, tipo) values (22, '150348', 'médico');
insert into profissional (id, registro, tipo) values (23, '135001', 'médico');
insert into profissional (id, registro, tipo) values (24, '189654', 'médico');
insert into profissional (id, registro, tipo) values (25, '2589', 'dentista');

-- insert into pessoa (nome) 
--   values ('eu');
-- insert into cliente (id, cpf, data_nasc, sexo) 
--   values (1, '1234567890', '1965-12-31', 'M');

-- insert into pessoa (nome) 
--   values ('joão');
-- insert into profissional (id, registro, tipo) 
--   values (2, '123456', 'médico');

insert into venda (cliente_id, total) 
  values (1, 129.2);
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) 
  values (1, 1, 1, 2, 4.5, 85.5);
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) 
  values (1, 2, 3, 2, 2.3, 43.7);

update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 1;
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 3;
update estoque_total set total = total - 2 where medicamento_id = 1;
update estoque_total set total = total - 2 where medicamento_id = 2;

insert into venda (profissional_id, total) 
  values (2, 69);
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, total) 
  values (2, 1, 1, 1, 46);
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, total) 
  values (2, 2, 3, 1, 23);

update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 1;
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 3;
update estoque_total set total = total - 1 where medicamento_id = 1;
update estoque_total set total = total - 1 where medicamento_id = 2;
