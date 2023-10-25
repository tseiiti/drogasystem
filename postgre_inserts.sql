-- Active: 1692452936450@@127.0.0.1@5432@drogasystem@public

-- Laboratório: 
insert into laboratorio values
  (9, 'EMS SIGMA PHARMA', 'EMS SIGMA PHARMA LTDA', '00.923.140/0001-31')
, (21, 'PHARLAB', 'PHARLAB INDÚSTRIA FARMACÊUTICA S.A.', '02.501.297/0001-02')
, (24, 'CIMED INDUSTRIA', 'CIMED INDUSTRIA S.A', '02.814.497/0001-07')
, (27, 'GEOLAB', 'GEOLAB INDÚSTRIA FARMACÊUTICA S/A', '03.485.572/0001-04')
, (33, 'AUROBINDO PHARMA', 'AUROBINDO PHARMA INDÚSTRIA FARMACÊUTICA LIMITADA', '04.301.884/0001-75')
, (42, 'SUN', 'SUN FARMACÊUTICA DO BRASIL LTDA', '05.035.244/0001-23')
, (43, 'LEGRAND PHARMA', 'LEGRAND PHARMA INDÚSTRIA FARMACÊUTICA LTDA', '05.044.984/0001-26')
, (46, 'BRAINFARMA', 'BRAINFARMA INDÚSTRIA QUÍMICA E FARMACÊUTICA S.A', '05.161.069/0001-10')
, (47, 'ZYDUS NIKKHO', 'ZYDUS NIKKHO FARMACÊUTICA LTDA', '05.254.971/0001-81')
, (49, 'UNICHEM', 'UNICHEM FARMACÊUTICA DO BRASIL LTDA', '05.399.786/0001-85')
, (54, 'FARMACE', 'FARMACE INDÚSTRIA QUÍMICO-FARMACÊUTICA CEARENSE LTDA', '06.628.333/0001-46')
, (76, 'SANOFI MEDLEY', 'SANOFI MEDLEY FARMACÊUTICA LTDA.', '10.588.595/0010-92')
, (100, 'LABORATÓRIO GLOBO', 'LABORATÓRIO GLOBO SA', '17.115.437/0001-73')
, (101, 'LABORATÓRIO TEUTO', 'LABORATÓRIO TEUTO BRASILEIRO S/A', '17.159.229/0001-76')
, (102, 'HYPOFARMA', 'HYPOFARMA - INSTITUTO DE HYPODERMIA E FARMÁCIA LTDA', '17.174.657/0001-78')
, (105, 'CIFARMA CIENTÍFICA', 'CIFARMA CIENTÍFICA FARMACÊUTICA LTDA', '17.562.075/0001-69')
, (107, 'MEDQUIMICA', 'MEDQUIMICA INDUSTRIA FARMACEUTICA LTDA.', '17.875.154/0001-20')
, (114, 'HIPOLABOR', 'HIPOLABOR FARMACEUTICA LTDA', '19.570.720/0001-10')
, (147, 'MERCK', 'MERCK S/A', '33.069.212/0001-84')
, (148, 'TORRENT', 'TORRENT DO BRASIL LTDA', '33.078.528/0001-32')
, (152, 'BIOLAB FARMA GENERICOS', 'BIOLAB FARMA GENERICOS LTDA', '33.150.764/0001-12')
, (153, 'CELLERA', 'CELLERA FARMACÊUTICA S.A.', '33.173.097/0002-74')
, (155, 'INSTITUTO BIOCHIMICO', 'INSTITUTO BIOCHIMICO INDÚSTRIA FARMACÊUTICA LTDA', '33.258.401/0001-03')
, (174, 'FUNDAÇÃO PARA O REMÉDIO POPULAR - FURP', 'FUNDAÇÃO PARA O REMÉDIO POPULAR - FURP', '43.640.754/0001-19')
, (180, 'CRISTÁLIA', 'CRISTÁLIA PRODUTOS QUÍMICOS FARMACÊUTICOS LTDA.', '44.734.671/0001-51')
, (184, 'GERMED', 'GERMED FARMACEUTICA LTDA', '45.992.062/0001-65')
, (189, '1FARMA', '1FARMA INDUSTRIA FARMACEUTICA LTDA', '48.113.906/0001-49')
, (192, 'FRESENIUS KABI', 'FRESENIUS KABI BRASIL LTDA', '49.324.221/0001-04')
, (195, 'BIOLABNUS', 'BIOLAB SANUS FARMACÊUTICA LTDA', '49.475.833/0001-06')
, (198, 'BIOSINTÉTICA', 'BIOSINTÉTICA FARMACÊUTICA LTDA', '53.162.095/0001-06')
, (207, 'NOVARTIS BIOCIENCIAS', 'NOVARTIS BIOCIENCIAS S.A', '56.994.502/0001-30')
, (210, 'EMS', 'EMS S/A', '57.507.378/0003-65')
, (211, 'BLAU', 'BLAU FARMACÊUTICA S.A.', '58.430.828/0001-60')
, (219, 'ACHÉ FARMACÊUTICOS', 'ACHÉ LABORATÓRIOS FARMACÊUTICOS S.A', '60.659.463/0029-92')
, (220, 'UNIÃO QUÍMICA NACIONAL', 'UNIÃO QUÍMICA FARMACÊUTICA NACIONAL S/A', '60.665.981/0001-18')
, (227, 'COSMED INDUSTRIA DE COSMETICOS E MEDICAMENTOS', 'COSMED INDUSTRIA DE COSMETICOS E MEDICAMENTOS S.A.', '61.082.426/0002-07')
, (232, 'EUROFARMA LABORATÓRIOS', 'EUROFARMA LABORATÓRIOS S.A.', '61.190.096/0001-92')
, (235, 'SANDOZ', 'SANDOZ DO BRASIL INDÚSTRIA FARMACÊUTICA LTDA', '61.286.647/0001-16')
, (240, 'APSEN', 'APSEN FARMACEUTICA S/A', '62.462.015/0001-29')
, (247, 'NATIVITA IND. COM.', 'NATIVITA IND. COM. LTDA.', '65.271.900/0001-19')
, (252, 'NOVA QUIMICA', 'NOVA QUIMICA FARMACÊUTICA S/A', '72.593.791/0001-11')
, (253, 'RANBAXY', 'RANBAXY FARMACÊUTICA LTDA', '73.663.650/0001-90')
, (254, 'PRATI DONADUZZI & CIA', 'PRATI DONADUZZI & CIA LTDA', '73.856.593/0001-66')
, (266, 'MULTILAB FARMACEUTICOS', 'MULTILAB INDUSTRIA E COMERCIO DE PRODUTOS FARMACEUTICOS LTDA', '92.265.552/0009-05')
;

-- medicamento
insert into medicamento values
  (90, 184, 'CLORIDRATO DE RANITIDINA', '150 MG', 'Sólido', 'Outros', 'A2', '20', 39.68)
