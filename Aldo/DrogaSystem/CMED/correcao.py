import pandas as pd
import numpy as np
import psycopg2

con = psycopg2.connect(host = 'localhost', database = 'cmed', user = 'postgres', password = '827391')

correcao = pd.DataFrame(pd.read_excel('Busca para corrigir.xlsx'))

correcao_list = []
for i in range(len(correcao)):
    correcao_list.append(int(correcao.iloc[i,0]))

with con:
    with con.cursor() as cursor:
        resposta = []
        a = 'SELECT * FROM cmed_filtrado WHERE cmed_filtrado.ggerm = %s;'
        for i in range(len(correcao_list)):
            temp = []
            cursor. execute(a, (f'{correcao_list[i]}',))
            temp.append(cursor.fetchall())
            resposta.append(temp)
        
        #print(resposta)
        #print(len(resposta))
        #print(resposta[182])
        #print(resposta[179][0])
        #print(resposta[179][0][0])
        #print(len(resposta[0][0][0]))
        correcao = pd.DataFrame(np.zeros([len(resposta),14]))
        #print(len(correcao))

        vazio = []
        for i in range(len(resposta)):
            try:
                correcao.iloc[i,:] = resposta[i][0][0]
            except: 
                vazio.append(i)
        print(correcao)
        print(vazio)        

        correcao.to_excel('correcao.xlsx')

        print(correcao_list[178])
        print(correcao_list[179])
        print(correcao_list[180])
        print(correcao_list[503])
        print(correcao_list[504])
        print(correcao_list[505])

        


