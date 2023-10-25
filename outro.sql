drop table if exists itens_venda;
drop table if exists venda;
drop table if exists profissional;
drop table if exists cliente;
drop table if exists pessoa;
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
  apresentacao    varchar(255) not null check (apresentacao in ('sólido', 'líquido', 'semissólido')), 
  tipo            varchar(255) not null check (tipo in ('Genérico', 'Similar', 'Referência','Biológico','Novo','Específico')), 
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

create table pessoa (
  id              serial primary key, 
  nome            varchar(255) not null, 
  logradouro      varchar(255), 
  numero          varchar(255), 
  complemento     varchar(255), 
  bairro          varchar(255), 
  cep             numeric(8), 
  cidade          varchar(255), 
  estado          char(2), 
  telefone        numeric(11)
);

create table cliente (
  id              int primary key references pessoa(id), 
  cpf             numeric(11) not null unique, 
  data_nasc       date not null, 
  sexo            char(1) not null check (sexo in ('F', 'M'))
);

create table profissional (
  id              int primary key references pessoa(id), 
  registro        varchar(255) not null unique, 
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

-- Laboratórios: 
insert into laboratorio (nome, razao, cnpj) 
  values ('Medley', 'SANOFI MEDLEY FARMACÊUTICA LTDA', '10.588.595/0012-54');
insert into laboratorio (nome, razao, cnpj) 
  values ('Mantecorp', 'COSMED INDUSTRIA DE COSMETICOS E MEDICAMENTOS S.A.', '61.082.426/0002-07');
insert into laboratorio (nome, razao, cnpj) 
  values ('Eurofarma', 'Eurofarma Laboratórios S/A', '61.190.096/0001-92');
insert into laboratorio (nome, razao, cnpj) 
  values ('EMS', 'EMS S/A', '57.507.378/0003-65');
insert into laboratorio (nome, razao, cnpj) 
  values ('NEO QUIMICA', 'BRAINFARMA INDUSTRIA QUIMICA E FARMACEUTICA S.A.', '05.161.069/0001-10');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Janssen Brasil','JANSSEN-CILAG FARMACÊUTICA LTDA','51.780.468/0001-87');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Geolab','GEOLAB INDÚSTRIA FARMACÊUTICA S/A','03.485.572/0001-04');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Allergan Aesthetics','ABBVIE FARMACÊUTICA LTDA.','15.800.545/0001-50');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Ache','ACHÉ LABORATÓRIOS FARMACÊUTICOS S.A','60.659.463/0029-92');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Allergan','ALLERGAN PRODUTOS FARMACÊUTICOS LTDA','43.426.626/0001-77');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Amgen','AMGEN BIOTECNOLOGIA DO BRASIL LTDA.','18.774.815/0001-93');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Apsen','ASPEN PHARMA INDÚSTRIA FARMACÊUTICA LTDA','02.433.631/0001-20');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Bayer','BAYER S.A.','18.459.628/0001-15');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Biossintetica','BIOSINTÉTICA FARMACÊUTICA LTDA','53.162.095/0001-06');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Blau','BLAU FARMACÊUTICA S.A.','58.430.828/0001-60');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Bristol-Myer','BRISTOL-MYERS SQUIBB FARMACÊUTICA LTDA','56.998.982/0001-07');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Celltrion','CELLTRION HEALTHCARE DISTRIBUICAO DE PRODUTOS FARMACEUTICOS DOS BRASIL LTDA','05.452.889/0001-61');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Cifarma','CIFARMA CIENTÍFICA FARMACÊUTICA LTDA','17.562.075/0001-69');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Behring','CSL BEHRING COMÉRCIO DE PRODUTOS FARMACÊUTICOS LTDA','62.969.589/0001-98');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Reddys','DR. REDDYS FARMACÊUTICA DO BRASIL LTDA','03.978.166/0001-75');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Fresenius','FRESENIUS KABI BRASIL LTDA','49.324.221/0001-04');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Germed','GERMED FARMACEUTICA LTDA','45.992.062/0001-65');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'GSK','GLAXOSMITHKLINE BRASIL LTDA','33.247.743/0001-10');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Greenpharma','GREENPHARMA QUÍMICA E FARMACÊUTICA LTDA','33.408.105/0001-33');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Grunenthal','GRÜNENTHAL DO BRASIL FARMACÊUTICA LTDA.','10.555.143/0001-13');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Carnot','HEMAFARMA COM. E IND. FARM. LTDA','30.332.829/0001-52');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Hipolarbor','HIPOLABOR FARMACEUTICA LTDA','19.570.720/0001-10');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Melcon','INDÚSTRIA FARMACÊUTICA MELCON DO BRASIL S.A.','04.338.716/0001-54');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Inpharma','INPHARMA LABORATORIOS LTDA','62.488.184/0001-38');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Biochimio','INSTITUTO BIOCHIMICO INDÚSTRIA FARMACÊUTICA LTDA','33.258.401/0001-03');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Kley','KLEY HERTZ FARMACEUTICA S.A','92.695.691/0001-03');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Elofar','LABORATÓRIO FARMACÊUTICO ELOFAR LTDA','83.874.628/0001-43');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Teuto','LABORATÓRIO TEUTO BRASILEIRO S/A','17.159.229/0001-76');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Servier','LABORATÓRIOS SERVIER DO BRASIL LTDA','42.374.207/0001-76');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Legrand','LEGRAND PHARMA INDÚSTRIA FARMACÊUTICA LTDA','05.044.984/0001-26');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Libbs','LIBBS FARMACÊUTICA LTDA','61.230.314/0001-75');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Mabra','MABRA FARMACEUTICA LTDA','09.545.589/0001-88');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Merck','MERCK S/A','33.069.212/0001-84');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Multilab','MULTILAB INDUSTRIA E COMERCIO DE PRODUTOS FARMACEUTICOS LTDA','92.265.552/0009-05');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Mylan','MYLAN LABORATORIOS LTDA','11.643.096/0001-22');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Novartis','NOVARTIS BIOCIENCIAS S.A','56.994.502/0001-30');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Nordisk','NOVO NORDISK FARMACÊUTICA DO BRASIL LTDA','82.277.955/0001-55');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Organon','ORGANON FARMACÊUTICA LTDA.','45.987.013/0001-34');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Haleon','PF CONSUMER HEALTHCARE BRAZIL IMPORTADORA E DISTRIBUIDORA DE MEDICAMENTOS LTDA','30.872.270/0001-53');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Pharlab','PHARLAB INDÚSTRIA FARMACÊUTICA S.A.','02.501.297/0001-02');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Phytolab','PHYTOLAB INDUSTRIA FARMACEUTICA LTDA - EPP','02.817.180/0001-24');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Prati','PRATI DONADUZZI & CIA LTDA','73.856.593/0001-66');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Roche','PRODUTOS ROCHE QUÍMICOS E FARMACÊUTICOS S.A.','33.009.945/0001-23');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Ranbaxy','RANBAXY FARMACÊUTICA LTDA','73.663.650/0001-90');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Sandoz','SANDOZ DO BRASIL INDÚSTRIA FARMACÊUTICA LTDA','61.286.647/0001-16');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Teva','TEVA FARMACÊUTICA LTDA.','05.333.542/0001-08');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'União quimica','UNIÃO QUÍMICA FARMACÊUTICA NACIONAL S/A','60.665.981/0001-18');
