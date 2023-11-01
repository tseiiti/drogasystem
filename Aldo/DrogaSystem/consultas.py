import psycopg2
from conexao import con


def consultaTotVendaTipo_infcompl(mês,tipo_medicamento):
    '''#Total de venda por medicamento de genérico do mês 8 
        #Pode ser alterado o mês e o tipo de medicamento
        
        mês(int) = nº do mês
        tipo_medicamento(str) = tipo do medicamento conforme o banco de dados
        '''
    with con:
        with con.cursor() as cursor:
            a = 'SELECT med.nome AS "Medicamento", SUM(v.total) AS "Total de vendas", '
            b = 'SUM(iv.desconto) AS "Total de descontos", SUM(iv.quantidade) AS "Unidade Vendidas" ,'
            c = 'ROUND(SUM(v.total)/SUM(iv.quantidade),2) AS "Preço médio", '
            d = 'ROUND(SUM(iv.desconto)/SUM(iv.quantidade),2) AS "Desconto médio", '
            e = 'ROUND(SUM(iv.desconto)/ SUM(v.total) *100, 2) AS "Perce desconto" '
            f = 'FROM venda v JOIN itens_venda iv '
            g = 'ON (v.id = iv.venda_id)JOIN medicamento med '
            h = 'ON (iv.medicamento_id = med.id)WHERE extract(MONTH FROM v.time_stamp) = %s AND '
            i = 'med.tipo = %s GROUP BY med.nome ;'
            j = a+b+c+d+e+f+g+h+i
            cursor.execute(j, (mês,tipo_medicamento))
            resposta = cursor.fetchall()
            print('Medicamento', ' '*18, '|','Tot vendas ', '|', 'Tot desc ',' ', '|','UV ',' '*3, '|','PM ',' '*5, '|','DM ',' '*3, '|','%D ')
            print("_"*98)
            for i in range(len(resposta)):
                print(f'{resposta[i][0]:29}  |   {resposta[i][1]:8}  |   {resposta[i][2]:8}  |   {resposta[i][3]:4}  |   {resposta[i][4]:6}  | {resposta[i][5]:6}  | {resposta[i][6]:1}')


def consultaTotVendaTipo(mês,tipo_medicamento):
    '''#Total de venda por medicamento de genérico do mês 8 
        #Pode ser alterado o mês e o tipo de medicamento
        
        mês(int) = nº do mês
        tipo_medicamento(str) = tipo do medicamento conforme o banco de dados
        '''
    with con:
        with con.cursor() as cursor:
            #Total de venda por medicamento de genérico do mês 8 
            #Pode ser alterado o mês e o tipo de medicamento
            a = 'SELECT med.nome, SUM(v.total) FROM venda v  JOIN itens_venda iv  ON (v.id = iv.venda_id) '
            b = 'JOIN medicamento med ON (iv.medicamento_id = med.id) '
            c = 'WHERE extract(MONTH FROM v.time_stamp) = %s AND med.tipo = %s GROUP BY med.nome ;'
            d = a+b+c
            print(d)
            cursor.execute(a+b+c, (mês,tipo_medicamento))
            resposta = cursor.fetchall()
            print('Medicamento', ' '*18, '|')
            print("_"*41)
            for i in range(len(resposta)):
                print(f'{resposta[i][0]:29}  |   {resposta[i][1]}')




