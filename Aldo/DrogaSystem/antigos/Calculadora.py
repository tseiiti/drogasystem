import PySimpleGUI as sg
def tela():
    layout = [
                [sg.Text("Substância:",size=8,), sg.InputText(key='-substancia-')],
                [sg.Text("Dosagem"), sg.InputText(key='-dosagem-')],
                [sg.Text("Apresentação"), sg.InputText(key='-apresentacao-')],
                [sg.Text("Quantidade"), sg.InputText(key='-altura-')],
                [sg.Button("Adicionar")],
                [sg.Button("Pesquisar")]            
            ]

    # Crio a janela
    window = sg.Window("Medicamento", layout)


    # Aqui a gente cuida dos eventos

    while True:
        # aqui eu leio os eventos que talvez estejam ocorrendo
        evento, valores = window.read()
        
        # se você apertar o botão OK o programa finaliza
        if evento == sg.WIN_CLOSED:
            break
        elif evento == "Adicionar":
            print(valores)
        elif evento == "Teste":
            print('teste')
            sg.popup("Olá")

    #fecho a janela
    window.close()

tela()
