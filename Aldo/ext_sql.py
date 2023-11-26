import pandas as pd
import psycopg2

con = psycopg2.connect(host = 'localhost', database = 'DrogaSystem', user = 'postgres', password = '827391')

cursor = con.cursor()

cabecalho = {'cliente','estoque','estoque_total','itens_venda','laboratorio',
        'medicamento','pessoa','profissional','venda'}
for i in cabecalho:
    query = f'SELECT * FROM {i}'
    cursor.execute(query)
    resposta = cursor.fetchall()
    
    resposta = pd.DataFrame(resposta)
    if i == 'medicamento':
        print(f'Os cabeçalhos da tabela {i} são: {colunas}')
    print(resposta)
    
    subquery1 = f'SELECT column_name FROM information_schema.columns'
    subquery2 = f' WHERE table_name = \'{i}\''
    query = subquery1+subquery2
    cursor.execute(query)
    colunas = cursor.fetchall()
    if i == 'medicamento':
        print(f'Os cabeçalhos da tabela {i} são: {colunas}')
    resposta = cursor.fetchall()
    
    # a = []
    # for j in colunas:
    #     a.append(j[0])
    # resposta.columns = a
    # resposta.to_excel(f'{i}.xlsx')

