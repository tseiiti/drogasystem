import PySimpleGUI as sg
from conexao  import con
from laboratorio import laboratorio

    
def cliente():
    largura = 10
    altura = 3
    layout = [
                #[sg.Table([['','',''],['','','']], ['Nome','CPF','Data de nascimento', 'Telefone'], num_rows=4, key = '-tab_cli-')],
                [[sg.Text('Busca por cliente: '), sg.Input(key = '-in_cli-')],
                [sg.Button("Pesquisar", size = (largura,altura), key = '-pesquisa_cli-'),
                sg.Button("Listar", size = (largura,altura), key = '-lista_cli-'),
                  sg.Button("Sair", size = (largura,altura), key = '-sair_cli-')]]
            ]
    window = sg.Window('Clientes', layout, size = (710, 450))

    while True:
        evento, valores = window.read()
        if evento == sg.WIN_CLOSED:
            break
        elif evento == "-sair_cli-":
            break
        
        elif evento == '-lista_cli-':
            with con:
                with con.cursor() as cursor:
                    a = "SELECT pessoa.nome, cliente.cpf, cliente.data_nasc, pessoa.telefone FROM "
                    b = ' pessoa INNER JOIN cliente ON pessoa.id = cliente.id'
                    cursor.execute(a + b)
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


                                [sg.Table(dado, ['Nome','CPF','Data de nascimento', 'Telefone'], num_rows=4, key = '-tab_cli-')],
                                [[sg.Text('Busca por cliente: '), sg.Input(key = '-in_cli-')],
                                [sg.Button("Pesquisar", size = (largura,altura), key = '-pesquisa_cli-'),
                                sg.Button("Listar", size = (largura,altura), key = '-lista_cli-'),
                                sg.Button("Sair", size = (largura,altura), key = '-sair_cli-')]]
                            ]
                    window = sg.Window("Clientes", layout, size = (710,450))


        elif evento == '-pesquisa_cli-':
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
                    window = sg.Window("Clientes", layout, size = (710,450))
    window.close()



def main():
    largura = 10
    altura = 3
    layout = [

                [[sg.Image("main_image.png",   expand_x=True, expand_y=True)],
                [sg.Button("Laboratório", size = (largura,altura), key = '-lab_main-'),sg.Button("Medicamento", size = (largura,altura)),
                sg.Button("Estoque", size = (largura,altura)),sg.Button("Cliente", size = (largura,altura), key = '-cliente-'),
                sg.Button("Profissional", size = (largura,altura)),sg.Button("Venda", size = (largura,altura)),
                sg.Button("Sair", size = (largura,altura), key = '-sair_main-')]]
            ]

    # Crio a janela
    window = sg.Window("DrogaSystem", layout, size = (710,450))
    return window

# Eventos

flag = False
    # Aqui a gente cuida dos eventos
while True:
    if flag == False: 
        window_p = main()
        flag = True
    # aqui eu leio os eventos que talvez estejam ocorrendo
    evento, valores = window_p.read()
    # se você apertar o botão OK o programa finaliza
    if evento == sg.WIN_CLOSED:
        break
    elif evento == "-lab_main-":
        window_p.hide()
        laboratorio()
        window_p.un_hide()
    elif evento == '-cliente-':
        window_p.hide()
        cliente()
        window_p.un_hide()
    elif evento == "-sair_main-":
        break
        

#fecho a janela
window_p.close()







