import PySimpleGUI as sg
from laboratorio_tela import laboratorio_tela
from cliente_tela import cliente_tela
from medicamento_tela import medicamento_tela
from tela import tela

class main():
    def __init__(self) -> None:
        self.largura  = 10
        self.altura = 3
    
    def tela(self):
        
        layout = [

                    [[sg.Image("main_image.png",   expand_x=True, expand_y=True)],
                    [sg.Button("Laboratório", size = (self.largura ,self.altura), key = '-lab_main-'),sg.Button("Medicamento", size = (self.largura ,self.altura), key = '-medicamento-'),
                    sg.Button("Estoque", size = (self.largura ,self.altura)),sg.Button("Cliente", size = (self.largura ,self.altura), key = '-cliente-'),
                    sg.Button("Profissional", size = (self.largura ,self.altura)),sg.Button("Venda", size = (self.largura ,self.altura)),
                    sg.Button("Sair", size = (self.largura ,self.altura), key = '-sair_main-')]]
                ]

        # Crio a janela
        window = sg.Window("DrogaSystem", layout, size = (710,450))
        return window
    
    def eventos(self):
            flag = False
            while True:
                if flag == False: 
                    window_p = self.tela()
                    
                    flag = True
                # aqui eu leio os eventos que talvez estejam ocorrendo
                evento, valores = window_p.read()
                # se você apertar o botão OK o programa finaliza
                if evento == sg.WIN_CLOSED:
                    break
                elif evento == "-lab_main-":
                    window_p.hide()
                    lab = laboratorio_tela()
                    lab.evento()
                    window_p.un_hide()
                elif evento == '-cliente-':
                    window_p.hide()
                    cli = cliente_tela()
                    cli.evento()                    
                    window_p.un_hide()     
                elif evento == '-medicamento-':
                    window_p.hide()
                    med = medicamento_tela()
                    med.evento()
                    window_p.un_hide()                      
                elif evento == "-sair_main-":
                    window_p.close() #fecho a janela
                    break
                
        

    


