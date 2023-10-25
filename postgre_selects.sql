-- Active: 1692452936450@@127.0.0.1@5432@drogasystem@public

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


select * into lab_bck from laboratorio order by 1;
select * into med_bck from medicamento order by 1 limit 99999;
select * into est_bck from estoque order by 1 limit 99999;
select * into tot_bck from estoque_total order by 1 limit 99999;

select * from lab_bck order by 1;
select * from med_bck order by 1;
select * from est_bck order by 1;
select * from tot_bck order by 1;

-- insert into laboratorio 
-- select * from lab_bck where id in (
--   select laboratorio_id from med_bck where nome in ('AAS', 'ACEBROFILINA', 'ACICLOVIR', 'ADAPALENO', 'ADAPEL', 'AIXA', 'ALBENDAZOL', 'ALLENASAL', 'ALOPURINOL', 'ALPRAZOLAM', 'AMOXICILINA', 'CLONAZEPAM', 'CLORIDRATO DE MEMANTINA', 'CLORIDRATO DE RANITIDINA', 'ELOCTATE', 'ELPROLIX', 'GLUCANTIME', 'LEMTRADA', 'MYOZYME', 'NASACORT', 'NEOZINE', 'NEXVIAZYME', 'OSCAL D', 'PLASIL', 'PRALUENT', 'SOCIAN', 'THYROGEN', 'URBANIL', 'XENPOZYME')
-- );

-- insert into medicamento 
-- select * from med_bck where nome in ('AAS', 'ACEBROFILINA', 'ACICLOVIR', 'ADAPALENO', 'ADAPEL', 'AIXA', 'ALBENDAZOL', 'ALLENASAL', 'ALOPURINOL', 'ALPRAZOLAM', 'AMOXICILINA', 'CLONAZEPAM', 'CLORIDRATO DE MEMANTINA', 'CLORIDRATO DE RANITIDINA', 'ELOCTATE', 'ELPROLIX', 'GLUCANTIME', 'LEMTRADA', 'MYOZYME', 'NASACORT', 'NEOZINE', 'NEXVIAZYME', 'OSCAL D', 'PLASIL', 'PRALUENT', 'SOCIAN', 'THYROGEN', 'URBANIL', 'XENPOZYME')
-- ;



-- drop table lab_bck;
-- drop table med_bck;
-- drop table est_bck;
-- drop table tot_bck;

-- create table med (
--   cnpj      varchar(255) not null, 
--   prod      varchar(255) not null, 
--   apre      varchar(255) not null, 
--   controle  varchar(255) not null, 
--   tipo      varchar(255) not null, 
--   preco     numeric(10, 2) not null
-- );
-- alter table med add column laboratorio_id int;
-- select * from med;

-- select * from med
-- left join laboratorio on laboratorio.cnpj = med.cnpj;

-- update med set laboratorio_id = (select id from laboratorio where cnpj = med.cnpj);
--update med set tipo = 'Outros' where tipo not in ('Biológico', 'Específico', 'Fitoterápico', 'Genérico', 'Novo', 'Outros', 'Produto de Terapia Avançada', 'Radiofármaco', 'Similar');


-- insert into medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)
-- select laboratorio_id, prod, apre, case 
--   when apre ilike '%mg/g%' then 'semissólido'
--   when apre ilike '%u/g%' then 'semissólido'
--   when apre ilike '%pom%' then 'semissólido'
--   when apre ilike '%crem%' then 'semissólido'
--   when apre ilike '%inj%' then 'líquido'
--   when apre ilike '%mcg%' then 'líquido'
--   when apre ilike '%ml%' then 'líquido'
--   else 'sólido'
-- end , tipo, 
--   case when controle in ('não controlado', 'A2', 'A3', 'B1', 'B2', 'C1', 'C2', 'AM') then controle 
--   else 'não controlado' end, 
-- apre, preco from med;


-- select laboratorio_id, prod, apre, apre, tipo, 
-- case when controle in ('não controlado', 'A2', 'A3', 'B1', 'B2', 'C1', 'C2', 'AM') then controle else 'não controlado' end, 
-- apre, preco from med ;

