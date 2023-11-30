import PySimpleGUI as sg
from conexao  import con


def laboratorio():

    largura = 10
    altura = 3
    layout = [
                [sg.Table([['','',''],['','','']], ['Nome','Razão Social','CNPJ'], num_rows=4, key = '-TabLab-')],
                [[sg.Text('Busca por laboratórios: '), sg.Input(key = '-in_lab-')],
                [sg.Button("Pesquisar", size = (largura,altura), key = '-pesquisa_lab-'),
                 sg.Button("Incluir", size = (largura,altura), key = '-inclui_lab-'),
                sg.Button("Listar", size = (largura,altura), key = '-lista_lab-'),
                  sg.Button("Sair", size = (largura,altura), key = '-sair_lab-')]]
            ]

    # Crio a janela
    window = sg.Window("Laboratório", layout, size = (710,450))

    while True:
                # aqui eu leio os eventos que talvez estejam ocorrendo
        evento, valores = window.read()
        # se você apertar o botão OK o programa finaliza
        if evento == sg.WIN_CLOSED:
            break
        elif evento == "-sair_lab-":
            break
        elif evento == '-inclui_lab-':
            window.close()
            largura = 30
            altura = 3
            layout = [
                [[sg.Text('Cadastro de laboratório')],
                 [sg.Text('Nome: '), sg.Input(key = '-nome_lab-')],
                 [sg.Text('Razão social: '), sg.Input(key = '-razao_lab-')],
                 [sg.Text('CNPJ: '), sg.Input(key = '-cnpj_lab-')],
                 [sg.Button('Cadastrar', key ='-cad_lab-') ,sg.Button('Cancelar', key = '-canc_inc_lab-'),
                  sg.Button('Sair', key = '-sair_inc_lab-')]]
            ]
            window = sg.Window('Laboratório', layout, size = (710,450))

            while True:
                evento, valores = window.read()

                if evento == '-sair_inc_lab-':
                    break
                elif evento == sg.WIN_CLOSED:
                    break
                elif evento == '-cad_lab-':
                    with con:
                        with con.cursor() as cursor:
                            #cursor.execute("INSERT INTO laboratorio VALUES (default,%s, %s, %s)",
                            #       (valores['-nome_lab-'],valores['-razao_lab-'],valores['-cnpj_lab-'],))
                            cursor.execute("SELECT nome, razao, cnpj FROM laboratorio WHERE nome = %s, razao=%s, cnpj =%s;",
                                   (valores['-nome_lab-'],valores['-razao_lab-'],valores['-cnpj_lab-'],))
                            resposta = cursor.fetchall()
                            print(resposta) 


            
        elif evento == '-lista_lab-':
            with con:
                with con.cursor() as cursor:
                    cursor.execute("SELECT nome, razao, cnpj FROM laboratorio")
                    resposta = cursor.fetchall()
                    dado =[]
                    dado_linha = []
                    for linha in range(len(resposta)):                 
                        for col in range(len(resposta[0])):
                            dado_linha.append(resposta[linha][col])
                        dado.append(dado_linha)
                        dado_linha = []


                    print(dado)
                    window.close()
                    largura = 10
                    altura = 3
                    layout = [

                                [[sg.Table(dado, ['Nome','Razão Social','CNPJ'], num_rows=4, key = '-TabLab-')],
                                [sg.Text('Busca por laboratórios: '), sg.Input(key = '-in_lab-')],
                                [sg.Button("Pesquisar", size = (largura,altura), key = '-pesquisa_lab-'),
                                sg.Button("Listar", size = (largura,altura), key = '-lista_lab-'),
                                sg.Button("Sair", size = (largura,altura), key = '-sair_lab-')]]
                            ]
                    window = sg.Window("Laboratório", layout, size = (710,450))


        elif evento == '-pesquisa_lab-':
            with con:
                with con.cursor() as cursor:
                    cursor.execute("SELECT nome, razao, cnpj FROM laboratorio WHERE razao LIKE %s ;",
                        ('%' +valores['-in_lab-'] + '%',))
                    resposta = cursor.fetchall()
                    dado = []
                    dado_linha = []
                    for linha in range(len(resposta)):                 
                        for col in range(len(resposta[0])):
                            dado_linha.append(resposta[linha][col])
                        dado.append(dado_linha)
                        dado_linha = []
                    window.close()

                    largura = 10
                    altura = 3
                    layout = [
                                [[sg.Table(dado, ['Nome','Razão Social','CNPJ'], num_rows=4, key = '-TabLab-')],
                                [sg.Text('Busca por laboratórios: '), sg.Input(key = '-in_lab-')],
                                [sg.Button("Pesquisar", size = (largura,altura), key = '-pesquisa_lab-'),
                                sg.Button("Listar", size = (largura,altura), key = '-lista_lab-'),
                                sg.Button("Sair", size = (largura,altura), key = '-sair_lab-')]]
                            ]
                    window = sg.Window("Laboratório", layout, size = (710,450))
    window.close()