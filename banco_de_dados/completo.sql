-- Active: 1698656816356@@127.0.0.1@5432@drogasystem@public

-------------------------------------------------------------------------------
-- CRIAÇÃO DA TABELAS
-------------------------------------------------------------------------------

drop table if exists laboratorio cascade;
drop table if exists medicamento cascade;
drop table if exists estoque cascade;
drop table if exists estoque_total cascade;
drop table if exists pessoa cascade;
drop table if exists cliente cascade;
drop table if exists profissional cascade;
drop table if exists venda cascade;
drop table if exists itens_venda cascade;

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
  substancia      varchar(255) not null, 
  dosagem         varchar(255), 
  apresentacao    varchar(255) not null check (apresentacao in ('Sólido', 'Líquido', 'Semissólido')), 
  tipo            varchar(255) not null check (tipo in ('Biológico', 'Específico', 'Fitoterápico', 'Genérico', 'Novo', 'Outros', 'Produto de Terapia Avançada', 'Radiofármaco', 'Similar')), 
  controle        varchar(255) not null check (controle in ('Liberado', 'A2', 'A3', 'B1', 'B2', 'C1', 'C2', 'AM')), 
  quantidade      varchar(255), 
  ggrem           numeric(15) not null unique,
  classe          varchar(255) not null,
  custo           numeric(10, 2) not null,
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
  tipo            varchar(255) not null check (tipo in ('Médico', 'Dentista', 'Veterinário'))
);