INSERT INTO laboratorio (nome, razao, cnpj)   VALUES ( 'Zambon','ZAMBON LABORATÓRIOS FARMACÊUTICOS LTDA.','61.100.004/0001-36');


insert into medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco) 
  values (1, 'Glimepirida', '4mg', 'sólido', 'Genérico', 'não controlado', '60 comprimidos', 43.40);
insert into medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco) 
  values (9, 'Angipress', '25mg', 'sólido', 'Similar', 'não controlado', '30 comprimidos', 24.21);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'SOCIAN','50 MG','sólido','Novo','não controlado','20 comprimidos',98.62);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'SOCIAN','200 MG ','sólido','Novo','não controlado','20 comprimidos',185.78);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'GLUCANTIME','300 MG/ml','líquido','Novo','não controlado','5 ml',457.66);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'OSCAL D','500 MG ','sólido','Específico','não controlado','8 comprimidos',10.74);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'OSCAL D','500 MG ','sólido','Específico','não controlado','60 comprimidos',83.32);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'URBANIL','10 MG','sólido','Novo','B2','20 comprimidos',13.52);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'CLONAZEPAM','2 MG','sólido','Genérico','B2','30 comprimidos',11.99);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'NEOZINE','40 MG/Ml','líquido','Novo','não controlado','20  ml',14.09);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'CLORIDRATO DE MEMANTINA','10 MG','sólido','Genérico','não controlado','30 comprimidos',58.65);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'CLORIDRATO DE MEMANTINA','11 MG','sólido','Genérico','não controlado','60 comprimidos',114.90);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'PLASIL','12 MG','sólido','Novo','não controlado','20 comprimidos',10.08);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'CLORIDRATO DE RANITIDINA','300 MG ','sólido','Genérico','não controlado','20 comprimidos',59.24);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ACEBROFILINA','5 MG/ML','líquido','Genérico','não controlado','120 ml',20.79);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'AIXA','2 MG ','sólido','Similar','não controlado','21 comprimidos',45.35);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'AIXA','2 MG','sólido','Similar','não controlado','63 comprimidos',123.85);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'NASACORT','550 MCG/ml','líquido','Novo','não controlado','16.5 ml',72.67);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ALLENASAL','550 MCG/ml','líquido','Similar','não controlado','16.5 ml',51.15);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ACICLOVIR','50 MG/G','semissólido','Genérico','não controlado','10  gramas',20.98);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ACICLOVIR','200 MG ','sólido','Genérico','não controlado','25 comprimidos',76.73);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ACICLOVIR','400 MG ','sólido','Genérico','não controlado','30 comprimidos',167.43);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'AAS','100 MG ','sólido','Similar','não controlado','30 comprimidos',18.26);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'AAS','100 MG ','sólido','Similar','não controlado','120 comprimidos',64.87);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'AAS','100 MG ','sólido','Similar','não controlado','200 comprimidos',131.01);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ADAPEL','1 MG/G ','semissólido','Similar','não controlado','20  gramas',35.12);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ADAPALENO','1 MG/G ','semissólido','Genérico','não controlado','30  gramas',44.61);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ALBENDAZOL','400 MG ','sólido','Genérico','não controlado','1 comprimidos',6.59);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ALBENDAZOL','400 MG ','sólido','Genérico','não controlado','3 comprimidos',16.99);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'LEMTRADA','10 MG/Ml','líquido','Biológico','não controlado','1 frasco',46178.58);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'MYOZYME','50 MG','sólido','Biológico','não controlado','1 frasco',2454.55);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'NEXVIAZYME','100 MG ','sólido','Biológico','não controlado','1 frasco',5649.65);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELOCTATE','250 UI ','sólido','Biológico','não controlado','3  comprimidos',1072.57);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELOCTATE','500 UI ','sólido','Biológico','não controlado','3  comprimidos',2145.13);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELOCTATE','750 UI ','sólido','Biológico','não controlado','3  comprimidos',3217.72);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELOCTATE','1000 UI','sólido','Biológico','não controlado','3  comprimidos',4290.28);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELOCTATE','1500 UI','sólido','Biológico','não controlado','3  comprimidos',6435.40);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELOCTATE','2000 UI','sólido','Biológico','não controlado','3  comprimidos',8580.56);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELOCTATE','3000 UI','sólido','Biológico','não controlado','3  comprimidos',12870.83);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELPROLIX','250 UI ','sólido','Biológico','não controlado','5  comprimidos',1570.22);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELPROLIX','500 UI ','sólido','Biológico','não controlado','5  comprimidos',3140.48);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELPROLIX','1000 UI','sólido','Biológico','não controlado','5  comprimidos',6280.90);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELPROLIX','2000 UI','sólido','Biológico','não controlado','5  comprimidos',12561.86);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELPROLIX','3000 UI','sólido','Biológico','não controlado','5  comprimidos',18842.79);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'XENPOZYME','20 MG','sólido','Biológico','não controlado','1 frasco',26396.80);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'THYROGEN','1.1 MG ','sólido','Biológico','não controlado','1 frasco',5819.07);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'PRALUENT','75 MG/Ml','líquido','Biológico','não controlado','1.0 ml',1346.39);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'PRALUENT','75 MG/Ml','líquido','Biológico','não controlado','1.0 ml',2692.79);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'PRALUENT','75 MG/Ml','líquido','Biológico','não controlado','1.0 ml',8078.34);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'PRALUENT','150 MG','líquido','Biológico','não controlado','1.0 ml',1287.56);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'PRALUENT','150 MG','líquido','Biológico','não controlado','1.0 ml',2575.12);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'PRALUENT','150 MG','líquido','Biológico','não controlado','1.0 ml',7725.32);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ALOPURINOL','100 MG ','sólido','Genérico','não controlado','30 comprimidos',8.66);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ALOPURINOL','300 MG ','sólido','Genérico','não controlado','30 comprimidos',25.56);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ALPRAZOLAM','0.5 MG ','sólido','Genérico','não controlado','30 comprimidos',9.80);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ALPRAZOLAM','0.25 MG','sólido','Genérico','não controlado','30 comprimidos',9.60);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ALPRAZOLAM','1 MG CO','sólido','Genérico','não controlado','30 comprimidos',18.27);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ALPRAZOLAM','2 MG CO','sólido','Genérico','não controlado','30 comprimidos',47.98);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'AMOXICILINA','250 MG/5ml','líquido','Genérico','não controlado','150 ml',36.95);
INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'AMOXICILINA','500 MG/5ml','líquido','Genérico','não controlado','150 ml',50.74);

  
insert into estoque (medicamento_id, lote, validade, preco, quant_inicial, quant_atual) 
  values (1, 'lote 1', '2023-12-31', 20.00, 10, 10);
insert into estoque (medicamento_id, lote, validade, preco, quant_inicial, quant_atual) 
  values (1, 'lote 2', '2024-04-30', 20.00, 10, 10);
insert into estoque (medicamento_id, lote, validade, preco, quant_inicial, quant_atual) 
  values (2, 'lote 3', '2023-12-31', 9.50, 15, 15);
insert into estoque (medicamento_id, lote, validade, preco, quant_inicial, quant_atual) 
  values (2, 'lote 4', '2024-01-31', 9.50, 10, 10);

insert into estoque_total (medicamento_id, total) 
  select id, 0 from medicamento;
update estoque_total set total = total + 10 where medicamento_id = 1;
update estoque_total set total = total + 10 where medicamento_id = 1;
update estoque_total set total = total + 15 where medicamento_id = 2;
update estoque_total set total = total + 10 where medicamento_id = 2;

insert into pessoa (nome) 
  values ('eu');
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Adônis Daniel Aranda Sobrinho','Rua Carlos José de Castilho',29,'Cambuci',06168043,'São Paulo','SP',011928368496);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Aldo João Paes Rivera dos Santos','Alameda Ibiracemas',99,'Cidade Líder',07615900,'São Paulo','SP',011936020385);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Andrea Quitéria Assunção','Rua Carneiro Leão',82,'Pari',01843906,'São Paulo','SP',011961991053);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Antônio Diego Aguiar de Galvão','Avenida Onze de Junho',12,'Santa Cecília',05360307,'São Paulo','SP',011932772123);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Bella Priscila Colaço Gil','Rua Filadélphia',94,'Vila Maria',09912424,'São Paulo','SP',011975207230);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Berenice Gonçalves Leon','Rua Engenheiro Toledo Malta',94,'Aricanduva',08299462,'São Paulo','SP',011947284138);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Damião Benites de Junqueira','Rua Delfino Casal de Rey',30,'Santa Cecília',04274254,'São Paulo','SP',011946426695);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Daniela Eloá de Aragão','Rua General Costa Campos',36,'Cidade Líder',06594037,'São Paulo','SP',011947819562);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Danielle Fátima Pontes de Quintana','Rua Barão da Cunha de Araripe',60,'Santo Amaro',07454333,'São Paulo','SP',011940753992);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Danilo Juan Burgos de Fernandes','Praça José Moreno',22,'Campo Limpo',08635179,'São Paulo','SP',011932735226);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Edivaldo Quintana Jr.','Rua Caiabu',1,'Lapa',06459989,'São Paulo','SP',011962352421);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Edson Esteves Marés','Rua Desembargador Isnard dos Reis',36,'São Miguel Paulista',08920501,'São Paulo','SP',011923734049);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Eduardo Godói Jr.','Praça Argemiro Alves de Sá',14,'Bom Retiro',05456620,'São Paulo','SP',011947211180);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Elias Dias Souto','Rua Emílio Baumgart',62,'Alto de Pinheiros',09891591,'São Paulo','SP',011915708270);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Francisco Aranda','Rua Frei Galvão',28,'Cidade Líder',04592864,'São Paulo','SP',011956700938);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Gilson Abreu de Aguiar','Rua Dario Vilares Barbosa',29,'São Miguel Paulista',01123625,'São Paulo','SP',011927174666);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Joaquim Saulo Oliveira Padrão de Cardoso','Rua Aracari',73,'Bela Vista',05692120,'São Paulo','SP',011950535833);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Laís Maria Maldonado Quintana','Rua Benício José da Fonseca',34,'Cambuci',03128340,'São Paulo','SP',011994738091);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Luara Elisângela Colaço da Silva','Alameda Olga',47,'Cangaíba',04452012,'São Paulo','SP',011956712681);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Martinho Aranda Feliciano','Rua Eusébio da Silva',16,'Ponte Rasa',06892250,'São Paulo','SP',011991592293);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Martinho Colaço Jr.','Parque Luiz Carlos Prestes',36,'Jaraguá',05487508,'São Paulo','SP',011933809113);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Micaela Ivone Domingues de Prado','Rua Aracena',34,'Moema',04721519,'São Paulo','SP',011986932061);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Nicole Duarte Jangada','Avenida Doutor Vital Brasil',3,'Moema',09083759,'São Paulo','SP',011997160743);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Samuel Batista de Marinho','Rua Brejo Alegre',9,'São Miguel Paulista',07254951,'São Paulo','SP',011971500983);
INSERT INTO pessoa (nome, logradouro, numero,  bairro, cep, cidade, estado, telefone)   VALUES ('Tomás Rodrigo Lozano Madeira','Praça Memória do Jaçanã',23,'Barra Funda',02136420,'São Paulo','SP',011987756463);

  
  
  
  