, (91, 184, 'CLORIDRATO DE RANITIDINA', '300 MG', 'Sólido', 'Outros', 'A2', '20', 82.76)
, (340, 101, 'ACEBROFILINA', '10 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + COP', 23.84)
, (341, 101, 'ACEBROFILINA', '5MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120ML + COP', 17.09)
, (342, 24, 'ACEBROFILINA', '5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + 50 CP MED(EMB HOSP)', 414.17)
, (351, 232, 'ACEBROFILINA', '5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + COP', 17.09)
, (352, 232, 'ACEBROFILINA', '10 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + COP', 24.09)
, (354, 184, 'ACEBROFILINA', '5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + COP', 17.30)
, (355, 184, 'ACEBROFILINA', '10 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + COP', 23.58)
, (356, 266, 'ACEBROFILINA', '5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + COP', 18.14)
, (357, 266, 'ACEBROFILINA', '10 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + COP', 26.84)
, (358, 24, 'ACEBROFILINA', '10 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + 50 CP MED(EMB HOSP)', 423.33)
, (431, 235, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '50', 92.81)
, (432, 155, 'ACICLOVIR', '50 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10 G', 26.17)
, (433, 147, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '25', 87.41)
, (434, 147, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 171.62)
, (435, 147, 'ACICLOVIR', '50 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10 G', 16.95)
, (440, 266, 'ACICLOVIR', '50 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10 G', 17.34)
, (441, 266, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '25', 114.21)
, (442, 266, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 159.87)
, (444, 266, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 114.42)
, (445, 266, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 171.62)
, (446, 266, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '50', 286.04)
, (447, 253, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 83.89)
, (448, 254, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '10', 37.17)
, (449, 254, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 111.53)
, (450, 254, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '10', 37.17)
, (451, 254, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 111.53)
, (453, 21, 'ACICLOVIR', '50 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10 G', 22.88)
, (454, 21, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '25', 68.28)
, (487, 184, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '1', 6.82)
, (488, 266, 'ALBENDAZOL', '40 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '10 ML + COP', 7.84)
, (492, 27, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '1', 6.86)
, (493, 27, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '5', 33.51)
, (494, 27, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '3', 20.58)
, (495, 27, 'ALBENDAZOL', '40 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '10 ML', 6.51)
, (531, 235, 'ALOPURINOL', '300 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 30.69)
, (532, 235, 'ALOPURINOL', '100 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 8.26)
, (533, 235, 'ALOPURINOL', '100 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 11.58)
, (534, 232, 'ALPRAZOLAM', '1,0 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 32.26)
, (535, 232, 'ALPRAZOLAM', '1 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 32.26)
, (536, 232, 'ALPRAZOLAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 41.85)
, (537, 198, 'ALPRAZOLAM', '1,0 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 46.27)
, (538, 266, 'ALPRAZOLAM', '0,25 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 8.41)
, (539, 266, 'ALPRAZOLAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 24.68)
, (540, 266, 'ALPRAZOLAM', '1 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 43.85)
, (541, 266, 'ALPRAZOLAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 69.32)
, (542, 43, 'ALPRAZOLAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 17.76)
, (543, 43, 'ALPRAZOLAM', '1 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 31.94)
, (544, 43, 'ALPRAZOLAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 72.93)
, (561, 76, 'SOCIAN', '50 MG', 'Sólido', 'Novo', 'Não controlado', '20', 80.87)
, (562, 76, 'SOCIAN', '200 MG', 'Sólido', 'Novo', 'Não controlado', '20', 152.34)
, (563, 232, 'AMOXICILINA', '50 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '150 ML + COP', 19.48)
, (566, 101, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '21', 19.15)
, (567, 266, 'AMOXICILINA', '875 MG', 'Sólido', 'Genérico', 'Não controlado', '14', 50.91)
, (569, 232, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '15', 17.12)
, (570, 232, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 29.45)
, (571, 232, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '21', 23.41)
, (572, 232, 'AMOXICILINA', '875 MG', 'Sólido', 'Genérico', 'Não controlado', '14', 45.44)
, (576, 24, 'AMOXICILINA', '50 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '60 ML + 50 COP', 533.51)
, (579, 232, 'AMOXICILINA', '100 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '150 ML + COP', 30.65)
, (580, 232, 'AMOXICILINA', '80 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '100 ML + SER DOS', 29.38)
, (581, 101, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 27.22)
, (597, 76, 'GLUCANTIME', '300 MG/ML', 'Líquido', 'Novo', 'Não controlado', '5 ML', 375.28)
, (1016, 76, 'OSCAL D', '500 MG + 400 UI ', 'Sólido', 'Específico', 'Não controlado', '8', 8.57)
, (1017, 76, 'OSCAL D', '500 MG + 400 UI ', 'Sólido', 'Específico', 'Não controlado', '60', 66.49)
, (1234, 76, 'URBANIL', '10 MG', 'Sólido', 'Novo', 'Não controlado', '20', 11.09)
, (1236, 253, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '500', 207.04)
, (1237, 21, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 12.49)
, (1238, 21, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 24.97)
, (1239, 42, 'CLONAZEPAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 7.12)
, (1240, 42, 'CLONAZEPAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '500 ( EMB HOSP )', 119.44)
, (1241, 42, 'CLONAZEPAM', '2,0 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 12.50)
, (1242, 42, 'CLONAZEPAM', '2,0 MG', 'Sólido', 'Genérico', 'Não controlado', '500 ( EMB HOSP )', 208.63)
, (1245, 76, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 9.83)
, (1510, 76, 'NEOZINE', '40 MG/ML', 'Líquido', 'Novo', 'Não controlado', '20 ML', 11.55)
, (1531, 232, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 71.86)
, (1532, 232, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 142.34)
, (1537, 76, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 48.09)
, (1538, 76, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 94.22)
, (1578, 76, 'PLASIL', '10 MG', 'Sólido', 'Novo', 'A3', '20', 8.04)
, (1673, 210, 'CLORIDRATO DE RANITIDINA', '150 MG', 'Sólido', 'Genérico', 'A2', '20', 26.60)
, (1678, 76, 'CLORIDRATO DE RANITIDINA', '300 MG', 'Sólido', 'Genérico', 'A2', '20', 48.58)
, (1839, 210, 'ACEBROFILINA', '5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + COP', 17.06)
, (1840, 210, 'ACEBROFILINA', '10 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + COP', 24.09)
, (1841, 210, 'ACEBROFILINA', '5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + COP', 17.06)
, (1842, 210, 'ACEBROFILINA', '10 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + COP', 24.09)
, (1848, 100, 'ACEBROFILINA', '5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + CP MED', 13.89)
, (1849, 100, 'ACEBROFILINA', '10 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + CP MED', 16.53)
, (1859, 219, 'ACEBROFILINA', '5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + CP MED', 17.29)
, (1860, 219, 'ACEBROFILINA', '10 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + CP MED', 24.48)
, (1861, 219, 'ACEBROFILINA', '5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + CP MED', 17.29)
, (1862, 219, 'ACEBROFILINA', '10 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + CP MED', 24.48)
, (1863, 107, 'ACEBROFILINA', '5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + CP MED', 17.14)
, (1864, 107, 'ACEBROFILINA', '10 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + CP MED', 25.39)
, (1865, 198, 'ACEBROFILINA', '10 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + CP MED', 24.48)
, (1866, 254, 'ACEBROFILINA', '5 MG', 'Líquido', 'Genérico', 'Não controlado', '120 ML + 50 COP', 520.47)
, (1867, 24, 'ACEBROFILINA', '10 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + CP MED', 22.62)
, (1868, 24, 'ACEBROFILINA', '5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + CP MED', 16.32)
, (1871, 27, 'ACEBROFILINA', '10MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120ML + COP', 26.80)
, (1872, 27, 'ACEBROFILINA', '5MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120ML + COP', 18.13)
, (1873, 46, 'ACEBROFILINA', '5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + COP', 17.03)
, (1874, 46, 'ACEBROFILINA', '10 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + COP', 23.12)
, (1879, 43, 'ACEBROFILINA', '5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + CP MED', 18.14)
, (1880, 43, 'ACEBROFILINA', '10 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + CP MED', 23.43)
, (1881, 43, 'ACEBROFILINA', '5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + CP MED', 18.14)
, (1882, 43, 'ACEBROFILINA', '10 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + CP MED', 23.43)
, (1883, 76, 'ACEBROFILINA', '5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '120 ML + DOSADOR', 17.05)
, (2017, 76, 'AIXA', '2 MG + 0,03 MG', 'Sólido', 'Similar', 'Não controlado', '21', 37.19)
, (2018, 76, 'AIXA', '2 MG + 0,03 MG', 'Sólido', 'Similar', 'Não controlado', '63', 101.56)
, (2254, 76, 'NASACORT', '550 MCG/ML', 'Líquido', 'Novo', 'Não controlado', '16,5 ML', 59.59)
, (2255, 76, 'ALLENASAL', '550 MCG/ML', 'Líquido', 'Similar', 'Não controlado', '16,5 ML', 41.94)
, (2256, 232, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '25', 62.54)
, (2257, 235, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '25', 89.97)
, (2258, 235, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 171.58)
, (2259, 235, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 141.10)
, (2260, 207, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '25', 45.43)
, (2261, 207, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 70.55)
, (2262, 147, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 104.90)
, (2263, 147, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 171.62)
, (2270, 210, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '25', 155.25)
, (2271, 210, 'ACICLOVIR', '50 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10 G', 20.33)
, (2272, 210, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 186.31)
, (2273, 210, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 114.42)
, (2274, 210, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 171.62)
, (2275, 210, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '50', 286.04)
, (2276, 180, 'ACICLOVIR', '50 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10 G', 17.92)
, (2279, 101, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '25', 155.24)
, (2280, 101, 'ACICLOVIR', '50MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10 G', 18.43)
, (2282, 189, 'ACICLOVIR', '50 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10 G', 10.97)
, (2283, 189, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 58.71)
, (2287, 220, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 186.29)
, (2290, 219, 'ACICLOVIR', '50 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10 G', 26.16)
, (2291, 219, 'ACICLOVIR', '200MG', 'Sólido', 'Genérico', 'Não controlado', '25', 155.25)
, (2292, 184, 'ACICLOVIR', '50 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10 G', 17.95)
, (2293, 184, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '25', 155.25)
, (2294, 184, 'ACICLOVIR', '50 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10 G', 17.95)
, (2295, 184, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 186.70)
, (2296, 184, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 114.42)
, (2297, 184, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 171.62)
, (2298, 184, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '50', 286.04)
, (2304, 105, 'ACICLOVIR', '50 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10 G', 18.85)
, (2305, 105, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '25', 57.02)
, (2306, 211, 'ACICLOVIR', '50 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10G', 25.72)
, (2307, 266, 'ACICLOVIR', '50 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10 G', 17.34)
, (2308, 253, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '10', 30.48)
, (2309, 253, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '25', 63.58)
, (2310, 253, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '10', 61.03)
, (2311, 253, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '25', 127.17)
, (2312, 253, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '500', 398.76)
, (2313, 253, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 167.90)
, (2314, 253, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '500', 798.62)
, (2315, 253, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '50', 83.89)
, (2316, 254, 'ACICLOVIR', '50MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10 G', 17.87)
, (2317, 254, 'ACICLOVIR', '50MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10 G', 473.70)
, (2318, 254, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 90.09)
, (2319, 254, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '450', 804.28)
, (2320, 254, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '280 (EMB FRAC)', 523.88)
, (2328, 21, 'ACICLOVIR', '30 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '4,5', 50.41)
, (2329, 21, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 81.94)
, (2330, 21, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 163.87)
, (2333, 24, 'ACICLOVIR', '50 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10 G', 17.98)
, (2334, 24, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 68.75)
, (2335, 24, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '500', 417.76)
, (2336, 27, 'ACICLOVIR', '50 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10 G', 18.82)
, (2337, 27, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 186.31)
, (2338, 27, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '200', 242.01)
, (2339, 27, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '500', 105.01)
, (2342, 46, 'ACICLOVIR', '50 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10 G', 26.16)
, (2343, 46, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '25', 155.24)
, (2347, 43, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '25', 155.25)
, (2348, 43, 'ACICLOVIR', '50 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10 G', 18.60)
, (2349, 43, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 186.31)
, (2350, 43, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 114.42)
, (2351, 43, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 171.62)
, (2352, 43, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '50', 286.04)
, (2353, 76, 'ACICLOVIR', '50 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '10 G', 16.74)
, (2354, 76, 'ACICLOVIR', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '25', 62.92)
, (2355, 76, 'ACICLOVIR', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 137.29)
, (2357, 101, 'ACICLOVIR', '250 MG', 'Líquido', 'Genérico', 'Não controlado', 'None', 858.15)
, (2364, 227, 'AAS', '100 MG', 'Sólido', 'Similar', 'Não controlado', '30', 14.57)
, (2365, 227, 'AAS', '100 MG', 'Sólido', 'Similar', 'Não controlado', '120', 51.77)
, (2366, 227, 'AAS', '100 MG', 'Sólido', 'Similar', 'Não controlado', '200', 104.55)
, (2367, 76, 'AAS', '100 MG', 'Sólido', 'Similar', 'Não controlado', '30', 14.57)
, (2368, 76, 'AAS', '100 MG', 'Sólido', 'Similar', 'Não controlado', '120', 51.77)
, (2369, 76, 'AAS', '100 MG', 'Sólido', 'Similar', 'Não controlado', '200', 104.55)
, (2422, 210, 'ADAPALENO', '1 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '30 G', 49.47)
, (2425, 184, 'ADAPALENO', '1 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '30 G', 47.78)
, (2431, 76, 'ADAPEL', '1 MG/G', 'Semissólido', 'Similar', 'Não controlado', '20 G', 28.03)
, (2432, 76, 'ADAPALENO', '1 MG/G', 'Semissólido', 'Genérico', 'Não controlado', '30 G', 35.60)
, (2496, 210, 'ALBENDAZOL', '40 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '10 ML', 7.52)
, (2497, 210, 'ALBENDAZOL', '40 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '10 ML+ COP', 7.52)
, (2498, 210, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '1', 7.02)
, (2499, 210, 'ALBENDAZOL', '200 MG', 'Sólido', 'Genérico', 'Não controlado', '2', 7.02)
, (2502, 101, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '1', 6.56)
, (2503, 101, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '3', 19.65)
, (2506, 189, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '1', 5.85)
, (2507, 189, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '3', 12.67)
, (2510, 219, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '1', 7.02)
, (2511, 219, 'ALBENDAZOL', '40 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '10 ML', 7.85)
, (2514, 254, 'ALBENDAZOL', '40 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '10 ML', 5.44)
, (2515, 254, 'ALBENDAZOL', '40 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '10 ML', 403.70)
, (2516, 254, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '1', 5.55)
, (2517, 254, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '100 (EMB FRAC)', 93.21)
, (2518, 254, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '3', 15.28)
, (2519, 254, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '5', 25.63)
, (2520, 254, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '300', 252.94)
, (2523, 24, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '1', 5.01)
, (2524, 24, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '3', 14.84)
, (2529, 27, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '1', 7.01)
, (2530, 27, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '5', 33.51)
, (2531, 27, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '300', 59.28)
, (2532, 27, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '3', 20.60)
, (2535, 43, 'ALBENDAZOL', '40 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '10 ML + COP', 6.93)
, (2537, 76, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '1', 5.40)
, (2538, 76, 'ALBENDAZOL', '400 MG', 'Sólido', 'Genérico', 'Não controlado', '3', 13.93)
, (2591, 76, 'LEMTRADA', '10 MG/ML', 'Líquido', 'Biológico', 'Não controlado', 'None', 866.44)
, (2596, 76, 'MYOZYME', '50 MG', 'Líquido', 'Biológico', 'Não controlado', 'None', 12.73)
, (2601, 76, 'NEXVIAZYME', '100 MG', 'Líquido', 'Biológico', 'Não controlado', 'None', 508.50)
, (2619, 76, 'ELOCTATE', '250 UI ', 'Líquido', 'Biológico', 'B2', '3 ML + ADAPT + CONJ INFUS + 2 LENÇOS + 2 CURATIVOS + GAZE', 879.51)
, (2620, 76, 'ELOCTATE', '500 UI ', 'Líquido', 'Biológico', 'B2', '3 ML + ADAPT + CONJ INFUS + 2 LENÇOS + 2 CURATIVOS + GAZE', 759.01)
, (2621, 76, 'ELOCTATE', '750 UI ', 'Líquido', 'Biológico', 'B2', '3 ML + ADAPT + CONJ INFUS + 2 LENÇOS + 2 CURATIVOS + GAZE', 638.53)
, (2622, 76, 'ELOCTATE', '1000 UI ', 'Líquido', 'Biológico', 'B2', '3 ML + ADAPT + CONJ INFUS + 2 LENÇOS + 2 CURATIVOS + GAZE', 518.03)
, (2623, 76, 'ELOCTATE', '1500 UI ', 'Líquido', 'Biológico', 'B2', '3 ML + ADAPT + CONJ INFUS + 2 LENÇOS + 2 CURATIVOS + GAZE', 277.03)
, (2624, 76, 'ELOCTATE', '2000 UI ', 'Líquido', 'Biológico', 'B2', '3 ML + ADAPT + CONJ INFUS + 2 LENÇOS + 2 CURATIVOS + GAZE', 36.06)
, (2626, 76, 'ELOCTATE', '3000 UI ', 'Líquido', 'Biológico', 'B2', '3 ML + ADAPT + CONJ INFUS + 2 LENÇOS + 2 CURATIVOS + GAZE', 554.08)
, (2627, 76, 'ELPROLIX', '250 UI ', 'Líquido', 'Biológico', 'B2', '5 ML + ADAPT + CONJ INFUS + 2 LENÇOS + 2 CURATIVOS + GAZE', 287.58)
, (2628, 76, 'ELPROLIX', '500 UI ', 'Líquido', 'Biológico', 'B2', '5 ML + ADAPT + CONJ INFUS + 2 LENÇOS + 2 CURATIVOS + GAZE', 575.19)
, (2629, 76, 'ELPROLIX', '1000 UI ', 'Líquido', 'Biológico', 'B2', '5 ML + ADAPT + CONJ INFUS + 2 LENÇOS + 2 CURATIVOS + GAZE', 150.34)
, (2630, 76, 'ELPROLIX', '2000 UI ', 'Líquido', 'Biológico', 'B2', '5 ML + ADAPT + CONJ INFUS + 2 LENÇOS + 2 CURATIVOS + GAZE', 300.73)
, (2631, 76, 'ELPROLIX', '3000 UI ', 'Líquido', 'Biológico', 'B2', '5 ML + ADAPT + CONJ INFUS + 2 LENÇOS + 2 CURATIVOS + GAZE', 451.09)
, (2731, 254, 'ALOPURINOL', '100 MG', 'Sólido', 'Genérico', 'Não controlado', '120 (EMB FRAC)', 32.64)
, (2733, 76, 'XENPOZYME', '20 MG', 'Líquido', 'Biológico', 'Não controlado', 'None', 65.01)
, (2761, 76, 'THYROGEN', '1,1 MG', 'Líquido', 'Biológico', 'Não controlado', 'None', 643.70)
, (2773, 76, 'PRALUENT', '75 MG/ML', 'Líquido', 'Biológico', 'C1', '1,0 ML + CAN APLIC', 74.44)
, (2774, 76, 'PRALUENT', '75 MG/ML', 'Líquido', 'Biológico', 'C1', '1,0 ML + 2 CAN APLIC', 148.88)
, (2775, 76, 'PRALUENT', '75 MG/ML', 'Líquido', 'Biológico', 'C1', '1,0 ML + 6 CAN APLIC', 446.63)
, (2776, 76, 'PRALUENT', '150 MG/ML', 'Líquido', 'Biológico', 'C1', '1,0 ML + CAN APLIC', 27.49)
, (2777, 76, 'PRALUENT', '150 MG/ML', 'Líquido', 'Biológico', 'C1', '1,0 ML + 2 CAN APLIC', 54.98)
, (2778, 76, 'PRALUENT', '150 MG/ML', 'Líquido', 'Biológico', 'C1', '1,0 ML + 6 CAN APLIC', 164.91)
, (2779, 235, 'ALOPURINOL', '300 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 22.80)
, (2780, 207, 'ALOPURINOL', '300 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 24.72)
, (2781, 207, 'ALOPURINOL', '100 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 8.36)
, (2782, 254, 'ALOPURINOL', '100 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 8.04)
, (2783, 254, 'ALOPURINOL', '100 MG', 'Sólido', 'Genérico', 'Não controlado', '600', 120.08)
, (2784, 254, 'ALOPURINOL', '300 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 23.76)
, (2785, 254, 'ALOPURINOL', '300 MG', 'Sólido', 'Genérico', 'Não controlado', '500', 210.21)
, (2786, 254, 'ALOPURINOL', '100 MG', 'Sólido', 'Genérico', 'Não controlado', '80 (EMB FRAC)', 21.80)
, (2788, 254, 'ALOPURINOL', '300 MG', 'Sólido', 'Genérico', 'Não controlado', '80 (EMB FRAC)', 64.26)
, (2791, 76, 'ALOPURINOL', '100 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 7.10)
, (2792, 76, 'ALOPURINOL', '300 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 20.96)
, (2799, 210, 'ALPRAZOLAM', '0,25 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 12.88)
, (2800, 210, 'ALPRAZOLAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 8.94)
, (2801, 210, 'ALPRAZOLAM', '1 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 30.78)
, (2802, 210, 'ALPRAZOLAM', '1 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 17.52)
, (2803, 210, 'ALPRAZOLAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 56.17)
, (2804, 101, 'ALPRAZOLAM', '1,0 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 46.31)
, (2805, 101, 'ALPRAZOLAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 26.08)
, (2806, 101, 'ALPRAZOLAM', '2,0 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 73.22)
, (2807, 219, 'ALPRAZOLAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 26.04)
, (2808, 219, 'ALPRAZOLAM', '1,0 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 46.27)
, (2809, 219, 'ALPRAZOLAM', '2,0 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 73.20)
, (2810, 184, 'ALPRAZOLAM', '0,25 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 6.14)
, (2811, 184, 'ALPRAZOLAM', '0,25 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 9.18)
, (2812, 184, 'ALPRAZOLAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 11.96)
, (2813, 184, 'ALPRAZOLAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 17.52)
, (2814, 184, 'ALPRAZOLAM', '1 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 21.38)
, (2815, 184, 'ALPRAZOLAM', '1 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 30.19)
, (2816, 184, 'ALPRAZOLAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 42.16)
, (2817, 184, 'ALPRAZOLAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 56.17)
, (2818, 198, 'ALPRAZOLAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 26.04)
, (2819, 198, 'ALPRAZOLAM', '2,0 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 73.20)
, (2820, 33, 'ALPRAZOLAM', '0,25 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 8.09)
, (2821, 33, 'ALPRAZOLAM', '0,25 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 12.15)
, (2822, 33, 'ALPRAZOLAM', '0,25 MG', 'Sólido', 'Genérico', 'Não controlado', '500', 202.61)
, (2823, 33, 'ALPRAZOLAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 15.82)
, (2824, 33, 'ALPRAZOLAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 23.72)
, (2825, 33, 'ALPRAZOLAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '500', 395.48)
, (2826, 33, 'ALPRAZOLAM', '1 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 28.11)
, (2827, 33, 'ALPRAZOLAM', '1 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 42.18)
, (2828, 33, 'ALPRAZOLAM', '1 MG', 'Sólido', 'Genérico', 'Não controlado', '500', 702.97)
, (2829, 46, 'ALPRAZOLAM', '0,25 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 13.37)
, (2830, 46, 'ALPRAZOLAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 26.04)
, (2831, 46, 'ALPRAZOLAM', '1,0 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 46.31)
, (2832, 46, 'ALPRAZOLAM', '2,0 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 73.23)
, (2839, 47, 'ALPRAZOLAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 11.74)
, (2840, 47, 'ALPRAZOLAM', '1 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 21.09)
, (2841, 76, 'ALPRAZOLAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 8.04)
, (2842, 76, 'ALPRAZOLAM', '0,25 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 7.87)
, (2843, 76, 'ALPRAZOLAM', '1 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 14.98)
, (2844, 76, 'ALPRAZOLAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 39.34)
, (2865, 101, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '15', 13.59)
, (2866, 101, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '500', 752.23)
, (2869, 184, 'AMOXICILINA', '50 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '150 ML  + COP', 18.56)
, (2870, 253, 'AMOXICILINA', '50 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '150 ML + COL', 29.73)
, (2871, 253, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '6', 12.38)
, (2872, 253, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 41.27)
, (2873, 253, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '21', 43.34)
, (2874, 253, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 57.04)
, (2875, 253, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '300', 619.28)
, (2876, 253, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '600', 238.56)
, (2877, 253, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '200', 412.85)
, (2878, 253, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '500', 32.13)
, (2879, 253, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '1000', 64.26)
, (2880, 253, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '15', 30.95)
, (2881, 254, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '480', 334.84)
, (2882, 254, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '840', 523.22)
, (2883, 254, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '280 (EMB FRAC)', 199.17)
, (2884, 254, 'AMOXICILINA', '50 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '60 ML+ COP', 14.38)
, (2885, 254, 'AMOXICILINA', '50 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '60 ML + 50 COP', 418.59)
, (2886, 254, 'AMOXICILINA', '50 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '150 ML+ COP', 24.37)
, (2887, 254, 'AMOXICILINA', '50 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '150 ML + 50 COP', 732.54)
, (2890, 232, 'AMOXICILINA', '875 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 64.87)
, (2893, 210, 'AMOXICILINA', '50 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '150 ML  + COP', 30.28)
, (2894, 210, 'AMOXICILINA', '100 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '150 ML  + COP', 57.84)
, (2895, 210, 'AMOXICILINA', '400 MG', 'Líquido', 'Genérico', 'Não controlado', '100 ML + SER PLAS DOS', 30.23)
, (2896, 210, 'AMOXICILINA', '80 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '100 ML + SER DOS', 30.23)
, (2898, 101, 'AMOXICILINA', '50 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '150 ML + COP', 27.28)
, (2899, 153, 'AMOXICILINA', '875 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 64.87)
, (2900, 153, 'AMOXICILINA', '80 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '100 ML + SER DOS', 29.36)
, (2901, 220, 'AMOXICILINA', '50 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '150 ML+ COP X 15 ML', 28.48)
, (2902, 220, 'AMOXICILINA', '100 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '150 ML+ COP X 15 ML', 38.62)
, (2905, 219, 'AMOXICILINA', '50 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '150 ML + SER DOS X 10 ML', 38.83)
, (2907, 184, 'AMOXICILINA', '80 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '100 ML + SER DOS', 28.69)
, (2913, 266, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '15', 15.51)
, (2914, 266, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '21', 18.50)
, (2915, 266, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 28.72)
, (2920, 252, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '15', 23.52)
, (2924, 24, 'AMOXICILINA', '50 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '150 ML + COP', 23.25)
, (2925, 46, 'AMOXICILINA', '50 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '150 ML + COP X 10 ML', 21.65)
, (2926, 46, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '15', 21.05)
, (2927, 46, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '21', 27.09)
, (2928, 46, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '15', 21.05)
, (2930, 46, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '21', 27.09)
, (2935, 49, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '500', 433.91)
, (2936, 43, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '15', 29.43)
, (2937, 43, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '21', 43.61)
, (2938, 43, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 57.06)
, (2940, 76, 'AMOXICILINA', '250 MG', 'Líquido', 'Genérico', 'Não controlado', '150 ML + SER DOS', 30.30)
, (2941, 76, 'AMOXICILINA', '500 MG', 'Líquido', 'Genérico', 'Não controlado', '150 ML + SER DOS', 41.61)
, (2942, 76, 'AMOXICILINA', '400 MG', 'Líquido', 'Genérico', 'Não controlado', '100 ML + SER DOS', 31.60)
, (2945, 210, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '15', 25.85)
, (2946, 210, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '21', 35.81)
, (2947, 210, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 50.14)
, (2948, 210, 'AMOXICILINA', '875 MG', 'Sólido', 'Genérico', 'Não controlado', '14', 45.21)
, (2949, 101, 'AMOXICILINA', '50 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '60 ML + COP', 10.90)
, (2952, 220, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '15', 22.92)
, (2953, 220, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '21', 31.76)
, (2954, 220, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 43.35)
, (2963, 184, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '15', 16.28)
, (2964, 184, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '21', 22.36)
, (2965, 184, 'AMOXICILINA', '875 MG', 'Sólido', 'Genérico', 'Não controlado', '14', 42.83)
, (2968, 266, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '15', 15.51)
, (2969, 266, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '21', 18.50)
, (2970, 254, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '21', 21.09)
, (2971, 252, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '21', 42.84)
, (2975, 24, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '21', 16.16)
, (2976, 24, 'AMOXICILINA', '50 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '150 ML + COP', 16.16)
, (2977, 24, 'AMOXICILINA', '50 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '150 ML + 50 COP', 536.35)
, (2978, 24, 'AMOXICILINA', '50 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '60 ML + COP', 7.75)
, (2979, 33, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '21', 17.01)
, (2980, 33, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '350', 243.63)
, (2981, 33, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '350 (EMB FRAC)', 232.02)
, (2982, 49, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '15', 12.81)
, (2984, 49, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '21', 18.51)
, (2985, 76, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '15', 20.94)
, (2986, 76, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 39.62)
, (2987, 76, 'AMOXICILINA', '500 MG', 'Sólido', 'Genérico', 'Não controlado', '21', 29.03)
, (6692, 254, 'CLONAZEPAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '800', 190.63)
, (6754, 252, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 8.32)
, (6805, 76, 'URBANIL', '20 MG', 'Sólido', 'Novo', 'Não controlado', '20', 19.21)
, (6806, 76, 'URBANIL', '20 MG', 'Sólido', 'Novo', 'Não controlado', '20', 19.75)
, (6809, 232, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 12.57)
, (6810, 155, 'CLONAZEPAM', '2,5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '20 ML', 11.30)
, (6811, 155, 'CLONAZEPAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 7.15)
, (6812, 155, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 12.52)
, (6813, 210, 'CLONAZEPAM', '2,5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', 'None', 10.40)
, (6814, 210, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 12.49)
, (6815, 210, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 25.06)
, (6821, 101, 'CLONAZEPAM', '2,5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '20 ML', 9.89)
, (6825, 184, 'CLONAZEPAM', '2,5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '20ML', 10.32)
, (6826, 184, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 8.30)
, (6827, 184, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 12.51)
, (6828, 184, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 24.96)
, (6829, 174, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 25.02)
, (6830, 174, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '450', 186.53)
, (6831, 114, 'CLONAZEPAM', '2.5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '20 ML', 11.18)
, (6832, 114, 'CLONAZEPAM', '2.5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '20 ML(EMB HOSP)', 145.54)
, (6839, 266, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 8.32)
, (6840, 266, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 12.49)
, (6841, 253, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 12.42)
, (6842, 253, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '1000', 414.61)
, (6843, 253, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 24.94)
, (6846, 254, 'CLONAZEPAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 4.75)
, (6847, 254, 'CLONAZEPAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 7.13)
, (6848, 254, 'CLONAZEPAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 14.27)
, (6849, 254, 'CLONAZEPAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '300', 71.47)
, (6850, 254, 'CLONAZEPAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '500', 119.13)
, (6851, 254, 'CLONAZEPAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '600', 142.98)
, (6852, 254, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '15', 6.22)
, (6853, 254, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 8.28)
, (6854, 254, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 12.55)
, (6855, 254, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 24.94)
, (6856, 254, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '300', 124.76)
, (6857, 254, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '500', 207.96)
, (6858, 254, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '600', 249.55)
, (6859, 254, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '800', 332.72)
, (6863, 252, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 12.49)
, (6866, 27, 'CLONAZEPAM', '2,5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '20 ML', 10.46)
, (6867, 27, 'CLONAZEPAM', '2,5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '20 ML (EMB HOSP)', 539.00)
, (6868, 27, 'CLONAZEPAM', '2,5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '20 ML', 10.46)
, (6869, 27, 'CLONAZEPAM', '2,5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '20 ML (EMB HOSP)', 539.00)
, (6870, 27, 'CLONAZEPAM', '2,5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '20 ML', 10.46)
, (6871, 27, 'CLONAZEPAM', '2,5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '20 ML (EMB HOSP)', 539.00)
, (6872, 27, 'CLONAZEPAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '10', 2.27)
, (6873, 27, 'CLONAZEPAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 4.56)
, (6874, 27, 'CLONAZEPAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 6.85)
, (6875, 27, 'CLONAZEPAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 13.69)
, (6876, 27, 'CLONAZEPAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '480 (EMB HOSP)', 109.39)
, (6877, 27, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '10', 3.98)
, (6878, 27, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '20', 7.95)
, (6879, 27, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 12.01)
, (6880, 27, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 23.90)
, (6881, 27, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '480 (EMB HOSP)', 191.22)
, (6882, 27, 'CLONAZEPAM', '0,5MG', 'Sólido', 'Genérico', 'Não controlado', '30', 6.52)
, (6883, 27, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 11.40)
, (6884, 27, 'CLONAZEPAM', '2,5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '20 ML', 10.46)
, (6885, 27, 'CLONAZEPAM', '2,5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '20 ML', 531.13)
, (6886, 27, 'CLONAZEPAM', '0,5MG', 'Sólido', 'Genérico', 'Não controlado', '30', 6.52)
, (6887, 27, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 11.40)
, (6888, 47, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 11.22)
, (6889, 43, 'CLONAZEPAM', '2,5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '20 ML', 10.32)
, (6890, 43, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 12.51)
, (6891, 76, 'CLONAZEPAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 5.52)
, (6892, 76, 'CLONAZEPAM', '0,5 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 10.95)
, (6893, 76, 'CLONAZEPAM', '2 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 18.77)
, (6894, 76, 'CLONAZEPAM', '2,5 MG/ML', 'Líquido', 'Genérico', 'Não controlado', '20 ML', 8.04)
, (9131, 235, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 29.65)
, (9132, 235, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 56.93)
, (9133, 207, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 80.17)
, (9134, 207, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '50', 66.81)
, (9142, 240, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 148.70)
, (9143, 240, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '7', 17.32)
, (9144, 240, 'CLORIDRATO DE MEMANTINA', '20 MG', 'Sólido', 'Genérico', 'Não controlado', '10', 49.53)
, (9145, 240, 'CLORIDRATO DE MEMANTINA', '20 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 148.62)
, (9146, 240, 'CLORIDRATO DE MEMANTINA', '20 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 297.24)
, (9168, 210, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '10', 54.86)
, (9169, 210, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 164.58)
, (9170, 210, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 329.16)
, (9171, 210, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '90', 493.73)
, (9172, 210, 'CLORIDRATO DE MEMANTINA', '20 MG', 'Sólido', 'Genérico', 'Não controlado', '15', 164.51)
, (9173, 210, 'CLORIDRATO DE MEMANTINA', '20 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 329.02)
, (9174, 210, 'CLORIDRATO DE MEMANTINA', '20 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 658.05)
, (9179, 101, 'CLORIDRATO DE MEMANTINA', '10MG', 'Sólido', 'Genérico', 'Não controlado', '30', 59.91)
, (9180, 101, 'CLORIDRATO DE MEMANTINA', '10MG', 'Sólido', 'Genérico', 'Não controlado', '60', 113.81)
, (9181, 101, 'CLORIDRATO DE MEMANTINA', '10MG', 'Sólido', 'Genérico', 'Não controlado', '500 (EMB HOSP)', 742.93)
, (9187, 152, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '15', 82.34)
, (9188, 152, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 61.65)
, (9189, 152, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 122.05)
, (9197, 148, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '10', 54.82)
, (9198, 148, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 164.44)
, (9199, 148, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 328.88)
, (9200, 148, 'CLORIDRATO DE MEMANTINA', '20 MG', 'Sólido', 'Genérico', 'Não controlado', '10', 109.67)
, (9201, 148, 'CLORIDRATO DE MEMANTINA', '20 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 329.00)
, (9202, 148, 'CLORIDRATO DE MEMANTINA', '20 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 657.99)
, (9203, 148, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '120', 657.77)
, (9208, 219, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 164.55)
, (9209, 219, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 329.08)
, (9210, 184, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '10', 54.85)
, (9211, 184, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 164.54)
, (9212, 184, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 329.06)
, (9213, 184, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '90', 493.60)
, (9214, 184, 'CLORIDRATO DE MEMANTINA', '20 MG', 'Sólido', 'Genérico', 'Não controlado', '15', 164.51)
, (9215, 184, 'CLORIDRATO DE MEMANTINA', '20 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 329.02)
, (9216, 184, 'CLORIDRATO DE MEMANTINA', '20 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 658.05)
, (9220, 195, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 61.65)
, (9221, 195, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 122.05)
, (9222, 266, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '10', 54.86)
, (9223, 266, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 164.58)
, (9224, 266, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 329.16)
, (9225, 266, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '90', 493.73)
, (9226, 266, 'CLORIDRATO DE MEMANTINA', '20 MG', 'Sólido', 'Genérico', 'Não controlado', '15', 164.51)
, (9227, 266, 'CLORIDRATO DE MEMANTINA', '20 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 329.02)
, (9228, 266, 'CLORIDRATO DE MEMANTINA', '20 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 658.05)
, (9229, 254, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '10', 54.67)
, (9230, 254, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 164.05)
, (9231, 254, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 328.09)
, (9232, 254, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '90', 492.16)
, (9233, 254, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '120', 656.21)
, (9234, 254, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '100', 546.83)
, (9235, 254, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '200', 93.68)
, (9236, 254, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '300', 640.54)
, (9237, 254, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '500', 734.23)
, (9245, 27, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 61.65)
, (9246, 27, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 122.05)
, (9247, 49, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '30', 55.09)
, (9248, 49, 'CLORIDRATO DE MEMANTINA', '10 MG', 'Sólido', 'Genérico', 'Não controlado', '60', 104.67)
, (10121, 192, 'CLORIDRATO DE RANITIDINA', '25 MG/ML', 'Líquido', 'Genérico', 'A2', '2 ML', 96.11)
, (10122, 232, 'CLORIDRATO DE RANITIDINA', '150 MG', 'Sólido', 'Genérico', 'A2', '20', 21.83)
, (10123, 210, 'CLORIDRATO DE RANITIDINA', '150 MG', 'Sólido', 'Genérico', 'A2', '10', 13.32)
, (10124, 210, 'CLORIDRATO DE RANITIDINA', '300 MG', 'Sólido', 'Genérico', 'A2', '10', 25.18)
, (10125, 210, 'CLORIDRATO DE RANITIDINA', '300 MG', 'Sólido', 'Genérico', 'A2', '20', 48.58)
, (10126, 210, 'CLORIDRATO DE RANITIDINA', '15 MG/ML', 'Líquido', 'Genérico', 'A2', '120 ML + COP', 31.32)
, (10129, 101, 'CLORIDRATO DE RANITIDINA', '25 MG/ML', 'Líquido', 'Genérico', 'A2', '2 ML', 235.41)
, (10130, 101, 'CLORIDRATO DE RANITIDINA', '300 MG', 'Sólido', 'Genérico', 'A2', '20', 39.61)
, (10131, 101, 'CLORIDRATO DE RANITIDINA', '150 MG', 'Sólido', 'Genérico', 'A2', '10', 11.76)
, (10132, 101, 'CLORIDRATO DE RANITIDINA', '150 MG', 'Sólido', 'Genérico', 'A2', '20', 21.83)
, (10135, 102, 'CLORIDRATO DE RANITIDINA', '25 MG/ML', 'Líquido', 'Genérico', 'A2', '2 ML (EMB HOSP)', 102.08)
, (10136, 189, 'CLORIDRATO DE RANITIDINA', '150 MG', 'Sólido', 'Genérico', 'A2', '20', 9.35)
, (10138, 220, 'CLORIDRATO DE RANITIDINA', '25 MG/ML', 'Líquido', 'Genérico', 'A2', '2 ML', 79.80)
, (10144, 219, 'CLORIDRATO DE RANITIDINA', '15 MG/ML', 'Líquido', 'Genérico', 'A2', '120 ML + COP', 31.38)
, (10145, 219, 'CLORIDRATO DE RANITIDINA', '150 MG', 'Sólido', 'Genérico', 'A2', '20', 37.50)
, (10146, 219, 'CLORIDRATO DE RANITIDINA', '300 MG', 'Sólido', 'Genérico', 'A2', '20', 78.19)
, (10147, 184, 'CLORIDRATO DE RANITIDINA', '15 MG/ML', 'Líquido', 'Genérico', 'A2', '120 ML + COP', 29.44)
, (10151, 54, 'CLORIDRATO DE RANITIDINA', '25 MG/ML', 'Líquido', 'Genérico', 'A2', '2 ML', 176.91)
, (10152, 114, 'CLORIDRATO DE RANITIDINA', '25 MG/ML', 'Líquido', 'Genérico', 'A2', '2 ML', 195.46)
, (10153, 252, 'CLORIDRATO DE RANITIDINA', '15 MG/ML', 'Líquido', 'Genérico', 'A2', '60 ML + COP', 15.69)
, (10154, 252, 'CLORIDRATO DE RANITIDINA', '15 MG/ML', 'Líquido', 'Genérico', 'A2', '100 ML + COP', 26.14)
, (10155, 252, 'CLORIDRATO DE RANITIDINA', '15 MG/ML', 'Líquido', 'Genérico', 'A2', '120 ML + COP', 31.37)
, (10156, 252, 'CLORIDRATO DE RANITIDINA', '15 MG/ML', 'Líquido', 'Genérico', 'A2', '150 ML + COP', 39.22)
, (10157, 252, 'CLORIDRATO DE RANITIDINA', '15 MG/ML', 'Líquido', 'Genérico', 'A2', '200 ML + COP', 52.29)
, (10158, 252, 'CLORIDRATO DE RANITIDINA', '15 MG/ML', 'Líquido', 'Genérico', 'A2', '120 ML + COP', 31.37)
, (10159, 9, 'CLORIDRATO DE RANITIDINA', '15 MG/ML', 'Líquido', 'Genérico', 'A2', '120 ML + COP', 31.28)
, (10160, 21, 'CLORIDRATO DE RANITIDINA', '25 MG/ML', 'Líquido', 'Genérico', 'A2', '2 ML', 67.06)
, (10163, 24, 'CLORIDRATO DE RANITIDINA', '150 MG', 'Sólido', 'Genérico', 'A2', '20', 9.35)
, (10165, 247, 'CLORIDRATO DE RANITIDINA', '15 MG', 'Líquido', 'Genérico', 'A2', '120 ML + CP MED', 29.34)
, (10166, 247, 'CLORIDRATO DE RANITIDINA', '15 MG', 'Líquido', 'Genérico', 'A2', '120 ML + 70 CP MED', 969.86)
, (10171, 27, 'CLORIDRATO DE RANITIDINA', '150 MG', 'Sólido', 'Similar', 'A2', '10', 20.99)
, (10172, 27, 'CLORIDRATO DE RANITIDINA', '150 MG', 'Sólido', 'Similar', 'A2', '20', 39.66)
, (10173, 27, 'CLORIDRATO DE RANITIDINA', '150 MG', 'Sólido', 'Similar', 'A2', '300', 612.46)
, (10174, 27, 'CLORIDRATO DE RANITIDINA', '150 MG', 'Sólido', 'Similar', 'A2', '500', 20.74)
, (10175, 27, 'CLORIDRATO DE RANITIDINA', '300 MG', 'Sólido', 'Similar', 'A2', '8', 33.79)
, (10176, 27, 'CLORIDRATO DE RANITIDINA', '300 MG', 'Sólido', 'Similar', 'A2', '16', 67.57)
, (10177, 27, 'CLORIDRATO DE RANITIDINA', '300 MG', 'Sólido', 'Similar', 'A2', '10', 43.11)
, (10178, 27, 'CLORIDRATO DE RANITIDINA', '300 MG', 'Sólido', 'Similar', 'A2', '20', 82.77)
, (10179, 27, 'CLORIDRATO DE RANITIDINA', '300 MG', 'Sólido', 'Similar', 'A2', '300', 267.24)
, (10180, 27, 'CLORIDRATO DE RANITIDINA', '300 MG', 'Sólido', 'Similar', 'A2', '500', 112.10)
, (10181, 27, 'CLORIDRATO DE RANITIDINA', '15 MG/ML', 'Líquido', 'Similar', 'A2', '120 ML+ 25 COP', 749.94)
, (10182, 27, 'CLORIDRATO DE RANITIDINA', '15 MG/ML', 'Líquido', 'Similar', 'A2', '120 ML+ 50 COP', 499.91)
, (10183, 27, 'CLORIDRATO DE RANITIDINA', '15 MG/ML', 'Líquido', 'Similar', 'A2', '120 ML+ 60 COP', 799.87)
, (10184, 27, 'CLORIDRATO DE RANITIDINA', '150 MG', 'Sólido', 'Similar', 'A2', '30', 51.04)
, (10185, 27, 'CLORIDRATO DE RANITIDINA', '150 MG', 'Sólido', 'Similar', 'A2', '60', 122.49)
, (10186, 27, 'CLORIDRATO DE RANITIDINA', '150 MG', 'Sólido', 'Similar', 'A2', '400', 816.60)
, (10187, 27, 'CLORIDRATO DE RANITIDINA', '150 MG', 'Sólido', 'Similar', 'A2', '450', 918.67)
, (10188, 27, 'CLORIDRATO DE RANITIDINA', '300 MG', 'Sólido', 'Similar', 'A2', '30', 126.73)
, (10189, 27, 'CLORIDRATO DE RANITIDINA', '300 MG', 'Sólido', 'Similar', 'A2', '60', 253.46)
, (10190, 27, 'CLORIDRATO DE RANITIDINA', '300 MG', 'Sólido', 'Similar', 'A2', '400', 689.68)
, (10191, 27, 'CLORIDRATO DE RANITIDINA', '300 MG', 'Sólido', 'Similar', 'A2', '450', 900.87)
, (10192, 27, 'CLORIDRATO DE RANITIDINA', '15 MG/ML', 'Líquido', 'Similar', 'A2', '120 ML + SER DOS', 29.98)
, (10193, 43, 'CLORIDRATO DE RANITIDINA', '150 MG', 'Sólido', 'Genérico', 'A2', '20', 22.83)
, (10194, 43, 'CLORIDRATO DE RANITIDINA', '15 MG/ML', 'Líquido', 'Genérico', 'A2', '120 ML + COP', 31.37)
, (10195, 76, 'CLORIDRATO DE RANITIDINA', '150 MG', 'Sólido', 'Genérico', 'A2', '10', 12.94)
, (10196, 76, 'CLORIDRATO DE RANITIDINA', '150 MG', 'Sólido', 'Genérico', 'A2', '20', 25.35)
, (10197, 76, 'CLORIDRATO DE RANITIDINA', '300 MG', 'Sólido', 'Genérico', 'A2', '10', 24.66)
, (19779, 76, 'NEOZINE', '25 MG', 'Sólido', 'Novo', 'Não controlado', '20', 8.64)
, (19780, 76, 'NEOZINE', '100 MG', 'Sólido', 'Novo', 'Não controlado', '20', 18.74)
;

-- pessoa
insert into pessoa (id, nome, logradouro, numero,  bairro, cep, cidade, estado, telefone) values 
  (1, 'Adônis Daniel Aranda Sobrinho','Rua Carlos José de Castilho', 29, 'Cambuci', 06168043, 'São Paulo', 'SP', 011928368496)
, (2, 'Aldo João Paes Rivera dos Santos','Alameda Ibiracemas', 99, 'Cidade Líder', 07615900, 'São Paulo', 'SP', 011936020385)
, (3, 'Andrea Quitéria Assunção','Rua Carneiro Leão', 82, 'Pari', 01843906, 'São Paulo', 'SP', 011961991053)
, (4, 'Antônio Diego Aguiar de Galvão','Avenida Onze de Junho', 12, 'Santa Cecília', 05360307, 'São Paulo', 'SP', 011932772123)
, (5, 'Bella Priscila Colaço Gil','Rua Filadélphia', 94, 'Vila Maria', 09912424, 'São Paulo', 'SP', 011975207230)
, (6, 'Berenice Gonçalves Leon','Rua Engenheiro Toledo Malta', 94, 'Aricanduva', 08299462, 'São Paulo', 'SP', 011947284138)
, (7, 'Damião Benites de Junqueira','Rua Delfino Casal de Rey', 30, 'Santa Cecília', 04274254, 'São Paulo', 'SP', 011946426695)
, (8, 'Daniela Eloá de Aragão','Rua General Costa Campos', 36, 'Cidade Líder', 06594037, 'São Paulo', 'SP', 011947819562)
, (9, 'Danielle Fátima Pontes de Quintana','Rua Barão da Cunha de Araripe', 60, 'Santo Amaro', 07454333, 'São Paulo', 'SP', 011940753992)
, (10, 'Danilo Juan Burgos de Fernandes','Praça José Moreno', 22, 'Campo Limpo', 08635179, 'São Paulo', 'SP', 011932735226)
, (11, 'Edivaldo Quintana Jr.','Rua Caiabu',1,'Lapa', 06459989, 'São Paulo', 'SP', 011962352421)
, (12, 'Edson Esteves Marés','Rua Desembargador Isnard dos Reis', 36, 'São Miguel Paulista', 08920501, 'São Paulo', 'SP', 011923734049)
, (13, 'Eduardo Godói Jr.','Praça Argemiro Alves de Sá', 14, 'Bom Retiro', 05456620, 'São Paulo', 'SP', 011947211180)
, (14, 'Elias Dias Souto','Rua Emílio Baumgart', 62, 'Alto de Pinheiros', 09891591, 'São Paulo', 'SP', 011915708270)
, (15, 'Francisco Aranda','Rua Frei Galvão', 28, 'Cidade Líder', 04592864, 'São Paulo', 'SP', 011956700938)
, (16, 'Gilson Abreu de Aguiar','Rua Dario Vilares Barbosa', 29, 'São Miguel Paulista', 01123625, 'São Paulo', 'SP', 011927174666)
, (17, 'Joaquim Saulo Oliveira Padrão de Cardoso','Rua Aracari', 73, 'Bela Vista', 05692120, 'São Paulo', 'SP', 011950535833)
, (18, 'Laís Maria Maldonado Quintana','Rua Benício José da Fonseca', 34, 'Cambuci', 03128340, 'São Paulo', 'SP', 011994738091)
, (19, 'Luara Elisângela Colaço da Silva','Alameda Olga', 47, 'Cangaíba', 04452012, 'São Paulo', 'SP', 011956712681)
, (20, 'Martinho Aranda Feliciano','Rua Eusébio da Silva', 16, 'Ponte Rasa', 06892250, 'São Paulo', 'SP', 011991592293)
, (21, 'Martinho Colaço Jr.','Parque Luiz Carlos Prestes', 36, 'Jaraguá', 05487508, 'São Paulo', 'SP', 011933809113)
, (22, 'Micaela Ivone Domingues de Prado','Rua Aracena', 34, 'Moema', 04721519, 'São Paulo', 'SP', 011986932061)
, (23, 'Nicole Duarte Jangada','Avenida Doutor Vital Brasil', 3, 'Moema', 09083759, 'São Paulo', 'SP', 011997160743)
, (24, 'Samuel Batista de Marinho','Rua Brejo Alegre', 9, 'São Miguel Paulista', 07254951, 'São Paulo', 'SP', 011971500983)
, (25, 'Tomás Rodrigo Lozano Madeira','Praça Memória do Jaçanã', 23, 'Barra Funda', 02136420, 'São Paulo', 'SP', 011987756463)
;

-- cliente
insert into cliente values 
  (1, 78930017253, '1973-2-2', 'M')
, (2, 79298401366, '1991-5-25', 'M')
, (3, 51301866175, '1984-12-11', 'M')
, (4, 23541139515, '1990-10-13', 'F')
, (5, 81285894012, '1985-7-18', 'M')
, (6, 88687662707, '1986-5-8', 'F')
, (7, 27083655243, '1986-5-16', 'F')
, (8, 50949967968, '1972-11-12', 'M')
, (9, 46786757450, '1987-5-6', 'F')
, (10, 58823171687, '1952-9-20', 'F')
, (11, 61265916930, '1965-6-16', 'M')
, (12, 74937483659, '1953-9-13', 'M')
, (13, 83224514706, '1993-5-20', 'M')
, (14, 79223348792, '1975-1-21', 'M')
, (15, 69667630559, '1987-8-27', 'M')
, (16, 96393555783, '1950-5-19', 'M')
, (17, 23717077615, '1994-10-3', 'M')
, (18, 68435004671, '1983-4-14', 'M')
, (19, 20611262083, '1977-5-22', 'F')
, (20, 26612046766, '1983-4-21', 'F')
;

-- profissional
insert into profissional values
  (21, '15487', 'veterinário')
, (22, '150348', 'médico')
, (23, '135001', 'médico')
, (24, '189654', 'médico')
, (25, '2589', 'dentista')
;

-- estoque inicial
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (90, 'lote 636966', '2023-07-31', '2025-01-31', 13.8, 90, 90); 
insert into estoque_total (medicamento_id, total) values (90, 90); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (91, 'lote 616322', '2023-07-31', '2025-01-31', 28.7, 40, 40); 
insert into estoque_total (medicamento_id, total) values (91, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (340, 'lote 921746', '2023-07-31', '2025-07-31', 11.7, 100, 100); 
insert into estoque_total (medicamento_id, total) values (340, 100); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (341, 'lote 968718', '2023-07-31', '2025-07-31', 8.4, 40, 40); 
insert into estoque_total (medicamento_id, total) values (341, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (342, 'lote 679601', '2023-07-31', '2025-07-31', 204.9, 5, 5); 
insert into estoque_total (medicamento_id, total) values (342, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (351, 'lote 454055', '2023-07-31', '2025-07-31', 8.4, 110, 110); 
insert into estoque_total (medicamento_id, total) values (351, 110); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (352, 'lote 192366', '2023-07-31', '2025-07-31', 11.9, 120, 120); 
insert into estoque_total (medicamento_id, total) values (352, 120); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (354, 'lote 791396', '2023-07-31', '2025-07-31', 8.5, 70, 70); 
insert into estoque_total (medicamento_id, total) values (354, 70); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (355, 'lote 140091', '2023-07-31', '2025-07-31', 11.6, 60, 60); 
insert into estoque_total (medicamento_id, total) values (355, 60); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (356, 'lote 195052', '2023-07-31', '2025-07-31', 8.9, 60, 60); 
insert into estoque_total (medicamento_id, total) values (356, 60); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (357, 'lote 273802', '2023-07-31', '2025-07-31', 13.2, 80, 80); 
insert into estoque_total (medicamento_id, total) values (357, 80); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (358, 'lote 821988', '2023-07-31', '2025-07-31', 209.4, 5, 5); 
insert into estoque_total (medicamento_id, total) values (358, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (531, 'lote 885355', '2023-07-31', '2025-01-31', 11.1, 110, 110); 
insert into estoque_total (medicamento_id, total) values (531, 110); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (532, 'lote 244243', '2023-07-31', '2025-01-31', 2.9, 100, 100); 
insert into estoque_total (medicamento_id, total) values (532, 100); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (533, 'lote 142273', '2023-07-31', '2025-01-31', 4.2, 120, 120); 
insert into estoque_total (medicamento_id, total) values (533, 120); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (561, 'lote 523355', '2023-07-31', '2026-07-31', 32.7, 20, 20); 
insert into estoque_total (medicamento_id, total) values (561, 20); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (562, 'lote 518189', '2023-07-31', '2026-07-31', 61.6, 25, 25); 
insert into estoque_total (medicamento_id, total) values (562, 25); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (597, 'lote 441415', '2023-07-31', '2024-07-31', 144.0, 5, 5); 
insert into estoque_total (medicamento_id, total) values (597, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1016, 'lote 339993', '2023-07-31', '2026-07-31', 3.3, 30, 30); 
insert into estoque_total (medicamento_id, total) values (1016, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1017, 'lote 952693', '2023-07-31', '2026-07-31', 26.2, 20, 20); 
insert into estoque_total (medicamento_id, total) values (1017, 20); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1234, 'lote 639353', '2023-07-31', '2024-07-31', 3.8, 100, 100); 
insert into estoque_total (medicamento_id, total) values (1234, 100); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1510, 'lote 316430', '2023-07-31', '2025-01-31', 4.6, 50, 50); 
insert into estoque_total (medicamento_id, total) values (1510, 50); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1531, 'lote 183530', '2023-07-31', '2025-01-31', 26.8, 20, 20); 
insert into estoque_total (medicamento_id, total) values (1531, 20); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1532, 'lote 246310', '2023-07-31', '2025-01-31', 53.1, 25, 25); 
insert into estoque_total (medicamento_id, total) values (1532, 25); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1537, 'lote 233101', '2023-07-31', '2025-01-31', 17.9, 20, 20); 
insert into estoque_total (medicamento_id, total) values (1537, 20); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1538, 'lote 138278', '2023-07-31', '2025-01-31', 35.2, 30, 30); 
insert into estoque_total (medicamento_id, total) values (1538, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1578, 'lote 575150', '2023-07-31', '2025-01-31', 3.7, 80, 80); 
insert into estoque_total (medicamento_id, total) values (1578, 80); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1673, 'lote 268933', '2023-07-31', '2025-01-31', 9.2, 30, 30); 
insert into estoque_total (medicamento_id, total) values (1673, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1678, 'lote 507593', '2023-07-31', '2025-01-31', 16.9, 30, 30); 
insert into estoque_total (medicamento_id, total) values (1678, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1839, 'lote 295075', '2023-07-31', '2025-07-31', 8.4, 60, 60); 
insert into estoque_total (medicamento_id, total) values (1839, 60); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1840, 'lote 371096', '2023-07-31', '2025-07-31', 11.9, 80, 80); 
insert into estoque_total (medicamento_id, total) values (1840, 80); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1841, 'lote 765454', '2023-07-31', '2025-07-31', 8.4, 70, 70); 
insert into estoque_total (medicamento_id, total) values (1841, 70); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1842, 'lote 640460', '2023-07-31', '2025-07-31', 11.9, 50, 50); 
insert into estoque_total (medicamento_id, total) values (1842, 50); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1848, 'lote 426463', '2023-07-31', '2025-07-31', 6.8, 80, 80); 
insert into estoque_total (medicamento_id, total) values (1848, 80); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1849, 'lote 351511', '2023-07-31', '2025-07-31', 8.1, 50, 50); 
insert into estoque_total (medicamento_id, total) values (1849, 50); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1859, 'lote 923251', '2023-07-31', '2025-07-31', 8.5, 80, 80); 
insert into estoque_total (medicamento_id, total) values (1859, 80); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1860, 'lote 297599', '2023-07-31', '2025-07-31', 12.1, 100, 100); 
insert into estoque_total (medicamento_id, total) values (1860, 100); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1861, 'lote 586887', '2023-07-31', '2025-07-31', 8.5, 80, 80); 
insert into estoque_total (medicamento_id, total) values (1861, 80); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1862, 'lote 919772', '2023-07-31', '2025-07-31', 12.1, 120, 120); 
insert into estoque_total (medicamento_id, total) values (1862, 120); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1863, 'lote 838732', '2023-07-31', '2025-07-31', 8.4, 100, 100); 
insert into estoque_total (medicamento_id, total) values (1863, 100); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1864, 'lote 326645', '2023-07-31', '2025-07-31', 12.5, 60, 60); 
insert into estoque_total (medicamento_id, total) values (1864, 60); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1865, 'lote 578121', '2023-07-31', '2025-07-31', 12.1, 50, 50); 
insert into estoque_total (medicamento_id, total) values (1865, 50); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1866, 'lote 392020', '2023-07-31', '2025-07-31', 257.4, 5, 5); 
insert into estoque_total (medicamento_id, total) values (1866, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1867, 'lote 502631', '2023-07-31', '2025-07-31', 11.1, 90, 90); 
insert into estoque_total (medicamento_id, total) values (1867, 90); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1868, 'lote 689912', '2023-07-31', '2025-07-31', 8.0, 120, 120); 
insert into estoque_total (medicamento_id, total) values (1868, 120); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1871, 'lote 935238', '2023-07-31', '2025-07-31', 13.2, 50, 50); 
insert into estoque_total (medicamento_id, total) values (1871, 50); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1872, 'lote 470686', '2023-07-31', '2025-07-31', 8.9, 120, 120); 
insert into estoque_total (medicamento_id, total) values (1872, 120); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1873, 'lote 934591', '2023-07-31', '2025-07-31', 8.4, 40, 40); 
insert into estoque_total (medicamento_id, total) values (1873, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1874, 'lote 990858', '2023-07-31', '2025-07-31', 11.4, 100, 100); 
insert into estoque_total (medicamento_id, total) values (1874, 100); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1879, 'lote 795951', '2023-07-31', '2025-07-31', 8.9, 30, 30); 
insert into estoque_total (medicamento_id, total) values (1879, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1880, 'lote 876200', '2023-07-31', '2025-07-31', 11.5, 30, 30); 
insert into estoque_total (medicamento_id, total) values (1880, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1881, 'lote 705655', '2023-07-31', '2025-07-31', 8.9, 30, 30); 
insert into estoque_total (medicamento_id, total) values (1881, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1882, 'lote 144636', '2023-07-31', '2025-07-31', 11.5, 40, 40); 
insert into estoque_total (medicamento_id, total) values (1882, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1883, 'lote 703106', '2023-07-31', '2025-07-31', 8.4, 40, 40); 
insert into estoque_total (medicamento_id, total) values (1883, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2254, 'lote 724760', '2023-07-31', '2024-07-31', 28.8, 30, 30); 
insert into estoque_total (medicamento_id, total) values (2254, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2364, 'lote 569675', '2023-07-31', '2025-07-31', 5.8, 90, 90); 
insert into estoque_total (medicamento_id, total) values (2364, 90); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2365, 'lote 943966', '2023-07-31', '2025-07-31', 20.7, 20, 20); 
insert into estoque_total (medicamento_id, total) values (2365, 20); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2366, 'lote 553577', '2023-07-31', '2025-07-31', 41.8, 5, 5); 
insert into estoque_total (medicamento_id, total) values (2366, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2367, 'lote 787023', '2023-07-31', '2025-07-31', 5.8, 120, 120); 
insert into estoque_total (medicamento_id, total) values (2367, 120); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2368, 'lote 315375', '2023-07-31', '2025-07-31', 20.7, 40, 40); 
insert into estoque_total (medicamento_id, total) values (2368, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2369, 'lote 961333', '2023-07-31', '2025-07-31', 41.8, 25, 25); 
insert into estoque_total (medicamento_id, total) values (2369, 25); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2591, 'lote 657691', '2023-07-31', '2025-01-31', 374.3, 3, 3); 
insert into estoque_total (medicamento_id, total) values (2591, 3); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2596, 'lote 177710', '2023-07-31', '2024-07-31', 4.8, 40, 40); 
insert into estoque_total (medicamento_id, total) values (2596, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2601, 'lote 819505', '2023-07-31', '2026-07-31', 235.2, 10, 10); 
insert into estoque_total (medicamento_id, total) values (2601, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2619, 'lote 733628', '2023-07-31', '2024-01-31', 381.2, 3, 3); 
insert into estoque_total (medicamento_id, total) values (2619, 3); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2620, 'lote 588851', '2023-07-31', '2024-01-31', 329.0, 6, 6); 
insert into estoque_total (medicamento_id, total) values (2620, 6); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2621, 'lote 466524', '2023-07-31', '2024-01-31', 276.8, 6, 6); 
insert into estoque_total (medicamento_id, total) values (2621, 6); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2622, 'lote 208784', '2023-07-31', '2024-01-31', 224.5, 5, 5); 
insert into estoque_total (medicamento_id, total) values (2622, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2623, 'lote 544732', '2023-07-31', '2024-01-31', 120.0, 20, 20); 
insert into estoque_total (medicamento_id, total) values (2623, 20); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2624, 'lote 381881', '2023-07-31', '2024-01-31', 15.6, 90, 90); 
insert into estoque_total (medicamento_id, total) values (2624, 90); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2626, 'lote 486225', '2023-07-31', '2024-01-31', 240.2, 5, 5); 
insert into estoque_total (medicamento_id, total) values (2626, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2627, 'lote 585425', '2023-07-31', '2024-01-31', 131.3, 10, 10); 
insert into estoque_total (medicamento_id, total) values (2627, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2628, 'lote 361937', '2023-07-31', '2024-01-31', 262.6, 5, 5); 
insert into estoque_total (medicamento_id, total) values (2628, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2629, 'lote 577978', '2023-07-31', '2024-01-31', 68.6, 5, 5); 
insert into estoque_total (medicamento_id, total) values (2629, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2630, 'lote 488042', '2023-07-31', '2024-01-31', 137.3, 5, 5); 
insert into estoque_total (medicamento_id, total) values (2630, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2631, 'lote 217831', '2023-07-31', '2024-01-31', 206.0, 10, 10); 
insert into estoque_total (medicamento_id, total) values (2631, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2731, 'lote 965839', '2023-07-31', '2025-01-31', 11.8, 30, 30); 
insert into estoque_total (medicamento_id, total) values (2731, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2733, 'lote 104783', '2023-07-31', '2025-07-31', 35.8, 20, 20); 
insert into estoque_total (medicamento_id, total) values (2733, 20); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2761, 'lote 950099', '2023-07-31', '2025-07-31', 306.7, 6, 6); 
insert into estoque_total (medicamento_id, total) values (2761, 6); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2773, 'lote 268407', '2023-07-31', '2025-07-31', 27.9, 40, 40); 
insert into estoque_total (medicamento_id, total) values (2773, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2774, 'lote 417137', '2023-07-31', '2025-07-31', 55.8, 25, 25); 
insert into estoque_total (medicamento_id, total) values (2774, 25); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2775, 'lote 152511', '2023-07-31', '2025-07-31', 167.5, 10, 10); 
insert into estoque_total (medicamento_id, total) values (2775, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2776, 'lote 170857', '2023-07-31', '2025-07-31', 10.3, 90, 90); 
insert into estoque_total (medicamento_id, total) values (2776, 90); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2777, 'lote 575119', '2023-07-31', '2025-07-31', 20.6, 40, 40); 
insert into estoque_total (medicamento_id, total) values (2777, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2778, 'lote 877683', '2023-07-31', '2025-07-31', 61.8, 20, 20); 
insert into estoque_total (medicamento_id, total) values (2778, 20); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2779, 'lote 917847', '2023-07-31', '2025-01-31', 8.2, 80, 80); 
insert into estoque_total (medicamento_id, total) values (2779, 80); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2780, 'lote 703996', '2023-07-31', '2025-01-31', 8.9, 60, 60); 
insert into estoque_total (medicamento_id, total) values (2780, 60); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2781, 'lote 304089', '2023-07-31', '2025-01-31', 3.0, 110, 110); 
insert into estoque_total (medicamento_id, total) values (2781, 110); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2782, 'lote 237914', '2023-07-31', '2025-01-31', 2.9, 60, 60); 
insert into estoque_total (medicamento_id, total) values (2782, 60); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2783, 'lote 572920', '2023-07-31', '2025-01-31', 43.5, 25, 25); 
insert into estoque_total (medicamento_id, total) values (2783, 25); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2784, 'lote 866184', '2023-07-31', '2025-01-31', 8.6, 120, 120); 
insert into estoque_total (medicamento_id, total) values (2784, 120); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2785, 'lote 819528', '2023-07-31', '2025-01-31', 76.2, 20, 20); 
insert into estoque_total (medicamento_id, total) values (2785, 20); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2786, 'lote 745337', '2023-07-31', '2025-01-31', 7.9, 40, 40); 
insert into estoque_total (medicamento_id, total) values (2786, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2788, 'lote 675998', '2023-07-31', '2025-01-31', 23.3, 20, 20); 
insert into estoque_total (medicamento_id, total) values (2788, 20); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2791, 'lote 548350', '2023-07-31', '2025-01-31', 2.5, 120, 120); 
insert into estoque_total (medicamento_id, total) values (2791, 120); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2792, 'lote 384194', '2023-07-31', '2025-01-31', 7.6, 120, 120); 
insert into estoque_total (medicamento_id, total) values (2792, 120); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (6805, 'lote 512141', '2023-07-31', '2024-07-31', 6.6, 50, 50); 
insert into estoque_total (medicamento_id, total) values (6805, 50); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (6806, 'lote 174814', '2023-07-31', '2024-07-31', 6.8, 110, 110); 
insert into estoque_total (medicamento_id, total) values (6806, 110); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9131, 'lote 607512', '2023-07-31', '2025-01-31', 11.0, 50, 50); 
insert into estoque_total (medicamento_id, total) values (9131, 50); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9132, 'lote 818130', '2023-07-31', '2025-01-31', 21.2, 30, 30); 
insert into estoque_total (medicamento_id, total) values (9132, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9133, 'lote 989199', '2023-07-31', '2025-01-31', 29.9, 40, 40); 
insert into estoque_total (medicamento_id, total) values (9133, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9134, 'lote 509243', '2023-07-31', '2025-01-31', 24.9, 40, 40); 
insert into estoque_total (medicamento_id, total) values (9134, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9142, 'lote 880356', '2023-07-31', '2025-01-31', 55.5, 5, 5); 
insert into estoque_total (medicamento_id, total) values (9142, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9143, 'lote 475503', '2023-07-31', '2025-01-31', 6.4, 110, 110); 
insert into estoque_total (medicamento_id, total) values (9143, 110); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9144, 'lote 298246', '2023-07-31', '2025-01-31', 18.5, 40, 40); 
insert into estoque_total (medicamento_id, total) values (9144, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9145, 'lote 694887', '2023-07-31', '2025-01-31', 55.5, 25, 25); 
insert into estoque_total (medicamento_id, total) values (9145, 25); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9146, 'lote 938535', '2023-07-31', '2025-01-31', 111.0, 10, 10); 
insert into estoque_total (medicamento_id, total) values (9146, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9168, 'lote 329337', '2023-07-31', '2025-01-31', 20.5, 20, 20); 
insert into estoque_total (medicamento_id, total) values (9168, 20); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9169, 'lote 539024', '2023-07-31', '2025-01-31', 61.5, 30, 30); 
insert into estoque_total (medicamento_id, total) values (9169, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9170, 'lote 622550', '2023-07-31', '2025-01-31', 123.0, 10, 10); 
insert into estoque_total (medicamento_id, total) values (9170, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9171, 'lote 604863', '2023-07-31', '2025-01-31', 184.5, 5, 5); 
insert into estoque_total (medicamento_id, total) values (9171, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9172, 'lote 988545', '2023-07-31', '2025-01-31', 61.4, 10, 10); 
insert into estoque_total (medicamento_id, total) values (9172, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9173, 'lote 180459', '2023-07-31', '2025-01-31', 122.9, 10, 10); 
insert into estoque_total (medicamento_id, total) values (9173, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9174, 'lote 644229', '2023-07-31', '2025-01-31', 245.9, 3, 3); 
insert into estoque_total (medicamento_id, total) values (9174, 3); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9179, 'lote 244889', '2023-07-31', '2025-01-31', 22.3, 40, 40); 
insert into estoque_total (medicamento_id, total) values (9179, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9180, 'lote 543828', '2023-07-31', '2025-01-31', 42.5, 10, 10); 
insert into estoque_total (medicamento_id, total) values (9180, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9181, 'lote 273433', '2023-07-31', '2025-01-31', 277.6, 6, 6); 
insert into estoque_total (medicamento_id, total) values (9181, 6); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9187, 'lote 603276', '2023-07-31', '2025-01-31', 30.7, 40, 40); 
insert into estoque_total (medicamento_id, total) values (9187, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9188, 'lote 913028', '2023-07-31', '2025-01-31', 23.0, 40, 40); 
insert into estoque_total (medicamento_id, total) values (9188, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9189, 'lote 882911', '2023-07-31', '2025-01-31', 45.6, 25, 25); 
insert into estoque_total (medicamento_id, total) values (9189, 25); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9197, 'lote 859067', '2023-07-31', '2025-01-31', 20.4, 30, 30); 
insert into estoque_total (medicamento_id, total) values (9197, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9198, 'lote 606013', '2023-07-31', '2025-01-31', 61.4, 30, 30); 
insert into estoque_total (medicamento_id, total) values (9198, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9199, 'lote 480030', '2023-07-31', '2025-01-31', 122.9, 5, 5); 
insert into estoque_total (medicamento_id, total) values (9199, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9200, 'lote 682641', '2023-07-31', '2025-01-31', 40.9, 10, 10); 
insert into estoque_total (medicamento_id, total) values (9200, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9201, 'lote 625861', '2023-07-31', '2025-01-31', 122.9, 10, 10); 
insert into estoque_total (medicamento_id, total) values (9201, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9202, 'lote 413719', '2023-07-31', '2025-01-31', 245.9, 3, 3); 
insert into estoque_total (medicamento_id, total) values (9202, 3); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9203, 'lote 347227', '2023-07-31', '2025-01-31', 245.8, 6, 6); 
insert into estoque_total (medicamento_id, total) values (9203, 6); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9208, 'lote 422712', '2023-07-31', '2025-01-31', 61.4, 20, 20); 
insert into estoque_total (medicamento_id, total) values (9208, 20); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9209, 'lote 316916', '2023-07-31', '2025-01-31', 122.9, 10, 10); 
insert into estoque_total (medicamento_id, total) values (9209, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9210, 'lote 313497', '2023-07-31', '2025-01-31', 20.4, 30, 30); 
insert into estoque_total (medicamento_id, total) values (9210, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9211, 'lote 496880', '2023-07-31', '2025-01-31', 61.4, 5, 5); 
insert into estoque_total (medicamento_id, total) values (9211, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9212, 'lote 816704', '2023-07-31', '2025-01-31', 122.9, 5, 5); 
insert into estoque_total (medicamento_id, total) values (9212, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9213, 'lote 138438', '2023-07-31', '2025-01-31', 184.4, 5, 5); 
insert into estoque_total (medicamento_id, total) values (9213, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9214, 'lote 267146', '2023-07-31', '2025-01-31', 61.4, 15, 15); 
insert into estoque_total (medicamento_id, total) values (9214, 15); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9215, 'lote 425952', '2023-07-31', '2025-01-31', 122.9, 10, 10); 
insert into estoque_total (medicamento_id, total) values (9215, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9216, 'lote 560718', '2023-07-31', '2025-01-31', 245.9, 6, 6); 
insert into estoque_total (medicamento_id, total) values (9216, 6); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9220, 'lote 844839', '2023-07-31', '2025-01-31', 23.0, 40, 40); 
insert into estoque_total (medicamento_id, total) values (9220, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9221, 'lote 569480', '2023-07-31', '2025-01-31', 45.6, 20, 20); 
insert into estoque_total (medicamento_id, total) values (9221, 20); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9222, 'lote 592119', '2023-07-31', '2025-01-31', 20.5, 30, 30); 
insert into estoque_total (medicamento_id, total) values (9222, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9223, 'lote 909227', '2023-07-31', '2025-01-31', 61.5, 30, 30); 
insert into estoque_total (medicamento_id, total) values (9223, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9224, 'lote 512746', '2023-07-31', '2025-01-31', 123.0, 5, 5); 
insert into estoque_total (medicamento_id, total) values (9224, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9225, 'lote 165878', '2023-07-31', '2025-01-31', 184.5, 10, 10); 
insert into estoque_total (medicamento_id, total) values (9225, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9226, 'lote 743358', '2023-07-31', '2025-01-31', 61.4, 10, 10); 
insert into estoque_total (medicamento_id, total) values (9226, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9227, 'lote 811575', '2023-07-31', '2025-01-31', 122.9, 5, 5); 
insert into estoque_total (medicamento_id, total) values (9227, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9228, 'lote 893230', '2023-07-31', '2025-01-31', 245.9, 6, 6); 
insert into estoque_total (medicamento_id, total) values (9228, 6); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9229, 'lote 809195', '2023-07-31', '2025-01-31', 20.4, 20, 20); 
insert into estoque_total (medicamento_id, total) values (9229, 20); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9230, 'lote 692349', '2023-07-31', '2025-01-31', 61.3, 15, 15); 
insert into estoque_total (medicamento_id, total) values (9230, 15); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9231, 'lote 629543', '2023-07-31', '2025-01-31', 122.6, 5, 5); 
insert into estoque_total (medicamento_id, total) values (9231, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9232, 'lote 154547', '2023-07-31', '2025-01-31', 183.9, 5, 5); 
insert into estoque_total (medicamento_id, total) values (9232, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9233, 'lote 942190', '2023-07-31', '2025-01-31', 245.2, 6, 6); 
insert into estoque_total (medicamento_id, total) values (9233, 6); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9234, 'lote 635600', '2023-07-31', '2025-01-31', 204.3, 10, 10); 
insert into estoque_total (medicamento_id, total) values (9234, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9235, 'lote 997016', '2023-07-31', '2025-01-31', 35.0, 30, 30); 
insert into estoque_total (medicamento_id, total) values (9235, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9236, 'lote 874045', '2023-07-31', '2025-01-31', 239.3, 6, 6); 
insert into estoque_total (medicamento_id, total) values (9236, 6); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9237, 'lote 867974', '2023-07-31', '2025-01-31', 274.4, 6, 6); 
insert into estoque_total (medicamento_id, total) values (9237, 6); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9245, 'lote 251644', '2023-07-31', '2025-01-31', 23.0, 20, 20); 
insert into estoque_total (medicamento_id, total) values (9245, 20); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9246, 'lote 534588', '2023-07-31', '2025-01-31', 45.6, 15, 15); 
insert into estoque_total (medicamento_id, total) values (9246, 15); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9247, 'lote 457432', '2023-07-31', '2025-01-31', 20.5, 20, 20); 
insert into estoque_total (medicamento_id, total) values (9247, 20); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9248, 'lote 857154', '2023-07-31', '2025-01-31', 39.1, 30, 30); 
insert into estoque_total (medicamento_id, total) values (9248, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10121, 'lote 665785', '2023-07-31', '2025-01-31', 33.4, 30, 30); 
insert into estoque_total (medicamento_id, total) values (10121, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10122, 'lote 557549', '2023-07-31', '2025-01-31', 7.5, 40, 40); 
insert into estoque_total (medicamento_id, total) values (10122, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10123, 'lote 189233', '2023-07-31', '2025-01-31', 4.6, 40, 40); 
insert into estoque_total (medicamento_id, total) values (10123, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10124, 'lote 927009', '2023-07-31', '2025-01-31', 8.7, 70, 70); 
insert into estoque_total (medicamento_id, total) values (10124, 70); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10125, 'lote 428515', '2023-07-31', '2025-01-31', 16.9, 40, 40); 
insert into estoque_total (medicamento_id, total) values (10125, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10126, 'lote 692543', '2023-07-31', '2025-01-31', 10.8, 60, 60); 
insert into estoque_total (medicamento_id, total) values (10126, 60); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10129, 'lote 846253', '2023-07-31', '2025-01-31', 81.9, 15, 15); 
insert into estoque_total (medicamento_id, total) values (10129, 15); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10130, 'lote 281844', '2023-07-31', '2025-01-31', 13.7, 50, 50); 
insert into estoque_total (medicamento_id, total) values (10130, 50); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10131, 'lote 194275', '2023-07-31', '2025-01-31', 4.0, 90, 90); 
insert into estoque_total (medicamento_id, total) values (10131, 90); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10132, 'lote 924406', '2023-07-31', '2025-01-31', 7.5, 120, 120); 
insert into estoque_total (medicamento_id, total) values (10132, 120); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10135, 'lote 386951', '2023-07-31', '2025-01-31', 35.5, 15, 15); 
insert into estoque_total (medicamento_id, total) values (10135, 15); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10136, 'lote 775382', '2023-07-31', '2025-01-31', 3.2, 90, 90); 
insert into estoque_total (medicamento_id, total) values (10136, 90); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10138, 'lote 666675', '2023-07-31', '2025-01-31', 27.7, 20, 20); 
insert into estoque_total (medicamento_id, total) values (10138, 20); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10144, 'lote 405270', '2023-07-31', '2025-01-31', 10.9, 80, 80); 
insert into estoque_total (medicamento_id, total) values (10144, 80); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10145, 'lote 681308', '2023-07-31', '2025-01-31', 13.0, 100, 100); 
insert into estoque_total (medicamento_id, total) values (10145, 100); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10146, 'lote 840361', '2023-07-31', '2025-01-31', 27.2, 30, 30); 
insert into estoque_total (medicamento_id, total) values (10146, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10147, 'lote 609740', '2023-07-31', '2025-01-31', 10.2, 100, 100); 
insert into estoque_total (medicamento_id, total) values (10147, 100); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10151, 'lote 841110', '2023-07-31', '2025-01-31', 61.5, 30, 30); 
insert into estoque_total (medicamento_id, total) values (10151, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10152, 'lote 772381', '2023-07-31', '2025-01-31', 68.0, 15, 15); 
insert into estoque_total (medicamento_id, total) values (10152, 15); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10153, 'lote 474454', '2023-07-31', '2025-01-31', 5.4, 110, 110); 
insert into estoque_total (medicamento_id, total) values (10153, 110); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10154, 'lote 256516', '2023-07-31', '2025-01-31', 9.0, 70, 70); 
insert into estoque_total (medicamento_id, total) values (10154, 70); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10155, 'lote 774290', '2023-07-31', '2025-01-31', 10.9, 90, 90); 
insert into estoque_total (medicamento_id, total) values (10155, 90); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10156, 'lote 510891', '2023-07-31', '2025-01-31', 13.6, 110, 110); 
insert into estoque_total (medicamento_id, total) values (10156, 110); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10157, 'lote 487476', '2023-07-31', '2025-01-31', 18.1, 40, 40); 
insert into estoque_total (medicamento_id, total) values (10157, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10158, 'lote 601094', '2023-07-31', '2025-01-31', 10.9, 80, 80); 
insert into estoque_total (medicamento_id, total) values (10158, 80); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10159, 'lote 988413', '2023-07-31', '2025-01-31', 10.8, 100, 100); 
insert into estoque_total (medicamento_id, total) values (10159, 100); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10160, 'lote 181914', '2023-07-31', '2025-01-31', 23.3, 30, 30); 
insert into estoque_total (medicamento_id, total) values (10160, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10163, 'lote 500577', '2023-07-31', '2025-01-31', 3.2, 50, 50); 
insert into estoque_total (medicamento_id, total) values (10163, 50); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10165, 'lote 484683', '2023-07-31', '2025-01-31', 10.2, 80, 80); 
insert into estoque_total (medicamento_id, total) values (10165, 80); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10166, 'lote 916199', '2023-07-31', '2025-01-31', 337.4, 6, 6); 
insert into estoque_total (medicamento_id, total) values (10166, 6); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10171, 'lote 747920', '2023-07-31', '2025-01-31', 7.3, 50, 50); 
insert into estoque_total (medicamento_id, total) values (10171, 50); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10172, 'lote 207013', '2023-07-31', '2025-01-31', 13.7, 90, 90); 
insert into estoque_total (medicamento_id, total) values (10172, 90); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10173, 'lote 436106', '2023-07-31', '2025-01-31', 213.0, 6, 6); 
insert into estoque_total (medicamento_id, total) values (10173, 6); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10174, 'lote 875347', '2023-07-31', '2025-01-31', 7.2, 60, 60); 
insert into estoque_total (medicamento_id, total) values (10174, 60); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10175, 'lote 808480', '2023-07-31', '2025-01-31', 11.7, 80, 80); 
insert into estoque_total (medicamento_id, total) values (10175, 80); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10176, 'lote 841446', '2023-07-31', '2025-01-31', 23.5, 40, 40); 
insert into estoque_total (medicamento_id, total) values (10176, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10177, 'lote 169301', '2023-07-31', '2025-01-31', 14.9, 30, 30); 
insert into estoque_total (medicamento_id, total) values (10177, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10178, 'lote 104213', '2023-07-31', '2025-01-31', 28.7, 40, 40); 
insert into estoque_total (medicamento_id, total) values (10178, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10179, 'lote 211350', '2023-07-31', '2025-01-31', 92.9, 25, 25); 
insert into estoque_total (medicamento_id, total) values (10179, 25); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10180, 'lote 359373', '2023-07-31', '2025-01-31', 39.0, 5, 5); 
insert into estoque_total (medicamento_id, total) values (10180, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10181, 'lote 864368', '2023-07-31', '2025-01-31', 260.9, 3, 3); 
insert into estoque_total (medicamento_id, total) values (10181, 3); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10182, 'lote 162862', '2023-07-31', '2025-01-31', 173.9, 10, 10); 
insert into estoque_total (medicamento_id, total) values (10182, 10); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10183, 'lote 536992', '2023-07-31', '2025-01-31', 278.3, 3, 3); 
insert into estoque_total (medicamento_id, total) values (10183, 3); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10184, 'lote 838229', '2023-07-31', '2025-01-31', 17.7, 40, 40); 
insert into estoque_total (medicamento_id, total) values (10184, 40); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10185, 'lote 913538', '2023-07-31', '2025-01-31', 42.6, 25, 25); 
insert into estoque_total (medicamento_id, total) values (10185, 25); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10186, 'lote 746604', '2023-07-31', '2025-01-31', 284.1, 3, 3); 
insert into estoque_total (medicamento_id, total) values (10186, 3); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10187, 'lote 133248', '2023-07-31', '2025-01-31', 319.6, 3, 3); 
insert into estoque_total (medicamento_id, total) values (10187, 3); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10188, 'lote 923334', '2023-07-31', '2025-01-31', 44.0, 5, 5); 
insert into estoque_total (medicamento_id, total) values (10188, 5); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10189, 'lote 494309', '2023-07-31', '2025-01-31', 88.1, 25, 25); 
insert into estoque_total (medicamento_id, total) values (10189, 25); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10190, 'lote 351900', '2023-07-31', '2025-01-31', 239.9, 6, 6); 
insert into estoque_total (medicamento_id, total) values (10190, 6); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10191, 'lote 235200', '2023-07-31', '2025-01-31', 313.4, 6, 6); 
insert into estoque_total (medicamento_id, total) values (10191, 6); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10192, 'lote 640247', '2023-07-31', '2025-01-31', 10.4, 70, 70); 
insert into estoque_total (medicamento_id, total) values (10192, 70); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10193, 'lote 481627', '2023-07-31', '2025-01-31', 7.9, 50, 50); 
insert into estoque_total (medicamento_id, total) values (10193, 50); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10194, 'lote 630922', '2023-07-31', '2025-01-31', 10.9, 30, 30); 
insert into estoque_total (medicamento_id, total) values (10194, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10195, 'lote 362239', '2023-07-31', '2025-01-31', 4.5, 120, 120); 
insert into estoque_total (medicamento_id, total) values (10195, 120); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10196, 'lote 877719', '2023-07-31', '2025-01-31', 8.8, 110, 110); 
insert into estoque_total (medicamento_id, total) values (10196, 110); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10197, 'lote 302527', '2023-07-31', '2025-01-31', 8.5, 80, 80); 
insert into estoque_total (medicamento_id, total) values (10197, 80); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (19779, 'lote 483926', '2023-07-31', '2025-01-31', 3.5, 30, 30); 
insert into estoque_total (medicamento_id, total) values (19779, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (19780, 'lote 291567', '2023-07-31', '2025-01-31', 7.6, 30, 30); 
insert into estoque_total (medicamento_id, total) values (19780, 30); 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10191, 'lote 792866', '2023-08-02', '2025-02-28', 313.4, 3, 3); 
update estoque_total set total = total - 3 where medicamento_id = 10191; 

-- vendas, itens de venda
insert into venda (cliente_id, profissional_id, time_stamp, total) values (15, 21, '2023-08-02', 864.87); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (1, 10191, 209, 1, 36.00, 864.87); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 209; 
update estoque_total set total = total - 1 where medicamento_id = 10191; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2630, 'lote 711207', '2023-08-02', '2024-02-29', 137.3, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 2630; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10181, 'lote 443618', '2023-08-02', '2025-02-28', 260.9, 3, 3); 
update estoque_total set total = total - 3 where medicamento_id = 10181; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (6, 22, '2023-08-02', 1505.97); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (2, 2630, 75, 3, 117.20, 784.99); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 75; 
update estoque_total set total = total - 3 where medicamento_id = 2630; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (2, 10181, 199, 1, 89.90, 660.04); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 199; 
update estoque_total set total = total - 1 where medicamento_id = 10181; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (2, 10158, 183, 2, 1.80, 60.94); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 183; 
update estoque_total set total = total - 2 where medicamento_id = 10158; 
insert into venda (cliente_id, time_stamp, total) values (13, '2023-08-03', 61.51); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (3, 9134, 102, 1, 5.30, 61.51); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 102; 
update estoque_total set total = total - 1 where medicamento_id = 9134; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (342, 'lote 398273', '2023-08-03', '2025-08-31', 204.9, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 342; 
insert into venda (time_stamp, total) values ('2023-08-03', 1356.23); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (4, 1867, 44, 3, 1.30, 66.56); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 44; 
update estoque_total set total = total - 3 where medicamento_id = 1867; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (4, 355, 9, 2, 0.00, 47.16); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 9; 
update estoque_total set total = total - 2 where medicamento_id = 355; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (4, 342, 5, 3, 0.00, 1242.51); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 5; 
update estoque_total set total = total - 3 where medicamento_id = 342; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (7, 22, '2023-08-05', 120.34); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (5, 10176, 194, 2, 14.80, 120.34); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 194; 
update estoque_total set total = total - 2 where medicamento_id = 10176; 
insert into venda (profissional_id, time_stamp, total) values (24, '2023-08-06', 15.29); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (6, 10153, 178, 1, 0.40, 15.29); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 178; 
update estoque_total set total = total - 1 where medicamento_id = 10153; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (358, 'lote 684841', '2023-08-07', '2025-08-31', 209.4, 10, 10); 
update estoque_total set total = total - 10 where medicamento_id = 358; 
insert into venda (cliente_id, time_stamp, total) values (1, '2023-08-07', 804.30); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (7, 1849, 35, 3, 1.40, 48.19); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 35; 
update estoque_total set total = total - 3 where medicamento_id = 1849; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (7, 358, 12, 2, 101.50, 745.16); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 12; 
update estoque_total set total = total - 2 where medicamento_id = 358; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (7, 1510, 22, 1, 0.60, 10.95); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 22; 
update estoque_total set total = total - 1 where medicamento_id = 1510; 
insert into venda (cliente_id, time_stamp, total) values (13, '2023-08-08', 40.14); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (8, 2780, 87, 2, 9.30, 40.14); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 87; 
update estoque_total set total = total - 2 where medicamento_id = 2780; 
insert into venda (time_stamp, total) values ('2023-08-08', 44.70); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (9, 2779, 86, 2, 0.90, 44.70); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 86; 
update estoque_total set total = total - 2 where medicamento_id = 2779; 
insert into venda (cliente_id, time_stamp, total) values (2, '2023-08-08', 131.54); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (10, 9133, 101, 2, 28.80, 131.54); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 101; 
update estoque_total set total = total - 2 where medicamento_id = 9133; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (1, 25, '2023-08-08', 376.17); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (11, 10185, 203, 3, 51.40, 316.07); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 203; 
update estoque_total set total = total - 3 where medicamento_id = 10185; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (11, 90, 1, 1, 3.10, 36.58); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 1; 
update estoque_total set total = total - 1 where medicamento_id = 90; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (11, 10131, 167, 2, 0.00, 23.52); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 167; 
update estoque_total set total = total - 2 where medicamento_id = 10131; 
insert into venda (cliente_id, time_stamp, total) values (2, '2023-08-09', 88.14); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (12, 1863, 40, 2, 0.00, 34.28); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 40; 
update estoque_total set total = total - 2 where medicamento_id = 1863; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (12, 9222, 139, 1, 1.00, 53.86); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 139; 
update estoque_total set total = total - 1 where medicamento_id = 9222; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10188, 'lote 539835', '2023-08-09', '2025-02-28', 44.0, 15, 15); 
update estoque_total set total = total - 15 where medicamento_id = 10188; 
insert into venda (profissional_id, time_stamp, total) values (25, '2023-08-09', 372.59); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (13, 10188, 206, 3, 7.60, 372.59); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 206; 
update estoque_total set total = total - 3 where medicamento_id = 10188; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (342, 'lote 350652', '2023-08-09', '2025-08-31', 204.9, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 342; 
insert into venda (time_stamp, total) values ('2023-08-09', 480.89); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (14, 342, 5, 1, 4.10, 410.07); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 5; 
update estoque_total set total = total - 1 where medicamento_id = 342; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (14, 340, 3, 3, 0.70, 70.82); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 3; 
update estoque_total set total = total - 3 where medicamento_id = 340; 
insert into venda (time_stamp, total) values ('2023-08-10', 674.49); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (15, 1848, 34, 2, 0.00, 27.78); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 34; 
update estoque_total set total = total - 2 where medicamento_id = 1848; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (15, 2785, 92, 3, 0.00, 630.63); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 92; 
update estoque_total set total = total - 3 where medicamento_id = 2785; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (15, 2782, 89, 2, 0.00, 16.08); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 89; 
update estoque_total set total = total - 2 where medicamento_id = 2782; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10181, 'lote 711812', '2023-08-10', '2025-02-28', 260.9, 3, 3); 
update estoque_total set total = total - 3 where medicamento_id = 10181; 
insert into venda (profissional_id, time_stamp, total) values (25, '2023-08-10', 1322.02); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (16, 10181, 199, 1, 22.40, 727.54); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 199; 
update estoque_total set total = total - 1 where medicamento_id = 10181; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (16, 9146, 107, 2, 0.00, 594.48); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 107; 
update estoque_total set total = total - 2 where medicamento_id = 9146; 
insert into venda (time_stamp, total) values ('2023-08-10', 209.18); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (17, 1531, 23, 3, 6.40, 209.18); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 23; 
update estoque_total set total = total - 3 where medicamento_id = 1531; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2366, 'lote 206158', '2023-08-11', '2025-08-31', 41.8, 25, 25); 
update estoque_total set total = total - 25 where medicamento_id = 2366; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9213, 'lote 636268', '2023-08-11', '2025-02-28', 184.4, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 9213; 
insert into venda (profissional_id, time_stamp, total) values (25, '2023-08-11', 1580.43); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (18, 2366, 58, 1, 1.00, 103.55); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 58; 
update estoque_total set total = total - 1 where medicamento_id = 2366; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (18, 9213, 133, 3, 29.60, 1451.20); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 133; 
update estoque_total set total = total - 3 where medicamento_id = 9213; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (18, 10195, 213, 2, 0.20, 25.68); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 213; 
update estoque_total set total = total - 2 where medicamento_id = 10195; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1866, 'lote 872536', '2023-08-11', '2025-08-31', 257.4, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 1866; 
insert into venda (time_stamp, total) values ('2023-08-11', 1499.01); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (19, 1866, 43, 3, 62.40, 1499.01); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 43; 
update estoque_total set total = total - 3 where medicamento_id = 1866; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (10, 23, '2023-08-11', 235.93); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (20, 10196, 214, 2, 2.00, 48.70); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 214; 
update estoque_total set total = total - 2 where medicamento_id = 10196; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (20, 2733, 78, 3, 7.80, 187.23); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 78; 
update estoque_total set total = total - 3 where medicamento_id = 2733; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (358, 'lote 170040', '2023-08-12', '2025-08-31', 209.4, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 358; 
insert into venda (cliente_id, time_stamp, total) values (11, '2023-08-12', 1041.49); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (21, 358, 12, 3, 228.50, 1041.49); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 12; 
update estoque_total set total = total - 3 where medicamento_id = 358; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9236, 'lote 988518', '2023-08-12', '2025-02-28', 239.3, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 9236; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (15, 22, '2023-08-12', 2055.83); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (22, 9236, 153, 3, 345.80, 1575.82); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 153; 
update estoque_total set total = total - 3 where medicamento_id = 9236; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (22, 10182, 200, 1, 19.90, 480.01); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 200; 
update estoque_total set total = total - 1 where medicamento_id = 10182; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2626, 'lote 292577', '2023-08-12', '2024-02-29', 240.2, 10, 10); 
update estoque_total set total = total - 10 where medicamento_id = 2626; 
insert into venda (profissional_id, time_stamp, total) values (25, '2023-08-12', 1710.30); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (23, 2626, 71, 3, 0.00, 1662.24); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 71; 
update estoque_total set total = total - 3 where medicamento_id = 2626; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (23, 1862, 39, 2, 0.90, 48.06); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 39; 
update estoque_total set total = total - 2 where medicamento_id = 1862; 
insert into venda (profissional_id, time_stamp, total) values (21, '2023-08-12', 988.48); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (24, 2623, 69, 3, 8.30, 822.79); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 69; 
update estoque_total set total = total - 3 where medicamento_id = 2623; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (24, 9132, 100, 3, 5.10, 165.69); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 100; 
update estoque_total set total = total - 3 where medicamento_id = 9132; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10188, 'lote 289327', '2023-08-13', '2025-02-28', 44.0, 20, 20); 
update estoque_total set total = total - 20 where medicamento_id = 10188; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (8, 21, '2023-08-13', 210.46); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (25, 10188, 206, 2, 43.00, 210.46); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 206; 
update estoque_total set total = total - 2 where medicamento_id = 10188; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1866, 'lote 777462', '2023-08-14', '2025-08-31', 257.4, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 1866; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2761, 'lote 632463', '2023-08-14', '2025-08-31', 306.7, 3, 3); 
update estoque_total set total = total - 3 where medicamento_id = 2761; 
insert into venda (profissional_id, time_stamp, total) values (22, '2023-08-14', 3047.13); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (26, 10146, 174, 1, 3.10, 75.09); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 174; 
update estoque_total set total = total - 1 where medicamento_id = 10146; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (26, 1866, 43, 2, 0.00, 1040.94); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 43; 
update estoque_total set total = total - 2 where medicamento_id = 1866; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (26, 2761, 79, 3, 0.00, 1931.10); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 79; 
update estoque_total set total = total - 3 where medicamento_id = 2761; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9211, 'lote 225265', '2023-08-14', '2025-02-28', 61.4, 15, 15); 
update estoque_total set total = total - 15 where medicamento_id = 9211; 
insert into venda (cliente_id, time_stamp, total) values (10, '2023-08-14', 163.63); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (27, 351, 6, 1, 3.20, 13.89); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 6; 
update estoque_total set total = total - 1 where medicamento_id = 351; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (27, 9211, 131, 1, 14.80, 149.74); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 131; 
update estoque_total set total = total - 1 where medicamento_id = 9211; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2761, 'lote 351711', '2023-08-14', '2025-08-31', 306.7, 3, 3); 
update estoque_total set total = total - 3 where medicamento_id = 2761; 
insert into venda (cliente_id, time_stamp, total) values (19, '2023-08-14', 2567.28); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (28, 2364, 56, 2, 0.00, 29.14); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 56; 
update estoque_total set total = total - 2 where medicamento_id = 2364; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (28, 9209, 129, 3, 167.80, 819.44); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 129; 
update estoque_total set total = total - 3 where medicamento_id = 9209; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (28, 2761, 234, 3, 212.40, 1718.70); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 234; 
update estoque_total set total = total - 3 where medicamento_id = 2761; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (3, 24, '2023-08-14', 110.74); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (29, 90, 1, 3, 8.30, 110.74); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 1; 
update estoque_total set total = total - 3 where medicamento_id = 90; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9199, 'lote 463678', '2023-08-15', '2025-02-28', 122.9, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 9199; 
insert into venda (time_stamp, total) values ('2023-08-15', 1138.31); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (30, 9208, 128, 3, 0.00, 493.65); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 128; 
update estoque_total set total = total - 3 where medicamento_id = 9208; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (30, 9199, 123, 2, 13.10, 644.66); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 123; 
update estoque_total set total = total - 2 where medicamento_id = 9199; 
insert into venda (cliente_id, time_stamp, total) values (12, '2023-08-15', 111.80); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (31, 1868, 45, 2, 3.90, 28.74); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 45; 
update estoque_total set total = total - 2 where medicamento_id = 1868; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (31, 1867, 44, 3, 2.00, 65.86); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 44; 
update estoque_total set total = total - 3 where medicamento_id = 1867; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (31, 354, 8, 1, 0.10, 17.20); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 8; 
update estoque_total set total = total - 1 where medicamento_id = 354; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (342, 'lote 270729', '2023-08-16', '2025-09-30', 204.9, 10, 10); 
update estoque_total set total = total - 10 where medicamento_id = 342; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2629, 'lote 855917', '2023-08-16', '2024-02-29', 68.6, 15, 15); 
update estoque_total set total = total - 15 where medicamento_id = 2629; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (4, 25, '2023-08-16', 790.36); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (32, 1840, 31, 3, 4.30, 67.97); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 31; 
update estoque_total set total = total - 3 where medicamento_id = 1840; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (32, 342, 224, 1, 66.20, 347.97); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 224; 
update estoque_total set total = total - 1 where medicamento_id = 342; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (32, 2629, 74, 3, 76.60, 374.42); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 74; 
update estoque_total set total = total - 3 where medicamento_id = 2629; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1866, 'lote 363203', '2023-08-16', '2025-09-30', 257.4, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 1866; 
insert into venda (profissional_id, time_stamp, total) values (21, '2023-08-16', 874.55); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (33, 9200, 124, 2, 0.00, 219.34); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 124; 
update estoque_total set total = total - 2 where medicamento_id = 9200; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (33, 2629, 239, 1, 0.00, 150.34); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 239; 
update estoque_total set total = total - 1 where medicamento_id = 2629; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (33, 1866, 233, 1, 15.60, 504.87); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 233; 
update estoque_total set total = total - 1 where medicamento_id = 1866; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (9, 21, '2023-08-17', 117.92); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (34, 2784, 91, 3, 9.90, 61.38); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 91; 
update estoque_total set total = total - 3 where medicamento_id = 2784; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (34, 10158, 183, 2, 6.20, 56.54); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 183; 
update estoque_total set total = total - 2 where medicamento_id = 10158; 
insert into venda (profissional_id, time_stamp, total) values (22, '2023-08-17', 113.98); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (35, 531, 13, 2, 0.60, 60.78); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 13; 
update estoque_total set total = total - 2 where medicamento_id = 531; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (35, 1673, 28, 2, 0.00, 53.20); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 28; 
update estoque_total set total = total - 2 where medicamento_id = 1673; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2630, 'lote 399457', '2023-08-17', '2024-03-31', 137.3, 10, 10); 
update estoque_total set total = total - 10 where medicamento_id = 2630; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (19, 24, '2023-08-17', 677.29); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (36, 10188, 223, 1, 8.80, 117.93); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 223; 
update estoque_total set total = total - 1 where medicamento_id = 10188; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (36, 2630, 219, 2, 42.10, 559.36); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 219; 
update estoque_total set total = total - 2 where medicamento_id = 2630; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (597, 'lote 966731', '2023-08-18', '2024-08-31', 143.9, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 597; 
insert into venda (cliente_id, time_stamp, total) values (7, '2023-08-18', 513.66); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (37, 9223, 140, 1, 0.00, 164.58); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 140; 
update estoque_total set total = total - 1 where medicamento_id = 9223; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (37, 597, 18, 1, 26.20, 349.08); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 18; 
update estoque_total set total = total - 1 where medicamento_id = 597; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (13, 23, '2023-08-18', 216.84); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (38, 9197, 121, 1, 6.50, 48.32); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 121; 
update estoque_total set total = total - 1 where medicamento_id = 9197; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (38, 10157, 182, 2, 9.40, 95.18); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 182; 
update estoque_total set total = total - 2 where medicamento_id = 10157; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (38, 9187, 118, 1, 9.00, 73.34); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 118; 
update estoque_total set total = total - 1 where medicamento_id = 9187; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10180, 'lote 503608', '2023-08-19', '2025-02-28', 39.0, 10, 10); 
update estoque_total set total = total - 10 where medicamento_id = 10180; 
insert into venda (profissional_id, time_stamp, total) values (21, '2023-08-19', 326.30); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (39, 10180, 198, 3, 10.00, 326.30); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 198; 
update estoque_total set total = total - 3 where medicamento_id = 10180; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10186, 'lote 469775', '2023-08-19', '2025-02-28', 284.1, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 10186; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (12, 22, '2023-08-19', 1502.60); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (40, 10186, 204, 2, 130.60, 1502.60); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 204; 
update estoque_total set total = total - 2 where medicamento_id = 10186; 
insert into venda (profissional_id, time_stamp, total) values (24, '2023-08-19', 122.66); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (41, 10136, 170, 2, 0.30, 18.40); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 170; 
update estoque_total set total = total - 2 where medicamento_id = 10136; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (41, 10165, 187, 3, 0.80, 87.22); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 187; 
update estoque_total set total = total - 3 where medicamento_id = 10165; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (41, 1016, 19, 2, 0.10, 17.04); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 19; 
update estoque_total set total = total - 2 where medicamento_id = 1016; 
insert into venda (time_stamp, total) values ('2023-08-19', 179.86); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (42, 9208, 128, 1, 3.20, 161.35); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 128; 
update estoque_total set total = total - 1 where medicamento_id = 9208; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (42, 6805, 97, 1, 0.70, 18.51); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 97; 
update estoque_total set total = total - 1 where medicamento_id = 6805; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (18, 24, '2023-08-21', 1094.56); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (43, 9234, 151, 2, 131.20, 962.46); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 151; 
update estoque_total set total = total - 2 where medicamento_id = 9234; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (43, 10144, 172, 3, 17.80, 76.34); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 172; 
update estoque_total set total = total - 3 where medicamento_id = 10144; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (43, 10159, 184, 2, 6.80, 55.76); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 184; 
update estoque_total set total = total - 2 where medicamento_id = 10159; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2620, 'lote 824432', '2023-08-22', '2024-02-29', 329.0, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 2620; 
insert into venda (profissional_id, time_stamp, total) values (24, '2023-08-22', 2331.25); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (44, 10130, 166, 2, 2.30, 76.92); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 166; 
update estoque_total set total = total - 2 where medicamento_id = 10130; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (44, 2620, 66, 3, 22.70, 2254.33); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 66; 
update estoque_total set total = total - 3 where medicamento_id = 2620; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (7, 21, '2023-08-22', 84.89); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (45, 10174, 192, 3, 3.10, 59.12); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 192; 
update estoque_total set total = total - 3 where medicamento_id = 10174; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (45, 10155, 180, 1, 5.60, 25.77); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 180; 
update estoque_total set total = total - 1 where medicamento_id = 10155; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (2, 25, '2023-08-22', 137.64); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (46, 1872, 47, 2, 0.70, 35.56); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 47; 
update estoque_total set total = total - 2 where medicamento_id = 1872; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (46, 10135, 169, 1, 0.00, 102.08); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 169; 
update estoque_total set total = total - 1 where medicamento_id = 10135; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10186, 'lote 742374', '2023-08-23', '2025-03-31', 284.1, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 10186; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (2, 24, '2023-08-23', 1571.16); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (47, 10186, 244, 2, 81.60, 1551.60); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 244; 
update estoque_total set total = total - 2 where medicamento_id = 10186; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (47, 2792, 96, 1, 1.40, 19.56); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 96; 
update estoque_total set total = total - 1 where medicamento_id = 2792; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (4, 21, '2023-08-23', 65.86); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (48, 10174, 192, 2, 5.80, 35.68); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 192; 
update estoque_total set total = total - 2 where medicamento_id = 10174; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (48, 1861, 38, 2, 4.40, 30.18); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 38; 
update estoque_total set total = total - 2 where medicamento_id = 1861; 
insert into venda (profissional_id, time_stamp, total) values (22, '2023-08-24', 106.76); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (49, 2777, 84, 2, 3.20, 106.76); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 84; 
update estoque_total set total = total - 2 where medicamento_id = 2777; 
insert into venda (cliente_id, time_stamp, total) values (14, '2023-08-24', 56.21); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (50, 9134, 102, 1, 10.60, 56.21); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 102; 
update estoque_total set total = total - 1 where medicamento_id = 9134; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2620, 'lote 553751', '2023-08-24', '2024-02-29', 329.0, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 2620; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9232, 'lote 261955', '2023-08-24', '2025-02-28', 183.9, 10, 10); 
update estoque_total set total = total - 10 where medicamento_id = 9232; 
insert into venda (profissional_id, time_stamp, total) values (22, '2023-08-24', 1246.27); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (51, 2620, 66, 1, 0.00, 759.01); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 66; 
update estoque_total set total = total - 1 where medicamento_id = 2620; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (51, 9232, 149, 1, 4.90, 487.26); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 149; 
update estoque_total set total = total - 1 where medicamento_id = 9232; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (17, 24, '2023-08-25', 139.26); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (52, 9144, 105, 2, 14.80, 84.26); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 105; 
update estoque_total set total = total - 2 where medicamento_id = 9144; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (52, 351, 6, 2, 0.60, 33.58); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 6; 
update estoque_total set total = total - 2 where medicamento_id = 351; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (52, 10131, 167, 2, 2.10, 21.42); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 167; 
update estoque_total set total = total - 2 where medicamento_id = 10131; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (17, 23, '2023-08-25', 235.24); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (53, 10179, 197, 1, 32.00, 235.24); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 197; 
update estoque_total set total = total - 1 where medicamento_id = 10179; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9199, 'lote 731847', '2023-08-26', '2025-03-31', 122.9, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 9199; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9216, 'lote 383637', '2023-08-26', '2025-02-28', 245.9, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 9216; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (13, 25, '2023-08-26', 1844.30); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (54, 2623, 69, 3, 157.90, 673.19); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 69; 
update estoque_total set total = total - 3 where medicamento_id = 2623; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (54, 9199, 237, 2, 78.90, 578.86); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 237; 
update estoque_total set total = total - 2 where medicamento_id = 9199; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (54, 9216, 136, 1, 65.80, 592.25); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 136; 
update estoque_total set total = total - 1 where medicamento_id = 9216; 
insert into venda (time_stamp, total) values ('2023-08-27', 28.94); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (55, 2367, 59, 2, 0.20, 28.94); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 59; 
update estoque_total set total = total - 2 where medicamento_id = 2367; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2622, 'lote 341998', '2023-08-27', '2024-02-29', 224.4, 10, 10); 
update estoque_total set total = total - 10 where medicamento_id = 2622; 
insert into venda (profissional_id, time_stamp, total) values (25, '2023-08-27', 512.93); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (56, 2622, 68, 1, 5.10, 512.93); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 68; 
update estoque_total set total = total - 1 where medicamento_id = 2622; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (7, 25, '2023-08-28', 75.70); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (57, 10175, 193, 2, 12.10, 55.48); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 193; 
update estoque_total set total = total - 2 where medicamento_id = 10175; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (57, 1867, 44, 1, 2.40, 20.22); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 44; 
update estoque_total set total = total - 1 where medicamento_id = 1867; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10181, 'lote 599589', '2023-08-28', '2025-02-28', 260.9, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 10181; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (11, 21, '2023-08-28', 954.97); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (58, 91, 2, 2, 29.70, 135.82); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 2; 
update estoque_total set total = total - 2 where medicamento_id = 91; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (58, 10181, 199, 1, 127.40, 622.54); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 199; 
update estoque_total set total = total - 1 where medicamento_id = 10181; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (58, 561, 16, 3, 46.00, 196.61); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 16; 
update estoque_total set total = total - 3 where medicamento_id = 561; 
insert into venda (cliente_id, time_stamp, total) values (2, '2023-08-28', 111.03); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (59, 1842, 33, 3, 5.70, 66.57); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 33; 
update estoque_total set total = total - 3 where medicamento_id = 1842; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (59, 9168, 108, 1, 10.40, 44.46); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 108; 
update estoque_total set total = total - 1 where medicamento_id = 9168; 
insert into venda (time_stamp, total) values ('2023-08-29', 164.01); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (60, 9229, 146, 3, 0.00, 164.01); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 146; 
update estoque_total set total = total - 3 where medicamento_id = 9229; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10181, 'lote 960606', '2023-08-30', '2025-03-31', 260.9, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 10181; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (6, 24, '2023-08-30', 2043.08); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (61, 10181, 225, 3, 247.40, 2002.42); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 225; 
update estoque_total set total = total - 3 where medicamento_id = 10181; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (61, 1868, 45, 3, 8.30, 40.66); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 45; 
update estoque_total set total = total - 3 where medicamento_id = 1868; 
insert into venda (time_stamp, total) values ('2023-08-30', 86.33); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (62, 2782, 89, 3, 0.20, 23.92); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 89; 
update estoque_total set total = total - 3 where medicamento_id = 2782; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (62, 2733, 78, 1, 2.60, 62.41); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 78; 
update estoque_total set total = total - 1 where medicamento_id = 2733; 
insert into venda (cliente_id, time_stamp, total) values (18, '2023-08-31', 39.41); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (63, 2367, 59, 3, 4.30, 39.41); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 59; 
update estoque_total set total = total - 3 where medicamento_id = 2367; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (597, 'lote 429234', '2023-09-01', '2024-09-30', 143.8, 10, 10); 
update estoque_total set total = total - 10 where medicamento_id = 597; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (17, 21, '2023-09-01', 413.94); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (64, 597, 242, 1, 37.50, 337.78); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 242; 
update estoque_total set total = total - 1 where medicamento_id = 597; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (64, 91, 2, 1, 6.60, 76.16); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 2; 
update estoque_total set total = total - 1 where medicamento_id = 91; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (20, 21, '2023-09-01', 327.17); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (65, 10175, 193, 1, 1.30, 32.49); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 193; 
update estoque_total set total = total - 1 where medicamento_id = 10175; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (65, 2629, 239, 2, 6.00, 294.68); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 239; 
update estoque_total set total = total - 2 where medicamento_id = 2629; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2761, 'lote 414921', '2023-09-03', '2025-09-30', 306.7, 3, 3); 
update estoque_total set total = total - 3 where medicamento_id = 2761; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (14, 22, '2023-09-03', 1857.48); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (66, 10197, 215, 3, 12.50, 61.48); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 215; 
update estoque_total set total = total - 3 where medicamento_id = 10197; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (66, 2761, 79, 3, 135.10, 1796.00); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 79; 
update estoque_total set total = total - 3 where medicamento_id = 2761; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10180, 'lote 801715', '2023-09-03', '2025-03-31', 39.0, 20, 20); 
update estoque_total set total = total - 20 where medicamento_id = 10180; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (18, 24, '2023-09-03', 90.90); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (67, 10180, 198, 1, 21.20, 90.90); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 198; 
update estoque_total set total = total - 1 where medicamento_id = 10180; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (19, 25, '2023-09-03', 348.39); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (68, 2778, 85, 2, 26.30, 303.52); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 85; 
update estoque_total set total = total - 2 where medicamento_id = 2778; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (68, 1840, 31, 1, 0.90, 23.19); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 31; 
update estoque_total set total = total - 1 where medicamento_id = 1840; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (68, 10124, 162, 1, 3.50, 21.68); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 162; 
update estoque_total set total = total - 1 where medicamento_id = 10124; 
insert into venda (profissional_id, time_stamp, total) values (23, '2023-09-03', 1599.94); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (69, 597, 254, 3, 22.50, 1103.34); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 254; 
update estoque_total set total = total - 3 where medicamento_id = 597; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (69, 9168, 108, 1, 0.50, 54.36); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 108; 
update estoque_total set total = total - 1 where medicamento_id = 9168; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (69, 2774, 81, 3, 4.40, 442.24); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 81; 
update estoque_total set total = total - 3 where medicamento_id = 2774; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (11, 23, '2023-09-04', 807.26); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (70, 2627, 72, 3, 138.00, 724.74); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 72; 
update estoque_total set total = total - 3 where medicamento_id = 2627; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (70, 354, 8, 3, 6.70, 45.20); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 8; 
update estoque_total set total = total - 3 where medicamento_id = 354; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (70, 10156, 181, 1, 1.90, 37.32); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 181; 
update estoque_total set total = total - 1 where medicamento_id = 10156; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9174, 'lote 240931', '2023-09-04', '2025-03-31', 245.9, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 9174; 
insert into venda (cliente_id, time_stamp, total) values (11, '2023-09-04', 1224.00); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (71, 9174, 114, 2, 92.10, 1224.00); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 114; 
update estoque_total set total = total - 2 where medicamento_id = 9174; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (10, 24, '2023-09-04', 119.03); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (72, 10177, 195, 3, 10.30, 119.03); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 195; 
update estoque_total set total = total - 3 where medicamento_id = 10177; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (14, 22, '2023-09-05', 458.51); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (73, 9208, 128, 3, 69.10, 424.55); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 128; 
update estoque_total set total = total - 3 where medicamento_id = 9208; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (73, 10195, 213, 1, 0.30, 12.64); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 213; 
update estoque_total set total = total - 1 where medicamento_id = 10195; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (73, 1874, 49, 1, 1.80, 21.32); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 49; 
update estoque_total set total = total - 1 where medicamento_id = 1874; 
insert into venda (cliente_id, time_stamp, total) values (6, '2023-09-07', 29.74); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (74, 2731, 77, 1, 2.90, 29.74); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 77; 
update estoque_total set total = total - 1 where medicamento_id = 2731; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (5, 22, '2023-09-08', 93.40); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (75, 10145, 173, 3, 19.10, 93.40); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 173; 
update estoque_total set total = total - 3 where medicamento_id = 10145; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10186, 'lote 551989', '2023-09-08', '2025-03-31', 284.1, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 10186; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (6, 25, '2023-09-08', 1001.46); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (76, 10186, 244, 1, 40.80, 775.80); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 244; 
update estoque_total set total = total - 1 where medicamento_id = 10186; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (76, 10188, 232, 2, 27.80, 225.66); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 232; 
update estoque_total set total = total - 2 where medicamento_id = 10188; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9199, 'lote 293418', '2023-09-08', '2025-03-31', 122.9, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 9199; 
insert into venda (profissional_id, time_stamp, total) values (22, '2023-09-08', 780.97); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (77, 9199, 237, 1, 0.00, 328.88); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 237; 
update estoque_total set total = total - 1 where medicamento_id = 9199; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (77, 9248, 158, 3, 9.40, 304.61); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 158; 
update estoque_total set total = total - 3 where medicamento_id = 9248; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (77, 2774, 81, 1, 1.40, 147.48); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 81; 
update estoque_total set total = total - 1 where medicamento_id = 2774; 
insert into venda (cliente_id, time_stamp, total) values (10, '2023-09-09', 190.46); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (78, 1839, 30, 3, 4.00, 47.18); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 30; 
update estoque_total set total = total - 3 where medicamento_id = 1839; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (78, 9169, 109, 1, 21.30, 143.28); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 109; 
update estoque_total set total = total - 1 where medicamento_id = 9169; 
insert into venda (cliente_id, time_stamp, total) values (18, '2023-09-09', 33.50); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (79, 1883, 54, 2, 0.60, 33.50); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 54; 
update estoque_total set total = total - 2 where medicamento_id = 1883; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9203, 'lote 760455', '2023-09-09', '2025-03-31', 245.8, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 9203; 
insert into venda (profissional_id, time_stamp, total) values (22, '2023-09-09', 2615.21); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (80, 2631, 76, 3, 40.50, 1312.77); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 76; 
update estoque_total set total = total - 3 where medicamento_id = 2631; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (80, 9203, 127, 2, 13.10, 1302.44); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 127; 
update estoque_total set total = total - 2 where medicamento_id = 9203; 
insert into venda (profissional_id, time_stamp, total) values (23, '2023-09-09', 405.05); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (81, 10130, 166, 1, 1.10, 38.51); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 166; 
update estoque_total set total = total - 1 where medicamento_id = 10130; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (81, 9223, 140, 2, 9.80, 319.36); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 140; 
update estoque_total set total = total - 2 where medicamento_id = 9223; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (81, 1678, 29, 1, 1.40, 47.18); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 29; 
update estoque_total set total = total - 1 where medicamento_id = 1678; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9231, 'lote 286807', '2023-09-10', '2025-03-31', 122.5, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 9231; 
insert into venda (time_stamp, total) values ('2023-09-10', 368.06); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (82, 9231, 148, 1, 9.80, 318.29); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 148; 
update estoque_total set total = total - 1 where medicamento_id = 9231; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (82, 341, 4, 3, 1.50, 49.77); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 4; 
update estoque_total set total = total - 3 where medicamento_id = 341; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2761, 'lote 627414', '2023-09-10', '2025-10-31', 306.7, 3, 3); 
update estoque_total set total = total - 3 where medicamento_id = 2761; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (18, 25, '2023-09-10', 2270.82); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (83, 10155, 180, 1, 0.90, 30.47); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 180; 
update estoque_total set total = total - 1 where medicamento_id = 10155; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (83, 2761, 255, 3, 38.60, 1892.50); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 255; 
update estoque_total set total = total - 3 where medicamento_id = 2761; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (83, 9221, 138, 3, 18.30, 347.85); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 138; 
update estoque_total set total = total - 3 where medicamento_id = 9221; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9237, 'lote 912875', '2023-09-11', '2025-03-31', 274.4, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 9237; 
insert into venda (time_stamp, total) values ('2023-09-11', 768.31); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (84, 1859, 36, 1, 0.30, 16.99); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 36; 
update estoque_total set total = total - 1 where medicamento_id = 1859; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (84, 341, 4, 1, 0.00, 17.09); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 4; 
update estoque_total set total = total - 1 where medicamento_id = 341; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (84, 9237, 154, 1, 0.00, 734.23); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 154; 
update estoque_total set total = total - 1 where medicamento_id = 9237; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10191, 'lote 913462', '2023-09-11', '2025-03-31', 313.4, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 10191; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (16, 22, '2023-09-11', 2342.43); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (85, 10165, 187, 3, 15.80, 72.22); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 187; 
update estoque_total set total = total - 3 where medicamento_id = 10165; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (85, 10191, 209, 3, 432.40, 2270.21); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 209; 
update estoque_total set total = total - 3 where medicamento_id = 10191; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (20, 25, '2023-09-12', 833.93); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (86, 562, 17, 3, 63.90, 393.12); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 17; 
update estoque_total set total = total - 3 where medicamento_id = 562; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (86, 1861, 38, 2, 0.30, 34.28); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 38; 
update estoque_total set total = total - 2 where medicamento_id = 1861; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (86, 2775, 82, 1, 40.10, 406.53); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 82; 
update estoque_total set total = total - 1 where medicamento_id = 2775; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9146, 'lote 962182', '2023-09-12', '2025-03-31', 111.0, 30, 30); 
update estoque_total set total = total - 30 where medicamento_id = 9146; 
insert into venda (cliente_id, time_stamp, total) values (17, '2023-09-12', 558.88); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (87, 9146, 107, 2, 35.60, 558.88); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 107; 
update estoque_total set total = total - 2 where medicamento_id = 9146; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9171, 'lote 795747', '2023-09-13', '2025-03-31', 184.5, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 9171; 
insert into venda (time_stamp, total) values ('2023-09-13', 493.73); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (88, 9171, 111, 1, 0.00, 493.73); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 111; 
update estoque_total set total = total - 1 where medicamento_id = 9171; 
insert into venda (cliente_id, time_stamp, total) values (4, '2023-09-13', 47.91); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (89, 1859, 36, 1, 1.20, 16.09); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 36; 
update estoque_total set total = total - 1 where medicamento_id = 1859; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (89, 1839, 30, 2, 2.30, 31.82); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 30; 
update estoque_total set total = total - 2 where medicamento_id = 1839; 
insert into venda (cliente_id, time_stamp, total) values (12, '2023-09-13', 13.50); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (90, 2791, 95, 2, 0.70, 13.50); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 95; 
update estoque_total set total = total - 2 where medicamento_id = 2791; 
insert into venda (time_stamp, total) values ('2023-09-13', 12.23); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (91, 2596, 63, 1, 0.50, 12.23); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 63; 
update estoque_total set total = total - 1 where medicamento_id = 2596; 
insert into venda (time_stamp, total) values ('2023-09-14', 176.23); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (92, 9179, 115, 3, 3.50, 176.23); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 115; 
update estoque_total set total = total - 3 where medicamento_id = 9179; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9236, 'lote 249835', '2023-09-14', '2025-04-30', 239.3, 3, 3); 
update estoque_total set total = total - 3 where medicamento_id = 9236; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10187, 'lote 698346', '2023-09-14', '2025-03-31', 319.5, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 10187; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (1, 25, '2023-09-14', 3589.95); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (93, 10125, 163, 2, 6.80, 90.36); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 163; 
update estoque_total set total = total - 2 where medicamento_id = 10125; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (93, 9236, 230, 2, 179.30, 1101.78); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 230; 
update estoque_total set total = total - 2 where medicamento_id = 9236; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (93, 10187, 205, 3, 358.20, 2397.81); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 205; 
update estoque_total set total = total - 3 where medicamento_id = 10187; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (4, 21, '2023-09-15', 229.54); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (94, 10160, 185, 3, 0.00, 201.18); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 185; 
update estoque_total set total = total - 3 where medicamento_id = 10160; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (94, 1873, 48, 2, 5.70, 28.36); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 48; 
update estoque_total set total = total - 2 where medicamento_id = 1873; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (20, 25, '2023-09-15', 101.26); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (95, 2777, 84, 2, 8.70, 101.26); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 84; 
update estoque_total set total = total - 2 where medicamento_id = 2777; 
insert into venda (cliente_id, time_stamp, total) values (5, '2023-09-15', 59.51); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (96, 9134, 102, 1, 7.30, 59.51); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 102; 
update estoque_total set total = total - 1 where medicamento_id = 9134; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9181, 'lote 508923', '2023-09-15', '2025-03-31', 277.5, 3, 3); 
update estoque_total set total = total - 3 where medicamento_id = 9181; 
insert into venda (profissional_id, time_stamp, total) values (22, '2023-09-15', 1694.39); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (97, 10126, 164, 1, 1.20, 30.12); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 164; 
update estoque_total set total = total - 1 where medicamento_id = 10126; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (97, 561, 16, 3, 4.80, 237.81); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 16; 
update estoque_total set total = total - 3 where medicamento_id = 561; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (97, 9181, 117, 2, 59.40, 1426.46); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 117; 
update estoque_total set total = total - 2 where medicamento_id = 9181; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (11, 21, '2023-09-19', 700.38); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (98, 9189, 120, 2, 19.50, 224.60); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 120; 
update estoque_total set total = total - 2 where medicamento_id = 9189; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (98, 10179, 197, 2, 58.70, 475.78); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 197; 
update estoque_total set total = total - 2 where medicamento_id = 10179; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2629, 'lote 790862', '2023-09-19', '2024-03-31', 68.6, 20, 20); 
update estoque_total set total = total - 20 where medicamento_id = 2629; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2591, 'lote 200190', '2023-09-19', '2025-03-31', 374.3, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 2591; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10166, 'lote 291506', '2023-09-19', '2025-03-31', 337.4, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 10166; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (10, 24, '2023-09-19', 4484.80); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (99, 2629, 74, 1, 13.50, 136.84); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 74; 
update estoque_total set total = total - 1 where medicamento_id = 2629; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (99, 2591, 62, 2, 294.50, 1438.38); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 62; 
update estoque_total set total = total - 2 where medicamento_id = 2591; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (99, 10166, 188, 3, 0.00, 2909.58); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 188; 
update estoque_total set total = total - 3 where medicamento_id = 10166; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2628, 'lote 177275', '2023-09-19', '2024-03-31', 262.6, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 2628; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (4, 21, '2023-09-19', 1432.27); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (100, 2628, 73, 3, 293.30, 1432.27); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 73; 
update estoque_total set total = total - 3 where medicamento_id = 2628; 
insert into venda (time_stamp, total) values ('2023-09-20', 170.06); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (101, 2782, 89, 3, 0.40, 23.72); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 89; 
update estoque_total set total = total - 3 where medicamento_id = 2782; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (101, 562, 17, 1, 6.00, 146.34); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 17; 
update estoque_total set total = total - 1 where medicamento_id = 562; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1866, 'lote 871065', '2023-09-20', '2025-10-31', 257.4, 10, 10); 
update estoque_total set total = total - 10 where medicamento_id = 1866; 
insert into venda (cliente_id, time_stamp, total) values (11, '2023-09-20', 1700.59); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (102, 9168, 108, 3, 9.80, 154.78); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 108; 
update estoque_total set total = total - 3 where medicamento_id = 9168; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (102, 1866, 233, 3, 15.60, 1545.81); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 233; 
update estoque_total set total = total - 3 where medicamento_id = 1866; 
insert into venda (profissional_id, time_stamp, total) values (24, '2023-09-21', 719.63); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (103, 9211, 235, 3, 0.00, 493.62); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 235; 
update estoque_total set total = total - 3 where medicamento_id = 9211; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (103, 10129, 165, 1, 9.40, 226.01); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 165; 
update estoque_total set total = total - 1 where medicamento_id = 10129; 
insert into venda (cliente_id, time_stamp, total) values (10, '2023-09-21', 96.10); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (104, 9179, 115, 1, 8.30, 51.61); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 115; 
update estoque_total set total = total - 1 where medicamento_id = 9179; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (104, 1873, 48, 3, 6.60, 44.49); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 48; 
update estoque_total set total = total - 3 where medicamento_id = 1873; 
insert into venda (cliente_id, time_stamp, total) values (16, '2023-09-22', 154.25); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (105, 9230, 147, 1, 9.80, 154.25); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 147; 
update estoque_total set total = total - 1 where medicamento_id = 9230; 
insert into venda (profissional_id, time_stamp, total) values (23, '2023-09-22', 148.73); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (106, 10177, 195, 3, 2.50, 126.83); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 195; 
update estoque_total set total = total - 3 where medicamento_id = 10177; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (106, 2779, 86, 1, 0.90, 21.90); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 86; 
update estoque_total set total = total - 1 where medicamento_id = 2779; 
insert into venda (cliente_id, time_stamp, total) values (2, '2023-09-23', 45.68); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (107, 357, 11, 2, 8.00, 45.68); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 11; 
update estoque_total set total = total - 2 where medicamento_id = 357; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9203, 'lote 763546', '2023-09-23', '2025-04-30', 245.8, 3, 3); 
update estoque_total set total = total - 3 where medicamento_id = 9203; 
insert into venda (cliente_id, time_stamp, total) values (17, '2023-09-23', 1894.41); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (108, 9203, 260, 3, 78.90, 1894.41); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 260; 
update estoque_total set total = total - 3 where medicamento_id = 9203; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2622, 'lote 723265', '2023-09-24', '2024-03-31', 224.4, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 2622; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (597, 'lote 611994', '2023-09-24', '2024-10-31', 143.8, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 597; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (5, 23, '2023-09-24', 1834.19); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (109, 2622, 68, 1, 5.10, 512.93); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 68; 
update estoque_total set total = total - 1 where medicamento_id = 2622; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (109, 9201, 125, 2, 72.30, 585.70); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 125; 
update estoque_total set total = total - 2 where medicamento_id = 9201; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (109, 597, 254, 2, 15.00, 735.56); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 254; 
update estoque_total set total = total - 2 where medicamento_id = 597; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1866, 'lote 416353', '2023-09-24', '2025-11-30', 257.4, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 1866; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (2, 24, '2023-09-24', 855.99); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (110, 10152, 177, 1, 33.20, 162.26); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 177; 
update estoque_total set total = total - 1 where medicamento_id = 10152; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (110, 10189, 207, 1, 12.60, 240.86); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 207; 
update estoque_total set total = total - 1 where medicamento_id = 10189; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (110, 1866, 240, 1, 67.60, 452.87); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 240; 
update estoque_total set total = total - 1 where medicamento_id = 1866; 
insert into venda (cliente_id, time_stamp, total) values (2, '2023-09-24', 722.32); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (111, 9146, 265, 3, 169.40, 722.32); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 265; 
update estoque_total set total = total - 3 where medicamento_id = 9146; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9203, 'lote 286176', '2023-09-26', '2025-03-31', 245.8, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 9203; 
insert into venda (time_stamp, total) values ('2023-09-26', 790.69); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (112, 1531, 23, 2, 4.30, 139.42); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 23; 
update estoque_total set total = total - 2 where medicamento_id = 1531; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (112, 9203, 127, 1, 6.50, 651.27); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 127; 
update estoque_total set total = total - 1 where medicamento_id = 9203; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (2, 21, '2023-09-27', 13.08); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (113, 1578, 27, 2, 3.00, 13.08); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 27; 
update estoque_total set total = total - 2 where medicamento_id = 1578; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (597, 'lote 937277', '2023-09-27', '2024-10-31', 143.8, 10, 10); 
update estoque_total set total = total - 10 where medicamento_id = 597; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2620, 'lote 894146', '2023-09-27', '2024-04-30', 329.0, 3, 3); 
update estoque_total set total = total - 3 where medicamento_id = 2620; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (17, 25, '2023-09-27', 2369.86); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (114, 597, 254, 1, 22.50, 352.78); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 254; 
update estoque_total set total = total - 1 where medicamento_id = 597; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (114, 9245, 155, 3, 35.10, 149.85); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 155; 
update estoque_total set total = total - 3 where medicamento_id = 9245; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (114, 2620, 245, 3, 409.80, 1867.23); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 245; 
update estoque_total set total = total - 3 where medicamento_id = 2620; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2630, 'lote 624375', '2023-09-27', '2024-04-30', 137.3, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 2630; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10186, 'lote 402272', '2023-09-27', '2025-03-31', 284.1, 3, 3); 
update estoque_total set total = total - 3 where medicamento_id = 10186; 
insert into venda (profissional_id, time_stamp, total) values (25, '2023-09-27', 1383.76); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (115, 2630, 219, 2, 18.00, 583.46); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 219; 
update estoque_total set total = total - 2 where medicamento_id = 2630; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (115, 10186, 204, 1, 16.30, 800.30); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 204; 
update estoque_total set total = total - 1 where medicamento_id = 10186; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10166, 'lote 975552', '2023-09-28', '2025-03-31', 337.4, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 10166; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9199, 'lote 397911', '2023-09-28', '2025-05-31', 122.9, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 9199; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (3, 24, '2023-09-28', 3546.66); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (116, 10166, 188, 3, 0.00, 2909.58); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 188; 
update estoque_total set total = total - 3 where medicamento_id = 10166; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (116, 9197, 121, 1, 9.80, 45.02); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 121; 
update estoque_total set total = total - 1 where medicamento_id = 9197; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (116, 9199, 249, 2, 65.70, 592.06); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 249; 
update estoque_total set total = total - 2 where medicamento_id = 9199; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10190, 'lote 206461', '2023-09-28', '2025-03-31', 239.9, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 10190; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (4, 21, '2023-09-28', 1469.31); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (117, 352, 7, 1, 1.20, 22.89); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 7; 
update estoque_total set total = total - 1 where medicamento_id = 352; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (117, 2774, 81, 2, 23.80, 273.96); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 81; 
update estoque_total set total = total - 2 where medicamento_id = 2774; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (117, 10190, 208, 2, 206.90, 1172.46); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 208; 
update estoque_total set total = total - 2 where medicamento_id = 10190; 
insert into venda (cliente_id, time_stamp, total) values (20, '2023-09-29', 520.40); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (118, 9232, 248, 1, 88.50, 403.66); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 248; 
update estoque_total set total = total - 1 where medicamento_id = 9232; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (118, 1532, 24, 1, 25.60, 116.74); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 24; 
update estoque_total set total = total - 1 where medicamento_id = 1532; 
insert into venda (cliente_id, time_stamp, total) values (10, '2023-09-29', 6.64); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (119, 2782, 89, 1, 1.40, 6.64); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 89; 
update estoque_total set total = total - 1 where medicamento_id = 2782; 
insert into venda (profissional_id, time_stamp, total) values (22, '2023-10-01', 297.76); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (120, 2774, 81, 2, 0.00, 297.76); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 81; 
update estoque_total set total = total - 2 where medicamento_id = 2774; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (597, 'lote 420892', '2023-10-01', '2024-09-30', 143.9, 10, 10); 
update estoque_total set total = total - 10 where medicamento_id = 597; 
insert into venda (cliente_id, time_stamp, total) values (13, '2023-10-01', 315.28); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (121, 597, 18, 1, 60.00, 315.28); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 18; 
update estoque_total set total = total - 1 where medicamento_id = 597; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9203, 'lote 206092', '2023-10-02', '2025-04-30', 245.8, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 9203; 
insert into venda (cliente_id, time_stamp, total) values (15, '2023-10-02', 565.77); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (122, 9203, 279, 1, 92.00, 565.77); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 279; 
update estoque_total set total = total - 1 where medicamento_id = 9203; 
insert into venda (cliente_id, time_stamp, total) values (7, '2023-10-02', 229.82); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (123, 9187, 118, 3, 17.20, 229.82); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 118; 
update estoque_total set total = total - 3 where medicamento_id = 9187; 
insert into venda (profissional_id, time_stamp, total) values (22, '2023-10-03', 218.92); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (124, 2773, 80, 3, 4.40, 218.92); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 80; 
update estoque_total set total = total - 3 where medicamento_id = 2773; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (10, 23, '2023-10-04', 404.72); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (125, 6806, 98, 1, 3.50, 16.25); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 98; 
update estoque_total set total = total - 1 where medicamento_id = 6806; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (125, 10188, 232, 3, 38.00, 342.19); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 232; 
update estoque_total set total = total - 3 where medicamento_id = 10188; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (125, 2776, 83, 2, 8.70, 46.28); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 83; 
update estoque_total set total = total - 2 where medicamento_id = 2776; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2621, 'lote 767544', '2023-10-05', '2024-04-30', 276.7, 3, 3); 
update estoque_total set total = total - 3 where medicamento_id = 2621; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (3, 22, '2023-10-05', 1330.28); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (126, 2621, 67, 2, 38.30, 1238.76); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 67; 
update estoque_total set total = total - 2 where medicamento_id = 2621; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (126, 10147, 175, 1, 0.00, 29.44); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 175; 
update estoque_total set total = total - 1 where medicamento_id = 10147; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (126, 2784, 91, 3, 9.20, 62.08); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 91; 
update estoque_total set total = total - 3 where medicamento_id = 2784; 
insert into venda (profissional_id, time_stamp, total) values (21, '2023-10-06', 91.46); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (127, 2364, 56, 1, 0.50, 14.07); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 56; 
update estoque_total set total = total - 1 where medicamento_id = 2364; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (127, 532, 14, 2, 0.30, 16.22); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 14; 
update estoque_total set total = total - 2 where medicamento_id = 532; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (127, 10171, 189, 3, 1.80, 61.17); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 189; 
update estoque_total set total = total - 3 where medicamento_id = 10171; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (11, 25, '2023-10-06', 306.82); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (128, 2778, 85, 2, 23.00, 306.82); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 85; 
update estoque_total set total = total - 2 where medicamento_id = 2778; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9203, 'lote 342427', '2023-10-07', '2025-05-31', 245.8, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 9203; 
insert into venda (cliente_id, time_stamp, total) values (2, '2023-10-07', 2105.64); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (129, 9203, 275, 3, 19.70, 1953.61); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 275; 
update estoque_total set total = total - 3 where medicamento_id = 9203; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (129, 9168, 108, 2, 1.00, 108.72); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 108; 
update estoque_total set total = total - 2 where medicamento_id = 9168; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (129, 2367, 59, 3, 0.40, 43.31); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 59; 
update estoque_total set total = total - 3 where medicamento_id = 2367; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2631, 'lote 578040', '2023-10-07', '2024-04-30', 205.9, 10, 10); 
update estoque_total set total = total - 10 where medicamento_id = 2631; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (7, 23, '2023-10-07', 1318.37); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (130, 2631, 76, 3, 243.50, 1109.77); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 76; 
update estoque_total set total = total - 3 where medicamento_id = 2631; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (130, 10180, 243, 2, 15.60, 208.60); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 243; 
update estoque_total set total = total - 2 where medicamento_id = 10180; 
insert into venda (cliente_id, time_stamp, total) values (10, '2023-10-07', 110.88); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (131, 2254, 55, 2, 8.30, 110.88); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 55; 
update estoque_total set total = total - 2 where medicamento_id = 2254; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9181, 'lote 961846', '2023-10-08', '2025-04-30', 277.5, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 9181; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10173, 'lote 548435', '2023-10-08', '2025-04-30', 213.0, 3, 3); 
update estoque_total set total = total - 3 where medicamento_id = 10173; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (1, 23, '2023-10-08', 1198.59); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (132, 9181, 117, 1, 126.20, 616.73); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 117; 
update estoque_total set total = total - 1 where medicamento_id = 9181; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (132, 10173, 191, 1, 30.60, 581.86); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 191; 
update estoque_total set total = total - 1 where medicamento_id = 10173; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2630, 'lote 793856', '2023-10-08', '2024-05-31', 137.3, 10, 10); 
update estoque_total set total = total - 10 where medicamento_id = 2630; 
insert into venda (profissional_id, time_stamp, total) values (21, '2023-10-08', 732.47); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (133, 2254, 55, 2, 3.50, 115.68); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 55; 
update estoque_total set total = total - 2 where medicamento_id = 2254; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (133, 2630, 282, 1, 0.00, 300.73); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 282; 
update estoque_total set total = total - 1 where medicamento_id = 2630; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (133, 9169, 109, 2, 13.10, 316.06); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 109; 
update estoque_total set total = total - 2 where medicamento_id = 9169; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2622, 'lote 945600', '2023-10-10', '2024-04-30', 224.4, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 2622; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (1866, 'lote 323510', '2023-10-10', '2025-10-31', 257.4, 10, 10); 
update estoque_total set total = total - 10 where medicamento_id = 1866; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (14, 23, '2023-10-10', 1817.48); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (134, 2622, 276, 2, 103.60, 932.46); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 276; 
update estoque_total set total = total - 2 where medicamento_id = 2622; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (134, 1866, 228, 2, 197.70, 843.24); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 228; 
update estoque_total set total = total - 2 where medicamento_id = 1866; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (134, 10125, 163, 1, 6.80, 41.78); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 163; 
update estoque_total set total = total - 1 where medicamento_id = 10125; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10166, 'lote 335561', '2023-10-10', '2025-04-30', 337.4, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 10166; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9211, 'lote 947837', '2023-10-10', '2025-04-30', 61.4, 20, 20); 
update estoque_total set total = total - 20 where medicamento_id = 9211; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10191, 'lote 363295', '2023-10-10', '2025-05-31', 313.4, 3, 3); 
update estoque_total set total = total - 3 where medicamento_id = 10191; 
insert into venda (profissional_id, time_stamp, total) values (23, '2023-10-10', 4117.59); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (135, 10166, 284, 1, 38.70, 931.16); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 284; 
update estoque_total set total = total - 1 where medicamento_id = 10166; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (135, 9211, 131, 3, 9.80, 483.82); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 131; 
update estoque_total set total = total - 3 where medicamento_id = 9211; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (135, 10191, 218, 3, 0.00, 2702.61); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 218; 
update estoque_total set total = total - 3 where medicamento_id = 10191; 
insert into venda (cliente_id, time_stamp, total) values (5, '2023-10-10', 452.60); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (136, 2601, 64, 1, 55.90, 452.60); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 64; 
update estoque_total set total = total - 1 where medicamento_id = 2601; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2630, 'lote 783558', '2023-10-13', '2024-05-31', 137.3, 10, 10); 
update estoque_total set total = total - 10 where medicamento_id = 2630; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (7, 23, '2023-10-13', 300.73); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (137, 2630, 219, 1, 0.00, 300.73); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 219; 
update estoque_total set total = total - 1 where medicamento_id = 2630; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9232, 'lote 187818', '2023-10-13', '2025-04-30', 183.9, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 9232; 
insert into venda (cliente_id, time_stamp, total) values (2, '2023-10-13', 974.52); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (138, 9232, 149, 2, 9.80, 974.52); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 149; 
update estoque_total set total = total - 2 where medicamento_id = 9232; 
insert into venda (cliente_id, time_stamp, total) values (4, '2023-10-13', 22.58); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (139, 532, 14, 3, 2.20, 22.58); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 14; 
update estoque_total set total = total - 3 where medicamento_id = 532; 
insert into venda (profissional_id, time_stamp, total) values (25, '2023-10-14', 567.43); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (140, 9173, 113, 1, 0.00, 329.02); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 113; 
update estoque_total set total = total - 1 where medicamento_id = 9173; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (140, 10178, 196, 3, 9.90, 238.41); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 196; 
update estoque_total set total = total - 3 where medicamento_id = 10178; 
insert into venda (cliente_id, time_stamp, total) values (17, '2023-10-14', 39.50); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (141, 6806, 98, 2, 0.00, 39.50); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 98; 
update estoque_total set total = total - 2 where medicamento_id = 6806; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2775, 'lote 612308', '2023-10-14', '2025-10-31', 167.5, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 2775; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (20, 21, '2023-10-14', 950.70); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (142, 1234, 21, 1, 0.70, 10.39); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 21; 
update estoque_total set total = total - 1 where medicamento_id = 1234; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (142, 2775, 82, 2, 125.00, 768.26); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 82; 
update estoque_total set total = total - 2 where medicamento_id = 2775; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (142, 9188, 119, 3, 12.90, 172.05); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 119; 
update estoque_total set total = total - 3 where medicamento_id = 9188; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2775, 'lote 552756', '2023-10-15', '2025-11-30', 167.5, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 2775; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (5, 24, '2023-10-15', 1226.31); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (143, 9179, 115, 2, 19.10, 100.72); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 115; 
update estoque_total set total = total - 2 where medicamento_id = 9179; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (143, 2775, 302, 3, 214.30, 1125.59); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 302; 
update estoque_total set total = total - 3 where medicamento_id = 2775; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (11, 21, '2023-10-16', 51.66); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (144, 10192, 210, 2, 8.30, 51.66); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 210; 
update estoque_total set total = total - 2 where medicamento_id = 10192; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9234, 'lote 727485', '2023-10-16', '2025-04-30', 204.3, 10, 10); 
update estoque_total set total = total - 10 where medicamento_id = 9234; 
insert into venda (cliente_id, time_stamp, total) values (2, '2023-10-16', 1392.16); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (145, 1883, 54, 2, 1.00, 33.10); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 54; 
update estoque_total set total = total - 2 where medicamento_id = 1883; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (145, 2367, 59, 1, 0.80, 13.77); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 59; 
update estoque_total set total = total - 1 where medicamento_id = 2367; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (145, 9234, 151, 3, 295.20, 1345.29); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 151; 
update estoque_total set total = total - 3 where medicamento_id = 9234; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9231, 'lote 619666', '2023-10-17', '2025-04-30', 122.5, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 9231; 
insert into venda (time_stamp, total) values ('2023-10-17', 820.72); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (146, 9211, 298, 1, 0.00, 164.54); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 298; 
update estoque_total set total = total - 1 where medicamento_id = 9211; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (146, 9231, 148, 2, 0.00, 656.18); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 148; 
update estoque_total set total = total - 2 where medicamento_id = 9231; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9201, 'lote 591735', '2023-10-17', '2025-04-30', 122.9, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 9201; 
insert into venda (time_stamp, total) values ('2023-10-17', 987.00); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (147, 9201, 125, 3, 0.00, 987.00); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 125; 
update estoque_total set total = total - 3 where medicamento_id = 9201; 
insert into venda (cliente_id, time_stamp, total) values (13, '2023-10-17', 50.41); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (148, 9179, 115, 1, 9.50, 50.41); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 115; 
update estoque_total set total = total - 1 where medicamento_id = 9179; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (7, 21, '2023-10-17', 28.58); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (149, 10192, 210, 1, 1.40, 28.58); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 210; 
update estoque_total set total = total - 1 where medicamento_id = 10192; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10181, 'lote 507615', '2023-10-18', '2025-04-30', 260.9, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 10181; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (19, 23, '2023-10-18', 1413.75); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (150, 10181, 252, 2, 134.90, 1364.98); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 252; 
update estoque_total set total = total - 2 where medicamento_id = 10181; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (150, 341, 4, 3, 2.50, 48.77); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 4; 
update estoque_total set total = total - 3 where medicamento_id = 341; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2601, 'lote 424112', '2023-10-19', '2026-10-31', 235.2, 10, 10); 
update estoque_total set total = total - 10 where medicamento_id = 2601; 
insert into venda (time_stamp, total) values ('2023-10-19', 1048.15); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (151, 9188, 119, 1, 0.00, 61.65); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 119; 
update estoque_total set total = total - 1 where medicamento_id = 9188; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (151, 2601, 64, 2, 30.50, 986.50); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 64; 
update estoque_total set total = total - 2 where medicamento_id = 2601; 
insert into venda (time_stamp, total) values ('2023-10-19', 309.66); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (152, 1863, 40, 1, 0.00, 17.14); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 40; 
update estoque_total set total = total - 1 where medicamento_id = 1863; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (152, 9189, 120, 2, 4.80, 239.30); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 120; 
update estoque_total set total = total - 2 where medicamento_id = 9189; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (152, 9197, 121, 1, 1.60, 53.22); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 121; 
update estoque_total set total = total - 1 where medicamento_id = 9197; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (7, 23, '2023-10-20', 76.58); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (153, 2368, 60, 1, 6.70, 45.07); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 60; 
update estoque_total set total = total - 1 where medicamento_id = 2368; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (153, 1578, 27, 2, 1.10, 14.98); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 27; 
update estoque_total set total = total - 2 where medicamento_id = 1578; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (153, 1872, 47, 1, 1.60, 16.53); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 47; 
update estoque_total set total = total - 1 where medicamento_id = 1872; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9201, 'lote 659472', '2023-10-20', '2025-05-31', 122.9, 10, 10); 
update estoque_total set total = total - 10 where medicamento_id = 9201; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9213, 'lote 657007', '2023-10-20', '2025-05-31', 184.4, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 9213; 
insert into venda (cliente_id, time_stamp, total) values (1, '2023-10-20', 1698.12); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (154, 1879, 50, 3, 0.00, 54.42); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 50; 
update estoque_total set total = total - 3 where medicamento_id = 1879; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (154, 9201, 306, 1, 32.90, 296.10); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 306; 
update estoque_total set total = total - 1 where medicamento_id = 9201; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (154, 9213, 227, 3, 133.20, 1347.60); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 227; 
update estoque_total set total = total - 3 where medicamento_id = 9213; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (17, 25, '2023-10-22', 366.95); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (155, 2629, 239, 2, 0.00, 300.68); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 239; 
update estoque_total set total = total - 2 where medicamento_id = 2629; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (155, 1864, 41, 3, 9.90, 66.27); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 41; 
update estoque_total set total = total - 3 where medicamento_id = 1864; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (11, 23, '2023-10-22', 396.60); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (156, 9235, 152, 2, 20.60, 166.76); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 152; 
update estoque_total set total = total - 2 where medicamento_id = 9235; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (156, 10179, 197, 1, 37.40, 229.84); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 197; 
update estoque_total set total = total - 1 where medicamento_id = 10179; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (12, 24, '2023-10-22', 67.11); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (157, 10193, 211, 1, 0.90, 21.93); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 211; 
update estoque_total set total = total - 1 where medicamento_id = 10193; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (157, 1678, 29, 1, 3.40, 45.18); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 29; 
update estoque_total set total = total - 1 where medicamento_id = 1678; 
insert into venda (cliente_id, time_stamp, total) values (4, '2023-10-22', 126.36); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (158, 1841, 32, 2, 2.00, 32.12); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 32; 
update estoque_total set total = total - 2 where medicamento_id = 1841; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (158, 2365, 57, 2, 9.30, 94.24); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 57; 
update estoque_total set total = total - 2 where medicamento_id = 2365; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10181, 'lote 116912', '2023-10-23', '2025-05-31', 260.9, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 10181; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9231, 'lote 933297', '2023-10-23', '2025-05-31', 122.4, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 9231; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (6, 23, '2023-10-23', 1705.77); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (159, 10181, 307, 2, 59.90, 1439.98); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 307; 
update estoque_total set total = total - 2 where medicamento_id = 10181; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (159, 9231, 261, 1, 62.30, 265.79); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 261; 
update estoque_total set total = total - 1 where medicamento_id = 9231; 
insert into venda (cliente_id, time_stamp, total) values (20, '2023-10-23', 159.64); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (160, 2365, 57, 2, 7.20, 96.34); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 57; 
update estoque_total set total = total - 2 where medicamento_id = 2365; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (160, 2596, 63, 2, 2.00, 23.46); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 63; 
update estoque_total set total = total - 2 where medicamento_id = 2596; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (160, 1874, 49, 2, 6.40, 39.84); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 49; 
update estoque_total set total = total - 2 where medicamento_id = 1874; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (11, 23, '2023-10-23', 385.36); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (161, 2630, 294, 1, 18.00, 282.73); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 294; 
update estoque_total set total = total - 1 where medicamento_id = 2630; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (161, 2792, 96, 2, 4.10, 37.82); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 96; 
update estoque_total set total = total - 2 where medicamento_id = 2792; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (161, 9134, 102, 1, 2.00, 64.81); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 102; 
update estoque_total set total = total - 1 where medicamento_id = 9134; 
insert into venda (cliente_id, time_stamp, total) values (15, '2023-10-23', 16.79); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (162, 1861, 38, 1, 0.50, 16.79); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 38; 
update estoque_total set total = total - 1 where medicamento_id = 1861; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (10, 24, '2023-10-24', 482.39); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (163, 10131, 167, 2, 4.40, 19.12); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 167; 
update estoque_total set total = total - 2 where medicamento_id = 10131; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (163, 1866, 296, 1, 57.20, 463.27); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 296; 
update estoque_total set total = total - 1 where medicamento_id = 1866; 
insert into venda (time_stamp, total) values ('2023-10-24', 36.92); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (164, 6805, 97, 2, 1.50, 36.92); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 97; 
update estoque_total set total = total - 2 where medicamento_id = 6805; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (5, 21, '2023-10-24', 71.24); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (165, 10145, 173, 2, 10.50, 64.50); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 173; 
update estoque_total set total = total - 2 where medicamento_id = 10145; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (165, 1578, 27, 1, 1.30, 6.74); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 27; 
update estoque_total set total = total - 1 where medicamento_id = 1578; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10183, 'lote 177328', '2023-10-25', '2025-04-30', 278.3, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 10183; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (9, 21, '2023-10-25', 1359.84); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (166, 10183, 201, 2, 239.90, 1359.84); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 201; 
update estoque_total set total = total - 2 where medicamento_id = 10183; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10181, 'lote 521219', '2023-10-25', '2025-06-30', 260.9, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 10181; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (4, 24, '2023-10-25', 1709.42); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (167, 562, 17, 2, 15.20, 289.48); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 17; 
update estoque_total set total = total - 2 where medicamento_id = 562; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (167, 10181, 311, 2, 119.90, 1379.98); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 311; 
update estoque_total set total = total - 2 where medicamento_id = 10181; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (167, 10123, 161, 3, 0.00, 39.96); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 161; 
update estoque_total set total = total - 3 where medicamento_id = 10123; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9142, 'lote 106913', '2023-10-25', '2025-04-30', 55.4, 30, 30); 
update estoque_total set total = total - 30 where medicamento_id = 9142; 
insert into venda (cliente_id, time_stamp, total) values (2, '2023-10-25', 751.52); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (168, 9142, 103, 3, 13.30, 432.80); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 103; 
update estoque_total set total = total - 3 where medicamento_id = 9142; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (168, 1538, 26, 3, 5.60, 277.06); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 26; 
update estoque_total set total = total - 3 where medicamento_id = 1538; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (168, 1868, 45, 3, 7.30, 41.66); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 45; 
update estoque_total set total = total - 3 where medicamento_id = 1868; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (10183, 'lote 782080', '2023-10-25', '2025-04-30', 278.3, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 10183; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2366, 'lote 762525', '2023-10-25', '2025-10-31', 41.8, 20, 20); 
update estoque_total set total = total - 20 where medicamento_id = 2366; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (9, 21, '2023-10-25', 1655.28); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (169, 10183, 201, 1, 111.90, 687.97); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 201; 
update estoque_total set total = total - 1 where medicamento_id = 10183; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (169, 2366, 58, 3, 21.90, 291.75); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 58; 
update estoque_total set total = total - 3 where medicamento_id = 2366; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (169, 597, 280, 2, 75.00, 675.56); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 280; 
update estoque_total set total = total - 2 where medicamento_id = 597; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2621, 'lote 966917', '2023-10-26', '2024-04-30', 276.7, 3, 3); 
update estoque_total set total = total - 3 where medicamento_id = 2621; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (5, 23, '2023-10-26', 1775.32); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (170, 2621, 67, 3, 363.90, 1551.69); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 67; 
update estoque_total set total = total - 3 where medicamento_id = 2621; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (170, 2368, 60, 1, 6.20, 45.57); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 60; 
update estoque_total set total = total - 1 where medicamento_id = 2368; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (170, 9235, 152, 2, 9.30, 178.06); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 152; 
update estoque_total set total = total - 2 where medicamento_id = 9235; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2621, 'lote 551475', '2023-10-26', '2024-04-30', 276.7, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 2621; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9231, 'lote 270823', '2023-10-26', '2025-06-30', 122.4, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 9231; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (13, 24, '2023-10-26', 1528.25); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (171, 2621, 318, 2, 63.80, 1213.26); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 318; 
update estoque_total set total = total - 2 where medicamento_id = 2621; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (171, 9231, 312, 1, 13.10, 314.99); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 312; 
update estoque_total set total = total - 1 where medicamento_id = 9231; 
insert into venda (time_stamp, total) values ('2023-10-26', 68.40); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (172, 2779, 86, 3, 0.00, 68.40); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 86; 
update estoque_total set total = total - 3 where medicamento_id = 2779; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (17, 22, '2023-10-26', 98.36); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (173, 1510, 22, 2, 1.80, 21.30); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 22; 
update estoque_total set total = total - 2 where medicamento_id = 1510; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (173, 10126, 164, 3, 16.90, 77.06); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 164; 
update estoque_total set total = total - 3 where medicamento_id = 10126; 
insert into venda (cliente_id, time_stamp, total) values (7, '2023-10-28', 29.80); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (174, 354, 8, 2, 4.80, 29.80); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 8; 
update estoque_total set total = total - 2 where medicamento_id = 354; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9201, 'lote 547960', '2023-10-29', '2025-05-31', 122.9, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 9201; 
insert into venda (profissional_id, time_stamp, total) values (25, '2023-10-29', 1167.08); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (175, 9201, 306, 3, 0.00, 987.00); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 306; 
update estoque_total set total = total - 3 where medicamento_id = 9201; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (175, 356, 10, 1, 0.30, 17.84); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 10; 
update estoque_total set total = total - 1 where medicamento_id = 356; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (175, 10178, 196, 2, 3.30, 162.24); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 196; 
update estoque_total set total = total - 2 where medicamento_id = 10178; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2591, 'lote 902894', '2023-10-29', '2025-05-31', 374.3, 6, 6); 
update estoque_total set total = total - 6 where medicamento_id = 2591; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (9237, 'lote 969265', '2023-10-29', '2025-04-30', 274.4, 3, 3); 
update estoque_total set total = total - 3 where medicamento_id = 9237; 
insert into venda (time_stamp, total) values ('2023-10-29', 3938.45); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (176, 2591, 271, 2, 34.60, 1698.28); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 271; 
update estoque_total set total = total - 2 where medicamento_id = 2591; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (176, 9237, 154, 3, 0.00, 2202.69); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 154; 
update estoque_total set total = total - 3 where medicamento_id = 9237; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (176, 19780, 217, 2, 0.00, 37.48); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 217; 
update estoque_total set total = total - 2 where medicamento_id = 19780; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (358, 'lote 331593', '2023-10-29', '2025-11-30', 209.4, 5, 5); 
update estoque_total set total = total - 5 where medicamento_id = 358; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (14, 22, '2023-10-29', 1256.11); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (177, 358, 229, 3, 76.10, 1193.89); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 229; 
update estoque_total set total = total - 3 where medicamento_id = 358; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (177, 10174, 192, 3, 0.00, 62.22); 
update estoque set quant_venda = quant_venda + 3, quant_atual = quant_atual - 3 where id = 192; 
update estoque_total set total = total - 3 where medicamento_id = 10174; 
insert into estoque (medicamento_id, lote, data, validade, preco, quant_inicial, quant_atual) values (2622, 'lote 562962', '2023-10-29', '2024-05-31', 224.4, 10, 10); 
update estoque_total set total = total - 10 where medicamento_id = 2622; 
insert into venda (cliente_id, profissional_id, time_stamp, total) values (8, 21, '2023-10-29', 493.49); 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (178, 2622, 276, 1, 98.40, 419.63); 
update estoque set quant_venda = quant_venda + 1, quant_atual = quant_atual - 1 where id = 276; 
update estoque_total set total = total - 1 where medicamento_id = 2622; 
insert into itens_venda (venda_id, medicamento_id, estoque_id, quantidade, desconto, total) values (178, 90, 1, 2, 5.50, 73.86); 
update estoque set quant_venda = quant_venda + 2, quant_atual = quant_atual - 2 where id = 1; 
update estoque_total set total = total - 2 where medicamento_id = 90; 