-- select concat('insert into medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco) values (', 
-- laboratorio_id, ', ''', nome, ''', ''', replace(dosagem, ' ', ''), ''', ''', apresentacao, ''', ''', tipo, ''', ''', controle, ''', ''', trim(quantidade), ''', ', preco, ');') 
-- from medicamento order by id;

-- select distinct(dosagem) from medicamento 
-- where not (
--   dosagem ilike '%mg/ml%'
--   or dosagem ilike '%MG/G%'
--   or dosagem ilike '%ML/ML%'
--   or dosagem ilike '%MU/ML%'
--   or dosagem ilike '%GV/ML%'
--   or dosagem ilike '%MEQ/L%'
--   or dosagem ilike '%G/L%'
--   or dosagem ilike '%G/G%'
--   or dosagem ilike '%U/G%'
--   or dosagem ilike '%MG%'
--   or dosagem ilike '%UI/ML%'
--   or dosagem ilike '% UI %'
--   or dosagem ilike '%MCG%'
--   or dosagem ilike '%TRU%'
--   or dosagem ilike '%U/U%'
--   or dosagem ilike '% U %'
--   or dosagem ilike '%G/ML%'

--   or dosagem ilike '%SOL INJ%'
--   or dosagem ilike '%SUS INJ%'
--   or dosagem ilike '%SUS ORAL%'
--   or dosagem ilike '%PO LIOF%'
--   or dosagem ilike '%SOL TOP%'
--   or dosagem ilike '%PO EFEV%'
--   or dosagem ilike '%DRG%'
-- )
-- ;

-- update medicamento set dosagem = replace(dosagem, ' ', ''), quantidade = replace(quantidade, ' ', '');
-- select '50 MG/ML XPE CT FR VD AMB X 100 ML' ~* 'mg';

-- drop table medicamento_old;
-- select * into medicamento_old from medicamento;
-- select split_part(dosagem, 'mg/ml', 1), * from medicamento;
-- select split_part(dosagem, '', 1) from medicamento;


-- select quantidade, replace(substring(quantidade from ' X (.*$)'), '&nbsp;', ' ') from medicamento;
-- select * from medicamento;
-- select 
--   laboratorio_id, 
--   nome, 
--   substring(dosagem from '(^.*(MG/ML|MG/G|ML/ML|MU/ML|GV/ML|MEQ/L|G/L|G/G|U/G|MG|UI/ML|\sUI\s|MCG|TRU|U/U|\sU |G/ML))') dosagem, 
--   case
--     when apresentacao = 'líquido' then 'Líquido'
--     when apresentacao = 'sólido' then 'Sólido'
--     when apresentacao = 'semissólido' then 'Semissólido'
--   end apresentacao, 
--   tipo, 
--   case
--     when controle = 'não controlado' then 'Não controlado'
--     else controle
--   end controle,
--   substring(quantidade from ' X (.*$)') quantidade, 
--   preco,
--   dosagem antigo
-- into medicamento_old 
-- from medicamento;

-- select laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco from medicamento_old;
-- select * from medicamento_old;
-- select * from medicamento;


-- insert into laboratorio (nome, razao, cnpj) select nome, razao, cnpj from laboratorio_old;

-- insert into medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco) 
--   select laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco from medicamento_old;




-- drop table medicamento_old;

-- select * from medicamento where nome = 'SOCIAN';


-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'SOCIAN','50 MG','sólido','Novo','não controlado','20 comprimidos',98.62);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'SOCIAN','200 MG ','sólido','Novo','não controlado','20 comprimidos',185.78);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'GLUCANTIME','300 MG/ml','líquido','Novo','não controlado','5 ml',457.66);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'OSCAL D','500 MG ','sólido','Específico','não controlado','8 comprimidos',10.74);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'OSCAL D','500 MG ','sólido','Específico','não controlado','60 comprimidos',83.32);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'URBANIL','10 MG','sólido','Novo','B2','20 comprimidos',13.52);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'CLONAZEPAM','2 MG','sólido','Genérico','B2','30 comprimidos',11.99);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'NEOZINE','40 MG/Ml','líquido','Novo','não controlado','20  ml',14.09);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'CLORIDRATO DE MEMANTINA','10 MG','sólido','Genérico','não controlado','30 comprimidos',58.65);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'CLORIDRATO DE MEMANTINA','11 MG','sólido','Genérico','não controlado','60 comprimidos',114.90);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'PLASIL','12 MG','sólido','Novo','não controlado','20 comprimidos',10.08);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'CLORIDRATO DE RANITIDINA','300 MG ','sólido','Genérico','não controlado','20 comprimidos',59.24);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ACEBROFILINA','5 MG/ML','líquido','Genérico','não controlado','120 ml',20.79);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'AIXA','2 MG ','sólido','Similar','não controlado','21 comprimidos',45.35);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'AIXA','2 MG','sólido','Similar','não controlado','63 comprimidos',123.85);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'NASACORT','550 MCG/ml','líquido','Novo','não controlado','16.5 ml',72.67);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ALLENASAL','550 MCG/ml','líquido','Similar','não controlado','16.5 ml',51.15);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ACICLOVIR','50 MG/G','semissólido','Genérico','não controlado','10  gramas',20.98);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ACICLOVIR','200 MG ','sólido','Genérico','não controlado','25 comprimidos',76.73);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ACICLOVIR','400 MG ','sólido','Genérico','não controlado','30 comprimidos',167.43);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'AAS','100 MG ','sólido','Similar','não controlado','30 comprimidos',18.26);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'AAS','100 MG ','sólido','Similar','não controlado','120 comprimidos',64.87);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'AAS','100 MG ','sólido','Similar','não controlado','200 comprimidos',131.01);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ADAPEL','1 MG/G ','semissólido','Similar','não controlado','20  gramas',35.12);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ADAPALENO','1 MG/G ','semissólido','Genérico','não controlado','30  gramas',44.61);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ALBENDAZOL','400 MG ','sólido','Genérico','não controlado','1 comprimidos',6.59);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ALBENDAZOL','400 MG ','sólido','Genérico','não controlado','3 comprimidos',16.99);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'LEMTRADA','10 MG/Ml','líquido','Biológico','não controlado','1 frasco',46178.58);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'MYOZYME','50 MG','sólido','Biológico','não controlado','1 frasco',2454.55);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'NEXVIAZYME','100 MG ','sólido','Biológico','não controlado','1 frasco',5649.65);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELOCTATE','250 UI ','sólido','Biológico','não controlado','3  comprimidos',1072.57);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELOCTATE','500 UI ','sólido','Biológico','não controlado','3  comprimidos',2145.13);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELOCTATE','750 UI ','sólido','Biológico','não controlado','3  comprimidos',3217.72);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELOCTATE','1000 UI','sólido','Biológico','não controlado','3  comprimidos',4290.28);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELOCTATE','1500 UI','sólido','Biológico','não controlado','3  comprimidos',6435.40);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELOCTATE','2000 UI','sólido','Biológico','não controlado','3  comprimidos',8580.56);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELOCTATE','3000 UI','sólido','Biológico','não controlado','3  comprimidos',12870.83);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELPROLIX','250 UI ','sólido','Biológico','não controlado','5  comprimidos',1570.22);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELPROLIX','500 UI ','sólido','Biológico','não controlado','5  comprimidos',3140.48);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELPROLIX','1000 UI','sólido','Biológico','não controlado','5  comprimidos',6280.90);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELPROLIX','2000 UI','sólido','Biológico','não controlado','5  comprimidos',12561.86);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ELPROLIX','3000 UI','sólido','Biológico','não controlado','5  comprimidos',18842.79);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'XENPOZYME','20 MG','sólido','Biológico','não controlado','1 frasco',26396.80);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'THYROGEN','1.1 MG ','sólido','Biológico','não controlado','1 frasco',5819.07);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'PRALUENT','75 MG/Ml','líquido','Biológico','não controlado','1.0 ml',1346.39);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'PRALUENT','75 MG/Ml','líquido','Biológico','não controlado','1.0 ml',2692.79);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'PRALUENT','75 MG/Ml','líquido','Biológico','não controlado','1.0 ml',8078.34);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'PRALUENT','150 MG','líquido','Biológico','não controlado','1.0 ml',1287.56);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'PRALUENT','150 MG','líquido','Biológico','não controlado','1.0 ml',2575.12);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'PRALUENT','150 MG','líquido','Biológico','não controlado','1.0 ml',7725.32);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ALOPURINOL','100 MG ','sólido','Genérico','não controlado','30 comprimidos',8.66);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ALOPURINOL','300 MG ','sólido','Genérico','não controlado','30 comprimidos',25.56);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ALPRAZOLAM','0.5 MG ','sólido','Genérico','não controlado','30 comprimidos',9.80);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ALPRAZOLAM','0.25 MG','sólido','Genérico','não controlado','30 comprimidos',9.60);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ALPRAZOLAM','1 MG CO','sólido','Genérico','não controlado','30 comprimidos',18.27);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'ALPRAZOLAM','2 MG CO','sólido','Genérico','não controlado','30 comprimidos',47.98);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'AMOXICILINA','250 MG/5ml','líquido','Genérico','não controlado','150 ml',36.95);
-- INSERT INTO medicamento (laboratorio_id, nome, dosagem, apresentacao, tipo, controle, quantidade, preco)   VALUES (1,'AMOXICILINA','500 MG/5ml','líquido','Genérico','não controlado','150 ml',50.74);


-- select * from med;
-- select * from med where tipo not in ('Biológico', 'Específico', 'Fitoterápico', 'Genérico', 'Novo', 'Outros', 'Produto de Terapia Avançada', 'Radiofármaco', 'Similar');

-- select apre, 
-- case 
--   when apre ilike '%mg/g%' then 'semissólido'
--   when apre ilike '%u/g%' then 'semissólido'
--   when apre ilike '%pom%' then 'semissólido'
--   when apre ilike '%crem%' then 'semissólido'
--   when apre ilike '%inj%' then 'líquido'
--   when apre ilike '%mcg%' then 'líquido'
--   when apre ilike '%ml%' then 'líquido'
--   else 'sólido'
-- end 
-- from med;
