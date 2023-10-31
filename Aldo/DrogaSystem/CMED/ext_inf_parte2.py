import pandas as pd
import psycopg2
import regex as re

con = psycopg2.connect(host = 'localhost', database = 'cmed', user = 'postgres', password = '827391')
quant_filt_excluir = pd.DataFrame(pd.read_excel('quant_filt_excluir.xlsx'))

quant_excluir = []
for i in range(len(quant_filt_excluir)):
    quant_excluir.append(int(quant_filt_excluir.iloc[i]))

with con:
    with con.cursor() as cursor:
        a = 'SELECT * FROM cmed where id = 3375; '
        cursor.execute(a)
        resposta = cursor. fetchall()
        
        a = 'DELETE FROM cmed WHERE id = (%s);'
        for i in range(len(quant_excluir)):
            cursor.execute(a, (f'{quant_excluir[i]}',))

        
        a = 'SELECT * FROM cmed WHERE id = (%s);'
        for i in range(len(quant_excluir)):
            cursor.execute(a, (f'{quant_excluir[i]}',))
            resposta = cursor.fetchall()
        
        a = 'SELECT * FROM cmed ;'
        cursor.execute(a)
        resposta = cursor.fetchall()

        a = 'SELECT DISTINCT cmed.tipo FROM cmed;'
        cursor.execute(a)
        tipo = cursor.fetchall()
        
        a = 'SELECT DISTINCT cmed.substancia FROM cmed;'
        cursor.execute(a)
        substancia = cursor.fetchall()

        a = 'SELECT cmed.substancia,cmed.cnpj ,cmed.laboratorio ,intQuantGGERM.ggerm ,cmed.registro, cmed.produto, cmed.apresenta, intQuantGGERM.quant, cmed.classe, cmed.tipo, cmed.pf, cmed.pmc, cmed.tarja FROM cmed INNER JOIN intQuantGGERM ON cmed.id = intQuantGGERM.id WHERE tipo = %s and substancia = %s LIMIT 1 OFFSET  1'
        temp = []
        for i in substancia:
            for j in tipo:
                cursor.execute(a, (j, i))
                temp.append(cursor.fetchall())

        
        cmed_filt = []
        for i in range(len(temp)):
            try:
                a = temp[i][0][2]
                cmed_filt.append(temp[i][0])
            except:
                pass

        a = 'DROP TABLE IF EXISTS cmed_FILTRADO CASCADE'
        cursor.execute(a)

        a = 'CREATE TABLE cmed_filtrado (id SERIAL PRIMARY KEY, substancia  VARCHAR(255),cnpj        VARCHAR(255),laboratorio VARCHAR(255),ggerm BIGINT,registro VARCHAR(255),produto VARCHAR(255),apresenta VARCHAR(255),quantidade INT,classe VARCHAR(255),tipo VARCHAR(255),pf  VARCHAR(255),pmc VARCHAR(255),tarja   VARCHAR(255) );'
        cursor.execute(a)

        a = 'INSERT INTO cmed_filtrado VALUES (DEFAULT, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);'
        for i in range(len(cmed_filt)):
            cursor.execute(a, (cmed_filt[i]))
        
        a = 'SELECT * FROM cmed_filtrado;'
        cursor. execute(a)
        resposta = cursor.fetchall()

        cmed_final = pd.DataFrame(resposta)        
        cmed_final.to_excel('cmed_final.xlsx')
        
        