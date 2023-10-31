import pandas as pd
import psycopg2
import regex as re

con = psycopg2.connect(host = 'localhost', database = 'cmed', user = 'postgres', password = '827391')
cmed = pd.DataFrame(pd.read_excel('cmed.xlsx'))

cmed_list = []
colunas = [3,4,9,10]
for i in range(len(cmed)):
    temp = []
    for j in range(len(cmed.columns)):
        if j in colunas:
            temp.append(cmed.iloc[i,j].item())
        else: temp.append(cmed.iloc[i,j])
    cmed_list.append(temp)

with con:
    with con.cursor() as cursor:
        a = 'DROP TABLE IF EXISTS cmed CASCADE;'
        cursor.execute(a)

        a = 'CREATE TABLE cmed (id SERIAL PRIMARY KEY,substancia    VARCHAR(255),cnpj          VARCHAR(255),laboratorio   VARCHAR(255),ggerm         VARCHAR(255),registro      VARCHAR(255),produto       VARCHAR(255),apresenta     VARCHAR(255),classe        VARCHAR(255),tipo          VARCHAR(255),pf            VARCHAR(255),pmc           VARCHAR(255),comer_2022    VARCHAR(255),tarja         VARCHAR(255));'
        cursor.execute(a)

        a = 'INSERT INTO cmed VALUES (DEFAULT, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s);'
        for i in range(len(cmed_list)):
            cursor.execute(a, cmed_list[i])
        

        
        #a = 'SELECT REGEXP_SUBSTR(cmed.apresenta, \'[^X].\\d*\','
        #b =  '(SELECT REGEXP_INSTR(cmed.apresenta, '
        #c = ' \'X\', 1, (SELECT REGEXP_COUNT(cmed.apresenta,\'X\', 1, \'i\')) )))    FROM cmed;'
   
        cursor.execute('SELECT cmed.id, cmed.apresenta, REGEXP_SUBSTR(cmed.apresenta, \'\\d.*\', (SELECT char_length(cmed.apresenta))-9) FROM cmed;')
        resposta = cursor.fetchall()
        

        a = 'DROP TABLE IF EXISTS quant CASCADE;'
        cursor.execute(a)

        a = 'CREATE TABLE quant (id INT REFERENCES cmed ON DELETE CASCADE ON UPDATE CASCADE, apresenta VARCHAR(255), quant VARCHAR(255),  PRIMARY KEY (id));'
        cursor.execute(a)

        a = 'INSERT INTO quant VALUES (%s, %s, %s);'
        #for i in range(10):
        for i in range(len(cmed_list)):
            cursor.execute(a, resposta[i])


        cursor.execute('SELECT  cmed.id, cmed.ggerm, quant.quant, quant.apresenta FROM cmed INNER JOIN quant ON cmed.id = quant.id;')
        resposta = cursor.fetchall()

        filt_list_int = []
        for i in range(len(resposta)): 
            temp = []
            for j in range(len(resposta[0])):
                if j == 1: temp.append(int(resposta[i][j]))
                elif j == 2:
                    try:
                        temp.append(int(resposta[i][j]))
                    except:
                        if resposta[i][j] == 'None' or resposta[i][j] == None:
                            #print(resposta[i][j])
                            temp.append(0)
                        else:
                            teste_len = re.findall('\d+',resposta[i][j])
                            if len(teste_len) >1:
                                temp.append(int(teste_len[len(teste_len)-1]))
                            else:
                                temp.append(int(re.findall('\d+',resposta[i][j])[0]))
                        #temp.append(re.findall(r'\d*',resposta[i][j]))
                        #re.findall(r'\d*',resposta[i][j])
                        #531625403136416  
                        #print (temp[i][j])  
                elif j == 3: 
                    teste_len = re.findall('\d+',resposta[i][j])
                    flag = False
                    for l in teste_len:
                        if l in "ml" or l in "ML":
                            flag = True
                    if flag == True: temp.append(1)
                    else: temp.append(0)
                else: temp.append(resposta[i][j])
            #if isinstance(temp[2], str) == True : print (temp) # Valida se é não tem string
            if isinstance(temp[2], str) != True and isinstance(temp[2], int) != True : print (temp) # Valida se não é string ou int
            filt_list_int.append(temp)
        

        a = 'DROP TABLE IF EXISTS intQuantGGERM CASCADE;'
        cursor.execute(a)

        a = 'CREATE TABLE intQuantGGERM (id INT REFERENCES cmed ON DELETE CASCADE ON UPDATE CASCADE,ggerm BIGINT, quant INT, ml INT, PRIMARY KEY (id));'
        cursor.execute(a)

        a = 'INSERT INTO intQuantGGERM VALUES (%s, %s, %s,%s);'
        for i in range(len(filt_list_int)):
            cursor.execute(a, filt_list_int[i])

        a = 'SELECT * FROM intQuantGGERM'
        cursor.execute(a)
        resposta = cursor.fetchall()
        print(resposta)
        
        a = 'SELECT cmed.id, cmed.produto, intQuantGGERM.ggerm ,intQuantGGERM.quant, cmed.pf, cmed.apresenta, intQuantGGERM.ml '
        b = 'FROM cmed INNER JOIN intQuantGGERM ON cmed.id = intQuantGGERM.id WHERE intQuantGGERM.quant >65 AND intQuantGGERM.ml = 0;'
        cursor.execute(a+b)
        resposta = cursor.fetchall()

        resposta = pd.DataFrame(resposta)
        resposta.to_excel('quant_filt.xlsx')
        