insert into cliente (id, cpf, data_nasc, sexo) 
  values (1, 1234567890, '1965-12-31', 'M');
INSERT INTO cliente (id, cpf, data_nasc, sexo)  VALUES (2,79298401366,'1991-5-25','M');
INSERT INTO cliente (id, cpf, data_nasc, sexo)  VALUES (3,51301866175,'1984-12-11','M');
INSERT INTO cliente (id, cpf, data_nasc, sexo)  VALUES (4,23541139515,'1990-10-13','F');
INSERT INTO cliente (id, cpf, data_nasc, sexo)  VALUES (5,81285894012,'1985-7-18','M');
INSERT INTO cliente (id, cpf, data_nasc, sexo)  VALUES (6,88687662707,'1986-5-8','F');
INSERT INTO cliente (id, cpf, data_nasc, sexo)  VALUES (7,27083655243,'1986-5-16','F');
INSERT INTO cliente (id, cpf, data_nasc, sexo)  VALUES (8,50949967968,'1972-11-12','M');
INSERT INTO cliente (id, cpf, data_nasc, sexo)  VALUES (9,46786757450,'1987-5-6','F');
INSERT INTO cliente (id, cpf, data_nasc, sexo)  VALUES (10,58823171687,'1952-9-20','F');
INSERT INTO cliente (id, cpf, data_nasc, sexo)  VALUES (11,61265916930,'1965-6-16','M');
INSERT INTO cliente (id, cpf, data_nasc, sexo)  VALUES (12,74937483659,'1953-9-13','M');
INSERT INTO cliente (id, cpf, data_nasc, sexo)  VALUES (13,83224514706,'1993-5-20','M');
INSERT INTO cliente (id, cpf, data_nasc, sexo)  VALUES (14,79223348792,'1975-1-21','M');
INSERT INTO cliente (id, cpf, data_nasc, sexo)  VALUES (15,69667630559,'1987-8-27','M');
INSERT INTO cliente (id, cpf, data_nasc, sexo)  VALUES (16,96393555783,'1950-5-19','M');
INSERT INTO cliente (id, cpf, data_nasc, sexo)  VALUES (17,23717077615,'1994-10-3','M');
INSERT INTO cliente (id, cpf, data_nasc, sexo)  VALUES (18,68435004671,'1983-4-14','M');
INSERT INTO cliente (id, cpf, data_nasc, sexo)  VALUES (19,20611262083,'1977-5-22','F');
INSERT INTO cliente (id, cpf, data_nasc, sexo)  VALUES (20,26612046766,'1983-4-21','F');
INSERT INTO cliente (id, cpf, data_nasc, sexo)  VALUES (21,78930017253,'1973-2-2','M');





INSERT INTO profissional (id, registro, tipo)  VALUES (22,'150348','médico');
INSERT INTO profissional (id, registro, tipo)  VALUES (23,'135001','médico');
INSERT INTO profissional (id, registro, tipo)  VALUES (24,'189654','médico');
INSERT INTO profissional (id, registro, tipo)  VALUES (25,'2589','dentista');
INSERT INTO profissional (id, registro, tipo)  VALUES (26,'15487','veterinário');



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
  values (22, 69);
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, total) 
  values (2, 1, 1, 1, 46);
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, total) 
  values (2, 2, 3, 1, 23);

update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 1;
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 3;
update estoque_total set total = total - 1 where medicamento_id = 1;
update estoque_total set total = total - 1 where medicamento_id = 2;