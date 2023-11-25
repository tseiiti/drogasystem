import pandas as pd
import psycopg2

con = psycopg2.connect(host = 'localhost', database = 'DrogaSystem', user = 'postgres', password = '827391')

with con:
    with con.cursor() as cursor:
        b = {'cliente','estoque','estoque_total','itens_venda','laboratorio',
              'medicamento','pessoa','profissional','venda'}
        for i in b:
            a = f'SELECT * FROM {i}'
            print(a)
            cursor.execute(a)
            resposta = cursor.fetchall()
            resposta = pd.DataFrame(resposta)

            a = f'SELECT column_name FROM information_schema.columns'
            c = f' WHERE table_name = \'{i}\''
            a = a+c
            cursor.execute(a)
            colunas = cursor.fetchall()
            a = []
            for j in colunas:
                a.append(j[0])
            resposta.columns = a
            resposta.to_excel(f'{i}.xlsx')