create table venda (
  id              serial primary key, 
  time_stamp      timestamp not null default cast(to_char(current_timestamp, 'YYYY-MM-DD HH:MI:SS') as timestamp), 
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



-------------------------------------------------------------------------------
-- POPULAR TABELAS
-------------------------------------------------------------------------------

-- Laboratório: 
insert into laboratorio values 
  (default, 'EMS', 'EMS S/A', '57.507.378/0003-65'), 
  (default, 'TAKEDA', 'TAKEDA PHARMA LTDA.', '60.397.775/0001-74'), 
  (default, 'NOVARTIS', 'NOVARTIS BIOCIENCIAS S.A', '56.994.502/0001-30'), 
  (default, 'PRATI', 'PRATI DONADUZZI & CIA LTDA', '73.856.593/0001-66'), 
  (default, 'ALTHAIA', 'ALTHAIA S.A INDÚSTRIA FARMACÊUTICA', '48.344.725/0007-19'), 
  (default, 'PFIZER', 'LABORATÓRIOS PFIZER LTDA', '46.070.868/0036-99'), 
  (default, 'ACHÉ', 'ACHÉ LABORATÓRIOS FARMACÊUTICOS S.A', '60.659.463/0029-92'), 
  (default, 'ASTRAZENECA', 'ASTRAZENECA DO BRASIL LTDA', '60.318.797/0001-00'), 
  (default, 'BOEHRINGER', 'BOEHRINGER INGELHEIM DO BRASIL QUÍMICA E FARMACÊUTICA LTDA.', '60.831.658/0001-77'), 
  (default, 'EUROFARMA', 'EUROFARMA LABORATÓRIOS S.A.', '61.190.096/0001-92'), 
  (default, 'GLAXOSMITHKLINE', 'GLAXOSMITHKLINE BRASIL LTDA', '33.247.743/0001-10'), 
  (default, 'SANDOZ', 'SANDOZ DO BRASIL INDÚSTRIA FARMACÊUTICA LTDA', '61.286.647/0001-16'), 
  (default, 'TEUTO', 'LABORATÓRIO TEUTO BRASILEIRO S/A', '17.159.229/0001-76'), 
  (default, 'LIBBS', 'LIBBS FARMACÊUTICA LTDA', '61.230.314/0001-75'), 
  (default, 'MERCK', 'MERCK S/A', '33.069.212/0001-84'), 
  (default, 'ORGANON', 'ORGANON FARMACÊUTICA LTDA.', '45.987.013/0001-34'), 
  (default, 'GERMED', 'GERMED FARMACEUTICA LTDA', '45.992.062/0001-65'), 
  (default, 'EMS', 'EMS SIGMA PHARMA LTDA', '00.923.140/0001-31'), 
  (default, 'ABBOTT', 'ABBOTT LABORATÓRIOS DO BRASIL LTDA', '56.998.701/0001-16'), 
  (default, 'PFIZER', 'PFIZER BRASIL LTDA', '61.072.393/0001-33'), 
  (default, 'BLAU', 'BLAU FARMACÊUTICA S.A.', '58.430.828/0001-60'), 
  (default, 'ZYDUS', 'ZYDUS NIKKHO FARMACÊUTICA LTDA', '05.254.971/0001-81'), 
  (default, 'ALLERGAN', 'ALLERGAN PRODUTOS FARMACÊUTICOS LTDA', '43.426.626/0001-77'), 
  (default, 'SANOFI', 'SANOFI MEDLEY FARMACÊUTICA LTDA.', '10.588.595/0010-92'), 
  (default, 'BAYER', 'BAYER S.A.', '18.459.628/0001-15'), 
  (default, 'ROCHE', 'PRODUTOS ROCHE QUÍMICOS E FARMACÊUTICOS S.A.', '33.009.945/0001-23'), 
  (default, 'JANSSEN-CILAG', 'JANSSEN-CILAG FARMACÊUTICA LTDA', '51.780.468/0001-87'), 
  (default, 'BIOLAB', 'BIOLAB SANUS FARMACÊUTICA LTDA', '49.475.833/0001-06'), 
  (default, 'BAGÓ', 'LABORATÓRIOS BAGÓ DO BRASIL S/A', '04.748.181/0009-47'), 
  (default, 'APSEN', 'APSEN FARMACEUTICA S/A', '62.462.015/0001-29'), 
  (default, 'RANBAXY', 'RANBAXY FARMACÊUTICA LTDA', '73.663.650/0001-90'), 
  (default, 'GLENMARK', 'GLENMARK FARMACÊUTICA LTDA', '44.363.661/0001-57'), 
  (default, 'NOVA', 'NOVA QUIMICA FARMACÊUTICA S/A', '72.593.791/0001-11'), 
  (default, 'UNIÃO', 'UNIÃO QUÍMICA FARMACÊUTICA NACIONAL S/A', '60.665.981/0001-18'), 
  (default, 'LEGRAND', 'LEGRAND PHARMA INDÚSTRIA FARMACÊUTICA LTDA', '05.044.984/0001-26'), 
  (default, 'BRAINFARMA', 'BRAINFARMA INDÚSTRIA QUÍMICA E FARMACÊUTICA S.A', '05.161.069/0001-10'), 
  (default, 'NOVO', 'NOVO NORDISK FARMACÊUTICA DO BRASIL LTDA', '82.277.955/0001-55'), 
  (default, 'CHIESI', 'CHIESI FARMACÊUTICA LTDA', '61.363.032/0001-46'), 
  (default, 'MYRALIS', 'MYRALIS INDÚSTRIA FARMACÊUTICA LTDA', '17.440.261/0001-25'), 
  (default, 'ZAMBON', 'ZAMBON LABORATÓRIOS FARMACÊUTICOS LTDA.', '61.100.004/0001-36'), 
  (default, 'GRÜNENTHAL', 'GRÜNENTHAL DO BRASIL FARMACÊUTICA LTDA.', '10.555.143/0001-13'), 
  (default, 'THERASKIN', 'THERASKIN FARMACEUTICA LTDA.', '61.517.397/0001-88'), 
  (default, 'FARMOQUÍMICA', 'FARMOQUÍMICA S/A', '33.349.473/0001-58'), 
  (default, 'CIFARMA', 'CIFARMA CIENTÍFICA FARMACÊUTICA LTDA', '17.562.075/0001-69'), 
  (default, 'MERCK', 'MERCK SHARP & DOHME FARMACEUTICA LTDA.', '03.560.974/0001-18'), 
  (default, 'AUROBINDO', 'AUROBINDO PHARMA INDÚSTRIA FARMACÊUTICA LIMITADA', '04.301.884/0001-75'), 
  (default, 'CAZI', 'CAZI QUIMICA FARMACEUTICA INDUSTRIA E COMERCIO LTDA', '44.010.437/0001-81'), 
  (default, 'ARESE', 'ARESE PHARMA LTDA', '07.670.111/0001-54'), 
  (default, 'MARJAN', 'MARJAN INDÚSTRIA E COMÉRCIO LTDA', '60.726.692/0001-81'), 
  (default, 'CIMED', 'CIMED INDUSTRIA S.A', '02.814.497/0001-07'), 
  (default, 'RECKITT', 'RECKITT BENCKISER (BRASIL) LTDA', '59.557.124/0001-15'), 
  (default, 'ASPEN', 'ASPEN PHARMA INDÚSTRIA FARMACÊUTICA LTDA', '02.433.631/0001-20'), 
  (default, 'PROCTER', 'PROCTER & GAMBLE DO BRASIL LTDA', '59.476.770/0001-58'), 
  (default, 'KLEY', 'KLEY HERTZ FARMACEUTICA S.A', '92.695.691/0001-03');

-- medicamento
insert into medicamento values 
  (default, '1', 'AMPICILINA', 'AMPICILINA', '50 MG/ML', 'Líquido', 'Genérico', 'AM', '150 ML', '507701907133117', 'PENICILINAS ORAIS DE AMPLO ESPECTRO', '53.61', '74.11'), 
  (default, '2', 'NESINA MET', 'BENZOATO DE ALOGLIPTINA;CLORIDRATO DE METFORMINA', '(12,5 + 1000,0) MG', 'Sólido', 'Novo', 'Liberado', '60', '501115110025705', 'ASSOCIAÇÕES DE INIBIDORES DPP-IV COM BIGUANIDAS', '228.0', '303.77'), 
  (default, '3', 'TEGRETOL', 'CARBAMAZEPINA', '200 MG', 'Sólido', 'Novo', 'C1', '60', '526515003110311', 'ANTIEPILÉPTICOS', '64.54', '89.22'), 
  (default, '4', 'TRELIM', 'CLORIDRATO DE SERTRALINA', '100 MG', 'Sólido', 'Similar', 'C1', '60', '528519120163307', 'ANTIDEPRESSIVOS SSRI', '290.24', '401.24'), 
  (default, '5', 'ZETERINA', 'EZETIMIBA', '10 MG', 'Sólido', 'Similar', 'Liberado', '60', '543817070024603', 'TODOS OUTROS REGULADORES DE COLESTEROL E TRIGLICERÍDEOS', '200.62', '277.35'), 
  (default, '6', 'CITALOR', 'ATORVASTATINA CÁLCICA', '10 MG', 'Sólido', 'Novo', 'Liberado', '60', '552820050068217', 'ESTATINAS, INIBIDORES DA REDUTASE HMG-CoA', '199.18', '275.35'), 
  (default, '7', 'TREZOR', 'ROSUVASTATINA CÁLCICA', '20 MG', 'Sólido', 'Similar', 'Liberado', '30', '500512070043204', 'ESTATINAS, INIBIDORES DA REDUTASE HMG-CoA', '285.95', '395.31'), 
  (default, '2', 'NESINA', 'BENZOATO DE ALOGLIPTINA', '12,5 MG', 'Sólido', 'Novo', 'Liberado', '30', '501114030022102', 'ANTIDIABÉTICOS INIBIDORES DPP-IV  PUROS', '115.54', '153.93'), 
  (default, '2', 'NESINA PIO', 'BENZOATO DE ALOGLIPTINA;CLORIDRATO DE PIOGLITAZONA', '(25,0 + 15,0) MG', 'Sólido', 'Novo', 'Liberado', '30', '501116070027205', 'OUTRAS ASSOCIAÇÕES DE ANTIDIABÉTICOS COM INIBIDORES DPP-IV', '226.4', '301.63'), 
  (default, '8', 'ATACAND', 'CANDESARTANA CILEXETILA', '8 MG', 'Sólido', 'Novo', 'Liberado', '30', '502300304119219', 'ANTAGONISTAS DA ANGIOTENSINA II PUROS', '143.43', '198.28'), 
  (default, '8', 'SELOZOK', 'SUCCINATO DE METOPROLOL', '100 MG', 'Sólido', 'Novo', 'Liberado', '30', '502303604113318', 'BETABLOQUEADORES PUROS', '91.84', '126.96'), 
  (default, '9', 'MICARDIS ANLO', 'BESILATO DE ANLODIPINO;TELMISARTANA', '80MG', 'Sólido', 'Novo', 'Liberado', '30', '504505606113315', 'ANTAGONISTAS DA ANGIOTENSINA II ASSOCIADOS A ANTAGONISTAS DO CÁLCIO', '121.26', '161.56'), 
  (default, '10', 'DUOMO HP', 'MESILATO DE DOXAZOSINA;FINASTERIDA', '(2,0 + 5,0) MG', 'Sólido', 'Novo', 'Liberado', '30', '508013050096805', 'BPH COMBINAÇÕES DE ALFA-ANTAGONISTAS E INIBIDORES DA 5-ALFA TESTOSTERONA REDUTASE', '117.14', '156.07'), 
  (default, '10', 'HOMINUS', 'MESILATO DE DOXAZOSINA;FINASTERIDA', '(2,0 + 5,0) MG', 'Sólido', 'Similar', 'Liberado', '30', '508022050161517', 'BPH COMBINAÇÕES DE ALFA-ANTAGONISTAS E INIBIDORES DA 5-ALFA TESTOSTERONA REDUTASE', '117.14', '156.07'), 
  (default, '11', 'WELLBUTRIN', 'CLORIDRATO DE BUPROPIONA', '150 MG', 'Sólido', 'Novo', 'C1', '30', '510608601119319', 'ANTIDEPRESSIVOS TODOS OS OUTROS', '172.49', '238.46'), 
  (default, '12', 'AMOXICILINA + CLAVULANATO DE POTÁSSIO', 'CLAVULANATO DE POTÁSSIO;AMOXICILINA TRI-HIDRATADA', '(500+125) MG', 'Sólido', 'Genérico', 'AM', '30', '511519040070506', 'PENICILINAS ORAIS DE AMPLO ESPECTRO', '134.32', '185.69'), 
  (default, '13', 'CARBIDOL', 'CARBIDOPA (PORT. 344/98 LISTA C 1);LEVODOPA', '25 MG', 'Sólido', 'Similar', 'C1', '30', '520715080095203', 'ANTIPARKINSONIANOS', '60.32', '83.39'), 
  (default, '14', 'CEBRALAT', 'CILOSTAZOL', '100 MG', 'Sólido', 'Novo', 'Liberado', '30', '523700901117313', 'INIBIDORES DA AGREGAÇÃO PLAQUETÁRIA, REALÇADORES DO AMP CÍCLICO', '51.66', '71.42'), 
  (default, '15', 'CONCOR ANLO', 'BESILATO DE ANLODIPINO;HEMIFUMARATO DE BISOPROLOL', '(5,0 + 10,0) MG', 'Sólido', 'Novo', 'Liberado', '30', '525421020052205', 'ANTAGONISTAS DO CÁLCIO ASSOCIADOS A BETABLOQUEADORES', '78.67', '104.81'), 
  (default, '16', 'EZETROL', 'EZETIMIBA', '10 MG', 'Sólido', 'Novo', 'Liberado', '30', '525500902116319', 'TODOS OUTROS REGULADORES DE COLESTEROL E TRIGLICERÍDEOS', '157.68', '217.98'), 
  (default, '17', 'ACICLOVIR', 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Liberado', '30', '526120040110107', 'ANTIVIRAIS PARA HERPES', '227.68', '314.75'), 
  (default, '4', 'MYLETIN', 'CLORIDRATO DE VENLAFAXINA', '75 MG', 'Sólido', 'Similar', 'C1', '30', '528521030180203', 'ANTIDEPRESSIVOS SNRI', '216.99', '299.98'), 
  (default, '18', 'PATZ SL', 'HEMITARTARATO DE ZOLPIDEM', '10 MG', 'Sólido', 'Novo', 'C1', '30', '531621110094703', 'HIPNÓTICOS E SEDATIVOS NÃO BARBITÚRICOS PUROS', '231.45', '319.97'), 
  (default, '1', 'ANTIVIRAX', 'ACICLOVIR', '400 MG', 'Sólido', 'Similar', 'Liberado', '30', '541820110152707', 'ANTIVIRAIS PARA HERPES', '209.29', '289.33'), 
  (default, '10', 'ÉSIO', 'ESOMEPRAZOL MAGNÉSICO', '40 MG', 'Sólido', 'Similar', 'Liberado', '28', '508017100120204', 'INIBIDORES DA BOMBA DE PRÓTONS', '223.62', '309.14'), 
  (default, '10', 'CLORIDRATO DE VENLAFAXINA', 'CLORIDRATO DE VENLAFAXINA', '150 MG', 'Sólido', 'Genérico', 'C1', '28', '508020604111114', 'ANTIDEPRESSIVOS SNRI', '232.49', '321.4'), 
  (default, '13', 'PYLORITRAT', 'LANSOPRAZOL;AMOXICILINA TRI-HIDRATADA;CLARITROMICINA', '30 MG', 'Sólido', 'Similar', 'AM', '14 + 14 + 28', '520721702119411', 'INIBIDORES DA BOMBA DE PRÓTONS', '246.9', '341.32'), 
  (default, '15', 'CONCOR', 'HEMIFUMARATO DE BISOPROLOL', '5 MG', 'Sólido', 'Novo', 'Liberado', '28', '525403008112414', 'BETABLOQUEADORES PUROS', '115.3', '159.4'), 
  (default, '17', 'ESOMEPRAZOL MAGNÉSICO TRI-HIDRATADO', 'ESOMEPRAZOL MAGNÉSICO', '40 MG', 'Sólido', 'Genérico', 'Liberado', '28', '526113010088506', 'INIBIDORES DA BOMBA DE PRÓTONS', '223.62', '309.14'), 
  (default, '3', 'DIOVAN', 'VALSARTANA', '160 MG', 'Sólido', 'Novo', 'Liberado', '28', '526504804117319', 'ANTAGONISTAS DA ANGIOTENSINA II PUROS', '99.59', '137.68'), 
  (default, '1', 'GAUDY', 'BROMIDRATO DE GALANTAMINA', '8 MG', 'Sólido', 'Similar', 'C1', '28', '541819110111507', 'PRODUTOS ANTIALZHEIMER, INIBIDORES DA COLINESTERASE', '285.32', '394.44'), 
  (default, '1', 'CLABAT', 'CLARITROMICINA', '500 MG', 'Sólido', 'Similar', 'AM', '28', '541820030123307', 'MACROLIDEOS E SIMILARES', '220.21', '304.43'), 
  (default, '7', 'CADENZA', 'CANDESARTANA CILEXETILA', '32 MG', 'Sólido', 'Similar', 'Liberado', '20', '500516020062804', 'ANTAGONISTAS DA ANGIOTENSINA II PUROS', '169.85', '234.81'), 
  (default, '17', 'EUTYMIA XL', 'CLORIDRATO DE BUPROPIONA', '300 MG', 'Sólido', 'Similar', 'C1', '20', '526121010132207', 'ANTIDEPRESSIVOS TODOS OS OUTROS', '237.59', '328.45'), 
  (default, '7', 'NOVAMOX', 'AMOXICILINA TRIHIDRATADA;CLAVULANATO DE POTÁSSIO', '875 MG', 'Sólido', 'Similar', 'AM', '14', '500505705119417', 'PENICILINAS ORAIS DE AMPLO ESPECTRO', '176.85', '244.48'), 
  (default, '12', 'ZINNAT', 'AXETIL CEFUROXIMA', '500 MG', 'Sólido', 'Novo', 'AM', '14', '511522100077417', 'CEFALOSPORINAS ORAIS', '236.13', '326.44'), 
  (default, '6', 'EFEXOR', 'CLORIDRATO DE VENLAFAXINA', '150 MG', 'Sólido', 'Novo', 'C1', '14', '552820050064917', 'ANTIDEPRESSIVOS SNRI', '198.54', '274.47'), 
  (default, '7', 'MEFEX', 'AXETILCEFUROXIMA', '250 MG', 'Sólido', 'Similar', 'AM', '14', '552919120097907', 'CEFALOSPORINAS ORAIS', '158.18', '218.67'), 
  (default, '1', 'POLICLAVUMOXIL BD', 'CLAVULANATO DE POTÁSSIO;AMOXICILINA TRI-HIDRATADA', '875 MG', 'Sólido', 'Similar', 'AM', '12', '507720303116418', 'PENICILINAS ORAIS DE AMPLO ESPECTRO', '174.24', '240.88'), 
  (default, '10', 'AMPICILINA', 'AMPICILINA ANIDRA', '500 MG', 'Sólido', 'Genérico', 'AM', '12', '508017801114116', 'PENICILINAS ORAIS DE AMPLO ESPECTRO', '25.67', '35.49'), 
  (default, '19', 'KLARICID', 'CLARITROMICINA', '500 MG', 'Sólido', 'Novo', 'AM', '10', '500204501115319', 'MACROLIDEOS E SIMILARES', '188.09', '260.02'), 
  (default, '20', 'ZITROMAX', 'AZITROMICINA DI-HIDRATADA', '500 MG', 'Sólido', 'Novo', 'AM', '9', '522717080057017', 'MACROLIDEOS E SIMILARES', '115.73', '159.99'), 
  (default, '21', 'CILINON', 'AMPICILINA SÓDICA', '500MG', 'Líquido', 'Similar', 'AM', '5 ML', '504414010047318', 'PENICILINAS INJETAVEIS DE AMPLO ESPECTRO', '4.99', '6.9'), 
  (default, '11', 'ZOVIRAX', 'ACICLOVIR', '0,03 G/G', 'Semissólido', 'Novo', 'Liberado', '4,5 G', '510609305165318', 'ANTIVIRAIS OFTALMOLÓGICOS', '94.56', '130.72'), 
  (default, '22', 'TRANSAMIN', 'ÁCIDO TRANEXÂMICO', '50 MG/ML', 'Líquido', 'Novo', 'Liberado', '5 ML', '536214070005414', 'ANTIFIBRINOLÍTICOS SINTÉTICOS', '51.05', '68.01'), 
  (default, '23', 'GANFORT', 'MALEATO ÁCIDO DE TIMOLOL;BIMATOPROSTA', '(0,3 + 5,0) MG/ML', 'Líquido', 'Novo', 'Liberado', '0,4 ML', '501018100013703', 'PREPARAÇÕES ANTIGLAUCOMAS E MIÓTICAS TÓPICAS', '150.04', '207.42'), 
  (default, '24', 'PYLORIPAC', 'LANSOPRAZOL;AMOXICILINA TRI-HIDRATADA;CLARITROMICINA', '30 MG', 'Sólido', 'Novo', 'AM', '2+2+4', '525010901113419', 'INIBIDORES DA BOMBA DE PRÓTONS', '179.01', '247.47'), 
  (default, '25', 'CIPRO', 'CIPROFLOXACINO;CLORIDRATO DE CIPROFLOXACINO', '1000 MG', 'Sólido', 'Novo', 'AM', '3', '538915100024517', 'FLUORQUINOLONAS ORAIS', '138.4', '191.33'), 
  (default, '26', 'ROCEFIN', 'CEFTRIAXONA DISSÓDICA HEMIEPTAIDRATADA', '500 MG', 'Líquido', 'Novo', 'AM', '2 ML', '529205103154310', 'CEFALOSPORINAS INJETÁVEIS', '102.3', '141.42'), 
  (default, '11', 'CLAVULIN', 'CLAVULANATO DE POTÁSSIO;AMOXICILINA TRI-HIDRATADA', '(120 + 8,58) MG/ML', 'Líquido', 'Novo', 'AM', '100 ML+ SER DOS', '510602006138311', 'PENICILINAS ORAIS DE AMPLO ESPECTRO', '215.54', '297.97'), 
  (default, '11', 'AMOXIL', 'AMOXICILINA', '125 MG', 'Líquido', 'Novo', 'AM', '150 ML', '510613020049703', 'PENICILINAS ORAIS DE AMPLO ESPECTRO', '51.74', '71.53'), 
  (default, '27', 'MOTILIUM', 'DOMPERIDONA', '10 MG', 'Sólido', 'Novo', 'Liberado', '90', '514512020024803', 'GASTROPROCINÉTICOS', '64.36', '85.75'), 
  (default, '19', 'BETASERC', 'CLORIDRATO DE BETAISTINA', '24 MG', 'Sólido', 'Novo', 'Liberado', '60', '500214100032717', 'ANTIVERTIGINOSOS', '88.95', '118.51'), 
  (default, '28', 'LIPLESS', 'CIPROFIBRATO', '100 MG', 'Sólido', 'Similar', 'Liberado', '60', '504112070050503', 'FIBRATOS', '180.78', '249.92'), 
  (default, '28', 'ABLOK PLUS', 'ATENOLOL;CLORTALIDONA', '100 MG', 'Sólido', 'Similar', 'Liberado', '60', '504114020051403', 'BETABLOQUEADORES ASSOCIADOS COM ANTIHIPERTENSIVOS E/OU DIURÉTICOS', '105.39', '145.7'), 
  (default, '1', 'RESTITUE', 'PANTOPRAZOL MAGNÉSICO DI-HIDRATADO', '40 MG', 'Sólido', 'Similar', 'Liberado', '60', '541820020117807', 'INIBIDORES DA BOMBA DE PRÓTONS', '321.1', '427.8'), 
  (default, '6', 'NORVASC', 'BESILATO DE ANLODIPINO', '5 MG', 'Sólido', 'Novo', 'Liberado', '60', '552820020063317', 'ANTAGONISTAS DA ANGIOTENSINA II PUROS', '105.63', '146.03'), 
  (default, '19', 'LIPIDIL', 'FENOFIBRATO', '200 MG', 'Semissólido', 'Novo', 'Liberado', '30', '500214090032217', 'FIBRATOS', '133.4', '184.42'), 
  (default, '7', 'BETALOR', 'ATENOLOL;BESILATO DE ANLODIPINO', '5 MG', 'Sólido', 'Novo', 'Liberado', '30', '552919120092317', 'ANTAGONISTAS DO CÁLCIO ASSOCIADOS A BETABLOQUEADORES', '68.7', '94.97'), 
  (default, '7', 'LOTAR', 'LOSARTANA POTÁSSICA;BESILATO DE ANLODIPINO', '5,0 MG', 'Sólido', 'Novo', 'Liberado', '30', '552919120100717', 'ANTAGONISTAS DA ANGIOTENSINA II ASSOCIADOS A ANTAGONISTAS DO CÁLCIO', '121.63', '168.15'), 
  (default, '24', 'AMARYL', 'GLIMEPIRIDA', '4 MG', 'Sólido', 'Novo', 'Liberado', '30', '576720060073817', 'ANTIDIABÉTICOS SULFONILOURÉIAS PUROS', '91.8', '126.91'), 
  (default, '1', 'ESOGASTRO IBP', 'AMOXICILINA TRIHIDRATADA;ESOMEPRAZOL MAGNÉSICO TRI-HIDRATADO;CLARITROMICINA', '500 MG', 'Sólido', 'Novo', 'AM', '28 +14 + 28', '541821070163303', 'INIBIDORES DA BOMBA DE PRÓTONS', '217.11', '289.26'), 
  (default, '11', 'AMOXIL', 'AMOXICILINA TRIHIDRATADA', '500 MG', 'Semissólido', 'Novo', 'AM', '21', '510600606111310', 'PENICILINAS ORAIS DE AMPLO ESPECTRO', '81.79', '113.07'), 
  (default, '27', 'ULTRACET', 'CLORIDRATO DE TRAMADOL;PARACETAMOL', '37,5 MG', 'Sólido', 'Novo', 'A2', '20', '514505502110314', 'ANALGÉSICOS NARCÓTICOS', '95.79', '127.62'), 
  (default, '24', 'PROFENID', 'CETOPROFENO', '100 MG', 'Sólido', 'Novo', 'Liberado', '20', '576720050065917', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '55.85', '77.21'), 
  (default, '20', 'ALDACTONE', 'ESPIRONOLACTONA', '100 MG', 'Sólido', 'Novo', 'Liberado', '16', '522717110064717', 'AGENTES DIURÉTICOS POUPADORES POTÁSSIO PUROS', '36.33', '50.22'), 
  (default, '6', 'CARDURAN', 'MESILATO DE DOXAZOSINA', '4 MG', 'Sólido', 'Novo', 'Liberado', '10', '552820060069417', 'ANTI-HIPERTENSIVOS PURO-AÇÃO PERIFÉRICA', '90.13', '124.6'), 
  (default, '29', 'KEFLEX', 'CEFALEXINA MONOIDRATADA', '1 G', 'Sólido', 'Novo', 'AM', '8', '536501506112319', 'CEFALOSPORINAS ORAIS', '107.59', '148.74'), 
  (default, '10', 'TAMIRAM', 'LEVOFLOXACINO HEMI-HIDRATADO', '750 MG', 'Sólido', 'Novo', 'AM', '7', '508016100113003', 'FLUORQUINOLONAS ORAIS', '123.41', '170.61'), 
  (default, '14', 'SUMAX', 'SUCCINATO DE SUMATRIPTANA', '50 MG', 'Sólido', 'Similar', 'Liberado', '6', '523723050050203', 'ANTIENXAQUECOSOS TRIPTÂNICOS', '85.84', '118.67'), 
  (default, '8', 'PULMICORT', 'BUDESONIDA', '0,25 MG/ML', 'Líquido', 'Novo', 'Liberado', '2 ML', '502303101170311', 'ANTIASMÁTICOS/DPOC CORTICOSTERÓIDES INALANTES', '158.76', '219.48'), 
  (default, '11', 'ZENTEL', 'ALBENDAZOL', '400 MG', 'Sólido', 'Novo', 'Liberado', '1', '510608803110312', 'ANTI-HELMÍNTICOS EXCETO ESQUISTOSSOMICIDAS (P1C)', '13.2', '18.25'), 
  (default, '24', 'DIGESAN', 'BROMOPRIDA', '1 MG/ML', 'Líquido', 'Novo', 'Liberado', '120 ML + COP', '576720060073017', 'GASTROPROCINÉTICOS', '37.78', '50.33'), 
  (default, '28', 'FLUX SR', 'INDAPAMIDA', '1,5 MG', 'Sólido', 'Similar', 'Liberado', '90', '504123050084503', 'DIURÉTICOS TIAZIDAS E ANÁLOGOS PUROS', '74.09', '102.43'), 
  (default, '30', 'DUEPOLI', 'DIVALPROATO DE SÓDIO', '500 MG', 'Sólido', 'Similar', 'C1', '60', '501623090045104', 'ANTIEPILÉPTICOS', '200.98', '277.84'), 
  (default, '12', 'CANDESARTANA CILEXETILA', 'CANDESARTANA CILEXETILA', '16 MG', 'Sólido', 'Genérico', 'Liberado', '60', '511518010065506', 'ANTAGONISTAS DA ANGIOTENSINA II PUROS', '107.59', '148.74'), 
  (default, '24', 'VALSARTANA', 'VALSARTANA', '160 MG', 'Sólido', 'Genérico', 'Liberado', '60', '525073104113111', 'ANTAGONISTAS DA ANGIOTENSINA II PUROS', '171.56', '237.17'), 
  (default, '17', 'DIVALPROATO DE SÓDIO', 'DIVALPROATO DE SÓDIO', '500 MG', 'Sólido', 'Genérico', 'C1', '60', '526120020106407', 'ANTIEPILÉPTICOS', '135.68', '187.57'), 
  (default, '17', 'OLMESARTANA MEDOXOMILA+BESILATO DE ANLODIPINO', 'BESILATO DE ANLODIPINO;OLMESARTANA MEDOXOMILA', '40 MG', 'Sólido', 'Genérico', 'Liberado', '60', '526122100166306', 'ANTAGONISTAS DA ANGIOTENSINA II ASSOCIADOS A ANTAGONISTAS DO CÁLCIO', '91.15', '126.01'), 
  (default, '4', 'CLORIDRATO DE SERTRALINA', 'CLORIDRATO DE SERTRALINA', '50 MG', 'Sólido', 'Genérico', 'C1', '60', '528518110142706', 'ANTIDEPRESSIVOS SSRI', '171.49', '237.07'), 
  (default, '18', 'OLMY ANLO', 'BESILATO DE ANLODIPINO;OLMESARTANA MEDOXOMILA', '40 MG', 'Sólido', 'Similar', 'Liberado', '60', '531623100099103', 'ANTAGONISTAS DA ANGIOTENSINA II ASSOCIADOS A ANTAGONISTAS DO CÁLCIO', '140.15', '193.75'), 
  (default, '5', 'EZETIMIBA', 'EZETIMIBA', '10 MG', 'Sólido', 'Genérico', 'Liberado', '60', '543815120014606', 'TODOS OUTROS REGULADORES DE COLESTEROL E TRIGLICERÍDEOS', '204.82', '283.15'), 
  (default, '19', 'VODSSO', 'VALPROATO DE SÓDIO', '500 MG', 'Sólido', 'Similar', 'C1', '50', '500217030036203', 'ANTIEPILÉPTICOS', '67.72', '93.62'), 
  (default, '9', 'CARDIZEM', 'CLORIDRATO DE DILTIAZEM', '60 MG', 'Sólido', 'Novo', 'Liberado', '50', '504501203111311', 'ANTAGONISTAS DO CÁLCIO PUROS', '53.8', '74.38'), 
  (default, '31', 'CLORIDRATO DE DILTIAZEM', 'CLORIDRATO DE DILTIAZEM', '60 MG', 'Sólido', 'Genérico', 'Liberado', '50', '529921110076806', 'ANTAGONISTAS DO CÁLCIO PUROS', '34.96', '48.33'), 
  (default, '19', 'DEPAKOTE', 'DIVALPROATO DE SÓDIO', '500 MG', 'Sólido', 'Novo', 'C1', '30', '500202504117316', 'ANTIEPILÉPTICOS', '104.38', '144.3'), 
  (default, '7', 'EXODUS', 'OXALATO DE ESCITALOPRAM', '10 MG', 'Sólido', 'Similar', 'C1', '30', '500513202112413', 'ANTIDEPRESSIVOS SSRI', '282.46', '390.48'), 
  (default, '8', 'VIVACOR', 'ROSUVASTATINA', '20 MG', 'Sólido', 'Novo', 'Liberado', '30', '502305404111210', 'ESTATINAS, INIBIDORES DA REDUTASE HMG-CoA', '119.4', '165.06'), 
  (default, '10', 'ESC ODT', 'OXALATO DE ESCITALOPRAM', '20 MG', 'Sólido', 'Novo', 'C1', '30', '508021080141803', 'ANTIDEPRESSIVOS SSRI', '174.12', '240.71'), 
  (default, '27', 'HALDOL', 'HALOPERIDOL', '2 MG/ML', 'Líquido', 'Novo', 'C1', '30 ML', '514501206134317', 'ANTIPSICÓTICOS CONVENCIONAIS', '13.54', '18.72'), 
  (default, '13', 'BROMIDRATO DE CITALOPRAM', 'BROMIDRATO DE CITALOPRAM', '20 MG', 'Sólido', 'Genérico', 'C1', '30', '520715090095906', 'ANTIDEPRESSIVOS SSRI', '183.83', '254.13'), 
  (default, '32', 'DERIVA C MICRO', 'ADAPALENO;FOSFATO DE CLINDAMICINA', '(1,00 + 10,00) MG/G', 'Semissólido', 'Novo', 'Liberado', '30 G', '521905701172313', 'ANTIACNEICOS TÓPICOS', '36.21', '48.24'), 
  (default, '15', 'HEMIFUMARATO DE BISOPROLOL', 'HEMIFUMARATO DE BISOPROLOL', '2,5 MG', 'Sólido', 'Genérico', 'Liberado', '30', '525417090048906', 'BETABLOQUEADORES PUROS', '91.51', '126.51'), 
  (default, '17', 'ZOLREM SL', 'HEMITARTARATO DE ZOLPIDEM', '10 MG', 'Sólido', 'Similar', 'C1', '30', '526122010146903', 'HIPNÓTICOS E SEDATIVOS NÃO BARBITÚRICOS PUROS', '231.45', '319.97'), 
  (default, '17', 'CLORIDRATO DE BUPROPIONA', 'CLORIDRATO DE BUPROPIONA', '300 MG', 'Sólido', 'Genérico', 'C1', '30', '526123070170106', 'ANTIDEPRESSIVOS TODOS OS OUTROS', '231.68', '320.28'), 
  (default, '4', 'NYPRAM', 'BROMIDRATO DE CITALOPRAM', '20 MG', 'Sólido', 'Similar', 'C1', '30', '528520050171907', 'ANTIDEPRESSIVOS SSRI', '183.76', '254.04'), 
  (default, '31', 'HEMITARTARATO DE RIVASTIGMINA', 'HEMITARTARATO DE RIVASTIGMINA', '6 MG', 'Sólido', 'Genérico', 'C1', '30', '529920110069507', 'PRODUTOS ANTIALZHEIMER, INIBIDORES DA COLINESTERASE', '206.41', '285.35'), 
  (default, '18', 'BRASART BCC', 'VALSARTANA', '320 MG', 'Sólido', 'Similar', 'Liberado', '30', '531614040073704', 'ANTAGONISTAS DA ANGIOTENSINA II ASSOCIADOS A ANTAGONISTAS DO CÁLCIO', '169.3', '234.05'), 
  (default, '1', 'OXALATO DE ESCITALOPRAM', 'OXALATO DE ESCITALOPRAM', '15 MG', 'Sólido', 'Genérico', 'C1', '30', '541814050007906', 'ANTIDEPRESSIVOS SSRI', '220.29', '304.54'), 
  (default, '1', 'ESOMEPRAZOL MAGNÉSICO TRI-HIDRATADO', 'ESOMEPRAZOL MAGNÉSICO TRI-HIDRATADO', '40 MG', 'Sólido', 'Genérico', 'Liberado', '30', '541822030178606', 'INIBIDORES DA BOMBA DE PRÓTONS', '239.6', '331.23'), 
  (default, '1', 'ESMOG', 'ESOMEPRAZOL MAGNÉSICO TRI-HIDRATADO', '40 MG', 'Sólido', 'Similar', 'Liberado', '30', '541822030180003', 'INIBIDORES DA BOMBA DE PRÓTONS', '239.61', '331.25'), 
  (default, '7', 'TOLREST', 'CLORIDRATO DE SERTRALINA', '25 MG', 'Sólido', 'Novo', 'C1', '30', '552919120096717', 'ANTIDEPRESSIVOS SSRI', '136.35', '188.5'), 
  (default, '7', 'VASOGARD', 'CILOSTAZOL', '100 MG', 'Sólido', 'Similar', 'Liberado', '30', '552920020118817', 'INIBIDORES DA AGREGAÇÃO PLAQUETÁRIA, REALÇADORES DO AMP CÍCLICO', '85.95', '118.82'), 
  (default, '7', 'FORMOCAPS', 'FUMARATO DE FORMOTEROL', '12 MCG', 'Sólido', 'Similar', 'Liberado', '30', '552920110134317', 'ANTIASMÁTICOS/DPOC AGONISTAS B2 LONGA AÇÃO INALANTE', '47.65', '65.87'), 
  (default, '8', 'NEXIUM', 'ESOMEPRAZOL MAGNÉSICO TRI-HIDRATADO', '20 MG', 'Sólido', 'Novo', 'Liberado', '28', '502302705110219', 'INIBIDORES DA BOMBA DE PRÓTONS', '164.62', '227.58'), 
  (default, '33', 'BROMIDRATO DE GALANTAMINA', 'BROMIDRATO DE GALANTAMINA', '8 MG', 'Sólido', 'Genérico', 'C1', '28', '525317060047906', 'PRODUTOS ANTIALZHEIMER, INIBIDORES DA COLINESTERASE', '285.32', '394.44'), 
  (default, '33', 'LAFLUGI', 'LANSOPRAZOL', '15 MG', 'Semissólido', 'Similar', 'Liberado', '28', '525319030058703', 'INIBIDORES DA BOMBA DE PRÓTONS', '98.78', '136.56'), 
  (default, '7', 'MAXAPRAN', 'CITALOPRAM', '20 MG', 'Sólido', 'Similar', 'C1', '28', '552919120089617', 'ANTIDEPRESSIVOS SSRI', '152.54', '210.88'), 
  (default, '7', 'CITALOPRAM', 'CITALOPRAM', '20 MG', 'Sólido', 'Genérico', 'C1', '28', '552919120093017', 'ANTIDEPRESSIVOS SSRI', '115.77', '160.05'), 
  (default, '19', 'DEPAKENE', 'ÁCIDO VALPRÓICO', '250 MG', 'Semissólido', 'Novo', 'C1', '25', '500202401113318', 'ANTIEPILÉPTICOS', '23.6', '32.63'), 
  (default, '19', 'DEPAKENE', 'VALPROATO DE SÓDIO', '300 MG', 'Sólido', 'Novo', 'C1', '25', '500202402111319', 'ANTIEPILÉPTICOS', '28.62', '39.57'), 
  (default, '19', 'VALPROATO DE SÓDIO', 'ÁCIDO VALPRÓICO;VALPROATO DE SÓDIO', '250 MG', 'Semissólido', 'Genérico', 'C1', '25', '500218040040206', 'ANTIEPILÉPTICOS', '14.13', '19.53'), 
  (default, '28', 'EPILENIL', 'ÁCIDO VALPRÓICO', '250 MG', 'Semissólido', 'Similar', 'C1', '25', '504102601113414', 'ANTIEPILÉPTICOS', '21.09', '29.16'), 
  (default, '13', 'ASMOFEN', 'FUMARATO DE CETOTIFENO', '0,2MG/ML', 'Líquido', 'Similar', 'Liberado', '120ML + COP', '520712090083703', 'ANTIASMÁTICOS/DPOC ANTIINFLAMATORIOS NÃO ESTEROIDAIS RESPIRATÓRIOS SISTÊMICOS', '32.29', '44.64'), 
  (default, '31', 'AXETILCEFUROXIMA', 'AXETILCEFUROXIMA', '500 MG', 'Sólido', 'Genérico', 'AM', '20', '529920080067207', 'CEFALOSPORINAS ORAIS', '197.46', '272.98'), 
  (default, '34', 'HALOPERIDOL', 'HALOPERIDOL', '2 MG/ML', 'Líquido', 'Genérico', 'C1', '20 ML', '533006801135114', 'ANTIPSICÓTICOS CONVENCIONAIS', '5.6', '7.74'), 
  (default, '34', 'UNI HALOPER', 'HALOPERIDOL', '2 MG/ML', 'Líquido', 'Similar', 'C1', '20 ML', '533015110062303', 'ANTIPSICÓTICOS CONVENCIONAIS', '5.6', '7.74'), 
  (default, '1', 'CARBAMAZEPINA', 'CARBAMAZEPINA', '400 MG', 'Sólido', 'Genérico', 'C1', '20', '541815030010406', 'ANTIEPILÉPTICOS', '29.35', '40.57'), 
  (default, '1', 'BEXAI', 'DICLOFENACO', '35 MG', 'Sólido', 'Novo', 'Liberado', '20', '541820030123707', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '112.1', '154.97'), 
  (default, '24', 'URBANIL', 'CLOBAZAM', '20 MG', 'Sólido', 'Novo', 'B1', '20', '576720070080817', 'TRANQUILIZANTES', '24.09', '33.3'), 
  (default, '1', 'CLORIDRATO DE DOXICICLINA', 'CLORIDRATO DE DOXICICLINA', '100 MG', 'Sólido', 'Genérico', 'AM', '15', '507707301113112', 'TETRACICLINAS E ASSOCIAÇÕES', '48.41', '66.92'), 
  (default, '18', 'OSKIN', 'FLUOCINOLONA ACETONIDA', '40 MG/G', 'Semissólido', 'Similar', 'Liberado', '15 G', '531614100076803', 'OUTRAS PREPARAÇÕES DERMATOLOGICAS', '105.61', '140.71'), 
  (default, '24', 'LOPROX', 'CICLOPIROX OLAMINA', '10 MG/ML', 'Líquido', 'Novo', 'Liberado', '15 ML', '576720080082317', 'ANTIFÚNGICOS DERMATOLÓGICOS TÓPICOS', '38.82', '51.72'), 
  (default, '26', 'COREG', 'CARVEDILOL', '12,5 MG', 'Sólido', 'Novo', 'Liberado', '14', '529201201119312', 'BETABLOQUEADORES PUROS', '67.12', '92.79'), 
  (default, '18', 'AZI', 'AZITROMICINA DI-HIDRATADA;AZITROMICINA', '40 MG/ML', 'Líquido', 'Similar', 'AM', '12 ML', '531600408134416', 'MACROLIDEOS E SIMILARES', '47.84', '66.14'), 
  (default, '8', 'CRESTOR', 'ROSUVASTATINA CÁLCICA', '10 MG', 'Sólido', 'Novo', 'Liberado', '10', '502305301118212', 'ESTATINAS, INIBIDORES DA REDUTASE HMG-CoA', '67.99', '93.99'), 
  (default, '28', 'VONAU', 'CLORIDRATO DE ONDANSETRONA', '4 MG', 'Sólido', 'Novo', 'Liberado', '10', '504118050063203', 'ANTIEMÉTICOS E ANTINAUSEANTES, ANTAGONISTAS DA SEROTONINA', '32.96', '45.57'), 
  (default, '28', 'LISTO', 'CLORIDRATO DE ONDANSETRONA', '8 MG', 'Sólido', 'Similar', 'Liberado', '10', '504119010066217', 'ANTIEMÉTICOS E ANTINAUSEANTES, ANTAGONISTAS DA SEROTONINA', '57.1', '78.94'), 
  (default, '21', 'CLORIDRATO DE ONDANSETRONA', 'CLORIDRATO DE ONDANSETRONA', '8,0 MG', 'Sólido', 'Genérico', 'Liberado', '10', '504417110065306', 'ANTIEMÉTICOS E ANTINAUSEANTES, ANTAGONISTAS DA SEROTONINA', '41.45', '57.3'), 
  (default, '17', 'CEFACLOR', 'CEFACLOR MONOIDRATADO', '500 MG', 'Sólido', 'Genérico', 'AM', '10', '526120302115111', 'CEFALOSPORINAS ORAIS', '73.05', '100.99'), 
  (default, '18', 'CECLOR', 'CEFACLOR MONOIDRATADO', '500 MG', 'Sólido', 'Similar', 'AM', '10', '531600804110412', 'CEFALOSPORINAS ORAIS', '72.95', '100.85'), 
  (default, '24', 'MUCOSOLVAN', 'CLORIDRATO DE AMBROXOL', '75 MG', 'Sólido', 'Novo', 'Liberado', '10', '576720050069217', 'EXPECTORANTES', '37.03', '49.34'), 
  (default, '35', 'CEDROXIL', 'CEFADROXILA', '500 MG', 'Sólido', 'Similar', 'AM', '8', '538818401116416', 'CEFALOSPORINAS ORAIS', '50.46', '69.76'), 
  (default, '21', 'CEFTRIAXONA DISSÓDICA HEMIEPTAIDRATADA', 'CEFTRIAXONA DISSÓDICA HEMIEPTAIDRATADA', '1000 MG', 'Líquido', 'Genérico', 'AM', '3,5 ML', '504422080073306', 'CEFALOSPORINAS INJETÁVEIS', '113.9', '135.0'), 
  (default, '13', 'TEUTRAZI', 'AZITROMICINA', '500 MG', 'Sólido', 'Similar', 'AM', '5', '520716040101403', 'MACROLIDEOS E SIMILARES', '45.33', '62.67'), 
  (default, '13', 'TEUCEF', 'CEFTRIAXONA DISSÓDICA HEMIEPTAIDRATADA', '1G IM PO SOL INJ', 'Líquido', 'Similar', 'AM', '3,5 ML', '520720004159418', 'CEFALOSPORINAS INJETÁVEIS', '33.33', '46.08'), 
  (default, '18', 'AZI', 'AZITROMICINA DI-HIDRATADA', '500 MG', 'Sólido', 'Similar', 'AM', '5', '531600405119416', 'MACROLIDEOS E SIMILARES', '56.52', '78.14'), 
  (default, '24', 'NOOTROPIL', 'PIRACETAM', '200 MG/ML', 'Líquido', 'Novo', 'Liberado', '5 ML', '576720090087017', 'NOOTRÓPICOS', '32.02', '44.27'), 
  (default, '28', 'SINTEZYS', 'IBANDRONATO DE SÓDIO', '150 MG', 'Sólido', 'Similar', 'Liberado', '3', '504121120071817', 'BISFOSFONATOS PARA OSTEOPOROSE E ALTERAÇÕES RELACIONADAS', '222.32', '307.34'), 
  (default, '17', 'GLAMIGAN MT', 'MALEATO DE TIMOLOL;BIMATOPROSTA', '(0,3 + 5,0) MG/ML', 'Líquido', 'Similar', 'Liberado', '3 ML', '526121070143004', 'PREPARAÇÕES ANTIGLAUCOMAS E MIÓTICAS TÓPICAS', '112.55', '155.59'), 
  (default, '18', 'ANAEROCID', 'FOSFATO DE CLINDAMICINA', '20 MG', 'Semissólido', 'Similar', 'AM', '20 G + 3 APLIC', '531613801166419', 'ANTIBIOTICOS GINECOLÓGICOS', '37.47', '49.92'), 
  (default, '21', 'FUROSETRON', 'FUROSEMIDA', '10 MG/ML', 'Líquido', 'Similar', 'Liberado', '2 ML', '504422080071104', 'DIURÉTICOS DE ALÇA PUROS', '66.32', '91.68'), 
  (default, '28', 'IBANDRONATO DE SÓDIO', 'IBANDRONATO DE SÓDIO', '150 MG', 'Sólido', 'Genérico', 'Liberado', '1', '504122050077517', 'BISFOSFONATOS PARA OSTEOPOROSE E ALTERAÇÕES RELACIONADAS', '140.59', '194.36'), 
  (default, '36', 'CLARITROMICINA', 'CLARITROMICINA', '500 MG', 'Líquido', 'Genérico', 'AM', '500 MG PO LIOF SOL INFUS IV CT FA VD TRANS', '504622090089406', 'MACROLIDEOS E SIMILARES', '170.17', '235.25'), 
  (default, '17', 'CEFACLOR', 'CEFACLOR', '75 MG/ML', 'Líquido', 'Genérico', 'AM', '100 ML + SER DOS', '526125702138111', 'CEFALOSPORINAS ORAIS', '92.06', '127.27'), 
  (default, '37', 'NOVOLIN N', 'INSULINA HUMANA', '100 UI/ML', 'Líquido', 'Novo', 'Liberado', '5 SIST APLIC PLAS (FLEXPEN)', '526618040009207', 'INSULINA HUMANA + ANÁLOGOS DE AÇÃO NORMAL', '117.6', '162.58'), 
  (default, '37', 'NOVOLIN R', 'INSULINA HUMANA', '100 UI/ML', 'Líquido', 'Similar', 'Liberado', '5 SIST APLIC PLAS (FLEXPEN)', '526618040009307', 'INSULINA HUMANA E ANÁLOGOS, DE AÇÃO RÁPIDA', '117.6', '162.58'), 
  (default, '18', 'CECLOR', 'CEFACLOR', '50 MG/ML', 'Líquido', 'Similar', 'AM', '100 ML + SER DOS + COL', '531600707131419', 'CEFALOSPORINAS ORAIS', '83.41', '115.31'), 
  (default, '34', 'UNI-CARBAMAZ', 'CARBAMAZEPINA', '20 MG/ML', 'Líquido', 'Similar', 'C1', '100 ML + COP', '533011902130416', 'ANTIEPILÉPTICOS', '19.96', '27.59'), 
  (default, '1', 'CEFADROXILA', 'CEFADROXILA', '100 MG/ML', 'Líquido', 'Genérico', 'AM', '100 ML + DOSAD', '541819120114707', 'CEFALOSPORINAS ORAIS', '130.99', '181.09'), 
  (default, '7', 'NOOTRON', 'PIRACETAM', '60 MG/ML', 'Líquido', 'Similar', 'Liberado', '110 ML + COP', '552919060079017', 'NOOTRÓPICOS', '13.74', '18.99'), 
  (default, '7', 'FUMARATO DE CETOTIFENO', 'FUMARATO DE CETOTIFENO', '1 MG/ML', 'Líquido', 'Genérico', 'Liberado', '30 ML + CGT', '552920070127217', 'ANTIASMÁTICOS/DPOC ANTIINFLAMATORIOS NÃO ESTEROIDAIS RESPIRATÓRIOS SISTÊMICOS', '48.79', '67.45'), 
  (default, '38', 'CLENIL HFA', 'DIPROPIONATO DE BECLOMETASONA', '200 MCG', 'Líquido', 'Novo', 'Liberado', '200 DOSES', '508503806177312', 'ANTIASMÁTICOS/DPOC CORTICOSTERÓIDES INALANTES', '59.18', '81.81'), 
  (default, '38', 'DIPROPIONATO DE BECLOMETASONA', 'DIPROPIONATO DE BECLOMETASONA', '200 MCG', 'Líquido', 'Genérico', 'Liberado', '200 DOSES', '508518030011806', 'ANTIASMÁTICOS/DPOC CORTICOSTERÓIDES INALANTES', '49.66', '68.65'), 
  (default, '39', 'MITRIP', 'CLORIDRATO DE AMITRIPTILINA', '10 MG', 'Sólido', 'Similar', 'C1', '10', '575222050009004', 'ANTIDEPRESSIVOS TODOS OS OUTROS', '3.59', '4.95'), 
  (default, '38', 'ALERFIN', 'DIPROPIONATO DE BECLOMETASONA', '100 MCG', 'Líquido', 'Similar', 'Liberado', '120 DOS', '508500301171411', 'CORTICOSTERÓIDES NASAIS SEM ANTIINFECCIOSOS', '72.44', '100.14'), 
  (default, '11', 'ZYRTEC', 'DICLORIDRATO DE CETIRIZINA', '1,0 MG/ML', 'Líquido', 'Novo', 'Liberado', '120 ML', '510609603131314', 'ANTI-HISTAMÍNICOS SISTÊMICOS', '54.92', '73.17'), 
  (default, '7', 'BETADINE', 'CLORIDRATO DE BETAISTINA', '24 MG', 'Sólido', 'Similar', 'Liberado', '60', '500512030040704', 'ANTIVERTIGINOSOS', '89.02', '118.6'), 
  (default, '8', 'SUCCINATO DE METOPROLOL', 'SUCCINATO DE METOPROLOL', '50 MG', 'Sólido', 'Genérico', 'Liberado', '60', '502315040026906', 'BETABLOQUEADORES PUROS', '72.84', '100.7'), 
  (default, '28', 'PRESSAT', 'BESILATO DE ANLODIPINO', '10 MG', 'Sólido', 'Similar', 'Liberado', '60', '504118050062503', 'ANTAGONISTAS DO CÁLCIO PUROS', '214.98', '297.2'), 
  (default, '1', 'DOMPLIV', 'DOMPERIDONA', '10 MG', 'Sólido', 'Similar', 'Liberado', '60', '507742602116410', 'GASTROPROCINÉTICOS', '42.74', '56.94'), 
  (default, '10', 'INDAPAMIDA', 'INDAPAMIDA', '1,5 MG', 'Sólido', 'Genérico', 'Liberado', '60', '508019120125407', 'DIURÉTICOS TIAZIDAS E ANÁLOGOS PUROS', '48.76', '67.41'), 
  (default, '33', 'GLIMEPIRIDA', 'GLIMEPIRIDA', '4 MG', 'Sólido', 'Genérico', 'Liberado', '60', '525315080045406', 'ANTIDIABÉTICOS SULFONILOURÉIAS PUROS', '119.37', '165.02'), 
  (default, '33', 'LORAZEPAM', 'LORAZEPAM', '2 MG', 'Sólido', 'Genérico', 'B1', '60', '525319040060606', 'TRANQUILIZANTES', '47.89', '66.21'), 
  (default, '17', 'CLONAZEPAM', 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'B1', '60', '526118080099806', 'ANTIEPILÉPTICOS', '30.44', '39.4'), 
  (default, '17', 'BESILATO DE ANLODIPINO + LOSARTANA POTÁSSICA', 'LOSARTANA POTÁSSICA;BESILATO DE ANLODIPINO', '5 MG', 'Sólido', 'Genérico', 'Liberado', '60', '526120050113107', 'ANTAGONISTAS DA ANGIOTENSINA II ASSOCIADOS A ANTAGONISTAS DO CÁLCIO', '178.51', '246.78'), 
  (default, '35', 'GLIANSOR', 'GLIMEPIRIDA', '4MG', 'Sólido', 'Similar', 'Liberado', '60', '538820050074607', 'ANTIDIABÉTICOS SULFONILOURÉIAS PUROS', '158.5', '219.12'), 
  (default, '5', 'ROSUVASTATINA CÁLCICA', 'ROSUVASTATINA CÁLCICA', '10 MG', 'Sólido', 'Genérico', 'Liberado', '60', '543819050036306', 'ESTATINAS, INIBIDORES DA REDUTASE HMG-CoA', '248.18', '343.09'), 
  (default, '1', 'PROPIONATO DE CLOBETASOL', 'PROPIONATO DE CLOBETASOL', '0,5 MG/G', 'Líquido', 'Genérico', 'Liberado', '50 G', '507728603178112', 'CORTICOESTERÓIDES TÓPICOS PUROS', '27.68', '38.27'), 
  (default, '35', 'BENECTRIN', 'TRIMETOPRIMA;SULFAMETOXAZOL', '400 MG', 'Sólido', 'Similar', 'AM', '50', '538822120116203', 'ASSOCIAÇÕES DE TRIMETOPRIMA E SIMILARES', '55.48', '76.7'), 
  (default, '19', 'SYNTHROID', 'LEVOTIROXINA SÓDICA', '200 MCG', 'Sólido', 'Novo', 'Liberado', '30', '500207409112419', 'PREPARAÇÕES PARA TIREOIDE', '51.57', '71.29'), 
  (default, '19', 'LANPEXIO', 'FENOFIBRATO', '160 MG', 'Sólido', 'Similar', 'Liberado', '30', '500218040041703', 'FIBRATOS', '98.62', '136.34'), 
  (default, '36', 'ATORVASTEROL', 'ATORVASTATINA CÁLCICA', '80 MG', 'Sólido', 'Similar', 'Liberado', '30', '504614030020804', 'ESTATINAS, INIBIDORES DA REDUTASE HMG-CoA', '210.35', '290.8'), 
  (default, '36', 'CIPROFIBRATO', 'CIPROFIBRATO', '100 MG', 'Sólido', 'Genérico', 'Liberado', '30', '504617090065117', 'FIBRATOS', '87.43', '120.87'), 
  (default, '1', 'DIPROPIONATO DE BETAMETASONA', 'DIPROPIONATO DE BETAMETASONA', '0,5 MG/G', 'Semissólido', 'Genérico', 'Liberado', '30 G', '507727301161111', 'CORTICOESTERÓIDES TÓPICOS PUROS', '25.43', '33.88'), 
  (default, '1', 'ATORVASTATINA CÁLCICA', 'ATORVASTATINA CÁLCICA', '40 MG', 'Sólido', 'Genérico', 'Liberado', '30', '507743404113111', 'ESTATINAS, INIBIDORES DA REDUTASE HMG-CoA', '246.55', '340.84'), 
  (default, '10', 'CILOSTAZOL', 'CILOSTAZOL', '100 MG', 'Sólido', 'Genérico', 'Liberado', '30', '508024801116111', 'INIBIDORES DA AGREGAÇÃO PLAQUETÁRIA, REALÇADORES DO AMP CÍCLICO', '58.84', '81.34'), 
  (default, '10', 'SIBUS', 'CLORIDRATO DE SIBUTRAMINA MONOIDRATADO', '15 MG', 'Sólido', 'Similar', 'B1', '30', '508027301114416', 'PREPARAÇÕES ANTIOBESIDADE, EXCETO OS DIETÉTICOS', '50.12', '66.78'), 
  (default, '11', 'PSOREX', 'PROPIONATO DE CLOBETASOL', '0,5 MG/G', 'Semissólido', 'Novo', 'Liberado', '30 G', '510606003168311', 'CORTICOESTERÓIDES TÓPICOS PUROS', '35.54', '49.13'), 
  (default, '13', 'FINARID', 'FINASTERIDA', '5MG', 'Sólido', 'Similar', 'Liberado', '30', '520715120098703', 'BPH INIBIDORES DA 5-ALFA TESTOSTERONA REDUTASE (5-ARI) PUROS', '124.59', '172.24'), 
  (default, '20', 'LORAX', 'LORAZEPAM', '1 MG', 'Sólido', 'Novo', 'B1', '30', '522701603111417', 'TRANQUILIZANTES', '26.01', '35.96'), 
  (default, '20', 'TROFODERMIN', 'SULFATO DE NEOMICINA;ACETATO DE CLOSTEBOL', '5 MG/G', 'Semissólido', 'Novo', 'Liberado', '30 G', '522718040079717', 'TODOS OUTROS PRODUTOS PARA TRATAMENTO DE FERIDAS', '38.96', '51.91'), 
  (default, '24', 'ACETATO DE CLOSTEBOL + SULFATO DE NEOMICINA', 'SULFATO DE NEOMICINA;ACETATO DE CLOSTEBOL', '5 MG/G', 'Semissólido', 'Genérico', 'Liberado', '30 G', '525069602163112', 'TODOS OUTROS PRODUTOS PARA TRATAMENTO DE FERIDAS', '25.23', '33.61'), 
  (default, '4', 'CLONETRIL', 'CLONAZEPAM', '2 MG', 'Sólido', 'Similar', 'B1', '30', '528520060173607', 'ANTIEPILÉPTICOS', '15.3', '21.15'), 
  (default, '26', 'VALIUM', 'DIAZEPAM', '5 MG', 'Sólido', 'Novo', 'B1', '30', '529206105118311', 'TRANQUILIZANTES', '18.01', '24.9'), 
  (default, '31', 'CLORIDRATO DE NORTRIPTILINA', 'CLORIDRATO DE NORTRIPTILINA', '50 MG', 'Sólido', 'Genérico', 'C1', '30', '529914403117112', 'ANTIDEPRESSIVOS TODOS OS OUTROS', '41.68', '57.62'), 
  (default, '40', 'NOVADERM', 'SULFATO DE NEOMICINA;ACETATO DE CLOSTEBOL', '5 MG/G', 'Semissólido', 'Similar', 'Liberado', '30 G', '533802702161417', 'TODOS OUTROS PRODUTOS PARA TRATAMENTO DE FERIDAS', '27.78', '37.01'), 
  (default, '35', 'DIAZEPAM', 'DIAZEPAM', '10 MG', 'Sólido', 'Genérico', 'B1', '30', '538812040040706', 'TRANQUILIZANTES', '15.63', '21.61'), 
  (default, '1', 'HEMITARTARATO DE ZOLPIDEM', 'HEMITARTARATO DE ZOLPIDEM', '10 MG', 'Sólido', 'Genérico', 'C1', '30', '541822090185306', 'HIPNÓTICOS E SEDATIVOS NÃO BARBITÚRICOS PUROS', '150.45', '207.99'), 
  (default, '41', 'TRAMAL RETARD', 'CLORIDRATO DE TRAMADOL', '50 MG', 'Sólido', 'Novo', 'A2', '30', '542820020006007', 'ANALGÉSICOS NARCÓTICOS', '161.98', '223.93'), 
  (default, '7', 'CLORIDRATO DE SIBUTRAMINA MONOIDRATADO', 'CLORIDRATO DE SIBUTRAMINA MONOIDRATADO', '15 MG', 'Sólido', 'Genérico', 'B2', '30', '552919070080417', 'PREPARAÇÕES ANTIOBESIDADE, EXCETO OS DIETÉTICOS', '272.05', '362.45'), 
  (default, '7', 'REVANGE', 'CLORIDRATO DE TRAMADOL;PARACETAMOL', '(37,5 + 325,0) MG', 'Sólido', 'Similar', 'A2', '30', '552919120092707', 'ANALGÉSICOS NARCÓTICOS', '103.34', '137.68'), 
  (default, '7', 'EUPRESSIN H', 'HIDROCLOROTIAZIDA;MALEATO DE ENALAPRIL', '20 MG', 'Sólido', 'Similar', 'Liberado', '30', '552920020117417', 'INIBIDORES DA ECA ASSOCIADOS A ANTI-HIPERTERSIVOS (C2) E/OU DIURÉTICOS (C3)', '122.01', '168.67'), 
  (default, '7', 'OMEPRAMIX', 'AMOXICILINA TRIHIDRATADA;OMEPRAZOL;CLARITROMICINA', '20 MG', 'Sólido', 'Similar', 'AM', '28', '500506103112412', 'INIBIDORES DA BOMBA DE PRÓTONS', '289.26', '399.88'), 
  (default, '7', 'ADIPEPT', 'PANTOPRAZOL', '40 MG', 'Sólido', 'Similar', 'Liberado', '28', '500514030055803', 'INIBIDORES DA BOMBA DE PRÓTONS', '186.95', '258.45'), 
  (default, '17', 'LANSOPRAZOL', 'LANSOPRAZOL', '30 MG', 'Semissólido', 'Genérico', 'Liberado', '28', '526119110093607', 'INIBIDORES DA BOMBA DE PRÓTONS', '136.9', '189.26'), 
  (default, '4', 'LANZOPRAZOL + CLARITROMICINA + AMOXICILINA', 'AMOXICILINA TRIHIDRATADA;LANSOPRAZOL;CLARITROMICINA', '30 MG', 'Sólido', 'Genérico', 'AM', '28', '528531704116114', 'INIBIDORES DA BOMBA DE PRÓTONS', '197.88', '273.56'), 
  (default, '42', 'THERAPSOR', 'PROPIONATO DE CLOBETASOL', '0,5 MG/ML', 'Líquido', 'Similar', 'Liberado', '25 ML', '512120020006807', 'CORTICOESTERÓIDES TÓPICOS PUROS', '29.59', '40.91'), 
  (default, '20', 'PONSTAN', 'ÁCIDO MEFENÂMICO', '500 MG', 'Sólido', 'Novo', 'Liberado', '24', '522718010069917', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '31.22', '43.16'), 
  (default, '18', 'HEMOBLOCK', 'ÁCIDO TRANEXÂMICO', '250 MG', 'Sólido', 'Similar', 'Liberado', '24', '531615060078417', 'ANTIFIBRINOLÍTICOS SINTÉTICOS', '91.82', '122.33'), 
  (default, '43', 'BACTRIM', 'TRIMETOPRIMA;SULFAMETOXAZOL', '400 MG', 'Sólido', 'Novo', 'AM', '20', '509020090023517', 'ASSOCIAÇÕES DE TRIMETOPRIMA E SIMILARES', '25.85', '35.74'), 
  (default, '31', 'AMOXICILINA + CLAVULANATO DE POTÁSSIO', 'AMOXICILINA TRIHIDRATADA;CLAVULANATO DE POTÁSSIO', '(875,0 + 125,0) MG', 'Sólido', 'Genérico', 'AM', '20', '529920110068907', 'PENICILINAS ORAIS DE AMPLO ESPECTRO', '202.78', '280.33'), 
  (default, '1', 'AMOXICILINA + CLAVULANATO DE POTÁSSIO', 'CLAVULANATO DE POTÁSSIO;AMOXICILINA', '875 MG', 'Sólido', 'Genérico', 'AM', '20', '541817080020506', 'PENICILINAS ORAIS DE AMPLO ESPECTRO', '202.79', '280.35'), 
  (default, '24', 'GARDENAL', 'FENOBARBITAL', '100 MG', 'Sólido', 'Novo', 'C1', '20', '576720040061917', 'ANTIEPILÉPTICOS', '9.01', '12.46'), 
  (default, '30', 'UNOPROST', 'MESILATO DE DOXAZOSINA', '4 MG', 'Sólido', 'Similar', 'Liberado', '15', '501603104118411', 'ANTI-HIPERTENSIVOS PURO-AÇÃO PERIFÉRICA', '135.01', '186.64'), 
  (default, '29', 'TRANQUINAL SLG', 'ALPRAZOLAM', '0.5 MG', 'Sólido', 'Novo', 'B1', '15', '536502101116317', 'TRANQUILIZANTES', '24.41', '33.75'), 
  (default, '7', 'FAMOX', 'FAMOTIDINA', '20 MG', 'Sólido', 'Similar', 'Liberado', '15', '552920080131607', 'ANTAGONISTAS RECEPTORES H2', '70.83', '97.92'), 
  (default, '35', 'ACIDO TRANEXAMICO', 'ÁCIDO TRANEXÂMICO', '250 MG', 'Sólido', 'Genérico', 'Liberado', '12', '538805701116118', 'ANTIFIBRINOLÍTICOS SINTÉTICOS', '40.14', '53.48'), 
  (default, '44', 'ASPARGIL C', 'ASPARTATO DE ARGININA;ÁCIDO ASCÓRBICO', '1G + 1G', 'Sólido', 'Específico', 'Liberado', '10', '506320050033307', 'TODOS OS OUTROS TÔNICOS', '34.54', '46.02'), 
  (default, '13', 'LEVOFLOXACINO', 'LEVOFLOXACINO HEMI-HIDRATADO', '500 MG', 'Sólido', 'Genérico', 'AM', '10', '520716030100606', 'FLUORQUINOLONAS ORAIS', '183.79', '254.08'), 
  (default, '7', 'LEVOFLOXACINO', 'LEVOFLOXACINO', '500 MG', 'Sólido', 'Genérico', 'AM', '10', '552920020111817', 'FLUORQUINOLONAS ORAIS', '176.13', '243.49'), 
  (default, '8', 'NEXIUM', 'ESOMEPRAZOL MAGNÉSICO', '20 MG', 'Sólido', 'Novo', 'Liberado', '7', '502302702111214', 'INIBIDORES DA BOMBA DE PRÓTONS', '45.04', '62.27'), 
  (default, '7', 'LIVEPAX', 'LEVOFLOXACINO', '750 MG', 'Sólido', 'Similar', 'AM', '7', '552919120098407', 'FLUORQUINOLONAS ORAIS', '123.41', '170.61'), 
  (default, '44', 'CYPCINO', 'CLORIDRATO DE CIPROFLOXACINO', '500 MG', 'Sólido', 'Similar', 'AM', '6', '506321010037007', 'FLUORQUINOLONAS ORAIS', '49.49', '68.42'), 
  (default, '25', 'CIPRO', 'CLORIDRATO DE CIPROFLOXACINO', '500 MG', 'Sólido', 'Novo', 'AM', '6', '538921110033603', 'FLUORQUINOLONAS ORAIS', '158.34', '218.9'), 
  (default, '23', 'BIAMOTIL D', 'CLORIDRATO DE CIPROFLOXACINO ;DEXAMETASONA', '3,5 MG/ML', 'Líquido', 'Similar', 'AM', '5 ML', '501001102176312', 'ASSOCIAÇÕES OFTALMOLÓGICAS CORTICOSTERÓIDES COM ANTIINFECCIOSOS', '35.79', '49.48'), 
  (default, '1', 'OTOMIXYN', 'FLUOCINOLONA ACETONIDA;CLORIDRATO DE LIDOCAINA;SULFATO DE NEOMICINA;SULFATO DE POLIMIXINA B', '0,250 MG', 'Líquido', 'Genérico', 'AM', '5 ML', '507719602172413', 'ASSOCIAÇÕES OTOLÓGICAS CORTICOSTERÓIDES COM ANTIINFECCIOSOS', '7.99', '11.05'), 
  (default, '43', 'INICOX DP', 'MELOXICAM', '15 MG', 'Sólido', 'Novo', 'Liberado', '5', '509021110027004', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '16.91', '23.38'), 
  (default, '1', 'POLICLAVUMOXIL', 'CLAVULANATO DE POTÁSSIO;AMOXICILINA', '50 MG/ML', 'Líquido', 'Similar', 'AM', '75 ML + COL', '541817070020203', 'PENICILINAS ORAIS DE AMPLO ESPECTRO', '67.1', '92.76'), 
  (default, '7', 'MALEATO DE TIMOLOL', 'MALEATO DE TIMOLOL', '2,5 MG/ML', 'Líquido', 'Genérico', 'Liberado', '5 ML', '552919110081117', 'PREPARAÇÕES ANTIGLAUCOMAS E MIÓTICAS TÓPICAS', '8.87', '12.26'), 
  (default, '1', 'AZITROMICINA', 'AZITROMICINA', '500 MG', 'Sólido', 'Genérico', 'AM', '3', '541819020102606', 'MACROLIDEOS E SIMILARES', '69.6', '96.22'), 
  (default, '13', 'CETOFENID', 'CETOPROFENO', '50 MG/ML', 'Líquido', 'Similar', 'Liberado', '2 ML', '520723040117704', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '186.87', '258.34'), 
  (default, '14', 'PLAMET', 'BROMOPRIDA', '5 MG/ML', 'Líquido', 'Similar', 'Liberado', '2 ML', '523703704150411', 'GASTROPROCINÉTICOS', '54.39', '72.46'), 
  (default, '14', 'SUMAX', 'SUCCINATO DE SUMATRIPTANA', '100 MG/ML', 'Líquido', 'Novo', 'Liberado', '0,2 ML', '523705006175413', 'ANTIENXAQUECOSOS TRIPTÂNICOS', '57.7', '79.77'), 
  (default, '10', 'AZITROMICINA', 'AZITROMICINA DI-HIDRATADA', '1500 MG', 'Líquido', 'Genérico', 'AM', '22 ML + SER DOS', '508014050104406', 'MACROLIDEOS E SIMILARES', '97.27', '134.47'), 
  (default, '16', 'DESALEX', 'DESLORATADINA', '0,5 MG/ML', 'Líquido', 'Novo', 'Liberado', '100 ML + SER DOS', '525515090017317', 'ANTI-HISTAMÍNICOS SISTÊMICOS', '67.49', '89.92'), 
  (default, '17', 'NAPROXENO SÓDICO', 'NAPROXENO SÓDICO', '275 MG', 'Sólido', 'Genérico', 'Liberado', '4', '526120110127307', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '2.03', '2.7'), 
  (default, '28', 'ICTUS', 'CARVEDILOL', '12,5 MG', 'Sólido', 'Similar', 'Liberado', '90', '504116030055003', 'BETABLOQUEADORES PUROS', '136.48', '188.68'), 
  (default, '7', 'FEMINA', 'DESOGESTREL;ETINILESTRADIOL', '(0,15 + 0,02) MG', 'Sólido', 'Similar', 'Liberado', '63', '552921080139117', 'HORMÔNIOS CONTRACEPTIVOS MONOFÁSICOS COM ESTROGÊNIOS <50MCG', '125.72', '173.8'), 
  (default, '18', 'BRASART BCC', 'VALSARTANA;BESILATO DE ANLODIPINO', '160 MG', 'Sólido', 'Similar', 'Liberado', '60', '531614040073404', 'ANTAGONISTAS DA ANGIOTENSINA II ASSOCIADOS A ANTAGONISTAS DO CÁLCIO', '286.87', '396.58'), 
  (default, '30', 'MIOSAN', 'CLORIDRATO DE CICLOBENZAPRINA', '5 MG', 'Sólido', 'Novo', 'Liberado', '30', '501601802111319', 'RELAXANTE MUSCULAR DE AÇÃO CENTRAL', '45.43', '60.53'), 
  (default, '8', 'ATENOL', 'ATENOLOL', '50 MG', 'Sólido', 'Novo', 'Liberado', '30', '502315030024103', 'BETABLOQUEADORES PUROS', '56.17', '77.65'), 
  (default, '27', 'STUGERON', 'CINARIZINA', '25 MG', 'Sólido', 'Novo', 'Liberado', '30', '514504601115316', 'ANTAGONISTAS DO CÁLCIO COM AÇÃO CEREBRAL', '18.79', '25.98'), 
  (default, '13', 'TEUSIL', 'CAPTOPRIL', '50 MG', 'Sólido', 'Similar', 'Liberado', '30', '520716050102108', 'INIBIDORES DA ECA PUROS', '32.28', '44.63'), 
  (default, '15', 'GLIFAGE XR', 'CLORIDRATO DE METFORMINA', '1 G', 'Sólido', 'Novo', 'Liberado', '30', '525420304115317', 'ANTIDIABÉTICOS BIGUANIDAS PUROS', '38.79', '53.62'), 
  (default, '1', 'CETOCONAZOL', 'CETOCONAZOL', '200 MG', 'Sólido', 'Genérico', 'Liberado', '30', '541819080111003', 'AGENTES SISTÊMICOS PARA INFECÇÕES FÚNGICAS', '96.07', '132.81'), 
  (default, '7', 'VALSARTANA + ANLODIPINO', 'VALSARTANA;BESILATO DE ANLODIPINO', '(320,0+10,0) MG', 'Sólido', 'Genérico', 'Liberado', '30', '552920100134007', 'ANTAGONISTAS DA ANGIOTENSINA II ASSOCIADOS A ANTAGONISTAS DO CÁLCIO', '97.82', '135.23'), 
  (default, '24', 'CLORANA', 'HIDROCLOROTIAZIDA', '25 MG', 'Sólido', 'Novo', 'Liberado', '30', '576720090086417', 'DIURÉTICOS TIAZIDAS E ANÁLOGOS PUROS', '10.28', '14.21'), 
  (default, '3', 'DIOVAN AMLO FIX', 'VALSARTANA;BESILATO DE ANLODIPINO', '(160,00+10,00) MG', 'Sólido', 'Novo', 'Liberado', '28', '526528604118319', 'ANTAGONISTAS DA ANGIOTENSINA II ASSOCIADOS A ANTAGONISTAS DO CÁLCIO', '140.44', '194.15'), 
  (default, '2', 'MUCOLITIC', 'CARBOCISTEÍNA', '50 MG/ML', 'Líquido', 'Novo', 'Liberado', '20 ML', '501101903138423', 'EXPECTORANTES', '23.03', '30.68'), 
  (default, '1', 'BEZAFIBRATO', 'BEZAFIBRATO', '200 MG', 'Sólido', 'Genérico', 'Liberado', '20', '507726801118111', 'FIBRATOS', '28.48', '39.37'), 
  (default, '13', 'AMINOFILINA', 'AMINOFILINA', '100 MG', 'Sólido', 'Genérico', 'Liberado', '20', '520701002111111', 'ANTIASMÁTICOS/DPOC XANTÍNICOS SISTÊMICOS', '4.45', '6.15'), 
  (default, '13', 'NAPROX', 'NAPROXENO', '500 MG', 'Sólido', 'Similar', 'Liberado', '20', '520715102113416', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '28.88', '38.48'), 
  (default, '30', 'MIOSAN CAF', 'CLORIDRATO DE CICLOBENZAPRINA;CAFEÍNA', '5 MG', 'Sólido', 'Novo', 'Liberado', '15', '501605004110318', 'RELAXANTE MUSCULAR DE AÇÃO CENTRAL', '22.62', '30.14'), 
  (default, '18', 'HIDROQUINONA + TRETINOINA + FLUOCINOLONA ACETONIDA', 'FLUOCINOLONA ACETONIDA', '40 MG/G', 'Semissólido', 'Genérico', 'Liberado', '15 G', '531613070069606', 'OUTRAS PREPARAÇÕES DERMATOLOGICAS', '110.9', '147.75'), 
  (default, '7', 'NISULID', 'NIMESULIDA', '100 MG', 'Sólido', 'Novo', 'Liberado', '12', '500509304119311', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '44.67', '61.75'), 
  (default, '24', 'ALLEGRA D', 'CLORIDRATO DE FEXOFENADINA;CLORIDRATO DE PSEUDOEFEDRINA', '(60,0 + 120,0) MG', 'Sólido', 'Novo', 'Liberado', '10', '576720070075617', 'PREPARAÇÕES SISTÊMICAS NASAIS', '52.12', '69.44'), 
  (default, '19', 'VIBRAL', 'DROPROPIZINA', '1,5 MG/ML', 'Líquido', 'Novo', 'Liberado', '120 ML + COP', '500214110033717', 'ANTITUSSÍGENOS PUROS', '18.77', '25.01'), 
  (default, '38', 'FLUIBRON', 'CLORIDRATO DE AMBROXOL', '6 MG/ML', 'Líquido', 'Similar', 'Liberado', '100 ML + COP', '508501602132421', 'EXPECTORANTES', '38.17', '50.85'), 
  (default, '45', 'SANDRENA', 'ESTRADIOL', '0,1 PCC', 'Semissólido', 'Novo', 'Liberado', '1,0 G', '527303502162316', 'HORMÔNIOS SEXUAIS TÓPICOS', '63.91', '88.35'), 
  (default, '10', 'NOEX', 'BUDESONIDA', '50 MCG', 'Líquido', 'Similar', 'Liberado', '200 DOSES', '508020205179416', 'CORTICOSTERÓIDES NASAIS SEM ANTIINFECCIOSOS', '53.91', '74.53'), 
  (default, '1', 'BUDESONIDA', 'BUDESONIDA', '32 MCG', 'Líquido', 'Genérico', 'Liberado', '120 ACION', '541817020018806', 'CORTICOSTERÓIDES NASAIS SEM ANTIINFECCIOSOS', '20.3', '28.06'), 
  (default, '46', 'DICLORIDRATO DE BETAISTINA', 'CLORIDRATO DE BETAISTINA', '24 MG', 'Sólido', 'Genérico', 'Liberado', '60', '500118060026306', 'ANTIVERTIGINOSOS', '57.81', '77.02'), 
  (default, '17', 'CLORIDRATO DE TRAMADOL + PARACETAMOL', 'CLORIDRATO DE TRAMADOL;PARACETAMOL', '(37,5 + 325) MG', 'Sólido', 'Genérico', 'A2', '60', '526123030169206', 'ANALGÉSICOS NARCÓTICOS', '182.16', '242.69'), 
  (default, '34', 'VODOL', 'NITRATO DE MICONAZOL', '20 MG/ML', 'Líquido', 'Novo', 'Liberado', '60 ML', '533015405166415', 'ANTIFÚNGICOS DERMATOLÓGICOS TÓPICOS', '38.07', '50.72'), 
  (default, '1', 'ATENOLOL + CLORTALIDONA', 'ATENOLOL;CLORTALIDONA', '50 MG', 'Sólido', 'Genérico', 'Liberado', '60', '541817090022006', 'BETABLOQUEADORES ASSOCIADOS COM ANTIHIPERTENSIVOS E/OU DIURÉTICOS', '57.79', '79.89'), 
  (default, '4', 'PANTOPRAZOL', 'PANTOPRAZOL SÓDICO SESQUI-HIDRATADO', '20 MG', 'Sólido', 'Genérico', 'Liberado', '56', '528517110132206', 'INIBIDORES DA BOMBA DE PRÓTONS', '248.76', '343.9'), 
  (default, '15', 'EUTHYROX', 'LEVOTIROXINA SÓDICA', '175 MCG', 'Sólido', 'Similar', 'Liberado', '50', '525404128111413', 'PREPARAÇÕES PARA TIREOIDE', '45.9', '63.45'), 
  (default, '7', 'PANTOMIX', 'PANTOPRAZOL SÓDICO SESQUI-HIDRATADO', '40 MG', 'Sólido', 'Similar', 'Liberado', '42', '552922080148603', 'INIBIDORES DA BOMBA DE PRÓTONS', '285.18', '394.24'), 
  (default, '10', 'PARACETAMOL + FOSFATO DE CODEÍNA', 'PARACETAMOL;FOSFATO DE CODEÍNA', '500MG', 'Sólido', 'Genérico', 'A2', '36', '508016100113406', 'ANALGÉSICOS NARCÓTICOS', '57.1', '76.07'), 
  (default, '10', 'PACO', 'PARACETAMOL;FOSFATO DE CODEÍNA', '500MG', 'Sólido', 'Similar', 'A2', '36', '508016100113703', 'ANALGÉSICOS NARCÓTICOS', '56.2', '74.88'), 
  (default, '36', 'NEO FEDIPINA', 'NIFEDIPINO', '10 MG', 'Sólido', 'Similar', 'Liberado', '30', '504614120026917', 'ANTAGONISTAS DO CÁLCIO PUROS', '15.56', '21.51'), 
  (default, '36', 'MESILATO DE DOXAZOSINA', 'MESILATO DE DOXAZOSINA', '4 MG', 'Sólido', 'Genérico', 'Liberado', '30', '504616120048406', 'ANTI-HIPERTENSIVOS PURO-AÇÃO PERIFÉRICA', '153.0', '211.51'), 
  (default, '1', 'ESPIRONOLACTONA', 'ESPIRONOLACTONA', '100 MG', 'Sólido', 'Genérico', 'Liberado', '30', '507725003110113', 'AGENTES DIURÉTICOS POUPADORES POTÁSSIO PUROS', '35.56', '49.16'), 
  (default, '1', 'CLORIDRATO DE AMITRIPTILINA', 'CLORIDRATO DE AMITRIPTILINA', '75 MG', 'Sólido', 'Genérico', 'C1', '30', '507738802114111', 'ANTIDEPRESSIVOS TODOS OS OUTROS', '50.2', '69.4'), 
  (default, '1', 'FENOFIBRATO', 'FENOFIBRATO', '200MG', 'Sólido', 'Genérico', 'Liberado', '30', '507740501118111', 'FIBRATOS', '86.71', '119.87'), 
  (default, '17', 'FINASTERIDA', 'FINASTERIDA', '5 MG', 'Sólido', 'Genérico', 'Liberado', '30', '526105302118117', 'BPH INIBIDORES DA 5-ALFA TESTOSTERONA REDUTASE (5-ARI) PUROS', '128.13', '177.13'), 
  (default, '17', 'CLORIDRATO DE TRAMADOL', 'CLORIDRATO DE TRAMADOL', '100 MG', 'Sólido', 'Genérico', 'A2', '30', '526123030168906', 'ANALGÉSICOS NARCÓTICOS', '210.55', '291.07'), 
  (default, '25', 'BERLISON', 'ACETATO DE HIDROCORTISONA', '10 MG/G', 'Semissólido', 'Novo', 'Liberado', '30 G', '538912050014013', 'CORTICOESTERÓIDES TÓPICOS PUROS', '28.87', '38.46'), 
  (default, '1', 'PANTOPRAZOL MAGNÉSICO DI-HIDRATADO', 'PANTOPRAZOL MAGNÉSICO DI-HIDRATADO', '40 MG', 'Sólido', 'Genérico', 'Liberado', '30', '541821060160206', 'INIBIDORES DA BOMBA DE PRÓTONS', '247.92', '330.31'), 
  (default, '7', 'MALEATO DE ENALAPRIL + HIDROCLOROTIAZIDA', 'HIDROCLOROTIAZIDA;MALEATO DE ENALAPRIL', '20 MG', 'Sólido', 'Genérico', 'Liberado', '30', '552920060125917', 'INIBIDORES DA ECA ASSOCIADOS A ANTI-HIPERTERSIVOS (C2) E/OU DIURÉTICOS (C3)', '65.17', '90.09'), 
  (default, '36', 'PANTOPRAZOL', 'PANTOPRAZOL', '40 MG', 'Sólido', 'Genérico', 'Liberado', '28', '504615030028406', 'INIBIDORES DA BOMBA DE PRÓTONS', '199.87', '276.31'), 
  (default, '47', 'VOLNAC', 'NITRATO DE MICONAZOL', '20 MG/G', 'Semissólido', 'Similar', 'Liberado', '28G', '505515701168418', 'ANTIFÚNGICOS DERMATOLÓGICOS TÓPICOS', '24.89', '33.16'), 
  (default, '13', 'HELMIZOL', 'METRONIDAZOL', '400 MG', 'Sólido', 'Similar', 'AM', '24', '520711808119416', 'TRICOMONICIDAS SISTÊMICOS', '26.11', '36.1'), 
  (default, '31', 'ACECLOFENACO', 'ACECLOFENACO', '100 MG', 'Sólido', 'Genérico', 'Liberado', '24', '529900102111115', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '60.56', '83.72'), 
  (default, '24', 'FLAGYL', 'METRONIDAZOL', '400 MG', 'Sólido', 'Novo', 'AM', '24', '576720050067317', 'TRICOMONICIDAS SISTÊMICOS', '26.11', '36.1'), 
  (default, '7', 'SOMALIUM', 'BROMAZEPAM', '6 MG', 'Sólido', 'Similar', 'B1', '20', '500506602119412', 'TRANQUILIZANTES', '25.59', '35.38'), 
  (default, '13', 'BACLOFENO', 'BACLOFENO', '10 MG', 'Sólido', 'Genérico', 'Liberado', '20', '520715060094306', 'RELAXANTE MUSCULAR DE AÇÃO CENTRAL', '25.35', '35.04'), 
  (default, '34', 'BACLON', 'BACLOFENO', '10 MG', 'Sólido', 'Similar', 'Liberado', '20', '533000901111412', 'RELAXANTE MUSCULAR DE AÇÃO CENTRAL', '21.35', '29.52'), 
  (default, '25', 'ADVANTAN', 'ACEPONATO DE METILPREDNISOLONA', '1 MG/G', 'Semissólido', 'Novo', 'Liberado', '20 G', '538912050012713', 'CORTICOESTERÓIDES TÓPICOS PUROS', '78.23', '104.23'), 
  (default, '35', 'ACECLO-GRAN', 'ACECLOFENACO', '100 MG', 'Sólido', 'Similar', 'Liberado', '12', '538813080046904', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '41.3', '57.09'), 
  (default, '36', 'TILOXINEO', 'TENOXICAM', '20 MG', 'Sólido', 'Similar', 'Liberado', '10', '504617080064717', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '38.8', '53.64'), 
  (default, '1', 'TENOXICAM', 'TENOXICAM', '20 MG', 'Sólido', 'Genérico', 'Liberado', '10', '507723602114111', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '37.54', '51.9'), 
  (default, '1', 'ACETONIDA DE TRIANCINOLONA', 'TRIANCINOLONA ACETONIDA', '1 MG/G', 'Semissólido', 'Genérico', 'Liberado', '10 G', '507727701168113', 'ANALGÉSICOS E ANTIINFLAMATÓRIOS BUCAIS DE USO TÓPICO', '11.82', '16.34'), 
  (default, '10', 'GÉSICO', 'CLORIDRATO DE TRAMADOL', '100 MG', 'Sólido', 'Similar', 'A2', '10', '508018110123904', 'ANALGÉSICOS NARCÓTICOS', '88.38', '122.18'), 
  (default, '4', 'METRONIDAZOL', 'METRONIDAZOL', '100 MG/G', 'Semissólido', 'Genérico', 'AM', '50 G + 10 APLIC', '528503907164118', 'TRICOMONICIDAS TÓPICOS', '24.99', '34.55'), 
  (default, '1', 'MELOVAC', 'MELOXICAM', '15 MG', 'Sólido', 'Similar', 'Liberado', '10', '541817080020603', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '45.54', '62.96'), 
  (default, '1', 'COLIAFT', 'TRIANCINOLONA ACETONIDA', '1 MG/G', 'Semissólido', 'Similar', 'Liberado', '10 G', '541818060085904', 'ANALGÉSICOS E ANTIINFLAMATÓRIOS BUCAIS DE USO TÓPICO', '11.82', '16.34'), 
  (default, '1', 'TIOCONAZOL + TINIDAZOL', 'TINIDAZOL;TIOCONAZOL', '20 MG/G', 'Semissólido', 'Genérico', 'Liberado', '35 G + 7 APLIC', '507723901162116', 'TRICOMONICIDAS TÓPICOS', '53.62', '71.44'), 
  (default, '17', 'OFLOXACINO', 'OFLOXACINO', '3 MG/ML', 'Líquido', 'Genérico', 'AM', '5 ML', '526123401173114', 'ANTIINFECCIOS OFTALMOLÓGICOS', '22.44', '31.02'), 
  (default, '35', 'NEOCORTIN', 'FOSFATO DISSÓDICO DE DEXAMETASONA;SULFATO DE NEOMICINA', '1,0 MG+5,0 MG/ML', 'Líquido', 'Similar', 'Liberado', '5 ML', '538817501176412', 'ASSOCIAÇÕES OFTALMOLÓGICAS CORTICOSTERÓIDES COM ANTIINFECCIOSOS', '9.3', '12.86'), 
  (default, '48', 'FOLIFER', 'ÁCIDO FÓLICO', '150 MG', 'Sólido', 'Específico', 'Liberado', '4', '560818020002708', 'ASSOCIAÇÕES DE FERRO', '8.03', '10.7'), 
  (default, '28', 'SUCCINATO DE SUMATRIPTANA', 'SUCCINATO DE SUMATRIPTANA', '50 MG', 'Sólido', 'Genérico', 'Liberado', '2', '504122060078417', 'ANTIENXAQUECOSOS TRIPTÂNICOS', '21.07', '29.13'), 
  (default, '7', 'DUO-DECADRON', 'FOSFATO DISSÓDICO DE DEXAMETASONA;ACETATO DE DEXAMETASONA', '8 MG/ML', 'Líquido', 'Similar', 'Liberado', '1 ML + SER DOS', '500508002151419', 'CORTICOSTERÓIDES INJETÁVEIS PUROS', '12.02', '16.62'), 
  (default, '49', 'TAKIL', 'TINIDAZOL;TIOCONAZOL', '20 MG', 'Semissólido', 'Similar', 'Liberado', '35 G + 7 APLIC DESC', '524802201163418', 'TRICOMONICIDAS TÓPICOS', '73.24', '97.58'), 
  (default, '23', 'PRED', 'ACETATO DE PREDNISOLONA', '10 MG/ML', 'Líquido', 'Novo', 'Liberado', '5 ML', '501004601173313', 'CORTICOSTERÓIDES OFTALMOLÓGICOS', '40.88', '54.46'), 
  (default, '50', 'DOMPERIDONA', 'DOMPERIDONA', '10 MG', 'Sólido', 'Genérico', 'Liberado', '90', '506423070052606', 'GASTROPROCINÉTICOS', '43.92', '58.51'), 
  (default, '10', 'DESOGESTREL + ETINILESTRADIOL', 'DESOGESTREL;ETINILESTRADIOL', '0,150 MG', 'Sólido', 'Genérico', 'Liberado', '63', '508021090142806', 'HORMÔNIOS CONTRACEPTIVOS MONOFÁSICOS COM ESTROGÊNIOS <50MCG', '76.66', '105.98'), 
  (default, '7', 'FLUNARIN', 'DICLORIDRATO DE FLUNARIZINA', '10MG', 'Sólido', 'Similar', 'Liberado', '60', '500508102113411', 'ANTAGONISTAS DO CÁLCIO COM AÇÃO CEREBRAL', '24.74', '34.2'), 
  (default, '33', 'CETOPROFENO', 'CETOPROFENO', '150 MG', 'Sólido', 'Genérico', 'Liberado', '60', '525319010054606', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '219.11', '250.0'), 
  (default, '17', 'CARVEDILOL', 'CARVEDILOL', '25 MG', 'Sólido', 'Genérico', 'Liberado', '60', '526112070086006', 'BETABLOQUEADORES PUROS', '209.73', '289.94'), 
  (default, '25', 'FLANAX', 'NAPROXENO SÓDICO', '550 MG', 'Sólido', 'Novo', 'Liberado', '4', '538919060029703', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '10.31', '13.73'), 
  (default, '1', 'POMAGLÓS TRATAMENTO', 'NISTATINA;OXIDO DE ZINCO', '100.000 UI/G + 200 MG/G', 'Semissólido', 'Similar', 'Liberado', '60 G', '541820120155207', 'ANTIFÚNGICOS DERMATOLÓGICOS TÓPICOS', '23.13', '30.82'), 
  (default, '34', 'FOLDAN', 'TIABENDAZOL', '50 MG/ML', 'Semissólido', 'Similar', 'Liberado', '50 ML', '533006103179418', 'ANTI-HELMÍNTICOS EXCETO ESQUISTOSSOMICIDAS (P1C)', '20.61', '27.46'), 
  (default, '35', 'NEOTRICIN', 'SULFATO DE NEOMICINA;BACITRACINA ZÍNCICA', '5 MG', 'Semissólido', 'Similar', 'Liberado', '50G', '538812090044403', 'ANTIBIÓTICOS TÓPICOS', '32.62', '43.46'), 
  (default, '35', 'MIOFIBRAX', 'CLORIDRATO DE CICLOBENZAPRINA', '10MG', 'Sólido', 'Similar', 'Liberado', '50', '538822030111703', 'RELAXANTE MUSCULAR DE AÇÃO CENTRAL', '62.4', '83.14'), 
  (default, '5', 'PREDNISOLONA', 'PREDNISOLONA', '40 MG', 'Sólido', 'Genérico', 'Liberado', '40', '543819120047807', 'CORTICOSTERÓIDES ORAIS PUROS', '174.93', '241.83'), 
  (default, '36', 'BROMAZEPAM (PORTARIA 344/98 - LISTA B1)', 'BROMAZEPAM', '6 MG', 'Sólido', 'Genérico', 'B1', '30', '504616020033817', 'TRANQUILIZANTES', '38.46', '53.17'), 
  (default, '36', 'GLIONIL', 'GLIBENCLAMIDA', '5 MG', 'Sólido', 'Similar', 'Liberado', '30', '504617040060517', 'ANTIDIABÉTICOS SULFONILOURÉIAS PUROS', '10.13', '14.0'), 
  (default, '13', 'ALPRAZOLAM', 'ALPRAZOLAM', '2,0 MG', 'Sólido', 'Genérico', 'B1', '30', '520731801111112', 'TRANQUILIZANTES', '89.29', '123.44'), 
  (default, '24', 'GLIBENCLAMIDA', 'GLIBENCLAMIDA', '5 MG', 'Sólido', 'Genérico', 'Liberado', '30', '525072903111111', 'ANTIDIABÉTICOS SULFONILOURÉIAS PUROS', '11.0', '15.21'), 
  (default, '33', 'CLORIDRATO DE METFORMINA +GLIBENCLAMIDA', 'GLIBENCLAMIDA;CLORIDRATO DE METFORMINA', '(500,0 + 2,5) MG', 'Sólido', 'Genérico', 'Liberado', '30', '525318050050106', 'ASSOCIAÇÕES DE ANTIDIABÉTICOS SULFONILOURÉIA COM BIGUANIDAS', '19.13', '26.45'), 
  (default, '15', 'GLUCOVANCE', 'GLIBENCLAMIDA;CLORIDRATO DE METFORMINA', '500 MG', 'Sólido', 'Novo', 'Liberado', '30', '525405203117418', 'ASSOCIAÇÕES DE ANTIDIABÉTICOS SULFONILOURÉIA COM BIGUANIDAS', '30.05', '41.54'), 
  (default, '15', 'LEVOTIROXINA SÓDICA', 'LEVOTIROXINA SÓDICA', '175 MCG', 'Sólido', 'Genérico', 'Liberado', '30', '525420605115111', 'PREPARAÇÕES PARA TIREOIDE', '15.18', '20.99'), 
  (default, '4', 'DIPROPIONATO DE BETAMETASONA + ÁCIDO SALICÍLICO', 'ÁCIDO SALICÍLICO;DIPROPIONATO DE BETAMETASONA', '0, 64 MG/ML', 'Líquido', 'Genérico', 'Liberado', '30 ML', '528522901133111', 'ANTIPSORÍASE TÓPICOS', '25.43', '33.88'), 
  (default, '22', 'DESLIN', 'DESLORATADINA', '5 MG', 'Sólido', 'Similar', 'Liberado', '30', '536217070008003', 'ANTI-HISTAMÍNICOS SISTÊMICOS', '134.73', '179.5'), 
  (default, '29', 'TRANQUINAL', 'ALPRAZOLAM', '1 MG', 'Sólido', 'Similar', 'B1', '30', '536512010007103', 'TRANQUILIZANTES', '65.39', '90.4'), 
  (default, '51', 'LUFTAL', 'SIMETICONA', '75 MG', 'Semissólido', 'Novo', 'Liberado', '30 ML', '540117100004117', 'Antiflatulentos Puros e Carminativos', '41.95', '55.89'), 
  (default, '1', 'ENERGIL ZINCO', 'ÁCIDO ASCÓRBICO;CITRATO DE ZINCO', '1 G + 10 MG', 'Sólido', 'Específico', 'Liberado', '30', '541819120114507', 'ASSOCIAÇÕES COM VITAMINA C', '44.41', '59.17'), 
  (default, '7', 'BESILATO DE ANLODIPINO', 'BESILATO DE ANLODIPINO', '10 MG', 'Sólido', 'Genérico', 'Liberado', '30', '552920040122417', 'ANTAGONISTAS DO CÁLCIO PUROS', '151.01', '208.76'), 
  (default, '17', 'ÁCIDO MEFENÂMICO', 'ÁCIDO MEFENÂMICO', '500 MG', 'Sólido', 'Genérico', 'Liberado', '24', '526128701116117', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '20.29', '28.05'), 
  (default, '34', 'MIRANOVA', 'LEVONORGESTREL MICRONIZADO;ETINILESTRADIOL', '(0,10 + 0,02 )MG', 'Sólido', 'Novo', 'Liberado', '21', '533022100081017', 'HORMÔNIOS CONTRACEPTIVOS MONOFÁSICOS COM ESTROGÊNIOS <50MCG', '20.34', '28.12'), 
  (default, '13', 'DICLOFENACO RESINATO', 'DICLOFENACO DE POTÁSSIO', '15 MG/ML', 'Líquido', 'Genérico', 'Liberado', '20 ML', '520709101135111', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '12.78', '17.67'), 
  (default, '33', 'DICLOFENACO RESINATO', 'DICLOFENACO', '15 MG/ML', 'Líquido', 'Genérico', 'Liberado', '20 ML', '525305901130111', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '14.12', '19.52'), 
  (default, '3', 'VOLTAREN', 'DICLOFENACO SÓDICO', '75 MG', 'Sólido', 'Novo', 'Liberado', '20', '526516509115312', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '41.22', '56.98'), 
  (default, '13', 'CIMETIDINA', 'CIMETIDINA', '400 MG', 'Sólido', 'Genérico', 'Liberado', '16', '520706104117118', 'ANTAGONISTAS RECEPTORES H2', '33.07', '45.72'), 
  (default, '1', 'MUPIROX', 'CICLOPIROX OLAMINA', '10 MG/ML', 'Líquido', 'Similar', 'Liberado', '15 ML', '507741701171411', 'ANTIFÚNGICOS DERMATOLÓGICOS TÓPICOS', '23.73', '31.62'), 
  (default, '2', 'MICOSTATIN', 'NISTATINA', '25.000 UI/G', 'Semissólido', 'Novo', 'Liberado', '60 G + 14 APLIC', '501113090020914', 'ANTIFÚNGICOS GINECOLÓGICOS', '21.8', '30.14'), 
  (default, '4', 'NITRATO DE MICONAZOL', 'NITRATO DE MICONAZOL', '20 MG/G', 'Semissólido', 'Genérico', 'Liberado', '80 G + 14 APLIC', '528504311168111', 'ANTIFÚNGICOS GINECOLÓGICOS', '24.67', '34.1'), 
  (default, '7', 'NOVOCILIN', 'AMOXICILINA TRI-HIDRATADA', '80 MG/ML', 'Líquido', 'Similar', 'AM', '10 ML', '500505902135415', 'PENICILINAS ORAIS DE AMPLO ESPECTRO', '59.79', '82.66'), 
  (default, '7', 'DECADRON', 'DEXAMETASONA', '4 MG', 'Sólido', 'Similar', 'Liberado', '10', '500510404113416', 'CORTICOSTERÓIDES ORAIS PUROS', '17.35', '23.99'), 
  (default, '1', 'MELOXICAM', 'MELOXICAM', '15 MG', 'Sólido', 'Genérico', 'Liberado', '10', '507717302112117', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '45.6', '63.04'), 
  (default, '12', 'CLORIDRATO DE CIPROFLOXACINO', 'CLORIDRATO DE CIPROFLOXACINO', '500 MG', 'Sólido', 'Genérico', 'AM', '10', '511502005111117', 'FLUORQUINOLONAS ORAIS', '87.56', '121.05'), 
  (default, '16', 'AVIANT EFE', 'DESLORATADINA;SULFATO DE PSEUDOEFEDRINA', '2,5 MG', 'Sólido', 'Similar', 'Liberado', '10', '525522040022017', 'PREPARAÇÕES SISTÊMICAS NASAIS', '46.93', '62.53'), 
  (default, '3', 'CATAFLAM', 'DICLOFENACO POTÁSSICO', '50 MG', 'Sólido', 'Novo', 'Liberado', '10', '526502713114310', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '18.46', '25.52'), 
  (default, '34', 'CEF', 'CEFALEXINA MONOIDRATADA', '500 MG', 'Sólido', 'Similar', 'AM', '10', '533020090071807', 'CEFALOSPORINAS ORAIS', '27.52', '38.04'), 
  (default, '1', 'CLORIDRATO DE FEXOFENADINA + CLORIDRATO DE PSEUDOEFEDRINA', 'CLORIDRATO DE FEXOFENADINA;CLORIDRATO DE PSEUDOEFEDRINA', '60 MG', 'Sólido', 'Similar', 'Liberado', '10', '541821010156206', 'PREPARAÇÕES SISTÊMICAS NASAIS', '33.86', '45.11'), 
  (default, '17', 'CEFALEXINA', 'CEFALEXINA MONOIDRATADA', '1G', 'Sólido', 'Genérico', 'AM', '8', '526120050113207', 'CEFALOSPORINAS ORAIS', '69.94', '96.69'), 
  (default, '17', 'CLORIDRATO DE CIPROFLOXACINO MONOIDRATADO + DEXAMETASONA', 'CLORIDRATO DE CIPROFLOXACINO ;DEXAMETASONA', '3,5 MG/ML', 'Líquido', 'Genérico', 'AM', '5 ML', '526128801171111', 'ASSOCIAÇÕES OFTALMOLÓGICAS CORTICOSTERÓIDES COM ANTIINFECCIOSOS', '23.28', '32.18'), 
  (default, '20', 'PLETIL', 'TINIDAZOL', '500 MG', 'Sólido', 'Novo', 'Liberado', '4', '522718050081317', 'TRICOMONICIDAS SISTÊMICOS', '15.9', '21.18'), 
  (default, '17', 'TINIDAZOL', 'TINIDAZOL', '500 MG', 'Sólido', 'Genérico', 'Liberado', '4', '526128301118112', 'TRICOMONICIDAS SISTÊMICOS', '10.9', '14.52'), 
  (default, '1', 'LEVERCTIN', 'IVERMECTINA', '6 MG', 'Sólido', 'Similar', 'Liberado', '4', '541814120009303', 'ANTI-HELMÍNTICOS EXCETO ESQUISTOSSOMICIDAS (P1C)', '31.04', '42.91'), 
  (default, '24', 'TADALAFILA', 'TADALAFILA', '20 MG', 'Sólido', 'Genérico', 'Liberado', '2', '525014110106306', 'PRODUTOS PARA DISFUNÇÃO ERÉTIL, INIBIDORES DA PDE5', '22.74', '31.44'), 
  (default, '36', 'NEODIA', 'LEVONORGESTREL', '1,5 MG', 'Sólido', 'Similar', 'Liberado', '1', '504616050040218', 'CONTRACEPTIVO SISTÊMICO DE EMERGÊNCIA', '25.5', '35.25'), 
  (default, '7', 'NOTUSS TSS', 'DROPROPIZINA', '3 MG/ML', 'Líquido', 'Similar', 'Liberado', '120 ML + COP', '500513080052004', 'ANTITUSSÍGENOS PUROS', '19.56', '26.06'), 
  (default, '13', 'DICLORIDRATO DE CETIRIZINA', 'DICLORIDRATO DE CETIRIZINA', '1 MG/ML', 'Líquido', 'Genérico', 'Liberado', '120 ML + COP', '520729101130112', 'ANTI-HISTAMÍNICOS SISTÊMICOS', '33.72', '44.93'), 
  (default, '24', 'CEFALEXINA', 'CEFALEXINA', '50 MG/ML', 'Líquido', 'Genérico', 'AM', '100ML + SER DOSAD', '525064301130117', 'CEFALOSPORINAS ORAIS', '45.09', '62.33'), 
  (default, '4', 'DOPROPIZINA', 'DROPROPIZINA', '3 MG/ML', 'Líquido', 'Genérico', 'Liberado', '120 ML + COP', '528502606136117', 'ANTITUSSÍGENOS PUROS', '17.63', '23.49'), 
  (default, '34', 'STER', 'ACETATO DE PREDNISOLONA', '10 MG/ML', 'Líquido', 'Similar', 'Liberado', '5 ML', '533022902171411', 'CORTICOSTERÓIDES OFTALMOLÓGICOS', '23.37', '31.14'), 
  (default, '1', 'BESILATO DE ANLODIPINO+ATENOLOL', 'ATENOLOL;BESILATO DE ANLODIPINO', '(5,0  + 25,0) MG', 'Sólido', 'Genérico', 'Liberado', '60', '541818110093406', 'ANTAGONISTAS DO CÁLCIO ASSOCIADOS A BETABLOQUEADORES', '89.29', '123.44'), 
  (default, '52', 'ZYLORIC', 'ALOPURINOL', '100 MG', 'Sólido', 'Novo', 'Liberado', '30', '505609601116310', 'ANTIGOTOSOS', '15.77', '21.8'), 
  (default, '1', 'CLORTALIDONA', 'CLORTALIDONA', '50 MG', 'Sólido', 'Genérico', 'Liberado', '30', '507708303111115', 'DIURÉTICOS TIAZIDAS E ANÁLOGOS PUROS', '19.49', '26.94'), 
  (default, '3', 'ALOPURINOL', 'ALOPURINOL', '300 MG', 'Sólido', 'Genérico', 'Liberado', '30', '526518070093406', 'ANTIGOTOSOS', '30.15', '41.68'), 
  (default, '31', 'AMOXICILINA', 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'AM', '21', '529921080073706', 'PENICILINAS ORAIS DE AMPLO ESPECTRO', '52.85', '73.06'), 
  (default, '34', 'TANDRIFLAN', 'CARISOPRODOL', '300 MG', 'Sólido', 'Similar', 'Liberado', '15', '533012120058603', 'RELAXANTE MUSCULAR DE AÇÃO CENTRAL', '19.6', '26.11'), 
  (default, '7', 'NOVOCILIN', 'AMOXICILINA TRIHIDRATADA', '875 MG', 'Sólido', 'Similar', 'AM', '14', '500505905118414', 'PENICILINAS ORAIS DE AMPLO ESPECTRO', '83.23', '115.06'), 
  (default, '33', 'NORFLOXACINO', 'NORFLOXACINO', '400 MG', 'Sólido', 'Genérico', 'AM', '14', '525317080049006', 'FLUORQUINOLONAS ORAIS', '44.76', '61.88'), 
  (default, '18', 'NORF', 'NORFLOXACINO', '400 MG', 'Sólido', 'Similar', 'AM', '14', '531615040077603', 'FLUORQUINOLONAS ORAIS', '26.76', '36.99'), 
  (default, '7', 'AMOXICILINA TRI-HIDRATADA', 'AMOXICILINA TRIHIDRATADA', '875 MG', 'Sólido', 'Genérico', 'AM', '14', '552919060078817', 'PENICILINAS ORAIS DE AMPLO ESPECTRO', '65.52', '90.58'), 
  (default, '18', 'OSTEOFORM', 'ALENDRONATO DE SÓDIO TRI-HIDRATADO', '70 MG', 'Sólido', 'Similar', 'Liberado', '8', '531602806110416', 'BISFOSFONATOS PARA OSTEOPOROSE E ALTERAÇÕES RELACIONADAS', '107.1', '148.06'), 
  (default, '1', 'ALENDRONATO DE SÓDIO', 'ALENDRONATO DE SÓDIO TRI-HIDRATADO', '70 MG', 'Sólido', 'Genérico', 'Liberado', '4', '507731502115115', 'BISFOSFONATOS PARA OSTEOPOROSE E ALTERAÇÕES RELACIONADAS', '137.28', '189.78'), 
  (default, '43', 'ALENDIL', 'ALENDRONATO SÓDICO TRIHIDRATADO', '70 MG', 'Sólido', 'Similar', 'Liberado', '4', '509000406118415', 'BISFOSFONATOS PARA OSTEOPOROSE E ALTERAÇÕES RELACIONADAS', '136.63', '188.88'), 
  (default, '12', 'ALENDRONATO DE SÓDIO', 'ALENDRONATO DE SÓDIO', '70 MG', 'Sólido', 'Genérico', 'Liberado', '4', '511516202119110', 'BISFOSFONATOS PARA OSTEOPOROSE E ALTERAÇÕES RELACIONADAS', '52.11', '72.04'), 
  (default, '13', 'ALBENDAZOL', 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Liberado', '3', '520717070108106', 'ANTI-HELMÍNTICOS EXCETO ESQUISTOSSOMICIDAS (P1C)', '23.96', '33.12'), 
  (default, '35', 'MONOZOL', 'ALBENDAZOL', '400 MG', 'Sólido', 'Similar', 'Liberado', '1', '538818002114411', 'ANTI-HELMÍNTICOS EXCETO ESQUISTOSSOMICIDAS (P1C)', '11.95', '16.52'), 
  (default, '10', 'AMOXICILINA', 'AMOXICILINA;AMOXICILINA TRI-HIDRATADA', '80 MG/ML', 'Líquido', 'Genérico', 'AM', '100 ML + SER DOS', '508000307138110', 'PENICILINAS ORAIS DE AMPLO ESPECTRO', '35.83', '49.53'), 
  (default, '1', 'AMOXICILINA', 'AMOXICILINA TRI-HIDRATADA', '100 MG/ML', 'Líquido', 'Genérico', 'AM', '150 ML  + COP', '541818100091506', 'PENICILINAS ORAIS DE AMPLO ESPECTRO', '70.54', '97.52'), 
  (default, '24', 'NOVALGINA', 'DIPIRONA MONOIDRATADA', '500 MG', 'Sólido', 'Novo', 'Liberado', '10', '576720070077517', 'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS ISENTOS DE PRESCRIÇÃO', '11.85', '15.78'), 
  (default, '47', 'CETOZOL', 'CETOCONAZOL', '20 MG/ML', 'Semissólido', 'Similar', 'Liberado', '100 ML', '505502702179411', 'ANTIFÚNGICOS TÓPICOS DO COURO CABELUDO', '67.32', '89.69'), 
  (default, '33', 'BEZIANY', 'ACETATO DE CLORMADINONA;ETINILESTRADIOL', '(2 + 0,03) MG', 'Sólido', 'Similar', 'Liberado', '84', '525322030106604', 'HORMÔNIOS CONTRACEPTIVOS MONOFÁSICOS COM ESTROGÊNIOS <50MCG', '171.68', '237.34'), 
  (default, '34', 'MYLUS', 'DESOGESTREL', '0,075 MG', 'Sólido', 'Similar', 'Liberado', '84', '533019120068107', 'PREPARAÇÕES ORAIS COM PROGESTAGÊNIOS SOMENTE', '99.48', '137.53'), 
  (default, '5', 'DESOGESTREL', 'DESOGESTREL', '0,075 MG', 'Sólido', 'Genérico', 'Liberado', '84', '543820080057307', 'PREPARAÇÕES ORAIS COM PROGESTAGÊNIOS SOMENTE', '77.76', '107.5'), 
  (default, '44', 'LINOFEME', 'LEVONORGESTREL;ETINILESTRADIOL', '(0,15 + 0,03) MG', 'Sólido', 'Similar', 'Liberado', '63', '506320110036317', 'HORMÔNIOS CONTRACEPTIVOS MONOFÁSICOS COM ESTROGÊNIOS <50MCG', '25.12', '34.73'), 
  (default, '36', 'PEPSAMAR', 'HIDRÓXIDO DE ALUMÍNIO', '230 MG', 'Sólido', 'Específico', 'Liberado', '50', '504623020091417', 'ANTIÁCIDOS PUROS', '25.6', '34.11'), 
  (default, '36', 'FLUXON', 'CINARIZINA', '75 MG', 'Sólido', 'Similar', 'Liberado', '30', '504620110079207', 'ANTAGONISTAS DO CÁLCIO COM AÇÃO CEREBRAL', '14.33', '19.81'), 
  (default, '47', 'DIUREZIN', 'HIDROCLOROTIAZIDA', '50 MG', 'Sólido', 'Similar', 'Liberado', '30', '505521040022003', 'DIURÉTICOS TIAZIDAS E ANÁLOGOS PUROS', '10.78', '14.9'), 
  (default, '31', 'CINARIZINA', 'CINARIZINA', '25 MG', 'Sólido', 'Genérico', 'Liberado', '30', '529912302119113', 'ANTAGONISTAS DO CÁLCIO COM AÇÃO CEREBRAL', '12.1', '16.73'), 
  (default, '34', 'TRIQUILAR', 'LEVONORGESTREL;ETINILESTRADIOL', '(0,05 MG + 0,03 MG)', 'Sólido', 'Novo', 'Liberado', '(18 + 15 +30)', '533023050085403', 'PREPARAÇÕES CONTRACEPTIVAS TRIFÁSICAS', '27.18', '37.57'), 
  (default, '28', 'GESTRELAN', 'LEVONORGESTREL MICRONIZADO;ETINILESTRADIOL', '(0,15 + 0,03) MG', 'Sólido', 'Similar', 'Liberado', '21', '504121010070503', 'HORMÔNIOS CONTRACEPTIVOS MONOFÁSICOS COM ESTROGÊNIOS <50MCG', '9.17', '12.68'), 
  (default, '28', 'LEVONORGESTREL + ETINILESTRADIOL', 'LEVONORGESTREL MICRONIZADO;ETINILESTRADIOL', '(0,15 + 0,03) MG', 'Sólido', 'Genérico', 'Liberado', '21', '504121070071306', 'HORMÔNIOS CONTRACEPTIVOS MONOFÁSICOS COM ESTROGÊNIOS <50MCG', '5.95', '8.23'), 
  (default, '16', 'MERCILON', 'DESOGESTREL;ETINILESTRADIOL', '0,15 MG', 'Sólido', 'Novo', 'Liberado', '21', '525522080025217', 'HORMÔNIOS CONTRACEPTIVOS MONOFÁSICOS COM ESTROGÊNIOS <50MCG', '43.68', '60.39'), 
  (default, '24', 'CICLOPIROX OLAMINA', 'CICLOPIROX OLAMINA', '10 MG/G', 'Semissólido', 'Genérico', 'Liberado', '20G', '525066701160117', 'ANTIFÚNGICOS DERMATOLÓGICOS TÓPICOS', '25.91', '34.52'), 
  (default, '47', 'ALBISTIN', 'NISTATINA', '25.000 UI/G', 'Semissólido', 'Similar', 'Liberado', '60 G +  14 APLIC', '505515080021403', 'ANTIFÚNGICOS GINECOLÓGICOS', '37.55', '51.91'), 
  (default, '44', 'PREXULID', 'NIMESULIDA', '100 MG', 'Líquido', 'Similar', 'Liberado', '12', '506320120036907', 'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS SOB PRESCRIÇÃO', '31.71', '43.84'), 
  (default, '25', 'CLARITIN', 'LORATADINA', '10 MG', 'Sólido', 'Novo', 'Liberado', '12', '538917110028317', 'ANTI-HISTAMÍNICOS SISTÊMICOS', '16.13', '21.49'), 
  (default, '13', 'NAPROXENO', 'NAPROXENO', '500 MG', 'Sólido', 'Genérico', 'Liberado', '10', '520716090105206', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '13.78', '18.36'), 
  (default, '10', 'PERCOIDE', 'PREDNISOLONA', '40 MG', 'Sólido', 'Similar', 'Liberado', '7', '508022050161117', 'CORTICOSTERÓIDES ORAIS PUROS', '47.09', '65.1'), 
  (default, '35', 'IVERMECTINA', 'IVERMECTINA', '6 MG', 'Sólido', 'Genérico', 'Liberado', '4', '538821020101006', 'ANTI-HELMÍNTICOS EXCETO ESQUISTOSSOMICIDAS (P1C)', '28.65', '39.61'), 
  (default, '19', 'REVECTINA', 'IVERMECTINA', '6 MG', 'Sólido', 'Novo', 'Liberado', '2', '500214100032917', 'ANTI-HELMÍNTICOS EXCETO ESQUISTOSSOMICIDAS (P1C)', '23.44', '32.4'), 
  (default, '50', 'TADALAFILA', 'TADALAFILA', '20 MG', 'Sólido', 'Genérico', 'Liberado', '2', '506421020046706', 'PRODUTOS PARA DISFUNÇÃO ERÉTIL, INIBIDORES DA PDE5', '27.71', '38.31'), 
  (default, '13', 'FUROSEMIDA', 'FUROSEMIDA', '10 MG/ML', 'Líquido', 'Genérico', 'Liberado', '2 ML', '520711306156110', 'DIURÉTICOS DE ALÇA PUROS', '74.7', '89.0'), 
  (default, '24', 'LASIX', 'FUROSEMIDA', '10 MG/ML', 'Líquido', 'Novo', 'Liberado', '2 ML', '576720040061617', 'DIURÉTICOS DE ALÇA PUROS', '10.1', '13.96'), 
  (default, '24', 'TADALAFILA', 'TADALAFILA', '20 MG', 'Sólido', 'Genérico', 'Liberado', '1', '525014110106206', 'PRODUTOS PARA DISFUNÇÃO ERÉTIL, INIBIDORES DA PDE5', '17.74', '24.52'), 
  (default, '7', 'LEVONORGESTREL', 'LEVONORGESTREL', '1,5 MG', 'Sólido', 'Genérico', 'Liberado', '1', '552922020142617', 'CONTRACEPTIVO SISTÊMICO DE EMERGÊNCIA', '20.71', '28.63'), 
  (default, '7', 'ACEBROFILINA', 'ACEBROFILINA', '10 MG/ML', 'Líquido', 'Genérico', 'Liberado', '120 ML + CP MED', '552920020116617', 'EXPECTORANTES', '29.85', '41.27'), 
  (default, '33', 'OMEPRAZOL', 'OMEPRAZOL', '40 MG', 'Sólido', 'Genérico', 'Liberado', '56', '525322010104606', 'INIBIDORES DA BOMBA DE PRÓTONS', '246.88', '341.3'), 
  (default, '47', 'PRANOLAL', 'CLORIDRATO DE PROPRANOLOL', '40 MG', 'Sólido', 'Similar', 'Liberado', '50', '505508002111414', 'BETABLOQUEADORES PUROS', '13.11', '18.12'), 
  (default, '36', 'CLORIDRATO DE PROPRANOLOL', 'CLORIDRATO DE PROPRANOLOL', '80 MG', 'Sólido', 'Genérico', 'Liberado', '30', '504616090044717', 'BETABLOQUEADORES PUROS', '11.24', '15.54'), 
  (default, '13', 'CETOCORT', 'BETAMETASONA;CETOCONAZOL', '20 MG + 0,5 MG/G', 'Semissólido', 'Similar', 'Liberado', '30 G', '520705902168412', 'CORTICOESTERÓIDES ASSOCIADOS A ANTIMICOTICOS', '38.92', '51.85'), 
  (default, '33', 'DESLORATADINA', 'DESLORATADINA', '5 MG', 'Sólido', 'Genérico', 'Liberado', '30', '525312050035106', 'ANTI-HISTAMÍNICOS SISTÊMICOS', '102.23', '136.2'), 
  (default, '1', 'BROMOPRIDA', 'BROMOPRIDA', '10 MG', 'Sólido', 'Genérico', 'Liberado', '20', '507733103110116', 'GASTROPROCINÉTICOS', '25.25', '33.64'), 
  (default, '13', 'ACETATO DE HIDROCORTISONA', 'ACETATO DE HIDROCORTISONA', '10 MG/G', 'Semissólido', 'Genérico', 'Liberado', '20 G', '520717040107406', 'CORTICOESTERÓIDES TÓPICOS PUROS', '12.66', '16.87'), 
  (default, '34', 'UNIDEXA', 'FOSFATO DISSÓDICO DE DEXAMETASONA', '2 MG', 'Líquido', 'Similar', 'Liberado', '1 ML', '533012202159411', 'CORTICOSTERÓIDES INJETÁVEIS PUROS', '18.02', '24.91'), 
  (default, '44', 'IBUCAPS', 'IBUPROFENO', '600 MG', 'Semissólido', 'Similar', 'Liberado', '10', '506321100039404', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '12.2', '16.2'), 
  (default, '53', 'XAROPE 44 E', 'BROMIDRATO DE DEXTROMETORFANO;GUAIFENESINA', '1,30 MG/ML', 'Líquido', 'Similar', 'Liberado', '120 ML', '528700801131419', 'ANTITUSSÍGENOS ASSOCIADOS', '27.03', '36.01'), 
  (default, '24', 'AAS', 'ACIDO ACETILSALICILICO', '100 MG', 'Sólido', 'Similar', 'Liberado', '10', '576720070076217', 'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS ISENTOS DE PRESCRIÇÃO', '5.41', '7.2'), 
  (default, '25', 'ASPIRINA PREVENT', 'ÁCIDO ACETILSALICÍLICO', '100 MG', 'Sólido', 'Novo', 'Liberado', '90', '538916010026303', 'INIBIDORES DA AGREGAÇÃO PLAQUETÁRIA, CICLO-OXIGENASE INIBIDORES ', '52.41', '69.83'), 
  (default, '28', 'ABLOK', 'ATENOLOL', '100 MG', 'Sólido', 'Similar', 'Liberado', '60', '504114100052603', 'BETABLOQUEADORES PUROS', '84.29', '116.53'), 
  (default, '54', 'BACTODERM', 'BACITRACINA;SULFATO DE NEOMICINA', '5,0 MG/G', 'Semissólido', 'Similar', 'Liberado', '50 G', '515114040011103', 'ANTIBIÓTICOS TÓPICOS', '18.35', '24.45'), 
  (default, '20', 'MOTRIN', 'IBUPROFENO', '600 MG', 'Sólido', 'Novo', 'Liberado', '50', '522718030077417', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '77.24', '106.78'), 
  (default, '35', 'CLORIDRATO DE CICLOBENZAPRINA', 'CLORIDRATO DE CICLOBENZAPRINA', '10MG', 'Sólido', 'Genérico', 'Liberado', '50', '538822070113006', 'RELAXANTE MUSCULAR DE AÇÃO CENTRAL', '54.17', '72.17'), 
  (default, '5', 'IBUPROFENO', 'IBUPROFENO', '400 MG', 'Semissólido', 'Genérico', 'Liberado', '48', '543822080065707', 'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS ISENTOS DE PRESCRIÇÃO', '66.4', '88.47'), 
  (default, '1', 'MALEATO DE ENALAPRIL', 'MALEATO DE ENALAPRIL', '20 MG', 'Sólido', 'Genérico', 'Liberado', '30', '507717102113111', 'INIBIDORES DA ECA PUROS', '65.26', '90.22'), 
  (default, '16', 'RENITEC', 'MALEATO DE ENALAPRIL', '5 MG', 'Sólido', 'Novo', 'Liberado', '30', '525501904112319', 'INIBIDORES DA ECA PUROS', '27.85', '38.5'), 
  (default, '7', 'SINERGEN', 'MALEATO DE ENALAPRIL;BESILATO DE ANLODIPINO', '(5+20) MG', 'Sólido', 'Novo', 'Liberado', '30', '552920030120217', 'INIBIDORES DA ECA ASSOCIADOS A ANTAGONISTAS DO CÁLCIO (C8)', '111.12', '153.62'), 
  (default, '27', 'TYLENOL SINUS', 'PARACETAMOL;CLORIDRATO DE PSEUDOEFEDRINA', '500 MG', 'Sólido', 'Novo', 'Liberado', '24', '514520050037417', 'ANTIGRIPAIS SEM ANTIINFECCIOSOS', '17.08', '22.76'), 
  (default, '1', 'EMSFEB EFE', 'PARACETAMOL;CLORIDRATO DE PSEUDOEFEDRINA', '500 MG', 'Sólido', 'Genérico', 'Liberado', '24', '541818100090703', 'ANTIGRIPAIS SEM ANTIINFECCIOSOS', '11.06', '14.74'), 
  (default, '44', 'DEXTAMINE', 'BETAMETASONA', '2 MG', 'Sólido', 'Similar', 'Liberado', '20', '506314070028604', 'ASSOCIAÇÕES DE CORTICOSTERÓIDES SISTÊMICOS', '20.75', '27.65'), 
  (default, '33', 'PARACETAMOL + CAFEÍNA', 'PARACETAMOL;CAFEÍNA', '500 MG', 'Sólido', 'Genérico', 'Liberado', '20', '525320060076207', 'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS ISENTOS DE PRESCRIÇÃO', '20.55', '27.38'), 
  (default, '4', 'NIMESULIDA', 'NIMESULIDA', '100 MG', 'Sólido', 'Genérico', 'Liberado', '20', '528518070135206', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '48.3', '66.77'), 
  (default, '7', 'DORILAX DT', 'PARACETAMOL;CAFEÍNA ANIDRA;CITRATO DE ORFENADRINA', '(450,0 + 50,0 + 35,0) MG', 'Sólido', 'Similar', 'Liberado', '12', '552920010102107', 'RELAXANTE MUSCULAR DE AÇÃO CENTRAL', '6.9', '9.19'), 
  (default, '51', 'LUFTAFEM', 'IBUPROFENO;PARACETAMOL', '(200,0 + 500,0) MG', 'Sólido', 'Similar', 'Liberado', '6', '540121020004907', 'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS ISENTOS DE PRESCRIÇÃO', '12.0', '15.99'), 
  (default, '51', 'NUROMOL', 'IBUPROFENO;PARACETAMOL', '(200,0 + 500,0) MG', 'Sólido', 'Novo', 'Liberado', '6', '540121020005207', 'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS ISENTOS DE PRESCRIÇÃO', '12.0', '15.99'), 
  (default, '53', 'ALGINAC', 'DICLOFENACO DE SÓDIO;CLORIDRATO DE TIAMINA;CLORIDRATO DE PIRIDOXINA;CIANOCOBALAMINA', '(50,0 + 50,0) MG/ML', 'Líquido', 'Novo', 'Liberado', '1 ML', '528720070003317', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS ASSOCIADOS', '7.96', '11.0'), 
  (default, '13', 'MALEATO DE DEXCLORFENIRAMINA + BETAMETASONA', 'BETAMETASONA', '0,4 MG/ML', 'Líquido', 'Genérico', 'Liberado', '120 ML + COP', '520721202132115', 'ASSOCIAÇÕES DE CORTICOSTERÓIDES SISTÊMICOS', '27.17', '36.2'), 
  (default, '35', 'NISTATINA', 'NISTATINA', '100 000 UI/ML', 'Líquido', 'Genérico', 'Liberado', '50 ML+ CGT', '538816201136115', 'ANTIFÚNGICOS ORAIS TÓPICOS', '26.23', '36.26'), 
  (default, '1', 'ACETATO DE DEXAMETASONA', 'ACETATO DE DEXAMETASONA', '1 MG/G', 'Semissólido', 'Genérico', 'Liberado', '10 G', '507739001166111', 'CORTICOESTERÓIDES TÓPICOS PUROS', '9.39', '12.98'), 
  (default, '35', 'DEXADERMIL', 'ACETATO DE DEXAMETASONA', '1MG/G', 'Semissólido', 'Similar', 'Liberado', '10 G', '538811101168413', 'CORTICOESTERÓIDES TÓPICOS PUROS', '12.04', '16.64'), 
  (default, '10', 'DIPROPIONATO DE BETAMETASONA + FOSFATO DISSÓDICO DE BETAMETASONA', 'FOSFATO DISSÓDICO DE BETAMETASONA;DIPROPIONATO DE BETAMETASONA', '5 MG/ML', 'Líquido', 'Genérico', 'Liberado', '1 ML', '508017040116406', 'CORTICOSTERÓIDES INJETÁVEIS PUROS', '17.88', '24.71'), 
  (default, '10', 'BETATRINTA', 'FOSFATO DISSÓDICO DE BETAMETASONA;DIPROPIONATO DE BETAMETASONA', '5 MG/ML', 'Líquido', 'Similar', 'Liberado', '1 ML', '508021030138403', 'CORTICOSTERÓIDES INJETÁVEIS PUROS', '17.88', '24.71'), 
  (default, '1', 'GRIPEN F', 'MALEATO DE CLORFENIRAMINA;PARACETAMOL;CLORIDRATO DE FENILEFRINA', '(400 + 4 + 4) MG', 'Sólido', 'Similar', 'Liberado', '10', '541820030122507', 'ANTIGRIPAIS SEM ANTIINFECCIOSOS', '8.45', '11.26'), 
  (default, '54', 'RESFENOL', 'MALEATO DE CLORFENIRAMINA;PARACETAMOL;CLORIDRATO DE FENILEFRINA', '(400 + 4 + 4)MG', 'Sólido', 'Novo', 'Liberado', '4', '515102405115418', 'ANTIGRIPAIS SEM ANTIINFECCIOSOS', '3.53', '4.7'), 
  (default, '50', 'CARBOCIN', 'CARBOCISTEÍNA', '50 MG/ML', 'Líquido', 'Similar', 'Liberado', '100 ML', '506401402135428', 'EXPECTORANTES', '20.38', '27.15'), 
  (default, '24', 'DORFLEX UNO', 'DIPIRONA MONOIDRATADA', '1G', 'Sólido', 'Similar', 'Liberado', '10', '576723070102207', 'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS ISENTOS DE PRESCRIÇÃO', '24.51', '32.66'), 
  (default, '35', 'REPOPIL 35', 'ACETATO DE CIPROTERONA;ETINILESTRADIOL', '2,00 MG', 'Sólido', 'Similar', 'Liberado', '63', '538808402111410', 'HORMÔNIOS CONTRACEPTIVOS MONOFÁSICOS COM ESTROGÊNIOS <50MCG', '70.9', '98.02'), 
  (default, '1', 'ACETATO DE CIPROTERONA+ETINILESTRADIOL', 'ACETATO DE CIPROTERONA;ETINILESTRADIOL', '2,00 MG', 'Sólido', 'Genérico', 'Liberado', '63', '541822120190006', 'HORMÔNIOS CONTRACEPTIVOS MONOFÁSICOS COM ESTROGÊNIOS <50MCG', '47.55', '65.74'), 
  (default, '4', 'SULFATO DE NEOMICINA + BACITRACINA ZÍNCICA', 'SULFATO DE NEOMICINA;BACITRACINA ZÍNCICA', '5 MG/G', 'Semissólido', 'Genérico', 'Liberado', '50 G', '528524402169115', 'ANTIBIÓTICOS TÓPICOS', '19.65', '26.18'), 
  (default, '34', 'TANDRIFLAN', 'CARISOPRODOL;PARACETAMOL;CAFEÍNA;DICLOFENACO SÓDICO', '300 MG', 'Sólido', 'Similar', 'Liberado', '30', '533010401111410', 'RELAXANTE MUSCULAR DE AÇÃO CENTRAL', '39.25', '52.29'), 
  (default, '34', 'PARACETAMOL + CARISOPRODOL + DICLOFENACO SÓDICO + CAFEÍNA', 'CARISOPRODOL;PARACETAMOL;CAFEÍNA;DICLOFENACO SÓDICO', '(300 + 125 + 50 + 30) MG', 'Sólido', 'Genérico', 'Liberado', '30', '533023070086406', 'RELAXANTE MUSCULAR DE AÇÃO CENTRAL', '30.75', '40.97'), 
  (default, '25', 'DIANE 35', 'ACETATO DE CIPROTERONA;ETINILESTRADIOL', '(2,000+ 0,035) MG', 'Sólido', 'Novo', 'Liberado', '21', '538912080018214', 'HORMÔNIOS CONTRACEPTIVOS MONOFÁSICOS COM ESTROGÊNIOS <50MCG', '28.51', '39.41'), 
  (default, '36', 'DORALGINA', 'DIPIRONA MONOIDRATADA;CAFEÍNA ANIDRA;MUCATO DE ISOMETEPTENO', '30 MG', 'Sólido', 'Similar', 'Liberado', '20', '504614110026017', 'ASSOCIAÇÕES DE ANTIESPASMÓDICOS COM ANALGÉSICOS', '21.39', '28.5'), 
  (default, '47', 'SEDOL', 'CAFEÍNA ANIDRA;MUCATO DE ISOMETEPTENO;DIPIRONA', '(300,0 + 30,0 +30,0) MG', 'Sólido', 'Similar', 'Liberado', '20', '505509302117416', 'ASSOCIAÇÕES DE ANTIESPASMÓDICOS COM ANALGÉSICOS', '17.29', '23.04'), 
  (default, '54', 'RESFENOL', 'MALEATO DE CLORFENAMINA;PARACETAMOL;CLORIDRATO DE FENILEFRINA', '(400 + 4 + 4)MG', 'Sólido', 'Novo', 'Liberado', '20', '515102409110313', 'ANTIGRIPAIS SEM ANTIINFECCIOSOS', '17.56', '23.4'), 
  (default, '13', 'ANTIDIN', 'CLORIDRATO DE RANITIDINA', '300 MG', 'Sólido', 'Similar', 'Liberado', '20', '520720020109807', 'ANTAGONISTAS RECEPTORES H2', '54.68', '75.59'), 
  (default, '34', 'NEOCOPAN COMPOSTO', 'DIPIRONA MONOIDRATADA;BUTILBROMETO DE ESCOPOLAMINA', '(10,0 + 250,0) MG', 'Sólido', 'Similar', 'Liberado', '20', '533021020073517', 'ASSOCIAÇÕES DE ANTIESPASMÓDICOS COM ANALGÉSICOS', '13.67', '18.21'), 
  (default, '7', 'CLORIDRATO DE RANITIDINA', 'CLORIDRATO DE RANITIDINA', '300 MG', 'Sólido', 'Genérico', 'Liberado', '20', '552920010101117', 'ANTAGONISTAS RECEPTORES H2', '95.35', '131.82'), 
  (default, '10', 'TRIMUSK', 'DICLOFENACO DE SÓDIO;CARISOPRODOL;PARACETAMOL;CAFEÍNA', '(125,0 + 50,0 + 300,0 + 30,0) MG', 'Sólido', 'Similar', 'Liberado', '15', '508020010127107', 'RELAXANTE MUSCULAR DE AÇÃO CENTRAL', '19.91', '26.53'), 
  (default, '10', 'CARISOPRODOL + DICLOFENACO DE SÓDIO + PARACETAMOL+ CAFEÍNA', 'DICLOFENACO DE SÓDIO;CARISOPRODOL;PARACETAMOL;CAFEÍNA', '(125,0 + 50,0 + 300,0 + 30,0) MG', 'Sólido', 'Genérico', 'Liberado', '15', '508020070132807', 'RELAXANTE MUSCULAR DE AÇÃO CENTRAL', '12.38', '16.49'), 
  (default, '7', 'DORILAX', 'CARISOPRODOL;PARACETAMOL;CAFEÍNA', '350 MG', 'Sólido', 'Similar', 'Liberado', '12', '500503001114411', 'RELAXANTE MUSCULAR DE AÇÃO CENTRAL', '14.74', '19.64'), 
  (default, '35', 'DORILEN', 'DIPIRONA MONOIDRATADA;CLORIDRATO DE PROMETAZINA;CLORIDRATO DE ADIFENINA', '500 MG', 'Sólido', 'Similar', 'Liberado', '12', '538816901111417', 'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS ISENTOS DE PRESCRIÇÃO', '16.53', '22.02'), 
  (default, '54', 'STILGRIP', 'MALEATO DE CLORFENAMINA;PARACETAMOL;CLORIDRATO DE FENILEFRINA', '400 MG', 'Líquido', 'Similar', 'Liberado', '5 G', '515123020013607', 'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS ISENTOS DE PRESCRIÇÃO', '14.45', '19.25'), 
  (default, '20', 'DEPO-PROVERA', 'ACETATO DE MEDROXIPROGESTERONA', '160 MG/ML', 'Líquido', 'Novo', 'Liberado', '0,65 ML + AGU', '522718030075303', 'OUTROS HORMÔNIOS CONTRACEPTIVOS SISTÊMICOS', '43.16', '59.67'), 
  (default, '11', 'CATAFLAMPRO', 'DICLOFENACO DE POTÁSSIO;DICLOFENACO DIETILAMÔNIO', '25 MG', 'Sólido', 'Novo', 'Liberado', '4', '510617110059117', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '4.7', '6.5'), 
  (default, '11', 'SONRIDOR', 'PARACETAMOL', '500 MG', 'Sólido', 'Novo', 'Liberado', '2', '510607201133421', 'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS ISENTOS DE PRESCRIÇÃO', '66.79', '88.98'), 
  (default, '34', 'DEMEDROX', 'ACETATO DE MEDROXIPROGESTERONA', '150 MG/ML', 'Líquido', 'Similar', 'Liberado', '1 ML', '533026207158411', 'OUTROS HORMÔNIOS CONTRACEPTIVOS SISTÊMICOS', '36.29', '50.17'), 
  (default, '7', 'LABEL GOTAS', 'CLORIDRATO DE RANITIDINA', '40 MG/ML', 'Líquido', 'Novo', 'Liberado', '30 ML + CGT', '500513050048904', 'ANTAGONISTAS RECEPTORES H2', '27.82', '38.46'), 
  (default, '1', 'CARBOCISTEÍNA', 'CARBOCISTEÍNA', '50 MG/ML', 'Líquido', 'Genérico', 'Liberado', '100 ML + CP MED', '507704101131120', 'EXPECTORANTES', '25.65', '34.17'), 
  (default, '24', 'CLORIDRATO DE AMBROXOL', 'CLORIDRATO DE AMBROXOL', '6 MG/ML', 'Líquido', 'Genérico', 'Liberado', '120 ML + COP', '525003302137121', 'EXPECTORANTES', '27.17', '36.2'), 
  (default, '1', 'CLORATADD D', 'LORATADINA;SULFATO DE PSEUDOEFEDRINA', '1 MG/ML', 'Líquido', 'Similar', 'Liberado', '60 ML + COP', '541818080088103', 'PREPARAÇÕES SISTÊMICAS NASAIS', '25.46', '33.92'), 
  (default, '1', 'LORATADINA + SULFATO DE PSEUDOEFEDRINA', 'LORATADINA;SULFATO DE PSEUDOEFEDRINA', '1 MG/ML', 'Líquido', 'Genérico', 'Liberado', '60 ML + COP', '541820060130007', 'PREPARAÇÕES SISTÊMICAS NASAIS', '28.27', '37.66'), 
  (default, '50', 'CITRATO DE SILDENAFILA', 'CITRATO DE SILDENAFILA', '50 MG', 'Sólido', 'Genérico', 'Liberado', '4', '506421030047006', 'PRODUTOS PARA DISFUNÇÃO ERÉTIL, INIBIDORES DA PDE5', '13.95', '18.59'), 
  (default, '24', 'CITRATO DE SILDENAFILA', 'CITRATO DE SILDENAFILA', '50 MG', 'Sólido', 'Genérico', 'Liberado', '4', '525074113116118', 'PRODUTOS PARA DISFUNÇÃO ERÉTIL, INIBIDORES DA PDE5', '14.21', '18.93'), 
  (default, '5', 'CITRATO DE SILDENAFILA', 'CITRATO DE SILDENAFILA', '50 MG', 'Sólido', 'Genérico', 'Liberado', '1', '542113040000406', 'PRODUTOS PARA DISFUNÇÃO ERÉTIL, INIBIDORES DA PDE5', '10.02', '13.35'), 
  (default, '50', 'PROBENXIL', 'DICLOFENACO DE POTÁSSIO', '50 MG', 'Sólido', 'Similar', 'Liberado', '30', '506414010028103', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '24.7', '32.45'), 
  (default, '17', 'ACETATO DE CLORMADINONA + ETINILESTRADIOL', 'ACETATO DE CLORMADINONA;ETINILESTRADIOL', '(2 + 0,03) MG', 'Sólido', 'Genérico', 'Liberado', '63', '526122080160206', 'HORMÔNIOS CONTRACEPTIVOS MONOFÁSICOS COM ESTROGÊNIOS <50MCG', '88.41', '122.22'), 
  (default, '35', 'LOSARTANA POTÁSSICA', 'LOSARTANA POTÁSSICA', '50 MG', 'Sólido', 'Genérico', 'Liberado', '60', '538812030040006', 'ANTAGONISTAS DA ANGIOTENSINA II PUROS', '90.33', '124.88'), 
  (default, '1', 'DEXAMETASONA', 'DEXAMETASONA', '4 MG', 'Sólido', 'Genérico', 'Liberado', '40', '541820100148707', 'CORTICOSTERÓIDES ORAIS PUROS', '45.09', '62.33'), 
  (default, '7', 'CANDICORT', 'CETOCONAZOL;DIPROPIONATO DE BETAMETASONA', '(20,0 + 0,64) MG/G', 'Semissólido', 'Similar', 'Liberado', '30 G', '500501302168311', 'CORTICOESTERÓIDES ASSOCIADOS A ANTIMICOTICOS', '44.64', '59.47'), 
  (default, '36', 'TORSILAX', 'CARISOPRODOL;PARACETAMOL;CAFEÍNA ANIDRA;DICLOFENACO SÓDICO', '(125 + 50 + 300 + 30) MG', 'Sólido', 'Similar', 'Liberado', '30', '504615010027917', 'RELAXANTE MUSCULAR DE AÇÃO CENTRAL', '35.94', '47.88'), 
  (default, '36', 'ATENOLOL', 'ATENOLOL', '100MG', 'Sólido', 'Genérico', 'Liberado', '30', '504616030037406', 'BETABLOQUEADORES PUROS', '63.22', '87.4'), 
  (default, '13', 'TEUTOFORMIN', 'CLORIDRATO DE METFORMINA', '500 MG', 'Sólido', 'Similar', 'Liberado', '30', '520719503112413', 'ANTIDIABÉTICOS BIGUANIDAS PUROS', '12.94', '17.89'), 
  (default, '36', 'CORTICORTEN', 'PREDNISONA', '20 MG', 'Sólido', 'Similar', 'Liberado', '20', '504617030054117', 'CORTICOSTERÓIDES ORAIS PUROS', '21.21', '29.32'), 
  (default, '36', 'PREDNISONA', 'PREDNISONA', '20 MG', 'Sólido', 'Genérico', 'Liberado', '20', '504620070077107', 'CORTICOSTERÓIDES ORAIS PUROS', '35.56', '49.16'), 
  (default, '13', 'COLÍRIO TEUTO', 'CLORIDRATO DE NAFAZOLINA;SULFATO DE ZINCO', '0,15MG/ML', 'Líquido', 'Similar', 'Liberado', '20 ML', '520707801172410', 'DESCONGESTIONANTES OFTALMOLÓGICOS, SIMPATICOMIMÉTICOS', '11.15', '14.86'), 
  (default, '13', 'FENAFLAN', 'DICLOFENACO', '44,3 MG', 'Sólido', 'Similar', 'Liberado', '20', '520717050107703', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '14.54', '20.1'), 
  (default, '16', 'METICORTEN', 'PREDNISONA', '5 MG', 'Sólido', 'Novo', 'Liberado', '20', '525515100018117', 'CORTICOSTERÓIDES ORAIS PUROS', '17.48', '24.17'), 
  (default, '35', 'DICLOFENACO SÓDICO', 'DICLOFENACO SÓDICO', '100MG', 'Sólido', 'Genérico', 'Liberado', '20', '538800701118111', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '47.05', '65.04'), 
  (default, '35', 'INFLADEX', 'DICLOFENACO SÓDICO', '100MG', 'Sólido', 'Similar', 'Liberado', '20', '538803002113415', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '41.61', '57.52'), 
  (default, '1', 'EMSGRIP CAF', 'PARACETAMOL;CAFEÍNA', '500 MG', 'Sólido', 'Similar', 'Liberado', '20', '541820070132507', 'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS ISENTOS DE PRESCRIÇÃO', '27.54', '36.69'), 
  (default, '7', 'TANDRILAX', 'CARISOPRODOL;PARACETAMOL;CAFEÍNA ANIDRA;DICLOFENACO SÓDICO', '(300,0 + 125,0 + 50,0 +30,0) MG', 'Sólido', 'Novo', 'Liberado', '15', '500506901116318', 'RELAXANTE MUSCULAR DE AÇÃO CENTRAL', '23.67', '31.54'), 
  (default, '24', 'SULFATO DE NEOMICINA + BACITRACINA', 'BACITRACINA;SULFATO DE NEOMICINA', '5 MG/G', 'Semissólido', 'Genérico', 'Liberado', '15 G', '525011801163110', 'ANTIBIÓTICOS TÓPICOS', '10.01', '13.34'), 
  (default, '36', 'CARISOPRODOL + DICLOFENACO SÓDICO + PARACETAMOL + CAFEÍNA', 'CARISOPRODOL;PARACETAMOL;CAFEÍNA ANIDRA;DICLOFENACO SÓDICO', '(125 + 50 + 300 + 30) MG', 'Sólido', 'Genérico', 'Liberado', '12', '504616080041606', 'RELAXANTE MUSCULAR DE AÇÃO CENTRAL', '12.29', '16.37'), 
  (default, '36', 'LORATADINA', 'LORATADINA', '10 MG', 'Sólido', 'Genérico', 'Liberado', '12', '538512120020806', 'ANTI-HISTAMÍNICOS SISTÊMICOS', '37.69', '50.21'), 
  (default, '1', 'DICLOFENACO POTÁSSICO', 'DICLOFENACO POTÁSSICO', '50 MG', 'Sólido', 'Genérico', 'Liberado', '10', '507710102118114', 'ANTIRREUMÁTICOS NÃO ESTEROIDAIS PUROS', '11.95', '16.52'), 
  (default, '24', 'ANADOR', 'DIPIRONA', '500MG/ML', 'Líquido', 'Similar', 'Liberado', '10ML', '576720070078717', 'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS ISENTOS DE PRESCRIÇÃO', '12.08', '16.09'), 
  (default, '3', 'MAXIDEX', 'DEXAMETASONA', '1,0 MG/ML', 'Líquido', 'Novo', 'Liberado', '5 ML', '500902502176311', 'CORTICOSTERÓIDES OFTALMOLÓGICOS', '7.91', '10.94'), 
  (default, '41', 'BELARA', 'ACETATO DE CLORMADINONA;ETINILESTRADIOL', '2 MG', 'Sólido', 'Novo', 'Liberado', '63 + 21 PLACEBOS', '542820050007107', 'HORMÔNIOS CONTRACEPTIVOS MONOFÁSICOS COM ESTROGÊNIOS <50MCG', '136.01', '188.03'), 
  (default, '44', 'DEXTAMINE', 'BETAMETASONA;MALEATO DE DEXCLORFENIRAMINA', '(0,4 + 0,05) MG/ML', 'Líquido', 'Similar', 'Liberado', '120 ML+ COP', '506302902131415', 'ASSOCIAÇÕES DE CORTICOSTERÓIDES SISTÊMICOS', '36.95', '49.23'), 
  (default, '1', 'MALEATO DE DEXCLORFENIRAMINA + BETAMETASONA', 'BETAMETASONA;MALEATO DE DEXCLORFENIRAMINA', '0,4 MG/ML', 'Líquido', 'Genérico', 'Liberado', '120 ML + COP', '507716901136112', 'ASSOCIAÇÕES DE CORTICOSTERÓIDES SISTÊMICOS', '33.02', '43.99'), 
  (default, '35', 'ALERGALIV', 'LORATADINA', '1 MG/ML', 'Líquido', 'Similar', 'Liberado', '100 ML + DOSADOR', '538818902131418', 'ANTI-HISTAMÍNICOS SISTÊMICOS', '39.05', '52.03'), 
  (default, '1', 'EMS-PRED', 'FOSFATO SÓDICO DE PREDNISOLONA', '3 MG/ML', 'Líquido', 'Similar', 'Liberado', '120 ML + SER DOS', '541815070013204', 'CORTICOSTERÓIDES ORAIS PUROS', '40.83', '56.45'), 
  (default, '7', 'FOSFATO SÓDICO DE PREDNISOLONA', 'FOSFATO SÓDICO DE PREDNISOLONA', '3 MG/ML', 'Líquido', 'Genérico', 'Liberado', '120 ML + PIPETA DOSADORA', '552920110135117', 'CORTICOSTERÓIDES ORAIS PUROS', '32.07', '44.33'), 
  (default, '24', 'DORFLEX', 'DIPIRONA MONOIDRATADA;CAFEÍNA ANIDRA;CITRATO DE ORFENADRINA', '300 MG', 'Sólido', 'Novo', 'Liberado', '10', '576720030059517', 'RELAXANTE MUSCULAR DE AÇÃO CENTRAL', '5.67', '7.56'), 
  (default, '34', 'TERMOL', 'PARACETAMOL', '750 MG', 'Sólido', 'Similar', 'Liberado', '10', '533010702111428', 'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS ISENTOS DE PRESCRIÇÃO', '12.37', '16.47'), 
  (default, '34', 'PARACETAMOL', 'PARACETAMOL', '750 MG', 'Sólido', 'Genérico', 'Liberado', '10', '533018102113123', 'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS ISENTOS DE PRESCRIÇÃO', '8.02', '10.68'), 
  (default, '50', 'NEVRALGEX', 'CAFEÍNA ANIDRA;CITRATO DE ORFENADRINA;DIPIRONA', '300 MG', 'Sólido', 'Similar', 'Liberado', '10', '506412100026403', 'RELAXANTE MUSCULAR DE AÇÃO CENTRAL', '5.53', '7.37'), 
  (default, '50', 'NEVRALGEX', 'DIPIRONA MONOIDRATADA;CAFEÍNA ANIDRA;CITRATO DE ORFENADRINA', '300 MG', 'Sólido', 'Similar', 'Liberado', '60', '506417100034004', 'RELAXANTE MUSCULAR DE AÇÃO CENTRAL', '28.22', '37.6'), 
  (default, '18', 'CETOCONAZOL + DIPROPIONATO DE BETAMETASONA', 'CETOCONAZOL;DIPROPIONATO DE BETAMETASONA', '20 MG/G', 'Semissólido', 'Genérico', 'Liberado', '30G', '531613902167119', 'CORTICOESTERÓIDES ASSOCIADOS A ANTIMICOTICOS', '26.59', '35.43'), 
  (default, '36', 'DORONA CAFI', 'CAFEÍNA ANIDRA;DIPIRONA', '500 MG', 'Sólido', 'Similar', 'Liberado', '16', '504616020034417', 'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS ISENTOS DE PRESCRIÇÃO', '29.1', '38.77'), 
  (default, '35', 'ALGESTONA ACETOFENIDA + ENANTATO DE ESTRADIOL', 'ENANTATO DE ESTRADIOL;ALGESTONA ACETOFENIDA', '150 MG/ML', 'Líquido', 'Genérico', 'Liberado', '1 ML', '538801301156111', 'OUTROS HORMÔNIOS CONTRACEPTIVOS SISTÊMICOS', '11.55', '15.97'), 
  (default, '24', 'DIPIRONA', 'DIPIRONA', '50 MG/ML', 'Líquido', 'Genérico', 'Liberado', '100 ML + COP', '525005401132124', 'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS ISENTOS DE PRESCRIÇÃO', '17.33', '23.09'), 
  (default, '34', 'CICLOVULAR', 'ENANTATO DE ESTRADIOL;ALGESTONA ACETOFENIDA', '(150 + 10) MG/ML', 'Líquido', 'Similar', 'Liberado', '1 ML + SER + AGU', '533019010068403', 'OUTROS HORMÔNIOS CONTRACEPTIVOS SISTÊMICOS', '15.78', '21.81'), 
  (default, '1', 'ACIDO ACETILSALICILICO', 'ÁCIDO ACETILSALICÍLICO', '500 MG', 'Sólido', 'Genérico', 'Liberado', '10', '507700101119128', 'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS ISENTOS DE PRESCRIÇÃO', '2.76', '3.67'), 
  (default, '17', 'DIPIRONA MONOIDRATADA', 'DIPIRONA MONOIDRATADA', '500 MG', 'Sólido', 'Genérico', 'Liberado', '10', '526120070118307', 'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS ISENTOS DE PRESCRIÇÃO', '5.06', '6.75'), 
  (default, '36', 'TERMOPIRONA', 'DIPIRONA  MAGNÉSICA', '1G', 'Sólido', 'Similar', 'Liberado', '10', '504612040012814', 'ANALGÉSICOS NÃO NARCÓTICOS E ANTIPIRÉTICOS ISENTOS DE PRESCRIÇÃO', '25.4', '33.84');

-- pessoa
insert into pessoa (id, nome, logradouro, numero,  bairro, cep, cidade, estado, telefone) values 
  (1, 'Adônis Daniel Aranda Sobrinho','Rua Carlos José de Castilho', 29, 'Cambuci', 06168043, 'São Paulo', 'SP', 011928368496), 
  (2, 'Aldo João Paes Rivera dos Santos','Alameda Ibiracemas', 99, 'Cidade Líder', 07615900, 'São Paulo', 'SP', 011936020385), 
  (3, 'Andrea Quitéria Assunção','Rua Carneiro Leão', 82, 'Pari', 01843906, 'São Paulo', 'SP', 011961991053), 
  (4, 'Antônio Diego Aguiar de Galvão','Avenida Onze de Junho', 12, 'Santa Cecília', 05360307, 'São Paulo', 'SP', 011932772123), 
  (5, 'Bella Priscila Colaço Gil','Rua Filadélphia', 94, 'Vila Maria', 09912424, 'São Paulo', 'SP', 011975207230), 
  (6, 'Berenice Gonçalves Leon','Rua Engenheiro Toledo Malta', 94, 'Aricanduva', 08299462, 'São Paulo', 'SP', 011947284138), 
  (7, 'Damião Benites de Junqueira','Rua Delfino Casal de Rey', 30, 'Santa Cecília', 04274254, 'São Paulo', 'SP', 011946426695), 
  (8, 'Daniela Eloá de Aragão','Rua General Costa Campos', 36, 'Cidade Líder', 06594037, 'São Paulo', 'SP', 011947819562), 
  (9, 'Danielle Fátima Pontes de Quintana','Rua Barão da Cunha de Araripe', 60, 'Santo Amaro', 07454333, 'São Paulo', 'SP', 011940753992), 
  (10, 'Danilo Juan Burgos de Fernandes','Praça José Moreno', 22, 'Campo Limpo', 08635179, 'São Paulo', 'SP', 011932735226), 
  (11, 'Edivaldo Quintana Jr.','Rua Caiabu',1,'Lapa', 06459989, 'São Paulo', 'SP', 011962352421), 
  (12, 'Edson Esteves Marés','Rua Desembargador Isnard dos Reis', 36, 'São Miguel Paulista', 08920501, 'São Paulo', 'SP', 011923734049), 
  (13, 'Eduardo Godói Jr.','Praça Argemiro Alves de Sá', 14, 'Bom Retiro', 05456620, 'São Paulo', 'SP', 011947211180), 
  (14, 'Elias Dias Souto','Rua Emílio Baumgart', 62, 'Alto de Pinheiros', 09891591, 'São Paulo', 'SP', 011915708270), 
  (15, 'Francisco Aranda','Rua Frei Galvão', 28, 'Cidade Líder', 04592864, 'São Paulo', 'SP', 011956700938), 
  (16, 'Gilson Abreu de Aguiar','Rua Dario Vilares Barbosa', 29, 'São Miguel Paulista', 01123625, 'São Paulo', 'SP', 011927174666), 
  (17, 'Joaquim Saulo Oliveira Padrão de Cardoso','Rua Aracari', 73, 'Bela Vista', 05692120, 'São Paulo', 'SP', 011950535833), 
  (18, 'Laís Maria Maldonado Quintana','Rua Benício José da Fonseca', 34, 'Cambuci', 03128340, 'São Paulo', 'SP', 011994738091), 
  (19, 'Luara Elisângela Colaço da Silva','Alameda Olga', 47, 'Cangaíba', 04452012, 'São Paulo', 'SP', 011956712681), 
  (20, 'Martinho Aranda Feliciano','Rua Eusébio da Silva', 16, 'Ponte Rasa', 06892250, 'São Paulo', 'SP', 011991592293), 
  (21, 'Martinho Colaço Jr.','Parque Luiz Carlos Prestes', 36, 'Jaraguá', 05487508, 'São Paulo', 'SP', 011933809113), 
  (22, 'Micaela Ivone Domingues de Prado','Rua Aracena', 34, 'Moema', 04721519, 'São Paulo', 'SP', 011986932061), 
  (23, 'Nicole Duarte Jangada','Avenida Doutor Vital Brasil', 3, 'Moema', 09083759, 'São Paulo', 'SP', 011997160743), 
  (24, 'Samuel Batista de Marinho','Rua Brejo Alegre', 9, 'São Miguel Paulista', 07254951, 'São Paulo', 'SP', 011971500983), 
  (25, 'Tomás Rodrigo Lozano Madeira','Praça Memória do Jaçanã', 23, 'Barra Funda', 02136420, 'São Paulo', 'SP', 011987756463);

-- cliente
insert into cliente values 
  (1, 78930017253, '1973-2-2', 'M'), 
  (2, 79298401366, '1991-5-25', 'M'), 
  (3, 51301866175, '1984-12-11', 'M'), 
  (4, 23541139515, '1990-10-13', 'F'), 
  (5, 81285894012, '1985-7-18', 'M'), 
  (6, 88687662707, '1986-5-8', 'F'), 
  (7, 27083655243, '1986-5-16', 'F'), 
  (8, 50949967968, '1972-11-12', 'M'), 
  (9, 46786757450, '1987-5-6', 'F'), 
  (10, 58823171687, '1952-9-20', 'F'), 
  (11, 61265916930, '1965-6-16', 'M'), 
  (12, 74937483659, '1953-9-13', 'M'), 
  (13, 83224514706, '1993-5-20', 'M'), 
  (14, 79223348792, '1975-1-21', 'M'), 
  (15, 69667630559, '1987-8-27', 'M'), 
  (16, 96393555783, '1950-5-19', 'M'), 
  (17, 23717077615, '1994-10-3', 'M'), 
  (18, 68435004671, '1983-4-14', 'M'), 
  (19, 20611262083, '1977-5-22', 'F'), 
  (20, 26612046766, '1983-4-21', 'F');

-- profissional
insert into profissional values
  (21, '15487', 'Veterinário'), 
  (22, '150348', 'Médico'), 
  (23, '135001', 'Médico'), 
  (24, '189654', 'Médico'), 
  (25, '2589', 'Dentista');

-- estoque inicial
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1, 'lote 966265', '2023-07-31', '2024-07-31', 26.9, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (1, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2, 'lote 739498', '2023-07-31', '2026-07-31', 146.9, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (2, 3, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (3, 'lote 994181', '2023-07-31', '2025-07-31', 30.9, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (3, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (4, 'lote 305287', '2023-07-31', '2025-01-31', 145.0, 9, 9); 
insert into estoque_total (medicamento_id, total, minimo) values (4, 9, 3); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (5, 'lote 257777', '2023-07-31', '2026-01-31', 119.9, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (5, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (6, 'lote 431012', '2023-07-31', '2024-07-31', 122.6, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (6, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (7, 'lote 383821', '2023-07-31', '2025-01-31', 152.1, 9, 9); 
insert into estoque_total (medicamento_id, total, minimo) values (7, 9, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (8, 'lote 560375', '2023-07-31', '2024-07-31', 61.8, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (8, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9, 'lote 689837', '2023-07-31', '2025-07-31', 160.2, 9, 9); 
insert into estoque_total (medicamento_id, total, minimo) values (9, 9, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10, 'lote 713468', '2023-07-31', '2024-01-31', 82.5, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (10, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (11, 'lote 260659', '2023-07-31', '2026-07-31', 47.1, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (11, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (12, 'lote 993418', '2023-07-31', '2025-07-31', 77.6, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (12, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (13, 'lote 947380', '2023-07-31', '2026-01-31', 60.3, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (13, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (14, 'lote 837992', '2023-07-31', '2024-07-31', 59.2, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (14, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (15, 'lote 948054', '2023-07-31', '2025-01-31', 113.7, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (15, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (16, 'lote 147157', '2023-07-31', '2024-01-31', 79.6, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (16, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (17, 'lote 689564', '2023-07-31', '2025-01-31', 33.1, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (17, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (18, 'lote 770993', '2023-07-31', '2026-01-31', 24.9, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (18, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (19, 'lote 957841', '2023-07-31', '2025-01-31', 43.4, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (19, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (20, 'lote 800973', '2023-07-31', '2024-01-31', 115.4, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (20, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (21, 'lote 578690', '2023-07-31', '2025-07-31', 128.5, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (21, 3, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (22, 'lote 480512', '2023-07-31', '2024-07-31', 133.6, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (22, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (23, 'lote 627881', '2023-07-31', '2026-07-31', 121.0, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (23, 6, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (24, 'lote 461302', '2023-07-31', '2024-07-31', 128.0, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (24, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (25, 'lote 975999', '2023-07-31', '2024-07-31', 136.6, 9, 9); 
insert into estoque_total (medicamento_id, total, minimo) values (25, 9, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (26, 'lote 218062', '2023-07-31', '2025-07-31', 131.0, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (26, 3, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (27, 'lote 907371', '2023-07-31', '2024-07-31', 128.8, 9, 9); 
insert into estoque_total (medicamento_id, total, minimo) values (27, 9, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (28, 'lote 493848', '2023-07-31', '2025-07-31', 68.5, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (28, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (29, 'lote 776896', '2023-07-31', '2026-07-31', 152.8, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (29, 6, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (30, 'lote 602101', '2023-07-31', '2025-01-31', 47.5, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (30, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (31, 'lote 142053', '2023-07-31', '2026-07-31', 185.1, 9, 9); 
insert into estoque_total (medicamento_id, total, minimo) values (31, 9, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (32, 'lote 864248', '2023-07-31', '2026-01-31', 111.2, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (32, 3, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (33, 'lote 683699', '2023-07-31', '2024-01-31', 93.6, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (33, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (34, 'lote 220639', '2023-07-31', '2026-07-31', 177.4, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (34, 3, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (35, 'lote 330592', '2023-07-31', '2026-01-31', 91.9, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (35, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (36, 'lote 731290', '2023-07-31', '2025-01-31', 123.1, 9, 9); 
insert into estoque_total (medicamento_id, total, minimo) values (36, 9, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (37, 'lote 190761', '2023-07-31', '2025-07-31', 99.9, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (37, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (38, 'lote 870153', '2023-07-31', '2026-07-31', 76.6, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (38, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (39, 'lote 308926', '2023-07-31', '2024-01-31', 83.2, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (39, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (40, 'lote 157716', '2023-07-31', '2024-07-31', 12.9, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (40, 3, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (41, 'lote 588668', '2023-07-31', '2025-01-31', 91.7, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (41, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (42, 'lote 146475', '2023-07-31', '2024-07-31', 79.1, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (42, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (43, 'lote 152427', '2023-07-31', '2024-07-31', 3.3, 11, 11); 
insert into estoque_total (medicamento_id, total, minimo) values (43, 11, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (44, 'lote 113531', '2023-07-31', '2024-01-31', 49.7, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (44, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (45, 'lote 210502', '2023-07-31', '2024-01-31', 26.9, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (45, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (46, 'lote 220248', '2023-07-31', '2024-01-31', 111.3, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (46, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (47, 'lote 587884', '2023-07-31', '2024-07-31', 117.0, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (47, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (48, 'lote 338229', '2023-07-31', '2025-01-31', 70.9, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (48, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (49, 'lote 667876', '2023-07-31', '2025-01-31', 56.6, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (49, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (50, 'lote 697479', '2023-07-31', '2025-01-31', 109.4, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (50, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (51, 'lote 924223', '2023-07-31', '2025-01-31', 26.0, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (51, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (52, 'lote 942634', '2023-07-31', '2025-07-31', 45.7, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (52, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (53, 'lote 921847', '2023-07-31', '2024-07-31', 58.5, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (53, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (54, 'lote 926244', '2023-07-31', '2024-01-31', 133.3, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (54, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (55, 'lote 906276', '2023-07-31', '2024-07-31', 75.3, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (55, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (56, 'lote 728461', '2023-07-31', '2026-07-31', 179.8, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (56, 6, 3); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (57, 'lote 315035', '2023-07-31', '2026-01-31', 55.7, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (57, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (58, 'lote 956373', '2023-07-31', '2026-01-31', 78.2, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (58, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (59, 'lote 236062', '2023-07-31', '2024-01-31', 45.8, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (59, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (60, 'lote 445000', '2023-07-31', '2024-01-31', 71.2, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (60, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (61, 'lote 835441', '2023-07-31', '2024-07-31', 48.3, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (61, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (62, 'lote 664339', '2023-07-31', '2025-07-31', 124.2, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (62, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (63, 'lote 156399', '2023-07-31', '2025-01-31', 41.1, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (63, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (64, 'lote 454328', '2023-07-31', '2025-01-31', 64.3, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (64, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (65, 'lote 482618', '2023-07-31', '2024-07-31', 35.2, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (65, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (66, 'lote 160848', '2023-07-31', '2026-01-31', 24.9, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (66, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (67, 'lote 682004', '2023-07-31', '2024-01-31', 67.1, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (67, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (68, 'lote 798264', '2023-07-31', '2026-07-31', 69.5, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (68, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (69, 'lote 937340', '2023-07-31', '2025-07-31', 91.0, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (69, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (70, 'lote 362074', '2023-07-31', '2025-01-31', 63.9, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (70, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (71, 'lote 134136', '2023-07-31', '2025-07-31', 119.2, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (71, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (72, 'lote 282905', '2023-07-31', '2024-01-31', 9.0, 23, 23); 
insert into estoque_total (medicamento_id, total, minimo) values (72, 23, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (73, 'lote 471816', '2023-07-31', '2026-07-31', 18.8, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (73, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (74, 'lote 287114', '2023-07-31', '2025-07-31', 46.3, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (74, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (75, 'lote 745947', '2023-07-31', '2025-01-31', 107.9, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (75, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (76, 'lote 765193', '2023-07-31', '2024-07-31', 67.3, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (76, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (77, 'lote 413701', '2023-07-31', '2026-01-31', 126.1, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (77, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (78, 'lote 383392', '2023-07-31', '2024-07-31', 93.9, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (78, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (79, 'lote 498347', '2023-07-31', '2025-01-31', 57.1, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (79, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (80, 'lote 684600', '2023-07-31', '2024-07-31', 96.7, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (80, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (81, 'lote 983532', '2023-07-31', '2025-07-31', 79.9, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (81, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (82, 'lote 614812', '2023-07-31', '2026-01-31', 131.4, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (82, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (83, 'lote 884610', '2023-07-31', '2026-01-31', 41.2, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (83, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (84, 'lote 217164', '2023-07-31', '2026-07-31', 36.7, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (84, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (85, 'lote 305956', '2023-07-31', '2025-07-31', 22.8, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (85, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (86, 'lote 824867', '2023-07-31', '2025-07-31', 55.7, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (86, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (87, 'lote 574227', '2023-07-31', '2025-01-31', 193.9, 9, 9); 
insert into estoque_total (medicamento_id, total, minimo) values (87, 9, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (88, 'lote 705356', '2023-07-31', '2026-07-31', 86.0, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (88, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (89, 'lote 210575', '2023-07-31', '2026-01-31', 93.9, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (89, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (90, 'lote 114317', '2023-07-31', '2025-07-31', 7.3, 39, 39); 
insert into estoque_total (medicamento_id, total, minimo) values (90, 39, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (91, 'lote 105450', '2023-07-31', '2024-01-31', 90.3, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (91, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (92, 'lote 151044', '2023-07-31', '2026-01-31', 21.5, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (92, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (93, 'lote 625316', '2023-07-31', '2026-07-31', 51.2, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (93, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (94, 'lote 666047', '2023-07-31', '2026-07-31', 146.1, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (94, 6, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (95, 'lote 150948', '2023-07-31', '2025-01-31', 153.1, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (95, 3, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (96, 'lote 900387', '2023-07-31', '2026-01-31', 93.9, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (96, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (97, 'lote 323895', '2023-07-31', '2025-07-31', 117.1, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (97, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (98, 'lote 513519', '2023-07-31', '2026-07-31', 83.9, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (98, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (99, 'lote 244082', '2023-07-31', '2026-07-31', 164.6, 9, 9); 
insert into estoque_total (medicamento_id, total, minimo) values (99, 9, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (100, 'lote 851946', '2023-07-31', '2026-07-31', 163.8, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (100, 6, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (101, 'lote 147076', '2023-07-31', '2026-07-31', 128.8, 9, 9); 
insert into estoque_total (medicamento_id, total, minimo) values (101, 9, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (102, 'lote 926767', '2023-07-31', '2025-07-31', 86.6, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (102, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (103, 'lote 780447', '2023-07-31', '2025-01-31', 52.2, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (103, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (104, 'lote 740370', '2023-07-31', '2026-01-31', 23.7, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (104, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (105, 'lote 217498', '2023-07-31', '2024-01-31', 85.2, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (105, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (106, 'lote 402042', '2023-07-31', '2025-01-31', 207.9, 9, 9); 
insert into estoque_total (medicamento_id, total, minimo) values (106, 9, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (107, 'lote 572093', '2023-07-31', '2026-01-31', 72.2, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (107, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (108, 'lote 398930', '2023-07-31', '2024-07-31', 92.4, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (108, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (109, 'lote 621401', '2023-07-31', '2024-07-31', 79.7, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (109, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (110, 'lote 461315', '2023-07-31', '2024-07-31', 15.5, 11, 11); 
insert into estoque_total (medicamento_id, total, minimo) values (110, 11, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (111, 'lote 767878', '2023-07-31', '2024-07-31', 18.8, 7, 7); 
insert into estoque_total (medicamento_id, total, minimo) values (111, 7, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (112, 'lote 366668', '2023-07-31', '2026-01-31', 8.1, 43, 43); 
insert into estoque_total (medicamento_id, total, minimo) values (112, 43, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (113, 'lote 359822', '2023-07-31', '2024-07-31', 10.2, 7, 7); 
insert into estoque_total (medicamento_id, total, minimo) values (113, 7, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (114, 'lote 706918', '2023-07-31', '2026-01-31', 17.9, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (114, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (115, 'lote 752122', '2023-07-31', '2026-07-31', 106.3, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (115, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (116, 'lote 180716', '2023-07-31', '2024-01-31', 2.9, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (116, 3, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (117, 'lote 220739', '2023-07-31', '2026-07-31', 3.2, 31, 31); 
insert into estoque_total (medicamento_id, total, minimo) values (117, 31, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (118, 'lote 820771', '2023-07-31', '2026-01-31', 21.1, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (118, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (119, 'lote 732340', '2023-07-31', '2024-01-31', 71.9, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (119, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (120, 'lote 733656', '2023-07-31', '2024-07-31', 13.0, 11, 11); 
insert into estoque_total (medicamento_id, total, minimo) values (120, 11, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (121, 'lote 947505', '2023-07-31', '2026-07-31', 29.7, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (121, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (122, 'lote 509149', '2023-07-31', '2026-01-31', 52.2, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (122, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (123, 'lote 529486', '2023-07-31', '2026-07-31', 20.5, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (123, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (124, 'lote 371773', '2023-07-31', '2026-01-31', 38.8, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (124, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (125, 'lote 123301', '2023-07-31', '2025-01-31', 23.3, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (125, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (126, 'lote 937665', '2023-07-31', '2026-01-31', 39.4, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (126, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (127, 'lote 243202', '2023-07-31', '2025-07-31', 21.6, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (127, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (128, 'lote 695827', '2023-07-31', '2025-01-31', 29.2, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (128, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (129, 'lote 735174', '2023-07-31', '2025-07-31', 19.9, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (129, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (130, 'lote 167591', '2023-07-31', '2024-01-31', 40.2, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (130, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (131, 'lote 883981', '2023-07-31', '2026-01-31', 46.3, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (131, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (132, 'lote 127369', '2023-07-31', '2026-07-31', 22.5, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (132, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (133, 'lote 178672', '2023-07-31', '2025-01-31', 25.1, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (133, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (134, 'lote 516928', '2023-07-31', '2025-07-31', 73.4, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (134, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (135, 'lote 777281', '2023-07-31', '2024-07-31', 22.5, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (135, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (136, 'lote 182326', '2023-07-31', '2026-01-31', 19.3, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (136, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (137, 'lote 593712', '2023-07-31', '2025-01-31', 27.5, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (137, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (138, 'lote 338536', '2023-07-31', '2024-07-31', 17.4, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (138, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (139, 'lote 252275', '2023-07-31', '2025-01-31', 140.2, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (139, 3, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (140, 'lote 783393', '2023-07-31', '2024-01-31', 77.7, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (140, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (141, 'lote 478241', '2023-07-31', '2024-01-31', 19.3, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (141, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (142, 'lote 469409', '2023-07-31', '2025-07-31', 44.9, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (142, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (143, 'lote 555047', '2023-07-31', '2026-01-31', 96.4, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (143, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (144, 'lote 336323', '2023-07-31', '2026-07-31', 110.2, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (144, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (145, 'lote 141122', '2023-07-31', '2024-01-31', 50.6, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (145, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (146, 'lote 447680', '2023-07-31', '2026-01-31', 73.0, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (146, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (147, 'lote 484481', '2023-07-31', '2024-01-31', 59.8, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (147, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (148, 'lote 640355', '2023-07-31', '2026-01-31', 52.9, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (148, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (149, 'lote 802044', '2023-07-31', '2024-01-31', 11.0, 43, 43); 
insert into estoque_total (medicamento_id, total, minimo) values (149, 43, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (150, 'lote 327856', '2023-07-31', '2026-07-31', 80.2, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (150, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (151, 'lote 936058', '2023-07-31', '2026-07-31', 8.6, 27, 27); 
insert into estoque_total (medicamento_id, total, minimo) values (151, 27, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (152, 'lote 966672', '2023-07-31', '2025-01-31', 31.4, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (152, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (153, 'lote 707177', '2023-07-31', '2024-01-31', 28.9, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (153, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (154, 'lote 317588', '2023-07-31', '2025-01-31', 32.1, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (154, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (155, 'lote 624528', '2023-07-31', '2025-01-31', 1.9, 35, 35); 
insert into estoque_total (medicamento_id, total, minimo) values (155, 35, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (156, 'lote 491315', '2023-07-31', '2024-07-31', 53.5, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (156, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (157, 'lote 803959', '2023-07-31', '2026-01-31', 36.4, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (157, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (158, 'lote 703592', '2023-07-31', '2024-01-31', 51.3, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (158, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (159, 'lote 134349', '2023-07-31', '2024-01-31', 35.5, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (159, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (160, 'lote 961174', '2023-07-31', '2024-07-31', 146.6, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (160, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (161, 'lote 327428', '2023-07-31', '2024-07-31', 27.9, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (161, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (162, 'lote 163117', '2023-07-31', '2026-07-31', 34.5, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (162, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (163, 'lote 401218', '2023-07-31', '2024-01-31', 62.4, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (163, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (164, 'lote 293760', '2023-07-31', '2025-07-31', 27.6, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (164, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (165, 'lote 551174', '2023-07-31', '2026-01-31', 15.9, 27, 27); 
insert into estoque_total (medicamento_id, total, minimo) values (165, 27, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (166, 'lote 378318', '2023-07-31', '2025-01-31', 90.3, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (166, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (167, 'lote 460514', '2023-07-31', '2026-07-31', 99.4, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (167, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (168, 'lote 995104', '2023-07-31', '2024-01-31', 133.5, 9, 9); 
insert into estoque_total (medicamento_id, total, minimo) values (168, 9, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (169, 'lote 723482', '2023-07-31', '2024-01-31', 20.8, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (169, 15, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (170, 'lote 981744', '2023-07-31', '2025-07-31', 34.7, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (170, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (171, 'lote 530693', '2023-07-31', '2025-01-31', 31.3, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (171, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (172, 'lote 122554', '2023-07-31', '2025-07-31', 62.2, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (172, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (173, 'lote 754913', '2023-07-31', '2025-07-31', 105.7, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (173, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (174, 'lote 963429', '2023-07-31', '2025-07-31', 49.1, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (174, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (175, 'lote 686724', '2023-07-31', '2026-07-31', 11.7, 31, 31); 
insert into estoque_total (medicamento_id, total, minimo) values (175, 31, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (176, 'lote 962331', '2023-07-31', '2024-01-31', 119.3, 9, 9); 
insert into estoque_total (medicamento_id, total, minimo) values (176, 9, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (177, 'lote 168536', '2023-07-31', '2024-01-31', 44.9, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (177, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (178, 'lote 244878', '2023-07-31', '2026-01-31', 23.0, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (178, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (179, 'lote 691898', '2023-07-31', '2024-07-31', 25.3, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (179, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (180, 'lote 877571', '2023-07-31', '2026-07-31', 93.1, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (180, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (181, 'lote 602635', '2023-07-31', '2024-01-31', 17.5, 43, 43); 
insert into estoque_total (medicamento_id, total, minimo) values (181, 43, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (182, 'lote 976342', '2023-07-31', '2026-01-31', 18.2, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (182, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (183, 'lote 560804', '2023-07-31', '2024-07-31', 11.9, 19, 19); 
insert into estoque_total (medicamento_id, total, minimo) values (183, 19, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (184, 'lote 851635', '2023-07-31', '2026-07-31', 10.0, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (184, 15, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (185, 'lote 880263', '2023-07-31', '2024-01-31', 12.7, 11, 11); 
insert into estoque_total (medicamento_id, total, minimo) values (185, 11, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (186, 'lote 834335', '2023-07-31', '2024-07-31', 24.3, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (186, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (187, 'lote 999084', '2023-07-31', '2024-07-31', 17.9, 7, 7); 
insert into estoque_total (medicamento_id, total, minimo) values (187, 7, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (188, 'lote 612905', '2023-07-31', '2024-07-31', 8.7, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (188, 3, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (189, 'lote 160743', '2023-07-31', '2026-01-31', 94.0, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (189, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (190, 'lote 632967', '2023-07-31', '2024-07-31', 104.9, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (190, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (191, 'lote 686894', '2023-07-31', '2025-01-31', 152.9, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (191, 3, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (192, 'lote 430554', '2023-07-31', '2026-07-31', 76.2, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (192, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (193, 'lote 613917', '2023-07-31', '2025-01-31', 74.6, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (193, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (194, 'lote 605562', '2023-07-31', '2026-07-31', 147.5, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (194, 6, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (195, 'lote 844168', '2023-07-31', '2024-07-31', 133.2, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (195, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (196, 'lote 746473', '2023-07-31', '2024-01-31', 71.9, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (196, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (197, 'lote 833886', '2023-07-31', '2025-07-31', 101.8, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (197, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (198, 'lote 138948', '2023-07-31', '2025-07-31', 14.8, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (198, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (199, 'lote 759624', '2023-07-31', '2026-01-31', 22.1, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (199, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (200, 'lote 540696', '2023-07-31', '2024-01-31', 42.5, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (200, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (201, 'lote 642572', '2023-07-31', '2025-07-31', 14.0, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (201, 15, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (202, 'lote 279385', '2023-07-31', '2024-01-31', 120.1, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (202, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (203, 'lote 250411', '2023-07-31', '2024-01-31', 120.2, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (203, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (204, 'lote 531445', '2023-07-31', '2025-07-31', 5.4, 19, 19); 
insert into estoque_total (medicamento_id, total, minimo) values (204, 19, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (205, 'lote 425374', '2023-07-31', '2024-01-31', 83.2, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (205, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (206, 'lote 980768', '2023-07-31', '2024-01-31', 15.1, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (206, 15, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (207, 'lote 507442', '2023-07-31', '2024-07-31', 42.1, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (207, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (208, 'lote 685660', '2023-07-31', '2026-01-31', 23.1, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (208, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (209, 'lote 107378', '2023-07-31', '2026-01-31', 16.3, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (209, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (210, 'lote 234407', '2023-07-31', '2024-01-31', 105.0, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (210, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (211, 'lote 727618', '2023-07-31', '2024-01-31', 100.7, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (211, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (212, 'lote 851326', '2023-07-31', '2024-01-31', 23.3, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (212, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (213, 'lote 126096', '2023-07-31', '2024-01-31', 81.4, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (213, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (214, 'lote 941007', '2023-07-31', '2026-07-31', 26.1, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (214, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (215, 'lote 888665', '2023-07-31', '2025-01-31', 81.1, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (215, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (216, 'lote 152602', '2023-07-31', '2026-01-31', 17.2, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (216, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (217, 'lote 488875', '2023-07-31', '2025-07-31', 5.7, 11, 11); 
insert into estoque_total (medicamento_id, total, minimo) values (217, 11, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (218, 'lote 230378', '2023-07-31', '2026-01-31', 9.1, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (218, 3, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (219, 'lote 377039', '2023-07-31', '2026-07-31', 34.9, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (219, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (220, 'lote 739457', '2023-07-31', '2026-01-31', 6.3, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (220, 15, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (221, 'lote 791206', '2023-07-31', '2024-07-31', 42.7, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (221, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (222, 'lote 550666', '2023-07-31', '2026-07-31', 120.6, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (222, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (223, 'lote 662717', '2023-07-31', '2025-07-31', 29.3, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (223, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (224, 'lote 527043', '2023-07-31', '2025-01-31', 42.9, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (224, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (225, 'lote 445270', '2023-07-31', '2024-07-31', 59.7, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (225, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (226, 'lote 106031', '2023-07-31', '2024-07-31', 36.7, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (226, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (227, 'lote 857586', '2023-07-31', '2026-07-31', 0.9, 11, 11); 
insert into estoque_total (medicamento_id, total, minimo) values (227, 11, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (228, 'lote 266939', '2023-07-31', '2024-01-31', 92.8, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (228, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (229, 'lote 825896', '2023-07-31', '2024-01-31', 70.3, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (229, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (230, 'lote 127547', '2023-07-31', '2026-07-31', 142.3, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (230, 3, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (231, 'lote 567865', '2023-07-31', '2025-01-31', 32.4, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (231, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (232, 'lote 782952', '2023-07-31', '2026-07-31', 31.9, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (232, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (233, 'lote 867306', '2023-07-31', '2026-07-31', 12.0, 39, 39); 
insert into estoque_total (medicamento_id, total, minimo) values (233, 39, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (234, 'lote 555072', '2023-07-31', '2026-07-31', 20.9, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (234, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (235, 'lote 637946', '2023-07-31', '2025-01-31', 22.6, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (235, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (236, 'lote 378685', '2023-07-31', '2026-07-31', 63.8, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (236, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (237, 'lote 106887', '2023-07-31', '2025-07-31', 48.9, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (237, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (238, 'lote 177942', '2023-07-31', '2026-01-31', 6.0, 27, 27); 
insert into estoque_total (medicamento_id, total, minimo) values (238, 27, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (239, 'lote 841543', '2023-07-31', '2024-07-31', 94.9, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (239, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (240, 'lote 157843', '2023-07-31', '2025-01-31', 17.0, 7, 7); 
insert into estoque_total (medicamento_id, total, minimo) values (240, 7, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (241, 'lote 401004', '2023-07-31', '2026-07-31', 13.8, 39, 39); 
insert into estoque_total (medicamento_id, total, minimo) values (241, 39, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (242, 'lote 460429', '2023-07-31', '2024-01-31', 2.9, 35, 35); 
insert into estoque_total (medicamento_id, total, minimo) values (242, 35, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (243, 'lote 639559', '2023-07-31', '2024-07-31', 21.3, 7, 7); 
insert into estoque_total (medicamento_id, total, minimo) values (243, 7, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (244, 'lote 665824', '2023-07-31', '2025-01-31', 11.5, 7, 7); 
insert into estoque_total (medicamento_id, total, minimo) values (244, 7, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (245, 'lote 595817', '2023-07-31', '2026-07-31', 51.4, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (245, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (246, 'lote 415736', '2023-07-31', '2025-07-31', 22.2, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (246, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (247, 'lote 831122', '2023-07-31', '2025-01-31', 24.4, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (247, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (248, 'lote 842584', '2023-07-31', '2025-07-31', 9.6, 47, 47); 
insert into estoque_total (medicamento_id, total, minimo) values (248, 47, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (249, 'lote 854742', '2023-07-31', '2025-01-31', 18.8, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (249, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (250, 'lote 386953', '2023-07-31', '2024-01-31', 45.6, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (250, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (251, 'lote 731332', '2023-07-31', '2026-01-31', 28.7, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (251, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (252, 'lote 678961', '2023-07-31', '2024-01-31', 13.4, 27, 27); 
insert into estoque_total (medicamento_id, total, minimo) values (252, 27, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (253, 'lote 361775', '2023-07-31', '2026-01-31', 28.7, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (253, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (254, 'lote 687760', '2023-07-31', '2025-01-31', 109.0, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (254, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (255, 'lote 210462', '2023-07-31', '2026-01-31', 24.6, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (255, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (256, 'lote 706435', '2023-07-31', '2026-01-31', 35.2, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (256, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (257, 'lote 817174', '2023-07-31', '2026-01-31', 149.1, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (257, 3, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (258, 'lote 204884', '2023-07-31', '2024-07-31', 29.8, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (258, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (259, 'lote 262354', '2023-07-31', '2024-07-31', 195.3, 9, 9); 
insert into estoque_total (medicamento_id, total, minimo) values (259, 9, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (260, 'lote 664837', '2023-07-31', '2026-07-31', 37.4, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (260, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (261, 'lote 967777', '2023-07-31', '2024-07-31', 31.2, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (261, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (262, 'lote 640900', '2023-07-31', '2024-07-31', 11.5, 43, 43); 
insert into estoque_total (medicamento_id, total, minimo) values (262, 43, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (263, 'lote 771669', '2023-07-31', '2026-07-31', 91.0, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (263, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (264, 'lote 929651', '2023-07-31', '2024-07-31', 18.6, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (264, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (265, 'lote 805922', '2023-07-31', '2026-01-31', 30.8, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (265, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (266, 'lote 997508', '2023-07-31', '2026-07-31', 45.7, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (266, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (267, 'lote 379197', '2023-07-31', '2024-01-31', 72.7, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (267, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (268, 'lote 198992', '2023-07-31', '2025-07-31', 118.6, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (268, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (269, 'lote 141329', '2023-07-31', '2026-01-31', 16.8, 27, 27); 
insert into estoque_total (medicamento_id, total, minimo) values (269, 27, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (270, 'lote 343874', '2023-07-31', '2026-01-31', 164.6, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (270, 3, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (271, 'lote 842871', '2023-07-31', '2025-01-31', 46.4, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (271, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (272, 'lote 553482', '2023-07-31', '2026-01-31', 119.8, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (272, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (273, 'lote 782646', '2023-07-31', '2025-07-31', 15.2, 39, 39); 
insert into estoque_total (medicamento_id, total, minimo) values (273, 39, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (274, 'lote 982438', '2023-07-31', '2026-07-31', 13.1, 39, 39); 
insert into estoque_total (medicamento_id, total, minimo) values (274, 39, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (275, 'lote 339249', '2023-07-31', '2024-07-31', 29.6, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (275, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (276, 'lote 351519', '2023-07-31', '2026-01-31', 15.3, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (276, 3, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (277, 'lote 140074', '2023-07-31', '2026-01-31', 12.3, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (277, 3, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (278, 'lote 488684', '2023-07-31', '2024-07-31', 16.5, 7, 7); 
insert into estoque_total (medicamento_id, total, minimo) values (278, 7, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (279, 'lote 665279', '2023-07-31', '2024-01-31', 16.1, 23, 23); 
insert into estoque_total (medicamento_id, total, minimo) values (279, 23, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (280, 'lote 299368', '2023-07-31', '2024-01-31', 36.4, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (280, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (281, 'lote 504624', '2023-07-31', '2024-01-31', 26.9, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (281, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (282, 'lote 635822', '2023-07-31', '2025-01-31', 23.0, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (282, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (283, 'lote 646200', '2023-07-31', '2025-07-31', 19.2, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (283, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (284, 'lote 741974', '2023-07-31', '2024-01-31', 5.6, 47, 47); 
insert into estoque_total (medicamento_id, total, minimo) values (284, 47, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (285, 'lote 803398', '2023-07-31', '2026-01-31', 58.3, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (285, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (286, 'lote 511713', '2023-07-31', '2025-01-31', 14.1, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (286, 15, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (287, 'lote 761435', '2023-07-31', '2025-07-31', 29.6, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (287, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (288, 'lote 327679', '2023-07-31', '2024-07-31', 6.8, 11, 11); 
insert into estoque_total (medicamento_id, total, minimo) values (288, 11, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (289, 'lote 344077', '2023-07-31', '2026-01-31', 34.6, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (289, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (290, 'lote 808580', '2023-07-31', '2026-07-31', 11.4, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (290, 15, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (291, 'lote 472832', '2023-07-31', '2026-07-31', 5.0, 43, 43); 
insert into estoque_total (medicamento_id, total, minimo) values (291, 43, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (292, 'lote 691676', '2023-07-31', '2024-07-31', 4.4, 23, 23); 
insert into estoque_total (medicamento_id, total, minimo) values (292, 23, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (293, 'lote 611843', '2023-07-31', '2024-01-31', 11.3, 27, 27); 
insert into estoque_total (medicamento_id, total, minimo) values (293, 27, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (294, 'lote 565321', '2023-07-31', '2026-01-31', 5.9, 47, 47); 
insert into estoque_total (medicamento_id, total, minimo) values (294, 47, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (295, 'lote 542771', '2023-07-31', '2025-01-31', 38.5, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (295, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (296, 'lote 772073', '2023-07-31', '2024-07-31', 22.1, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (296, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (297, 'lote 940448', '2023-07-31', '2026-07-31', 23.8, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (297, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (298, 'lote 570127', '2023-07-31', '2025-07-31', 42.1, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (298, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (299, 'lote 381121', '2023-07-31', '2025-07-31', 11.9, 11, 11); 
insert into estoque_total (medicamento_id, total, minimo) values (299, 11, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (300, 'lote 234957', '2023-07-31', '2024-01-31', 120.9, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (300, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (301, 'lote 346271', '2023-07-31', '2024-07-31', 118.9, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (301, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (302, 'lote 329245', '2023-07-31', '2026-01-31', 6.6, 11, 11); 
insert into estoque_total (medicamento_id, total, minimo) values (302, 11, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (303, 'lote 303388', '2023-07-31', '2025-01-31', 14.7, 39, 39); 
insert into estoque_total (medicamento_id, total, minimo) values (303, 39, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (304, 'lote 504170', '2023-07-31', '2024-01-31', 11.7, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (304, 15, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (305, 'lote 501551', '2023-07-31', '2026-07-31', 16.4, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (305, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (306, 'lote 997392', '2023-07-31', '2024-07-31', 39.7, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (306, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (307, 'lote 422017', '2023-07-31', '2024-01-31', 113.2, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (307, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (308, 'lote 484346', '2023-07-31', '2024-01-31', 21.3, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (308, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (309, 'lote 426416', '2023-07-31', '2026-07-31', 6.4, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (309, 15, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (310, 'lote 980110', '2023-07-31', '2024-07-31', 43.3, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (310, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (311, 'lote 942317', '2023-07-31', '2026-07-31', 6.9, 39, 39); 
insert into estoque_total (medicamento_id, total, minimo) values (311, 39, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (312, 'lote 883132', '2023-07-31', '2026-01-31', 12.8, 47, 47); 
insert into estoque_total (medicamento_id, total, minimo) values (312, 47, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (313, 'lote 118422', '2023-07-31', '2026-01-31', 20.0, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (313, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (314, 'lote 280921', '2023-07-31', '2024-01-31', 7.7, 43, 43); 
insert into estoque_total (medicamento_id, total, minimo) values (314, 43, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (315, 'lote 959839', '2023-07-31', '2026-07-31', 15.7, 31, 31); 
insert into estoque_total (medicamento_id, total, minimo) values (315, 31, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (316, 'lote 117694', '2023-07-31', '2025-07-31', 73.6, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (316, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (317, 'lote 162710', '2023-07-31', '2025-07-31', 44.4, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (317, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (318, 'lote 283594', '2023-07-31', '2026-01-31', 28.6, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (318, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (319, 'lote 843258', '2023-07-31', '2024-01-31', 27.2, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (319, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (320, 'lote 561223', '2023-07-31', '2026-07-31', 79.0, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (320, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (321, 'lote 370711', '2023-07-31', '2024-07-31', 10.9, 7, 7); 
insert into estoque_total (medicamento_id, total, minimo) values (321, 7, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (322, 'lote 491337', '2023-07-31', '2026-07-31', 11.7, 27, 27); 
insert into estoque_total (medicamento_id, total, minimo) values (322, 27, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (323, 'lote 141459', '2023-07-31', '2024-07-31', 6.8, 19, 19); 
insert into estoque_total (medicamento_id, total, minimo) values (323, 19, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (324, 'lote 382752', '2023-07-31', '2024-07-31', 7.5, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (324, 3, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (325, 'lote 150300', '2023-07-31', '2025-01-31', 30.9, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (325, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (326, 'lote 840709', '2023-07-31', '2025-07-31', 17.1, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (326, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (327, 'lote 844347', '2023-07-31', '2025-01-31', 13.1, 23, 23); 
insert into estoque_total (medicamento_id, total, minimo) values (327, 23, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (328, 'lote 463253', '2023-07-31', '2024-07-31', 12.0, 35, 35); 
insert into estoque_total (medicamento_id, total, minimo) values (328, 35, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (329, 'lote 265600', '2023-07-31', '2026-01-31', 14.7, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (329, 15, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (330, 'lote 604861', '2023-07-31', '2025-01-31', 30.5, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (330, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (331, 'lote 369170', '2023-07-31', '2024-01-31', 10.0, 27, 27); 
insert into estoque_total (medicamento_id, total, minimo) values (331, 27, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (332, 'lote 856100', '2023-07-31', '2025-07-31', 22.9, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (332, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (333, 'lote 948403', '2023-07-31', '2026-07-31', 48.7, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (333, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (334, 'lote 636236', '2023-07-31', '2026-01-31', 30.4, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (334, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (335, 'lote 797536', '2023-07-31', '2026-07-31', 13.0, 27, 27); 
insert into estoque_total (medicamento_id, total, minimo) values (335, 27, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (336, 'lote 649918', '2023-07-31', '2026-01-31', 16.2, 31, 31); 
insert into estoque_total (medicamento_id, total, minimo) values (336, 31, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (337, 'lote 561476', '2023-07-31', '2026-01-31', 22.1, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (337, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (338, 'lote 829017', '2023-07-31', '2025-01-31', 51.2, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (338, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (339, 'lote 264289', '2023-07-31', '2025-07-31', 12.5, 47, 47); 
insert into estoque_total (medicamento_id, total, minimo) values (339, 47, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (340, 'lote 201498', '2023-07-31', '2025-01-31', 10.9, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (340, 15, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (341, 'lote 909699', '2023-07-31', '2025-01-31', 7.9, 39, 39); 
insert into estoque_total (medicamento_id, total, minimo) values (341, 39, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (342, 'lote 376308', '2023-07-31', '2024-07-31', 18.3, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (342, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (343, 'lote 544394', '2023-07-31', '2024-01-31', 12.5, 27, 27); 
insert into estoque_total (medicamento_id, total, minimo) values (343, 27, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (344, 'lote 253567', '2023-07-31', '2024-01-31', 17.5, 35, 35); 
insert into estoque_total (medicamento_id, total, minimo) values (344, 35, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (345, 'lote 846445', '2023-07-31', '2024-01-31', 9.4, 19, 19); 
insert into estoque_total (medicamento_id, total, minimo) values (345, 19, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (346, 'lote 222177', '2023-07-31', '2025-07-31', 24.3, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (346, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (347, 'lote 657414', '2023-07-31', '2025-01-31', 33.0, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (347, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (348, 'lote 700127', '2023-07-31', '2024-01-31', 9.7, 23, 23); 
insert into estoque_total (medicamento_id, total, minimo) values (348, 23, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (349, 'lote 173935', '2023-07-31', '2024-01-31', 15.8, 43, 43); 
insert into estoque_total (medicamento_id, total, minimo) values (349, 43, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (350, 'lote 200176', '2023-07-31', '2024-07-31', 47.9, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (350, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (351, 'lote 325949', '2023-07-31', '2025-01-31', 8.2, 39, 39); 
insert into estoque_total (medicamento_id, total, minimo) values (351, 39, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (352, 'lote 854140', '2023-07-31', '2024-07-31', 9.7, 35, 35); 
insert into estoque_total (medicamento_id, total, minimo) values (352, 35, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (353, 'lote 431969', '2023-07-31', '2026-07-31', 22.7, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (353, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (354, 'lote 740189', '2023-07-31', '2025-01-31', 30.0, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (354, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (355, 'lote 335174', '2023-07-31', '2026-01-31', 10.5, 23, 23); 
insert into estoque_total (medicamento_id, total, minimo) values (355, 23, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (356, 'lote 777143', '2023-07-31', '2025-01-31', 42.5, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (356, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (357, 'lote 124070', '2023-07-31', '2025-07-31', 27.8, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (357, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (358, 'lote 395730', '2023-07-31', '2024-07-31', 15.7, 47, 47); 
insert into estoque_total (medicamento_id, total, minimo) values (358, 47, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (359, 'lote 155636', '2023-07-31', '2025-07-31', 49.1, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (359, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (360, 'lote 231313', '2023-07-31', '2025-01-31', 61.9, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (360, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (361, 'lote 621337', '2023-07-31', '2025-01-31', 69.5, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (361, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (362, 'lote 866737', '2023-07-31', '2025-01-31', 79.4, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (362, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (363, 'lote 662559', '2023-07-31', '2025-01-31', 26.4, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (363, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (364, 'lote 867395', '2023-07-31', '2025-01-31', 14.7, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (364, 3, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (365, 'lote 694496', '2023-07-31', '2024-07-31', 7.9, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (365, 3, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (366, 'lote 912961', '2023-07-31', '2025-01-31', 20.3, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (366, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (367, 'lote 128398', '2023-07-31', '2025-01-31', 40.1, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (367, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (368, 'lote 276240', '2023-07-31', '2026-01-31', 6.9, 23, 23); 
insert into estoque_total (medicamento_id, total, minimo) values (368, 23, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (369, 'lote 137250', '2023-07-31', '2026-01-31', 39.4, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (369, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (370, 'lote 491254', '2023-07-31', '2024-07-31', 101.0, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (370, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (371, 'lote 441162', '2023-07-31', '2024-01-31', 57.7, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (371, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (372, 'lote 525946', '2023-07-31', '2026-07-31', 47.0, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (372, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (373, 'lote 489853', '2023-07-31', '2025-07-31', 17.1, 43, 43); 
insert into estoque_total (medicamento_id, total, minimo) values (373, 43, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (374, 'lote 947891', '2023-07-31', '2026-01-31', 17.9, 27, 27); 
insert into estoque_total (medicamento_id, total, minimo) values (374, 27, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (375, 'lote 857084', '2023-07-31', '2026-01-31', 9.7, 11, 11); 
insert into estoque_total (medicamento_id, total, minimo) values (375, 11, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (376, 'lote 293565', '2023-07-31', '2024-01-31', 7.4, 19, 19); 
insert into estoque_total (medicamento_id, total, minimo) values (376, 19, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (377, 'lote 789304', '2023-07-31', '2024-07-31', 6.1, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (377, 3, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (378, 'lote 771630', '2023-07-31', '2025-01-31', 17.1, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (378, 15, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (379, 'lote 686260', '2023-07-31', '2025-01-31', 4.8, 31, 31); 
insert into estoque_total (medicamento_id, total, minimo) values (379, 31, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (380, 'lote 342398', '2023-07-31', '2026-01-31', 3.4, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (380, 15, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (381, 'lote 532959', '2023-07-31', '2026-07-31', 29.9, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (381, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (382, 'lote 178682', '2023-07-31', '2024-01-31', 19.0, 7, 7); 
insert into estoque_total (medicamento_id, total, minimo) values (382, 7, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (383, 'lote 466215', '2023-07-31', '2025-01-31', 24.1, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (383, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (384, 'lote 722460', '2023-07-31', '2026-07-31', 15.2, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (384, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (385, 'lote 606885', '2023-07-31', '2025-01-31', 7.9, 43, 43); 
insert into estoque_total (medicamento_id, total, minimo) values (385, 43, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (386, 'lote 758508', '2023-07-31', '2024-01-31', 7.5, 39, 39); 
insert into estoque_total (medicamento_id, total, minimo) values (386, 39, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (387, 'lote 888848', '2023-07-31', '2026-07-31', 22.8, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (387, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (388, 'lote 910943', '2023-07-31', '2025-07-31', 14.2, 39, 39); 
insert into estoque_total (medicamento_id, total, minimo) values (388, 39, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (389, 'lote 387092', '2023-07-31', '2024-01-31', 14.4, 43, 43); 
insert into estoque_total (medicamento_id, total, minimo) values (389, 43, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (390, 'lote 452710', '2023-07-31', '2024-01-31', 15.3, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (390, 3, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (391, 'lote 739951', '2023-07-31', '2024-07-31', 34.1, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (391, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (392, 'lote 402269', '2023-07-31', '2025-07-31', 5.9, 31, 31); 
insert into estoque_total (medicamento_id, total, minimo) values (392, 31, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (393, 'lote 784635', '2023-07-31', '2024-01-31', 9.8, 43, 43); 
insert into estoque_total (medicamento_id, total, minimo) values (393, 43, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (394, 'lote 919722', '2023-07-31', '2026-01-31', 13.4, 35, 35); 
insert into estoque_total (medicamento_id, total, minimo) values (394, 35, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (395, 'lote 312785', '2023-07-31', '2024-01-31', 22.8, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (395, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (396, 'lote 166673', '2023-07-31', '2024-07-31', 125.3, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (396, 3, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (397, 'lote 658186', '2023-07-31', '2026-07-31', 6.8, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (397, 15, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (398, 'lote 293777', '2023-07-31', '2025-01-31', 5.4, 35, 35); 
insert into estoque_total (medicamento_id, total, minimo) values (398, 35, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (399, 'lote 518005', '2023-07-31', '2026-01-31', 20.8, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (399, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (400, 'lote 912238', '2023-07-31', '2026-07-31', 48.1, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (400, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (401, 'lote 291737', '2023-07-31', '2025-07-31', 17.7, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (401, 15, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (402, 'lote 193928', '2023-07-31', '2026-01-31', 6.3, 35, 35); 
insert into estoque_total (medicamento_id, total, minimo) values (402, 35, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (403, 'lote 584018', '2023-07-31', '2025-01-31', 10.3, 7, 7); 
insert into estoque_total (medicamento_id, total, minimo) values (403, 7, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (404, 'lote 307148', '2023-07-31', '2026-07-31', 7.3, 31, 31); 
insert into estoque_total (medicamento_id, total, minimo) values (404, 31, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (405, 'lote 948501', '2023-07-31', '2025-01-31', 12.7, 11, 11); 
insert into estoque_total (medicamento_id, total, minimo) values (405, 11, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (406, 'lote 622977', '2023-07-31', '2024-07-31', 3.9, 35, 35); 
insert into estoque_total (medicamento_id, total, minimo) values (406, 35, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (407, 'lote 734332', '2023-07-31', '2025-07-31', 36.3, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (407, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (408, 'lote 366561', '2023-07-31', '2024-01-31', 47.8, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (408, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (409, 'lote 557772', '2023-07-31', '2026-01-31', 11.1, 47, 47); 
insert into estoque_total (medicamento_id, total, minimo) values (409, 47, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (410, 'lote 146561', '2023-07-31', '2026-07-31', 46.0, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (410, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (411, 'lote 858488', '2023-07-31', '2026-01-31', 34.1, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (411, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (412, 'lote 252161', '2023-07-31', '2024-07-31', 32.0, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (412, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (413, 'lote 251259', '2023-07-31', '2026-01-31', 42.9, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (413, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (414, 'lote 242517', '2023-07-31', '2026-07-31', 19.6, 23, 23); 
insert into estoque_total (medicamento_id, total, minimo) values (414, 23, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (415, 'lote 152213', '2023-07-31', '2026-07-31', 68.4, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (415, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (416, 'lote 317099', '2023-07-31', '2024-07-31', 11.4, 11, 11); 
insert into estoque_total (medicamento_id, total, minimo) values (416, 11, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (417, 'lote 286578', '2023-07-31', '2025-07-31', 5.2, 31, 31); 
insert into estoque_total (medicamento_id, total, minimo) values (417, 31, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (418, 'lote 933549', '2023-07-31', '2025-01-31', 12.4, 47, 47); 
insert into estoque_total (medicamento_id, total, minimo) values (418, 47, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (419, 'lote 800875', '2023-07-31', '2025-01-31', 14.2, 31, 31); 
insert into estoque_total (medicamento_id, total, minimo) values (419, 31, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (420, 'lote 282577', '2023-07-31', '2025-07-31', 26.1, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (420, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (421, 'lote 371318', '2023-07-31', '2026-07-31', 3.5, 47, 47); 
insert into estoque_total (medicamento_id, total, minimo) values (421, 47, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (422, 'lote 209617', '2023-07-31', '2026-07-31', 6.3, 7, 7); 
insert into estoque_total (medicamento_id, total, minimo) values (422, 7, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (423, 'lote 729304', '2023-07-31', '2026-07-31', 5.7, 11, 11); 
insert into estoque_total (medicamento_id, total, minimo) values (423, 11, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (424, 'lote 582733', '2023-07-31', '2024-07-31', 4.0, 47, 47); 
insert into estoque_total (medicamento_id, total, minimo) values (424, 47, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (425, 'lote 343820', '2023-07-31', '2024-07-31', 15.4, 27, 27); 
insert into estoque_total (medicamento_id, total, minimo) values (425, 27, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (426, 'lote 573887', '2023-07-31', '2024-01-31', 13.9, 47, 47); 
insert into estoque_total (medicamento_id, total, minimo) values (426, 47, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (427, 'lote 617382', '2023-07-31', '2026-07-31', 6.3, 43, 43); 
insert into estoque_total (medicamento_id, total, minimo) values (427, 43, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (428, 'lote 645824', '2023-07-31', '2026-01-31', 6.8, 31, 31); 
insert into estoque_total (medicamento_id, total, minimo) values (428, 31, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (429, 'lote 882683', '2023-07-31', '2024-01-31', 10.1, 35, 35); 
insert into estoque_total (medicamento_id, total, minimo) values (429, 35, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (430, 'lote 433854', '2023-07-31', '2026-01-31', 10.8, 11, 11); 
insert into estoque_total (medicamento_id, total, minimo) values (430, 11, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (431, 'lote 472996', '2023-07-31', '2024-01-31', 4.4, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (431, 15, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (432, 'lote 596178', '2023-07-31', '2025-07-31', 1.7, 47, 47); 
insert into estoque_total (medicamento_id, total, minimo) values (432, 47, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (433, 'lote 801871', '2023-07-31', '2025-07-31', 11.7, 19, 19); 
insert into estoque_total (medicamento_id, total, minimo) values (433, 19, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (434, 'lote 852419', '2023-07-31', '2024-07-31', 15.3, 27, 27); 
insert into estoque_total (medicamento_id, total, minimo) values (434, 27, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (435, 'lote 939836', '2023-07-31', '2024-07-31', 34.7, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (435, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (436, 'lote 187798', '2023-07-31', '2024-07-31', 30.6, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (436, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (437, 'lote 790209', '2023-07-31', '2024-01-31', 9.5, 47, 47); 
insert into estoque_total (medicamento_id, total, minimo) values (437, 47, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (438, 'lote 354641', '2023-07-31', '2026-01-31', 21.1, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (438, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (439, 'lote 816644', '2023-07-31', '2026-07-31', 18.9, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (439, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (440, 'lote 420172', '2023-07-31', '2025-01-31', 18.1, 35, 35); 
insert into estoque_total (medicamento_id, total, minimo) values (440, 35, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (441, 'lote 130771', '2023-07-31', '2026-01-31', 13.0, 39, 39); 
insert into estoque_total (medicamento_id, total, minimo) values (441, 39, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (442, 'lote 927587', '2023-07-31', '2025-07-31', 8.1, 27, 27); 
insert into estoque_total (medicamento_id, total, minimo) values (442, 27, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (443, 'lote 340020', '2023-07-31', '2025-07-31', 8.5, 11, 11); 
insert into estoque_total (medicamento_id, total, minimo) values (443, 11, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (444, 'lote 757465', '2023-07-31', '2026-01-31', 32.3, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (444, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (445, 'lote 450170', '2023-07-31', '2025-07-31', 8.7, 31, 31); 
insert into estoque_total (medicamento_id, total, minimo) values (445, 31, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (446, 'lote 205365', '2023-07-31', '2025-01-31', 57.6, 5, 5); 
insert into estoque_total (medicamento_id, total, minimo) values (446, 5, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (447, 'lote 762500', '2023-07-31', '2025-07-31', 12.7, 47, 47); 
insert into estoque_total (medicamento_id, total, minimo) values (447, 47, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (448, 'lote 560789', '2023-07-31', '2025-01-31', 5.9, 35, 35); 
insert into estoque_total (medicamento_id, total, minimo) values (448, 35, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (449, 'lote 518025', '2023-07-31', '2026-01-31', 10.4, 23, 23); 
insert into estoque_total (medicamento_id, total, minimo) values (449, 23, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (450, 'lote 203317', '2023-07-31', '2024-01-31', 12.0, 47, 47); 
insert into estoque_total (medicamento_id, total, minimo) values (450, 47, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (451, 'lote 262491', '2023-07-31', '2024-01-31', 9.0, 27, 27); 
insert into estoque_total (medicamento_id, total, minimo) values (451, 27, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (452, 'lote 895523', '2023-07-31', '2024-01-31', 28.3, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (452, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (453, 'lote 880827', '2023-07-31', '2026-07-31', 3.5, 39, 39); 
insert into estoque_total (medicamento_id, total, minimo) values (453, 39, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (454, 'lote 251888', '2023-07-31', '2025-07-31', 33.8, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (454, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (455, 'lote 568859', '2023-07-31', '2024-07-31', 25.0, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (455, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (456, 'lote 717700', '2023-07-31', '2025-07-31', 17.6, 43, 43); 
insert into estoque_total (medicamento_id, total, minimo) values (456, 43, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (457, 'lote 953445', '2023-07-31', '2025-01-31', 13.9, 31, 31); 
insert into estoque_total (medicamento_id, total, minimo) values (457, 31, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (458, 'lote 985428', '2023-07-31', '2024-01-31', 15.5, 31, 31); 
insert into estoque_total (medicamento_id, total, minimo) values (458, 31, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (459, 'lote 428191', '2023-07-31', '2026-01-31', 17.2, 19, 19); 
insert into estoque_total (medicamento_id, total, minimo) values (459, 19, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (460, 'lote 341343', '2023-07-31', '2024-01-31', 18.2, 35, 35); 
insert into estoque_total (medicamento_id, total, minimo) values (460, 35, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (461, 'lote 704661', '2023-07-31', '2025-07-31', 9.0, 47, 47); 
insert into estoque_total (medicamento_id, total, minimo) values (461, 47, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (462, 'lote 782769', '2023-07-31', '2025-07-31', 9.1, 39, 39); 
insert into estoque_total (medicamento_id, total, minimo) values (462, 39, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (463, 'lote 363106', '2023-07-31', '2025-07-31', 6.4, 43, 43); 
insert into estoque_total (medicamento_id, total, minimo) values (463, 43, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (464, 'lote 521038', '2023-07-31', '2025-01-31', 11.3, 39, 39); 
insert into estoque_total (medicamento_id, total, minimo) values (464, 39, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (465, 'lote 574683', '2023-07-31', '2024-01-31', 61.4, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (465, 10, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (466, 'lote 100040', '2023-07-31', '2025-07-31', 68.5, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (466, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (467, 'lote 940003', '2023-07-31', '2025-01-31', 31.2, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (467, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (468, 'lote 991939', '2023-07-31', '2024-07-31', 21.6, 2, 2); 
insert into estoque_total (medicamento_id, total, minimo) values (468, 2, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (469, 'lote 784095', '2023-07-31', '2025-01-31', 25.6, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (469, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (470, 'lote 386277', '2023-07-31', '2025-01-31', 31.3, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (470, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (471, 'lote 689667', '2023-07-31', '2026-01-31', 8.8, 3, 3); 
insert into estoque_total (medicamento_id, total, minimo) values (471, 3, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (472, 'lote 552372', '2023-07-31', '2025-07-31', 12.5, 19, 19); 
insert into estoque_total (medicamento_id, total, minimo) values (472, 19, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (473, 'lote 538983', '2023-07-31', '2025-07-31', 17.9, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (473, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (474, 'lote 259290', '2023-07-31', '2024-07-31', 5.6, 39, 39); 
insert into estoque_total (medicamento_id, total, minimo) values (474, 39, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (475, 'lote 370102', '2023-07-31', '2026-01-31', 9.3, 27, 27); 
insert into estoque_total (medicamento_id, total, minimo) values (475, 27, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (476, 'lote 811091', '2023-07-31', '2025-07-31', 11.0, 11, 11); 
insert into estoque_total (medicamento_id, total, minimo) values (476, 11, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (477, 'lote 199163', '2023-07-31', '2024-07-31', 24.2, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (477, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (478, 'lote 617542', '2023-07-31', '2026-01-31', 25.6, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (478, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (479, 'lote 644182', '2023-07-31', '2026-07-31', 16.7, 39, 39); 
insert into estoque_total (medicamento_id, total, minimo) values (479, 39, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (480, 'lote 130377', '2023-07-31', '2026-07-31', 11.4, 11, 11); 
insert into estoque_total (medicamento_id, total, minimo) values (480, 11, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (481, 'lote 652647', '2023-07-31', '2025-01-31', 4.8, 27, 27); 
insert into estoque_total (medicamento_id, total, minimo) values (481, 27, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (482, 'lote 835483', '2023-07-31', '2024-07-31', 6.3, 43, 43); 
insert into estoque_total (medicamento_id, total, minimo) values (482, 43, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (483, 'lote 405289', '2023-07-31', '2024-07-31', 27.0, 18, 18); 
insert into estoque_total (medicamento_id, total, minimo) values (483, 18, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (484, 'lote 823765', '2023-07-31', '2025-07-31', 5.9, 11, 11); 
insert into estoque_total (medicamento_id, total, minimo) values (484, 11, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (485, 'lote 632537', '2023-07-31', '2024-01-31', 6.4, 19, 19); 
insert into estoque_total (medicamento_id, total, minimo) values (485, 19, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (486, 'lote 575789', '2023-07-31', '2025-01-31', 5.1, 39, 39); 
insert into estoque_total (medicamento_id, total, minimo) values (486, 39, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (487, 'lote 573436', '2023-07-31', '2025-07-31', 65.4, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (487, 15, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (488, 'lote 980311', '2023-07-31', '2025-01-31', 22.1, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (488, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (489, 'lote 296506', '2023-07-31', '2024-07-31', 18.7, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (489, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (490, 'lote 353402', '2023-07-31', '2024-01-31', 24.6, 14, 14); 
insert into estoque_total (medicamento_id, total, minimo) values (490, 14, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (491, 'lote 877527', '2023-07-31', '2025-07-31', 26.3, 10, 10); 
insert into estoque_total (medicamento_id, total, minimo) values (491, 10, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (492, 'lote 913220', '2023-07-31', '2026-01-31', 18.4, 6, 6); 
insert into estoque_total (medicamento_id, total, minimo) values (492, 6, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (493, 'lote 810793', '2023-07-31', '2024-07-31', 3.7, 7, 7); 
insert into estoque_total (medicamento_id, total, minimo) values (493, 7, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (494, 'lote 386988', '2023-07-31', '2024-07-31', 8.4, 7, 7); 
insert into estoque_total (medicamento_id, total, minimo) values (494, 7, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (495, 'lote 754591', '2023-07-31', '2024-07-31', 3.9, 7, 7); 
insert into estoque_total (medicamento_id, total, minimo) values (495, 7, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (496, 'lote 457019', '2023-07-31', '2026-01-31', 3.0, 31, 31); 
insert into estoque_total (medicamento_id, total, minimo) values (496, 31, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (497, 'lote 689006', '2023-07-31', '2026-01-31', 15.7, 23, 23); 
insert into estoque_total (medicamento_id, total, minimo) values (497, 23, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (498, 'lote 131355', '2023-07-31', '2024-07-31', 14.0, 31, 31); 
insert into estoque_total (medicamento_id, total, minimo) values (498, 31, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (499, 'lote 937403', '2023-07-31', '2024-01-31', 16.1, 47, 47); 
insert into estoque_total (medicamento_id, total, minimo) values (499, 47, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (500, 'lote 556741', '2023-07-31', '2025-01-31', 7.6, 47, 47); 
insert into estoque_total (medicamento_id, total, minimo) values (500, 47, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (501, 'lote 173669', '2023-07-31', '2024-01-31', 10.3, 23, 23); 
insert into estoque_total (medicamento_id, total, minimo) values (501, 23, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (502, 'lote 426402', '2023-07-31', '2026-01-31', 9.3, 27, 27); 
insert into estoque_total (medicamento_id, total, minimo) values (502, 27, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (503, 'lote 541544', '2023-07-31', '2025-01-31', 1.4, 47, 47); 
insert into estoque_total (medicamento_id, total, minimo) values (503, 47, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (504, 'lote 649658', '2023-07-31', '2026-01-31', 2.4, 15, 15); 
insert into estoque_total (medicamento_id, total, minimo) values (504, 15, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (505, 'lote 136100', '2023-07-31', '2026-01-31', 18.0, 11, 11); 
insert into estoque_total (medicamento_id, total, minimo) values (505, 11, 10); 

-- vendas, itens de venda
insert into venda (cliente_id, profissional_id, time_stamp, total) values (7, 21, '2023-08-02 11:33:33', 1066.49); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (1, 209, 209, 2, 33.10, 58.94); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 209; 
update estoque_total set total = total - 2 where medicamento_id = 209; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (1, 47, 47, 3, 66.80, 675.61); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 47; 
update estoque_total set total = total - 3 where medicamento_id = 47; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (1, 46, 46, 2, 82.90, 331.94); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 46; 
update estoque_total set total = total - 2 where medicamento_id = 46; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (209, 'lote 186699', '2023-08-02', '2026-02-28', 16.3, 2, 2); 
update estoque_total set total = total + 2 where medicamento_id = 209; 

insert into venda (profissional_id, time_stamp, total) values (25, '2023-08-03 16:56:50', 717.88); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (2, 373, 373, 3, 0.00, 104.19); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 373; 
update estoque_total set total = total - 3 where medicamento_id = 373; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (2, 490, 490, 1, 4.60, 47.43); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 490; 
update estoque_total set total = total - 1 where medicamento_id = 490; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (2, 46, 46, 3, 56.00, 566.26); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 46; 
update estoque_total set total = total - 3 where medicamento_id = 46; 

insert into venda (profissional_id, time_stamp, total) values (25, '2023-08-03 17:59:53', 18.90); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (3, 43, 43, 3, 1.80, 18.90); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 43; 
update estoque_total set total = total - 3 where medicamento_id = 43; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (6, 21, '2023-08-03 20:10:53', 671.42); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (4, 232, 232, 4, 27.90, 282.70); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 232; 
update estoque_total set total = total - 4 where medicamento_id = 232; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (4, 143, 143, 2, 0.00, 388.72); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 143; 
update estoque_total set total = total - 2 where medicamento_id = 143; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (5, 25, '2023-08-07 16:10:16', 542.77); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (5, 366, 366, 9, 13.30, 432.47); 
update estoque set quant_venda = quant_venda + 9, quant_atual = quant_atual - 9 where id = 366; 
update estoque_total set total = total - 9 where medicamento_id = 366; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (5, 232, 232, 2, 45.00, 110.30); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 232; 
update estoque_total set total = total - 2 where medicamento_id = 232; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (11, 22, '2023-08-09 03:42:01', 196.83); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (6, 457, 457, 9, 110.70, 196.83); 
update estoque set quant_venda = quant_venda + 9, quant_atual = quant_atual - 9 where id = 457; 
update estoque_total set total = total - 9 where medicamento_id = 457; 

insert into venda (profissional_id, time_stamp, total) values (24, '2023-08-09 03:58:07', 1072.68); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (7, 364, 364, 3, 2.90, 96.46); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 364; 
update estoque_total set total = total - 3 where medicamento_id = 364; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (7, 439, 439, 6, 19.60, 226.22); 
update estoque set quant_venda = quant_venda + 6, quant_atual = quant_atual - 6 where id = 439; 
update estoque_total set total = total - 6 where medicamento_id = 439; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (7, 300, 300, 3, 0.00, 750.00); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 300; 
update estoque_total set total = total - 3 where medicamento_id = 300; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (364, 'lote 665775', '2023-08-09', '2025-02-28', 14.7, 23, 23); 
update estoque_total set total = total + 23 where medicamento_id = 364; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (439, 'lote 684899', '2023-08-09', '2026-08-31', 18.9, 14, 14); 
update estoque_total set total = total + 14 where medicamento_id = 439; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (20, 23, '2023-08-10 06:04:42', 364.26); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (8, 106, 106, 1, 47.30, 347.14); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 106; 
update estoque_total set total = total - 1 where medicamento_id = 106; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (8, 397, 397, 1, 1.00, 17.12); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 397; 
update estoque_total set total = total - 1 where medicamento_id = 397; 

insert into venda (profissional_id, time_stamp, total) values (24, '2023-08-11 08:34:50', 990.93); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (9, 270, 270, 3, 0.00, 990.93); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 270; 
update estoque_total set total = total - 3 where medicamento_id = 270; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (270, 'lote 887289', '2023-08-11', '2026-02-28', 164.6, 9, 9); 
update estoque_total set total = total + 9 where medicamento_id = 270; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (3, 25, '2023-08-13 18:21:11', 15.10); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (10, 217, 217, 2, 7.00, 15.10); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 217; 
update estoque_total set total = total - 2 where medicamento_id = 217; 

insert into venda (profissional_id, time_stamp, total) values (22, '2023-08-13 21:31:01', 137.50); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (11, 133, 133, 1, 4.10, 65.66); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 133; 
update estoque_total set total = total - 1 where medicamento_id = 133; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (11, 128, 128, 1, 7.10, 71.84); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 128; 
update estoque_total set total = total - 1 where medicamento_id = 128; 

insert into venda (profissional_id, time_stamp, total) values (24, '2023-08-13 22:52:10', 735.34); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (12, 78, 78, 2, 33.70, 341.44); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 78; 
update estoque_total set total = total - 2 where medicamento_id = 78; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (12, 391, 391, 3, 13.30, 253.70); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 391; 
update estoque_total set total = total - 3 where medicamento_id = 391; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (12, 451, 451, 8, 13.80, 140.20); 
update estoque set quant_venda = quant_venda + 8, quant_atual = quant_atual - 8 where id = 451; 
update estoque_total set total = total - 8 where medicamento_id = 451; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (13, 24, '2023-08-14 01:35:55', 616.83); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (13, 488, 488, 4, 59.00, 137.92); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 488; 
update estoque_total set total = total - 4 where medicamento_id = 488; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (13, 343, 343, 1, 1.80, 29.64); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 343; 
update estoque_total set total = total - 1 where medicamento_id = 343; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (13, 189, 189, 3, 174.70, 449.27); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 189; 
update estoque_total set total = total - 3 where medicamento_id = 189; 

insert into venda (profissional_id, time_stamp, total) values (24, '2023-08-15 07:53:45', 1350.88); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (14, 28, 28, 4, 19.10, 618.50); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 28; 
update estoque_total set total = total - 4 where medicamento_id = 28; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (14, 21, 21, 2, 56.60, 572.90); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 21; 
update estoque_total set total = total - 2 where medicamento_id = 21; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (14, 177, 177, 2, 3.20, 159.48); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 177; 
update estoque_total set total = total - 2 where medicamento_id = 177; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (21, 'lote 956276', '2023-08-15', '2025-08-31', 128.5, 3, 3); 
update estoque_total set total = total + 3 where medicamento_id = 21; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (8, 23, '2023-08-16 17:31:37', 177.52); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (15, 436, 436, 3, 19.70, 177.52); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 436; 
update estoque_total set total = total - 3 where medicamento_id = 436; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (12, 21, '2023-08-16 21:18:26', 111.37); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (16, 193, 193, 1, 57.30, 111.37); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 193; 
update estoque_total set total = total - 1 where medicamento_id = 193; 

insert into venda (profissional_id, time_stamp, total) values (22, '2023-08-16 21:20:06', 312.62); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (17, 457, 457, 1, 1.00, 33.17); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 457; 
update estoque_total set total = total - 1 where medicamento_id = 457; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (17, 318, 318, 5, 0.00, 279.45); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 318; 
update estoque_total set total = total - 5 where medicamento_id = 318; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (12, 25, '2023-08-18 00:49:04', 173.79); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (18, 111, 111, 2, 18.20, 60.94); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 111; 
update estoque_total set total = total - 2 where medicamento_id = 111; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (18, 331, 331, 5, 7.10, 112.85); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 331; 
update estoque_total set total = total - 5 where medicamento_id = 331; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (111, 'lote 643022', '2023-08-18', '2024-08-31', 18.8, 7, 7); 
update estoque_total set total = total + 7 where medicamento_id = 111; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (14, 25, '2023-08-18 01:11:29', 890.87); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (19, 29, 29, 1, 3.00, 306.14); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 29; 
update estoque_total set total = total - 1 where medicamento_id = 29; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (19, 33, 33, 3, 119.70, 584.73); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 33; 
update estoque_total set total = total - 3 where medicamento_id = 33; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (18, 24, '2023-08-21 16:25:38', 205.70); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (20, 26, 26, 1, 115.70, 205.70); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 26; 
update estoque_total set total = total - 1 where medicamento_id = 26; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (26, 'lote 177533', '2023-08-21', '2025-08-31', 130.9, 6, 6); 
update estoque_total set total = total + 6 where medicamento_id = 26; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (1, 23, '2023-08-21 19:16:46', 768.07); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (21, 429, 429, 7, 24.20, 148.77); 
update estoque set quant_venda = quant_venda + 7, quant_atual = quant_atual - 7 where id = 429; 
update estoque_total set total = total - 7 where medicamento_id = 429; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (21, 316, 316, 5, 278.20, 619.30); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 316; 
update estoque_total set total = total - 5 where medicamento_id = 316; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (12, 21, '2023-08-21 21:13:07', 1031.22); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (22, 139, 139, 3, 359.50, 562.52); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 139; 
update estoque_total set total = total - 3 where medicamento_id = 139; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (22, 473, 473, 5, 78.60, 167.20); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 473; 
update estoque_total set total = total - 5 where medicamento_id = 473; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (22, 219, 219, 5, 162.30, 301.50); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 219; 
update estoque_total set total = total - 5 where medicamento_id = 219; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (139, 'lote 207847', '2023-08-21', '2025-02-28', 140.2, 6, 6); 
update estoque_total set total = total + 6 where medicamento_id = 139; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (473, 'lote 630689', '2023-08-21', '2025-08-31', 17.9, 10, 10); 
update estoque_total set total = total + 10 where medicamento_id = 473; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (219, 'lote 778778', '2023-08-21', '2026-08-31', 34.9, 18, 18); 
update estoque_total set total = total + 18 where medicamento_id = 219; 

insert into venda (profissional_id, time_stamp, total) values (24, '2023-08-23 02:46:40', 1085.73); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (23, 483, 483, 4, 10.00, 190.84); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 483; 
update estoque_total set total = total - 4 where medicamento_id = 483; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (23, 335, 335, 7, 1.70, 176.94); 
update estoque set quant_venda = quant_venda + 7, quant_atual = quant_atual - 7 where id = 335; 
update estoque_total set total = total - 7 where medicamento_id = 335; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (23, 14, 14, 5, 62.40, 717.95); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 14; 
update estoque_total set total = total - 5 where medicamento_id = 14; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (20, 24, '2023-08-23 06:00:28', 51.74); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (24, 445, 445, 4, 21.10, 51.74); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 445; 
update estoque_total set total = total - 4 where medicamento_id = 445; 

insert into venda (profissional_id, time_stamp, total) values (23, '2023-08-23 08:35:42', 301.28); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (25, 460, 460, 8, 0.00, 301.28); 
update estoque set quant_venda = quant_venda + 8, quant_atual = quant_atual - 8 where id = 460; 
update estoque_total set total = total - 8 where medicamento_id = 460; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (11, 23, '2023-08-24 19:12:13', 557.37); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (26, 49, 49, 1, 28.20, 113.22); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 49; 
update estoque_total set total = total - 1 where medicamento_id = 49; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (26, 411, 411, 5, 129.90, 230.95); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 411; 
update estoque_total set total = total - 5 where medicamento_id = 411; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (26, 186, 186, 5, 74.90, 213.20); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 186; 
update estoque_total set total = total - 5 where medicamento_id = 186; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (16, 22, '2023-08-24 19:15:52', 926.59); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (27, 70, 70, 5, 53.40, 539.95); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 70; 
update estoque_total set total = total - 5 where medicamento_id = 70; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (27, 31, 31, 1, 7.80, 386.64); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 31; 
update estoque_total set total = total - 1 where medicamento_id = 31; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (8, 23, '2023-08-24 20:13:14', 401.62); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (28, 371, 371, 4, 148.50, 401.62); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 371; 
update estoque_total set total = total - 4 where medicamento_id = 371; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (1, 25, '2023-08-27 04:34:44', 389.54); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (29, 434, 434, 1, 8.40, 24.26); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 434; 
update estoque_total set total = total - 1 where medicamento_id = 434; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (29, 211, 211, 2, 121.70, 365.28); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 211; 
update estoque_total set total = total - 2 where medicamento_id = 211; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (10, 25, '2023-08-29 12:13:10', 197.46); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (30, 201, 201, 5, 3.50, 175.20); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 201; 
update estoque_total set total = total - 5 where medicamento_id = 201; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (30, 252, 252, 1, 5.80, 22.26); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 252; 
update estoque_total set total = total - 1 where medicamento_id = 252; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (8, 21, '2023-08-30 18:20:37', 526.76); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (31, 372, 372, 4, 159.10, 270.90); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 372; 
update estoque_total set total = total - 4 where medicamento_id = 372; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (31, 165, 165, 3, 31.90, 86.30); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 165; 
update estoque_total set total = total - 3 where medicamento_id = 165; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (31, 282, 282, 4, 45.00, 169.56); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 282; 
update estoque_total set total = total - 4 where medicamento_id = 282; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (8, 25, '2023-09-01 03:04:16', 499.40); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (32, 243, 243, 3, 15.00, 100.44); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 243; 
update estoque_total set total = total - 3 where medicamento_id = 243; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (32, 166, 166, 1, 29.60, 217.18); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 166; 
update estoque_total set total = total - 1 where medicamento_id = 166; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (32, 355, 355, 8, 27.10, 181.78); 
update estoque set quant_venda = quant_venda + 8, quant_atual = quant_atual - 8 where id = 355; 
update estoque_total set total = total - 8 where medicamento_id = 355; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (243, 'lote 899942', '2023-09-01', '2024-09-30', 21.2, 43, 43); 
update estoque_total set total = total + 43 where medicamento_id = 243; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (15, 22, '2023-09-01 05:17:29', 729.44); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (33, 278, 278, 6, 33.60, 176.64); 
update estoque set quant_venda = quant_venda + 6, quant_atual = quant_atual - 6 where id = 278; 
update estoque_total set total = total - 6 where medicamento_id = 278; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (33, 337, 337, 10, 130.80, 320.30); 
update estoque set quant_venda = quant_venda + 10, quant_atual = quant_atual - 10 where id = 337; 
update estoque_total set total = total - 10 where medicamento_id = 337; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (33, 333, 333, 2, 9.60, 232.50); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 333; 
update estoque_total set total = total - 2 where medicamento_id = 333; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (278, 'lote 870111', '2023-09-01', '2024-09-30', 16.5, 11, 11); 
update estoque_total set total = total + 11 where medicamento_id = 278; 

insert into venda (profissional_id, time_stamp, total) values (24, '2023-09-01 08:46:09', 1024.10); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (34, 316, 316, 2, 28.70, 330.30); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 316; 
update estoque_total set total = total - 2 where medicamento_id = 316; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (34, 133, 133, 3, 16.70, 192.58); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 133; 
update estoque_total set total = total - 3 where medicamento_id = 133; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (34, 180, 180, 3, 15.50, 501.22); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 180; 
update estoque_total set total = total - 3 where medicamento_id = 180; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (8, 23, '2023-09-01 11:41:19', 950.66); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (35, 23, 23, 1, 19.10, 300.87); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 23; 
update estoque_total set total = total - 1 where medicamento_id = 23; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (35, 47, 47, 2, 69.20, 425.74); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 47; 
update estoque_total set total = total - 2 where medicamento_id = 47; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (35, 231, 231, 5, 78.60, 224.05); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 231; 
update estoque_total set total = total - 5 where medicamento_id = 231; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (231, 'lote 379580', '2023-09-01', '2025-03-31', 32.4, 10, 10); 
update estoque_total set total = total + 10 where medicamento_id = 231; 

insert into venda (profissional_id, time_stamp, total) values (22, '2023-09-02 21:15:32', 968.79); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (36, 382, 382, 7, 16.90, 224.74); 
update estoque set quant_venda = quant_venda + 7, quant_atual = quant_atual - 7 where id = 382; 
update estoque_total set total = total - 7 where medicamento_id = 382; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (36, 266, 266, 1, 9.50, 110.37); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 266; 
update estoque_total set total = total - 1 where medicamento_id = 266; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (36, 163, 163, 4, 26.40, 633.68); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 163; 
update estoque_total set total = total - 4 where medicamento_id = 163; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (382, 'lote 453803', '2023-09-02', '2024-03-31', 19.0, 31, 31); 
update estoque_total set total = total + 31 where medicamento_id = 382; 

insert into venda (profissional_id, time_stamp, total) values (24, '2023-09-03 21:49:49', 584.73); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (37, 20, 20, 2, 13.00, 422.96); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 20; 
update estoque_total set total = total - 2 where medicamento_id = 20; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (37, 72, 72, 7, 2.50, 125.25); 
update estoque set quant_venda = quant_venda + 7, quant_atual = quant_atual - 7 where id = 72; 
update estoque_total set total = total - 7 where medicamento_id = 72; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (37, 375, 375, 2, 3.10, 36.52); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 375; 
update estoque_total set total = total - 2 where medicamento_id = 375; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (1, 23, '2023-09-04 01:17:45', 261.79); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (38, 465, 465, 2, 17.10, 227.34); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 465; 
update estoque_total set total = total - 2 where medicamento_id = 465; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (38, 463, 463, 3, 5.60, 34.45); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 463; 
update estoque_total set total = total - 3 where medicamento_id = 463; 

insert into venda (profissional_id, time_stamp, total) values (25, '2023-09-05 05:18:37', 562.54); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (39, 156, 156, 5, 40.00, 460.70); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 156; 
update estoque_total set total = total - 5 where medicamento_id = 156; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (39, 427, 427, 8, 2.00, 101.84); 
update estoque set quant_venda = quant_venda + 8, quant_atual = quant_atual - 8 where id = 427; 
update estoque_total set total = total - 8 where medicamento_id = 427; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (4, 24, '2023-09-05 07:29:14', 802.87); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (40, 168, 168, 3, 226.40, 802.87); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 168; 
update estoque_total set total = total - 3 where medicamento_id = 168; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (14, 23, '2023-09-05 09:41:06', 210.14); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (41, 304, 304, 9, 37.00, 210.14); 
update estoque set quant_venda = quant_venda + 9, quant_atual = quant_atual - 9 where id = 304; 
update estoque_total set total = total - 9 where medicamento_id = 304; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (4, 25, '2023-09-06 13:28:57', 158.98); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (42, 439, 508, 4, 4.90, 158.98); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 508; 
update estoque_total set total = total - 4 where medicamento_id = 439; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (12, 22, '2023-09-06 14:07:57', 291.42); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (43, 244, 244, 7, 67.50, 143.48); 
update estoque set quant_venda = quant_venda + 7, quant_atual = quant_atual - 7 where id = 244; 
update estoque_total set total = total - 7 where medicamento_id = 244; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (43, 438, 438, 1, 0.00, 52.29); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 438; 
update estoque_total set total = total - 1 where medicamento_id = 438; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (43, 333, 333, 1, 25.40, 95.65); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 333; 
update estoque_total set total = total - 1 where medicamento_id = 333; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (244, 'lote 815143', '2023-09-06', '2025-03-31', 11.5, 35, 35); 
update estoque_total set total = total + 35 where medicamento_id = 244; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (438, 'lote 373933', '2023-09-06', '2026-03-31', 21.1, 14, 14); 
update estoque_total set total = total + 14 where medicamento_id = 438; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (8, 25, '2023-09-08 01:13:05', 145.85); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (44, 127, 127, 5, 82.00, 145.85); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 127; 
update estoque_total set total = total - 5 where medicamento_id = 127; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (127, 'lote 800466', '2023-09-08', '2025-09-30', 21.6, 6, 6); 
update estoque_total set total = total + 6 where medicamento_id = 127; 

insert into venda (profissional_id, time_stamp, total) values (22, '2023-09-08 02:27:35', 779.87); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (45, 255, 255, 4, 2.00, 200.88); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 255; 
update estoque_total set total = total - 4 where medicamento_id = 255; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (45, 60, 60, 3, 40.30, 464.15); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 60; 
update estoque_total set total = total - 3 where medicamento_id = 60; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (45, 310, 310, 1, 8.60, 114.84); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 310; 
update estoque_total set total = total - 1 where medicamento_id = 310; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (9, 25, '2023-09-08 04:16:44', 363.56); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (46, 48, 48, 2, 19.10, 363.56); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 48; 
update estoque_total set total = total - 2 where medicamento_id = 48; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (20, 21, '2023-09-09 09:22:38', 785.96); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (47, 60, 60, 2, 26.90, 309.40); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 60; 
update estoque_total set total = total - 2 where medicamento_id = 60; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (47, 11, 11, 3, 72.30, 308.58); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 11; 
update estoque_total set total = total - 3 where medicamento_id = 11; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (47, 135, 135, 4, 82.70, 167.98); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 135; 
update estoque_total set total = total - 4 where medicamento_id = 135; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (135, 'lote 576155', '2023-09-09', '2024-09-30', 22.5, 6, 6); 
update estoque_total set total = total + 6 where medicamento_id = 135; 

insert into venda (profissional_id, time_stamp, total) values (25, '2023-09-09 10:27:24', 731.80); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (48, 283, 283, 2, 2.00, 101.80); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 283; 
update estoque_total set total = total - 2 where medicamento_id = 283; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (48, 26, 26, 2, 12.80, 630.00); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 26; 
update estoque_total set total = total - 2 where medicamento_id = 26; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (26, 'lote 180561', '2023-09-09', '2025-09-30', 130.9, 3, 3); 
update estoque_total set total = total + 3 where medicamento_id = 26; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (6, 22, '2023-09-11 18:20:05', 95.12); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (49, 435, 435, 1, 2.90, 95.12); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 435; 
update estoque_total set total = total - 1 where medicamento_id = 435; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (6, 23, '2023-09-11 21:41:59', 343.04); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (50, 58, 58, 2, 25.80, 343.04); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 58; 
update estoque_total set total = total - 2 where medicamento_id = 58; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (8, 21, '2023-09-11 23:58:41', 926.92); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (51, 4, 4, 3, 276.80, 926.92); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 4; 
update estoque_total set total = total - 3 where medicamento_id = 4; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (13, 25, '2023-09-12 03:14:31', 359.07); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (52, 327, 327, 6, 60.70, 129.02); 
update estoque set quant_venda = quant_venda + 6, quant_atual = quant_atual - 6 where id = 327; 
update estoque_total set total = total - 6 where medicamento_id = 327; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (52, 154, 154, 5, 113.20, 230.05); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 154; 
update estoque_total set total = total - 5 where medicamento_id = 154; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (11, 22, '2023-09-13 10:18:05', 522.66); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (53, 205, 205, 4, 223.90, 522.66); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 205; 
update estoque_total set total = total - 4 where medicamento_id = 205; 

insert into venda (profissional_id, time_stamp, total) values (25, '2023-09-13 13:06:38', 888.96); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (54, 156, 156, 2, 18.00, 182.28); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 156; 
update estoque_total set total = total - 2 where medicamento_id = 156; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (54, 299, 299, 10, 0.00, 342.00); 
update estoque set quant_venda = quant_venda + 10, quant_atual = quant_atual - 10 where id = 299; 
update estoque_total set total = total - 10 where medicamento_id = 299; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (54, 435, 435, 4, 27.40, 364.68); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 435; 
update estoque_total set total = total - 4 where medicamento_id = 435; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (435, 'lote 240910', '2023-09-13', '2024-09-30', 34.6, 14, 14); 
update estoque_total set total = total + 14 where medicamento_id = 435; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (10, 24, '2023-09-14 19:19:12', 376.54); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (55, 273, 273, 9, 71.60, 226.84); 
update estoque set quant_venda = quant_venda + 9, quant_atual = quant_atual - 9 where id = 273; 
update estoque_total set total = total - 9 where medicamento_id = 273; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (55, 72, 72, 10, 32.80, 149.70); 
update estoque set quant_venda = quant_venda + 10, quant_atual = quant_atual - 10 where id = 72; 
update estoque_total set total = total - 10 where medicamento_id = 72; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (7, 23, '2023-09-14 20:50:50', 477.42); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (56, 214, 214, 2, 20.50, 116.34); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 214; 
update estoque_total set total = total - 2 where medicamento_id = 214; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (56, 298, 298, 2, 23.30, 188.66); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 298; 
update estoque_total set total = total - 2 where medicamento_id = 298; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (56, 472, 472, 6, 3.50, 172.42); 
update estoque set quant_venda = quant_venda + 6, quant_atual = quant_atual - 6 where id = 472; 
update estoque_total set total = total - 6 where medicamento_id = 472; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (214, 'lote 311674', '2023-09-14', '2026-09-30', 26.1, 14, 14); 
update estoque_total set total = total + 14 where medicamento_id = 214; 

insert into venda (profissional_id, time_stamp, total) values (21, '2023-09-16 00:49:00', 577.07); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (57, 72, 72, 6, 3.20, 106.30); 
update estoque set quant_venda = quant_venda + 6, quant_atual = quant_atual - 6 where id = 72; 
update estoque_total set total = total - 6 where medicamento_id = 72; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (57, 14, 14, 1, 4.60, 151.47); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 14; 
update estoque_total set total = total - 1 where medicamento_id = 14; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (57, 458, 458, 9, 6.50, 319.30); 
update estoque set quant_venda = quant_venda + 9, quant_atual = quant_atual - 9 where id = 458; 
update estoque_total set total = total - 9 where medicamento_id = 458; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (72, 'lote 994736', '2023-09-16', '2024-03-31', 9.0, 35, 35); 
update estoque_total set total = total + 35 where medicamento_id = 72; 

insert into venda (profissional_id, time_stamp, total) values (24, '2023-09-16 04:04:06', 140.49); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (58, 73, 73, 3, 10.50, 140.49); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 73; 
update estoque_total set total = total - 3 where medicamento_id = 73; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (18, 24, '2023-09-16 06:18:20', 607.32); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (59, 360, 360, 3, 93.20, 350.98); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 360; 
update estoque_total set total = total - 3 where medicamento_id = 360; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (59, 313, 313, 4, 14.90, 151.26); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 313; 
update estoque_total set total = total - 4 where medicamento_id = 313; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (59, 318, 318, 2, 6.70, 105.08); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 318; 
update estoque_total set total = total - 2 where medicamento_id = 318; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (313, 'lote 225702', '2023-09-16', '2026-03-31', 20.0, 10, 10); 
update estoque_total set total = total + 10 where medicamento_id = 313; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (1, 24, '2023-09-17 09:22:48', 417.54); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (60, 358, 358, 4, 31.00, 116.96); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 358; 
update estoque_total set total = total - 4 where medicamento_id = 358; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (60, 209, 209, 4, 40.40, 143.68); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 209; 
update estoque_total set total = total - 4 where medicamento_id = 209; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (60, 402, 402, 10, 11.80, 156.90); 
update estoque set quant_venda = quant_venda + 10, quant_atual = quant_atual - 10 where id = 402; 
update estoque_total set total = total - 10 where medicamento_id = 402; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (209, 'lote 268125', '2023-09-17', '2026-03-31', 16.3, 6, 6); 
update estoque_total set total = total + 6 where medicamento_id = 209; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (5, 23, '2023-09-17 12:52:54', 677.77); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (61, 426, 426, 7, 0.00, 253.82); 
update estoque set quant_venda = quant_venda + 7, quant_atual = quant_atual - 7 where id = 426; 
update estoque_total set total = total - 7 where medicamento_id = 426; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (61, 17, 17, 4, 0.00, 333.56); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 17; 
update estoque_total set total = total - 4 where medicamento_id = 17; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (61, 498, 498, 3, 15.90, 90.39); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 498; 
update estoque_total set total = total - 3 where medicamento_id = 498; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (17, 'lote 827413', '2023-09-17', '2025-03-31', 33.0, 18, 18); 
update estoque_total set total = total + 18 where medicamento_id = 17; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (7, 25, '2023-09-18 22:17:06', 80.74); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (62, 123, 123, 2, 22.70, 80.74); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 123; 
update estoque_total set total = total - 2 where medicamento_id = 123; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (123, 'lote 469999', '2023-09-18', '2026-09-30', 20.5, 18, 18); 
update estoque_total set total = total + 18 where medicamento_id = 123; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (13, 22, '2023-09-20 05:20:47', 248.46); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (63, 144, 144, 1, 9.40, 225.85); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 144; 
update estoque_total set total = total - 1 where medicamento_id = 144; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (63, 183, 183, 1, 11.00, 22.61); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 183; 
update estoque_total set total = total - 1 where medicamento_id = 183; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (1, 24, '2023-09-20 06:28:20', 386.96); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (64, 387, 387, 4, 10.40, 250.00); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 387; 
update estoque_total set total = total - 4 where medicamento_id = 387; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (64, 407, 407, 2, 2.70, 136.96); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 407; 
update estoque_total set total = total - 2 where medicamento_id = 407; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (387, 'lote 191836', '2023-09-20', '2026-09-30', 22.8, 18, 18); 
update estoque_total set total = total + 18 where medicamento_id = 387; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (407, 'lote 359292', '2023-09-20', '2025-09-30', 36.3, 6, 6); 
update estoque_total set total = total + 6 where medicamento_id = 407; 

insert into venda (profissional_id, time_stamp, total) values (21, '2023-09-21 15:13:02', 98.41); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (65, 457, 457, 3, 4.10, 98.41); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 457; 
update estoque_total set total = total - 3 where medicamento_id = 457; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (3, 21, '2023-09-21 16:20:59', 56.72); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (66, 431, 431, 5, 18.50, 37.80); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 431; 
update estoque_total set total = total - 5 where medicamento_id = 431; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (66, 322, 322, 1, 9.20, 18.92); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 322; 
update estoque_total set total = total - 1 where medicamento_id = 322; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (15, 23, '2023-09-21 18:29:58', 919.14); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (67, 278, 517, 10, 7.00, 343.40); 
update estoque set quant_venda = quant_venda + 10, quant_atual = quant_atual - 10 where id = 517; 
update estoque_total set total = total - 10 where medicamento_id = 278; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (67, 238, 238, 9, 47.30, 80.59); 
update estoque set quant_venda = quant_venda + 9, quant_atual = quant_atual - 9 where id = 238; 
update estoque_total set total = total - 9 where medicamento_id = 238; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (67, 280, 280, 5, 26.00, 495.15); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 280; 
update estoque_total set total = total - 5 where medicamento_id = 280; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (14, 25, '2023-09-23 01:08:27', 773.40); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (68, 360, 360, 4, 94.70, 497.54); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 360; 
update estoque_total set total = total - 4 where medicamento_id = 360; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (68, 199, 199, 7, 39.20, 262.92); 
update estoque set quant_venda = quant_venda + 7, quant_atual = quant_atual - 7 where id = 199; 
update estoque_total set total = total - 7 where medicamento_id = 199; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (68, 481, 481, 1, 0.40, 12.94); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 481; 
update estoque_total set total = total - 1 where medicamento_id = 481; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (6, 23, '2023-09-24 09:18:59', 546.82); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (69, 162, 162, 3, 12.10, 190.13); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 162; 
update estoque_total set total = total - 3 where medicamento_id = 162; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (69, 257, 257, 1, 123.80, 220.10); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 257; 
update estoque_total set total = total - 1 where medicamento_id = 257; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (69, 347, 347, 3, 50.40, 136.59); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 347; 
update estoque_total set total = total - 3 where medicamento_id = 347; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (162, 'lote 358946', '2023-09-24', '2026-09-30', 34.5, 6, 6); 
update estoque_total set total = total + 6 where medicamento_id = 162; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (257, 'lote 880255', '2023-09-24', '2026-03-31', 149.1, 6, 6); 
update estoque_total set total = total + 6 where medicamento_id = 257; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (19, 22, '2023-09-24 10:01:31', 77.94); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (70, 118, 118, 2, 3.20, 77.94); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 118; 
update estoque_total set total = total - 2 where medicamento_id = 118; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (118, 'lote 412214', '2023-09-24', '2026-03-31', 21.1, 10, 10); 
update estoque_total set total = total + 10 where medicamento_id = 118; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (19, 23, '2023-09-25 15:23:11', 136.68); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (71, 361, 361, 1, 53.10, 136.68); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 361; 
update estoque_total set total = total - 1 where medicamento_id = 361; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (1, 22, '2023-09-25 15:33:33', 130.76); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (72, 335, 335, 8, 73.40, 130.76); 
update estoque set quant_venda = quant_venda + 8, quant_atual = quant_atual - 8 where id = 335; 
update estoque_total set total = total - 8 where medicamento_id = 335; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (3, 22, '2023-09-26 22:10:46', 185.87); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (73, 236, 236, 1, 41.10, 91.71); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 236; 
update estoque_total set total = total - 1 where medicamento_id = 236; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (73, 284, 284, 9, 52.90, 94.16); 
update estoque set quant_venda = quant_venda + 9, quant_atual = quant_atual - 9 where id = 284; 
update estoque_total set total = total - 9 where medicamento_id = 284; 

insert into venda (profissional_id, time_stamp, total) values (22, '2023-09-26 22:35:28', 219.18); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (74, 116, 116, 3, 0.20, 23.02); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 116; 
update estoque_total set total = total - 3 where medicamento_id = 116; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (74, 393, 393, 8, 0.00, 196.16); 
update estoque set quant_venda = quant_venda + 8, quant_atual = quant_atual - 8 where id = 393; 
update estoque_total set total = total - 8 where medicamento_id = 393; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (116, 'lote 676817', '2023-09-26', '2024-03-31', 2.9, 43, 43); 
update estoque_total set total = total + 43 where medicamento_id = 116; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (20, 21, '2023-09-27 00:05:19', 61.78); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (75, 345, 345, 3, 16.40, 61.78); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 345; 
update estoque_total set total = total - 3 where medicamento_id = 345; 

insert into venda (profissional_id, time_stamp, total) values (24, '2023-09-28 05:04:01', 120.38); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (76, 125, 125, 2, 11.90, 120.38); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 125; 
update estoque_total set total = total - 2 where medicamento_id = 125; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (125, 'lote 934020', '2023-09-28', '2025-03-31', 23.3, 14, 14); 
update estoque_total set total = total + 14 where medicamento_id = 125; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (19, 25, '2023-09-28 08:53:30', 625.10); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (77, 306, 306, 2, 8.30, 157.98); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 306; 
update estoque_total set total = total - 2 where medicamento_id = 306; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (77, 330, 330, 4, 6.60, 324.04); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 330; 
update estoque_total set total = total - 4 where medicamento_id = 330; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (77, 306, 306, 2, 23.20, 143.08); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 306; 
update estoque_total set total = total - 2 where medicamento_id = 306; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (306, 'lote 157271', '2023-09-28', '2024-09-30', 39.7, 10, 10); 
update estoque_total set total = total + 10 where medicamento_id = 306; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (330, 'lote 557205', '2023-09-28', '2025-03-31', 30.5, 14, 14); 
update estoque_total set total = total + 14 where medicamento_id = 330; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (306, 'lote 587668', '2023-09-28', '2024-09-30', 39.7, 18, 18); 
update estoque_total set total = total + 18 where medicamento_id = 306; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (2, 23, '2023-09-29 20:31:22', 158.83); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (78, 502, 502, 7, 53.40, 99.27); 
update estoque set quant_venda = quant_venda + 7, quant_atual = quant_atual - 7 where id = 502; 
update estoque_total set total = total - 7 where medicamento_id = 502; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (78, 379, 379, 7, 29.20, 59.56); 
update estoque set quant_venda = quant_venda + 7, quant_atual = quant_atual - 7 where id = 379; 
update estoque_total set total = total - 7 where medicamento_id = 379; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (17, 23, '2023-09-29 20:39:35', 543.93); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (79, 287, 287, 4, 95.60, 156.24); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 287; 
update estoque_total set total = total - 4 where medicamento_id = 287; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (79, 177, 177, 5, 73.20, 333.50); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 177; 
update estoque_total set total = total - 5 where medicamento_id = 177; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (79, 171, 171, 1, 17.10, 54.19); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 171; 
update estoque_total set total = total - 1 where medicamento_id = 171; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (18, 24, '2023-09-29 23:35:14', 69.40); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (80, 475, 475, 5, 31.10, 69.40); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 475; 
update estoque_total set total = total - 5 where medicamento_id = 475; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (7, 22, '2023-10-01 08:57:07', 52.84); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (81, 395, 395, 2, 29.70, 52.84); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 395; 
update estoque_total set total = total - 2 where medicamento_id = 395; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (395, 'lote 426468', '2023-10-01', '2024-04-30', 22.8, 2, 2); 
update estoque_total set total = total + 2 where medicamento_id = 395; 

insert into venda (profissional_id, time_stamp, total) values (25, '2023-10-01 08:58:57', 586.94); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (82, 58, 58, 1, 3.60, 180.82); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 58; 
update estoque_total set total = total - 1 where medicamento_id = 58; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (82, 76, 76, 3, 40.10, 406.12); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 76; 
update estoque_total set total = total - 3 where medicamento_id = 76; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (3, 22, '2023-10-01 12:51:58', 673.33); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (83, 320, 320, 3, 75.10, 551.18); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 320; 
update estoque_total set total = total - 3 where medicamento_id = 320; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (83, 499, 499, 5, 71.70, 122.15); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 499; 
update estoque_total set total = total - 5 where medicamento_id = 499; 

insert into venda (profissional_id, time_stamp, total) values (25, '2023-10-01 14:03:30', 973.45); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (84, 449, 449, 5, 4.90, 93.30); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 449; 
update estoque_total set total = total - 5 where medicamento_id = 449; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (84, 48, 48, 5, 76.50, 880.15); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 48; 
update estoque_total set total = total - 5 where medicamento_id = 48; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (18, 22, '2023-10-05 08:09:29', 135.05); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (85, 206, 206, 5, 33.70, 135.05); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 206; 
update estoque_total set total = total - 5 where medicamento_id = 206; 

insert into venda (profissional_id, time_stamp, total) values (25, '2023-10-05 11:15:44', 863.80); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (86, 142, 142, 4, 0.00, 366.72); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 142; 
update estoque_total set total = total - 4 where medicamento_id = 142; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (86, 435, 435, 2, 7.80, 188.24); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 435; 
update estoque_total set total = total - 2 where medicamento_id = 435; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (86, 65, 65, 4, 0.00, 308.84); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 65; 
update estoque_total set total = total - 4 where medicamento_id = 65; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (435, 'lote 500656', '2023-10-05', '2024-10-31', 34.6, 6, 6); 
update estoque_total set total = total + 6 where medicamento_id = 435; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (8, 23, '2023-10-05 13:18:29', 155.62); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (87, 167, 167, 1, 63.50, 155.62); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 167; 
update estoque_total set total = total - 1 where medicamento_id = 167; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (18, 23, '2023-10-07 01:09:45', 322.72); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (88, 142, 142, 4, 44.00, 322.72); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 142; 
update estoque_total set total = total - 4 where medicamento_id = 142; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (10, 25, '2023-10-08 05:30:03', 25.67); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (89, 457, 457, 1, 8.50, 25.67); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 457; 
update estoque_total set total = total - 1 where medicamento_id = 457; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (14, 23, '2023-10-08 07:21:03', 133.98); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (90, 296, 296, 3, 29.40, 133.98); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 296; 
update estoque_total set total = total - 3 where medicamento_id = 296; 

insert into venda (profissional_id, time_stamp, total) values (25, '2023-10-09 09:58:55', 610.46); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (91, 45, 45, 2, 9.50, 126.52); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 45; 
update estoque_total set total = total - 2 where medicamento_id = 45; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (91, 446, 446, 1, 0.00, 131.82); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 446; 
update estoque_total set total = total - 1 where medicamento_id = 446; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (91, 196, 196, 2, 26.40, 352.12); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 196; 
update estoque_total set total = total - 2 where medicamento_id = 196; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (6, 22, '2023-10-10 16:09:12', 74.34); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (92, 277, 277, 3, 31.80, 74.34); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 277; 
update estoque_total set total = total - 3 where medicamento_id = 277; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (277, 'lote 788313', '2023-10-10', '2026-04-30', 12.3, 7, 7); 
update estoque_total set total = total + 7 where medicamento_id = 277; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (15, 24, '2023-10-10 19:44:36', 430.13); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (93, 204, 204, 1, 0.00, 12.46); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 204; 
update estoque_total set total = total - 1 where medicamento_id = 204; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (93, 162, 162, 3, 62.60, 139.63); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 162; 
update estoque_total set total = total - 3 where medicamento_id = 162; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (93, 46, 46, 2, 136.80, 278.04); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 46; 
update estoque_total set total = total - 2 where medicamento_id = 46; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (162, 'lote 750212', '2023-10-10', '2026-10-31', 34.5, 18, 18); 
update estoque_total set total = total + 18 where medicamento_id = 162; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (12, 23, '2023-10-12 00:47:40', 165.26); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (94, 379, 379, 6, 27.30, 48.78); 
update estoque set quant_venda = quant_venda + 6, quant_atual = quant_atual - 6 where id = 379; 
update estoque_total set total = total - 6 where medicamento_id = 379; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (94, 125, 125, 2, 15.80, 116.48); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 125; 
update estoque_total set total = total - 2 where medicamento_id = 125; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (125, 'lote 589265', '2023-10-12', '2025-04-30', 23.3, 10, 10); 
update estoque_total set total = total + 10 where medicamento_id = 125; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (9, 24, '2023-10-12 01:30:58', 148.22); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (95, 1, 1, 2, 0.00, 148.22); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 1; 
update estoque_total set total = total - 2 where medicamento_id = 1; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1, 'lote 402451', '2023-10-12', '2024-10-31', 26.9, 18, 18); 
update estoque_total set total = total + 18 where medicamento_id = 1; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (17, 21, '2023-10-12 03:58:17', 98.70); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (96, 344, 344, 4, 42.30, 98.70); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 344; 
update estoque_total set total = total - 4 where medicamento_id = 344; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (7, 23, '2023-10-12 07:42:57', 395.50); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (97, 173, 173, 2, 186.10, 395.50); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 173; 
update estoque_total set total = total - 2 where medicamento_id = 173; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (6, 21, '2023-10-13 17:11:40', 595.61); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (98, 469, 469, 7, 80.40, 254.76); 
update estoque set quant_venda = quant_venda + 7, quant_atual = quant_atual - 7 where id = 469; 
update estoque_total set total = total - 7 where medicamento_id = 469; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (98, 437, 437, 8, 12.50, 196.94); 
update estoque set quant_venda = quant_venda + 8, quant_atual = quant_atual - 8 where id = 437; 
update estoque_total set total = total - 8 where medicamento_id = 437; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (98, 461, 461, 9, 23.40, 143.91); 
update estoque set quant_venda = quant_venda + 9, quant_atual = quant_atual - 9 where id = 461; 
update estoque_total set total = total - 9 where medicamento_id = 461; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (4, 21, '2023-10-13 17:33:43', 309.56); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (99, 307, 307, 2, 174.10, 309.56); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 307; 
update estoque_total set total = total - 2 where medicamento_id = 307; 

insert into venda (profissional_id, time_stamp, total) values (21, '2023-10-13 18:12:36', 108.84); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (100, 291, 291, 9, 6.90, 108.84); 
update estoque set quant_venda = quant_venda + 9, quant_atual = quant_atual - 9 where id = 291; 
update estoque_total set total = total - 9 where medicamento_id = 291; 

insert into venda (profissional_id, time_stamp, total) values (23, '2023-10-13 21:23:28', 1255.38); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (101, 46, 46, 2, 24.80, 390.04); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 46; 
update estoque_total set total = total - 2 where medicamento_id = 46; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (101, 228, 228, 3, 11.30, 554.74); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 228; 
update estoque_total set total = total - 3 where medicamento_id = 228; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (101, 232, 232, 4, 0.00, 310.60); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 232; 
update estoque_total set total = total - 4 where medicamento_id = 232; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (46, 'lote 581679', '2023-10-13', '2024-04-30', 111.3, 10, 10); 
update estoque_total set total = total + 10 where medicamento_id = 46; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (5, 23, '2023-10-15 05:24:50', 654.89); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (102, 447, 447, 5, 35.80, 96.85); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 447; 
update estoque_total set total = total - 5 where medicamento_id = 447; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (102, 22, 22, 3, 341.90, 558.04); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 22; 
update estoque_total set total = total - 3 where medicamento_id = 22; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (10, 25, '2023-10-15 06:37:02', 246.20); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (103, 458, 458, 10, 115.80, 246.20); 
update estoque set quant_venda = quant_venda + 10, quant_atual = quant_atual - 10 where id = 458; 
update estoque_total set total = total - 10 where medicamento_id = 458; 

insert into venda (profissional_id, time_stamp, total) values (21, '2023-10-15 08:57:26', 106.47); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (104, 40, 40, 3, 0.00, 106.47); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 40; 
update estoque_total set total = total - 3 where medicamento_id = 40; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (40, 'lote 958966', '2023-10-15', '2024-10-31', 12.9, 7, 7); 
update estoque_total set total = total + 7 where medicamento_id = 40; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (5, 22, '2023-10-15 10:02:36', 379.75); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (105, 427, 427, 4, 11.90, 40.02); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 427; 
update estoque_total set total = total - 4 where medicamento_id = 427; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (105, 286, 286, 9, 24.80, 286.15); 
update estoque set quant_venda = quant_venda + 9, quant_atual = quant_atual - 9 where id = 286; 
update estoque_total set total = total - 9 where medicamento_id = 286; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (105, 484, 484, 4, 12.50, 53.58); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 484; 
update estoque_total set total = total - 4 where medicamento_id = 484; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (11, 24, '2023-10-16 10:36:31', 51.56); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (106, 447, 447, 2, 1.50, 51.56); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 447; 
update estoque_total set total = total - 2 where medicamento_id = 447; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (19, 25, '2023-10-16 13:24:40', 248.26); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (107, 398, 398, 6, 24.20, 69.04); 
update estoque set quant_venda = quant_venda + 6, quant_atual = quant_atual - 6 where id = 398; 
update estoque_total set total = total - 6 where medicamento_id = 398; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (107, 480, 480, 8, 73.10, 179.22); 
update estoque set quant_venda = quant_venda + 8, quant_atual = quant_atual - 8 where id = 480; 
update estoque_total set total = total - 8 where medicamento_id = 480; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (19, 22, '2023-10-16 17:10:53', 375.80); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (108, 413, 413, 1, 7.20, 83.02); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 413; 
update estoque_total set total = total - 1 where medicamento_id = 413; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (108, 491, 491, 4, 0.00, 225.80); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 491; 
update estoque_total set total = total - 4 where medicamento_id = 491; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (108, 114, 114, 2, 22.30, 66.98); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 114; 
update estoque_total set total = total - 2 where medicamento_id = 114; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (114, 'lote 765207', '2023-10-16', '2026-04-30', 17.9, 6, 6); 
update estoque_total set total = total + 6 where medicamento_id = 114; 

insert into venda (profissional_id, time_stamp, total) values (23, '2023-10-16 19:43:04', 92.04); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (109, 209, 506, 2, 0.00, 92.04); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 506; 
update estoque_total set total = total - 2 where medicamento_id = 209; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (209, 'lote 445240', '2023-10-16', '2026-05-31', 16.3, 10, 10); 
update estoque_total set total = total + 10 where medicamento_id = 209; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (7, 22, '2023-10-19 12:56:47', 60.28); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (110, 482, 482, 4, 5.20, 60.28); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 482; 
update estoque_total set total = total - 4 where medicamento_id = 482; 

insert into venda (profissional_id, time_stamp, total) values (24, '2023-10-19 13:24:20', 823.20); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (111, 134, 134, 5, 47.20, 627.80); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 134; 
update estoque_total set total = total - 5 where medicamento_id = 134; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (111, 351, 351, 8, 12.20, 162.20); 
update estoque set quant_venda = quant_venda + 8, quant_atual = quant_atual - 8 where id = 351; 
update estoque_total set total = total - 8 where medicamento_id = 351; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (111, 299, 299, 1, 1.00, 33.20); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 299; 
update estoque_total set total = total - 1 where medicamento_id = 299; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (299, 'lote 812926', '2023-10-19', '2025-10-31', 11.9, 3, 3); 
update estoque_total set total = total + 3 where medicamento_id = 299; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (6, 24, '2023-10-19 15:45:15', 250.38); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (112, 409, 409, 8, 37.10, 158.50); 
update estoque set quant_venda = quant_venda + 8, quant_atual = quant_atual - 8 where id = 409; 
update estoque_total set total = total - 8 where medicamento_id = 409; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (112, 410, 410, 1, 14.90, 91.88); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 410; 
update estoque_total set total = total - 1 where medicamento_id = 410; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (12, 24, '2023-10-19 16:31:00', 324.21); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (113, 295, 295, 4, 105.30, 285.02); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 295; 
update estoque_total set total = total - 4 where medicamento_id = 295; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (113, 377, 377, 3, 11.00, 39.19); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 377; 
update estoque_total set total = total - 3 where medicamento_id = 377; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (377, 'lote 698237', '2023-10-19', '2024-10-31', 6.1, 39, 39); 
update estoque_total set total = total + 39 where medicamento_id = 377; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (3, 24, '2023-10-21 02:56:47', 499.60); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (114, 10, 10, 2, 115.00, 281.56); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 10; 
update estoque_total set total = total - 2 where medicamento_id = 10; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (114, 233, 233, 3, 15.50, 62.44); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 233; 
update estoque_total set total = total - 3 where medicamento_id = 233; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (114, 399, 399, 4, 51.80, 155.60); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 399; 
update estoque_total set total = total - 4 where medicamento_id = 399; 

insert into venda (profissional_id, time_stamp, total) values (23, '2023-10-21 05:30:20', 119.64); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (115, 212, 212, 2, 4.90, 119.64); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 212; 
update estoque_total set total = total - 2 where medicamento_id = 212; 

insert into venda (profissional_id, time_stamp, total) values (24, '2023-10-21 07:07:20', 61.54); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (116, 125, 546, 1, 4.60, 61.54); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 546; 
update estoque_total set total = total - 1 where medicamento_id = 125; 

insert into venda (profissional_id, time_stamp, total) values (21, '2023-10-21 08:00:02', 354.99); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (117, 503, 503, 7, 1.00, 24.69); 
update estoque set quant_venda = quant_venda + 7, quant_atual = quant_atual - 7 where id = 503; 
update estoque_total set total = total - 7 where medicamento_id = 503; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (117, 229, 229, 2, 17.30, 330.30); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 229; 
update estoque_total set total = total - 2 where medicamento_id = 229; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (16, 22, '2023-10-22 19:06:30', 552.06); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (118, 307, 307, 1, 84.60, 157.23); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 307; 
update estoque_total set total = total - 1 where medicamento_id = 307; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (118, 122, 122, 3, 101.30, 320.83); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 122; 
update estoque_total set total = total - 3 where medicamento_id = 122; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (118, 414, 414, 3, 41.50, 74.00); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 414; 
update estoque_total set total = total - 3 where medicamento_id = 414; 

insert into venda (profissional_id, time_stamp, total) values (23, '2023-10-22 22:22:21', 151.04); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (119, 253, 253, 2, 3.00, 151.04); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 253; 
update estoque_total set total = total - 2 where medicamento_id = 253; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (253, 'lote 862243', '2023-10-22', '2026-04-30', 28.7, 14, 14); 
update estoque_total set total = total + 14 where medicamento_id = 253; 

insert into venda (profissional_id, time_stamp, total) values (25, '2023-10-23 00:34:11', 87.34); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (120, 422, 422, 6, 8.60, 87.34); 
update estoque set quant_venda = quant_venda + 6, quant_atual = quant_atual - 6 where id = 422; 
update estoque_total set total = total - 6 where medicamento_id = 422; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (422, 'lote 185077', '2023-10-23', '2026-10-31', 6.3, 35, 35); 
update estoque_total set total = total + 35 where medicamento_id = 422; 

insert into venda (profissional_id, time_stamp, total) values (24, '2023-10-23 04:16:25', 177.00); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (121, 290, 290, 2, 1.20, 60.84); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 290; 
update estoque_total set total = total - 2 where medicamento_id = 290; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (121, 489, 489, 1, 0.00, 43.99); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 489; 
update estoque_total set total = total - 1 where medicamento_id = 489; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (121, 411, 411, 1, 0.00, 72.17); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 411; 
update estoque_total set total = total - 1 where medicamento_id = 411; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (489, 'lote 582818', '2023-10-23', '2024-10-31', 18.7, 6, 6); 
update estoque_total set total = total + 6 where medicamento_id = 489; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (411, 'lote 528435', '2023-10-23', '2026-04-30', 34.1, 18, 18); 
update estoque_total set total = total + 18 where medicamento_id = 411; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (13, 22, '2023-10-24 11:32:43', 145.32); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (122, 1, 547, 2, 2.90, 145.32); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 547; 
update estoque_total set total = total - 2 where medicamento_id = 1; 

insert into venda (profissional_id, time_stamp, total) values (23, '2023-10-24 13:53:34', 235.27); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (123, 183, 183, 7, 0.00, 235.27); 
update estoque set quant_venda = quant_venda + 7, quant_atual = quant_atual - 7 where id = 183; 
update estoque_total set total = total - 7 where medicamento_id = 183; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (6, 21, '2023-10-24 17:25:57', 821.31); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (124, 425, 425, 3, 14.10, 94.50); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 425; 
update estoque_total set total = total - 3 where medicamento_id = 425; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (124, 38, 38, 3, 124.60, 531.41); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 38; 
update estoque_total set total = total - 3 where medicamento_id = 38; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (124, 389, 389, 9, 96.20, 195.40); 
update estoque set quant_venda = quant_venda + 9, quant_atual = quant_atual - 9 where id = 389; 
update estoque_total set total = total - 9 where medicamento_id = 389; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (7, 23, '2023-10-24 20:13:43', 146.49); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (125, 341, 341, 1, 1.10, 13.42); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 341; 
update estoque_total set total = total - 1 where medicamento_id = 341; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (125, 323, 323, 5, 17.60, 70.75); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 323; 
update estoque_total set total = total - 5 where medicamento_id = 323; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (125, 494, 494, 6, 36.50, 62.32); 
update estoque set quant_venda = quant_venda + 6, quant_atual = quant_atual - 6 where id = 494; 
update estoque_total set total = total - 6 where medicamento_id = 494; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (494, 'lote 130105', '2023-10-24', '2024-10-31', 8.4, 43, 43); 
update estoque_total set total = total + 43 where medicamento_id = 494; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (2, 23, '2023-10-26 03:24:32', 468.86); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (126, 64, 64, 3, 0.00, 382.86); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 64; 
update estoque_total set total = total - 3 where medicamento_id = 64; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (126, 387, 532, 2, 44.20, 86.00); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 532; 
update estoque_total set total = total - 2 where medicamento_id = 387; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (5, 22, '2023-10-26 05:57:32', 281.73); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (127, 402, 402, 8, 12.10, 122.86); 
update estoque set quant_venda = quant_venda + 8, quant_atual = quant_atual - 8 where id = 402; 
update estoque_total set total = total - 8 where medicamento_id = 402; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (127, 80, 80, 1, 78.20, 158.87); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 80; 
update estoque_total set total = total - 1 where medicamento_id = 80; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (10, 24, '2023-10-26 09:37:51', 137.27); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (128, 344, 344, 1, 13.00, 22.25); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 344; 
update estoque_total set total = total - 1 where medicamento_id = 344; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (128, 450, 450, 6, 17.10, 115.02); 
update estoque set quant_venda = quant_venda + 6, quant_atual = quant_atual - 6 where id = 450; 
update estoque_total set total = total - 6 where medicamento_id = 450; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (3, 24, '2023-10-26 12:13:47', 122.75); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (129, 355, 355, 5, 7.80, 122.75); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 355; 
update estoque_total set total = total - 5 where medicamento_id = 355; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (13, 21, '2023-10-27 20:59:39', 245.61); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (130, 110, 110, 2, 1.90, 63.36); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 110; 
update estoque_total set total = total - 2 where medicamento_id = 110; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (130, 378, 378, 5, 5.60, 182.25); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 378; 
update estoque_total set total = total - 5 where medicamento_id = 378; 

insert into venda (profissional_id, time_stamp, total) values (22, '2023-10-27 22:15:14', 696.38); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (131, 134, 134, 2, 21.60, 248.40); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 134; 
update estoque_total set total = total - 2 where medicamento_id = 134; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (131, 142, 142, 1, 0.90, 90.78); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 142; 
update estoque_total set total = total - 1 where medicamento_id = 142; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (131, 289, 289, 5, 0.00, 357.20); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 289; 
update estoque_total set total = total - 5 where medicamento_id = 289; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (142, 'lote 170041', '2023-10-27', '2025-10-31', 44.9, 10, 10); 
update estoque_total set total = total + 10 where medicamento_id = 142; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (5, 23, '2023-10-28 01:36:28', 452.86); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (132, 361, 361, 3, 165.10, 404.24); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 361; 
update estoque_total set total = total - 3 where medicamento_id = 361; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (132, 18, 18, 1, 22.80, 48.62); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 18; 
update estoque_total set total = total - 1 where medicamento_id = 18; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (18, 'lote 734602', '2023-10-28', '2026-04-30', 24.9, 18, 18); 
update estoque_total set total = total + 18 where medicamento_id = 18; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (5, 25, '2023-10-28 02:14:59', 130.81); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (133, 494, 558, 1, 4.10, 12.37); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 558; 
update estoque_total set total = total - 1 where medicamento_id = 494; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (133, 135, 135, 2, 35.00, 90.34); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 135; 
update estoque_total set total = total - 2 where medicamento_id = 135; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (133, 424, 424, 3, 4.90, 28.10); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 424; 
update estoque_total set total = total - 3 where medicamento_id = 424; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (135, 'lote 876844', '2023-10-28', '2024-10-31', 22.5, 10, 10); 
update estoque_total set total = total + 10 where medicamento_id = 135; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (17, 23, '2023-10-29 04:36:00', 242.28); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (134, 488, 488, 6, 53.10, 242.28); 
update estoque set quant_venda = quant_venda + 6, quant_atual = quant_atual - 6 where id = 488; 
update estoque_total set total = total - 6 where medicamento_id = 488; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (488, 'lote 243276', '2023-10-29', '2025-04-30', 22.0, 14, 14); 
update estoque_total set total = total + 14 where medicamento_id = 488; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (16, 23, '2023-10-29 06:31:39', 223.12); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (135, 502, 502, 4, 4.30, 82.94); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 502; 
update estoque_total set total = total - 4 where medicamento_id = 502; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (135, 503, 503, 4, 5.70, 8.98); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 503; 
update estoque_total set total = total - 4 where medicamento_id = 503; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (135, 376, 376, 10, 17.80, 131.20); 
update estoque set quant_venda = quant_venda + 10, quant_atual = quant_atual - 10 where id = 376; 
update estoque_total set total = total - 10 where medicamento_id = 376; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (3, 21, '2023-10-29 07:41:59', 1359.49); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (136, 25, 25, 2, 197.80, 420.48); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 25; 
update estoque_total set total = total - 2 where medicamento_id = 25; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (136, 16, 16, 2, 103.90, 267.48); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 16; 
update estoque_total set total = total - 2 where medicamento_id = 16; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (136, 272, 272, 3, 157.40, 671.53); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 272; 
update estoque_total set total = total - 3 where medicamento_id = 272; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (13, 24, '2023-10-30 14:01:26', 484.90); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (137, 86, 86, 4, 92.30, 484.90); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 86; 
update estoque_total set total = total - 4 where medicamento_id = 86; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (19, 21, '2023-10-30 15:21:54', 801.73); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (138, 502, 502, 3, 10.40, 55.03); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 502; 
update estoque_total set total = total - 3 where medicamento_id = 502; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (138, 105, 105, 3, 34.10, 648.64); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 105; 
update estoque_total set total = total - 3 where medicamento_id = 105; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (138, 231, 518, 2, 23.00, 98.06); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 518; 
update estoque_total set total = total - 2 where medicamento_id = 231; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (9, 24, '2023-10-31 20:58:23', 222.18); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (139, 166, 166, 1, 24.60, 222.18); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 166; 
update estoque_total set total = total - 1 where medicamento_id = 166; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (18, 25, '2023-11-01 00:47:51', 432.98); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (140, 17, 17, 2, 33.30, 133.48); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 17; 
update estoque_total set total = total - 2 where medicamento_id = 17; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (140, 332, 332, 5, 15.70, 299.50); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 332; 
update estoque_total set total = total - 5 where medicamento_id = 332; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (17, 'lote 329614', '2023-11-01', '2025-05-31', 33.0, 6, 6); 
update estoque_total set total = total + 6 where medicamento_id = 17; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (17, 25, '2023-11-01 03:45:42', 265.64); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (141, 58, 58, 2, 103.20, 265.64); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 58; 
update estoque_total set total = total - 2 where medicamento_id = 58; 

insert into venda (profissional_id, time_stamp, total) values (21, '2023-11-02 07:30:35', 229.90); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (142, 429, 429, 10, 17.20, 229.90); 
update estoque set quant_venda = quant_venda + 10, quant_atual = quant_atual - 10 where id = 429; 
update estoque_total set total = total - 10 where medicamento_id = 429; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (1, 25, '2023-11-02 09:07:13', 585.83); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (143, 245, 245, 1, 35.40, 112.35); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 245; 
update estoque_total set total = total - 1 where medicamento_id = 245; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (143, 11, 11, 3, 64.70, 316.18); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 11; 
update estoque_total set total = total - 3 where medicamento_id = 11; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (143, 201, 201, 5, 21.40, 157.30); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 201; 
update estoque_total set total = total - 5 where medicamento_id = 201; 

insert into venda (profissional_id, time_stamp, total) values (24, '2023-11-03 15:27:24', 563.43); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (144, 40, 549, 7, 12.40, 236.03); 
update estoque set quant_venda = quant_venda + 7, quant_atual = quant_atual - 7 where id = 549; 
update estoque_total set total = total - 7 where medicamento_id = 40; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (144, 125, 546, 5, 3.30, 327.40); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 546; 
update estoque_total set total = total - 5 where medicamento_id = 125; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (40, 'lote 459378', '2023-11-03', '2024-11-30', 12.9, 31, 31); 
update estoque_total set total = total + 31 where medicamento_id = 40; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (125, 'lote 126520', '2023-11-03', '2025-05-31', 23.3, 10, 10); 
update estoque_total set total = total + 10 where medicamento_id = 125; 

insert into venda (profissional_id, time_stamp, total) values (24, '2023-11-03 16:46:46', 832.35); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (145, 60, 60, 5, 8.40, 832.35); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 60; 
update estoque_total set total = total - 5 where medicamento_id = 60; 

insert into venda (profissional_id, time_stamp, total) values (21, '2023-11-03 19:43:35', 584.40); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (146, 243, 243, 2, 5.30, 71.66); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 243; 
update estoque_total set total = total - 2 where medicamento_id = 243; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (146, 91, 91, 1, 17.70, 236.43); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 91; 
update estoque_total set total = total - 1 where medicamento_id = 91; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (146, 272, 272, 1, 0.00, 276.31); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 272; 
update estoque_total set total = total - 1 where medicamento_id = 272; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (243, 'lote 470626', '2023-11-03', '2024-11-30', 21.2, 39, 39); 
update estoque_total set total = total + 39 where medicamento_id = 243; 

insert into venda (profissional_id, time_stamp, total) values (24, '2023-11-03 21:38:27', 166.40); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (147, 52, 52, 2, 5.10, 166.40); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 52; 
update estoque_total set total = total - 2 where medicamento_id = 52; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (52, 'lote 176119', '2023-11-03', '2025-11-30', 45.6, 10, 10); 
update estoque_total set total = total + 10 where medicamento_id = 52; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (5, 22, '2023-11-05 01:51:27', 957.37); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (148, 300, 300, 3, 60.00, 690.00); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 300; 
update estoque_total set total = total - 3 where medicamento_id = 300; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (148, 2, 2, 1, 36.40, 267.37); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 2; 
update estoque_total set total = total - 1 where medicamento_id = 2; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2, 'lote 349946', '2023-11-05', '2026-11-30', 146.9, 9, 9); 
update estoque_total set total = total + 9 where medicamento_id = 2; 

insert into venda (profissional_id, time_stamp, total) values (22, '2023-11-05 02:43:54', 517.17); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (149, 187, 187, 7, 15.50, 243.57); 
update estoque set quant_venda = quant_venda + 7, quant_atual = quant_atual - 7 where id = 187; 
update estoque_total set total = total - 7 where medicamento_id = 187; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (149, 441, 441, 10, 11.40, 273.60); 
update estoque set quant_venda = quant_venda + 10, quant_atual = quant_atual - 10 where id = 441; 
update estoque_total set total = total - 10 where medicamento_id = 441; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (187, 'lote 689426', '2023-11-05', '2024-11-30', 17.9, 11, 11); 
update estoque_total set total = total + 11 where medicamento_id = 187; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (3, 21, '2023-11-05 02:53:07', 191.15); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (150, 440, 440, 5, 5.90, 191.15); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 440; 
update estoque_total set total = total - 5 where medicamento_id = 440; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (6, 22, '2023-11-06 12:26:08', 820.04); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (151, 87, 87, 3, 351.40, 820.04); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 87; 
update estoque_total set total = total - 3 where medicamento_id = 87; 

insert into venda (profissional_id, time_stamp, total) values (21, '2023-11-06 16:06:35', 243.66); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (152, 3, 3, 3, 24.00, 243.66); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 3; 
update estoque_total set total = total - 3 where medicamento_id = 3; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (3, 'lote 314065', '2023-11-06', '2025-11-30', 30.9, 14, 14); 
update estoque_total set total = total + 14 where medicamento_id = 3; 

insert into venda (profissional_id, time_stamp, total) values (21, '2023-11-06 16:15:43', 144.30); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (153, 86, 86, 1, 0.00, 144.30); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 86; 
update estoque_total set total = total - 1 where medicamento_id = 86; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (86, 'lote 388864', '2023-11-06', '2025-11-30', 55.7, 10, 10); 
update estoque_total set total = total + 10 where medicamento_id = 86; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (8, 23, '2023-11-06 16:55:22', 286.36); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (154, 44, 44, 3, 105.80, 286.36); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 44; 
update estoque_total set total = total - 3 where medicamento_id = 44; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (18, 25, '2023-11-07 17:27:05', 462.68); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (155, 480, 480, 3, 12.30, 82.32); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 480; 
update estoque_total set total = total - 3 where medicamento_id = 480; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (155, 492, 492, 2, 28.30, 60.36); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 492; 
update estoque_total set total = total - 2 where medicamento_id = 492; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (155, 134, 134, 3, 85.00, 320.00); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 134; 
update estoque_total set total = total - 3 where medicamento_id = 134; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (480, 'lote 854411', '2023-11-07', '2026-11-30', 11.4, 23, 23); 
update estoque_total set total = total + 23 where medicamento_id = 480; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (492, 'lote 871955', '2023-11-07', '2026-05-31', 18.4, 6, 6); 
update estoque_total set total = total + 6 where medicamento_id = 492; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (134, 'lote 220304', '2023-11-07', '2025-11-30', 73.4, 10, 10); 
update estoque_total set total = total + 10 where medicamento_id = 134; 

insert into venda (profissional_id, time_stamp, total) values (21, '2023-11-10 08:12:51', 1377.67); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (156, 361, 361, 3, 0.00, 569.34); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 361; 
update estoque_total set total = total - 3 where medicamento_id = 361; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (156, 91, 91, 3, 0.00, 762.39); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 91; 
update estoque_total set total = total - 3 where medicamento_id = 91; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (156, 204, 204, 4, 3.90, 45.94); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 204; 
update estoque_total set total = total - 4 where medicamento_id = 204; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (91, 'lote 769270', '2023-11-10', '2024-05-31', 90.3, 10, 10); 
update estoque_total set total = total + 10 where medicamento_id = 91; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (5, 21, '2023-11-13 04:47:59', 263.33); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (157, 326, 326, 2, 32.90, 58.54); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 326; 
update estoque_total set total = total - 2 where medicamento_id = 326; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (157, 271, 271, 1, 20.70, 69.39); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 271; 
update estoque_total set total = total - 1 where medicamento_id = 271; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (157, 385, 385, 10, 79.50, 135.40); 
update estoque set quant_venda = quant_venda + 10, quant_atual = quant_atual - 10 where id = 385; 
update estoque_total set total = total - 10 where medicamento_id = 385; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (326, 'lote 486713', '2023-11-13', '2025-11-30', 17.1, 18, 18); 
update estoque_total set total = total + 18 where medicamento_id = 326; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (271, 'lote 709039', '2023-11-13', '2025-05-31', 46.4, 6, 6); 
update estoque_total set total = total + 6 where medicamento_id = 271; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (9, 23, '2023-11-16 00:03:07', 115.08); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (158, 256, 256, 2, 44.70, 115.08); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 256; 
update estoque_total set total = total - 2 where medicamento_id = 256; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (256, 'lote 988618', '2023-11-16', '2026-05-31', 35.2, 2, 2); 
update estoque_total set total = total + 2 where medicamento_id = 256; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (17, 23, '2023-11-16 01:23:09', 344.21); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (159, 484, 484, 7, 31.20, 84.44); 
update estoque set quant_venda = quant_venda + 7, quant_atual = quant_atual - 7 where id = 484; 
update estoque_total set total = total - 7 where medicamento_id = 484; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (159, 173, 173, 1, 87.20, 203.60); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 173; 
update estoque_total set total = total - 1 where medicamento_id = 173; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (159, 420, 420, 1, 10.60, 56.17); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 420; 
update estoque_total set total = total - 1 where medicamento_id = 420; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (484, 'lote 427716', '2023-11-16', '2025-11-30', 5.9, 35, 35); 
update estoque_total set total = total + 35 where medicamento_id = 484; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (420, 'lote 428469', '2023-11-16', '2025-11-30', 26.1, 6, 6); 
update estoque_total set total = total + 6 where medicamento_id = 420; 

insert into venda (profissional_id, time_stamp, total) values (21, '2023-11-16 03:04:30', 1325.01); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (160, 101, 101, 3, 29.80, 963.95); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 101; 
update estoque_total set total = total - 3 where medicamento_id = 101; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (160, 498, 498, 8, 19.80, 263.64); 
update estoque set quant_venda = quant_venda + 8, quant_atual = quant_atual - 8 where id = 498; 
update estoque_total set total = total - 8 where medicamento_id = 498; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (160, 437, 437, 4, 7.30, 97.42); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 437; 
update estoque_total set total = total - 4 where medicamento_id = 437; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (14, 21, '2023-11-18 16:36:32', 120.16); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (161, 209, 551, 3, 17.90, 120.16); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 551; 
update estoque_total set total = total - 3 where medicamento_id = 209; 

insert into venda (profissional_id, time_stamp, total) values (24, '2023-11-19 23:34:01', 33.64); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (162, 278, 517, 1, 1.40, 33.64); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 517; 
update estoque_total set total = total - 1 where medicamento_id = 278; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (278, 'lote 158217', '2023-11-19', '2024-12-31', 16.5, 31, 31); 
update estoque_total set total = total + 31 where medicamento_id = 278; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (13, 24, '2023-11-20 01:07:33', 451.82); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (163, 224, 224, 4, 95.70, 223.38); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 224; 
update estoque_total set total = total - 4 where medicamento_id = 224; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (163, 377, 553, 3, 12.00, 38.19); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 553; 
update estoque_total set total = total - 3 where medicamento_id = 377; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (163, 198, 198, 5, 14.30, 190.25); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 198; 
update estoque_total set total = total - 5 where medicamento_id = 198; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (198, 'lote 227644', '2023-11-20', '2025-11-30', 14.8, 18, 18); 
update estoque_total set total = total + 18 where medicamento_id = 198; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (12, 23, '2023-11-20 04:29:11', 140.56); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (164, 12, 12, 1, 21.00, 140.56); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 12; 
update estoque_total set total = total - 1 where medicamento_id = 12; 

insert into venda (profissional_id, time_stamp, total) values (24, '2023-11-21 09:21:08', 80.09); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (165, 17, 530, 1, 3.30, 80.09); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 530; 
update estoque_total set total = total - 1 where medicamento_id = 17; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (2, 25, '2023-11-21 12:40:32', 468.10); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (166, 98, 98, 2, 0.00, 468.10); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 98; 
update estoque_total set total = total - 2 where medicamento_id = 98; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (2, 23, '2023-11-22 16:04:01', 1142.27); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (167, 196, 196, 3, 96.50, 471.28); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 196; 
update estoque_total set total = total - 3 where medicamento_id = 196; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (167, 91, 575, 3, 91.40, 670.99); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 575; 
update estoque_total set total = total - 3 where medicamento_id = 91; 

insert into venda (profissional_id, time_stamp, total) values (23, '2023-11-23 20:57:28', 550.78); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (168, 161, 161, 5, 17.00, 267.70); 
update estoque set quant_venda = quant_venda + 5, quant_atual = quant_atual - 5 where id = 161; 
update estoque_total set total = total - 5 where medicamento_id = 161; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (168, 343, 343, 7, 11.00, 209.08); 
update estoque set quant_venda = quant_venda + 7, quant_atual = quant_atual - 7 where id = 343; 
update estoque_total set total = total - 7 where medicamento_id = 343; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (168, 424, 424, 7, 3.00, 74.00); 
update estoque set quant_venda = quant_venda + 7, quant_atual = quant_atual - 7 where id = 424; 
update estoque_total set total = total - 7 where medicamento_id = 424; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (8, 21, '2023-11-25 07:52:03', 207.75); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (169, 433, 433, 9, 36.60, 207.75); 
update estoque set quant_venda = quant_venda + 9, quant_atual = quant_atual - 9 where id = 433; 
update estoque_total set total = total - 9 where medicamento_id = 433; 

insert into venda (profissional_id, time_stamp, total) values (22, '2023-11-25 08:54:01', 693.25); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (170, 338, 338, 1, 6.70, 89.99); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 338; 
update estoque_total set total = total - 1 where medicamento_id = 338; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (170, 238, 238, 10, 2.80, 139.30); 
update estoque set quant_venda = quant_venda + 10, quant_atual = quant_atual - 10 where id = 238; 
update estoque_total set total = total - 10 where medicamento_id = 238; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (170, 166, 166, 2, 29.60, 463.96); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 166; 
update estoque_total set total = total - 2 where medicamento_id = 166; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (1, 21, '2023-11-26 15:19:13', 203.92); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (171, 407, 533, 4, 75.40, 203.92); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 533; 
update estoque_total set total = total - 4 where medicamento_id = 407; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (407, 'lote 446846', '2023-11-26', '2025-12-31', 36.3, 2, 2); 
update estoque_total set total = total + 2 where medicamento_id = 407; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (6, 23, '2023-11-26 17:24:50', 652.59); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (172, 241, 241, 9, 109.80, 244.53); 
update estoque set quant_venda = quant_venda + 9, quant_atual = quant_atual - 9 where id = 241; 
update estoque_total set total = total - 9 where medicamento_id = 241; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (172, 341, 341, 1, 5.00, 9.52); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 341; 
update estoque_total set total = total - 1 where medicamento_id = 341; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (172, 77, 77, 2, 75.80, 398.54); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 77; 
update estoque_total set total = total - 2 where medicamento_id = 77; 

insert into venda (profissional_id, time_stamp, total) values (23, '2023-11-26 21:13:06', 511.83); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (173, 85, 85, 2, 0.00, 96.66); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 85; 
update estoque_total set total = total - 2 where medicamento_id = 85; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (173, 377, 553, 8, 8.00, 125.84); 
update estoque set quant_venda = quant_venda + 8, quant_atual = quant_atual - 8 where id = 553; 
update estoque_total set total = total - 8 where medicamento_id = 377; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (173, 24, 24, 1, 0.00, 289.33); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 24; 
update estoque_total set total = total - 1 where medicamento_id = 24; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (7, 23, '2023-11-28 06:53:10', 412.68); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (174, 221, 221, 2, 21.10, 171.34); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 221; 
update estoque_total set total = total - 2 where medicamento_id = 221; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (174, 420, 580, 1, 9.30, 57.47); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 580; 
update estoque_total set total = total - 1 where medicamento_id = 420; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (174, 78, 78, 1, 3.70, 183.87); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 78; 
update estoque_total set total = total - 1 where medicamento_id = 78; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (221, 'lote 159092', '2023-11-28', '2024-11-30', 42.6, 6, 6); 
update estoque_total set total = total + 6 where medicamento_id = 221; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (420, 'lote 607277', '2023-11-28', '2025-12-31', 26.1, 6, 6); 
update estoque_total set total = total + 6 where medicamento_id = 420; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (8, 21, '2023-11-29 09:54:57', 567.04); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (175, 22, 22, 3, 332.90, 567.04); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 22; 
update estoque_total set total = total - 3 where medicamento_id = 22; 

insert into venda (profissional_id, time_stamp, total) values (24, '2023-11-29 13:16:00', 323.85); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (176, 256, 578, 1, 0.70, 79.19); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 578; 
update estoque_total set total = total - 1 where medicamento_id = 256; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (176, 332, 332, 4, 7.50, 244.66); 
update estoque set quant_venda = quant_venda + 4, quant_atual = quant_atual - 4 where id = 332; 
update estoque_total set total = total - 4 where medicamento_id = 332; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (256, 'lote 494285', '2023-11-29', '2026-06-30', 35.2, 2, 2); 
update estoque_total set total = total + 2 where medicamento_id = 256; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (4, 25, '2023-11-30 22:06:09', 272.67); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (177, 149, 149, 7, 56.00, 137.13); 
update estoque set quant_venda = quant_venda + 7, quant_atual = quant_atual - 7 where id = 149; 
update estoque_total set total = total - 7 where medicamento_id = 149; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (177, 472, 472, 7, 69.70, 135.54); 
update estoque set quant_venda = quant_venda + 7, quant_atual = quant_atual - 7 where id = 472; 
update estoque_total set total = total - 7 where medicamento_id = 472; 

insert into venda (cliente_id, profissional_id, time_stamp, total) values (5, 23, '2023-11-30 22:11:37', 60.06); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (178, 353, 353, 2, 23.30, 60.06); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 353; 
update estoque_total set total = total - 2 where medicamento_id = 353; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (353, 'lote 761193', '2023-11-30', '2026-11-30', 22.7, 18, 18); 
update estoque_total set total = total + 18 where medicamento_id = 353; 

insert into venda (profissional_id, time_stamp, total) values (24, '2023-12-01 00:38:01', 61.86); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (179, 339, 339, 2, 2.50, 61.86); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 339; 
update estoque_total set total = total - 2 where medicamento_id = 339; 

