import PySimpleGUI as sg


def laboratorio():

    largura = 10
    altura = 3
    layout = [

                [[sg.Image("main_image.png",   expand_x=True, expand_y=True, key = 'image')],
                [sg.Button("Sair", size = (largura,altura), key = 'sair')]]
            ]

    # Crio a janela
    window = sg.Window("Laboratório", layout, size = (710,450))

    while True:
                # aqui eu leio os eventos que talvez estejam ocorrendo
        evento, valores = window.read()
        # se você apertar o botão OK o programa finaliza
        if evento == sg.WIN_CLOSED:
            break
        elif evento == "sair":
            break
    main()

    

def main():
    largura = 10
    altura = 3
    layout = [

                [[sg.Image("main_image.png",   expand_x=True, expand_y=True)],
                [sg.Button("Laboratório", size = (largura,altura)),sg.Button("Medicamento", size = (largura,altura)),
                sg.Button("Estoque", size = (largura,altura)),sg.Button("Cliente", size = (largura,altura)),
                sg.Button("Profissional", size = (largura,altura)),sg.Button("Venda", size = (largura,altura)),
                sg.Button("Sair", size = (largura,altura))]]
            ]

    # Crio a janela
    window = sg.Window("DrogaSystem", layout, size = (710,450))

    # Aqui a gente cuida dos eventos
    while True:
        # aqui eu leio os eventos que talvez estejam ocorrendo
        evento, valores = window.read()
        # se você apertar o botão OK o programa finaliza
        if evento == sg.WIN_CLOSED:
            break
        elif evento == "Laboratório":
            laboratorio()
            break

    #fecho a janela
    window.close()
    



main()






